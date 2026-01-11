class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.3/rmf-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "df5edab9f169a093bf3adbb95db9cd762e8b24faf09d08f5775f9dce9bcd0a6e"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.3/rmf-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "af0a775af7b5e52ab44c616918b514ef494dd7298dba6a404846b1ef6003ecef"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.3/rmf-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3d92ce0c6cf0299c12d16f8add23b699f8edf0e889c84930eda99dcd2463f077"
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
