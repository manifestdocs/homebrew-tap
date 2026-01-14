class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.13/rmf-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "e5422eb52b525838a9354068ad6c44e270e9151c6375e5aa22a61fb4547182e4"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.13/rmf-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "4bc70cb3991c20ed58b924e1daaabee087d3e4a3d1d982e97a2395ed7b6df3dd"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.13/rmf-v0.1.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d834e3d684f615bc7c3b4586a541af17ddad91562fb3a9e44b10d39b6134cc5e"
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
