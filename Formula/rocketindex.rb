class Rocketindex < Formula
  desc "Rocket-fast polyglot language server and code indexer"
  homepage "https://github.com/rocket-tycoon/rocket-index"
  license "MIT"
  version "0.1.0-beta.12"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.12/rocketindex-v0.1.0-beta.12-aarch64-apple-darwin.tar.gz"
      sha256 "2e1fb68803b32affb5bc724f16c492c3eb244f6ec3dbd8bcf6330c3e1c3175ba"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.12/rocketindex-v0.1.0-beta.12-x86_64-apple-darwin.tar.gz"
      sha256 "ed29957743bfcdd0ef8b0e0d6186fc5a52d6ea2c8ffa203d09cc367a19384b93"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-index/releases/download/v0.1.0-beta.12/rocketindex-v0.1.0-beta.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b0b70e711c094e7518bb3d8f4c3887e30fdcc8a261fbe192c79aec6a1d5afa80"
  end

  def install
    bin.install "rkt"
    bin.install "rocketindex-lsp"
  end

  test do
    system "#{bin}/rkt", "--version"
  end
end
