# 欢迎使用 Void

<div align="center">
  <img
    src="./src/vs/workbench/browser/parts/editor/media/slice_of_void.png"
    alt="Void 欢迎界面"
    width="300"
    height="300"
  />
</div>

<div align="center">

![TypeScript](https://img.shields.io/badge/TypeScript-5.0+-blue.svg)
![VSCode](https://img.shields.io/badge/VSCode-Extension-blue.svg)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)
![Build](https://img.shields.io/badge/Build-Passing-brightgreen.svg)

**Void 是开源的 Cursor 替代品**
在您的代码库上使用 AI 代理，检查点并可视化更改，并本地托管任何模型。

</div>

## 🚀 核心功能

- 🤖 **AI 代码补全** - 基于 LLM 的智能补全，支持多行/单行
- 💬 **对话式编程** - 线程式 AI 对话，支持文件上下文
- ✏️ **可视化编辑** - 差异显示与确认，支持批量操作
- 🔧 **工具扩展** - 支持 MCP 协议，可插拔工具系统
- ⚙️ **多模型支持** - OpenAI/Anthropic/Gemini 无缝切换
- 📁 **文件管理** - 智能文件操作和版本控制
- 🖥️ **跨平台** - Windows/macOS/Linux 全平台支持

## 📋 系统要求

- **Node.js**: 版本 v20.18.2
- **Python**: 3.8+ (用于某些工具)
- **操作系统**: Windows 10+, macOS 10.14+, Ubuntu 18.04+
- **内存**: 8GB RAM (推荐 16GB)
- **存储**: 2GB 可用空间

## 🛠️ 快速开始

### 方法1: 使用预编译版本 (推荐)

1. 从 [Releases](https://github.com/izerui/void/releases) 下载对应平台的安装包
2. 双击安装即可使用

### 方法2: 从源码构建

#### 一键构建
```bash
# 克隆项目
git clone https://github.com/voideditor/void.git
cd void

# 一键构建 (包含前端编译)
./build.sh
```

#### 分步构建
```bash
# 1. 安装依赖
npm install

# 2. 编译前端 React 组件
npm run buildreact

# 3. 编译主程序
npm run compile

# 4. 运行开发版
./scripts/code.sh
```

## 🔨 开发命令

### 核心命令
```bash
# 开发环境
npm run buildreact        # 编译 React 组件
npm run watchreact  # 监听 React 编译
npm run compile          # 编译主程序
npm run watch            # 监听主程序编译

# 运行和调试
./scripts/code.sh        # 启动开发版
npm run test            # 运行测试
npm run lint            # 代码检查
```

### 打包命令
```bash
# 完整打包流程
npm run buildreact       # 1. 编译前端
npm run compile          # 2. 编译主程序

# 平台特定打包
npm run gulp vscode-darwin-arm64    # Mac Apple Silicon
npm run gulp vscode-darwin-x64      # Mac Intel
npm run gulp vscode-win32-x64       # Windows
npm run gulp vscode-linux-x64       # Linux

# 一键打包
./scripts/build.sh
```

## 🏗️ 项目架构

```
src/vs/workbench/contrib/void/
├── browser/           # 浏览器端实现
│   ├── autocompleteService.ts    # AI 代码补全
│   ├── chatThreadService.ts      # 对话管理
│   ├── editCodeService.ts        # 代码编辑
│   ├── toolsService.ts           # 工具系统
│   └── react/                    # React 前端
├── common/            # 通用逻辑
│   ├── voidSettingsService.ts    # 配置管理
│   ├── sendLLMMessageService.ts  # LLM 通信
│   └── toolsServiceTypes.ts      # 工具类型
└── electron-main/     # 主进程实现
    ├── sendLLMMessage.impl.ts    # LLM 消息处理
    └── mcpChannel.ts             # MCP 协议支持
```

### 架构特点
- **模块化设计** - 清晰的职责分离
- **事件驱动** - 基于 VSCode 事件系统
- **依赖注入** - 使用 VSCode 服务容器
- **类型安全** - 完整的 TypeScript 支持

## 🎨 界面预览

### 主要界面
- **侧边栏 AI 对话** - 线程式对话管理
- **代码补全** - 智能内联补全
- **差异视图** - 可视化代码变更
- **设置面板** - 模型和工具配置

## 🔧 开发环境

### 推荐工具
- **VSCode** - 官方开发环境
- **Node.js** - 运行时环境
- **uv** - Python 包管理 (可选)
- **React DevTools** - 前端调试

### 环境设置
```bash
# 安装 Node.js (推荐 18+)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# 或 macOS
brew install node
```

## 🐛 故障排除

### 常见问题

#### 1. React 组件不更新
```bash
# 解决方案：重新编译 React
npm run buildreact
```

#### 2. 构建失败
```bash
# 清理并重新构建
make clean
npm run buildreact
npm run compile
```

#### 3. 权限问题
```bash
# macOS/Linux
sudo chown -R $(whoami) .
```

#### 4. 依赖问题
```bash
# 清理并重新安装
rm -rf node_modules
npm install
```

## 📄 许可证

本项目采用 MIT 许可证。详情请查看 [LICENSE](LICENSE.txt) 文件。

## 🤝 贡献指南

### 如何贡献
1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

### 开发规范
- 遵循 TypeScript 最佳实践
- 使用 VSCode 代码格式化
- 添加必要的注释和文档

## 📞 支持

- 🐛 [提交 Issue](https://github.com/izerui/void/issues)
- 💬 [Discord 社区](https://discord.gg/RSNjgaugJs)
- 📧 邮件：liuyuhua69@gmail.com
- 📖 [项目文档](https://voideditor.com/docs)

## 🙏 致谢

- [voideditor](https://voideditor.com) - voideditor
- [VSCode](https://github.com/microsoft/vscode) - 基础框架
- [TypeScript](https://www.typescriptlang.org) - 类型系统
- [React](https://react.dev) - 前端框架
- [Node.js](https://nodejs.org) - 运行时环境

## 提示词参考
- https://gist.github.com/sshh12/25ad2e40529b269a88b80e7cf1c38084

---


<div align="center">

**⭐ 如果这个项目对您有帮助，请给我们一个星星！ ⭐**
**💡 有任何问题，欢迎加入我们的 Discord 社区讨论！ 💡**

</div>
