class Mash < Formula
  desc "Search past coding-agent chats from your browser, terminal, or agents"
  homepage "https://github.com/chez-mash/mash"
  version "0.2.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/chez-mash/mash/releases/download/v#{version}/mash-aarch64-apple-darwin.tar.gz"
      sha256 "c4dde3fd59b972ab2f1443ec1972d58b6f56deab26dad639fce39335e014455d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chez-mash/mash/releases/download/v#{version}/mash-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "435e64c1c8826085d5103639b2e4f05e1f89e44675612b95ee155e10d9c084e0"
    end
    on_arm do
      url "https://github.com/chez-mash/mash/releases/download/v#{version}/mash-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf9fb0ed4b6f1925df2238b376fb97b5fcadabb0a04561aae4a764f065d4647e"
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
