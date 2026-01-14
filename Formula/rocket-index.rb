class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.35"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.35/rocketindex-v0.1.0-beta.35-aarch64-apple-darwin.tar.gz"
      sha256 "48332224b006d0f4f6cbd1037d01b6a052692ecedde5db3699f13e7c5f23f57f"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.35/rocketindex-v0.1.0-beta.35-x86_64-apple-darwin.tar.gz"
      sha256 "2625493d7543d9f428e82a6fffe5ad5c46258ce9e0779cddc810d09051270cc5"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.35/rocketindex-v0.1.0-beta.35-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6acebb5b8b6c26028c47a1e0e0b2ea5c9ac98e6025d5a03926a06c36eca9161f"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
