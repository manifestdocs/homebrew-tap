class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.34"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.34/manifest-v0.1.34-aarch64-apple-darwin.tar.gz"
      sha256 "43e05186141867ca8c69f63fb0c9fed10c0371719ed44ecc32937010aad2ef4c"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.34/manifest-v0.1.34-x86_64-apple-darwin.tar.gz"
      sha256 "13044aaa82226f23d8cc1154c0f1e858018575553d9e04426f1bbbf54ea4ba2b"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.34/manifest-v0.1.34-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b64413c4aedb400d1c6ea0d8d0de8f4e0bcbc0409a093aa2ce3ef4a962241ff6"
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
