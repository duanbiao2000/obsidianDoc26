#!/usr/bin/env python3
"""
启动研究任务
"""
import sys
import json
import importlib.util
from pathlib import Path

# 加载agent_team_coordinator模块
coordinator_path = Path(__file__).parent / "agent-team-coordinator.py"
spec = importlib.util.spec_from_file_location("agent_team_coordinator", coordinator_path)
atc_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(atc_module)

AgentTeamCoordinator = atc_module.AgentTeamCoordinator

def main():
    research_question = " ".join(sys.argv[1:]) if len(sys.argv) > 1 else "Agent Orchestration框架对比"

    print(f"🚀 启动研究: {research_question}")

    # 初始化协调器
    workspace = Path(__file__).parent.parent.parent
    coordinator = AgentTeamCoordinator(workspace)

    # 准备上下文
    context = {
        "research_question": research_question,
        "project_name": research_question[:30].replace(" ", "-"),
        "timestamp": "2025-02-13",
    }

    # 启动工作流
    print(f"\n📋 工作流: deep-research-analysis")
    print(f"📊 上下文: {json.dumps(context, ensure_ascii=False)}\n")

    result = coordinator.start_agent_team(
        workflow_id="deep-research-analysis",
        context=context
    )

    if result["success"]:
        print("\n✅ 研究工作流启动成功!")
        print(f"开始时间: {result.get('start_time')}")
    else:
        print(f"\n❌ 研究工作流失败: {result.get('error')}")

if __name__ == "__main__":
    main()
