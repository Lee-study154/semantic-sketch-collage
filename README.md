# semantic-sketch-collage

将用户提供的真实照片转化为有语义来源的手绘编辑拼贴、实验海报或 zine 图像。照片保留为事实锚点，线稿从照片真实结构跨界延展，文字只有在有可靠来源时才进入画面。

## Package

- `SKILL.md`: skill entrypoint and routing rules
- `agents/openai.yaml`: Codex display metadata
- `assets/`: bundled visual-language references
- `references/`: semantic analysis, interaction, lettering, visual-language, and prompt-quality guidance
- `tests/runtime-input-contract.sh`: runtime image-input contract check

## Install

Copy this folder to `$CODEX_HOME/skills/semantic-sketch-collage` (or `~/.codex/skills/semantic-sketch-collage` when `CODEX_HOME` is unset), then invoke it with `$semantic-sketch-collage`.

## Validate

From this folder, run:

```sh
bash tests/runtime-input-contract.sh
```
