#requires -RunAsAdministrator

Write-Host 'Windows Shell Launcher: Setup (@shablin)' -ForegroundColor Cyan

$os = Get-CimInstance Win32_OperatingSystem

Write-Host "OS      : $($os.Caption)"
Write-Host "Version : $($os.Version)"
Write-Host "Build   : $($os.BuildNumber)"
Write-Host "Arch    : $($os.OSArchitecture)"
Write-Host


$features = @(
    'Client-DeviceLockdown',
    'Client-EmbeddedShellLauncher',
)

foreach ($feature in $features) {
    Write-Host "Enabling $feature..." -ForegroundColor Yellow

    $state = Get-WindowsOptionalFeature `
        -Online `
        -FeatureName $feature

    if ($state.State -eq 'Enabled') {
        Write-Host "$feature already enabled. Skipping..." -ForegroundColor Green
    } else {
        Write-Host "Enabling $feature..." -ForegroundColor Yellow

        Enable-WindowsOptionalFeature `
            -Online `
            -FeatureName $feature `
            -All `
            -NoRestart

        Write-Host "$feature enabled" -ForegroundColor Green
    }
}

Write-Host 'Done. All the features enabled!' -ForegroundColor Yellow

$answer = Read-Host 'Needed to restart your computer. Restart now? (Y/N)'

if ($answer -match '^[Yy]$') {
    Restart-Computer -Force
}