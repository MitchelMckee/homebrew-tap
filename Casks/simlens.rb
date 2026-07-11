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

  zap trash: [
    "~/Library/Application Support/SimLens",
  ]

  caveats <<~EOS
    SimLens is ad-hoc signed (not notarized). If macOS refuses to open it,
    either right-click SimLens.app -> Open the first time, or install with:

      brew install --cask simlens --no-quarantine

    Start SimLens, boot a simulator, and any app launched in it sees a
    working camera. Control it with `simlensctl`.
  EOS
end
