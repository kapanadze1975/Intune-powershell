# Create a new object using Windows Script Host (WSH)
# This object lets PowerShell interact with Windows features
# such as pop-up messages, sending keys, and shortcuts
$wshell = New-Object -ComObject Wscript.Shell

# Show a pop-up message box on the screen
# This uses the popup method from the WScript.Shell object
$wshell.popup(
    "learn with ClougManagePro",  # Message text shown to the user
    0,                            # Time (in seconds) before the popup auto-closes
                                  # 0 = wait until the user clicks a button
    "Done",                       # Title of the popup window
    0x1                           # Button and icon type
                                  # 0x1 = OK button with information icon
)