# ============================================================
#  capture-card.ps1 - Capture PNG images of C64 playing cards
#
#  Usage:
#    .\capture-card.ps1              # Proof of concept: ace of spades
#    .\capture-card.ps1 -NoCrop      # Raw screenshot for crop calibration
#    .\capture-card.ps1 -All         # All 56 cards
#    .\capture-card.ps1 -All -CropX 160 -CropY 99  # With custom crop
#
#  Workflow:
#    1. Run with -NoCrop to get raw screenshot
#    2. Examine raw screenshot, determine crop coordinates
#    3. Run with correct -CropX/-CropY values
#    4. Run with -All once crop is verified
# ============================================================

param(
    [switch]$All,
    [switch]$NoCrop,
    [switch]$KeepRaw,
    [int]$CropX = 160,
    [int]$CropY = 99,
    [int]$CropW = 56,
    [int]$CropH = 72
)

$ErrorActionPreference = "Stop"

# --- Paths ---
$ViceDir = "D:\App\GTK3VICE-win64\bin"
$Petcat  = "$ViceDir\petcat.exe"
$C1541   = "$ViceDir\c1541.exe"
$X64sc   = "$ViceDir\x64sc.exe"

$TestDir   = $PSScriptRoot
$OutputDir = Join-Path $TestDir "cards"

# --- Prerequisites ---
foreach ($tool in @($Petcat, $C1541, $X64sc)) {
    if (-not (Test-Path $tool)) {
        Write-Error "VICE tool not found: $tool"
        exit 1
    }
}
foreach ($file in @("start-render.bas", "card-symbols.prg", "card-routines-clipping.prg")) {
    if (-not (Test-Path (Join-Path $TestDir $file))) {
        Write-Error "Required file not found: $file"
        exit 1
    }
}

# --- Output directory ---
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory $OutputDir | Out-Null
}

# --- Card definitions ---
# 13 x 4 suits + 2 jokers + 2 backs = 56 cards
# Suits: 0=spades, 1=clubs, 2=diamonds, 3=hearts
$SuitNames = @{ 0="spades"; 1="clubs"; 2="diamonds"; 3="hearts" }
$Cards = @()

if ($All) {
    foreach ($s in 0, 1, 2, 3) {
        for ($t = 1; $t -le 13; $t++) {
            $Cards += [PSCustomObject]@{ Type=$t; Suit=$s; Name="card-$('{0:D2}' -f $t)-$($SuitNames[$s])" }
        }
    }
    $Cards += [PSCustomObject]@{ Type=14; Suit=0; Name="card-14-joker-black" }
    $Cards += [PSCustomObject]@{ Type=14; Suit=2; Name="card-14-joker-red" }
    $Cards += [PSCustomObject]@{ Type=15; Suit=1; Name="card-15-back-blue" }
    $Cards += [PSCustomObject]@{ Type=15; Suit=2; Name="card-15-back-red" }
}
else {
    $Cards += [PSCustomObject]@{ Type=1; Suit=0; Name="card-01-spades" }
}

Write-Host "============================================================"
Write-Host "  Card Capture - $($Cards.Count) card(s)"
Write-Host "============================================================"

if (-not $NoCrop) {
    Add-Type -AssemblyName System.Drawing
    Write-Host "Crop: x=$CropX y=$CropY w=${CropW}x${CropH}"
}

# --- Tokenize start-render.bas (once) ---
Write-Host ""
Write-Host "Tokenizing start-render.bas..."
$startBas = Join-Path $TestDir "start-render.bas"
$startPrg = Join-Path $TestDir "start-render.prg"
& $Petcat -w2 -o $startPrg -- $startBas
if ($LASTEXITCODE -ne 0) { Write-Error "petcat failed on start-render.bas"; exit 1 }

# --- Capture each card ---
$capturedCount = 0

