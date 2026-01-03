# Define the path to the registry key
$Path = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\BITS"

# Define the name of the registry value to check - VALUE NAME
$Name = "LogFileSize"

# Define the expected value of the registry value - VALUE DATA
$Value = "2"

# Retrieve the value of the registry value
$Registry = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue |
            Select-Object -ExpandProperty $Name

# If the registry value matches the expected value, output "Compliant"
If ($Registry -eq $Value) {
    Write-Output "Compliant"
    Exit 0
}
# If the registry value does not match the expected value, output "Not Compliant"
Else {
    Write-Warning "Not Compliant"
    Exit 1
}
