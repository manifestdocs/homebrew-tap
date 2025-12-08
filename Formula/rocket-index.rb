class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.13"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.13/rocketindex-v0.1.0-beta.13-aarch64-apple-darwin.tar.gz"
      sha256 "08c84a52aeb79ff9b00fb558ad0561bd41a38474d27cd5641ae411cf06158595"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.13/rocketindex-v0.1.0-beta.13-x86_64-apple-darwin.tar.gz"
      sha256 "f013b70a2a80767216774248d8c116d6b992e072ab298530c329c8562874854a"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.13/rocketindex-v0.1.0-beta.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "35880c6659b354af1a9ee78ae17c774a4c7c6eab0bb34bf7e37c80e9ddccc0ba"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
