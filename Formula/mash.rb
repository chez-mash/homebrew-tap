class Mash < Formula
  desc "Search past coding-agent chats from your browser, terminal, or agents"
  homepage "https://github.com/grep-stack/mash"
  version "0.2.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/grep-stack/mash/releases/download/v#{version}/mash-aarch64-apple-darwin.tar.gz"
      sha256 "696a166ee594c6ac98c9cd35d352bc3e17d949efa3f989c7bf43e8601c2992ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/grep-stack/mash/releases/download/v#{version}/mash-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce4f1c11e1bb7ac85ed98c67935291e7289001602c622f2ec5f3f7ed41a5a674"
    end
    on_arm do
      url "https://github.com/grep-stack/mash/releases/download/v#{version}/mash-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec4273c6a122b0087f90e4d2d46cea8e4cb0aecdb1e303824ad2b7d86906a330"
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
