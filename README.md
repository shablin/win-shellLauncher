# Windows Shell Launcher
Set of PowerShell scripts for configuring a custom Shell Launcher. This implementation of custom shell launcher is useful for kiosks

## How to use
1. Run `01-Setup.ps1`. It checks your system if needed features is enabled (`Client-DeviceLockdown`, `Client-EmbeddedShellLauncher`)
2. Edit `02-SetShell.ps1`. Set `$username` and `$customShell` variables to your values
3. If you need to get back your default shell (`explorer.exe`), just edit and run `RemoveCustomShell.ps1`