# Copilot instructions for Intune-powershell

Purpose: give AI coding agents the minimal, actionable knowledge to be productive in this repo.

- **Big picture:** This repository is a collection of PowerShell scripts used to author Intune detection and remediation logic, plus experimental test scripts and app install helpers. Key folders: [Apps](Apps), [Config](Config), [Detection](Detection), [Remediation](Remediation), [Tests](Tests), [Logs](Logs).

- **Conventions & patterns:**
  - Detection scripts are named `Detect-*.ps1` and must emit clear textual output and use exit codes (0 = success, non-zero = failure). See [Detection/Detect-IntuneFolderDavid.ps1](Detection/Detect-IntuneFolderDavid.ps1).
  - Remediation scripts are named `Remediate-*.ps1` and should attempt idempotent fixes, log results, and return exit codes (0 on success). See [Remediation/Remediate-IntuneFolderDavid.ps1](Remediation/Remediate-IntuneFolderDavid.ps1).
  - Tests in `Tests` are small, runnable examples used for local verification (e.g., [Tests/Create_Folder_Script.ps1](Tests/Create_Folder_Script.ps1)).

- **Exit codes & output:** Rely on `exit 0` / `exit 1` (or non-zero) to signal success/failure. Preserve existing textual prefixes like `OK:` / `Not OK:` / `Fixed:` when updating similar scripts to keep human-readable checks consistent.

- **Execution context & side effects:**
  - Scripts are primarily designed to run in SYSTEM context (Intune device scripts) unless a note states otherwise. Popups and GUI actions only work in USER context — avoid adding UI when the script targets Intune SYSTEM execution. See [README.md](README.md) for the popup note.
  - Logging is written under `C:\ProgramData` when present; unit/functional tests rely on local file system side effects (folders, files under C:\). Use the repo `Logs` folder for examples only — do not hard-delete user data.

- **Testing & local workflows:**
  - Run detection locally from a developer PowerShell to validate outputs and exit codes:

```powershell
powershell -ExecutionPolicy Bypass -File .\Detection\Detect-IntuneFolderDavid.ps1
echo $LASTEXITCODE
```

  - Run remediation locally and verify side effects (folder created, log written):

```powershell
powershell -ExecutionPolicy Bypass -File .\Remediation\Remediate-IntuneFolderDavid.ps1
echo $LASTEXITCODE
```

- **When modifying or adding scripts:**
  - Keep scripts idempotent and safe to run multiple times.
  - Use `Try { ... } Catch { ... }` and write a concise error message containing the thrown exception message (as existing remediation scripts do).
  - Avoid interactive prompts or GUI popups in scripts intended for Intune deployment.
  - Use `Write-Output`/`Write-Verbose` for machine-readable output; preserve the small human prefixes (`OK:`, `Not OK:`, `Fixed:`) used in this repo.

- **Files to inspect for examples:**
  - [Detection/Detect-IntuneFolderDavid.ps1](Detection/Detect-IntuneFolderDavid.ps1) — canonical detection example
  - [Remediation/Remediate-IntuneFolderDavid.ps1](Remediation/Remediate-IntuneFolderDavid.ps1) — canonical remediation example
  - [Tests/Create_Folder_Script.ps1](Tests/Create_Folder_Script.ps1) — test pattern (Try/Catch, return boolean)
  - [README.md](README.md) — repo notes about context and popups

If anything here is incorrect or you'd like a different emphasis (for example, stricter log format or CI commands), tell me which areas to expand or correct.
