class Mash < Formula
  desc "Search your coding agents' past conversations from a CLI and MCP server"
  homepage "https://github.com/mashium/mash"
  version "0.1.1-alpha"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/mashium/mash/releases/download/v#{version}/mash-aarch64-apple-darwin.tar.gz"
      sha256 "3cfe970e3c761b857aa12980f74f6ebb7c63fd059c3ff5a0a90ebdc87f172e04"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mashium/mash/releases/download/v#{version}/mash-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "406255dcf5409c4237f9503e612b576e85382a80a5735ebe7f72da8e9625e062"
    end
    on_arm do
      url "https://github.com/mashium/mash/releases/download/v#{version}/mash-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3acd961aa3e0013cc9fee0978ce2820caa57834eac0d1ab58110b4c41b8e638d"
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
