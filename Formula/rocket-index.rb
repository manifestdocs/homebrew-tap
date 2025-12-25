class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.25"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.25/rocketindex-v0.1.0-beta.25-aarch64-apple-darwin.tar.gz"
      sha256 "d6c047e2588e10096c250c3612347af5bcb343744f81d18763b02e2397262786"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.25/rocketindex-v0.1.0-beta.25-x86_64-apple-darwin.tar.gz"
      sha256 "4d3fdb756771d5b0986692041576d7e17d4a75e3f7ee17476feded2b8b7dce44"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.25/rocketindex-v0.1.0-beta.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c03a2b10bec4b2d3cf3d8dae709edb4b6ca1a0a20917253d2378e00ffe53b20d"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
