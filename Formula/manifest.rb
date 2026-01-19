class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.25"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.25/manifest-v0.1.25-aarch64-apple-darwin.tar.gz"
      sha256 "b01e8fc846acc337ba8e1f8853d31fbfed841141e451e58305dbde14b4a836a3"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.25/manifest-v0.1.25-x86_64-apple-darwin.tar.gz"
      sha256 "4799681c7dfb4f11bdc27b6c1050bec15408894c217c1cd20a2ab3477d54170a"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.25/manifest-v0.1.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "69c95c0458437c9323abf3e7fcc1f9f7b159540c461fdf91f590eda5a7862c98"
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
