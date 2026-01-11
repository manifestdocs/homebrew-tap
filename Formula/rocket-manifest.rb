class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.6/rmf-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "a369b1af4d414ed161fc0bc870bac8cb96412caf52439e31d58183999584043f"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.6/rmf-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "67fe3bedf2e34f2dbf2f8b67617ba9efa7549f9cbeac8310118927de5c77ecd9"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.6/rmf-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2441c082bacc5f59a4e489a898fc3ec1e7110ebebb5ecb17f2fba78cedae38f1"
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
