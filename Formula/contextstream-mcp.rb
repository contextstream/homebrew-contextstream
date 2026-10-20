class ContextstreamMcp < Formula
  desc "Native Rust MCP server for ContextStream project memory"
  homepage "https://contextstream.io/docs/mcp"
  version "1.0.26"
  license "MIT"

  # Official versioned binaries and published checksums:
  # https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.26/checksums.txt
  # Do not confuse with Homebrew/core context7-mcp or ctx7 (unrelated npm packages).

  livecheck do
    url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/latest/version.json"
    regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
  end

  on_macos do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.26/contextstream-mcp-darwin-arm64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "7191b120af36f87d9d39fd9e545f949899ad67aa7a2038db4cec2a6372bd13a0"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.26/contextstream-mcp-darwin-x64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "9eb2820fbf2f58afcb68d0c46a7874147681a60228a1957c7e26cdb18fc952b4"
    end
  end

  on_linux do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.26/contextstream-mcp-linux-arm64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "593d23dfa8c1b1ecc43b500e9bd98c4efde67e2b60e1b269ce679afe9bd662b2"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.26/contextstream-mcp-linux-x64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "a12092ff1eedc02d5fde83e8aef1575c3ffcc03367f5e449ae9c83364575e0b3"
    end
  end

  def install
    artifact = Dir["contextstream-mcp-*"].first
    odie "downloaded contextstream-mcp artifact not found" if artifact.nil?

    chmod "+x", artifact
    bin.install artifact => "contextstream-mcp"
  end

  def caveats
    <<~EOS
    This installs the native Rust `contextstream-mcp` binary, not the
    legacy npm package and not the unrelated Homebrew formulae
    `context7-mcp` or `ctx7`.

    Configure editor MCP clients with:

    contextstream-mcp setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/contextstream-mcp --version")
  end
end
