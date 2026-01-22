class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.30"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.30/manifest-v0.1.30-aarch64-apple-darwin.tar.gz"
      sha256 "bca39d792ecdf3e29d218cf88dc150d8ef8b2e6e4676a002cfdc3800cab49713"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.30/manifest-v0.1.30-x86_64-apple-darwin.tar.gz"
      sha256 "2aba03ef257a0a8dd86da530d61442f2e3a40544bdc804531382ede0a1e9eb94"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.30/manifest-v0.1.30-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d8b6005a3f6ee0505ac725c43a248e5a45be42cf00b83302d871949bdb5c081d"
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
