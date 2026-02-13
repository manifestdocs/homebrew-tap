class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.3/manifest-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "9ccabad2a5949cac1847a2b136f83ace2c76367c80a5b7c7df8657f706da8dcc"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.4.3/manifest-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "79338f151f515dcd6e5c6ad7973ad19c4539aaa470c03f7ed1fba2bf611c25e8"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.4.3/manifest-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ee770f93c0f8f90d461043c6108914bfeda8f35aa9ce7da9fdde9ebe7943a915"
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
