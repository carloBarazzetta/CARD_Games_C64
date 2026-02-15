

;D:\DEV\CardGamesC64\CARD_Games_C64\Dev\Poker4-en\poker-4-en.prg ==1001==
   10 rem p o k e r  4
   20 rem by c&l barazzetta
   30 rem basic+comando 'card'
   40 :
   41 poke54276,8:poke54283,8:poke54296,12:poke650,0
   42 gosub63000
   43 jp=31
   45 print"{clr}":k1=49152:sysk1+138
   50 poke53280,0
   60 poke53281,1
   67 dimmz(52,2):dimca(4,5,2):dimva(14,2):dimms$(23)
   70 fora=1to100
   80 cardrnd(0)*34,rnd(0)*17,rnd(0)*14+1,rnd(0)*4
   90 next
  100 print"{home}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{red}{rvon}                     "
  110 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}    p o k e r   4    "
  120 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  122 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry1}{rvon}                     "
  125 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}         by          "
  130 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}   carlo & lorenzo   "
  140 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}     barazzetta      "
  145 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}     1987..2026      "
  150 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  160 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry2}{rvon}                     "
  170 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [i] instructions    "
  180 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [p] play poker 4    "
  190 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  193 sr=17
  195 poke198,0:jo=1:jp=31:gosub63200
  200 geta$:jl$="":jr$="":jf$="f":ju$="u":jd$="d":gosub63100
  201 ifa$=""thengosub63190:goto200
  202 ifa$="u"thenjo=1:gosub63200:goto200
  203 ifa$="d"thenjo=2:gosub63200:goto200
  204 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="i":goto210
  205 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="p"
  206 ifa$="p"then600
  210 ifa$<>"i"thengosub10500:goto200
  220 print"{clr}";
  230 print"{blk}instructions:"
  240 print"-------------"
  260 print"{grn}with this program you can simulate a  "
  270 print"poker game between 4 players!"
  280 print"you are one player while the other 3 are";
  290 print"controlled by the computer."
  300 print:print"{blk}poker rules:"
  310 print"------------"
  320 print"{blu}you choose whether to use a 52-card"
  330 print"deck or a 32-card deck (7 to ace)."
  340 print"each player receives 5 cards and must"
  345 print"form a combination."
  350 print"possible combinations are (in ascending"
  360 print"order of value):                 "
  370 print"{red}pair, two pair, three of a kind,"
  380 print"straight, full house(*), flush(*),"
  385 print"four of a kind, straight flush"
  390 print
  400 print"{grn}(*) 52 cards: full house beats flush."
  410 print"    32 cards: flush beats full house."
  440 print:print"{gry1}{down}   press [space/fire] to continue";
  445 poke198,0:jp=31
  450 geta$:jf$=" ":jl$="":jr$="":ju$="":jd$="":gosub63100:ifa$=""thengosub63190:goto450
  460 print"{clr}{blu}to get one of these combinations each"
  462 print"player can discard and draw up to 4    "
  464 print"new cards.                             "
  466 print"if several players get the same"
  470 print"combination, the one with the higher"
  480 print"value wins. if still tied, the higher  "
  490 print"suit wins. (suit ranking:"
  500 print"hearts {red}{CBM-T}{blu},diamonds {red}{CBM-I}{blu},clubs {blk}{CBM-K}{blu},spades {blk}{$a0}{blu})."
  505 print"e.g. a 5 of {red}{CBM-T}{blu} beats a 5 of {red}{CBM-I}{blu}."
  510 print"depending on the cards you hold, both  "
  520 print"before and after the draw, you must    "
  530 print"decide how much money to bet.          "
  540 print
  550 print"the player with the highest combination"
  560 print"at the end wins the pot.               "
  570 print:print"{grn}enjoy the game!                      "
  580 print:print:print"{gry1}     press [space/fire] to play"
  585 poke198,0:jp=31
  590 geta$:jf$=" ":jl$="":jr$="":ju$="":jd$="":gosub63100:ifa$=""thengosub63190:goto590
  600 print"{clr}"
  605 print"{blk}           enter player names"
  607 print:print
  608 w=4:n$(4)="player"
  609 print"{brn}{rght}{rght}enter your name >            <{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}";:goto640
  610 print
  612 print"{blk}           enter player names"
  613 print"{blk}         controlled by computer"
  615 print
  620 forw=1to3
  625 n$(w)=""
  626 ifw=1thenn$(w)="first"
  627 ifw=2thenn$(w)="second"
  628 ifw=3thenn$(w)="third"
  630 print"{red}{rght}{rght}player"w"{left}'s name >        <{left}{left}{left}{left}{left}{left}{left}{left}{left}";
  640 w9=13:ifw<>4thenw9=9
  641 w5=len(n$(w))+1:jk=0:jn=1:jp=31:print"{blu}";
  642 printn$(w);
  645 print"{down}{left} {blk}^{blu}{up}{left}";
  646 geta$:jl$=chr$(157):jr$=chr$(29):jf$=chr$(133):ju$=chr$(145):jd$="":gosub63100
  647 ifa$=""thengosub63190:goto646
  648 ifa$=chr$(157)thenjn=jn-1:ifjn<1thenjn=27
  649 ifa$=chr$(157)thengoto645
  650 ifa$=chr$(29)thenjn=jn+1:ifjn>27thenjn=1
  651 ifa$=chr$(29)thengoto645
  652 ifa$=chr$(133)andjk=0thena$=chr$(13):goto656
  653 ifa$=chr$(133)andjn<=26thena$=chr$(64+jn):goto656
  654 ifa$=chr$(133)thena$=" ":goto656
  655 ifa$=chr$(145)thena$=chr$(13):goto656
  656 w6=asc(a$)
  658 if(w6<65orw6>90)andw6<>13andw6<>20andw6<>32thengosub10500:goto646
  660 ifw6=13andn$(w)=""thengosub10500:goto646
  661 ifw6=13thenprint"{down} ":goto685
  662 ifw6=20andjk=0thengosub54850:n$(w)=left$(n$(w),len(n$(w))-1):w5=len(n$(w))+1:jk=1:printn$(w);:goto645
  664 ifw6=20andw5<=1thengosub10500:goto645
  666 ifw6=20thenprint"{down} {up}{left}{left} {left}";:n$(w)=left$(n$(w),len(n$(w))-1):w5=w5-1:goto645
  668 ifjk=0thenn$(w)="":gosub54850:w5=1:jk=1
  670 ifw5=w9thengosub10500:goto646
  675 printa$;:n$(w)=n$(w)+a$
  680 w5=w5+1:goto645
  685 print:ifw=4then612
  686 nextw
  690 w8=0:forw=1to3:forw1=w+1to4:ifn$(w)=n$(w1)thenw8=1
  692 nextw1,w:ifw8=0then710
  695 forw7=1to4:print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
  696 ifw7/2=int(w7/2)thenprint"{blk}    duplicate names, enter again!  ":goto698
  697 print"{red}    duplicate names, enter again!  "
  698 forw6=1to400:nextw6:nextw7:goto600
  710 print:print"{gry1}     is this ok?      [Y]   [N]       "
  715 jo=1:jp=31:mr=peek(214)-1:gosub63600
  720 geta$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub63100
  721 ifa$=""thengosub63190:goto720
  722 ifa$="l"thenjo=1:gosub63600:goto720
  723 ifa$="r"thenjo=2:gosub63600:goto720
  724 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="y"
  725 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="n"
  726 ifa$<>"y"anda$<>"n"thengosub10500:goto720
  730 ifa$="n"then600
  735 print"{clr}"
  736 print"{blk}          game configuration"
  737 print
  738 print"    (enter to confirm the value)"
  739 bo=1000:an=10:pm=100:nm=52:print:print
  740 print"{grn}            wallet:{blk}$1000  {grn}>     <{left}{left}{left}{left}{left}{left}";:vi=100:v=bo:gosub54700:bo=v
  742 print"{grn}              ante:{blk}  $10  {grn}>     <{left}{left}{left}{left}{left}{left}";:vi=10:v=an:gosub54700:an=v
  744 print"{grn}           max bet:{blk} $100  {grn}>     <{left}{left}{left}{left}{left}{left}";:vi=10:v=pm:gosub54700:pm=v
  745 ifbo<2*pmoran>=pmthengosub54730:goto735
  746 print:print"{grn}   deck:  {red}[S]{grn} short (32 cards)":print"{grn}          {red}[F]{grn} full (52 cards)"
  747 jo=1:jp=31:mr=peek(214)-2:gosub63500
  748 poke198,0
  749 geta$:jl$="":jr$="":jf$="f":ju$="u":jd$="d":gosub63100
  750 ifa$=""thengosub63190:goto749
  751 ifa$="u"thenjo=1:gosub63500:goto749
  752 ifa$="d"thenjo=2:gosub63500:goto749
  753 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="s"
  754 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="f"
  755 ifa$<>"s"anda$<>"f"thengosub10500:goto749
  756 ifa$="s"thennm=32
  757 print:print:print:print"{blk}         chosen deck:";nm;"cards"
  758 vf=6:vh=2:ifnm=52thenvf=5:vh=3
  759 poke198,0:print:print:print"{gry1}     is this ok?      [Y]   [N]       "
  760 jo=1:jp=31:mr=peek(214)-1:gosub63600
  761 geta$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub63100
  762 ifa$=""thengosub63190:goto761
  763 ifa$="l"thenjo=1:gosub63600:goto761
  764 ifa$="r"thenjo=2:gosub63600:goto761
  765 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="y":goto767
  766 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="n":goto767
  767 ifa$<>"y"anda$<>"n"thengosub10500:goto761
  768 ifa$="n"then735
  769 print"{clr}"
  770 forw=1to4
  775 s(w)=bo
  810 next
  885 gosub55000
  900 forw=1to3
  905 cx=(w-1)*14:cy=0:cw=12:c$=n$(w):cc=5:gosub59950
  920 next
  925 cx=0:cy=24:cw=20:c$=n$(4):cc=5:gosub59950
  930 forw=1to4:gosub57005:nextw
  940 gosub56000
  950 in$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{blk}{rvon}"
  960 cl$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{blk}{rvon}                                        {home}"
  965 gosub 58030
  980 gosub50000
  999 g1=3
 1000 rem main loop
 1005 pu=0:ba=0:gosub56000
 1007 forkk=1to4:ifs(kk)>=anthengosub60000
 1009 next
 1010 forgj=1to3
 1012 ifs(gj)<anthenms=23:goto1015
 1013 ms=10
 1015 gosub58000:nextgj
 1020 ap=0:ls=0
 1030 forw=1to4:vs(w)=0:ifs(w)<anthenvs(w)=-1
 1032 next
 1050 g1=g1+1:ifg1=5theng1=1
 1052 ifs(g1)<anthen1050
 1070 g=g1+1:ifg=5theng=1
 1071 rem ante
 1072 forw=1to4:ifs(w)<anthen1078
 1074 s(w)=s(w)-an:ifw=g1thens(w)=s(w)-an
 1075 ba=ba+an:ifw=g1thenba=ba+an
 1076 gosub57005
 1078 next
 1079 gosub56000
 1080 ms=9:gj=g1:gosub58000
 1090 gosub50030
 1100 ms=10:gosub58000
 1110 gi=g:gosub52000
 1150 rem initial betting round
 1157 fl=0
 1160 forw5=1to4
 1165 ifg>=5theng=1
 1170 ifvs(g)=-1then1250
 1180 ifvs(g)=puandvs(g)<>0then1250
 1190 ifg=4thengosub11000:fl=1:goto1250
 1200 gosub14000:fl=1
 1250 g=g+1:nextw5
 1255 ifvs(1)<=0andvs(2)<=0andvs(3)<=0andvs(4)<=0thenforw=1to500:next:goto1007
 1260 iffl=1then1157
 1270 pu=0:gosub56000
 1272 gosub62000:ifc0=3then1850
 1275 rem card draw
 1280 forw5=1to4
 1290 ifg>=5theng=1
 1295 ifvs(g)=-1then1320
 1300 ifg=4thengosub13000:gosub61120:goto1320
 1310 gj=g:gosub59810:gosub61000
 1320 g=g+1:nextw5
 1330 kk=4:gosub60000:gosub53000
 1335 g=4:gosub54000:gosub54600:gosub54660
 1500 rem final betting round
 1510 g=ap:ap=0:forw=1to4:ifvs(w)<>-1thenvs(w)=0
 1515 nextw
 1520 fl=0
 1530 forw5=1to4
 1540 ifg>=5theng=1
 1550 ifvs(g)=-1then1600
 1560 ifvs(g)=puandvs(g)<>0then1600
 1570 ifg=4thengosub16000:fl=1:goto1600
 1580 gosub15000:fl=1
 1600 g=g+1:nextw5
 1610 ifvs(1)<=0andvs(2)<=0andvs(3)<=0andvs(4)<=0then1630
 1620 iffl=1then1520
 1625 gosub62000:ifc0=3then1850
 1630 rem determine winner
 1640 g=4:gosub54000
 1650 mx=0:pt(0)=0
 1660 forw=1to4
 1662 ifvs(w)=-1then1670
 1665 ifpt(w)>pt(mx)thenmx=w
 1670 nextw
 1730 rem showdown
 1740 ifap<>0theng=ap
 1750 forw5=1to4
 1760 ifg>=5theng=1
 1765 ifg=4then1830
 1770 ifvs(g)=-1then1830
 1800 kk=4:gosub60000:kk=g:gosub60000
 1802 printcl$;:kk=4:gosub60000
 1803 printcl$;
 1804 gosub54600
 1805 gj=4:printin$;"{rvon}{blk}"n$(g)":"co$".";

 1810 ji=g:gosub52070
 1820 ms=12:gosub58000
 1830 g=g+1:nextw5
 1840 gosub54690:kk=4:gosub60000
 1850 printcl$;
 1855 forgj=1to3:ifs(gj)<anthenms=23:goto1858
