$Folder = "C:\IntuneFolder"

Try {
	If(!(Test-Path -Path $Folder -ErrorAction SilentlyContinue)) 
{
	New-Item -Path $Folder -ItemType Directory -Force -ErrorAction Stop
}
	Return $true

}
Catch {
Return $False
}