foreach ($card in $Cards) {
    Write-Host ""
    Write-Host "--- $($card.Name) (type=$($card.Type), suit=$($card.Suit)) ---"

    # 1. Generate render-card.bas with this card's parameters
    $renderBas = Join-Path $TestDir "render-card.bas"
    $basContent = @"

;render-card.prg ==0801==
    5 rem render card
   10 k1=49152:sys k1+138
   12 poke 53280,0:poke 53281,1:print chr`$(147);
   20 card 16,8,$($card.Type),$($card.Suit)
   30 for d=0 to 50:next d
   40 poke 828,2:sys 828
"@
    Set-Content -Path $renderBas -Value $basContent -Encoding ASCII

    # 2. Tokenize render-card.bas
    $renderPrg = Join-Path $TestDir "render-card.prg"
    Write-Host "  Tokenizing render-card.bas..."
    & $Petcat -w2 -o $renderPrg -- $renderBas
    if ($LASTEXITCODE -ne 0) { Write-Error "petcat failed on render-card.bas"; exit 1 }

    # 3. Create D64
    $d64 = Join-Path $TestDir "render.d64"
    Write-Host "  Building render.d64..."
    & $C1541 `
        -format "render card,01" d64 $d64 `
        -write $startPrg "start render" `
        -write (Join-Path $TestDir "card-symbols.prg") "card symbols" `
        -write (Join-Path $TestDir "card-routines-clipping.prg") "card routines 2" `
        -write $renderPrg "render card"
    if ($LASTEXITCODE -ne 0) { Write-Error "c1541 failed"; exit 1 }

    # 4. Run VICE with exit screenshot
    $rawPng = Join-Path $TestDir "raw-screenshot.png"
    if (Test-Path $rawPng) { Remove-Item $rawPng }

    Write-Host "  Launching VICE (warp + JAM exit)..."
    $proc = Start-Process -FilePath $X64sc -ArgumentList @(
        "-autostart", "`"$d64`"",
        "+confirmonexit",
        "+sound",
        "-warp",
        "-exitscreenshot", "`"$rawPng`"",
        "-jamaction", "5"
    ) -PassThru

    # Wait with timeout
    $exited = $proc.WaitForExit(120000)
    if (-not $exited) {
        Write-Warning "  VICE timed out after 120s, killing process..."
        $proc.Kill()
        continue
    }

    if (-not (Test-Path $rawPng)) {
        Write-Warning "  Screenshot not found: $rawPng"
        continue
    }

    Write-Host "  Screenshot captured."

    # 5. Crop or copy
    $outputPng = Join-Path $OutputDir "$($card.Name).png"

    if ($NoCrop) {
        Copy-Item $rawPng $outputPng
        Write-Host "  Raw screenshot -> $outputPng"
    }
    else {
        $bmp = New-Object System.Drawing.Bitmap($rawPng)

        # Bounds check
        $cx = [Math]::Max(0, [Math]::Min($CropX, $bmp.Width - 1))
        $cy = [Math]::Max(0, [Math]::Min($CropY, $bmp.Height - 1))
        $cw = [Math]::Min($CropW, $bmp.Width - $cx)
        $ch = [Math]::Min($CropH, $bmp.Height - $cy)

        if ($cx -ne $CropX -or $cy -ne $CropY -or $cw -ne $CropW -or $ch -ne $CropH) {
            Write-Warning "  Crop adjusted to fit image ($($bmp.Width)x$($bmp.Height)): x=$cx y=$cy w=$cw h=$ch"
        }

        $cropRect = New-Object System.Drawing.Rectangle($cx, $cy, $cw, $ch)
        $cropped = $bmp.Clone($cropRect, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
        $bmp.Dispose()

        # Flood fill from (0,0) to make outside background transparent
        $w = $cropped.Width
        $h = $cropped.Height
        $visited = New-Object 'bool[,]' $w, $h
        $queue = New-Object System.Collections.Queue
        $transparent = [System.Drawing.Color]::FromArgb(0, 255, 255, 255)

        # Seed from (0,0) — always outside the card border
        $seed = $cropped.GetPixel(0, 0)
        if ($seed.R -eq 255 -and $seed.G -eq 255 -and $seed.B -eq 255) {
            $queue.Enqueue(@(0, 0))
            $visited[0, 0] = $true
        }

        while ($queue.Count -gt 0) {
            $pos = $queue.Dequeue()
            $px = $pos[0]; $py = $pos[1]
            $cropped.SetPixel($px, $py, $transparent)
            foreach ($d in @(@(-1,0), @(1,0), @(0,-1), @(0,1))) {
                $nx = $px + $d[0]; $ny = $py + $d[1]
                if ($nx -ge 0 -and $nx -lt $w -and $ny -ge 0 -and $ny -lt $h -and -not $visited[$nx, $ny]) {
                    $visited[$nx, $ny] = $true
                    $npx = $cropped.GetPixel($nx, $ny)
                    if ($npx.R -eq 255 -and $npx.G -eq 255 -and $npx.B -eq 255) {
                        $queue.Enqueue(@($nx, $ny))
                    }
                }
            }
        }

        # Save 3 sizes: small (1x), medium (2x), large (4x)
        # Use nearest-neighbor to preserve pixel art crispness
        foreach ($size in @(
            @{ Suffix="_original"; Scale=1 },
            @{ Suffix="_medium"; Scale=2 },
            @{ Suffix="_large";  Scale=4 }
        )) {
            $sizePng = Join-Path $OutputDir "$($card.Name)$($size.Suffix).png"
            if ($size.Scale -eq 1) {
                $cropped.Save($sizePng, [System.Drawing.Imaging.ImageFormat]::Png)
            } else {
                $sw = $w * $size.Scale
                $sh = $h * $size.Scale
                $scaled = New-Object System.Drawing.Bitmap($sw, $sh)
                $scaled.SetResolution($cropped.HorizontalResolution, $cropped.VerticalResolution)
                $g = [System.Drawing.Graphics]::FromImage($scaled)
                $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
                $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
                $g.DrawImage($cropped, 0, 0, $sw, $sh)
                $g.Dispose()
                $scaled.Save($sizePng, [System.Drawing.Imaging.ImageFormat]::Png)
                $scaled.Dispose()
            }
            Write-Host "  $($size.Suffix.TrimStart('_')): $sizePng"
        }
        $cropped.Dispose()
    }

    # Cleanup raw screenshot
    if (-not $KeepRaw -and -not $NoCrop) {
        Remove-Item $rawPng -ErrorAction SilentlyContinue
    }

    $capturedCount++
}

# --- Cleanup temp files ---
Remove-Item (Join-Path $TestDir "render.d64") -ErrorAction SilentlyContinue
Remove-Item (Join-Path $TestDir "render-card.prg") -ErrorAction SilentlyContinue
Remove-Item (Join-Path $TestDir "start-render.prg") -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "============================================================"
Write-Host "  Done! $capturedCount/$($Cards.Count) card(s) in: $OutputDir"
Write-Host "============================================================"
