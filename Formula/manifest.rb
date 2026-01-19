class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.26"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.26/manifest-v0.1.26-aarch64-apple-darwin.tar.gz"
      sha256 "b36ed57ee6366e9116f360062e87b29800014f85ec5f477dcde8a17c5d146b6c"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.26/manifest-v0.1.26-x86_64-apple-darwin.tar.gz"
      sha256 "d78e26eb7655c4f7940d74f2f0f58d8be124cc831246ea6af6cade0784114bde"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.26/manifest-v0.1.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f107d7191be79b162d82d577e18ae355f8e2f3c01764e828fbc9380c77721e37"
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
