# capture-card.ps1 - Card Image Capture Tool

PowerShell script that automatically captures PNG images of all 56 playing cards rendered by the CARD library on a Commodore 64, using the VICE emulator.

## Prerequisites

- **VICE** installed at `D:\App\GTK3VICE-win64` (uses `x64sc.exe`, `petcat.exe`, `c1541.exe`)
- Files in `Dev/Test/`: `start-render.bas`, `card-symbols.prg`, `card-routines-clipping.prg`

## How It Works

For each card, the script:

1. **Generates** a BASIC program (`render-card.bas`) that draws one card centered on a white screen with black border
2. **Tokenizes** the BASIC source with `petcat` and builds a `.D64` disk image with `c1541`
3. **Launches VICE** in warp mode with `-exitscreenshot` and `-jamaction 5`
4. The BASIC program draws the card, then executes a **JAM opcode** (`POKE 828,2:SYS 828`) which causes VICE to quit and save the screenshot
5. **Crops** the card (56x72 pixels) from the full C64 screenshot
6. **Flood-fills** the area outside the card border with **transparency** (alpha channel)
7. **Saves** three sizes using nearest-neighbor scaling to preserve pixel art crispness

## Usage

```powershell
# Single card (ace of spades) - proof of concept
.\capture-card.ps1

# Raw screenshot without cropping - for crop calibration
.\capture-card.ps1 -NoCrop

# All 56 cards (168 PNG files)
.\capture-card.ps1 -All

# Custom crop coordinates (if VICE configuration changes)
.\capture-card.ps1 -All -CropX 160 -CropY 99

# Keep raw VICE screenshots for inspection
.\capture-card.ps1 -All -KeepRaw
```

## Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `-All` | off | Capture all 56 cards (default: ace of spades only) |
| `-NoCrop` | off | Save raw VICE screenshot without cropping |
| `-KeepRaw` | off | Keep raw screenshots after cropping |
| `-CropX` | 160 | X offset of card in VICE screenshot |
| `-CropY` | 99 | Y offset of card in VICE screenshot |
| `-CropW` | 56 | Card width in pixels (7 chars x 8px) |
| `-CropH` | 72 | Card height in pixels (9 chars x 8px) |

## Output

Images are saved in `Dev/Test/cards/` (or `CARD_Games_C64.wiki/cards/` after copying for documentation).

Each card is saved in three sizes:

| Suffix | Scale | Dimensions | Description |
|--------|-------|------------|-------------|
| `_original` | 1x | 56 x 72 | Native C64 resolution |
| `_medium` | 2x | 112 x 144 | Good for documentation |
| `_large` | 4x | 224 x 288 | Good for presentations |

All images have **transparent background** outside the card border.

### Naming Convention

```
card-{NN}-{suit}_{size}.png
```

- **NN**: card type (01-13 = A,2..10,J,Q,K)
- **suit**: `spades`, `clubs`, `diamonds`, `hearts`
- **size**: `original`, `medium`, `large`

Special cards:
- `card-14-joker-black_{size}.png` / `card-14-joker-red_{size}.png`
- `card-15-back-blue_{size}.png` / `card-15-back-red_{size}.png`

## Cards Generated (56 total)

- 13 Spades (A-K, suit=0)
- 13 Clubs (A-K, suit=1)
- 13 Diamonds (A-K, suit=2)
- 13 Hearts (A-K, suit=3)
- 2 Jokers (black suit=0, red suit=2)
- 2 Backs (blue suit=1, red suit=2)

## Calibration

The crop coordinates (CropX=160, CropY=99) are calibrated for VICE x64sc with default PAL settings (384x272 screenshot, 320x200 screen area starting at pixel 32,35). If VICE configuration changes:

1. Run `.\capture-card.ps1 -NoCrop` to get a raw screenshot
2. Open `cards/card-01-spades.png` and locate the card position
3. Update CropX/CropY accordingly

## Supporting Files

- **`start-render.bas`** - C64 BASIC loader that chains: POKE 44,16 (protect memory), load card symbols, load card routines, load render program, RUN
- **`render-card.bas`** - C64 BASIC program that draws one card at position (16,8) and triggers JAM exit. Overwritten by the script for each card.
