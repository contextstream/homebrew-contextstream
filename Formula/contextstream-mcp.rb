class ContextstreamMcp < Formula
    desc "Native Rust MCP server for ContextStream project memory"
    homepage "https://contextstream.io/docs/mcp"
    version "1.0.5"
    license "MIT"

    # Official versioned binaries and published checksums:
    # https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.5/checksums.txt
    # Do not confuse with Homebrew/core context7-mcp or ctx7 (unrelated npm packages).

    livecheck do
          url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/latest/version.json"
          regex(/"version"\s*:\s*"v?(\d+(?:\.\d+)+)"/i)
    end

    on_macos do
          on_arm do
                  url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.5/contextstream-mcp-darwin-arm64",
                      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
                  sha256 "0b04d6e7733745aa08f21518f41ec158bcc1799bedaaf807ee7a85b3606d8d25"
          end
          on_intel do
                  url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.5/contextstream-mcp-darwin-x64",
                      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
                  sha256 "40d24151500c847affb48c3c94b30d002ebaef21aa3c69544bd66b29991608aa"
          end
    end

    on_linux do
          on_arm do
                  url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.5/contextstream-mcp-linux-arm64",
                      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
                  sha256 "fccfc9030221fe86d3506bdef37acc86005c87cb4affe36b01b784acbff75ce8"
          end
          on_intel do
                  url "https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v1.0.5/contextstream-mcp-linux-x64",
                      verified: "pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/"
                  sha256 "e5d68ecfa8a2623a496edcdc3e2136bb02150125649e8cc7a669824805ba7cf1"
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
