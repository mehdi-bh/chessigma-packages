# Chessigma desktop packages

Community package recipes maintained by Arche Labs Ltd for [Chessigma](https://www.chessigma.com), a chess game review, puzzle and training app. The review, puzzles and tools are free; an optional paid AI coach is available. The desktop app requires internet access.

- `chocolatey/`: Windows NSIS installer, SHA256 pinned, silent installation and uninstallation.
- `aur/`: Arch Linux `chessigma-bin`, x86_64 and aarch64. Downloads the upstream Debian package and preserves the Chromium sandbox and third-party license files.
- `snap/`: Ubuntu core24 strict-confinement Snap; uses Chromium's namespace sandbox. `browser-support` with `allow-sandbox: true` may require manual Snap Store review. No `--no-sandbox` flag is used.

The release URLs and checksums match [the upstream release manifest](https://cdn.chessigma.dev/desktop/latest.json). Get normal installers from [the download page](https://www.chessigma.com/download).

The MIT license applies to these original packaging recipes only. The Chessigma application is proprietary. Electron and Chromium license notices remain in the upstream binaries.

## Validate

The GitHub Actions workflow builds the Arch package, packs and installs/uninstalls the Windows installer, and builds and smoke-tests the strict Snap. Publication is separate from validation and requires publisher credentials.

On Windows: `choco pack chocolatey/chessigma.nuspec --outputdirectory chocolatey`.
On Arch: `cd aur && makepkg --printsrcinfo > .SRCINFO && makepkg --nodeps`.
On Ubuntu: `cd snap && snapcraft`.
