# ModelDial Homebrew Tap

ModelDial 维护的个人 Homebrew Tap，当前只包含一个指向公开 GitHub Release
资产的 Cask。

> 当前 Cask 指向已验证的 `preview.13`。它保留 `preview.12` 的嵌套签名修复，
> 并加固全新用户首次启动、官方 Radar 优先刷新和损坏状态恢复；本版仍是
> unsigned／unnotarized 预览版，并非正式 stable 发行。

## 当前资产

- 版本：`0.1.0-preview.13`（Build 112）
- 平台：macOS Ventura（13）及更高版本，Apple Silicon（arm64）
- DMG：[`modeldial-0.1.0-preview.13-macos-arm64.dmg`](https://github.com/tianwdong/modeldial/releases/download/v0.1.0-preview.13/modeldial-0.1.0-preview.13-macos-arm64.dmg)
- SHA-256：`b64f38e2badf555fd54845f90fb88be6981f27eda38658187cf6885546b61651`
- 来源：GitHub Release [`v0.1.0-preview.13`](https://github.com/tianwdong/modeldial/releases/tag/v0.1.0-preview.13)

Cask 内部使用 `version "0.1.0,112,preview.13"`，分别对应 App marketing
version、build number 和 prerelease 标签；对外版本仍是
`v0.1.0-preview.13`。

这是临时预览版，不是 stable `v0.1.0`。该 DMG 只有 ad-hoc 签名，没有
Developer ID 签名、Apple notarization、stapling 或 Intel 支持。安装前请
确认下载地址与 SHA-256；macOS 仍可能要求在“系统设置 → 隐私与安全性 →
仍要打开”中人工确认。

## 安装

使用完整限定的一行命令安装：

```bash
brew install --cask tianwdong/tap/modeldial
```

完整限定的安装命令会自动添加并只信任所安装的 Cask，不需要先执行独立的
`brew tap`。本地候选已使用 Homebrew 6 在临时 App 目录完成安装、卸载、重装
和单 Cask trust 模拟。

ModelDial 自带 Sparkle 预览更新通道；Cask 不实现第二套更新器。

## postflight 的安全边界

为了兼容第三方 Tap 使用的 legacy Cask DSL，`Casks/modeldial.rb` 的
`postflight` 会在安装完成后执行一次等价于下面的命令：

```text
/usr/bin/xattr -dr com.apple.quarantine #{appdir}/modeldial.app
```

它只递归删除已安装 `#{appdir}/modeldial.app` 的
`com.apple.quarantine` 属性，不使用 `sudo`，不关闭或修改 Gatekeeper，
不触碰其他路径。该行为是此临时 unsigned preview 的明确安装边界，不应被
解读为系统安全检查已通过。

## 本地自检

```bash
ruby -c Casks/modeldial.rb
brew style Casks/modeldial.rb
# after the remote tap is registered
brew audit --cask --new modeldial
```

本地注册候选 Tap 后，Ruby 语法和 style 检查均通过。`brew audit --cask
--new` 只剩两项官方 `homebrew/cask` 收录门槛：当前资产是 GitHub prerelease，
且仓库尚未达到官方知名度阈值；这两项不影响个人 Tap 使用，但意味着当前
preview 不应被表述为官方 Cask。

公开远端安装验证覆盖了 Tap 自动添加、单 Cask trust、Release 下载及
SHA-256、临时目录安装、bundle 版本／build／arm64、ad-hoc 签名结构、
Sparkle feed／Ed25519 key、递归 quarantine 移除、卸载和重装。它不替代
App 实际启动或 Gatekeeper 干净机器验收；当前 preview Tap 与后续正式签名、
公证的 stable Cask 需要分别验收。
