class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.4/rmf-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "44de6ffda54a1923a9a88a552470f7d487d65c0933e395a55fa999fd1ced54ff"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.4/rmf-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "fa9dcfd78765d7ded00c78781f0839fcf96870991ddbb96d56aeadab98ee1711"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.4/rmf-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ce36861e0e03cee974606a9ac70406ab13cf2d70ced7ce0f89b0b421582b997d"
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
