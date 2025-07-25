#!/bin/bash

# 进入项目根目录
cd "$(dirname "$0")/.."

# 构建 Void 编辑器
echo "开始构建 Void 编辑器..."

sudo npm run buildreact
sudo npm run compile

# 检测平台和架构
OS="$(uname -s)"
ARCH="$(uname -m)"

echo "检测到操作系统: $OS, 架构: $ARCH"

# 映射到 Void 打包命令
case "$OS" in
    Darwin*)
        case "$ARCH" in
            arm64) TARGET="vscode-darwin-arm64" ;;
            x86_64) TARGET="vscode-darwin-x64" ;;
            *) echo "不支持的 Mac 架构: $ARCH"; exit 1 ;;
        esac
        ;;
    Linux*)
        case "$ARCH" in
            x86_64) TARGET="vscode-linux-x64" ;;
            aarch64) TARGET="vscode-linux-arm64" ;;
            *) echo "不支持的 Linux 架构: $ARCH"; exit 1 ;;
        esac
        ;;
    MINGW*|CYGWIN*|MSYS*)
        case "$ARCH" in
            x86_64) TARGET="vscode-win32-x64" ;;
            arm64) TARGET="vscode-win32-arm64" ;;
            *) echo "不支持的 Windows 架构: $ARCH"; exit 1 ;;
        esac
        ;;
    *)
        echo "不支持的操作系统: $OS"
        exit 1
        ;;
esac

echo "正在为 $TARGET 打包 Void..."
npm run gulp $TARGET

echo "构建和打包完成!"
