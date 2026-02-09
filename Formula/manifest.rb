class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.3.0/manifest-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "da130bd8484e8f78a5d299160640c89890ad687874e64338934a60d6f946143e"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.3.0/manifest-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "d6f0ce0fa79022262720cc765280f3a96d94fe45a6e42f92233add5cc54e2c96"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.3.0/manifest-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9cbd83672654c594313049f4d5bdc264fdf44b264cf73b0b3f14748f94e9f02b"
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
