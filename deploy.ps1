# deploy.ps1 — build a zip and place it in the server automodpack resourcepacks slot
# Usage: .\deploy.ps1
# Run from the repo root after any change you want players to receive on next login.

$ErrorActionPreference = 'Stop'

$src = $PSScriptRoot
$serverRp = "B:\automodpack\host-modpack\main\resourcepacks"
$zipName = "The Block Resource Pack.zip"
$zipDest = Join-Path $serverRp $zipName

# Remove old deployments if present
$oldDeployments = @(
    (Join-Path $serverRp "The Blockheads"),
    (Join-Path $serverRp "The-Blockheads.zip"),
    (Join-Path $serverRp "The Block Client Tweaks.zip")
)
foreach ($oldDeployment in $oldDeployments) {
    if (Test-Path $oldDeployment) {
        Remove-Item $oldDeployment -Recurse -Force -Confirm:$false
        Write-Host "Removed old deployment: $oldDeployment"
    }
}

# Stage pack contents to a temp directory (same exclusions as GitHub release)
$tmp = Join-Path $env:TEMP "the-block-resource-pack-stage"
if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force -Confirm:$false }
New-Item -ItemType Directory -Path $tmp | Out-Null

robocopy $src $tmp /MIR /XD ".git" "_docs" ".github" /XF ".gitignore" "deploy.ps1" "*.md" | Out-Null
$exitCode = $LASTEXITCODE
if ($exitCode -ge 8) {
    Write-Error "robocopy failed with exit code $exitCode"
    exit $exitCode
}

# Build zip with forward-slash entry names for Minecraft's resource loader.
if (Test-Path $zipDest) { Remove-Item $zipDest -Force }
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::Open($zipDest, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    Get-ChildItem -LiteralPath $tmp -File -Recurse | ForEach-Object {
        $entryName = $_.FullName.Substring($tmp.Length + 1).Replace('\', '/')
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, $entryName) | Out-Null
    }
}
finally {
    $zip.Dispose()
}

# Cleanup temp
Remove-Item $tmp -Recurse -Force -Confirm:$false

Write-Host "Deployed: $zipDest ($([Math]::Round((Get-Item $zipDest).Length / 1KB))KB)"
exit 0
