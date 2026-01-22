class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.29"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.29/manifest-v0.1.29-aarch64-apple-darwin.tar.gz"
      sha256 "dfcc65b83d988bb252b443fab116b6d94b2d0346a41ea5846b6dc3fc3a2c8b4e"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.29/manifest-v0.1.29-x86_64-apple-darwin.tar.gz"
      sha256 "82320e1e7084b4720ee69a7a4eff85868b820d3ff1a8b33a421e61aadc937e98"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.29/manifest-v0.1.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "473f2eab19881201b115d5d1317ce8934ad769ae098feabc93e91dc10100c2ce"
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
