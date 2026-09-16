# hsk/avidemux — unofficial Avidemux2 tap (native arm64)

Unofficial Homebrew tap providing a native Apple Silicon (arm64) build of
[Avidemux2](https://github.com/mean00/avidemux2), built from source with Qt6.
No Rosetta 2 required.

Not affiliated with the avidemux2 project. The official Homebrew cask
(`brew install --cask avidemux`) currently fails Apple's Gatekeeper check
and is disabled upstream; this tap is a community workaround until that's
resolved.

## Install

```
brew install --cask hsk/avidemux/avidemux2-arm64
```

or

```
brew tap hsk/avidemux
brew install --cask avidemux2-arm64
```

## Usage

- GUI editor: `avidemux-gui &`
- CLI batch tool (matches the official cask/Linux naming, does nothing
  with no arguments): `avidemux --help`

## Gatekeeper warning

This build is **ad-hoc signed only, not notarized** by Apple. The cask's
install step automatically clears the quarantine flag
(`xattr -dr com.apple.quarantine`) on the app bundle, so the app and CLI
binaries should launch without a Gatekeeper prompt. If macOS still blocks
it (e.g. after copying the app elsewhere), clear it manually:

```
xattr -dr com.apple.quarantine "/Applications/Avidemux-2.8.2.app"
```

or right-click (Control-click) the app in Finder and choose **Open**.

Pull requests for proper Developer ID signing + notarization are welcome.

## License

Avidemux2 itself is GPL-licensed; see the
[upstream repository](https://github.com/mean00/avidemux2) for source and
license details. This tap only packages an unofficial build.
