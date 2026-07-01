cask "claude-traffic-light" do
  version "1.3.3"
  sha256 "aec4ef0a8b5c8c021033e4f0fb2ed06f8f00d1f7485e4312aba0f9ecd0fdf602"

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
    "~/Library/LaunchAgents/com.mitchelmckee.claude-traffic-light.plist",
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
