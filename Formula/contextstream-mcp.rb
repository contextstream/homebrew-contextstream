class ContextstreamMcp < Formula
  desc "Native Rust MCP server for ContextStream project memory"
  homepage "https://contextstream.io/docs/mcp"
  version "1.0.0"
  license "MIT"

  # Official versioned binaries and published checksums:
  # https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.0/checksums.txt
  # Do not confuse with Homebrew/core context7-mcp or ctx7 (unrelated npm packages).

  livecheck do
    url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/latest/version.json"
    regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
  end

  on_macos do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.0/contextstream-mcp-darwin-arm64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "78248b346fbfb19f1f136e2bac3f1ff2bbd01dbaffbd64b04ae5298306084eb7"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.0/contextstream-mcp-darwin-x64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "2ee8d74dbf5427f5f2b1b751f80ecb5dac5d79da9d581ec36d323965ad7fa523"
    end
  end

  on_linux do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.0/contextstream-mcp-linux-arm64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "e0268dc9648a4bff90b8e01ef31676f7ecdec4ab13e21130db2ad350f34e5ad2"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.0/contextstream-mcp-linux-x64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "866f31aebebff52296405049640811dd3842b7e1b7fa1e8c12c1cbe26ed4b324"
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
