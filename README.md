# 欢迎使用 Void

<div align="center">
  <img
    src="./src/vs/workbench/browser/parts/editor/media/slice_of_void.png"
	 	alt="Void 欢迎界面"
		width="300"
	 	height="300"
	/>
</div>

Void 是开源的 Cursor 替代品。

在您的代码库上使用 AI 代理，检查点并可视化更改，并本地托管任何模型。Void 直接向提供商发送消息，不会保留您的数据。

此仓库包含 Void 的完整源代码。如果您是新手，欢迎！

- 🧭 [官网](https://voideditor.com)

- 👋 [Discord 社区](https://discord.gg/RSNjgaugJs)

- 🚙 [项目看板](https://github.com/orgs/voideditor/projects/2)

- 🌌 [Download](https://voideditor.com/download-beta)


## 贡献代码

1. 要开始为 Void 做贡献，请查看我们的项目看板！您也可以查看 [如何贡献](https://github.com/voideditor/void/blob/main/HOW_TO_CONTRIBUTE.md)。

2. 欢迎参加我们 Discord 频道中的休闲周会！


## 参考

Void 是 [vscode](https://github.com/microsoft/vscode) 仓库的分支。有关代码库指南，请参见 [VOID_CODEBASE_GUIDE](https://github.com/voideditor/void/blob/main/VOID_CODEBASE_GUIDE.md)。

## 支持
您始终可以在我们的 Discord 服务器上联系我们，或通过电子邮件：hello@voideditor.com 联系我们。


## 项目架构

Void 采用模块化设计，核心代码位于 `src/vs/workbench/contrib/void/`：

### 核心模块

#### browser/ - 浏览器端实现
- **autocompleteService.ts** - 智能代码补全服务
  - 基于 LLM 的代码预测
  - 缓存机制优化
  - 多行/单行补全策略

- **chatThreadService.ts** - AI 对话管理服务
  - 线程式对话管理
  - 文件变更检查点
  - 工具调用处理

- **editCodeService.ts** - 代码编辑核心服务
  - 差异显示与处理
  - 流式编辑支持
  - 撤销/重做管理

- **react/** - React 前端组件
  - Sidebar: 侧边栏聊天界面
  - QuickEdit: 快速编辑弹窗
  - Diff: 差异显示组件
  - Settings: 设置界面

#### common/ - 通用逻辑
- 类型定义和接口规范
- 配置管理系统
- 工具实现和共享逻辑

#### electron-main/ - 主进程实现
- LLM 消息处理
- 系统级功能
- 主进程通信

### 关键特性
- 🤖 **AI 代码补全** - 基于 LLM 的智能补全
- 💬 **对话式编程** - 线程式 AI 对话
- ✏️ **可视化编辑** - 差异显示与确认
- 🔧 **工具扩展** - 支持 MCP 协议
- ⚙️ **多模型支持** - OpenAI/Anthropic/Gemini

### 数据流设计
```
用户操作 → 服务层 → LLM 处理 → 结果展示 → 用户确认
```

## 开发

### 快速开始
1. 先用一个终端打开应用
```
./scripts/code.sh
```

2. 然后再开启一个终端开始监听文件变化
```
sudo npm run watch
```
这样就可以随时修改并刷新实现同步调试了.

如果不需要监听文件变化可以使用:
```
sudo npm run compile
```

### React 组件开发
修改 React 组件后需要重新编译：
```
npm run buildreact        # 手动编译
npm run buildreact:watch  # 监听模式自动编译
```

### 开发指南
1. **添加新功能**：
   - 在对应目录创建服务文件
   - 定义类型接口
   - 实现业务逻辑
   - 注册到 VSCode 服务系统

2. **调试技巧**：
   - 使用 VSCode 的调试工具
   - 查看控制台输出
   - 使用 React DevTools

3. **性能优化**：
   - 使用缓存机制
   - 异步处理
   - 增量更新

### 扩展开发
- **工具扩展**：支持 MCP 协议，可插拔工具系统
- **模型扩展**：多模型支持，自定义配置
- **UI 扩展**：React 组件化，可自定义主题

## 打包

### 完整打包流程
1. 先编译前端 React 代码
```
npm run buildreact
```

2. 再编译主程序
```
sudo npm run compile
```

3. 最后打包

#### 平台特定打包命令
**Mac**
- `npm run gulp vscode-darwin-arm64` - 最常见 (Apple Silicon)
- `npm run gulp vscode-darwin-x64` (Intel)

**Windows**
- `npm run gulp vscode-win32-x64` - 最常见
- `npm run gulp vscode-win32-arm64`

**Linux**
- `npm run gulp vscode-linux-x64` - 最常见
- `npm run gulp vscode-linux-arm64`

#### 一键打包
```
./build.sh
```

### 注意事项
- 打包前务必先执行 `npm run buildreact` 编译 React 组件
- 否则打包的应用将不包含最新的前端代码
