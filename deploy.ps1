# deploy.ps1 — sync the working repo to the server automodpack resourcepack slot
# Usage: .\deploy.ps1
# Run from the repo root after any change you want players to receive on next login.

$ErrorActionPreference = 'Stop'

$src = $PSScriptRoot
$dst = "B:\automodpack\host-modpack\main\resourcepacks\The Blockheads"

if (-not (Test-Path $dst)) {
    New-Item -ItemType Directory -Path $dst | Out-Null
}

# Mirror src → dst, excluding git internals, docs, and repo-only files
robocopy $src $dst /MIR /XD ".git" "_docs" ".github" /XF ".gitignore" "deploy.ps1" "*.md" | Out-Null

$exitCode = $LASTEXITCODE
# robocopy exit codes < 8 are success (0=no change, 1=copied, 2=extra, 3=both, 4=mismatch, 5-7=combos)
if ($exitCode -ge 8) {
    Write-Error "robocopy failed with exit code $exitCode"
    exit $exitCode
}

Write-Host "Deployed to automodpack server ($dst)"
