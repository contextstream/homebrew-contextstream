class ContextstreamMcp < Formula
  desc "Native Rust MCP server for ContextStream project memory"
  homepage "https://contextstream.io/docs/mcp"
  version "0.5.99"
  license "MIT"

  # Official versioned binaries and published checksums:
  # https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.99/checksums.txt
  # Do not confuse with Homebrew/core context7-mcp or ctx7 (unrelated npm packages).

  livecheck do
    url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/latest/version.json"
    regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
  end

  on_macos do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.99/contextstream-mcp-darwin-arm64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "2d1204c5c82f5728ab9e8a2e44849da16df8d14eb4ad2dc9cc60229e2dd65d41"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.99/contextstream-mcp-darwin-x64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "db7a84006b11c59937316e44bbfabaabd35f57ca60cdd1b96f2f96bd2498c321"
    end
  end

  on_linux do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.99/contextstream-mcp-linux-arm64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "217a1314cdd034d829234c6998ea4baff43ad00011d4c923b428d8c8e9eb34f5"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.99/contextstream-mcp-linux-x64",
          verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "3d5c2355a50c3eeff036189bd2c17b56f5dd32d714754e499b4e26168476e9c3"
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
