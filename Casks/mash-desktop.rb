cask "mash-desktop" do
  version "0.2.2"
  sha256 "556548f49c3f7706bbf0330721d99897257bc60a324bca9794db05bbe7ecab0a"

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
