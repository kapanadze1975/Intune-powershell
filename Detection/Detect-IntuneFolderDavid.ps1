$FolderPath = "C:\IntuneFolderDavid"
if (Test-Path -Path $FolderPath)
    {
        Write-Output "OK: Folder Exist: $FolderPath"
        exit 0
    }
    else {
        Write-Output "Not OK: Folder missing: $FolderPath"
        exit 1
    }