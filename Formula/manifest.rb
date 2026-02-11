class Manifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/manifestdocs/manifest"
  license "BUSL-1.1"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.3.3/manifest-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "ac245474eb66185f1ae9b2fc5494134c60f5b3b9a8d9139f43df3753d3c349a7"
    end
    on_intel do
      url "https://github.com/manifestdocs/manifest/releases/download/v0.3.3/manifest-v0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "3096517618b272f98bcae802bc01f389419ab456a2e711ba212e4290d646373b"
    end
  end

  on_linux do
    url "https://github.com/manifestdocs/manifest/releases/download/v0.3.3/manifest-v0.3.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "df5ffc227946295bd3afa110f329d882902bf2e5817e9285672d49060a2196c6"
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
