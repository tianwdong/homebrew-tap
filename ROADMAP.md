# ModelDial Homebrew Tap Roadmap

最后更新：2026-08-09

## 当前状态

- [x] 建立独立 Tap 候选目录，不修改 ModelDial 主仓。
- [x] 添加最小 Cask，固定 `v0.1.0-preview.10` GitHub DMG 和 SHA-256。
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

- [ ] 经单独授权创建并公开 `tianwdong/homebrew-tap`。
- [ ] 从公开远端使用完整的一行命令重新安装，并复核 Cask URL 与 SHA-256。
- [ ] 远端命令验证成功后，再提交／发布 App README、Release 说明和官网入口。

## 后续正式版本

- [ ] 等待 Developer ID 签名、公证、stapling 和 Gatekeeper 干净机器验收。
- [ ] 使用同一正式 stable DMG、不可变 URL 和精确 SHA-256 更新 Cask。
- [ ] 在正式 stable 资产可用后完成 Homebrew 安装、卸载、重装和更新验收。

当前不创建 workflow/CI，不创建 Git 提交或远端发布。
