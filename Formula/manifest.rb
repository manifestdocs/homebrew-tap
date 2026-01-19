class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/manifest"
  license "BUSL-1.1"
  version "0.1.24"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.24/manifest-v0.1.24-aarch64-apple-darwin.tar.gz"
      sha256 "34a3982b592f18e8eb3f908bef8ce540639a0f104932d65f7ca77646b5645feb"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.24/manifest-v0.1.24-x86_64-apple-darwin.tar.gz"
      sha256 "98f52c0b9081799008a417080b6d01b02586dbec8857b25cfed9a439601f6b7c"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/manifest/releases/download/v0.1.24/manifest-v0.1.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ba602fd2809f96a8bdc216622fcbab54a83c2313d0252561234e2bcc59de59e5"
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
