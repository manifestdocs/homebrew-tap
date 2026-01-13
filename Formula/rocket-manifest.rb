class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.10/rmf-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "79884c858f1a3d471bafd5a7fd5393aa23fcbff4ac8f6ff4aaaff7147f548cc1"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.10/rmf-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "2afec850e9d5033c7e4963cec891e2285d490e884334cf632a3b918c96ca80d7"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.10/rmf-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7255b21a4637195ec5ffc379c3d4aa0d2ffc9699773e859d7ca2792f967a7cdc"
  end

  def install
    bin.install "rmf"
  end

  service do
    run [opt_bin/"rmf", "serve"]
    keep_alive true
    working_dir var/"rocket-manifest"
    log_path var/"log/rocket-manifest.log"
    error_log_path var/"log/rocket-manifest.log"
  end

  def post_install
    (var/"rocket-manifest").mkpath
    (var/"log").mkpath
  end

  test do
    system "#{bin}/rmf", "--help"
  end
end
