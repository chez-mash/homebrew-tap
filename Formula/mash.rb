class Mash < Formula
  desc "Search past coding-agent chats from your browser, terminal, or agents"
  homepage "https://github.com/mashhq/mash"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-aarch64-apple-darwin.tar.gz"
      sha256 "1c21f06dde1f4846b84ad28679db0309e91540de28deaa6d9d3000535b76d86a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df8f1c4308960072283118a177b662bdd9f0c2bde4e430428288fba3fbb7fb1d"
    end
    on_arm do
      url "https://github.com/mashhq/mash/releases/download/v#{version}/mash-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a825c39222d3d9bb2667fe06d38b8717d3c185561e2a00db4cfdcbaf8385437b"
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
