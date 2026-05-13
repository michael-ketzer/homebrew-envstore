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
  version "0.8.4"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-darwin-arm64"
      sha256 "62733676b15ba0188093b7f9e7e399b5c951c68a3d3092b2931280b991d7e6da"
    end
    on_intel do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-darwin-x64"
      sha256 "3a888f4c846bce50ac7fa164f956459df218ce589ee6fc61722be7d027ec0daf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-linux-arm64"
      sha256 "8b521fd559f7523f5cdb50405a5ebe713b19535221730d42a4275fd3aef0f9bb"
    end
    on_intel do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-linux-x64"
      sha256 "e3d94ecfb3d0959d496d33b0cf18159e1fe7a8b17d7b0139936c2bb2b5a80454"
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
