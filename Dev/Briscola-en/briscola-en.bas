

;D:\DEV\CardGamesC64\extracted\Briscola2\briscola-2.prg ==1001==
   10 rem briscola en
   20 rem by carlo & lorenzo barazzetta
   30 rem basic + 'card' command
   40 :
   42 k1=49152:gosub 63900:sys k1+138:rem enable card command
   43 jp=31
   45 print chr$(147);
   50 dim mz(40,2):rem deck of cards
   51 dim c(3,2):rem computer's hand
   52 dim g(3,2):rem player's hand
   53 dim mt(10,4):rem flags of cards already played
   55 poke 53280,0
   60 poke 53281,15
   65 poke 54296,12
   70 for a=1 to 100
   80 card rnd(0)*34,rnd(0)*17,rnd(0)*14+1,rnd(0)*4
   90 next
  100 print chr$(28);
  101 print chr$(19);
  102 zc$=chr$(17):zn=7:gosub 9000
  105 gosub 9100:gosub 9200:print
  110 gosub 9100:print"   b r i s c o l a   "
  120 gosub 9100:gosub 9200:print
  121 print chr$(129);
  122 gosub 9100:gosub 9200:print
  125 gosub 9100:print"         by          "
  130 gosub 9100:print"   carlo & lorenzo   "
  140 gosub 9100:print"     barazzetta      "
  145 gosub 9100:print"     1987..2026      "
  150 gosub 9100:gosub 9200:print
  155 print chr$(149);
  160 gosub 9100:gosub 9200:print
  170 gosub 9100:print" [i] instructions    "
  180 gosub 9100:print" [p] play briscola   "
  190 gosub 9100:gosub 9200:print
  193 sr=17
  195 poke 198,0:jo=1:jp=31:gosub 63200
  200 get a$:jl$="":jr$="":jf$="f":ju$="u":jd$="d":gosub 63100
  201 if a$="" then gosub 63190:goto 200
  202 if a$="u" then jo=1:gosub 63200:goto 200
  203 if a$="d" then jo=2:gosub 63200:goto 200
  204 if(a$="f" or a$=" " or a$=chr$(13)) and jo=1 then a$="i":goto 210
  205 if(a$="f" or a$=" " or a$=chr$(13)) and jo=2 then a$="p"
  206 if a$="p" then 500
  210 if a$<>"i" then 200
  220 print chr$(147);
  230 print chr$(31);"instructions:"
  235 print chr$(144);"-------------"
  240 print chr$(31);"this program turns your c64 into"
  250 print"a real briscola player!"
  270 print
  280 print"rules of the game of briscola"
  290 print chr$(144);"------------------------------"
  300 print chr$(31);"played with a deck of 40 cards.        "
  310 print"the ranking of values is as follows:   "
  315 print
  320 print"name            symbol    points"
  325 print chr$(144);
  327 print"----            ------    ------"
  330 print chr$(31);
  333 print"ace                  ";chr$(192);"        11"
  335 print
  340 print"three                ";chr$(194);"        10"
  345 print
  350 print"king                 ";chr$(204);"         4"
  355 print
  360 print"queen                ";chr$(203);"         3"
  365 print
  370 print"jack                 ";chr$(202);"         2"
  375 print
  380 print"7,6,5,4,2    ";
  382 print chr$(198);",";chr$(197);",";chr$(196);",";chr$(195);",";chr$(193);
  385 print"         0"
  390 print
  400 print chr$(28);"   press [space/fire] to continue     ";
  405 poke 198,0:jp=31
  410 get a$:jf$=" ":jl$="":jr$="":ju$="":jd$="":gosub 63100:if a$="" then gosub 63190:goto 410
  420 print chr$(147);
  430 print chr$(31);"the deck is shuffled in turns"
  432 print"between the computer and the player."
  433 print
  435 print"whoever shuffles the deck deals"
  437 print"three cards each,"
  440 print"then reveals the last card of the deck:"
  445 print"this card's suit is the trump suit."
  446 print
  447 print"the suits are:"
  448 print chr$(144);chr$(160);"=spades ";chr$(161);"=clubs ";
  449 print chr$(28);chr$(162);"=diamonds ";chr$(163);"=hearts"
  450 print
  451 print chr$(31);"example: last card is the 5 of hearts   "
  452 card int((40-7)/2),12,5,3:zc$=chr$(17):zn=8:gosub 9000
  453 print"so the trump suit is hearts and"
  454 print"all hearts cards are trumps."
  455 print
  456 print chr$(28);"   press [space/fire] to continue     ";
  457 poke 198,0:jp=31
  458 get a$:jf$=" ":jl$="":jr$="":ju$="":jd$="":gosub 63100:if a$="" then gosub 63190:goto 458
  459 print chr$(147);
  460 print chr$(31);"the game is played by placing"
  461 print"one card each on the table."
  462 print
  463 print"between the two cards played, one wins"
  464 print"following this logic:"
  465 print"if both cards have the same suit,"
  466 print"the higher value wins. if they differ"
  470 print"and one card is a trump, the trump"
  472 print"wins. otherwise the first card played"
  473 print"wins."
  474 print
  475 print"the game continues by drawing one card"
  480 print"each from the deck and repeating the"
  485 print"play until the deck runs out."
  487 print
  490 print"at the end, the player who scored"
  491 print"more than 60 points wins."
  492 print"if both players scored 60 points,"
  493 print"the game is a draw.";
  494 print
  496 print
  497 print chr$(28);"     press [space/fire] to play        ";
  498 poke 198,0:jp=31
  499 get a$:jf$=" ":jl$="":jr$="":ju$="":jd$="":gosub 63100:if a$="" then gosub 63190:goto 499
  500 rem start of the game
  501 print chr$(147);chr$(146);
  502 poke 214,1:poke 211,2:sys 58640:print chr$(144);"what is your name (max 19 letters)"
  503 poke 198,0:if n$="" then n$="player"
  504 poke 214,3:poke 211,9:sys 58640:print chr$(28);">                   <";
  505 zc$=chr$(157):zn=20:gosub 9000
  506 w9=19:gosub 63700
  507 gosub 63800:if a$="n" then 501
  508 t1=int(rnd(0)*2)+1:rem decides who starts the first game
  510 rem new game
  511 rem the player who went second last game now goes first
  512 if t1=1 then t1=2:goto 514
  513 t1=1
  514 t=t1:rem t=1 computer plays, t=2 player plays
  515 rem variable initialization
  516 pg=0:rem player's points
  517 pc=0:rem computer's points
  518 np=0:rem number of spades already played
  519 nf=0:rem number of clubs already played
  520 nq=0:rem number of diamonds already played
  521 nc=0:rem number of hearts already played
  522 bc=0:rem number of trump cards in computer's hand
  523 na=0:fa=0:jc=1
  524 for m1=1 to 10:for m2=1 to 4:mt(m1,m2)=0:next m2,m1
  525 print chr$(147);
  526 print chr$(18);
  527 print chr$(144);"briscola - by carlo & lorenzo barazzetta";
  528 print chr$(28);"      computer       "
  529 print chr$(19);chr$(17);chr$(144);
  530 zc$=chr$(29):zn=21:gosub 9000:print chr$(18);
  540 for i=1 to 23
  545 print" ";chr$(157);chr$(17);
  550 next
  560 print" ";
  570 print chr$(19);
  572 zc$=chr$(17):zn=11:gosub 9000
  574 print chr$(18);"                      "
  575 print chr$(18);"                      "
  580 print chr$(18);"                      "
  581 print chr$(144);chr$(19);
  582 zc$=chr$(17):zn=23:gosub 9000
  583 zc$=chr$(29):zn=3:gosub 9000
  584 print"1";
  585 zc$=chr$(29):zn=6:gosub 9000
  586 print"2";
  587 zc$=chr$(29):zn=6:gosub 9000
  588 print"3"
  590 print chr$(18);chr$(28);
  592 print"                     ";
  595 zc$=chr$(157):zn=21:gosub 9000
  598 print tab((21-len(n$))/2);n$;
  599 for a=1 to 500:next
  600 pc=0:rem computer's points
  601 pg=0:rem player's points
  602 if t=1 then ms$="you shuffle the deck":goto 605
  603 ms$="  i shuffle the deck"
  605 gosub 40000:print chr$(18);chr$(144);ms$:gosub 50000
  610 gosub 40000
  620 for x=0 to 14 step 7
  621 if t=1 then for y=2 to 14 step 12:goto 625
  622 for y=14 to 2 step -12
  625 if y=2 then cc=1:c1=x/7+1:goto 640
  627 cc=0:g1=x/7+1
  640 gosub 45000
  680 next y,x
  682 for c1=1 to 3
  684 gosub 55010
  686 next c1
  690 gosub 10000:card 33,5,mz(40,1),mz(40,2)
  700 poke 214,2:poke 211,33:sys 58640
  702 print chr$(31);"trump:";
  710 on mz(40,2)+1 goto 730,740,750,760
  730 poke 214,3:poke 211,33:sys 58640:print chr$(144);"spades":goto 770
  740 poke 214,3:poke 211,34:sys 58640:print chr$(144);"clubs":goto 770
  750 poke 214,3:poke 211,31:sys 58640:print chr$(28);"diamonds":goto 770
  760 poke 214,3:poke 211,33:sys 58640:print chr$(28);"hearts"
  770 br=mz(40,2):rem save trump suit
  775 for w=1 to 500:next
  780 gosub 10000:card 33,10,15,1
  790 gosub 47000
  800 for i=1 to 40 step 2
  810 if t=2 then gosub 20000:gosub 30000:goto 830
  820 gosub 30000:gosub 20000
  830 gosub 60800
  950 pp=0
  970 if j1=14 or j1=15 then pp=pp+j1-4
  980 if y1=14 or y1=15 then pp=pp+y1-4
  990 if j1>10 and j1<14 then pp=pp+j1-9
 1000 if y1>10 and y1<14 then pp=pp+y1-9
 1020 if t=2 and v=1 or t=1 and v=0 then 1025
 1023 goto 1030
 1025 gosub 40000:print chr$(18);"  you take";pp;"points";
 1027 pg=pg+pp:t=2
 1028 goto 1040
 1030 gosub 40000:print chr$(18);"  i take";pp;"points";;
 1035 pc=pc+pp:t=1
 1040 gosub 55000:for w=1 to 2000:next
 1041 gosub 40000
 1042 card 22,6,0,0
 1044 card 24,10,0,0
 1048 if i=33 then:card 33,5,0,0:card 33,10,0,0
 1050 if i>34 then c(c1,1)=0:g(g1,1)=0:goto 1250
 1150 if t=2 then x=g1*7-7:y=14:cc=0:goto 1170
 1160 x=c1*7-7:y=2:cc=1
 1170 gosub 45000:gosub 47000
 1180 if t=1 then x=g1*7-7:y=14:cc=0:goto 1210
 1200 x=c1*7-7:y=2:cc=1
 1210 gosub 45000:gosub 47000
 1250 next i
 1260 gosub 40000:print chr$(18);"      game over":for w=1 to 1000:next
 1270 gosub 40000
 1280 if pc=pg then print chr$(18);"    draw 60 - 60":goto 1400
 1290 if pc>pg then print chr$(18);"  i win!";pc;"-";pg:goto 1400
 1300 print chr$(18);"  you win!";pg;"-";pc
 1400 for w=1 to 9000:next
 1410 gosub 40000:print chr$(18);" play again? [y] [n] "
 1415 jo=1:jp=31:gosub 63600
 1420 poke 198,0
 1425 get a$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub 63100
 1426 if a$="" then gosub 63190:goto 1425
 1427 if a$="l" then jo=1:gosub 63600:goto 1425
 1428 if a$="r" then jo=2:gosub 63600:goto 1425
 1429 if(a$="f" or a$=" " or a$=chr$(13)) and jo=1 then a$="y"
 1430 if(a$="f" or a$=" " or a$=chr$(13)) and jo=2 then a$="n"
 1435 if a$="y" then 510
 1440 if a$<>"n" then 1425
 1450 print chr$(147);chr$(144);"bye!":goto 63999
 9000 rem print character zc$ repeated zn times
 9005 if zc$="" goto 9099
 9007 if zn<=0 goto 9099
 9010 for zi=1 to zn
 9020 print zc$;
 9030 next zi
 9099 return
 9100 rem move cursor right and print in reverse
 9110 zc$=chr$(29):zn=9:gosub 9000
 9115 print chr$(18);
 9120 return
 9200 rem print 21 spaces
 9210 print"                     ";
 9220 return
