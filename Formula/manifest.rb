class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.33"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.33/manifest-v0.1.33-aarch64-apple-darwin.tar.gz"
      sha256 "2e73a933aa23347e4d568860802ff8e29f15078333f3eb6298c58e2641bc66ed"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.33/manifest-v0.1.33-x86_64-apple-darwin.tar.gz"
      sha256 "aa0e747060e92db7348c5bdfa6b70945b96e859ae34523bc7a89395109bb9beb"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.33/manifest-v0.1.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4107f3646e783c9f950f2eaa23885b07684a5dce0b51659bc60318cfdb68ba85"
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
