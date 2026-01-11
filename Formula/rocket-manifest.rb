class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.0/rmf-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "e8363e0e02401f2ae8245c346e22ad9fe418a3cadac8fb7d0126749f31b1b9f4"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.0/rmf-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8d962c55ea80afbab551ae96ed2d6fd5cc44bf03afd8d663a5c828aeb8f10c2b"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.0/rmf-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e10eb256dc7360c317ecffaad4e55e51dc075e9bc0a1ad1aad6ae1eaf764542d"
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
