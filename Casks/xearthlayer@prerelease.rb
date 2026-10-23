# Rendered by scripts/homebrew/render-cask.sh from a pre-release (dev, alpha,
# beta, rc); do not edit the copy in the tap by hand. The placeholders are
# 0.5.0-alpha.2, 123e0f0a9526c6874bb7a711a20369afbb321e6947cca3bb36c67ab525eb7ef8, samsoir/xearthlayer.
cask "xearthlayer@prerelease" do
  version "0.5.0-alpha.2"
  sha256 "123e0f0a9526c6874bb7a711a20369afbb321e6947cca3bb36c67ab525eb7ef8"

  url "https://github.com/samsoir/xearthlayer/releases/download/v#{version}/xearthlayer-v#{version}-arm64-macos.tar.gz"
  name "XEarthLayer (pre-release)"
  desc "On-demand satellite imagery streaming for X-Plane"
  homepage "https://github.com/samsoir/xearthlayer"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+-(?:dev|alpha|beta|rc)\.\d+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  conflicts_with cask: "xearthlayer"
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
    This is the pre-release channel; it tracks every dev, alpha, beta and rc
    tag. For stable releases, install the `xearthlayer` cask instead.

    macFUSE needs a one-time approval in System Settings, and on Apple Silicon
    kernel extensions must first be allowed in Recovery. The steps are in
      https://github.com/samsoir/xearthlayer/blob/main/docs/macos.md
    Then run `xearthlayer setup`.
  EOS
end
