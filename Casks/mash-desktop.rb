cask "mash-desktop" do
  version "0.2.1"
  sha256 "067602589ea3710688d4ab954fb5bfa603e487604e23197491e1b7bd35c9a591"

  url "https://github.com/grep-stack/mash/releases/download/v#{version}/mash-desktop-macos-arm64.dmg"
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
