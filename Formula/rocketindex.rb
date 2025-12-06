class Rocketindex < Formula
  desc "Rocket-fast polyglot language server and code indexer"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.8"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.8/rocketindex-v0.1.0-beta.8-aarch64-apple-darwin.tar.gz"
      sha256 "b18f041a7584caf9fe7fe86754e7aceebd67e18474807657650e8d7667bb439b"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.8/rocketindex-v0.1.0-beta.8-x86_64-apple-darwin.tar.gz"
      sha256 "12424eb8744719d93bea2caf099e83e0df489b5bc9ae74a4709a02e2b8f6665e"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.8/rocketindex-v0.1.0-beta.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f71822f302b696e570a64e27cbda117ecdbbe4e0562d38e9a53508de0f150f7a"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
