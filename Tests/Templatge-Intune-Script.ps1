# ==============================
# Script Name: Template-Intune-Script.ps1
# Purpose: Intune PowerShell template
# Context: SYSTEM
# ==============================

$LogPath = "C:\ProgramData\IntuneLogs"
$LogFile = "$LogPath\Template-Intune-Script.log"

if (-not (Test-Path $LogPath)) {
    New-Item -ItemType Directory -Path $LogPath -Force
}

Start-Transcript -Path $LogFile -Append

try {
    Write-Output "Script started"

    # --- Your code here ---

    Write-Output "Script completed successfully"
    Stop-Transcript
    exit 0
}
catch {
    Write-Error $_
    Stop-Transcript
    exit 1
}
