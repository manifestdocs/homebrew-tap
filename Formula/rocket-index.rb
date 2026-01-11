class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.33"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.33/rocketindex-v0.1.0-beta.33-aarch64-apple-darwin.tar.gz"
      sha256 "f07482ab56cee0a4f51178e3b1f20920c336e5d29a0e5be17f1aeabb9e1d2487"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.33/rocketindex-v0.1.0-beta.33-x86_64-apple-darwin.tar.gz"
      sha256 "05a0bf19619523e9907ebd2944ec537e47a04dee17c52046fe537b10b421e3fe"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.33/rocketindex-v0.1.0-beta.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "79b0bef14e19db0eca00721a3387a899cca137c549c194bb43f70d7721d4f5f0"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
