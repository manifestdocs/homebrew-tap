cask "manifest" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.39"
  sha256 arm:   "PLACEHOLDER",
         intel: "PLACEHOLDER"

  url "https://github.com/manifestdocs/manifest/releases/download/v#{version}/Manifest-v#{version}-#{arch}.dmg"
  name "Manifest"
  desc "Living documentation for feature-driven product engineering"
  homepage "https://github.com/manifestdocs/manifest"

  depends_on macos: ">= :catalina"

  app "Manifest.app"

  zap trash: [
    "~/.local/share/manifest",
    "~/Library/Application Support/com.manifest.app",
    "~/Library/Caches/com.manifest.app",
    "~/Library/Preferences/com.manifest.app.plist",
  ]
end
