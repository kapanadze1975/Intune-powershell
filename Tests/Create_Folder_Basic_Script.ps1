$FolderPath = "C:\IntuneFolderDavid"
Try 
{
    If(!(Test-Path -Path $FolderPath))
    {$wshell = New-Object -ComObject Wscript.shell
        $wshell.Popup("IntuneFolderDavid not there", 0, "Intune Check", 0x1)
    }
}

catch {
    Write-Output "Something went wrong"
}