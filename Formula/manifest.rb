class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.3.2/manifest-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "ca0ebf2d87e569368d0ffa8d74e535b766087255598e778fd1b6aaf6791bbdc7"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.3.2/manifest-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "ab413f1891803145fb5402582e1128799ea9dbbf315550e63d642944f27df917"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.3.2/manifest-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f36159c8314c4d78057b3124a1452bab051d0a2dfbbdec671c413e01d81ba09a"
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
