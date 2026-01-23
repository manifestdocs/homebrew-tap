class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.32"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.32/manifest-v0.1.32-aarch64-apple-darwin.tar.gz"
      sha256 "ed2f1b81bb1e4ff13b03a9588db9320add879386e4a77eb4de9c385a2cca1004"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.32/manifest-v0.1.32-x86_64-apple-darwin.tar.gz"
      sha256 "2a14862539d24a82def35b7716ab2cb93f0bc5bb74cdea20358ec61b211977a9"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.32/manifest-v0.1.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "db771b6853e1a2ce75e53b66bbc631f46f34b440f017a2c8b501686f90e9087a"
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
