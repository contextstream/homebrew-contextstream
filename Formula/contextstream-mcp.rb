class ContextstreamMcp < Formula
  desc "Native Rust MCP server for ContextStream project memory"
  homepage "https://contextstream.io/docs/mcp"
  version "1.0.20"
  license "MIT"

  # Official versioned binaries and published checksums:
  # https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.20/checksums.txt
  # Do not confuse with Homebrew/core context7-mcp or ctx7 (unrelated npm packages).

  livecheck do
    url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/latest/version.json"
    regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
  end

  on_macos do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.20/contextstream-mcp-darwin-arm64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "2b325951adc74f85dd1dad561c45b01c2905446229beb2072da214613e1d0f24"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.20/contextstream-mcp-darwin-x64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "4534c00714d2715950a1d0c6880d8daa59398d65747a9deb3f601b35b74f47e8"
    end
  end

  on_linux do
    on_arm do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.20/contextstream-mcp-linux-arm64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "d011e529caeaa1fd54c2c0d94a4f1f2bd9879ae8530963357e4372de98797a60"
    end
    on_intel do
      url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.20/contextstream-mcp-linux-x64",
      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
      sha256 "f3df97e60d947dd7971fa5a93451cbff0182e2ad0a9d26ac547cd2717407d7f3"
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
