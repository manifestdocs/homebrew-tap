class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.31"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.31/manifest-v0.1.31-aarch64-apple-darwin.tar.gz"
      sha256 "a09916d3d3fe37fdfc60cbb1b797efafad5105ba56802d87982e9c643b1688d2"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.31/manifest-v0.1.31-x86_64-apple-darwin.tar.gz"
      sha256 "4baf79068d67a7956a4ba202f3da2682012ccef84a6df32281638721140bab9e"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.31/manifest-v0.1.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eebf72110e30d91a5b685e3f2e7305ea1ae163d906e2d6338e251ec4d905fc99"
  end

  def install
    bin.install "manifest"
  end

  service do
    run [opt_bin/"manifest", "serve"]
    keep_alive true
    working_dir var/"manifest"
    log_path var/"log/manifest.log"
    error_log_path var/"log/manifest.log"
  end

  def post_install
    (var/"manifest").mkpath
    (var/"log").mkpath
  end

  test do
    system "#{bin}/manifest", "--help"
  end
end
