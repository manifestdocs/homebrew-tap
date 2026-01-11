class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.2/rmf-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "d98defae4969903a8de419b1533135ca560d99700402fe3ca222d9d27bd3b197"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.2/rmf-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "859e38943e007b52a6eaf1b53433358e5234172fe5137b5181d68e6f0bad53cb"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.2/rmf-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "413c6bd08b3b370b27dbae17b4b9d1fd68a769fcdce48252b1da5b59257e063f"
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
