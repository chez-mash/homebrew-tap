cask "mash-desktop" do
  version "0.2.4"
  sha256 "7b6ae1839406bb11af65fa72d41ce7e2061804c6c6d436b1578f08d402a041d7"

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
