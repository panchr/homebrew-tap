# homebrew-tap

Homebrew tap for [panchr](https://github.com/panchr)'s apps.

## Casks

### [Espresso](https://github.com/panchr/espresso) ☕

A tiny macOS menubar app that keeps your Mac awake, built on macOS's own
`caffeinate`.

```sh
brew install --cask panchr/tap/espresso
```

Espresso is ad-hoc signed rather than notarized, so the cask clears the
quarantine flag after installing — otherwise Gatekeeper would block the first
launch. See the [project README](https://github.com/panchr/espresso) for
details, and for an installer that doesn't need Homebrew.

## Notes

Casks here are stamped with each release's version and the published archive's
SHA-256 by the source project's release workflow. File issues against the
project repo rather than this one.
