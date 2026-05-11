# envstore Homebrew formula
#
# Lives at: github.com/michael-ketzer/homebrew-envstore/Formula/envstore.rb
# Install:  brew tap michael-ketzer/envstore && brew install envstore
#
# Update procedure on each release:
#   1. Replace VERSION with the new tag (without the "v" prefix)
#   2. Update each `sha256` from the .sha256 file attached to the GitHub release
#      (the release workflow generates these automatically)
#   3. Commit and push to michael-ketzer/homebrew-envstore
#
# Users running `brew upgrade envstore` will pick up the new version
# automatically; they don't need to re-tap.

class Envstore < Formula
  desc "Zero-knowledge encrypted .env file storage"
  homepage "https://envstore.xyz"
  version "0.4.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-darwin-arm64"
      sha256 "0b89c1f87bbeb6003aae34b2c336d3badee98ab14a34aee5bee1d98e1695a704"
    end
    on_intel do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-darwin-x64"
      sha256 "10255f6266e45c88ff759ca680cae03a283576dc141f478213c468ecd05427e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-linux-arm64"
      sha256 "fd63926d5fdbe119c4d1cfe6adf244ea44aeaec3820be30cd4113a227377c24c"
    end
    on_intel do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-linux-x64"
      sha256 "e89f26bb64a35abae52e2066665d3cc1d2eb7e7dfed55ccfbe316859eb4b1078"
    end
  end

  def install
    asset_name =
      if OS.mac? && Hardware::CPU.arm?
        "envstore-darwin-arm64"
      elsif OS.mac?
        "envstore-darwin-x64"
      elsif OS.linux? && Hardware::CPU.arm?
        "envstore-linux-arm64"
      else
        "envstore-linux-x64"
      end

    bin.install asset_name => "envstore"
  end

  test do
    assert_match(/envstore/, shell_output("#{bin}/envstore --version"))
  end
end
