#!/bin/sh
set -eu

skill_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

require_text() {
  file=$1
  text=$2
  rg -Fq "$text" "$file" || {
    echo "Missing runtime contract in ${file#$skill_dir/}: $text" >&2
    exit 1
  }
}

reject_text() {
  file=$1
  text=$2
  if rg -Fq "$text" "$file"; then
    echo "Forbidden runtime behavior in ${file#$skill_dir/}: $text" >&2
    exit 1
  fi
}

require_text "$skill_dir/SKILL.md" "用户上传一张图片，图像工具就只能接收这一张"
require_text "$skill_dir/references/visual-language.md" "Bundled references 只供内部分析"
require_text "$skill_dir/references/prompt-and-quality.md" "图像输入集合必须严格等于用户为当前作品提供的图片集合"
require_text "$skill_dir/references/prompt-and-quality.md" "不得通过改写、弱化或隐藏内容来绕过安全系统"
require_text "$skill_dir/SKILL.md" "纸面是第一画布层"
require_text "$skill_dir/references/visual-language.md" "照片只占纸面的一部分"
require_text "$skill_dir/references/prompt-and-quality.md" "全幅照片加线稿覆盖"
require_text "$skill_dir/references/visual-language.md" "构图骨架默认克制，笔触默认大胆"
require_text "$skill_dir/references/visual-language.md" "环境或物件照片块通常覆盖纸面约 20%–45%"
require_text "$skill_dir/references/interaction-modes.md" "照片与线稿必须共同描述同一个连续空间"
require_text "$skill_dir/references/interaction-modes.md" "同一尺度、同一透视、同一方向"
require_text "$skill_dir/references/lettering-system.md" "窄长、不等高、轻微倾斜"
require_text "$skill_dir/references/prompt-and-quality.md" "照片块旁边另画一套完整主体"
require_text "$skill_dir/references/interaction-modes.md" "负形剪纸"
require_text "$skill_dir/references/lettering-system.md" "展示字、叙事字和微型注释字"
require_text "$skill_dir/references/prompt-and-quality.md" "至少两种字号、两种粗细和两种字形节奏"
require_text "$skill_dir/SKILL.md" "多张待测照片默认逐张独立处理"
require_text "$skill_dir/SKILL.md" "锁定底图局部改版"
require_text "$skill_dir/references/interaction-modes.md" "跨界接缝列为保护区"
require_text "$skill_dir/references/visual-language.md" "不规则米白贴纸边"
require_text "$skill_dir/references/lettering-system.md" "高窄、粗黑、磨损感"
require_text "$skill_dir/references/lettering-system.md" "多语种标题"
require_text "$skill_dir/references/lettering-system.md" "各自保持原文"
require_text "$skill_dir/references/lettering-system.md" "日文随写体"
require_text "$skill_dir/references/lettering-system.md" "避免中国书法式"
require_text "$skill_dir/references/prompt-and-quality.md" "正常尺寸下清楚可辨"
require_text "$skill_dir/references/visual-language.md" "从源图主色取样"
require_text "$skill_dir/references/visual-language.md" "保留一个源图光线线索"
require_text "$skill_dir/references/prompt-and-quality.md" "遮罩外像素从已确认底图原样回贴"
require_text "$skill_dir/references/prompt-and-quality.md" "断开、越界、转角不完全闭合"

reject_text "$skill_dir/references/visual-language.md" "用户照片为第一输入，主参考为第二输入"
reject_text "$skill_dir/references/prompt-and-quality.md" "一张主风格参考：只提供转换语法"

echo "Runtime input contracts passed."
