class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.28"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.28/manifest-v0.1.28-aarch64-apple-darwin.tar.gz"
      sha256 "1fcd24b1ba5b5011656571c6c328438bb1babc6bd3dc37d763162e7eec7767df"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.28/manifest-v0.1.28-x86_64-apple-darwin.tar.gz"
      sha256 "a56b85449dea6e6d2393782ba6fbbb81953200c1b0797d7088764199d30c46e0"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.28/manifest-v0.1.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2028705139ad9c8183599896454afcf079f46652404d69c80503fd0522d86218"
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
