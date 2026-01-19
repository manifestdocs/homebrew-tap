class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.23"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.23/manifest-v0.1.23-aarch64-apple-darwin.tar.gz"
      sha256 "8822ab001ec5172cd7f514f6a7970cae66797aa1dbb8154661c408fcfa4bdaf4"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.23/manifest-v0.1.23-x86_64-apple-darwin.tar.gz"
      sha256 "5bd18fbfb2c6b6d959c1175f6b03a543b071f07eb59eecaf5f11c424243d34ba"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.23/manifest-v0.1.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9a4d303000dfc014f3d52e6665c6ec35e963d708e0d9c2e83b6481fdaba2b13d"
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
