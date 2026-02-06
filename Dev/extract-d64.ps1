# ============================================================
#  extract-d64.ps1 - Extract all files from a C64 .D64 image
#  Usage: extract-d64.ps1 -D64File <file.D64> [-OutputFolder <name>]
#  Generates build.ps1 and build.cfg in the output folder
# ============================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$D64File,

    [string]$OutputFolder
)

$ErrorActionPreference = "Stop"

# VICE tools
$ViceDir = "D:\App\GTK3VICE-win64\bin"
$Petcat  = "$ViceDir\petcat.exe"
$C1541   = "$ViceDir\c1541.exe"

$BaseDir = $PSScriptRoot

# Resolve D64 path
$D64Path = Resolve-Path $D64File -ErrorAction Stop
$D64BaseName = [System.IO.Path]::GetFileNameWithoutExtension($D64Path)
$D64FileName = [System.IO.Path]::GetFileName($D64Path)

if (-not $OutputFolder) {
    $OutputFolder = $D64BaseName
}

$OutDir = Join-Path $BaseDir $OutputFolder

Write-Host "============================================================"
Write-Host "  Extracting: $D64Path"
Write-Host "  Output dir: $OutDir"
Write-Host "============================================================"

if (-not (Test-Path $OutDir)) {
    New-Item -ItemType Directory -Path $OutDir | Out-Null
}

# Step 1: List disk contents
Write-Host ""
Write-Host "Disk contents:"
$listing = & $C1541 -attach $D64Path -list 2>$null
$listing | ForEach-Object { Write-Host $_ }
Write-Host ""

# Step 2: Parse listing and extract files
# Header line: 0 "disk name       " id 2a
# File line:   5    "filename"         prg
# Footer:      548 blocks free.

$DiskLabel = ""
$ExtractedFiles = @()
$FileCount = 0

foreach ($rawLine in $listing) {
    # Strip ANSI escape sequences
    $line = $rawLine -replace '\e\[[0-9;]*m', ''

    # Header line: 0 "disk name       " id 2a
    if ($line -match '^\s*0\s+"(.{1,16})"\s+(\S+)\s+2a\s*$') {
        $rawLabel = $Matches[1]
        $diskId = $Matches[2]
        # Trim trailing spaces from disk name
        $DiskLabel = $rawLabel.TrimEnd() + "," + $diskId
        continue
    }

    # File line: blocks  "filename"  type
    if ($line -match '^\s*\d+\s+"(.+)"\s+(prg|seq|rel|usr)\s*$') {
        $diskName = $Matches[1]
        $fileType = $Matches[2]

        if ($fileType -ne "prg") { continue }

        # Trim trailing spaces for local filename only
        $diskNameTrimmed = $diskName.TrimEnd()

        # Safe local filename: spaces to hyphens, dots removed
        $safeName = ($diskNameTrimmed -replace ' ', '-') -replace '\.', ''

        # For c1541 read: replace dots with ? wildcard, add * for trailing spaces
        $readName = ($diskName -replace '\.', '?') + '*'

        Write-Host "  Extracting `"$diskNameTrimmed`" ..."
        $prgFile = Join-Path $OutDir "$safeName.prg"
        & $C1541 -attach $D64Path -read $readName $prgFile 2>$null | Out-Null

        if ($LASTEXITCODE -eq 0) {
            $FileCount++
            Write-Host "    OK: $safeName.prg"
            $ExtractedFiles += [PSCustomObject]@{
                DiskName  = $diskName
                SafeName  = $safeName
                PrgFile   = "$safeName.prg"
                IsBasic   = $false
            }
        } else {
            Write-Host "    FAILED: $safeName.prg"
        }
    }
}

Write-Host ""
Write-Host "============================================================"
Write-Host "  Extracted $FileCount files to $OutDir"
Write-Host "============================================================"

# Step 3: Detokenize BASIC files
Write-Host ""
Write-Host "Detokenizing BASIC files..."

for ($i = 0; $i -lt $ExtractedFiles.Count; $i++) {
    $f = $ExtractedFiles[$i]
    $prgPath = Join-Path $OutDir $f.PrgFile
    $basPath = Join-Path $OutDir "$($f.SafeName).bas"

    $output = & $Petcat -2 -- $prgPath 2>$null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  [binary]  $($f.PrgFile)"
        continue
    }

    # Check load address: C64 BASIC loads at $0801 (default) or $1001 (POKE44,16)
    $outputText = $output -join "`n"
    if ($outputText -match "==0801==" -or $outputText -match "==1001==") {
        ($output -join "`r`n") + "`r`n" | Set-Content -Path $basPath -Encoding ascii -NoNewline
        $ExtractedFiles[$i].IsBasic = $true
        Write-Host "  [basic]   $($f.PrgFile)  ->  $($f.SafeName).bas"
    } else {
        Write-Host "  [binary]  $($f.PrgFile)"
    }
}

# Step 4: Generate build.cfg
Write-Host ""
Write-Host "Generating build.cfg..."

$cfgLines = @()
$cfgLines += "DISK_LABEL=$DiskLabel"
$cfgLines += "D64_NAME=$D64FileName"

foreach ($f in $ExtractedFiles) {
    if ($f.IsBasic) {
        $cfgLines += "FILE=$($f.SafeName).bas,$($f.DiskName),basic"
    } else {
        $cfgLines += "FILE=$($f.PrgFile),$($f.DiskName),prg"
    }
}

$cfgPath = Join-Path $OutDir "build.cfg"
($cfgLines -join "`r`n") + "`r`n" | Set-Content -Path $cfgPath -Encoding ascii -NoNewline
Write-Host "  Created: build.cfg"

# Step 5: Generate build.ps1
Write-Host "Generating build.ps1..."

$buildScript = '& "$PSScriptRoot\..\build-d64.ps1" -GameFolder (Split-Path $PSScriptRoot -Leaf) @args'
$buildPath = Join-Path $OutDir "build.ps1"
$buildScript + "`r`n" | Set-Content -Path $buildPath -Encoding ascii -NoNewline
Write-Host "  Created: build.ps1"

Write-Host ""
Write-Host "Done."
