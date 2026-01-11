class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.1/rmf-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "849987a4a99bd4fbc938a9576e38451704a03375ad7939cdb45b48afb012f698"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.1/rmf-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "a4a44239786d014907bd3c56143f7cc6d12c5658220f04f39804bdb63a6a1aa1"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.1/rmf-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "417a748f401fb5c8c0774438b3d9c196a38397b7dc3bfb66e3186849e412a0d4"
  end

  def install
    bin.install "rmf"
  end

  service do
    run [opt_bin/"rmf", "serve"]
    keep_alive true
    working_dir var/"rocket-manifest"
    log_path var/"log/rocket-manifest.log"
    error_log_path var/"log/rocket-manifest.log"
  end

  def post_install
    (var/"rocket-manifest").mkpath
    (var/"log").mkpath
  end

  test do
    system "#{bin}/rmf", "--help"
  end
end
