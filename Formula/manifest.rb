class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.0/manifest-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "dba7b6096dab09da6c50440e673430db0978dae28e219e164187a721daea0390"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.0/manifest-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "7cce8a63c357b658eea62c5d5623a5d01a101dbee401c70dcf31f7db46e427bb"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.4.0/manifest-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0983a398a384002d9ef03c2e9f4a65984be6eb837c380e77603b12ff833ff870"
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
