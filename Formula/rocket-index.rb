class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.27"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.27/rocketindex-v0.1.0-beta.27-aarch64-apple-darwin.tar.gz"
      sha256 "c1a72d569143f3d9c763296e8a66f5cac4413403a6bd608c383f78a87d40e3cf"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.27/rocketindex-v0.1.0-beta.27-x86_64-apple-darwin.tar.gz"
      sha256 "b3efeab3d6d31cb095b5e910829bb7a39416166deefa1bcbd6fe2d1144197a8b"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.27/rocketindex-v0.1.0-beta.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ba6f748be0b51a3e7b6ca4ec9c07d82bf1809cd17184f603040c950bdeaa17c7"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
