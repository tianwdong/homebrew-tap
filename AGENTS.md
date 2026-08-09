# Homebrew Tap instructions

This directory is the personal ModelDial Homebrew Tap candidate. Its scope is
limited to the Cask and the documentation that explains the pinned release.

## Boundaries

- Do not modify the ModelDial source repository, its private website, or any
  existing repository while working here.
- Do not add workflows, CI, installers, shell downloaders, or an independent
  updater. ModelDial owns in-app updates through Sparkle.
- The Cask must pin one immutable release URL and its exact SHA-256. Do not
  silently retarget a different asset.
- This candidate intentionally points at the unsigned/unnotarized
  `v0.1.0-preview.11` preview. Do not describe it as a stable release,
  Developer ID signed, notarized, or Gatekeeper-cleared package.

## Scoped postflight rule

The legacy `postflight` is deliberately limited to the installed app bundle:
`/usr/bin/xattr -dr com.apple.quarantine #{appdir}/modeldial.app`. It must not
use `sudo`, disable Gatekeeper, change system settings, or touch any path other
than that exact app bundle.

## Verification

Use static checks before any release action:

```bash
ruby -c Casks/modeldial.rb
brew style Casks/modeldial.rb
# Once this directory is registered as a tap:
brew audit --cask --new modeldial
```

Homebrew 6 does not accept an unregistered local Cask path for `brew audit`;
that audit remains pending until the tap is registered.

Do not run a real install from this candidate unless the user explicitly asks
for installation testing. Creating or publishing a remote tap, GitHub release,
or pull request is a separate authorization boundary.
