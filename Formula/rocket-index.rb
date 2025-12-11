class RocketIndex < Formula
  desc "Rocket-fast polyglot code indexer for AI coding agents"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.20"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.20/rocketindex-v0.1.0-beta.20-aarch64-apple-darwin.tar.gz"
      sha256 "7241607ca570b9a6244fa3fa876e20c8edb1e550e1df559890b5f687192c295b"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.20/rocketindex-v0.1.0-beta.20-x86_64-apple-darwin.tar.gz"
      sha256 "d60162649158de401c433ba683c3d42175f2ab10dab9740affcb0dacd0416367"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.20/rocketindex-v0.1.0-beta.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "632a6fe1e8914a5282bfa4088204f74e2fc638c76016fdbdb7f6d5fc2fefc535"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
