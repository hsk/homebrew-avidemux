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

## Gatekeeper warning

This build is **ad-hoc signed only, not notarized** by Apple. On first
launch it will be blocked. Work around it with either:

- Right-click (Control-click) the app in Finder and choose **Open**, or
- Run:
  ```
  xattr -dr com.apple.quarantine "/Applications/Avidemux-2.8.2.app"
  ```

Pull requests for proper Developer ID signing + notarization are welcome.

## License

Avidemux2 itself is GPL-licensed; see the
[upstream repository](https://github.com/mean00/avidemux2) for source and
license details. This tap only packages an unofficial build.
