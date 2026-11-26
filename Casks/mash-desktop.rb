cask "mash-desktop" do
  version "0.3.0"
  sha256 "2fd722060fd9d328fe351f2817035a67a18eeff62b45d6e079b97440f6624d88"

  url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-desktop-macos-arm64.dmg"
  name "Mash"
  desc "Search past coding-agent chats in a desktop app"
  homepage "https://getmash.io/"

  depends_on arch: :arm64
  depends_on :macos

  app "Mash.app"

  # Only the app's own files. Indexed history lives in ~/.mash, which the
  # command-line tools share, so uninstalling the app never removes it.
  zap trash: [
    "~/Library/Application Support/io.getmash.desktop",
    "~/Library/Caches/io.getmash.desktop",
    "~/Library/HTTPStorages/io.getmash.desktop",
    "~/Library/Preferences/io.getmash.desktop.plist",
    "~/Library/Saved Application State/io.getmash.desktop.savedState",
    "~/Library/WebKit/io.getmash.desktop",
  ]
end
