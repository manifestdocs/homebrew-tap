class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.7/rmf-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "2d26adea0f5ec1355020625bae3d58ac62febb850a0a9f3fb65b8bf29c532e6b"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.7/rmf-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "64ae2f1179a352a6f1de8557334ea53ae7a68544da37a092dfc813550b3b872b"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.7/rmf-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6447d78a45a667375808d973112b01ff465f705b561a7b426890145c9f318695"
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
