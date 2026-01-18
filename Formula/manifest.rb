class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.19"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.19/mfst-v0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "86e841f1edba2492584b732a3f79759ce2d5e1c7cea8735c589e1bbdaf3fb902"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.19/mfst-v0.1.19-x86_64-apple-darwin.tar.gz"
      sha256 "65a1c1e5c3f8fe4b253bc4303a77839cb8658ae789b7e810253317610fafbd90"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.19/mfst-v0.1.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "59a3810737d05a4438f7ad91e80e10da82cd55c66d902747272ace53ec57f01e"
  end

  def install
    bin.install "mfst"
  end

  service do
    run [opt_bin/"mfst", "serve"]
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
    system "#{bin}/mfst", "--help"
  end
end
