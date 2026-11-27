class Mash < Formula
  desc "Search past coding-agent chats from your browser, terminal, or agents"
  homepage "https://github.com/mashhq/mash"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-aarch64-apple-darwin.tar.gz"
      sha256 "a05727edd1e949cb6122401e53467cc9150df7b31c26fcdefe28cbaf8faf3d9f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3023621e660196fb0caafbabf98cf8a2e2abb13ff0dc41c48de1730ab763556"
    end
    on_arm do
      url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "46df474b67239ed502d8fb2ad0b1dad9c128bd06a4365e5cdf575ff56f7048e6"
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
