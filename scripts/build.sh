#!/bin/bash
set -e

# 进入项目根目录
cd "$(dirname "$0")/.."

echo "开始构建 Void 编辑器..."

# 不再 sudo，避免权限问题
npm run buildreact
npm run compile

# 检测平台和架构
OS="$(uname -s)"
ARCH="$(uname -m)"
echo "检测到操作系统: $OS, 架构: $ARCH"

# 映射到 Void 打包命令
case "$OS" in
    Darwin*)
        case "$ARCH" in
            arm64)  TARGET="vscode-darwin-arm64" ;;
            x86_64) TARGET="vscode-darwin-x64" ;;
            *) echo "不支持的 Mac 架构: $ARCH"; exit 1 ;;
        esac
        ;;
    Linux*)
        case "$ARCH" in
            x86_64)  TARGET="vscode-linux-x64" ;;
            aarch64) TARGET="vscode-linux-arm64" ;;
            *) echo "不支持的 Linux 架构: $ARCH"; exit 1 ;;
        esac
        ;;
    MINGW*|CYGWIN*|MSYS*)
        case "$ARCH" in
            x86_64)  TARGET="vscode-win32-x64" ;;
            arm64)   TARGET="vscode-win32-arm64" ;;
            *) echo "不支持的 Windows 架构: $ARCH"; exit 1 ;;
        esac
        ;;
    *)
        echo "不支持的操作系统: $OS"
        exit 1
        ;;
esac

echo "正在为 $TARGET 打包 Void..."
npm run gulp "$TARGET"

# ---------- macOS 无证书适配 ----------
if [[ "$OS" == Darwin* ]]; then
    APP_PATH="$(dirname "$(pwd)")/VSCode-darwin-arm64/Void.app"
    if [[ -d "$APP_PATH" ]]; then
        echo "进行 ad-hoc 签名并移除 quarantine..."
        codesign --force --deep --sign - "$APP_PATH"
        xattr -dr com.apple.quarantine "$APP_PATH"
        echo "已处理完成，拷贝到其他 Mac 后首次运行需“允许未知开发者”"
    else
        echo "警告: 未找到 $APP_PATH，请检查打包路径"
    fi
fi

echo "构建和打包完成!"
