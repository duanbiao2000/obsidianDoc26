#!/bin/bash
# Research Workflow Launcher - 启动研究工作流
# 用于快速启动深度研究分析工作流

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="$(cd "$SCRIPT_DIR/../.." && pwd)"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 日志函数
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 显示使用帮助
show_help() {
    cat << EOF
Research Workflow Launcher

启动深度研究分析工作流，自动化多维度信息收集和综合分析。

用法:
    $0 [选项] [研究问题]

选项:
    -h, --help              显示此帮助信息
    -w, --workflow WORKFLOW  工作流名称 (默认: deep-research-analysis)
    -o, --output PATH        输出目录 (默认: Research/outputs/)
    -p, --parallel NUM       并行agent数量 (默认: 3)
    -v, --verbose            详细输出
    --dry-run               仅显示计划，不实际执行

示例:
    # 研究Agent Orchestration框架
    $0 "2024年最新的Agent Orchestration框架对比"

    # 指定输出目录
    $0 -o Research/langgraph "LangGraph框架架构"

    # Dry run模式
    $0 --dry-run "Docker vs Podman"

EOF
}

# 默认参数
WORKFLOW="deep-research-analysis"
OUTPUT_DIR="$WORKSPACE/Research/outputs"
PARALLEL=3
VERBOSE=false
DRY_RUN=false
RESEARCH_QUESTION=""

# 解析参数
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -w|--workflow)
            WORKFLOW="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        -p|--parallel)
            PARALLEL="$2"
            shift 2
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        *)
            RESEARCH_QUESTION="$*"
            shift
            ;;
    esac
done

# 检查研究问题
if [ -z "$RESEARCH_QUESTION" ]; then
    log_error "请提供研究问题"
    show_help
    exit 1
fi

log_info "研究问题: $RESEARCH_QUESTION"
log_info "工作流: $WORKFLOW"
log_info "输出目录: $OUTPUT_DIR"
log_info "并行agents: $PARALLEL"

# 检查依赖
check_dependencies() {
    local missing_deps=()

    if ! command -v python3 &> /dev/null; then
        missing_deps+=("python3")
    fi

    if ! command -v tmux &> /dev/null; then
        missing_deps+=("tmux")
    fi

    if [ ${#missing_deps[@]} -ne 0 ]; then
        log_error "缺少依赖: ${missing_deps[*]}"
        log_info "安装命令: sudo apt-get install ${missing_deps[*]}"
        exit 1
    fi

    log_success "依赖检查通过"
}

# 创建输出目录
create_output_dir() {
    mkdir -p "$OUTPUT_DIR"
    log_success "输出目录已创建: $OUTPUT_DIR"
}

# 创建研究上下文文件
create_context_file() {
    local context_file="$OUTPUT_DIR/research-context.json"
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    local project_name=$(echo "$RESEARCH_QUESTION" | tr ' ' '-' | cut -c1-30)

    cat > "$context_file" << EOF
{
    "research_question": "$RESEARCH_QUESTION",
    "project_name": "$project_name",
    "timestamp": "$timestamp",
    "workflow": "$WORKFLOW",
    "parallel_agents": $PARALLEL,
    "output_dir": "$OUTPUT_DIR"
}
EOF

    log_success "研究上下文已创建: $context_file"
    echo "$context_file"
}

# 启动协调器
launch_coordinator() {
    local context_file="$1"

    if [ "$DRY_RUN" = true ]; then
        log_warning "DRY RUN模式 - 不会实际执行"
        echo ""
        echo "将执行以下步骤:"
        echo "  1. Phase 1: 研究规划 (research-planner)"
        echo "  2. Phase 2: 并行调研"
        echo "     - web-researcher"
        echo "     - academic-searcher"
        echo "     - codebase-analyzer"
        echo "  3. Phase 3: 信息综合 (information-synthesizer)"
        echo "  4. Phase 4: 报告生成 (report-generator)"
        echo ""
        return 0
    fi

    log_info "启动agent协调器..."

    cd "$WORKSPACE"

    python3 scripts/orchestration/agent-team-coordinator.py \
        --workflow "$WORKFLOW" \
        --context "$context_file"
}

# 主流程
main() {
    log_info "=== Research Workflow Launcher ==="
    echo ""

    check_dependencies
    create_output_dir
    context_file=$(create_context_file)

    echo ""
    launch_coordinator "$context_file"

    if [ $? -eq 0 ]; then
        log_success "研究工作流启动成功!"
        echo ""
        log_info "查看tmux会话: tmux ls"
        log_info "查看日志: cat .agent-state/collaboration-logs/coordinator.log"
    else
        log_error "研究工作流启动失败"
        exit 1
    fi
}

# 运行主流程
main
