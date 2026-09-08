class ContextstreamMcp < Formula
    desc "Native Rust MCP server for ContextStream project memory"
    homepage "https://contextstream.io/docs/mcp"
    version "1.0.4"
    license "MIT"

    # Official versioned binaries and published checksums:
    # https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.4/checksums.txt
    # Do not confuse with Homebrew/core context7-mcp or ctx7 (unrelated npm packages).

    livecheck do
          url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/latest/version.json"
          regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
    end

    on_macos do
          on_arm do
                  url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.4/contextstream-mcp-darwin-arm64",
                      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
                  sha256 "83e9394a2a235d6f4ff4e23dcddb37469bbf09522e4b75a0582f84c7d1cd37ca"
          end
          on_intel do
                  url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.4/contextstream-mcp-darwin-x64",
                      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
                  sha256 "e19fdd2d3140c53e9e871d63ad70e67174a6e88bf5bb5d0b3e163aa129c9e207"
          end
    end

    on_linux do
          on_arm do
                  url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.4/contextstream-mcp-linux-arm64",
                      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
                  sha256 "d238cc100443fef4751dc2f795f06959f612abb6a656b522dba7943bd166f2ef"
          end
          on_intel do
                  url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.4/contextstream-mcp-linux-x64",
                      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
                  sha256 "68ba1cbe57ad4fa5ba5f7230723f43f5e1c1d2a1849342504fdee7aa12310fd2"
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
