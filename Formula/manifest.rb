class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.18"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.18/mfst-v0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "5126a16941638d7800cb14d9edb83a1cf801b4959c27dcfe5ad422953c3b94b9"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.18/mfst-v0.1.18-x86_64-apple-darwin.tar.gz"
      sha256 "3e4562d4b11c1f55d9aa9955185976f6948c842430616996a3b5089395fa1a4f"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.18/mfst-v0.1.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "56e196565660068edf649b07ec00aa9a0ca7321179181f9f57748ae7715dcfc5"
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
