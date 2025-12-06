class Rocketindex < Formula
  desc "Rocket-fast polyglot language server and code indexer"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.4"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.4/rocketindex-v0.1.0-beta.4-aarch64-apple-darwin.tar.gz"
      sha256 "d1e6be2a41205f7a20c2ccbd01c32487d2d6ebf4c1e059e846b2b929fec772b5"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.4/rocketindex-v0.1.0-beta.4-x86_64-apple-darwin.tar.gz"
      sha256 "9c96309fc37df465e89c9d5831a0d391da130fe8ea10c86c1f2f14a3cf3dae70"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.4/rocketindex-v0.1.0-beta.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "86dc8bb36ed2810ae4366d5498888aa18f6fbe48cf247410ccdb84e10c6136eb"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
