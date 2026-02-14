class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.4.4"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.4/manifest-v0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "3fe7130aebf86846fa309b29d92825a5a393b3d9971ddcc2faae899e927e60a1"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.4/manifest-v0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "92fdc37d47aa136128e33fe837c7244e6fc471ea49ca48b9c3d0c51d59406eeb"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.4.4/manifest-v0.4.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "70001c68f97c4efcffdfcf9308d7b7d4923f4c7412e44a2201d898a93e6ca3d5"
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
