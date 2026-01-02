# Intune PowerShell Scripts

This repository contains PowerShell scripts used for learning and practicing
Microsoft Intune (Endpoint Manager) deployments.

## Folder Structure

- Apps        : Application install scripts (Win32, Winget, MSI)
- Config      : Configuration and registry changes
- Detection   : Detection scripts for Intune Win32 apps
- Remediation : Proactive remediation scripts
- Logs        : Sample logs (local testing only)
- Tests       : Experimental and learning scripts

## Notes
- Scripts are designed to run in SYSTEM context unless stated otherwise
- Logging is written to C:\ProgramData where applicable

## Popup_Message Explanation
    - $wshell
This is a variable
It stores something in memory
Here, it stores a Windows object
Think of it as:
“A remote control to talk to Windows”

## New-Object -ComObject Wscript.Shell
This means:
     - New-Object → create something new
-ComObject → use a Windows built-in component
Wscript.Shell → a Windows automation tool
Together:
“Create a Windows automation object that can show popups”

## .popup()
    - $wshell.popup()
.popup() is a method
Methods are actions an object can perform
This method shows a message box

## Breakdown of popup parameters
    - $wshell.popup("Message", Time, "Title", Type)

## "Message"
    "learn with ClougManagePro"
This is:
    The text shown inside the popup
    You can change this to anything

## Timeout (secconds)
    0
0 = wait forever (until user clicks)
5 = close after 5 seconds
10 = close after 10 seconds

## Windows Title
    "Done"
This is the title bar of the popup
Appears at the top of the window

## Type / Button & Icon Type
    - 0x1
This controls:
What button appears
What icon appears
Common values:
Value	Meaning
0x0	    OK button only
0x1	    OK + Information icon
0x10	OK + Warning icon
0x30	OK + Error icon

## Beginner mental model (remember this)
    Create object → Call method → Show popup

## Very important Intune note (real-world)
  This popup only works in USER context

If run as:

SYSTEM (Intune device script) → ❌ user will NOT see it

USER context → ✅ popup appears

This is very important when deploying via Intune.  