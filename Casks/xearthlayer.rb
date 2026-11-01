# Rendered by scripts/homebrew/render-cask.sh from a stable release; do not edit
# the copy in the tap by hand. The placeholders are 0.5.0, 372a54acc4a2bd41ebc3315d6102ecc0a2880ad0b9b8c4b8c6714bf2486e60c3, samsoir/xearthlayer.
cask "xearthlayer" do
  version "0.5.0"
  sha256 "372a54acc4a2bd41ebc3315d6102ecc0a2880ad0b9b8c4b8c6714bf2486e60c3"

  url "https://github.com/samsoir/xearthlayer/releases/download/v#{version}/xearthlayer-v#{version}-arm64-macos.tar.gz"
  name "XEarthLayer"
  desc "On-demand satellite imagery streaming for X-Plane"
  homepage "https://github.com/samsoir/xearthlayer"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "xearthlayer@prerelease"
  depends_on arch: :arm64
  depends_on cask: "macfuse"
  depends_on macos: :monterey

  binary "xearthlayer"

  zap trash: [
    "~/Library/Application Support/XEarthLayer",
    "~/Library/Caches/XEarthLayer",
    "~/Library/Logs/XEarthLayer",
  ]

  caveats <<~EOS
    macFUSE needs a one-time approval in System Settings, and on Apple Silicon
    kernel extensions must first be allowed in Recovery. The steps are in
      https://github.com/samsoir/xearthlayer/blob/main/docs/macos.md
    Then run `xearthlayer setup`.
  EOS
end
