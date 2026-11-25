class Mash < Formula
  desc "Search past coding-agent chats from your browser, terminal, or agents"
  homepage "https://github.com/mashhq/mash"
  version "0.2.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-aarch64-apple-darwin.tar.gz"
      sha256 "4100d61e967e92f7d28cd872e35a06a25c69833745af084d4e54f2a15894196f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f546244195aacc2d07e331bf1b2f571251b8eabf43ba7af43931ce708c7c7e8"
    end
    on_arm do
      url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55e4fc1009370772cd6eb5b39bcacd5d3093edb11ccfa84f8514f088e3a226b4"
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
