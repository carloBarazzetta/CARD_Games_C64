
;render-card.prg ==0801==
    5 rem render card
   10 k1=49152:sys k1+138
   12 poke 53280,0:poke 53281,1:print chr$(147);
   20 card 16,8,15,2
   30 for d=0 to 50:next d
   40 poke 828,2:sys 828
