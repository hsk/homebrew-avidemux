cask "avidemux2-arm64" do
  version "2.8.2"
  sha256 "3c102b6aa662a972472b9967ec4db125cfe97e2a8916283a8270438920185ec4"

  url "https://github.com/hsk/homebrew-avidemux/releases/download/v#{version}/avidemux2-#{version}-arm64.dmg"
  name "Avidemux (arm64, self-built)"
  desc "Unofficial native Apple Silicon build of Avidemux, built from source (mean00/avidemux2)"
  homepage "https://github.com/mean00/avidemux2"

  app "Avidemux-2.8.2.app"
  binary "#{appdir}/Avidemux-#{version}.app/Contents/MacOS/avidemux_cli", target: "avidemux"
  binary "#{appdir}/Avidemux-#{version}.app/Contents/MacOS/avidemux_jobs"

  postflight_steps do
    # This build is ad-hoc signed only, not notarized. Without clearing the
    # quarantine flag, Gatekeeper blocks the GUI app and SIGKILLs the CLI
    # binaries when invoked directly from a terminal.
    # `xattr -r` exits non-zero on the dangling Resources symlinks inside
    # Qt's .framework bundles, so allow_failure via must_succeed: false.
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Avidemux-{{version}}.app"],
        must_succeed: false
  end

  caveats <<~EOS
    This build is ad-hoc signed only, not notarized by Apple. The quarantine
    flag was cleared automatically so both the app and `avidemux`/`avidemux_jobs`
    CLI binaries should run without a Gatekeeper prompt.

    This is an unofficial community build, not affiliated with the
    avidemux2 project (https://github.com/mean00/avidemux2).
  EOS

  zap trash: [
    "~/Library/Preferences/org.avidemux.avidemux2.plist",
    "~/Library/Application Support/Avidemux",
  ]
end
