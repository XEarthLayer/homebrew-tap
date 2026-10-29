# Rendered by scripts/homebrew/render-cask.sh from a pre-release (dev, alpha,
# beta, rc); do not edit the copy in the tap by hand. The placeholders are
# 0.5.0-rc.3, f80383cb3a2a99eb5a8d005efd0aa60e9da25e3b6c879a278d2124ffcf43f08b, samsoir/xearthlayer.
cask "xearthlayer-publish@prerelease" do
  version "0.5.0-rc.3"
  sha256 "f80383cb3a2a99eb5a8d005efd0aa60e9da25e3b6c879a278d2124ffcf43f08b"

  url "https://github.com/samsoir/xearthlayer/releases/download/v#{version}/xearthlayer-publish-v#{version}-arm64-macos.tar.gz"
  name "XEarthLayer Publisher (pre-release)"
  desc "Builds XEarthLayer scenery packages from Ortho4XP output"
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

  conflicts_with cask: "xearthlayer-publish"
  depends_on arch: :arm64
  depends_on macos: :monterey

  binary "xearthlayer-publish"

  caveats <<~EOS
    This is the pre-release channel; it tracks every dev, alpha, beta and rc
    tag. For stable releases, install the `xearthlayer-publish` cask instead.

    The publishing guide is in
      https://github.com/samsoir/xearthlayer/blob/main/docs/content-publishing.md
  EOS
end
