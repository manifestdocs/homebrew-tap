class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.27"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.27/manifest-v0.1.27-aarch64-apple-darwin.tar.gz"
      sha256 "709476f1732b5e19a9f78d4e7e4a781d9f2896e84d27499e992f20e0a5b3cf72"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.27/manifest-v0.1.27-x86_64-apple-darwin.tar.gz"
      sha256 "603e3847181708f2b5fa377e7312138a29b417f4557ce4ad738ffcc04b9eb88d"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.27/manifest-v0.1.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c43efd08a3aa207951e99ccab048d1645016d254c7eabe96503e070c2d6f9c02"
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
