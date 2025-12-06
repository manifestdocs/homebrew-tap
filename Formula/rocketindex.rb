class Rocketindex < Formula
  desc "Rocket-fast polyglot language server and code indexer"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.10"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.10/rocketindex-v0.1.0-beta.10-aarch64-apple-darwin.tar.gz"
      sha256 "ff24ca4876227ce6f767104d9672fc8f4ccedbf977ee0e150e08245de5cc4e08"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.10/rocketindex-v0.1.0-beta.10-x86_64-apple-darwin.tar.gz"
      sha256 "481cc5acedc7e5eea836a73bdf1baad0061acbf0db498dcb4df036ea6a07255c"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.10/rocketindex-v0.1.0-beta.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "996a0a109f9a097ba3ca723b6a5298740ba8d6767093a33e799e6ac2046baa15"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
