

;D:\DEV\CardGamesC64\CARD_Games_C64\dev\Briscola\start-briscola.prg ==0801==
   10 rem start briscola
   20 print"{clr}poke44,16:poke4096,0:new"
   30 print"{down}{down}load"chr$(34)"card symbols"chr$(34)",8,1"
   40 print"{down}{down}{down}{down}load"chr$(34)"card routines"chr$(34)",8,1"
   50 print"{down}{down}{down}{down}new"
   55 print"{down}{down}load"chr$(34)"briscola"chr$(34)",8"
   57 print"{down}{down}{down}{down}run"
   60 poke198,7:poke631,19
   65 poke632,13:poke633,13:poke634,13:poke635,13:poke636,13:poke637,13

