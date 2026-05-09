from pathlib import Path

import importlib.util

import subprocess

import sys

# =========================================================
# 项目根目录
# =========================================================

BASE_DIR = Path(__file__).parent.resolve()

# =========================================================
# 文件路径
# =========================================================

TEMPLATE_PATH = (
    BASE_DIR / "template" / "Template.ly"
)

SCRIPTS_PATH = (
    BASE_DIR / "scripts" / "moon.py"
)

GENERATE_DIR = (
    BASE_DIR / "generate"
)

GENERATE_LY = (
    GENERATE_DIR / "moon.ly"
)

OUTPUT_FILE = (
    BASE_DIR / "output"
)

OUTPUT_NAME = (
    OUTPUT_FILE / "output"
)

# =========================================================
# 检查模板文件
# =========================================================

if not TEMPLATE_PATH.exists():

    print("模板文件不存在：")
    print(TEMPLATE_PATH)

    sys.exit(1)

# =========================================================
# 检查歌曲文件
# =========================================================

if not SCRIPTS_PATH.exists():

    print("歌曲文件不存在：")
    print(SCRIPTS_PATH)

    sys.exit(1)

# =========================================================
# 读取模板
# =========================================================

template = TEMPLATE_PATH.read_text(
    encoding="utf-8"
)

# =========================================================
# 动态导入歌曲数据
# =========================================================

spec = importlib.util.spec_from_file_location(
    "script_module",
    SCRIPTS_PATH
)

module = importlib.util.module_from_spec(spec)

spec.loader.exec_module(module)

# =========================================================
# 获取 script 数据
# =========================================================

if not hasattr(module, "script"):

    print("moon.py 中缺少 script 变量")

    sys.exit(1)

script = module.script

# =========================================================
# 替换模板变量
# =========================================================

for key, value in script.items():

    template = template.replace(
        "{{" + key + "}}",
        str(value)
    )

# =========================================================
# 创建输出目录
# =========================================================

GENERATE_DIR.mkdir(
    parents=True,
    exist_ok=True
)

# =========================================================
# 写入 moon.ly
# =========================================================

GENERATE_LY.write_text(
    template,
    encoding="utf-8"
)

print("=================================================")
print("LilyPond 文件已生成")
print(GENERATE_LY)
print("=================================================")

# =========================================================
# 编译 LilyPond
# =========================================================

print("正在编译 LilyPond...")

try:

    result = subprocess.run(

        [
            "lilypond",

            "-o",

            str(OUTPUT_NAME),

            str(GENERATE_LY)
        ],

        check=True,

        capture_output=True,

        text=True
    )

    print("=================================================")
    print("LilyPond 编译成功")
    print("=================================================")

    pdf_path = GENERATE_DIR / "output.pdf"

    midi_path = GENERATE_DIR / "output.midi"

    if pdf_path.exists():

        print("PDF:")
        print(pdf_path)

    if midi_path.exists():

        print("MIDI:")
        print(midi_path)

    # 输出 LilyPond 日志
    if result.stdout.strip():

        print("=================================================")
        print(result.stdout)

except FileNotFoundError:

    print("未找到 LilyPond")
    print("请确认 lilypond 已加入 PATH")

    sys.exit(1)

except subprocess.CalledProcessError as e:

    print("=================================================")
    print("LilyPond 编译失败")
    print("=================================================")

    print("返回码：", e.returncode)

    if e.stderr:

        print(e.stderr)

    sys.exit(1)
