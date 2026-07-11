# MitchelMckee's Homebrew Tap

Homebrew formulae & casks for my tools.

```bash
brew tap mitchelmckee/tap
brew install --cask claude-traffic-light
```

## Casks

- **[claude-traffic-light](https://github.com/MitchelMckee/claude-traffic-light)** — a tiny macOS menu bar app that shows what every Claude Code session is doing at a glance (🔴 working · 🟡 needs you · 🟢 ready).
- **[simlens](https://github.com/MitchelMckee/SimLens)** — a virtual camera for the iOS Simulator: feed your Mac's webcam, an image, a video, a QR code, or a screen region into any unmodified app (`brew install --cask simlens`).

> The apps aren't notarized. The `simlens` cask clears the Gatekeeper quarantine flag on
> install; for `claude-traffic-light`, right-click it in `/Applications` → **Open** on first
> launch. (Homebrew 6 removed the old `--no-quarantine` flag.)
