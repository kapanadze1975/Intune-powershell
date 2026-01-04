# Install-TeamViewerHost.ps1
$LogFolder = "C:\ProgramData\IntuneDeployLogs"
$LogFile   = Join-Path $LogFolder "TeamViewerHost-WinGet-Install.log"

New-Item -Path $LogFolder -ItemType Directory -Force | Out-Null

Start-Transcript -Path $LogFile -Append

try {
    # Basic winget sanity check
    $winget = Get-Command winget.exe -ErrorAction Stop
    Write-Host "Winget found at: $($winget.Source)"

    # Optional: update sources (can help reliability)
    winget source update | Out-Host

    # Install TeamViewer Host silently (if supported by package)
    winget install --id=TeamViewer.TeamViewer.Host -e --accept-package-agreements --accept-source-agreements --silent

    Write-Host "TeamViewer Host install command completed."
    Stop-Transcript
    exit 0
}
catch {
    Write-Error $_
    Stop-Transcript
    exit 1
}

