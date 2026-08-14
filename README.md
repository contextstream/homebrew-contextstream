# Homebrew tap for ContextStream MCP

Official Homebrew tap for ContextStream's **native Rust** MCP binary, `contextstream-mcp`.

This is **not** the legacy npm package `@contextstream/mcp-server`, and it is **not** the unrelated Homebrew/core formulae [`context7-mcp`](https://github.com/Homebrew/homebrew-core/blob/master/Formula/c/context7-mcp.rb) or [`ctx7`](https://github.com/Homebrew/homebrew-core/blob/master/Formula/c/ctx7.rb).

## Install

```bash
brew tap contextstream/contextstream
brew install contextstream-mcp
```

Or in one step:

```bash
brew install contextstream/contextstream/contextstream-mcp
```

Then configure supported MCP clients:

```bash
contextstream-mcp setup
```

## Version

Current formula: **0.5.90**

Binaries and published SHA-256 checksums come from the official versioned release:

- Manifest: https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/latest/version.json
- Checksums: https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.90/checksums.txt
- Darwin arm64: https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.90/contextstream-mcp-darwin-arm64
- Darwin x64: https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.90/contextstream-mcp-darwin-x64
- Linux x64: https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.90/contextstream-mcp-linux-x64
- Linux arm64: https://pub-68429b9f7857416c9484b75bf1887b96.r2.dev/mcp/v0.5.90/contextstream-mcp-linux-arm64

The same installer used by `curl -fsSL https://contextstream.io/scripts/mcp.sh | bash` downloads these artifacts.

## Upgrade

```bash
brew update
brew upgrade contextstream-mcp
```

## homebrew-core

A core PR is not viable yet: the Rust source (`contextstream/mcp`) is private, there is no public crates.io crate, and homebrew-core requires a public source build. Use this tap for the official prebuilt binary.
