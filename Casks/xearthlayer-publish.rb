# Rendered by scripts/homebrew/render-cask.sh from a stable release; do not edit
# the copy in the tap by hand. The placeholders are 0.5.0, 194e3bb1db1d22101f246887760bf6b2d6a883a4b8ff51da5b84b4d33cb21f30, samsoir/xearthlayer.
cask "xearthlayer-publish" do
  version "0.5.0"
  sha256 "194e3bb1db1d22101f246887760bf6b2d6a883a4b8ff51da5b84b4d33cb21f30"

  url "https://github.com/samsoir/xearthlayer/releases/download/v#{version}/xearthlayer-publish-v#{version}-arm64-macos.tar.gz"
  name "XEarthLayer Publisher"
  desc "Builds XEarthLayer scenery packages from Ortho4XP output"
  homepage "https://github.com/samsoir/xearthlayer"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "xearthlayer-publish@prerelease"
  depends_on arch: :arm64
  depends_on macos: :monterey

  binary "xearthlayer-publish"

  caveats <<~EOS
    The publishing guide is in
      https://github.com/samsoir/xearthlayer/blob/main/docs/content-publishing.md
  EOS
end
