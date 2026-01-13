class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.11/rmf-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "46a4ec4994b99f1ffa7db3fa159211e20addb96b81877b1ebcfc71193c106447"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.11/rmf-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "6ca3d180bb365db21fe79ee50ad679dc8951d77882267557010c23e9926afc9e"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.11/rmf-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7ba96eab3077d6015c3714ea0c3b57a0476afaf68463d7b14b8f91cc992cac20"
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
