# snipeship/tap

Homebrew formulae by snipeship.

```sh
brew install snipeship/tap/<formula>
```

| Formula | What it is |
|---|---|
| [`etz`](Formula/etz.rb) | CLI for coordinating git worktrees across multi-repo parent directories ([snipeship/etz](https://github.com/snipeship/etz)) |
| [`rexkit`](Formula/rexkit.rb) | Zellij/tmux-style keys, a session manager, a file picker and Neovim scrollback for the Rex terminal ([snipeship/rexkit](https://github.com/snipeship/rexkit)); run `rexkit install` after installing |

## Releasing rexkit

1. Tag the release in snipeship/rexkit and push the tag:
   `git tag v0.2.0 && git push origin v0.2.0`
2. In `Formula/rexkit.rb`, point `url` at the tag's tarball and set `sha256`:
   `curl -sL https://github.com/snipeship/rexkit/archive/refs/tags/v0.2.0.tar.gz | shasum -a 256`
3. Try it from the tapped copy before pushing:
   ```sh
   cp Formula/rexkit.rb "$(brew --repository snipeship/tap)/Formula/"
   HOMEBREW_NO_AUTO_UPDATE=1 brew reinstall --build-from-source snipeship/tap/rexkit
   brew test snipeship/tap/rexkit && brew style Formula/rexkit.rb
   ```
4. Commit and push; `git -C "$(brew --repository snipeship/tap)" checkout .` drops the tapped copy's edit.
