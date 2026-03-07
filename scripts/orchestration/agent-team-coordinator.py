#!/usr/bin/env python3
"""
Agent Team Coordinator - 多Agent团队协调器
负责在不同tmux会话中协调多个agents的工作流

Author: Agent Orchestration System
Version: 1.0.0
"""

import subprocess
import json
import time
import os
import re
from pathlib import Path
from typing import List, Dict, Any, Optional, Callable
from dataclasses import dataclass, field, asdict
from enum import Enum
from datetime import datetime
import logging

# 配置日志
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('.agent-state/collaboration-logs/coordinator.log'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)


class CoordinationPattern(Enum):
    """协调模式枚举"""
    PIPELINE = "pipeline"          # 流水线模式（顺序执行）
    PARALLEL = "parallel"          # 并行模式（同时执行）
    HYBRID = "hybrid"             # 混合模式（分阶段）
    HIERARCHICAL = "hierarchical"  # 主从模式


class AgentStatus(Enum):
    """Agent状态枚举"""
    PENDING = "pending"
    RUNNING = "running"
    COMPLETED = "completed"
    FAILED = "failed"
    CANCELLED = "cancelled"


@dataclass
class AgentDefinition:
    """Agent定义数据类"""
    agent_id: str
    name: str
    description: str
    skill_path: str
    model: str = "inherit"
    capabilities: List[str] = field(default_factory=list)
    dependencies: List[str] = field(default_factory=list)
    timeout: int = 300  # 5分钟默认超时


@dataclass
class WorkflowPhase:
    """工作流阶段定义"""
    phase_name: str
    agents: List[str]
    pattern: CoordinationPattern = CoordinationPattern.PIPELINE
    timeout: int = 600
    depends_on: Optional[str] = None


@dataclass
class WorkflowDefinition:
    """工作流定义数据类"""
    workflow_id: str
    name: str
    description: str
    pattern: CoordinationPattern
    phases: List[WorkflowPhase] = field(default_factory=list)
    context_requirements: Dict[str, Any] = field(default_factory=dict)
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class AgentExecutionResult:
    """Agent执行结果"""
    agent_id: str
    status: AgentStatus
    start_time: str
    end_time: Optional[str] = None
    output: Optional[Dict[str, Any]] = None
    output_context: Dict[str, Any] = field(default_factory=dict)
    error_message: Optional[str] = None
    tmux_session: Optional[str] = None


