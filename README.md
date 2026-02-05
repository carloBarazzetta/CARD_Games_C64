🇬🇧 **English** | 🇮🇹 [Italiano](LEGGIMI.md)

# "CARD" PROGRAM FOR COMMODORE 64 - BASIC V2 [![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

---
### WHAT IS THE "CARD" PROGRAM FOR
The **CARD** program is used to develop card games for the Commodore 64.

The CARD command extends BASIC V2 to print playing cards on screen.

Cards are displayed using redefined graphic symbols.

It is possible to display any type of card anywhere on the screen.

![./Briscola](./Briscola.png)

_In the image, an example of playing cards printed randomly as the initial background of the "Briscola" game written in BASIC using the CARD program._

In 1985, Carlo and Lorenzo Barazzetta developed the "CARD" library, with which they then developed 3 games, published by Systems Editoriale in the following years.

Links to the 3 original games from the 80s:

- [Black Jack (1986) in D64 format](BlackJack.D64)
- [Black Jack (1986) as Vice C64 Emulator Snapshot](BlackJack-vice-snapshot.vsf)
- [Briscola (1987) in D64 format](./Briscola.D64)
- [Briscola (1987) as Vice C64 Emulator Snapshot](./Briscola-vice-snapshot.vsf)
- [Poker 4 (1987) in D64 format](./Poker4.D64)
- [Poker 4 (1987) as Vice C64 Emulator Snapshot](./Poker4-vice-snapshot.vsf)

---

![./Black_Jack](./Black_Jack.png)

_In the image, the Black Jack title screen._

---

The Poker 4 game also featured a "cover screen" and had a unique characteristic among card games: the ability to play against 3 computer opponents, each with different "personalities".

![./Poker4_image](./Poker4_image.png)

In this repository you will find game files (in D64 format and Snapshots for Vice C64 Emulator), the manual for programming other games in BASIC and the source code of Games.

---
## BRISCOLA 2 - 2024

The original Briscola game was updated in 2024, with these new features:

- the human player and the computer, at the beginning of each game, take turns playing the first card (who starts playing in the first game is random).
- game instructions revised for better readability
- BASIC code revised for better readability
- final score is now displayed for a longer time
- fixed a bug in the AI

![./Briscola2](./Briscola2.png)

_In the image, the splash screen of the "Briscola 2" game updated in 2024._

You can download the files:
- [Briscola 2 (2024) in D64 format](./Briscola2.D64)
- [Briscola 2 (2024) as Vice C64 Emulator Snapshot](./Briscola2-vice-snapshot.vsf)

---
## BRISCOLA IN ENGLISH - 2026

In 2026, the Briscola 2 game was translated into English and further improved.

![./Briscola-en](./Briscola-en.png)

_In the image, the splash screen of the "Briscola" game translated into English in 2026._

You can download the files:
- [Briscola Italian (2026) in D64 format](./Briscola-it.D64)
- [Briscola Italian (2026) as Vice C64 Emulator Snapshot](./Briscola-it-vice-snapshot.vsf)
- [Briscola English (2026) in D64 format](./Briscola-en.D64)
- [Briscola English (2026) as Vice C64 Emulator Snapshot](./Briscola-en-vice-snapshot.vsf)

---
## DOCUMENTATION AND MANUALS

In the ["Wiki"](https://github.com/carloBarazzetta/CARD_Games_C64/wiki) section you will find the online manual for using the CARD program.

---
## SOURCES AND DEVELOPMENT

In the Dev folder you will find the source code for the various projects built with CARD.

You can modify the sources and build .D64 files using VICE: to use your own version of VICE, edit the build-d64.bat file at the line:
```
set VICE_DIR=D:\App\GTK3VICE-win64\bin
```
Have fun.

### Copyright © 1985-2026 - Carlo & Lorenzo Barazzetta
