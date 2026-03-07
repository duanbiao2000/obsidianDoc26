#!/bin/bash
# Test Script for Agent Team Orchestration
# 用于测试和验证agent团队编排系统

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="$(cd "$SCRIPT_DIR/../.." && pwd)"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

test_count=0
pass_count=0
fail_count=0

# 测试函数
run_test() {
    local test_name="$1"
    local test_command="$2"

    test_count=$((test_count + 1))
    echo -e "\n${BLUE}[Test $test_count]${NC} $test_name"

    if eval "$test_command"; then
        echo -e "${GREEN}✓ PASS${NC}"
        pass_count=$((pass_count + 1))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}"
        fail_count=$((fail_count + 1))
        return 1
    fi
}

# 测试报告
print_report() {
    echo -e "\n${BLUE}=== Test Report ===${NC}"
    echo "Total tests: $test_count"
    echo -e "${GREEN}Passed: $pass_count${NC}"
    if [ $fail_count -gt 0 ]; then
        echo -e "${RED}Failed: $fail_count${NC}"
    fi

    if [ $fail_count -eq 0 ]; then
        echo -e "\n${GREEN}All tests passed!${NC}"
        return 0
    else
        echo -e "\n${RED}Some tests failed!${NC}"
        return 1
    fi
}

echo -e "${BLUE}=== Agent Team Orchestration Tests ===${NC}"

# 测试1: 检查目录结构
run_test "目录结构检查" "
    [ -d '$WORKSPACE/agents/definitions' ] && \
    [ -d '$WORKSPACE/agents/workflows' ] && \
    [ -d '$WORKSPACE/scripts/orchestration' ] && \
    [ -d '$WORKSPACE/.agent-state' ]
"

# 测试2: 检查核心脚本
run_test "核心脚本存在性检查" "
    [ -f '$WORKSPACE/scripts/orchestration/agent-team-coordinator.py' ] && \
    [ -f '$WORKSPACE/scripts/orchestration/context-bridge.py' ] && \
    [ -f '$WORKSPACE/scripts/orchestration/result-synthesizer.py' ]
"

# 测试3: 检查agent定义
run_test "Agent定义文件检查" "
    count=\$(find '$WORKSPACE/agents/definitions' -name 'EMP_*.md' 2>/dev/null | wc -l) && \
    [ \$count -ge 4 ]
"

# 测试4: 检查工作流定义
run_test "工作流定义文件检查" "
    count=\$(find '$WORKSPACE/agents/workflows' -name '*.md' 2>/dev/null | wc -l) && \
    [ \$count -ge 1 ]
"

# 测试5: Python脚本语法检查
run_test "Python脚本语法检查" "
    cd '$WORKSPACE' && \
    python3 -m py_compile scripts/orchestration/agent-team-coordinator.py && \
    python3 -m py_compile scripts/orchestration/context-bridge.py && \
    python3 -m py_compile scripts/orchestration/result-synthesizer.py
"

# 测试6: Context Bridge导入测试
run_test "Context Bridge导入测试" "
    cd '$WORKSPACE' && \
    python3 -c 'import sys, importlib.util; spec = importlib.util.spec_from_file_location(\"cb\", \"scripts/orchestration/context-bridge.py\"); module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module); print(\"ContextBridge imported successfully\")'
"

# 测试7: 协调器导入测试
run_test "协调器导入测试" "
    cd '$WORKSPACE' && \
    python3 -c 'import sys, importlib.util; spec = importlib.util.spec_from_file_location(\"ac\", \"scripts/orchestration/agent-team-coordinator.py\"); module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module); print(\"AgentTeamCoordinator imported successfully\")'
"

# 测试8: 列出agents功能测试
run_test "列出agents功能测试" "
    cd '$WORKSPACE' && \
    output=\$(python3 scripts/orchestration/agent-team-coordinator.py --list-agents 2>&1) && \
    echo \"\$output\" | grep -q '可用的Agents'
"

# 测试9: 列出工作流功能测试
run_test "列出工作流功能测试" "
    cd '$WORKSPACE' && \
    output=\$(python3 scripts/orchestration/agent-team-coordinator.py --list-workflows 2>&1) && \
    echo \"\$output\" | grep -q '可用的工作流'
"

# 测试10: tmux检查（可选）
if command -v tmux &> /dev/null; then
    run_test "tmux可用性检查" "
        tmux -V &> /dev/null
    "
else
    echo -e "\n${YELLOW}⊘ SKIP${NC} tmux未安装"
fi

# 测试11: Context Bridge基本功能测试
run_test "Context Bridge基本功能测试" "
    cd '$WORKSPACE' && \
    python3 -c '
import sys
import tempfile
from pathlib import Path
import importlib.util

# 加载context_bridge模块
spec = importlib.util.spec_from_file_location(\"cb\", \"scripts/orchestration/context-bridge.py\")
cb = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cb)

with tempfile.TemporaryDirectory() as tmpdir:
    state_dir = Path(tmpdir)
    bridge = cb.ContextBridge(state_dir)

    # 测试更新共享状态
    bridge.update_shared_state(\"test_key\", \"test_value\", \"test_agent\")

    # 测试获取共享状态
    value = bridge.get_shared_state(\"test_key\")

    if value and \"test_value\" in str(value):
        print(\"ContextBridge basic operations successful\")
        sys.exit(0)
    else:
        sys.exit(1)
'
"

# 打印测试报告
print_report
