class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.3.1/manifest-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "50073a05ffbc15911ba7f32ca92a1e7afd5554dcfbe34118349d343355f2f183"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.3.1/manifest-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "858a5e9ae22673c8a5516ff074bf1df78ef5b2117a595d203501b59f67d1163c"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.3.1/manifest-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1f6315301c4c68fd847e5ef9a223a0a0448170a4887676daae7fbd778bee2128"
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
