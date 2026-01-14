class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.14/mfst-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "5a1c13787857e9c3824ac60a4a2da2b1c97dcb1d11924a6fa9481df96f767db1"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.14/mfst-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "fc84585ea3869dcbd49d905b04cd9ae859617fc6db57419c32d95e02685695aa"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.14/mfst-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d91ebf5cdfdb93e9594b7239c53da8d7bdd4495b9b99461e75740ec88b85b3c3"
  end

  def install
    bin.install "mfst"
  end

  service do
    run [opt_bin/"mfst", "serve"]
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
    system "#{bin}/mfst", "--help"
  end
end
