cask "avidemux2-arm64" do
  version "2.8.2"
  sha256 "3c102b6aa662a972472b9967ec4db125cfe97e2a8916283a8270438920185ec4"

  url "file:///Volumes/AvidemuxBuild/avidemux2/installer/avidemux2-2.8.2-arm64.dmg"
  name "Avidemux (arm64, self-built)"
  desc "Video editor, built natively for Apple Silicon from source (mean00/avidemux2)"
  homepage "https://github.com/mean00/avidemux2"

  app "Avidemux-2.8.2.app"

  zap trash: [
    "~/Library/Preferences/org.avidemux.avidemux2.plist",
    "~/Library/Application Support/Avidemux",
  ]
end