10000 rem card sound effect
10005 poke 54273,255
10010 poke 54277,4*16
10020 poke 54278,0
10030 poke 54276,128
10035 poke 54276,129
10040 return
10500 rem error buzz
10510 poke 54280,5
10520 poke 54284,2*16+2
10530 poke 54285,8*16+2
10540 poke 54283,8
10545 poke 54283,33
10550 for w7=1 to 100:next
10560 poke 54283,32
10570 poke 198,0
10580 return
20000 rem player's turn to play a card
20005 gosub 40000:print chr$(18);"  your turn, card ?"
20006 jp=31:poke 198,0
20007 if g(jc,1)=0 then jc=jc+1:if jc>3 then jc=1
20008 if g(jc,1)=0 then jc=jc+1:if jc>3 then jc=1
20009 gosub 63400
20010 get a$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub 63100
20011 if a$="" then gosub 63190:goto 20010
20012 if a$<>"l" then 20016
20013 jc=jc-1:if jc<1 then jc=3
20014 if g(jc,1)=0 then 20013
20015 gosub 63400:goto 20010
20016 if a$<>"r" then 20020
20017 jc=jc+1:if jc>3 then jc=1
20018 if g(jc,1)=0 then 20017
20019 gosub 63400:goto 20010
20020 if a$="f" or a$=" " or a$=chr$(13) then a$=mid$(str$(jc),2)
20021 if val(a$)<1 or val(a$)>3 then 20010
20022 g1=val(a$):jc=g1
20030 if g(g1,1)=0 then 20010
20035 poke 214,23:poke 211,2:sys 58640:print chr$(144);"   ";:poke 211,9:sys 58640:print"   ";:poke 211,16:sys 58640:print"   ";
20040 card g1*7-7,14,0,0
20050 gosub 10000:card 24,10,g(g1,1),g(g1,2)
20060 gosub 40000
20070 return
30000 rem computer's turn to play a card
30005 gosub 40000:print chr$(18);"   my turn... wait"
30010 rem if pc>60 then 30100:rem pick a random card to play
30020 if t=2 then 30200
30030 if t=1 then 32000
30100 for w=1 to 1000:next
30110 c1=int(rnd(0)*3)+1:rem pick a random card from the 3 cards
30120 if c(c1,1)=0 then 30110
30130 goto 39000
30200 rem computer responds to play
30201 bc=0
30202 for w=1 to 3:if c(w,2)=br then bc=bc+1
30203 next
30204 for c1=1 to 3
30205 if c(c1,1)=0 then pt(c1)=-100:goto31290
30210 gosub 60800
30215 pp=0
30220 if j1=14 or j1=15 then pp=pp+j1-4
30230 if y1=14 or y1=15 then pp=pp+y1-4
30240 if j1>10 and j1<14 then pp=pp+j1-9
30260 if y1>10 and y1<14 then pp=pp+y1-9
30270 if v=1 then pt(c1)=-pp:goto30300
30280 pt(c1)=pp-.01
30300 if y1=15 and y2=br then pt(c1)=pt(c1)-20
30310 if y2=br and bc<2 then pt(c1)=-5
30320 if y2=br then pt(c1)=pt(c1)-.7-(.1*(y1-8))
31290 next c1
31300 fp=0:mx=1
31310 for w=2 to 3
31320 if pt(w)>pt(mx) then mx=w:goto 31330
31330 next
31540 c1=mx
31550 goto 39000
32000 rem computer plays first
32010 bc=0:for c1=1 to 3
32020 if c(c1,2)=br then bc=bc+1
32030 next c1
32040 ba=0:for w=1 to 10
32050 if mt(w,br+1)=0 then ba=1
32060 next
32070 for c1=1 to 3
32080 gosub 62000
32090 next c1
32100 cx=1
32110 for w=2 to 3
32120 if pt(w)>pt(cx) then cx=w
32130 next
32140 c1=cx
39000 gosub 40000
39010 card c1*7-7,2,0,0
39020 gosub 10000:card 22,6,c(c1,1),c(c1,2)
39025 return
40000 rem clear message area and position cursor
40001 print chr$(19);
40002 zc$=chr$(17):zn=12:gosub 9000
40003 print chr$(18);chr$(144);
40005 print"                     "
40006 print chr$(19);
40007 zc$=chr$(17):zn=12:gosub 9000
40010 return
45000 rem deal a card to computer or player and draw it on table
45001 rem if cc=1 card goes to computer, if cc=0 to player
45002 gosub 10000
45005 if cc=1 then:card x,y,15,1:c(c1,1)=mz(ps,1):c(c1,2)=mz(ps,2)
45010 if cc=0 then:card x,y,mz(ps,1),mz(ps,2):g(g1,1)=mz(ps,1):g(g1,2)=mz(ps,2)
45020 ps=ps+1
45025 if cc=1 then gosub 55010
45030 return
47000 rem print number of cards left in the deck
47001 print chr$(19)
47002 zc$=chr$(17):zn=18:gosub 9000
47003 zc$=chr$(29):zn=34:gosub 9000
47004 print chr$(151);
47009 print"cards";
47010 print chr$(17);
47011 zc$=chr$(157):zn=5:gosub 9000
47012 print" deck";
47013 print chr$(17);chr$(17);
47014 zc$=chr$(157):zn=4:gosub 9000
47015 print"   ";
47016 zc$=chr$(157):zn=3:gosub 9000
47019 print 40-ps+1
47020 return
50000 rem shuffle the deck
50002 for c=1 to 40:mz(c,1)=0:next c
50008 for c=0 to 3
50010 for b=1 to 10
50015 gosub 10000
50020 ps=int(rnd(0)*40+1)
50030 if mz(ps,1)=0 then mz(ps,1)=b:mz(ps,2)=c:goto 50070
50040 if ps=40 then ps=0
50050 ps=ps+1
50060 goto 50030
50070 next b,c
50080 rem convert cards 8,9,10 to jack,queen,king
50085 for c=1 to 40
50090 if mz(c,1)>7 then mz(c,1)=mz(c,1)+3
50100 next
50110 ps=1:rem first card to draw from deck
50120 return
55000 rem mark card as played
55005 fl=0:on g(g1,2)+1 gosub 55100,55200,55300,55400
55010 fl=1:on c(c1,2)+1 gosub 55100,55200,55300,55400
55020 return
55100 rem mark spades card as played
55105 np=np+1
55110 if fl=1 then mt((c(c1,1)+3*(c(c1,1)>10)),1)=1
55120 if fl=0 then mt((g(g1,1)+3*(g(g1,1)>10)),1)=1
55130 return
55200 rem mark clubs card as played
55205 nf=nf+1
55210 if fl=1 then mt((c(c1,1)+3*(c(c1,1)>10)),2)=1
55220 if fl=0 then mt((g(g1,1)+3*(g(g1,1)>10)),2)=1
55230 return
55300 rem mark diamonds card as played
55305 nq=nq+1
55310 if fl=1 then mt((c(c1,1)+3*(c(c1,1)>10)),3)=1
55320 if fl=0 then mt((g(g1,1)+3*(g(g1,1)>10)),3)=1
55330 return
55400 rem mark hearts card as played
55405 nc=nc+1
55410 if fl=1 then mt((c(c1,1)+3*(c(c1,1)>10)),4)=1
55420 if fl=0 then mt((g(g1,1)+3*(g(g1,1)>10)),4)=1
55430 return
60800 rem determine who won the current hand
60801 rem if t=1 then computer played first
60802 rem if t=2 then computer played second
60810 if t=2 then j1=g(g1,1):j2=g(g1,2):y1=c(c1,1):y2=c(c1,2):goto 60850
60840 j1=c(c1,1):j2=c(c1,2):y1=g(g1,1):y2=g(g1,2)
60845 rem j1(card) and j2(suit) are the first card played
60847 rem y1(card) and y2(suit) are the second card played
60850 if j1=1 then j1=15
60860 if y1=1 then y1=15
60870 if j1=3 then j1=14
60880 if y1=3 then y1=14
60890 if j2<>y2 and y2<>br then v=1:goto 60950
60910 if j2<>y2 and y2=br then v=0:goto 60950
60920 if j1>y1 then v=1:goto 60950
60930 v=0
60950 rem if v=0 then the first player lost
60955 rem if v=1 then the first player won
60957 return
62000 rem mega-galactic ai routine
62010 nn=c(c1,1)
62012 if nn=0 then pt(c1)=-100:goto 63000
62020 if nn=1 then nn=15
62025 if nn=3 then nn=14
62110 pt(c1)=0
62120 if nn=14 or nn=15 then pt(c1)=-20-nn
62130 if bc<2 and c(c1,2)=br then pt(c1)=-17-nn
62140 if mt(1,c(c1,2)+1)=0 then pt(c1)=pt(c1)-5
62150 if mt(3,c(c1,2)+1)=0 then pt(c1)=pt(c1)-4
63000 return
63100 rem --- joystick port 2 reading ---
63110 jv=peek(56320) and 31
63115 if a$<>"" then return
63117 jx=(not jp) and 31 and jv:jp=jv
63120 if jx=0 then return
63130 if(jx and 4)<>0 then if jl$<>"" then a$=jl$:return
63140 if(jx and 8)<>0 then if jr$<>"" then a$=jr$:return
63150 if(jx and 16)<>0 then if jf$<>"" then a$=jf$:return
63160 if(jx and 1)<>0 then if ju$<>"" then a$=ju$:return
63170 if(jx and 2)<>0 then if jd$<>"" then a$=jd$:return
63180 return
63190 return
63200 rem highlight splash option
63210 poke 214,sr:poke 211,10:sys 58640:print chr$(149);chr$(18);"[i]";
63212 poke 214,sr+1:poke 211,10:sys 58640:print"[p]";
63214 if jo=1 then poke 214,sr:poke 211,10:sys 58640:print">";chr$(146);"i";chr$(18);"<";
63216 if jo=2 then poke 214,sr+1:poke 211,10:sys 58640:print">";chr$(146);"p";chr$(18);"<";
63220 return
63400 rem highlight card selection
63402 poke 214,23
63405 poke 211,2:sys 58640:print chr$(144);"   ";:poke 211,9:sys 58640:print"   ";:poke 211,16:sys 58640:print"   ";
63406 if g(1,1)>0 then poke 211,2:sys 58640:print chr$(144);"[1]";
63407 if g(2,1)>0 then poke 211,9:sys 58640:print"[2]";
63408 if g(3,1)>0 then poke 211,16:sys 58640:print"[3]";
63410 if jc=1 then poke 211,2:sys 58640:print">";chr$(18);"1";chr$(146);"<";
63412 if jc=2 then poke 211,9:sys 58640:print">";chr$(18);"2";chr$(146);"<";
63414 if jc=3 then poke 211,16:sys 58640:print">";chr$(18);"3";chr$(146);"<";
63420 return
63600 rem highlight y/n
63605 poke 214,12:poke 211,13:sys 58640:print chr$(144);chr$(18);"[y]";
63610 poke 211,17:sys 58640:print"[n]";
63615 if jo=1 then poke 214,12:poke 211,13:sys 58640:print">";chr$(146);"y";chr$(18);"<";
63620 if jo=2 then poke 214,12:poke 211,17:sys 58640:print">";chr$(146);"n";chr$(18);"<";
63625 return
63700 rem controlled name input
63701 w5=len(n$)+1:jk=0:jn=1:jp=31:print chr$(28);
63702 print n$;
63704 print chr$(17);chr$(157);" ";chr$(144);"^";chr$(28);chr$(145);chr$(157);
63705 get a$:jl$=chr$(157):jr$=chr$(29):jf$=chr$(133):ju$=chr$(145):jd$="":gosub 63100
63706 if a$="" then gosub 63190:goto 63705
63708 if a$=chr$(157) then jn=jn-1:if jn<1 then jn=27
63709 if a$=chr$(157) then goto 63704
63710 if a$=chr$(29) then jn=jn+1:if jn>27 then jn=1
63711 if a$=chr$(29) then goto 63704
63712 if a$=chr$(133) and jk=0 then a$=chr$(13):goto 63716
63713 if a$=chr$(133) and jn<=26 then a$=chr$(64+jn):goto 63716
63714 if a$=chr$(133) then a$=" ":goto 63716
63715 if a$=chr$(145) then a$=chr$(13):goto 63716
63716 w6=asc(a$)
63718 if(w6<65 or w6>90) and w6<>13 and w6<>20 and w6<>32 then goto 63705
63720 if w6=13 and n$="" then goto 63705
63721 if w6=13 then print chr$(17);" ":goto 63740
63722 if w6=20 and jk=0 then gosub 63750:n$=left$(n$,len(n$)-1):w5=len(n$)+1:jk=1:print n$;:goto 63704
63724 if w6=20 and w5<=1 then goto 63704
63726 if w6=20 then print chr$(17);" ";chr$(145);chr$(157);chr$(157);" ";chr$(157);:n$=left$(n$,len(n$)-1):w5=w5-1:goto 63704
63728 if jk=0 then n$="":gosub 63750:w5=1:jk=1
63730 if w5>w9 then goto 63705
63732 print a$;:n$=n$+a$
63734 w5=w5+1:goto 63704
63740 return
63750 rem clear name field
63752 w8=w5-1:for w7=1 to w8:print chr$(157);:next:for w7=1 to w8:print" ";:next:for w7=1 to w8:print chr$(157);:next
63754 print chr$(17);:for w7=0 to w8:print" ";:next:for w7=0 to w8:print chr$(157);:next:print chr$(145);
63756 return
63800 rem confirm name
63805 poke 214,5:poke 211,10:sys 58640:print chr$(144);"is this ok? [y]  [n]";
63810 jo=1:jp=31:gosub 63850
63815 poke 198,0
63820 get a$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub 63100
63822 if a$="" then gosub 63190:goto 63820
63824 if a$="l" then jo=1:gosub 63850:goto 63820
63826 if a$="r" then jo=2:gosub 63850:goto 63820
63828 if(a$="f" or a$=" " or a$=chr$(13)) and jo=1 then a$="y"
63830 if(a$="f" or a$=" " or a$=chr$(13)) and jo=2 then a$="n"
63832 if a$="y" then return
63834 if a$<>"n" then 63820
63836 return
63850 rem highlight confirm y/n
63852 poke 214,5:poke 211,22:sys 58640:print chr$(144);"[y]";
63854 poke 211,27:sys 58640:print"[n]";
63856 if jo=1 then poke 214,5:poke 211,22:sys 58640:print">";chr$(18);"y";chr$(146);"<";
63858 if jo=2 then poke 214,5:poke 211,27:sys 58640:print">";chr$(18);"n";chr$(146);"<";
63860 return
63900 rem check if card command is loaded in memory
63905 if k1=0 then print"variable k1 not initialized":goto 63960
63910 w1=peek(k1+120)
63920 w2=peek(k1+121)
63930 w3=peek(k1+122)
63940 w4=peek(k1+123)-128
63950 if w1=asc("c") and w2=asc("a") and w3=asc("r") and w4=asc("d") then 63990
63960 print"card command not loaded in memory":goto 63999
63990 return
63999 end