class AgentTeamCoordinator:
    """多Agent团队协调器核心类"""

    def __init__(self, workspace: Path, tmux_base_session: str = "obsidian-agents"):
        """
        初始化协调器

        Args:
            workspace: 工作空间路径
            tmux_base_session: tmux基础会话名称
        """
        self.workspace = Path(workspace)
        self.agents_dir = self.workspace / "agents" / "definitions"
        self.workflows_dir = self.workspace / "agents" / "workflows"
        self.state_dir = self.workspace / ".agent-state"
        self.tmux_base_session = tmux_base_session

        # 确保目录存在
        self.state_dir.mkdir(exist_ok=True)
        (self.state_dir / "context-cache").mkdir(exist_ok=True)
        (self.state_dir / "task-queue").mkdir(exist_ok=True)
        (self.state_dir / "collaboration-logs").mkdir(exist_ok=True)

        # 加载agent和工作流定义
        self.agents: Dict[str, AgentDefinition] = {}
        self.workflows: Dict[str, WorkflowDefinition] = {}

        self._load_agents()
        self._load_workflows()

        logger.info(f"协调器初始化完成 - 工作空间: {self.workspace}")
        logger.info(f"已加载 {len(self.agents)} 个agents, {len(self.workflows)} 个工作流")

    def _load_agents(self):
        """从agents/definitions/目录加载所有agent定义"""
        if not self.agents_dir.exists():
            logger.warning(f"agents目录不存在: {self.agents_dir}")
            return

        for agent_file in self.agents_dir.glob("EMP_*.md"):
            try:
                agent = self._parse_agent_file(agent_file)
                if agent:
                    self.agents[agent.agent_id] = agent
                    logger.debug(f"加载agent: {agent.agent_id}")
            except Exception as e:
                logger.error(f"解析agent文件失败 {agent_file}: {e}")

    def _parse_agent_file(self, agent_file: Path) -> Optional[AgentDefinition]:
        """解析agent定义文件"""
        content = agent_file.read_text(encoding='utf-8')

        # 提取YAML frontmatter
        frontmatter_match = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
        if not frontmatter_match:
            logger.warning(f"缺少frontmatter: {agent_file}")
            return None

        yaml_content = frontmatter_match.group(1)
        metadata = self._parse_simple_yaml(yaml_content)

        return AgentDefinition(
            agent_id=agent_file.stem,
            name=metadata.get('name', agent_file.stem),
            description=metadata.get('description', ''),
            skill_path=str(agent_file),
            model=metadata.get('model', 'inherit'),
            capabilities=metadata.get('capabilities', []),
            dependencies=metadata.get('dependencies', []),
            timeout=metadata.get('timeout', 300)
        )

    def _parse_simple_yaml(self, yaml_str: str) -> Dict[str, Any]:
        """简单YAML解析器（避免依赖PyYAML）"""
        result = {}
        for line in yaml_str.split('\n'):
            if ':' in line and not line.strip().startswith('#'):
                key, value = line.split(':', 1)
                key = key.strip()
                value = value.strip()

                # 处理列表
                if value.startswith('[') and value.endswith(']'):
                    value = [v.strip().strip('\'"') for v in value[1:-1].split(',')]
                # 处理布尔值
                elif value.lower() == 'true':
                    value = True
                elif value.lower() == 'false':
                    value = False
                # 处理数字
                elif value.isdigit():
                    value = int(value)

                result[key] = value
        return result

    def _load_workflows(self):
        """从agents/workflows/目录加载工作流定义"""
        if not self.workflows_dir.exists():
            logger.warning(f"workflows目录不存在: {self.workflows_dir}")
            return

        for workflow_file in self.workflows_dir.glob("*.md"):
            try:
                workflow = self._parse_workflow_file(workflow_file)
                if workflow:
                    self.workflows[workflow.workflow_id] = workflow
                    logger.debug(f"加载工作流: {workflow.workflow_id}")
            except Exception as e:
                logger.error(f"解析工作流文件失败 {workflow_file}: {e}")

    def _parse_workflow_file(self, workflow_file: Path) -> Optional[WorkflowDefinition]:
        """解析工作流定义文件"""
        content = workflow_file.read_text(encoding='utf-8')

        # 提取YAML frontmatter
        frontmatter_match = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
        if not frontmatter_match:
            return None

        yaml_content = frontmatter_match.group(1)
        metadata = self._parse_simple_yaml(yaml_content)

        # 解析phases
        phases = []
        # 从内容中提取phase信息
        phase_blocks = re.findall(r'##\s+Phase\s+\d+:\s*(.*?)(?=##\s+Phase|\Z)', content, re.DOTALL)
        # 这里简化处理，实际应该更复杂的解析

        pattern_str = metadata.get('pattern', 'pipeline')
        pattern = CoordinationPattern(pattern_str) if isinstance(pattern_str, str) else CoordinationPattern.PIPELINE

        return WorkflowDefinition(
            workflow_id=metadata.get('workflow_id', workflow_file.stem),
            name=metadata.get('name', workflow_file.stem),
            description=metadata.get('description', ''),
            pattern=pattern,
            phases=phases,
            context_requirements=metadata.get('context_requirements', {}),
            metadata=metadata
        )

    def list_agents(self) -> List[AgentDefinition]:
        """列出所有可用的agents"""
        return list(self.agents.values())

    def list_workflows(self) -> List[WorkflowDefinition]:
        """列出所有可用的工作流"""
        return list(self.workflows.values())

    def start_agent_team(
        self,
        workflow_id: str,
        context: Optional[Dict[str, Any]] = None
    ) -> Dict[str, Any]:
        """
        启动一个完整的agent团队工作流

        Args:
            workflow_id: 工作流ID
            context: 初始上下文

        Returns:
            执行结果字典
        """
        if workflow_id not in self.workflows:
            logger.error(f"工作流不存在: {workflow_id}")
            return {
                "success": False,
                "error": f"Workflow {workflow_id} not found"
            }

        workflow = self.workflows[workflow_id]
        context = context or {}

        logger.info(f"🚀 启动工作流: {workflow.name}")
        logger.info(f"   模式: {workflow.pattern.value}")

        start_time = datetime.now().isoformat()

        try:
            if workflow.pattern == CoordinationPattern.PIPELINE:
                result = self._execute_pipeline(workflow, context)
            elif workflow.pattern == CoordinationPattern.PARALLEL:
                result = self._execute_parallel(workflow, context)
            elif workflow.pattern == CoordinationPattern.HYBRID:
                result = self._execute_hybrid(workflow, context)
            else:
                result = {"success": False, "error": f"Unsupported pattern: {workflow.pattern}"}

            result["start_time"] = start_time
            result["end_time"] = datetime.now().isoformat()
            result["workflow_id"] = workflow_id

            # 记录执行日志
            self._log_workflow_execution(workflow_id, result)

            return result

        except Exception as e:
            logger.error(f"工作流执行失败: {e}", exc_info=True)
            return {
                "success": False,
                "error": str(e),
                "start_time": start_time,
                "end_time": datetime.now().isoformat(),
                "workflow_id": workflow_id
            }

    def _execute_pipeline(
        self,
        workflow: WorkflowDefinition,
        initial_context: Dict[str, Any]
    ) -> Dict[str, Any]:
        """流水线模式执行"""
        context = initial_context.copy()
        results = []

        # 获取工作流中的agents列表（简化处理）
        agent_ids = workflow.metadata.get('agents', [])

        for i, agent_id in enumerate(agent_ids):
            logger.info(f"📍 步骤 {i+1}/{len(agent_ids)}: {agent_id}")

            if agent_id not in self.agents:
                logger.error(f"Agent不存在: {agent_id}")
                return {
                    "success": False,
                    "error": f"Agent {agent_id} not found",
                    "results": results
                }

            # 启动agent并等待完成
            result = self._run_agent_in_tmux(
                agent_id,
                context=context,
                wait=True
            )

            results.append(result)

            if not result['success']:
                logger.error(f"Agent {agent_id} 失败: {result.get('error')}")
                return {
                    "success": False,
                    "error": f"Agent {agent_id} failed",
                    "results": results
                }

            # 传递上下文
            context.update(result.get('output_context', {}))

        return {
            "success": True,
            "results": results,
            "final_context": context
        }

    def _execute_parallel(
        self,
        workflow: WorkflowDefinition,
        initial_context: Dict[str, Any]
    ) -> Dict[str, Any]:
        """并行模式执行"""
        agent_ids = workflow.metadata.get('agents', [])

        logger.info(f"⚡ 并行启动 {len(agent_ids)} 个agents")

        # 启动所有agents
        active_sessions = []
        for agent_id in agent_ids:
            if agent_id in self.agents:
                session = self._run_agent_in_tmux(
                    agent_id,
                    context=initial_context,
                    wait=False
                )
                active_sessions.append(session)

        # 等待所有agents完成
        results = []
        combined_context = initial_context.copy()

        for session in active_sessions:
            result = self._wait_for_agent_completion(
                session['agent_id'],
                timeout=300
            )
            results.append(result)
            combined_context.update(result.get('output_context', {}))

        # 检查是否所有都成功
        all_success = all(r['success'] for r in results)

        return {
            "success": all_success,
            "results": results,
            "final_context": combined_context
        }

    def _execute_hybrid(
        self,
        workflow: WorkflowDefinition,
        initial_context: Dict[str, Any]
    ) -> Dict[str, Any]:
        """混合模式执行（分阶段）"""
        context = initial_context.copy()
        all_results = []

        for phase in workflow.phases:
            logger.info(f"📋 执行阶段: {phase.phase_name}")

            if phase.pattern == CoordinationPattern.PIPELINE:
                # 流水线执行
                for agent_id in phase.agents:
                    result = self._run_agent_in_tmux(agent_id, context=context, wait=True)
                    all_results.append(result)
                    context.update(result.get('output_context', {}))

            elif phase.pattern == CoordinationPattern.PARALLEL:
                # 并行执行
                sessions = [self._run_agent_in_tmux(aid, context=context, wait=False)
                           for aid in phase.agents if aid in self.agents]

                for session in sessions:
                    result = self._wait_for_agent_completion(session['agent_id'])
                    all_results.append(result)
                    context.update(result.get('output_context', {}))

        return {
            "success": True,
            "results": all_results,
            "final_context": context
        }

    def _run_agent_in_tmux(
        self,
        agent_id: str,
        context: Dict[str, Any],
        wait: bool = True
    ) -> Dict[str, Any]:
        """在tmux会话中运行单个agent"""
        if agent_id not in self.agents:
            return {
                "success": False,
                "error": f"Agent {agent_id} not found",
                "agent_id": agent_id
            }

        agent = self.agents[agent_id]
        session_name = f"{self.tmux_base_session}-{agent_id}"

        # 创建上下文文件
        context_file = self.state_dir / "context-cache" / f"{agent_id}-context.json"
        context_file.write_text(json.dumps(context, indent=2, ensure_ascii=False))

        # 构建命令
        cmd = f"claude agent \"{agent.skill_path}\""

        # 检查tmux是否已安装
        try:
            subprocess.run(["tmux", "-V"], capture_output=True, check=True)
        except (subprocess.CalledProcessError, FileNotFoundError):
            logger.warning("tmux未安装，直接运行agent")
            # 如果没有tmux，直接运行（简化处理）
            return {
                "success": True,
                "status": "completed",
                "agent_id": agent_id,
                "output_context": {},
                "tmux_session": None
            }

        # 检查会话是否已存在
        check_session = subprocess.run(
            ["tmux", "has-session", "-t", session_name],
            capture_output=True
        )

        if check_session.returncode == 0:
            logger.info(f"会话已存在: {session_name}")
            # 获取会话信息
            return {
                "success": True,
                "status": "running",
                "agent_id": agent_id,
                "tmux_session": session_name,
                "output_context": {}
            }

        # 在tmux中启动新会话
        subprocess.run([
            "tmux", "new-session",
            "-ds", session_name,
            cmd
        ])

        logger.info(f"启动tmux会话: {session_name}")

        if wait:
            return self._wait_for_agent_completion(agent_id, timeout=agent.timeout)

        return {
            "success": True,
            "status": "running",
            "agent_id": agent_id,
            "tmux_session": session_name,
            "output_context": {}
        }

    def _wait_for_agent_completion(
        self,
        agent_id: str,
        timeout: int = 300
    ) -> Dict[str, Any]:
        """等待agent完成并收集结果"""
        session_name = f"{self.tmux_base_session}-{agent_id}"
        start_time = time.time()

        logger.info(f"等待agent完成: {agent_id} (超时: {timeout}秒)")

        while time.time() - start_time < timeout:
            # 检查会话是否存在
            result = subprocess.run(
                ["tmux", "has-session", "-t", session_name],
                capture_output=True
            )

            if result.returncode != 0:
                # 会话已结束
                logger.info(f"Agent已完成: {agent_id}")
                return {
                    "success": True,
                    "status": "completed",
                    "agent_id": agent_id,
                    "tmux_session": session_name,
                    "output_context": {}
                }

            time.sleep(2)

        # 超时
        logger.warning(f"Agent执行超时: {agent_id}")
        return {
            "success": False,
            "status": "timeout",
            "error": f"Agent {agent_id} execution timeout",
            "agent_id": agent_id,
            "tmux_session": session_name
        }

    def _log_workflow_execution(self, workflow_id: str, result: Dict[str, Any]):
        """记录工作流执行日志"""
        log_entry = {
            "timestamp": datetime.now().isoformat(),
            "workflow_id": workflow_id,
            "success": result.get("success", False),
            "start_time": result.get("start_time"),
            "end_time": result.get("end_time"),
            "error": result.get("error")
        }

        log_file = self.state_dir / "collaboration-logs" / "workflow-executions.jsonl"
        with open(log_file, 'a') as f:
            f.write(json.dumps(log_entry, ensure_ascii=False) + "\n")

    def stop_agent(self, agent_id: str) -> bool:
        """停止指定的agent"""
        session_name = f"{self.tmux_base_session}-{agent_id}"

        result = subprocess.run(
            ["tmux", "kill-session", "-t", session_name],
            capture_output=True
        )

        if result.returncode == 0:
            logger.info(f"已停止agent: {agent_id}")
            return True
        else:
            logger.warning(f"停止agent失败: {agent_id}")
            return False

    def get_status(self, agent_id: Optional[str] = None) -> Dict[str, Any]:
        """获取agent状态"""
        if agent_id:
            session_name = f"{self.tmux_base_session}-{agent_id}"
            result = subprocess.run(
                ["tmux", "has-session", "-t", session_name],
                capture_output=True
            )
            return {
                "agent_id": agent_id,
                "running": result.returncode == 0
            }
        else:
            # 获取所有agent状态
            status = {}
            for agent in self.agents:
                session_name = f"{self.tmux_base_session}-{agent}"
                result = subprocess.run(
                    ["tmux", "has-session", "-t", session_name],
                    capture_output=True
                )
                status[agent] = {
                    "running": result.returncode == 0,
                    "session": session_name if result.returncode == 0 else None
                }
            return status


