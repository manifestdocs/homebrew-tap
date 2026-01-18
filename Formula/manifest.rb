class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.20"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.20/manifest-v0.1.20-aarch64-apple-darwin.tar.gz"
      sha256 "aa3c8c4752f6ea915fc73604c8ea5e886dbdd6f964bd7eae7f2b44c867075968"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.20/manifest-v0.1.20-x86_64-apple-darwin.tar.gz"
      sha256 "8c0f70e028fdbf53fca2764a1d5736e112177fe8d02db62737901809832a5faf"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.20/manifest-v0.1.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f1e2bb2e8dd4b380d7cd3a621e9392653e3c414bc3ece5409a5dd0ec804dbdb2"
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
