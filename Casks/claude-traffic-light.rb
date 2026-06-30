cask "claude-traffic-light" do
  version "1.2.1"
  sha256 "6b91c8301508de0e8029475867da92d3ecb84b3806d6f8852266ea445c251897"

  url "https://github.com/MitchelMckee/claude-traffic-light/releases/download/v#{version}/ClaudeTrafficLight-#{version}.dmg"
  name "Claude Traffic Light"
  desc "Menu bar traffic light for your Claude Code sessions"
  homepage "https://github.com/MitchelMckee/claude-traffic-light"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "jq"
  depends_on macos: :ventura

  app "ClaudeTrafficLight.app"

  zap trash: [
    "~/.claude/menubar-state",
    "~/Library/LaunchAgents/com.mitchelmckee.claudetrafficlight.plist",
  ]

  caveats <<~EOS
    Claude Traffic Light wires its hooks into ~/.claude/settings.json on first
    launch (it backs the file up first). Start a NEW Claude Code session
    afterwards to see it light up.

    The app is not notarized. The first time you open it, right-click
    ClaudeTrafficLight in /Applications and choose Open — or run:
      xattr -dr com.apple.quarantine "/Applications/ClaudeTrafficLight.app"
  EOS
end
