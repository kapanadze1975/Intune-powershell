$FolderPath = "C:\IntuneFolderDavid"

Try{
    if(-not(Test-Path -Path $FolderPath)){
        New-Item -Path $FolderPath -ItemType Directory -Force | Out-Null
        Write-Output "Fixed: Created folder: $FolderPath"
    }
    else {
        Write-Output "No Action: Folder already exists: $FolderPath"
    }
    exit 0
}
catch {
    Write-Output "Failed: Could not create folder: $FolderPath. Error: $($_.Exception.Message)"
    exit 1
}