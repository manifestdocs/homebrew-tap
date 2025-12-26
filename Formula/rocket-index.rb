class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.31"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.31/rocketindex-v0.1.0-beta.31-aarch64-apple-darwin.tar.gz"
      sha256 "b6ea4d3ea9ee2750c1cf4fc2f58df9032b83783edd4f029f4a949f7af043ed28"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.31/rocketindex-v0.1.0-beta.31-x86_64-apple-darwin.tar.gz"
      sha256 "9f97091b5c2214002dea85419b103be64bdeae195ee7a66ed9d89caef33a0869"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.31/rocketindex-v0.1.0-beta.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "52102a84dbd4972efb179d6ccac893796bc6717f3b0149971178f7eb73b7500e"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
