class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.15"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.15/rocketindex-v0.1.0-beta.15-aarch64-apple-darwin.tar.gz"
      sha256 "b917bfb03656f0b4c4b21401e68a4a4efa692c76ca746f09c81eebbea18257a2"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.15/rocketindex-v0.1.0-beta.15-x86_64-apple-darwin.tar.gz"
      sha256 "07b113bdcf95ec7105662ec826b1ebcbfa41f62999b2f836897c5eb7c469147f"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.15/rocketindex-v0.1.0-beta.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "13855ad3385f01da592b8ea2228f8313dedae09ac0d779099a55a6296a0daa65"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
