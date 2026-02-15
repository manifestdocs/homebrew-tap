class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.4.5"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.5/manifest-v0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "cd2bead9c18269b97395b33869b71f887791a95a2a8b24fc7a84487ef518e9da"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.5/manifest-v0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "455cddcf09e2b43b26f3ea28d7adf5f3e7e39e17619b27291462c7a119fc9b16"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.4.5/manifest-v0.4.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "89596aab31a99ab7d48819b72cf27c5e75fff570ad837e9d673698962eb05863"
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
