class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.5.0/manifest-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "94d4caca1c1c49e962bd10db0247f36177fcd5af58f60c91dfc981775660a3ab"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.5.0/manifest-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "a524155e5ff13bc09a6c8b9b9139feaedbd66f9f1f421acb4677551f44009c89"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.5.0/manifest-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7b5e2de91b6ec3576e6c810611bb425f2c6384c396396f05ebe127841114138e"
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
