class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.2/manifest-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "87e5b68ef5bfebe505fe127a9ada56c9bcc1314ae59bd33b763f86774c0aaa77"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.2/manifest-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "fd3b9955ac41a10868eb90188e4ba08d223b27b6e1eba6211f8664211cb39be4"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.4.2/manifest-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6f559447e561abefd55afa408a3114fbc1904c404fc42d32ce910d4847556a27"
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
