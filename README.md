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

### GUI

Launch the GUI editor from a terminal with:

```
avidemux-gui &
```

`avidemux-gui` is a small wrapper script the cask installs to
`$(brew --prefix)/bin/avidemux-gui`; it just runs
`open -a "/Applications/Avidemux-2.8.2.app"`. A plain symlink straight to
the app's internal binary won't work — Avidemux resolves its
Resources/Frameworks/Qt plugin paths relative to `argv[0]`, which breaks
once invoked outside the `.app` bundle — so always launch it through this
wrapper (or by opening the app from Finder/Spotlight) rather than calling
the binary inside `Avidemux-2.8.2.app/Contents/MacOS/` directly.

The trailing `&` backgrounds the command so your terminal stays usable;
the GUI keeps running after you close the terminal.

### CLI

The CLI batch-processing tool (matches the official cask/Linux naming,
does nothing with no arguments):

```
avidemux --help
```

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
