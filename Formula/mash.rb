class Mash < Formula
  desc "Search your coding agents' past conversations from a CLI and MCP server"
  homepage "https://github.com/mashium/mash"
  version "0.1.0-alpha"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/mashium/mash/releases/download/v#{version}/mash-aarch64-apple-darwin.tar.gz"
      sha256 "dcfb71cd439dd5034854f20ae43aa49d0683b6a753ec3e45431c2bf32cfc1df1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mashium/mash/releases/download/v#{version}/mash-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "696b884d83b30ca278e5e11e2da494e624905a561b8f406bff14535b39a4c354"
    end
    on_arm do
      url "https://github.com/mashium/mash/releases/download/v#{version}/mash-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24c17c5742e8a1afe39ecfc76719066652924b60d06ee6cf194e0f281c4c115d"
    end
  end

  def install
    bin.install "mash", "mash-server"
  end

  def caveats
    <<~EOS
      Start the local search service, then set Mash up for the agent
      histories on this machine:
        mash qdrant install
        mash init
      For semantic search, first run:
        mash models install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mash --version")
  end
end
