class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.1.35"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.1.35/manifest-v0.1.35-aarch64-apple-darwin.tar.gz"
      sha256 "b473e7e29a1423efff865341674b6a26ed576ef57eaf2e4d033c3ad6efb0aa25"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.1.35/manifest-v0.1.35-x86_64-apple-darwin.tar.gz"
      sha256 "0b7844c281195b08fb1a7332a02d107f0836326190183b0c05107290eaae0b0d"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.1.35/manifest-v0.1.35-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "daca0943c8f334975183bb3fa0146696f3b3f5e9f46e1ab0dfb112ea286c213c"
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
