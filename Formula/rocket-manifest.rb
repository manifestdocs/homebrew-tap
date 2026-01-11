class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.5/rmf-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "e2329dc34390ccafccbaa273c1549bd08093a4a1b167f616e96468fae68ffbf9"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.5/rmf-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "cbe6fb17dac254d7755680d32b3084fb3cf9bc4d0dfdb2cb34adec98a2bb5a5f"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.5/rmf-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0c04170d96c4db464252e7069c0fc89cfd753d01889b733240e389a91d42f4b1"
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
