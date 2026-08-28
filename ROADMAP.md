# ModelDial Homebrew Tap Roadmap

最后更新：2026-08-28

## 当前状态

- [x] 建立独立 Tap 候选目录，不修改 ModelDial 主仓。
- [x] 添加最小 Cask，当前固定 `v0.1.0-preview.16` Build 115 GitHub DMG 和
  SHA-256。
- [x] 透明记录 unsigned/unnotarized、arm64、macOS Ventura+ 和 scoped
  `com.apple.quarantine` postflight 边界。
- [x] 添加 Apache-2.0、目录规则和本地自检说明。
- [x] 完成 `ruby -c Casks/modeldial.rb` 与 `brew style Casks/modeldial.rb`。
- [x] 本地注册候选 Tap 并运行 `brew audit --cask --new modeldial`；修复
  `verified` 与 `livecheck` 后，只剩 prerelease 和仓库知名度两项官方收录门槛。
- [x] 使用临时 App 目录完成 preview Cask 安装、quarantine、版本／架构、
  卸载和重新安装验收，不覆盖 `/Applications` 中的正式 App。
- [x] 使用 Homebrew 6 模拟完整限定命令，确认只 trust
  `tianwdong/tap/modeldial`，不 trust 整个 Tap，卸载后自动移除该 trust。

## 预览 Tap 发布

- [x] 经单独授权创建并公开 `tianwdong/homebrew-tap`，`main` 初始提交为
  `88f8f089cdd79fb6fcdb7cab5765db6076c3bd09`。
- [x] 从公开远端使用完整限定命令重新安装，并复核 Cask URL、DMG SHA-256、
  单 Cask trust、quarantine、版本／架构、卸载和重装。
- [x] 更新至 `v0.1.0-preview.11` 后完成 `ruby -c`、`brew style`、
  `brew audit --strict`、临时 App 目录安装及 Build 110／arm64／quarantine
  验收；Homebrew 6.0.15 的 `verified` 弃用已兼容。
- [x] 更新至 `v0.1.0-preview.13`／Build 112；Cask 固定公开 DMG
  SHA-256 `b64f38e2badf555fd54845f90fb88be6981f27eda38658187cf6885546b61651`。
  `ruby -c`、`brew style`、`brew audit --strict` 和两轮隔离目录安装／卸载／
  重装均通过；App 为 arm64／macOS 13+、深层签名有效且无 quarantine，
  Homebrew formula 清单在两轮测试前后保持一致。
- [x] 更新至 `v0.1.0-preview.16`／Build 115；Cask 固定公开 DMG
  SHA-256 `2ede98f19b1361c48c9cdc20687d2bf6eff92cebd163f7450b34219dd18c1640`，
  远端 Tap 提交为 `707272a17c49a923652ad962e54268077cda0e20`。
  `ruby -c`、`brew style` 和两轮隔离目录安装／卸载／重装均通过；App
  来源提交为 `1cba503bafad722e77a994c4d5341135f54d97ba`，Build 115／arm64、
  深层签名有效且无 quarantine。Homebrew formula／cask 清单恢复至测试前状态，
  `/Applications/modeldial.app` 保持 Build 114 未被覆盖。
- [x] 远端命令验证成功后，已提交并发布 App README、Release 说明和官网中英文入口。

## 后续正式版本

- [ ] 等待 Developer ID 签名、公证、stapling 和 Gatekeeper 干净机器验收。
- [ ] 使用同一正式 stable DMG、不可变 URL 和精确 SHA-256 更新 Cask。
- [ ] 在正式 stable 资产可用后完成 Homebrew 安装、卸载、重装和更新验收。

当前不创建 workflow/CI；Tap 已公开并完成 `preview.16` 远端验证，App
README、Release 说明和官网中英文入口均使用同一发布身份。正式 stable
Cask 仍以签名、公证和干净机器验收为前置门槛。
