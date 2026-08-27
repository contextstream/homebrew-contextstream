class ContextstreamMcp < Formula
  desc "Native Rust MCP server for ContextStream project memory"
  homepage "https://contextstream.io/docs/mcp"
  version "0.5.100"
  license "MIT"

  # Official versioned binaries and published checksums:
  # https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.100/checksums.txt
  # Do not confuse with Homebrew/core context7-mcp or ctx7 (unrelated npm packages).

  livecheck do
    url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/latest/version.json"
    regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
  end

  on_macos do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.100/contextstream-mcp-darwin-arm64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "732bff9db445e1625bfe76e0e52459946015b5790c9dab9a843cf43468192c75"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.100/contextstream-mcp-darwin-x64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "5a261a437241c55d7a1b378e41bcc4fd6217e9ff2ef6a4d85d7e3b628b85e0a6"
    end
  end

  on_linux do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.100/contextstream-mcp-linux-arm64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "cd502881ad0b405c5e8bb737501d9607d9f3f38e3b137100e31a98622c64b8a5"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.100/contextstream-mcp-linux-x64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "1bcb3e1e6fc881f7404d1f74dea914936dcc424761fc53520fc04071edfd08fe"
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
