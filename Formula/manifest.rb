class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.21"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.21/manifest-v0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "2fad1ba6625e3559fbd10b3ae209c855b2adc2eb3e6302ef7c666a2668858229"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.21/manifest-v0.1.21-x86_64-apple-darwin.tar.gz"
      sha256 "32255810206043d4416f3854c7b2f0a070aba94fbc8bf6a20ca1f2263ea34885"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.21/manifest-v0.1.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eec58024fd7f33da8e1da6cf504e40552edd3432dbe9d9e565dff2f050c26af4"
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
