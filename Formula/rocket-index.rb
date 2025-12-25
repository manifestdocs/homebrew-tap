class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.22"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.22/rocketindex-v0.1.0-beta.22-aarch64-apple-darwin.tar.gz"
      sha256 "41464689be1e7eb3a1c2df04e73ee8a1277c084bfe609bb14803e71548710591"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.22/rocketindex-v0.1.0-beta.22-x86_64-apple-darwin.tar.gz"
      sha256 "29ee6d0caf2f2cc8626fe971791922b6441105848af1a78b39da2c854d954a59"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.22/rocketindex-v0.1.0-beta.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "00a2808141e7d778723a905da94b511d2046c4fe317a6bf7e86cf6dbdaf28b64"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
