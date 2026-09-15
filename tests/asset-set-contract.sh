#!/bin/sh
set -eu

skill_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
assets_dir="$skill_dir/assets"

expected=$(cat <<'EOF'
fan-breeze-jp-en-v7.png
film-in-hand-jp-en-v2.png
food-breakfast-api-v2.png
movement-cn-en-v7.png
roof-framed-typography-v7.png
station-industrial-archive-v2.png
subway-depth-fix-v9.png
utility-pole-editorial-v3.png
window-masks-jp-en-v2.png
EOF
)

actual=$(find "$assets_dir" -maxdepth 1 -type f -exec basename {} \; | LC_ALL=C sort)

if [ "$actual" != "$expected" ]; then
  echo "Unexpected assets/ root file set" >&2
  echo "Expected:" >&2
  echo "$expected" >&2
  echo "Actual:" >&2
  echo "$actual" >&2
  exit 1
fi

for asset in $expected; do
  rg -Fq "assets/$asset" "$skill_dir/references/visual-language.md" || {
    echo "Missing asset route in references/visual-language.md: $asset" >&2
    exit 1
  }
done

echo "Asset set contract passed."
