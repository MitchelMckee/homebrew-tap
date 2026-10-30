cask "atc-house" do
  version "1.0"
  sha256 "6c9cf16ed10de1aecc8dc8d36638c1c743cd7ce82adefcd44c222a3a43b49e32"

  url "https://github.com/MitchelMckee/atc-house/releases/download/v#{version}/ATC-House.zip"
  name "ATC House"
  desc "Menu bar mixer for live air traffic control and house music sets"
  homepage "https://github.com/MitchelMckee/atc-house"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "ATC House.app"

  postflight do
    # Ad-hoc signed, not notarized, and Homebrew 6 removed --no-quarantine —
    # without this Gatekeeper refuses to launch it.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ATC House.app"]
  end

  zap trash: [
    "~/Library/Caches/com.mckee.atchouse",
    "~/Library/Preferences/com.mckee.atchouse.plist",
    "~/Library/WebKit/com.mckee.atchouse",
  ]

  caveats <<~EOS
    ATC House is ad-hoc signed (not notarized); this cask clears the Gatekeeper
    quarantine flag on the installed app. Click the plane in your menu bar to start.
  EOS
end
