#!/bin/bash
# ============================================
#  学术工作台 · 启动脚本
#  双击本文件即可启动并打开浏览器
#  再次双击则直接打开已运行的页面
# ============================================
cd "$(dirname "$0")"

# 本机实测：MinerU 自动选 MPS（Apple GPU）会在加载版面模型时崩溃，强制 CPU 才稳定
# （2026-09-27 部署时验证：auto 连续崩溃、cpu 一次通过 14 页）
export MINERU_DEVICE_MODE=cpu

# 确保 PDF 转写 worker（8766）在运行；缺失 venv 时静默跳过，不阻断主工作台
ensure_pdf_worker() {
  if curl -s -m 2 --noproxy '*' http://127.0.0.1:8766/api/pdf/health > /dev/null 2>&1; then
    return 0
  fi
  if [ -x "pdf_worker/.venv/bin/python" ] && [ -f "pdf_worker/worker.py" ]; then
    echo "正在启动 PDF 转写引擎（worker 8766）…"
    nohup pdf_worker/.venv/bin/python pdf_worker/worker.py > data/pdf_worker.log 2>&1 &
  fi
}

# 检查工作台是否已在运行
if curl -s -m 2 --noproxy '*' http://127.0.0.1:8765/ > /dev/null 2>&1; then
  echo "工作台已在运行，正在打开浏览器…"
  ensure_pdf_worker
  open http://127.0.0.1:8765
  exit 0
fi

# 启动主服务器（后台）
nohup python3 server.py > data/server.log 2>&1 &
# 启动 PDF 转写 worker（后台）
ensure_pdf_worker
sleep 2

if curl -s -m 2 --noproxy '*' http://127.0.0.1:8765/ > /dev/null 2>&1; then
  echo "✅ 学术工作台已启动，正在打开浏览器…"
  open http://127.0.0.1:8765
else
  echo "❌ 启动失败，请查看 data/server.log 中的错误信息"
fi
