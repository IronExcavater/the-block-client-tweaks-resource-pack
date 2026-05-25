# deploy.ps1 — build a zip and place it in the server automodpack resourcepacks slot
# Usage: .\deploy.ps1
# Run from the repo root after any change you want players to receive on next login.

$ErrorActionPreference = 'Stop'

$src = $PSScriptRoot
$serverRp = "B:\automodpack\host-modpack\main\resourcepacks"
$zipName = "The-Blockheads.zip"
$zipDest = Join-Path $serverRp $zipName

# Remove old directory-style deployment if present
$oldDir = Join-Path $serverRp "The Blockheads"
if (Test-Path $oldDir) {
    Remove-Item $oldDir -Recurse -Force -Confirm:$false
    Write-Host "Removed old directory deployment"
}

# Stage pack contents to a temp directory (same exclusions as GitHub release)
$tmp = Join-Path $env:TEMP "blockheads-rp-stage"
if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force -Confirm:$false }
New-Item -ItemType Directory -Path $tmp | Out-Null

robocopy $src $tmp /MIR /XD ".git" "_docs" ".github" /XF ".gitignore" "deploy.ps1" "*.md" | Out-Null
$exitCode = $LASTEXITCODE
if ($exitCode -ge 8) {
    Write-Error "robocopy failed with exit code $exitCode"
    exit $exitCode
}

# Build zip
if (Test-Path $zipDest) { Remove-Item $zipDest -Force }
Compress-Archive -Path "$tmp\*" -DestinationPath $zipDest

# Cleanup temp
Remove-Item $tmp -Recurse -Force -Confirm:$false

Write-Host "Deployed: $zipDest ($([Math]::Round((Get-Item $zipDest).Length / 1KB))KB)"
