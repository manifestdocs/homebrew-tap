class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.1.38"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.1.38/manifest-v0.1.38-aarch64-apple-darwin.tar.gz"
      sha256 "46ce0932bc314a6216c32eb042d1919226b8651c334dfd7792a6aba67083f178"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.1.38/manifest-v0.1.38-x86_64-apple-darwin.tar.gz"
      sha256 "bb599e9b2b4f4e2fcc7a7133750a99c4d67ab17495bd2f7b6dfc4870fcceb8e0"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.1.38/manifest-v0.1.38-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "92c85865b2279cf1b6a506fc211e8795612b6373ee92ae2f9b93a1820ccf8290"
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
