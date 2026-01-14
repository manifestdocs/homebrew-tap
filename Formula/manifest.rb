class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.15/mfst-v0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "175e963fc1332d508164bc2cace7fba4c20c3b76bc37ee64c33e4bf45db4fb23"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.15/mfst-v0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "7ae0cd296281d21e9255280f5cbabdff33565e85173adf35e7e752a27f36d215"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.15/mfst-v0.1.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c7eddec9854493ead0e06bce574969586cd399a96ef2ae206a2fc0ed788e9ff6"
  end

  def install
    bin.install "mfst"
  end

  service do
    run [opt_bin/"mfst", "serve"]
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
    system "#{bin}/mfst", "--help"
  end
end
