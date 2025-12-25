class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.23"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.23/rocketindex-v0.1.0-beta.23-aarch64-apple-darwin.tar.gz"
      sha256 "6312d4f9b0c1d037171565742b2284c5bb9d4238f4432db0ec58b93a1b1634cb"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.23/rocketindex-v0.1.0-beta.23-x86_64-apple-darwin.tar.gz"
      sha256 "4be91736446f5740c092ba37e632922f3077583dda357667799b06e03d0b5a45"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.23/rocketindex-v0.1.0-beta.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "40e83584a7818efa42151ebc943a7b890999fabff1f4e0f1033ec32c52054fcd"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
