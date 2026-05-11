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
  version "0.3.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-darwin-arm64"
      sha256 "6926e370331cc9ed5d1243092b9b3baf5b0b6dd98f98c72976834a8afbd1b06a"
    end
    on_intel do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-darwin-x64"
      sha256 "73079099ddd89b70e3b988e0f863dc6b7c8cf4607df01b8b94c4bfce4bea5b83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-linux-arm64"
      sha256 "7aae703133e3bd4e23100f96d532ef95e4c0ef7b3c40ad9c59964dfd79cd7441"
    end
    on_intel do
      url "https://github.com/michael-ketzer/envstore.xyz/releases/download/v#{version}/envstore-linux-x64"
      sha256 "ce072b539513e897c4056069f55ccbde6079cb0fac0c14b3595ed5c8ac1e4b09"
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
