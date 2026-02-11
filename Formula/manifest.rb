class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.1/manifest-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "e43bb4b4deece4639b33fa693cc923431474b92cbf5272cd333e8e8cfccacb2c"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.1/manifest-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "c831407c67de4bf6eac43ad31ea8156ceb69890b17af4211527035cf90d2e1eb"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.4.1/manifest-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "704b89b7ce4841a6a16eece53c9dd586ff250ec427956641df92fcb9a2850b74"
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
