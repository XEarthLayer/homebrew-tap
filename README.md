# XEarthLayer Homebrew tap

Homebrew casks for [XEarthLayer](https://github.com/samsoir/xearthlayer), on-demand
satellite imagery streaming for X-Plane, on Apple Silicon Macs.

```bash
brew install --cask xearthlayer/tap/xearthlayer              # stable releases
brew install --cask xearthlayer/tap/xearthlayer@prerelease   # dev, alpha, beta and rc builds
```

The two casks conflict, so only one is installed at a time. Both depend on the
[`macfuse`](https://formulae.brew.sh/cask/macfuse) cask, which needs a one-time
approval in System Settings (and, on Apple Silicon, kernel extensions allowed in
Recovery); the steps are in XEarthLayer's
[macOS guide](https://github.com/samsoir/xearthlayer/blob/main/docs/macos.md).
After installing, run `xearthlayer setup`.

The binaries are signed with the project's Apple Developer ID and notarized, so
Homebrew's download quarantine is honoured without any extra step.

## How this tap is maintained

Nothing here is edited by hand. XEarthLayer's release workflow renders the cask
for each release from a template in the main repository
(`pkg/homebrew/`), with the published tarball's SHA-256, and pushes it here: a
pre-release tag updates `xearthlayer@prerelease`, a stable tag updates
`xearthlayer`. Every push is audited by this repository's own workflow
(`brew style`, `brew audit --strict --online`, and an install smoke test). To
report a problem with a cask, open an issue on the
[main repository](https://github.com/samsoir/xearthlayer/issues).
