class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.32"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.32/rocketindex-v0.1.0-beta.32-aarch64-apple-darwin.tar.gz"
      sha256 "44c2217d9094ea1433a9cb14de41fc6d76da93789001039ad5c7074cf1bd63ac"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.32/rocketindex-v0.1.0-beta.32-x86_64-apple-darwin.tar.gz"
      sha256 "ebce040387ee6f7316c1de460c5bd9333b279fd05327269b252db435d6bc6ec2"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.32/rocketindex-v0.1.0-beta.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "70ca395ade31e9b15201ea2587bf468ea7f2b3a5b24139dd62916c3f5348346b"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
