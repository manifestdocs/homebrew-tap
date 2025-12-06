class Rocketindex < Formula
  desc "Rocket-fast polyglot language server and code indexer"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.9"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.9/rocketindex-v0.1.0-beta.9-aarch64-apple-darwin.tar.gz"
      sha256 "9464e459a5ac0215c41beb318ce93dfec90174bbc4200ef69a873e71ab82f56d"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.9/rocketindex-v0.1.0-beta.9-x86_64-apple-darwin.tar.gz"
      sha256 "de32691399f70323f6b607705badd319adc21ed38a7b67b2f57488204e1d862e"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.9/rocketindex-v0.1.0-beta.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8fd0afa2e1435ed5172a4b72ee27350b197c3d107b2fa3a3a86716f1b3e8da8c"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
