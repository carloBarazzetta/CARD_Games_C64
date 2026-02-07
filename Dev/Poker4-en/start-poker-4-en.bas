

;D:\DEV\CardGamesC64\CARD_Games_C64\Dev\Poker4-en\start-poker-4-en.prg ==0801==
   10 rem start poker 4 en
   11 a=a+1
   12 on a goto 13,15,16,17
   13 print"loading image..."
   14 load".pic a poker 4 ",8,1
   15 load".prg a poker 4 ",8,1
   16 load".prg b poker 4 ",8,1
   17 sys 16384
   20 print"{clr}poke44,16:poke4096,0:new"
   30 print"{down}{down}load"chr$(34)"card symbols"chr$(34)",8,1"
   40 print"{down}{down}{down}{down}load"chr$(34)"card routines"chr$(34)",8,1"
   50 print"{down}{down}{down}{down}new"
   55 print"{down}{down}load"chr$(34)"poker 4 en"chr$(34)",8"
   57 print"{down}{down}{down}{down}run"
   60 poke198,7:poke631,19
   65 poke632,13:poke633,13:poke634,13:poke635,13:poke636,13:poke637,13

