@echo off
REM /Users/liuyuhua/github/void/build.bat
REM Windows CMD 版打包脚本，行为对齐 build.sh

setlocal enabledelayedexpansion

REM 1. 进入仓库根目录
cd /d "%~dp0.."

echo 开始构建 Void 编辑器...

REM 2. 构建前端
echo 执行 npm run buildreact ...
call npm run buildreact
if errorlevel 1 (
    echo buildreact 失败，终止
    pause
    exit /b 1
)

REM 3. 编译主程序
echo 执行 npm run compile ...
call npm run compile
if errorlevel 1 (
    echo compile 失败，终止
    pause
    exit /b 1
)

REM 4. 检测架构
set "TARGET="
wmic os get osarchitecture | findstr /i "ARM" >nul
if %errorlevel%==0 (
    set TARGET=vscode-win32-arm64
) else (
    set TARGET=vscode-win32-x64
)

echo 正在为 %TARGET% 打包...
call npm run gulp %TARGET%
if errorlevel 1 (
    echo gulp 打包失败
    pause
    exit /b 1
)

echo 构建和打包完成!
pause
