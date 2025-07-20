# Welcome to Void.

<div align="center">
	<img
		src="./src/vs/workbench/browser/parts/editor/media/slice_of_void.png"
	 	alt="Void Welcome"
		width="300"
	 	height="300"
	/>
</div>

Void is the open-source Cursor alternative.

Use AI agents on your codebase, checkpoint and visualize changes, and bring any model or host locally. Void sends messages directly to providers without retaining your data.

This repo contains the full sourcecode for Void. If you're new, welcome!

- 🧭 [Website](https://voideditor.com)

- 👋 [Discord](https://discord.gg/RSNjgaugJs)

- 🚙 [Project Board](https://github.com/orgs/voideditor/projects/2)


## Contributing

1. To get started working on Void, check out our Project Board! You can also see [HOW_TO_CONTRIBUTE](https://github.com/voideditor/void/blob/main/HOW_TO_CONTRIBUTE.md).

2. Feel free to attend a casual weekly meeting in our Discord channel!


## Reference

Void is a fork of the [vscode](https://github.com/microsoft/vscode) repository. For a guide to the codebase, see [VOID_CODEBASE_GUIDE](https://github.com/voideditor/void/blob/main/VOID_CODEBASE_GUIDE.md).

## Support
You can always reach us in our Discord server or contact us via email: hello@voideditor.com.


## 开发

1. 先用一个终端打开应用
```
./scripts/code.sh
```

2. 然后再开启一个终端开始监听文件变化
```
sudo npm run watch
```

这样就可以随时修改并刷新实现同步调试了.

## 打包

1. 先编译
```
sudo npm run compile
```
2. 再打包
Mac
`npm run gulp vscode-darwin-arm64` - most common (Apple Silicon)
`npm run gulp vscode-darwin-x64` (Intel)

Windows
`npm run gulp vscode-win32-x64` - most common
`npm run gulp vscode-win32-arm64`

Linux
`npm run gulp vscode-linux-x64` - most common
`npm run gulp vscode-linux-arm64`

或者使用一键打包:
```
./build.sh
```
