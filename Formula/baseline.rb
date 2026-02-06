class Baseline < Formula
  desc "Strongly typed, effect-based programming language"
  homepage "https://github.com/manifestdocs/baseline"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/manifestdocs/baseline/releases/download/v0.1.0/blc-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "a6d1478b6ab8eb79641b8343f8491262d9c4e97fc1cf67a5f4884d6e453d987a"
    end
  end

  def install
    bin.install "blc"
  end

  test do
    system "#{bin}/blc", "--version"
  end
end
