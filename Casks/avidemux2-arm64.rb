cask "avidemux2-arm64" do
  version "2.8.2"
  sha256 "3c102b6aa662a972472b9967ec4db125cfe97e2a8916283a8270438920185ec4"

  url "https://github.com/hsk/homebrew-avidemux/releases/download/v#{version}/avidemux2-#{version}-arm64.dmg"
  name "Avidemux (arm64, self-built)"
  desc "Unofficial native Apple Silicon build of Avidemux, built from source (mean00/avidemux2)"
  homepage "https://github.com/mean00/avidemux2"

  app "Avidemux-2.8.2.app"

  caveats <<~EOS
    This build is ad-hoc signed only, not notarized by Apple.
    On first launch, Gatekeeper will refuse to open it. Either:
      - Right-click (or Control-click) the app in Finder and choose "Open", or
      - Run: xattr -dr com.apple.quarantine "/Applications/Avidemux-#{version}.app"

    This is an unofficial community build, not affiliated with the
    avidemux2 project (https://github.com/mean00/avidemux2).
  EOS

  zap trash: [
    "~/Library/Preferences/org.avidemux.avidemux2.plist",
    "~/Library/Application Support/Avidemux",
  ]
end
