$Folder = "C:\IntuneFolderDavid"

Try {
    If(!(Test-Path -Path $Folder -ErrorAction SilentlyContinue))
    {
        New-Item -Path $Folder -ItemType Directory -Force -ErrorAction Stop
    }
    return $true
}
Catch {
    return $false
}