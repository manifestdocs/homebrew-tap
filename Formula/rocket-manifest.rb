class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.12/rmf-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "d4289099ff078fc65e347cbab23e96c70bdd20999dac1f8fb005b240d17376e1"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.12/rmf-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "04ed608bb70f3d9c169c86b7741c85eff22ea6b80796d0c5aa1b681992a652e4"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.12/rmf-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cb5d38df89716df70897ff9030806c40009ae6c23c9c84dba52d7da2d9ab688d"
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
