class ContextstreamMcp < Formula
  desc "Native Rust MCP server for ContextStream project memory"
  homepage "https://contextstream.io/docs/mcp"
  version "1.0.34"
  license "MIT"

  # Official versioned binaries and published checksums:
  # https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.34/checksums.txt
  # Do not confuse with Homebrew/core context7-mcp or ctx7 (unrelated npm packages).

  livecheck do
    url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/latest/version.json"
    regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
  end

  on_macos do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.34/contextstream-mcp-darwin-arm64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "cb9963165f99cece8e0dafa61429722f60b3c25bb61e84f4766837b6ac78bd14"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.34/contextstream-mcp-darwin-x64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "3caff537f00031e4252cfe4c936b202ba20ee029140a4fc4f7a6d48a76997e18"
    end
  end

  on_linux do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.34/contextstream-mcp-linux-arm64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "b017881e41f2fc6b0dae2e1c6c7facc783287d89145012b5f96790b57d393eba"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.34/contextstream-mcp-linux-x64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "5dbaaf88273465894fcd7d5feeadace1a7f558e1aaa086524db3554ec99193e3"
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
