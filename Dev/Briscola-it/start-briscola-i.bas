

;D:\DEV\CardGamesC64\CARD_Games_C64\Dev\Briscola-it\start-briscola-i.prg ==0801==
   10 rem start briscola it
   15 print chr$(147);
   20 print"poke 44,16:poke 4096,0:new"
   25 print chr$(17);chr$(17);
   30 print"load";chr$(34);"card symbols";chr$(34);",8,1"
   35 print chr$(17);chr$(17);chr$(17);chr$(17);
   40 print"load";chr$(34);"card routines";chr$(34);",8,1"
   45 print chr$(17);chr$(17);chr$(17);chr$(17);
   50 print"new"
   52 print chr$(17);chr$(17);
   55 print"load";chr$(34);"briscola it";chr$(34);",8"
   56 print chr$(17);chr$(17);chr$(17);chr$(17);
   57 print"run"
   60 poke 198,7
   62 poke 631,19
   65 poke 632,13:poke 633,13:poke 634,13:poke 635,13:poke 636,13:poke 637,13