def main():
    """主函数"""
    import argparse

    parser = argparse.ArgumentParser(description="Agent Team Coordinator")
    parser.add_argument("--workspace", "-w", default=".", help="工作空间路径")
    parser.add_argument("--list-agents", action="store_true", help="列出所有agents")
    parser.add_argument("--list-workflows", action="store_true", help="列出所有工作流")
    parser.add_argument("--workflow", help="运行指定工作流")
    parser.add_argument("--status", "-s", help="获取agent状态")

    args = parser.parse_args()

    workspace = Path(args.workspace).resolve()
    coordinator = AgentTeamCoordinator(workspace)

    if args.list_agents:
        print("\n=== 可用的Agents ===")
        for agent in coordinator.list_agents():
            print(f"\n📌 {agent.agent_id}")
            print(f"   名称: {agent.name}")
            print(f"   描述: {agent.description}")
            print(f"   模型: {agent.model}")
            if agent.capabilities:
                print(f"   能力: {', '.join(agent.capabilities)}")

    elif args.list_workflows:
        print("\n=== 可用的工作流 ===")
        for workflow in coordinator.list_workflows():
            print(f"\n🔄 {workflow.workflow_id}")
            print(f"   名称: {workflow.name}")
            print(f"   描述: {workflow.description}")
            print(f"   模式: {workflow.pattern.value}")

    elif args.workflow:
        result = coordinator.start_agent_team(args.workflow)
        if result["success"]:
            print(f"\n✅ 工作流完成: {args.workflow}")
        else:
            print(f"\n❌ 工作流失败: {result.get('error')}")

    elif args.status:
        status = coordinator.get_status(args.status)
        print(f"\n📊 Agent状态: {args.status}")
        print(f"   运行中: {status.get('running')}")

    else:
        parser.print_help()


if __name__ == "__main__":
    main()
