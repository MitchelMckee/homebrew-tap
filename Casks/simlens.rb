cask "simlens" do
  version "0.1.0"
  sha256 "a6a523bed9374cb2086592027b435e4fc41fe1f0c4d23eb05df2ae4612ac5e0f"

  url "https://github.com/MitchelMckee/SimLens/releases/download/v#{version}/SimLens.dmg"
  name "SimLens"
  desc "Virtual camera for the iOS Simulator"
  homepage "https://github.com/MitchelMckee/SimLens"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "SimLens.app"
  binary "#{appdir}/SimLens.app/Contents/MacOS/simlensctl"

  postflight do
    # SimLens is ad-hoc signed open source, not notarized, and Homebrew 6
    # removed --no-quarantine — without this Gatekeeper refuses to launch it.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SimLens.app"]
  end

  zap trash: [
    "~/Library/Application Support/SimLens",
  ]

  caveats <<~EOS
    SimLens is ad-hoc signed open source (not notarized); this cask clears
    the Gatekeeper quarantine flag on the installed app.

    Start SimLens, boot a simulator, and any app launched in it sees a
    working camera. Control it with `simlensctl`.
  EOS
end
