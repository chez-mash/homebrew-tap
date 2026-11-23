class Mash < Formula
  desc "Search past coding-agent chats from your browser, terminal, or agents"
  homepage "https://github.com/mashium/mash"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/mashium/mash/releases/download/v#{version}/mash-aarch64-apple-darwin.tar.gz"
      sha256 "c0cdc5f467a20f2e3160fda5d4bdcf1bdef9166aa1c06649ae33540cb3537824"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mashium/mash/releases/download/v#{version}/mash-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88bc9e8911964a8a85e749e5b13bebb58e3f0e54201917190460f38f6a8fe1fd"
    end
    on_arm do
      url "https://github.com/mashium/mash/releases/download/v#{version}/mash-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3109b96de7255797a6a5f7c57853c2adc752bb9974a37d1f176763aafc6282e8"
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
