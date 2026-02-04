class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.2.0/manifest-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2bb04b3d2d5e397aa21bc00316e04b69fa07345a0a0025e81c53f417ca036726"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.2.0/manifest-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "c302bb765757cf02ac76e8369b21b368bdabbb56e774ac207a8e8cd76bb852f5"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.2.0/manifest-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c482e408743cd165370f98a5998bcea289c79cf4332fa3d6f742017dd110ec56"
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
