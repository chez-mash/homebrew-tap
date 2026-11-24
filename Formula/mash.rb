class Mash < Formula
  desc "Search past coding-agent chats from your browser, terminal, or agents"
  homepage "https://github.com/grep-stack/mash"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/grep-stack/mash/releases/download/v#{version}/mash-aarch64-apple-darwin.tar.gz"
      sha256 "921cbc31936a61d6bca4604962dfa1aa0cc7b4d2980ea697b1647be2fd17bf4d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/grep-stack/mash/releases/download/v#{version}/mash-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9109062702d28813d160f5444452a88d9dd36aea91a4013fa5db0821696a73aa"
    end
    on_arm do
      url "https://github.com/grep-stack/mash/releases/download/v#{version}/mash-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f80b1d222a2963c18db4463c84bf84855a8cb291b080e2e6ef701dacbf465e87"
    end
  end

  def install
    bin.install "mash", "mash-server"
  end

  def caveats
    <<~EOS
      Start local search and choose which histories to read.
        mash qdrant install
        mash init
      Open the browser dashboard.
        mash dash
      Visit the address it prints. The setup guide is at https://getmash.io/installation/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mash --version")
  end
end
