# ============================================================
#  build-d64.ps1 - Build a C64 .D64 disk image from sources
#  Usage: build-d64.ps1 -GameFolder <name> [-NoRun]
# ============================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$GameFolder,

    [switch]$NoRun
)

$ErrorActionPreference = "Stop"

# VICE tools
$ViceDir = "D:\App\GTK3VICE-win64\bin"
$Petcat  = "$ViceDir\petcat.exe"
$C1541   = "$ViceDir\c1541.exe"
$X64sc   = "$ViceDir\x64sc.exe"

$BaseDir = $PSScriptRoot

$GameDir = Join-Path $BaseDir $GameFolder
$CfgFile = Join-Path $GameDir "build.cfg"

if (-not (Test-Path $GameDir)) {
    Write-Error "Game folder not found: $GameDir"
    exit 1
}
if (-not (Test-Path $CfgFile)) {
    Write-Error "build.cfg not found in $GameDir"
    exit 1
}

Write-Host "============================================================"
Write-Host "  Building $GameFolder"
Write-Host "============================================================"

# Parse build.cfg
$DiskLabel = ""
$D64Name = ""
$Files = @()

foreach ($line in Get-Content $CfgFile) {
    $line = $line.Trim()
    if ($line -eq "" -or $line.StartsWith("#")) { continue }

    if ($line -match "^DISK_LABEL=(.+)$") {
        $DiskLabel = $Matches[1]
    }
    elseif ($line -match "^D64_NAME=(.+)$") {
        $D64Name = $Matches[1]
    }
    elseif ($line -match "^FILE=(.+)$") {
        $parts = $Matches[1].Split(",", 3)
        $Files += [PSCustomObject]@{
            Type     = "FILE"
            LocalName = $parts[0]
            DiskName  = $parts[1]
            FileType  = $parts[2]
        }
    }
    elseif ($line -match "^COPY=(.+)$") {
        $parts = $Matches[1].Split(",", 3)
        $Files += [PSCustomObject]@{
            Type     = "COPY"
            LocalName = $parts[0]
            DiskName  = $parts[1]
            FileType  = $parts[2]
        }
    }
}

if (-not $D64Name) {
    Write-Error "D64_NAME not defined in build.cfg"
    exit 1
}

$OutputD64 = Join-Path $BaseDir "..\$D64Name"

# Step 1: Tokenize .bas files
Write-Host ""
Write-Host "[1/3] Tokenizing BASIC sources..."

foreach ($f in $Files) {
    if ($f.Type -eq "COPY") { continue }
    if ($f.FileType -ne "basic") { continue }

    $basFile = Join-Path $GameDir $f.LocalName
    $prgFile = Join-Path $GameDir ($f.LocalName -replace '\.bas$', '.prg')

    Write-Host "  petcat: $($f.LocalName) -> $($f.LocalName -replace '\.bas$', '.prg')"
    & $Petcat -w2 -o $prgFile -- $basFile
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to tokenize $($f.LocalName)"
        exit 1
    }
}

# Step 2: Create D64 and write files
Write-Host ""
Write-Host "[2/3] Creating $D64Name..."

$c1541Args = @("-format", $DiskLabel, "d64", $OutputD64)

foreach ($f in $Files) {
    if ($f.Type -eq "COPY") {
        $srcPath = Join-Path $BaseDir $f.LocalName
        Write-Host "  write: $($f.LocalName) as `"$($f.DiskName)`""
    }
    else {
        if ($f.FileType -eq "basic") {
            $srcFile = $f.LocalName -replace '\.bas$', '.prg'
        } else {
            $srcFile = $f.LocalName
        }
        $srcPath = Join-Path $GameDir $srcFile
        Write-Host "  write: $srcFile as `"$($f.DiskName)`""
    }
    $c1541Args += @("-write", $srcPath, $f.DiskName)
}

& $C1541 @c1541Args
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to create D64"
    exit 1
}

# Step 3: Verify
Write-Host ""
Write-Host "[3/3] Verifying disk contents..."
& $C1541 -attach $OutputD64 -list

Write-Host ""
Write-Host "============================================================"
Write-Host "  Build complete: $OutputD64"
Write-Host "============================================================"

if (-not $NoRun) {
    Write-Host ""
    Write-Host "Launching VICE..."
    Start-Process $X64sc -ArgumentList "-autostart", $OutputD64
}
