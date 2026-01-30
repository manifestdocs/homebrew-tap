class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.1.36"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.1.36/manifest-v0.1.36-aarch64-apple-darwin.tar.gz"
      sha256 "16c025beabcb9317b9f12bcce76f2a32b7a92424213e2afbdbd9f3cd7b8b69ec"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.1.36/manifest-v0.1.36-x86_64-apple-darwin.tar.gz"
      sha256 "ae61667901cbd1c07fb9ede3d6296a751ef91b4e590c0e8b94fd982a7a9e39c2"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.1.36/manifest-v0.1.36-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f4ea0c6b4899e447296ab3dc3824b9fdf362d4982180f524d13ac87ba0e33c2f"
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
