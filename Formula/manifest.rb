class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.17"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.17/mfst-v0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "a9912404e463ded55418e2e5b1f48335f52e15f8459fd987881d98815ebd367c"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.17/mfst-v0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "d1ef17a55919e27153dab668ccdf1772bd4f809070e394d807e1b15972c2916f"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.17/mfst-v0.1.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b472205fdf6780666b58855b2e76f623d4053fd172da13f1c8e04f0c63b78dd7"
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
