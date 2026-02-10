

;D:\DEV\CardGamesC64\CARD_Games_C64\Dev\Test\test-clipping.prg ==4000==
    5 rem test card clipping
   10 k1=49152:sys k1+138
   12 poke 53280,0:poke 53281,1:print chr$(147);
   20 for i=1 to 100
   30 x=int(rnd(0)*46)-6
   40 y=int(rnd(0)*33)-8
   50 t=int(rnd(0)*14)+1:s=int(rnd(0)*4)
   60 card x,y,t,s
   70 next i
   80 get a$:if a$="" then 80
   85 if a$=" " or a$=chr$(13) then 15
   90 sys k1+169
   95 print chr$(147);
  100 end
