class RocketManifest < Formula
  desc "MCP server for living feature documentation"
  homepage "https://github.com/rocket-tycoon/rocket-manifest"
  license "BUSL-1.1"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.9/rmf-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "7d98abb38ed135621fa50bd1e0a2625be289ae04ff838a8965b375c4e8455091"
    end
    on_intel do
      url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.9/rmf-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "3a6f3b4b287e62b7f9ace9fee099858e2333953d0e9f5cad8385b0ac31dbd252"
    end
  end

  on_linux do
    url "https://github.com/rocket-tycoon/rocket-manifest/releases/download/v0.1.9/rmf-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4836a9914929581ccfa0d15d190261aa3219dede1053ac0a343145b206d76fea"
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