1856 ms=10
1858 gosub58000:nextgj
 1860 ifmx=4thenms=22:gj=4:gosub58000:goto1930
 1900 ms=10:gj=mx:gosub58000:ms=20:gosub58000
 1930 ms=12:gj=4:gosub58000
 2000 s(mx)=s(mx)+ba:ba=0:pu=0:g=mx:gosub56000:gosub57000
 2010 printcl$
 2020 rem check eliminations
 2025 forw=1to3:ifs(w)>=anthen2028
 2026 gj=w:ms=23:gosub58000
 2028 nextw
 2030 ifs(4)<anthengosub54760
 2035 w8=0:forw=1to3:ifs(w)>=anthenw8=w8+1
 2037 nextw
 2040 ifs(4)>=anthen2045
 2041 w1$="     too bad...      ":w2$="     you lost!!      ":goto2060
 2045 ifw8>0then1000
 2046 w1$="  congratulations!!  ":w2$="      you won!!      ":goto2060
 2060 rem game over
 2061 forw=1to250:next:poke198,0
 2062 ms=12:gj=4:gosub58000
 2065 print"{clr}"
 2070 fora=1to100
 2080 cardrnd(0)*34,rnd(0)*17,rnd(0)*14+1,rnd(0)*4
 2090 next
 2100 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{red}{rvon}                     "
 2110 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}    p o k e r   4    "
 2120 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
 2122 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry1}{rvon}                     "
 2125 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}"w1$
 2130 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry1}{rvon}"w2$
 2135 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry1}{rvon}     ready for a     "
 2140 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}   new challenge?    "
 2150 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
 2160 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry2}{rvon}                     "
 2170 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [i] instructions    "
 2180 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [p] play poker 4    "
 2190 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
 2194 sr=18
 2195 goto195
 9999 goto1000
