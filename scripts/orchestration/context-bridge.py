#!/usr/bin/env python3
"""
Context Bridge - Agent间上下文传递桥接器
实现跨agent的状态管理和信息共享

Author: Agent Orchestration System
Version: 1.0.0
"""

import json
import hashlib
from pathlib import Path
from typing import Dict, Any, Optional, List
from datetime import datetime
from dataclasses import dataclass, field, asdict
import logging

logger = logging.getLogger(__name__)


@dataclass
class ContextEntry:
    """上下文条目"""
    key: str
    value: Any
    source_agent: str
    timestamp: str
    ttl: Optional[int] = None  # Time to live in seconds
    metadata: Dict[str, Any] = field(default_factory=dict)
    version: int = 1


@dataclass
class CollaborationEvent:
    """协作事件记录"""
    event_id: str
    timestamp: str
    agent_id: str
    event_type: str  # context_update, agent_output, error, etc.
    data: Dict[str, Any]
    metadata: Dict[str, Any] = field(default_factory=dict)


class ContextBridge:
    """管理agent间的上下文传递"""

    def __init__(self, state_dir: Path):
        """
        初始化Context Bridge

        Args:
            state_dir: 状态存储目录
        """
        self.state_dir = Path(state_dir)
        self.context_file = self.state_dir / "context-cache" / "shared-context.json"
        self.log_file = self.state_dir / "collaboration-logs" / "collaboration-log.jsonl"

        # 确保目录存在
        self.context_file.parent.mkdir(parents=True, exist_ok=True)
        self.log_file.parent.mkdir(parents=True, exist_ok=True)

        # 加载现有上下文
        self.context = self._load_context()

        logger.info("Context Bridge初始化完成")

    def _load_context(self) -> Dict[str, Any]:
        """从持久化存储加载上下文"""
        if self.context_file.exists():
            try:
                content = self.context_file.read_text(encoding='utf-8')
                return json.loads(content)
            except Exception as e:
                logger.error(f"加载上下文失败: {e}")
                return self._create_empty_context()
        return self._create_empty_context()

    def _create_empty_context(self) -> Dict[str, Any]:
        """创建空的上下文结构"""
        return {
            "version": "1.0",
            "created_at": datetime.now().isoformat(),
            "last_updated": datetime.now().isoformat(),
            "shared_state": {},
            "agent_outputs": {},
            "collaboration_history": [],
            "context_entries": {}
        }

    def _save_context(self):
        """持久化上下文到文件"""
        self.context["last_updated"] = datetime.now().isoformat()
        self.context_file.write_text(
            json.dumps(self.context, indent=2, ensure_ascii=False),
            encoding='utf-8'
        )

    def _generate_event_id(self) -> str:
        """生成唯一事件ID"""
        return hashlib.md5(
            f"{datetime.now().isoformat()}".encode()
        ).hexdigest()[:12]

    def get_shared_state(self, key: Optional[str] = None) -> Any:
        """
        获取共享状态

        Args:
            key: 状态键，None表示获取全部

        Returns:
            状态值
        """
        if key:
            return self.context["shared_state"].get(key)
        return self.context["shared_state"]

    def update_shared_state(self, key: str, value: Any, source_agent: str = "system"):
        """
        更新共享状态

        Args:
            key: 状态键
            value: 状态值
            source_agent: 更新的agent
        """
        self.context["shared_state"][key] = {
            "value": value,
            "updated_by": source_agent,
            "updated_at": datetime.now().isoformat()
        }

        # 记录事件
        self._log_event(
            agent_id=source_agent,
            event_type="state_update",
            data={"key": key, "value": value}
        )

        self._save_context()
        logger.debug(f"共享状态更新: {key} = {value} (by {source_agent})")

    def prepare_context_for_agent(
        self,
        agent_id: str,
        task_description: str,
        include_history: bool = True,
        include_shared_state: bool = True,
        max_history_entries: int = 10
    ) -> Dict[str, Any]:
        """
        为特定agent准备执行上下文

        Args:
            agent_id: 目标agent ID
            task_description: 任务描述
            include_history: 是否包含历史记录
            include_shared_state: 是否包含共享状态
            max_history_entries: 最大历史条目数

        Returns:
            准备好的上下文字典
        """
        context = {
            "agent_id": agent_id,
            "task": task_description,
            "timestamp": datetime.now().isoformat(),
            "context_version": self.context["version"]
        }

        if include_shared_state:
            context["shared_state"] = self.context["shared_state"]

        if include_history:
            context["collaboration_history"] = self._get_relevant_history(
                agent_id,
                max_entries=max_history_entries
            )

        # 添加其他agents的输出（如果存在）
        if self.context["agent_outputs"]:
            context["previous_outputs"] = {
                aid: output
                for aid, output in self.context["agent_outputs"].items()
                if aid != agent_id  # 不包含自己的输出
            }

        # 记录上下文准备事件
        self._log_event(
            agent_id=agent_id,
            event_type="context_prepared",
            data={"task": task_description}
        )

        return context

    def update_agent_output(
        self,
        agent_id: str,
        output: Dict[str, Any],
        metadata: Optional[Dict] = None,
        extract_to_shared: Optional[List[str]] = None
    ):
        """
        更新agent输出到共享上下文

        Args:
            agent_id: Agent ID
            output: 输出数据
            metadata: 元数据
            extract_to_shared: 需要提取到共享状态的键列表
        """
        self.context["agent_outputs"][agent_id] = {
            "timestamp": datetime.now().isoformat(),
            "output": output,
            "metadata": metadata or {}
        }

        # 提取指定的键到共享状态
        if extract_to_shared:
            for key in extract_to_shared:
                if key in output:
                    self.update_shared_state(key, output[key], agent_id)

        # 记录到协作日志
        self._log_event(
            agent_id=agent_id,
            event_type="agent_output",
            data=output,
            metadata=metadata
        )

        self._save_context()
        logger.info(f"Agent输出已更新: {agent_id}")

    def get_agent_outputs(
        self,
        agent_ids: Optional[List[str]] = None
    ) -> Dict[str, Any]:
        """
        获取agent的输出结果

        Args:
            agent_ids: Agent ID列表，None表示获取全部

        Returns:
            Agent输出字典
        """
        if agent_ids:
            return {
                aid: self.context["agent_outputs"].get(aid)
                for aid in agent_ids
                if aid in self.context["agent_outputs"]
            }
        return self.context["agent_outputs"]

    def add_context_entry(
        self,
        key: str,
        value: Any,
        source_agent: str,
        ttl: Optional[int] = None,
        metadata: Optional[Dict] = None
    ):
        """
        添加上下文条目

        Args:
            key: 键
            value: 值
            source_agent: 来源agent
            ttl: 生存时间（秒）
            metadata: 元数据
        """
        entry = ContextEntry(
            key=key,
            value=value,
            source_agent=source_agent,
            timestamp=datetime.now().isoformat(),
            ttl=ttl,
            metadata=metadata or {}
        )

        self.context["context_entries"][key] = asdict(entry)

        # 记录事件
        self._log_event(
            agent_id=source_agent,
            event_type="context_entry_added",
            data={"key": key, "value": value}
        )

        self._save_context()
        logger.debug(f"上下文条目已添加: {key}")

    def get_context_entry(self, key: str) -> Optional[ContextEntry]:
        """
        获取上下文条目

        Args:
            key: 键

        Returns:
            ContextEntry或None
        """
        entry_data = self.context["context_entries"].get(key)
        if not entry_data:
            return None

        # 检查TTL
        if entry_data.get("ttl"):
            entry_time = datetime.fromisoformat(entry_data["timestamp"])
            if (datetime.now() - entry_time).total_seconds() > entry_data["ttl"]:
                # 过期，删除并返回None
                del self.context["context_entries"][key]
                self._save_context()
                return None

        return ContextEntry(**entry_data)

    def _get_relevant_history(
        self,
        agent_id: str,
        max_entries: int = 10
    ) -> List[Dict[str, Any]]:
        """
        获取相关的协作历史

        Args:
            agent_id: Agent ID
            max_entries: 最大条目数

        Returns:
            历史事件列表
        """
        history = self.context.get("collaboration_history", [])

        # 获取最近的历史记录
        recent_history = history[-max_entries:] if len(history) > max_entries else history

        # 过滤出与当前agent相关的事件
        relevant = [
            event for event in recent_history
            if event.get("agent_id") == agent_id or
               event.get("event_type") in ["agent_output", "state_update"]
        ]

        return relevant

    def _log_event(
        self,
        agent_id: str,
        event_type: str,
        data: Dict[str, Any],
        metadata: Optional[Dict] = None
    ):
        """
        记录协作事件到内存和文件

        Args:
            agent_id: Agent ID
            event_type: 事件类型
            data: 事件数据
            metadata: 元数据
        """
        event = CollaborationEvent(
            event_id=self._generate_event_id(),
            timestamp=datetime.now().isoformat(),
            agent_id=agent_id,
            event_type=event_type,
            data=data,
            metadata=metadata or {}
        )

        # 添加到内存历史
        self.context["collaboration_history"].append(asdict(event))

        # 限制内存历史大小
        if len(self.context["collaboration_history"]) > 100:
            self.context["collaboration_history"] = \
                self.context["collaboration_history"][-50:]

        # 写入文件
        with open(self.log_file, 'a') as f:
            f.write(json.dumps(asdict(event), ensure_ascii=False) + "\n")

    def get_collaboration_log(
        self,
        agent_id: Optional[str] = None,
        event_type: Optional[str] = None,
        limit: int = 50
    ) -> List[CollaborationEvent]:
        """
        获取协作日志

        Args:
            agent_id: 过滤agent ID
            event_type: 过滤事件类型
            limit: 最大返回条数

        Returns:
            事件列表
        """
        events = []

        try:
            with open(self.log_file, 'r') as f:
                for line in f:
                    if not line.strip():
                        continue

                    event_data = json.loads(line)
                    event = CollaborationEvent(**event_data)

                    # 应用过滤器
                    if agent_id and event.agent_id != agent_id:
                        continue
                    if event_type and event.event_type != event_type:
                        continue

                    events.append(event)

                    if len(events) >= limit:
                        break

        except FileNotFoundError:
            logger.warning("协作日志文件不存在")
            return []

        return events

    def clear_agent_outputs(self, agent_id: Optional[str] = None):
        """
        清除agent输出

        Args:
            agent_id: Agent ID，None表示清除所有
        """
        if agent_id:
            if agent_id in self.context["agent_outputs"]:
                del self.context["agent_outputs"][agent_id]
                logger.info(f"已清除agent输出: {agent_id}")
        else:
            self.context["agent_outputs"] = {}
            logger.info("已清除所有agent输出")

        self._save_context()

    def export_context(self, output_path: Optional[Path] = None) -> Path:
        """
        导出上下文到文件

        Args:
            output_path: 输出路径，None表示使用默认路径

        Returns:
            导出文件路径
        """
        if output_path is None:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            output_path = self.state_dir / "context-cache" / f"context_export_{timestamp}.json"

        output_path.parent.mkdir(parents=True, exist_ok=True)

        with open(output_path, 'w') as f:
            json.dump(self.context, f, indent=2, ensure_ascii=False)

        logger.info(f"上下文已导出: {output_path}")
        return output_path

    def import_context(self, input_path: Path, merge: bool = True):
        """
        从文件导入上下文

        Args:
            input_path: 输入文件路径
            merge: 是否合并（True）还是替换（False）
        """
        if not input_path.exists():
            raise FileNotFoundError(f"文件不存在: {input_path}")

        with open(input_path, 'r') as f:
            imported_context = json.load(f)

        if merge:
            # 合并策略：保留现有，添加新的
            for key in ["shared_state", "agent_outputs", "context_entries"]:
                if key in imported_context:
                    self.context[key].update(imported_context[key])
            # 历史记录追加
            if "collaboration_history" in imported_context:
                self.context["collaboration_history"].extend(
                    imported_context["collaboration_history"]
                )
        else:
            # 替换策略
            self.context = imported_context

        self._save_context()
        logger.info(f"上下文已导入: {input_path} (merge={merge})")

    def get_statistics(self) -> Dict[str, Any]:
        """
        获取上下文统计信息

        Returns:
            统计信息字典
        """
        stats = {
            "version": self.context["version"],
            "created_at": self.context["created_at"],
            "last_updated": self.context["last_updated"],
            "shared_state_keys": len(self.context["shared_state"]),
            "agent_outputs_count": len(self.context["agent_outputs"]),
            "context_entries_count": len(self.context["context_entries"]),
            "collaboration_history_size": len(self.context["collaboration_history"])
        }

        # 统计事件类型
        event_types = {}
        for event in self.context["collaboration_history"][-100:]:  # 最近100个
            et = event.get("event_type", "unknown")
            event_types[et] = event_types.get(et, 0) + 1

        stats["recent_event_types"] = event_types

        return stats

    def cleanup_expired_entries(self):
        """清理过期的上下文条目"""
        expired_keys = []

        for key, entry_data in self.context["context_entries"].items():
            if entry_data.get("ttl"):
                entry_time = datetime.fromisoformat(entry_data["timestamp"])
                if (datetime.now() - entry_time).total_seconds() > entry_data["ttl"]:
                    expired_keys.append(key)

        for key in expired_keys:
            del self.context["context_entries"][key]
            logger.debug(f"已过期条目: {key}")

        if expired_keys:
            self._save_context()
            logger.info(f"清理了 {len(expired_keys)} 个过期条目")


def main():
    """测试Context Bridge"""
    import tempfile

    with tempfile.TemporaryDirectory() as tmpdir:
        state_dir = Path(tmpdir)
        bridge = ContextBridge(state_dir)

        # 测试共享状态
        bridge.update_shared_state("test_key", "test_value", "agent_001")
        print(f"共享状态: {bridge.get_shared_state('test_key')}")

        # 测试agent输出
        bridge.update_agent_output(
            "agent_001",
            {"result": "success", "data": [1, 2, 3]},
            metadata={"execution_time": 1.23}
        )

        # 准备上下文
        context = bridge.prepare_context_for_agent(
            "agent_002",
            "处理数据",
            include_history=True
        )
        print(f"准备好的上下文: {context}")

        # 获取统计
        stats = bridge.get_statistics()
        print(f"统计信息: {stats}")


if __name__ == "__main__":
    main()
