class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.8/rmf-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "7d43d2fc5cb3d1436c9bf0736fd27ca9f62b2303cd221806375c4dec758dc9af"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.8/rmf-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "5ccb6d9e38711c8a64db7263adca105a91694faf98a8acee51e09416f6df9ff6"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.8/rmf-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "10e0ea3ec881d50f5e334660711c20dbcfb90d700fc7eebf941920b2ee42c394"
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