10000 poke54273,255
10010 poke54277,4*16
10020 poke54278,0
10030 poke54276,128
10035 poke54276,129
10040 return
10500 poke54280,5
10510 poke54284,2*16+2
10520 poke54285,8*16+2
10530 poke54283,8
10535 poke54283,33
10540 forw7=1to100:next
10550 poke54283,32
10560 poke198,0
10590 return
11000 rem initial player bet
11005 fz=1
11010 ifap<>0then11150
11020 ms=14:gj=4:gosub58000
11022 jo=1:jp=31:gosub63300
11030 geta$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub63100
11031 ifa$=""thengosub63190:goto11030
11032 ifa$="l"thenjo=1:gosub63300:goto11030
11033 ifa$="r"thenjo=2:gosub63300:goto11030
11034 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="o"
11035 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="p"
11036 ifa$<>"o"anda$<>"p"thengosub10500:goto11030
11040 ifa$="p"then11100
11050 printcl$:gosub12000
11060 printcl$:pu=sl:s(4)=s(4)-sl:vs(4)=pu:ba=ba+pu:ap=4
11100 goto11400
11150 ms=15:gj=4:gosub58000
11152 jo=1:jp=31:gosub63300
11160 geta$:jl$="<":jr$=">":jf$="f":ju$="":jd$="":gosub63100
11161 ifa$=""thengosub63190:goto11160
11162 ifa$="<"thenjo=jo-1:ifjo<1thenjo=3
11163 ifa$="<"thengosub63300:goto11160
11164 ifa$=">"thenjo=jo+1:ifjo>3thenjo=1
11165 ifa$=">"thengosub63300:goto11160
11166 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="c"
11167 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="r"
11168 if(a$="f"ora$=" "ora$=chr$(13))andjo=3thena$="f"
11169 ifa$<>"c"anda$<>"r"anda$<>"f"thengosub10500:goto11160
11170 ifa$="f"thenvs(4)=-1:kk=4:gosub60000:goto11400
11180 ifa$="c"thens(4)=s(4)-(pu-vs(4)):ba=ba+(pu-vs(4)):vs(4)=pu:goto11400
11190 printcl$:gosub12000
11210 printcl$:ba=ba+pu+sl:s(4)=s(4)-(pu-vs(4))-sl:vs(4)=pu+sl:pu=vs(4)
11400 gosub56000:gosub57000:printcl$:return
12000 sl=an:poke650,128
12020 ms=16:gj=4:gosub58000:print"$";sl;"{left} ";
12025 jp=31
12030 geta$:jl$="":jr$="":jf$=chr$(13):ju$="+":jd$="-":gosub63100
12031 ifa$=""thengosub63190:goto12030
12035 ifa$<>"+"anda$<>"-"anda$<>chr$(13)thengosub10500:goto12030
12040 ifa$=chr$(13)then12080
12050 ifa$<>"-"then12070
12060 sl=sl-an:ifsl<anthensl=an:gosub10500
12065 goto12020
12070 sl=sl+an:ifsl>pmorsl>s(4)-pu+vs(4)thensl=sl-an:gosub10500
12075 goto12020
12080 poke650,0
12090 return
13000 printcl$:printin$;"{rvon}{blk}  [1]     [2]     [3]     [4]     [5]  ";
13001 poke198,0
13005 forw=1to5:cb(w,4)=0:nextw
13006 ct=0:jc=1:jp=31:gosub63400
13007 geta$:jl$="l":jr$="r":jf$=chr$(13):ju$="u":jd$="d":gosub63100
13008 ifa$=""thengosub63190:goto13007
13009 ifa$="l"thenjc=jc-1:ifjc<1thenjc=5
13010 ifa$="l"thengosub63400:goto13007
13011 ifa$="r"thenjc=jc+1:ifjc>5thenjc=1
13012 ifa$="r"thengosub63400:goto13007
13013 ifa$="u"ora$="d"ora$=" "thena$=mid$(str$(jc),2)
13014 rem enter/fire=confirm, space=flip card
13015 if(val(a$)<1orval(a$)>5)anda$<>chr$(13)thengosub10500:goto13007
13016 ifa$=chr$(13)thenprintcl$:goto13060
13017 y=14:x=(val(a$)-1)*8
13020 ifcb(val(a$),4)=0andct<>4then13040
13025 ifcb(val(a$),4)=1andct<>0then13030
13027 gosub10500:goto13007
13030 ct=ct-1:cb(val(a$),4)=0:gosub10000
13032 cardx,y,ca(4,val(a$),1)+(ca(4,val(a$),1)=14)*13,ca(4,val(a$),2)
13035 goto13007
13040 ct=ct+1:cb(val(a$),4)=1:gosub10000:cardx,y,15,2
13050 goto13007
13060 gj=4
13070 forw=1to5
13080 ifcb(w,4)=1thenx=(w-1)*8:cardx,y,0,0
13090 nextw
13095 forrr=1to500:next
13100 return
14000 rem choose play and bet amount
14001 gosub54000
14002 gj=g:gosub59000
14010 rd=int(rnd(0)*5)*an-2*an+an*(ap=0)
14020 w9=int(pt(g))
14022 w8=0:forw=1to4:ifvs(w)=-1thenw8=w8+1
14024 next
14026 ifw8=2thenrd=rd-4*an*(rnd(0)<.8)
14030 w9=(w9+(w9=7)*4)*2*an:rd=w9+rd
14040 ifap<>0then14250
14100 ifrd<=0thenms=5:gosub58000:return:rem pass
14200 sl=rd:ifsl>pmthensl=pm
14202 ifsl>s(g)thensl=s(g)
14203 ifsl<anthenms=5:gosub58000:return
14205 ms=2:gosub58000:c$="$"+mid$(str$(sl),2):gosub59950
14210 s(g)=s(g)-sl:vs(g)=sl:ap=g:pu=sl:ba=ba+sl:rem set opening
14220 goto14530
14250 ms=10:gj=g:gosub58000
14252 ifvs(g)>anthen14260
14255 ifpu-rd>3*anthenms=1:gosub58000:kk=g:gosub60000:vs(g)=-1:return:rem fold
14260 rd=rd-pu
14270 ifrd>=anthen14400
14300 s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem call
14320 ms=3:gj=g:gosub58000
14330 goto14530
14400 ifrd>pmthenrd=pm
14401 ifrd>s(g)-pu+vs(g)thenrd=s(g)-pu+vs(g)
14402 ifrd<anthen14300
14405 pu=pu+rd:s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem raise
14420 ms=4:gosub58000:c$="$"+mid$(str$(rd),2):gosub59950
14530 gosub56000:gosub57000:return
15000 rem final bet
15010 gosub54000
15020 gj=g:ms=10:gosub58000
15030 rd=int(rnd(0)*5)*an-2*an
15040 w9=int(pt(g))
15050 rd=rd+w9*an-(w9>1)*w9*w9*an+2*an*(ap=0)+4*an*(w9=0)
15070 w8=0:forw=1to4:ifvs(w)=-1thenw8=w8+1
15080 next
15090 ifw8=2andap<>0thenrd=rd-4*an*(w9<>0)
15100 ifap<>0then15250
15110 ifrd<=0thenms=7:gosub58000:return:rem check
15200 sl=rd:ifsl>pmthensl=pm-int(rnd(0)*2)*an
15202 ifsl>s(g)thensl=s(g)
15203 ifsl<anthenms=7:gosub58000:return
15205 ms=0:gosub58000:c$="$"+mid$(str$(sl),2):gosub59950
15210 s(g)=s(g)-sl:vs(g)=sl:ap=g:pu=sl:ba=ba+sl:goto15600:rem set bet
15250 ms=10:gosub58000
15260 ifvs(g)>3*anthen15280
15270 ifpu-rd>3*anthenms=1:gosub58000:kk=g:gosub60000:vs(g)=-1:return:rem fold
15280 rd=rd-pu:ifw8=2andap<>0thenrd=rd+4*an*(w9<>0)
15290 ifrd>anthen15400
15300 ms=6:gosub58000:s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem see
15310 goto15600
15400 ifrd>pmthenrd=pm-(int(rnd(0)*2)*an)
15401 ifrd>s(g)-pu+vs(g)thenrd=s(g)-pu+vs(g)
15402 ifrd<anthen15300
15405 pu=pu+rd:s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem raise
15420 ms=4:gosub58000:c$="$"+mid$(str$(rd),2):gosub59950
15600 gosub56000:gosub57000:return
16000 rem final player bet
16005 fz=2
16010 ifap<>0then16150
16020 ms=17:gj=4:gosub58000
16022 jo=1:jp=31:gosub63300
16030 geta$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub63100
16031 ifa$=""thengosub63190:goto16030
16032 ifa$="l"thenjo=1:gosub63300:goto16030
16033 ifa$="r"thenjo=2:gosub63300:goto16030
16034 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="b"
16035 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="k"
16036 ifa$<>"b"anda$<>"k"thengosub10500:goto16030
16040 ifa$="k"then16100
16050 printcl$:gosub12000
16060 printcl$:pu=sl:s(4)=s(4)-sl:vs(4)=pu:ba=ba+pu:ap=4
16100 goto16400
16150 ms=18:gj=4:gosub58000
16152 jo=1:jp=31:gosub63300
16160 geta$:jl$="<":jr$=">":jf$="f":ju$="":jd$="":gosub63100
16161 ifa$=""thengosub63190:goto16160
16162 ifa$="<"thenjo=jo-1:ifjo<1thenjo=3
16163 ifa$="<"thengosub63300:goto16160
16164 ifa$=">"thenjo=jo+1:ifjo>3thenjo=1
16165 ifa$=">"thengosub63300:goto16160
16166 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="s"
16167 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="r"
16168 if(a$="f"ora$=" "ora$=chr$(13))andjo=3thena$="f"
16169 ifa$<>"s"anda$<>"r"anda$<>"f"thengosub10500:goto16160
16170 ifa$="f"thenvs(4)=-1:kk=4:gosub60000:goto16400
16180 ifa$="s"thens(4)=s(4)-(pu-vs(4)):ba=ba+(pu-vs(4)):vs(4)=pu:goto16400
16185 ifpu>=fz*pm*2then16150
16190 printcl$:gosub12000
16210 printcl$:ba=ba+pu+sl:s(4)=s(4)-(pu-vs(4))-sl:vs(4)=pu+sl:pu=vs(4)
16400 gosub56000:gosub57000:printcl$:return
50000 w3=0
50005 forw=0to3
50010 forw1=1to13
50012 ifnm=32andw1>1andw1<7then50020
50013 w3=w3+1
50015 mz(w3,1)=w1+(w1=1)*(-13)
50017 mz(w3,2)=w
50020 nextw1,w
50025 return
50030 forw=1to35
50035 gosub10000
50040 ps=int(rnd(0)*nm+1)
50050 mz(0,1)=mz(ps,1):mz(0,2)=mz(ps,2)
50060 p1=int(rnd(0)*nm+1)
50070 mz(ps,1)=mz(p1,1):mz(ps,2)=mz(p1,2):mz(p1,1)=mz(0,1):mz(p1,2)=mz(0,2)
50075 next
50110 ps=1:return
51000 gosub10000
51005 ifnu=1then51100
51010 ifcc=1then:cardx,y,15,2:goto51100
51020 cardx,y,mz(ps,1),mz(ps,2)
51100 ps=ps+1:return
52000 x=0:y=0
52002 forw=1to5
52005 forw1=1to4
52007 ifgi>4thengi=1
52008 ifs(gi)<anthengi=gi+1:goto52060
52010 cc=1:nu=0
52020 ifgi=4thenx=(w-1)*8:y=14:goto52052
52030 x=(w-1)+14*(gi-1):y=2
52052 ca(gi,w,1)=mz(ps,1):ca(gi,w,2)=mz(ps,2)
52053 gosub51000
52055 gi=gi+1
52057 forw2=1to40:next
52060 nextw1,w
52065 gosub53000
52067 return
52070 forw3=1to5
52075 forw4=1to50:nextw4
52080 gosub10000
52085 card(w3-1)*8,14,0,0
52090 card(w3-1)*8,14,ca(ji,w3,1)+(ca(ji,w3,1)=14)*13,ca(ji,w3,2)
52100 nextw3
52110 return
53000 forw=4to1step-1
53005 fl=0
53010 forw1=1to4
53020 m1=ca(w,w1,1)+0.1*(ca(w,w1,2))
53030 m2=ca(w,w1+1,1)+0.1*(ca(w,w1+1,2))
53040 ifm1<m2then53080
53050 ca(0,0,1)=ca(w,w1,1):ca(0,0,2)=ca(w,w1,2)
53060 ca(w,w1,1)=ca(w,w1+1,1):ca(w,w1,2)=ca(w,w1+1,2)
53070 ca(w,w1+1,1)=ca(0,0,1):ca(w,w1+1,2)=ca(0,0,2):fl=1
53080 nextw1
53090 iffl=1then53005
53100 ifw=4andvs(4)<>-1thenji=4:gosub52070
53110 nextw
53120 return
54000 w=g
54005 forw2=2to14:va(w2,1)=0:va(w2,2)=0:next
54010 p1=ca(w,1,1):p2=ca(w,1,2)
54013 va(p1,1)=1:va(p1,2)=p2+1
54015 sk=1:cl=1
54020 forw1=2to5
54030 p3=ca(w,w1,1):p4=ca(w,w1,2)
54035 va(p3,1)=va(p3,1)+1:va(p3,2)=p4+1
54040 ifp1<>p3-1thensk=0
54050 ifp2<>p4thencl=0
54100 p1=p3:p2=p4
54110 nextw1
54120 ifsk=1andcl=1thenpt(w)=8+.01*p3+(p4+1)*.001:goto54500
54130 ifsk=1thenpt(w)=4+p3*.01+.001*(p4+1):goto54500
54140 ifcl=1thenpt(w)=vf+(p4+1)*.01+.001*p3:goto54500
54150 k1=0:k2=0:t1=0:pk=0
54160 forw3=2to14
54165 v=va(w3,1)
54170 ifv=2andk1=0thenk1=w3:goto54190
54180 ifv=2thenk2=k1:k1=w3
54190 ifv=3thent1=w3
54200 ifv=4thenpk=w3
54210 nextw3
54220 ifpk<>0thenpt(w)=7+.01*pk:goto54500
54230 ift1<>0thenpt(w)=3+.01*t1-vh*(k1<>0):goto54500
54240 ifk1<>0andk2<>0thenpt(w)=2+.01*k1+.001*va(k1,2):goto54500
54250 ifk1<>0thenpt(w)=1+.01*k1+.001*va(k1,2):goto54500
54260 pt(w)=0.01*p3+0.001*(p4+1)
54500 :
54510 return
54600 rem combination name
54605 pg=int(pt(g))
54610 ifpg>=8thenco$="straight flush":return
54615 ifpg=7thenco$="four of a kind":return
54620 ifpg=vfthenco$="flush":return
54625 ifpg=11-vfthenco$="full house":return
54630 ifpg=4thenco$="straight":return
54635 ifpg=3thenco$="3 of a kind":return
54640 ifpg=2thenco$="two pair":return
54645 ifpg=1thenco$="pair":return
54650 co$="nothing":return
54660 rem show combination in name area
54665 cx=0:cy=24:cw=20:c$=co$:cc=5:gosub59950
54675 return
54690 rem restore player name
54692 cx=0:cy=24:cw=20:c$=n$(4):cc=5:gosub59950
54696 return
54700 rem controlled numeric input
54701 jk=0
54702 v$=mid$(str$(v),2):w5=len(v$):jp=31:print"{blu}";
54703 printv$;
54704 print"{down}{left} {blk}^{blu}{up}{left}";
54705 geta$:jf$=chr$(13):jl$="":jr$="":ju$="+":jd$="-":gosub63100
54706 ifa$=""thengosub63190:goto54705
54707 ifa$="+"thenv=v+vi:ifv>9999thenv=9999
54708 ifa$="+"thengoto54740
54709 ifa$="-"thenv=v-vi:ifv<1thenv=vi
54710 ifa$="-"thengoto54740
54711 w6=asc(a$)
54712 ifw6=13thenprint"{down} ":goto54722
54713 if(w6<48orw6>57)andw6<>20thengosub10500:goto54705
54714 ifw6=20andjk=0thengosub54745:v$=left$(v$,len(v$)-1):w5=len(v$):jk=1:printv$;:goto54704
54715 ifw6=20andw5<1thengosub10500:goto54704
54716 ifw6=20thenprint"{down} {up}{left}{left} {left}";:v$=left$(v$,len(v$)-1):w5=w5-1:goto54704
54717 ifjk=0thenv$="":gosub54745:w5=0:jk=1
54718 ifw5>=5thengosub10500:goto54705
54719 printa$;:v$=v$+a$:w5=w5+1:goto54704
54722 ifval(v$)>0thenv=val(v$)
54724 print"{blk}":return
54740 rem update field after up/down
54745 forw7=1tow5:print"{left}";:next:forw7=1tow5:print" ";:next:forw7=1tow5:print"{left}";:next
54746 print"{down}";:forw7=0tow5:print" ";:next:forw7=0tow5:print"{left}";:next:print"{up}";
54747 ifa$="+"ora$="-"thenjk=0:goto54702
54748 return
54730 forw7=1to4
54731 ifw7/2=int(w7/2)thenprint"{blk}   amounts not consistent, retry!  {up}":goto54733
54732 print"{red}   amounts not consistent, retry!  {up}"
54733 forw6=1to400:nextw6:nextw7
54734 return
54850 rem clear name field
54852 w8=w5-1:forw7=1tow8:print"{left}";:next:forw7=1tow8:print" ";:next:forw7=1tow8:print"{left}";:next
54853 print"{down}";:forw7=0tow8:print" ";:next:forw7=0tow8:print"{left}";:next:print"{up}";
54855 return
54760 rem show busted in name area
54762 cx=0:cy=24:cw=20:c$="busted!":cc=2:gosub59950
54766 return
55000 print"{clr}";
55020 print"{rvon}{grn}            {blk}  {grn}            {blk}  {grn}            ";
55030 print"{rvon}{orng}{blu}            {blk}  {blu}            {blk}  {blu}            ";
55040 forw=1to9:print"{rvof}            {blk}{rvon}  {rvof}            {rvon}  {rvof}":next
55050 forw=1to2:print"{rvon}{brn}                                        ";:next
55053 print"{up}{up}";
55055 forw=1to2:print"{gry3}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{blk}{rvon}  {rvof}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}  {rvof}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}";:next
55060 print"{rvon}{blk}                                        ";
55065 print"{down}{down}{down}{down}{down}{down}{down}{down}{down}{rvon}{blk}                                        ";
55070 print"{grn}                    {blu}                   {home}";
55080 poke56295,6:poke2023,32+128
55090 return
56000 print"{rvon}{blk}{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}bet =          {left}{left}{left}{left}{left}{left}"pu"$"
56010 print"{rvon}{up}{up}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}pot =          {left}{left}{left}{left}{left}{left}{left}"ba"$"
56020 return
57000 w=g
57005 ifw=4then57035
57010 v$=mid$(str$(s(w)),2):ifs(w)<0thenv$=str$(s(w))
57015 cx=(w-1)*14:cy=1:cw=12:c$="$"+v$:cc=6:gosub59950
57030 goto57040
57035 v$=mid$(str$(s(4)),2):ifs(4)<0thenv$=str$(s(4))
57037 cx=20:cy=24:cw=20:c$="$"+v$:cc=6:gosub59950
57040 return
58000 print"{home}"
58001 ifms>11andms<19thenpoke198,0
58003 ifgj<>4then58008
58004 printin$"{blk}";
58005 ifms=9thenms=21
58006 ifms=10thenms=13
58007 print"{rvon}"ms$(ms);:goto58013
58008 cx=(gj-1)*14:cw=12:cc=9:c$=ms$(ms):cy=11:gosub59950
58009 ifms=9thenc$="cards":cy=12:gosub59950:goto58020
58010 c$="":cy=12:gosub59950:goto58020
58013 ifms<>12then58020
58014 jp=31
58015 geta$:jf$=" ":jl$="":jr$="":ju$="":jd$="":gosub63100:ifa$=""thengosub63190:goto58015
58016 ifa$<>" "thengosub10500:goto58015
58017 printcl$;
58020 return
58030 ms$(0)="bet"
58035 ms$(1)="fold"
58040 ms$(2)="open"
58050 ms$(3)="call"
58060 ms$(4)="raise"
58070 ms$(5)="pass"
58080 ms$(6)="see"
58090 ms$(7)="check"
58100 ms$(8)="draw"
58110 ms$(9)="shuffling"
58120 ms$(10)=""
58122 ms$(11)="stand pat"
58124 ms$(12)="{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}press space/fire"
58126 ms$(13)=cl$+"{home}"
58130 ms$(14)="       [o] open         [p] pass       "
58140 ms$(15)=" [c] call    [r] raise       [f] fold   "
58150 ms$(16)=" how much? (use + and -)"
58160 ms$(17)="       [b] bet           [k] check     "
58170 ms$(18)=" [s] see     [r] raise       [f] fold   "
58180 ms$(19)=" cards of: "
58190 ms$(20)="i won!"
58195 ms$(21)="         you are shuffling cards        "
58197 ms$(22)="      you won!!     "
58200 ms$(23)="busted!"
58210 return
59000 rem calculate draws
59010 forw=1to5:cb(w,gj)=0:next
59020 ifpt(gj)>4then59700
59030 ifpt(gj)<1then59200
59040 ifca(gj,1,1)<>ca(gj,2,1)thencb(1,gj)=1
59050 ifca(gj,5,1)<>ca(gj,4,1)thencb(5,gj)=1
59070 forw=2to4
59080 ifca(gj,w,1)<>ca(gj,w-1,1)andca(gj,w,1)<>ca(gj,w+1,1)thencb(w,gj)=1
59090 next
59095 ifint(pt(gj))=1andca(gj,5,1)=14andca(gj,4,1)<>14thencb(5,gj)=int(rnd(0)*2)
59100 goto59800
59200 rem check 4/5 flush
59202 forw1=0to3
59205 fc=0
59210 forw=1to5
59220 ifca(gj,w,2)<>w1thenfc=fc+1:cf=w
59230 nextw
59240 iffc=1thencb(cf,gj)=1:pt(gj)=2:goto59800
59250 nextw1
59300 rem check 4/5 straight
59310 fs=ca(gj,5,1):sf=0
59320 forw=4to2step-1
59330 fs=fs-1:ifca(gj,w,1)=fsthen59370
59340 ifsf=0thensf=1:goto59330
59350 sf=sf+1
59370 next
59380 ifsf<=1thencb(1,gj)=1:pt(gj)=1:goto59800
59410 fs=ca(gj,1,1):sf=0
59420 forw=2to4
59430 fs=fs+1:ifca(gj,w,1)=fsthen59470
59440 ifsf=0thensf=1:goto59430
59450 sf=sf+1
59470 next
59480 ifsf<=1thencb(5,gj)=1:pt(gj)=1:goto59800
59500 forw=1to4:cb(w,gj)=1:nextw
59700 ifint(pt(gj))<>7then59800
59710 ifca(gj,1,1)<>ca(gj,3,1)thencb(1,gj)=1:goto559800
59720 cb(5,gj)=1
59800 return
59805 rem card draw message
59810 fc=0
59820 forw=1to5
59830 ifcb(w,gj)=1thenfc=fc+1
59840 nextw
59845 ms=10:gosub58000
59850 iffc=0thenms=11:goto59870
59860 cx=(gj-1)*14:cw=12:cc=9:cy=11:c$="draw "+mid$(str$(fc),2):gosub59950
59862 c$="":cy=12:gosub59950:goto59880
59870 gosub58000
59880 forw=1to100:next
59900 return
59950 rem centered print
59952 poke214,cy:poke211,cx:sys58640:poke646,cc
59953 w7=cw:ifcy=24andcx+cw>39thenw7=39-cx:poke2023,160:poke56295,cc
59954 print"{rvon}"left$("                    ",w7);
59956 ifc$=""then59960
59958 poke214,cy:poke211,cx+int((cw-len(c$))/2):sys58640:print"{rvon}"c$;
59960 print"{home}";:return
60000 rem clear cards
60005 print"{home}"
60010 ifkk=4then60050
60020 forw=0to1:y=2:x=(kk-1)*14+w*5
60030 cardx,y,0,0:nextw
60040 goto60100
60050 forw=1to5:x=(w-1)*8:y=14
60060 cardx,y,0,0:nextw
60100 return
61000 rem draw cards
61010 iffc=0thenforw=1to250:next:goto61900
61020 ck=0:forw=1to5
61030 ifcb(w,gj)=1thenck=ck+1
61040 nextw
61050 y=2
61060 forw=ckto1step-1
61070 x=(4-ck+w)+14*(gj-1):cardx,y,0,0
61075 cardx-1,y,15,2:forrr=1to25:next
61080 nextw
61090 forrr=1to250:next
61100 w1=1
61120 forw=1to5
61130 ifcb(w,gj)=0then61180
61140 ca(gj,w,1)=mz(ps,1):ca(gj,w,2)=mz(ps,2)
61150 ifgj<>4thenx=(4-ck+w1)+14*(gj-1):cc=1:gosub51000:w1=w1+1:goto61170
61160 x=(w-1)*8:cc=1:gosub51000:w1=w1+1
61170 forrr=1to50:nextrr
61180 nextw
61900 return
62000 rem check if 3 fold
62005 c0=0
62010 forw=1to4
62020 ifvs(w)=-1thenc0=c0+1:goto62040
62030 mx=w
62040 nextw
62050 return
63000 rem poker 4 drawing
63005 w$=""
63010 forw=0to6
63020 w$=w$+chr$(peek(51193+w))
63030 nextw
63040 ifw$="poker 4"thenpoke53280,0:sys50944
63050 w$="":w=0
63060 return
63100 rem --- joystick port 2 reading ---
63110 jv=peek(56320)and31:rem read joystick state (bits 0-4, active low)
63115 ifa$<>""thenreturn:rem keyboard key already pressed, ignore joystick
63117 jx=(notjp)and31andjv:jp=jv:rem detect release: jx<>0 only on transition
63120 ifjx=0thenreturn:rem no release detected
63130 if(jxand4)<>0thenifjl$<>""thena$=jl$:return:rem bit 2: left
63140 if(jxand8)<>0thenifjr$<>""thena$=jr$:return:rem bit 3: right
63150 if(jxand16)<>0thenifjf$<>""thena$=jf$:return:rem bit 4: fire
63160 if(jxand1)<>0thenifju$<>""thena$=ju$:return:rem bit 0: up
63170 if(jxand2)<>0thenifjd$<>""thena$=jd$:return:rem bit 1: down
63180 return
63190 return
63200 rem highlight splash option
63210 poke214,sr:poke211,10:sys58640:print"{gry2}{rvon}[i]";
63212 poke214,sr+1:poke211,10:sys58640:print"[p]";
63214 ifjo=1thenpoke214,sr:poke211,10:sys58640:print">{rvof}i{rvon}<";
63216 ifjo=2thenpoke214,sr+1:poke211,10:sys58640:print">{rvof}p{rvon}<";
63220 return
63300 rem highlight message option
63305 ifjo<1thenreturn
63310 iffz=1andms=14thengosub63320:return
63312 iffz=1andms=15thengosub63340:return
63314 iffz=2andms=17thengosub63360:return
63316 iffz=2andms=18thengosub63380:return
63318 return
63320 rem highlight open/pass row 23
63322 poke214,23:poke211,7:sys58640:print"{blk}{rvon}[o]";
63324 poke211,24:sys58640:print"[p]";
63326 ifjo=1thenpoke211,7:sys58640:print">{rvof}o{rvon}<";
63328 ifjo=2thenpoke211,24:sys58640:print">{rvof}p{rvon}<";
63330 return
63340 rem highlight call/raise/fold row 23
63342 poke214,23:poke211,1:sys58640:print"{blk}{rvon}[c]";
63344 poke211,13:sys58640:print"[r]";:poke211,29:sys58640:print"[f]";
63346 ifjo=1thenpoke211,1:sys58640:print">{rvof}c{rvon}<";
63348 ifjo=2thenpoke211,13:sys58640:print">{rvof}r{rvon}<";
63350 ifjo=3thenpoke211,29:sys58640:print">{rvof}f{rvon}<";
63352 return
63360 rem highlight bet/check row 23
63362 poke214,23:poke211,7:sys58640:print"{blk}{rvon}[b]";
63364 poke211,25:sys58640:print"[k]";
63366 ifjo=1thenpoke211,7:sys58640:print">{rvof}b{rvon}<";
63368 ifjo=2thenpoke211,25:sys58640:print">{rvof}k{rvon}<";
63370 return
63380 rem highlight see/raise/fold row 23
63382 poke214,23:poke211,1:sys58640:print"{blk}{rvon}[s]";
63384 poke211,13:sys58640:print"[r]";:poke211,29:sys58640:print"[f]";
63386 ifjo=1thenpoke211,1:sys58640:print">{rvof}s{rvon}<";
63388 ifjo=2thenpoke211,13:sys58640:print">{rvof}r{rvon}<";
63390 ifjo=3thenpoke211,29:sys58640:print">{rvof}f{rvon}<";
63392 return
63400 rem highlight card exchange row 23
63402 poke214,23
63405 forjj=1to5:poke211,(jj-1)*8+2:sys58640:print"{blk}{rvon}[";chr$(48+jj);"]";:next
63410 ifjc>=1andjc<=5thenpoke211,(jc-1)*8+2:sys58640:print"{rvon}>{rvof}";chr$(48+jc);"{rvon}<";
63420 return
63500 rem highlight deck choice
63505 poke214,mr:poke211,10:sys58640:print"{red}[s]";
63510 poke214,mr+1:poke211,10:sys58640:print"[f]";
63515 ifjo=1thenpoke214,mr:poke211,10:sys58640:print">{rvon}s{rvof}<";
63520 ifjo=2thenpoke214,mr+1:poke211,10:sys58640:print">{rvon}f{rvof}<";
63525 return
63600 rem highlight y/n
63605 poke214,mr:poke211,22:sys58640:print"{gry1}[y]";
63610 poke211,28:sys58640:print"[n]";
63615 ifjo=1thenpoke211,22:sys58640:print">{rvon}y{rvof}<";
63620 ifjo=2thenpoke211,28:sys58640:print">{rvon}n{rvof}<";
63625 return

