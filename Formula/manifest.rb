class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.1.37"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.1.37/manifest-v0.1.37-aarch64-apple-darwin.tar.gz"
      sha256 "978c4f04c360ba793294267343aa0f6c732261487675cb83752b561e8fb7db8d"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.1.37/manifest-v0.1.37-x86_64-apple-darwin.tar.gz"
      sha256 "42efebdb137e13b52717adc3a29499e7e940b07427da3ae988554b391391bfb2"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.1.37/manifest-v0.1.37-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6f69f423e1af20264314f07ac475f708cc6380e47c7d4666e24c0ad142582974"
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
