class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.22"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.22/manifest-v0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "0094346b2249b7c26bc7cb4ad731632825c7429d21e830c591f556a3926ff6c7"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.22/manifest-v0.1.22-x86_64-apple-darwin.tar.gz"
      sha256 "62ae7cd37677295e67bd0238ba74f564665fc0930bfff50c10dc7ab4a0f7540e"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.22/manifest-v0.1.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bb8540fa938a04cace4d090ef32d4c00ec600aec559035d2ca073aed8fd7d9a4"
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
