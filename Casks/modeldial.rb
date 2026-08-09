cask "modeldial" do
  version "0.1.0,109,preview.10"
  sha256 "b03fcadc9e89104c162c18bbba836e2603de861db93db3e1cb159e6aaafd1372"

  url "https://github.com/tianwdong/modeldial/releases/download/v#{version.csv.first}-#{version.csv.third}/modeldial-#{version.csv.first}-#{version.csv.third}-macos-arm64.dmg",
      verified: "github.com/tianwdong/modeldial/"
  name "ModelDial"
  desc "Local-first AI coding model comparison and decision tool"
  homepage "https://modeldial.com/"

  livecheck do
    skip "Pinned unsigned preview; update manually from the verified release"
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "modeldial.app"

  # Keep this legacy postflight scoped to the installed app bundle only.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/modeldial.app"],
                   sudo: false
  end

  caveats <<~EOS
    This is ModelDial v0.1.0-preview.10, an unsigned and unnotarized preview.
    It has no Developer ID signature, Apple notarization, stapling, or Intel support.

    The DMG is the exact GitHub Release asset:
    https://github.com/tianwdong/modeldial/releases/tag/v0.1.0-preview.10
    SHA-256:
    b03fcadc9e89104c162c18bbba836e2603de861db93db3e1cb159e6aaafd1372

    The legacy postflight removes com.apple.quarantine recursively only from
    #{appdir}/modeldial.app. It uses no sudo, does not disable or change
    Gatekeeper, and does not modify any other path. If macOS still blocks the
    app, stop and recheck the release source instead of weakening system security.

    ModelDial includes its own Sparkle preview update channel. This Cask does
    not add a second updater. This preview is temporary and is not the stable
    v0.1.0 release.
  EOS
end
