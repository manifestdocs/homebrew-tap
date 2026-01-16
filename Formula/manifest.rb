class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.16/mfst-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "3e17515401dc6f223e2c582de4204aa48ed783fc057faa8ea42a846f8a7e5bf6"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.16/mfst-v0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "692997cdfc9406f3025b8efc2b37b1ea6c7ac87d979589c16a509c0f17ea5fd8"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.16/mfst-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b13f085c0df472cfce50ee229c4824a403c5f02354cce66d515242457a47d803"
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
