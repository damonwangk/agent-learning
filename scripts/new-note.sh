#!/usr/bin/env bash
set -euo pipefail

# 用中文注释说明脚本行为：根据传入主题名生成一篇新的学习笔记。
topic="${1:-}"

if [[ -z "$topic" ]]; then
  echo "用法: ./scripts/new-note.sh \"tool-use\""
  exit 1
fi

# 将空格替换成短横线，保持文件名适合 Git 管理。
slug="$(echo "$topic" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"
target="notes/${slug}.md"

if [[ -e "$target" ]]; then
  echo "笔记已存在: $target"
  exit 1
fi

cp templates/learning-note-template.md "$target"
echo "已创建: $target"
