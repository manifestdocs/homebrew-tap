class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.16"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.16/rocketindex-v0.1.0-beta.16-aarch64-apple-darwin.tar.gz"
      sha256 "3268d71672a7b5dbba628164dcc735c4d9971db8f7e3f94efa34c659a9be287e"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.16/rocketindex-v0.1.0-beta.16-x86_64-apple-darwin.tar.gz"
      sha256 "6fc10d6f722704ac22b819b0b8993bcef545498f5a9e1f2aaa91db5cd657c5f0"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.16/rocketindex-v0.1.0-beta.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "81a2f0e0a810f4b6f5720c2f9052a16fd20c8d287d7da1d0043964774b98d28a"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
