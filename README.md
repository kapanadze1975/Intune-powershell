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
