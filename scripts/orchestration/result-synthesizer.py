#!/usr/bin/env python3
"""
Result Synthesizer - 多源结果综合器
整合来自不同agents的研究结果，应用加权策略和冲突解决

Author: Agent Orchestration System
Version: 1.0.0
"""

import json
from pathlib import Path
from typing import Dict, Any, List, Optional
from datetime import datetime
from dataclasses import dataclass
import logging

logger = logging.getLogger(__name__)


@dataclass
class SourceResult:
    """单个源的结果"""
    source_id: str
    source_type: str  # web-research, academic, codebase, etc.
    content: Dict[str, Any]
    confidence: float
    timestamp: str
    metadata: Dict[str, Any]


class ResultSynthesizer:
    """结果综合器"""

    def __init__(self, context_bridge):
        """
        初始化结果综合器

        Args:
            context_bridge: ContextBridge实例
        """
        self.context_bridge = context_bridge

        # 定义源类型的可信度权重
        self.source_weights = {
            "peer_reviewed_paper": 1.0,
            "official_documentation": 0.95,
            "academic_searcher": 0.9,
            "codebase_analyzer": 0.85,
            "web_researcher": 0.75,
            "community_post": 0.6,
            "unverified": 0.3
        }

    def synthesize(
        self,
        results: List[SourceResult],
        strategy: str = "weighted_confidence"
    ) -> Dict[str, Any]:
        """
        综合多个源的结果

        Args:
            results: 源结果列表
            strategy: 综合策略 (weighted_confidence, majority_vote, source_priority)

        Returns:
            综合后的结果
        """
        if strategy == "weighted_confidence":
            return self._weighted_confidence_synthesis(results)
        elif strategy == "majority_vote":
            return self._majority_vote_synthesis(results)
        elif strategy == "source_priority":
            return self._source_priority_synthesis(results)
        else:
            logger.warning(f"未知策略: {strategy}, 使用默认策略")
            return self._weighted_confidence_synthesis(results)

    def _weighted_confidence_synthesis(
        self,
        results: List[SourceResult]
    ) -> Dict[str, Any]:
        """加权置信度综合"""

        synthesis = {
            "strategy": "weighted_confidence",
            "synthesis_time": datetime.now().isoformat(),
            "source_count": len(results),
            "themes": {},
            "conflicts": [],
            "findings": []
        }

        # 按主题分组
        themes = self._group_by_themes(results)

        # 对每个主题进行加权综合
        for theme, theme_results in themes.items():
            theme_synthesis = self._synthesize_theme(theme_results)
            synthesis["themes"][theme] = theme_synthesis

        # 检测冲突
        synthesis["conflicts"] = self._detect_conflicts(results)

        return synthesis

    def _group_by_themes(
        self,
        results: List[SourceResult]
    ) -> Dict[str, List[SourceResult]]:
        """按主题分组结果"""
        themes = {}

        for result in results:
            # 从结果中提取主题（简化处理）
            # 实际应该使用NLP或更复杂的主题提取
            if "themes" in result.content:
                for theme in result.content["themes"]:
                    if theme not in themes:
                        themes[theme] = []
                    themes[theme].append(result)

        # 如果没有明确主题，按source_type分组
        if not themes:
            for result in results:
                theme = result.source_type
                if theme not in themes:
                    themes[theme] = []
                themes[theme].append(result)

        return themes

    def _synthesize_theme(
        self,
        theme_results: List[SourceResult]
    ) -> Dict[str, Any]:
        """综合单个主题"""

        # 计算加权平均置信度
        total_weight = 0
        weighted_confidence = 0

        for result in theme_results:
            source_weight = self.source_weights.get(
                result.source_type,
                0.5
            )
            total_weight += source_weight
            weighted_confidence += source_weight * result.confidence

        if total_weight > 0:
            avg_confidence = weighted_confidence / total_weight
        else:
            avg_confidence = 0

        return {
            "result_count": len(theme_results),
            "confidence": avg_confidence,
            "sources": [r.source_id for r in theme_results],
            "synthesis": self._merge_content(theme_results)
        }

    def _merge_content(
        self,
        results: List[SourceResult]
    ) -> Dict[str, Any]:
        """合并内容"""
        merged = {
            "key_points": [],
            "supporting_evidence": [],
            "metadata": {}
        }

        for result in results:
            if "key_points" in result.content:
                for point in result.content["key_points"]:
                    # 去重
                    if point not in merged["key_points"]:
                        merged["key_points"].append(point)

            if "supporting_evidence" in result.content:
                merged["supporting_evidence"].extend(
                    result.content["supporting_evidence"]
                )

        return merged

    def _detect_conflicts(
        self,
        results: List[SourceResult]
    ) -> List[Dict[str, Any]]:
        """检测信息冲突"""
        conflicts = []

        # 简化的冲突检测：检查相同主题的矛盾结论
        # 实际应该使用更复杂的语义分析
        for i, result1 in enumerate(results):
            for result2 in results[i+1:]:
                if self._has_conflict(result1, result2):
                    conflicts.append({
                        "source_a": result1.source_id,
                        "source_b": result2.source_id,
                        "conflict_type": "contradictory_conclusion",
                        "description": "两个源得出相反的结论"
                    })

        return conflicts

    def _has_conflict(
        self,
        result1: SourceResult,
        result2: SourceResult
    ) -> bool:
        """检查两个结果是否冲突"""
        # 简化实现
        # 实际应该检查具体的内容字段
        return False

    def _majority_vote_synthesis(
        self,
        results: List[SourceResult]
    ) -> Dict[str, Any]:
        """多数投票综合"""
        # 统计最常见的结论
        conclusions = {}
        for result in results:
            conclusion = result.content.get("conclusion", "")
            if conclusion not in conclusions:
                conclusions[conclusion] = []
            conclusions[conclusion].append(result.source_id)

        # 找到多数结论
        majority_conclusion = max(
            conclusions.keys(),
            key=lambda k: len(conclusions[k])
        )

        return {
            "strategy": "majority_vote",
            "majority_conclusion": majority_conclusion,
            "supporting_sources": conclusions[majority_conclusion],
            "support_count": len(conclusions[majority_conclusion]),
            "total_count": len(results)
        }

    def _source_priority_synthesis(
        self,
        results: List[SourceResult]
    ) -> Dict[str, Any]:
        """源优先级综合"""
        # 按源类型权重排序
        sorted_results = sorted(
            results,
            key=lambda r: self.source_weights.get(r.source_type, 0),
            reverse=True
        )

        # 选择最高优先级源的结果
        primary_result = sorted_results[0]

        return {
            "strategy": "source_priority",
            "primary_source": primary_result.source_id,
            "primary_source_type": primary_result.source_type,
            "content": primary_result.content,
            "confidence": primary_result.confidence,
            "supporting_sources": [r.source_id for r in sorted_results[1:]]
        }


def main():
    """测试结果综合器"""
    from context_bridge import ContextBridge
    import tempfile

    with tempfile.TemporaryDirectory() as tmpdir:
        state_dir = Path(tmpdir)
        context_bridge = ContextBridge(state_dir)
        synthesizer = ResultSynthesizer(context_bridge)

        # 创建测试结果
        results = [
            SourceResult(
                source_id="web-001",
                source_type="web_researcher",
                content={"conclusion": "Option A is best"},
                confidence=0.7,
                timestamp=datetime.now().isoformat(),
                metadata={}
            ),
            SourceResult(
                source_id="academic-001",
                source_type="academic_searcher",
                content={"conclusion": "Option B is best"},
                confidence=0.9,
                timestamp=datetime.now().isoformat(),
                metadata={}
            )
        ]

        # 综合结果
        synthesis = synthesizer.synthesize(results)
        print(json.dumps(synthesis, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
