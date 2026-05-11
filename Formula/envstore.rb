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
  version "0.2.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-darwin-arm64"
      sha256 "a34399c8155227a4f1c159931b321012b06cbd2e66a60a774e3a98ce57aca629"
    end
    on_intel do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-darwin-x64"
      sha256 "8e052b2fc9bb7dd2cf00bdd5078f6560f092bc959f9bdccf425258a4347ec635"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-linux-arm64"
      sha256 "9613d3b8979175bd9f2103458a15e3a08455d0086db7aa9389e4cc03ad8888e1"
    end
    on_intel do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-linux-x64"
      sha256 "94f7f6fd961f064442d741943fde79f60ce045336a3febdd5ca24835e50939e9"
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
