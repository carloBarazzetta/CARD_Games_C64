

;D:\DEV\CardGamesC64\CARD_Games_C64\Dev\Poker4\poker-4.prg ==1001==
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
   68 eu$=chr$(191)
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
  170 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [i] per istruzioni  "
  180 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [g] per giocare     "
  190 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  193 sr=17
  195 poke198,0:jo=1:jp=31:gosub63200
  200 geta$:jl$="":jr$="":jf$="f":ju$="u":jd$="d":gosub63100
  201 ifa$=""thengosub63190:goto200
  202 ifa$="u"thenjo=1:gosub63200:goto200
  203 ifa$="d"thenjo=2:gosub63200:goto200
  204 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="i":goto210
  205 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="g"
  206 ifa$="g"then600
  210 ifa$<>"i"thengosub10500:goto200
  220 print"{clr}";
  230 print"{blk}istruzioni:"
  240 print"-----------"
  260 print"{grn}con questo programma potrete simulare "
  270 print"una partita a poker tra 4 giocatori!"
  280 print"un giocatore siete voi mentre gli altri"
  290 print"3 sono gestiti dal computer.           "
  300 print:print"{blk}regole del poker:"
  310 print"-----------------"
  320 print"{blu}si sceglie se usare il mazzo da 52"
  330 print"carte o da 32 (dal 7 all'asso)."
  340 print"ognuno riceve 5 carte con le quali deve"
  345 print"formare una combinazione."
  350 print"le combinazioni possibili sono (in scala";
  360 print"crescente di valori):            "
  370 print"{red}coppia, doppia coppia, tris, scala,"
  380 print"full(*), colore(*), poker, scala reale."
  390 print
  400 print"{grn}(*) con 52 carte: full batte colore."
  410 print"    con 32 carte: colore batte full."
  440 print:print"{gry1}{down}   premi [spazio/fire] per continuare";
  445 poke198,0:jp=31
  450 geta$:jf$=" ":jl$="":jr$="":ju$="":jd$="":gosub63100:ifa$=""thengosub63190:goto450
  460 print"{clr}{blu}per ottenere una di queste combinazioni"
  462 print"ogni giocatore ha diritto di cambiare  "
  464 print"fino ad un massimo di 4 carte.        "
  466 print"se piu' giocatori ottengono la stessa  "
  470 print"combinazione vince quella di valore piu'";
  480 print"alto e se ancora fossero pari quella di"
  490 print"seme piu' alto. (la scala di valori e':"
  500 print"cuori {red}{CBM-T}{blu},quadri {red}{CBM-I}{blu},fiori {blk}{CBM-K}{blu},picche {blk}{$a0}{blu})."
  505 print"es. un 5 di {red}{CBM-T}{blu} vale piu' di un 5 di {red}{CBM-I}{blu}."
  510 print"a seconda delle carte che si possiedono"
  520 print"sia prima che dopo averle cambiate, il "
  530 print"giocatore dovra' valutare quanti soldi "
  540 print"puntare."
  550 print"alla fine vince chi ha la combinazione "
  560 print"di valore piu' alto.                   "
  570 print:print"{grn}buon divertimento.                   "
  580 print:print:print"{gry1}     premi [spazio/fire] per giocare"
  585 poke198,0:jp=31
  590 geta$:jf$=" ":jl$="":jr$="":ju$="":jd$="":gosub63100:ifa$=""thengosub63190:goto590
  600 print"{clr}"
  605 print"{blk}     inserimento nomi dei giocatori"
  607 print:print
  608 w=4:n$(4)="giocatore"
  609 print"{brn}inserisci il tuo nome >            <{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}";:goto640
  610 print
  612 print"{blk}     inserimento nomi dei giocatori"
  613 print"{blk}          gestiti dal computer"
  615 print
  620 forw=1to3
  625 n$(w)=""
  626 ifw=1thenn$(w)="primo"
  627 ifw=2thenn$(w)="secondo"
  628 ifw=3thenn$(w)="terzo"
  630 print"{red}nome del"w"{left}' giocatore >        <{left}{left}{left}{left}{left}{left}{left}{left}{left}";
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
  696 ifw7/2=int(w7/2)thenprint"{blk}    nomi duplicati, ripetere input!":goto698
  697 print"{red}    nomi duplicati, ripetere input!"
  698 forw6=1to400:nextw6:nextw7:goto600
  710 print:print"{gry1}     va bene cosi'?   [S]   [N]    "
  715 jo=1:jp=31:mr=peek(214)-1:gosub63600
  720 geta$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub63100
  721 ifa$=""thengosub63190:goto720
  722 ifa$="l"thenjo=1:gosub63600:goto720
  723 ifa$="r"thenjo=2:gosub63600:goto720
  724 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="s"
  725 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="n"
  726 ifa$<>"s"anda$<>"n"thengosub10500:goto720
  730 ifa$="n"then600
  735 print"{clr}"
  736 print"{blk}         configurazione partita"
  737 print
  738 print"    (invio per confermare il valore)"
  739 bo=1000:an=10:pm=100:nm=52:print:print
  740 print"{grn}         borsellino:{blk} 1000 e {grn}>     <{left}{left}{left}{left}{left}{left}";:vi=100:v=bo:gosub54700:bo=v
  742 print"{grn}             invito:{blk}   10 e {grn}>     <{left}{left}{left}{left}{left}{left}";:vi=10:v=an:gosub54700:an=v
  744 print"{grn}    puntata massima:{blk}  100 e {grn}>     <{left}{left}{left}{left}{left}{left}";:vi=10:v=pm:gosub54700:pm=v
  745 ifbo<2*pmoran>=pmthengosub54730:goto735
  746 print:print"{grn}   mazzo: {red}[R]{grn} ridotto (32 carte)":print"{grn}          {red}[C]{grn} completo (52 carte)"
  747 jo=1:jp=31:mr=peek(214)-2:gosub63500
  748 poke198,0
  749 geta$:jl$="":jr$="":jf$="f":ju$="u":jd$="d":gosub63100
  750 ifa$=""thengosub63190:goto749
  751 ifa$="u"thenjo=1:gosub63500:goto749
  752 ifa$="d"thenjo=2:gosub63500:goto749
  753 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="r"
  754 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="c"
  755 ifa$<>"r"anda$<>"c"thengosub10500:goto749
  756 ifa$="r"thennm=32
  757 print:print:print"{blk}         mazzo scelto:";nm;"carte"
  758 vf=6:vh=2:ifnm=52thenvf=5:vh=3
  759 poke198,0:print:print:print"{gry1}     va bene cosi'?   [S]   [N]    "
  760 jo=1:jp=31:mr=peek(214)-1:gosub63600
  761 geta$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub63100
  762 ifa$=""thengosub63190:goto761
  763 ifa$="l"thenjo=1:gosub63600:goto761
  764 ifa$="r"thenjo=2:gosub63600:goto761
  765 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="s":goto767
  766 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="n":goto767
  767 ifa$<>"s"anda$<>"n"thengosub10500:goto761
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
 1000 rem cuore del programma
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
 1150 rem fase di puntata iniziale denaro
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
 1275 rem cambio delle carte
 1280 forw5=1to4
 1290 ifg>=5theng=1
 1295 ifvs(g)=-1then1320
 1300 ifg=4thengosub13000:gosub61120:goto1320
 1310 gj=g:gosub59810:gosub61000
 1320 g=g+1:nextw5
 1330 kk=4:gosub60000:gosub53000
 1335 g=4:gosub54000:gosub54600:gosub54660
 1500 rem puntata finale di denaro
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
 1630 rem calcola chi ha vinto
 1640 g=4:gosub54000
 1650 mx=0:pt(0)=0
 1660 forw=1to4
 1662 ifvs(w)=-1then1670
 1665 ifpt(w)>pt(mx)thenmx=w
 1670 nextw
 1730 rem veduta delle carte
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
 2020 rem check eliminazioni
 2025 forw=1to3:ifs(w)>=anthen2028
 2026 gj=w:ms=23:gosub58000
 2028 nextw
 2030 ifs(4)<anthengosub54760
 2035 w8=0:forw=1to3:ifs(w)>=anthenw8=w8+1
 2037 nextw
 2040 ifs(4)>=anthen2045
 2041 w1$="     mi dispiace     ":w2$="     hai perso!!     ":goto2060
 2045 ifw8>0then1000
 2046 w1$="     complimenti     ":w2$="     hai vinto!!     ":goto2060
 2060 rem fine partita
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
 2135 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry1}{rvon}   sei pronto per    "
 2140 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}   un'altra sfida?   "
 2150 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
 2160 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry2}{rvon}                     "
 2170 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [i] per istruzioni  "
 2180 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [g] per giocare     "
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
11000 rem puntata iniziale giocatore
11005 fz=1
11010 ifap<>0then11150
11020 ms=14:gj=4:gosub58000
11022 jo=1:jp=31:gosub63300
11030 geta$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub63100
11031 ifa$=""thengosub63190:goto11030
11032 ifa$="l"thenjo=1:gosub63300:goto11030
11033 ifa$="r"thenjo=2:gosub63300:goto11030
11034 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="a"
11035 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="p"
11036 ifa$<>"a"anda$<>"p"thengosub10500:goto11030
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
11166 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="g"
11167 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="r"
11168 if(a$="f"ora$=" "ora$=chr$(13))andjo=3thena$="l"
11169 ifa$<>"g"anda$<>"r"anda$<>"l"thengosub10500:goto11160
11170 ifa$="l"thenvs(4)=-1:kk=4:gosub60000:goto11400
11180 ifa$="g"thens(4)=s(4)-(pu-vs(4)):ba=ba+(pu-vs(4)):vs(4)=pu:goto11400
11190 printcl$:gosub12000
11210 printcl$:ba=ba+pu+sl:s(4)=s(4)-(pu-vs(4))-sl:vs(4)=pu+sl:pu=vs(4)
11400 gosub56000:gosub57000:printcl$:return
12000 sl=an:poke650,128
12020 ms=16:gj=4:gosub58000:printsl;"{left}  {left}";eu$;" ";
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
13013 ifa$="u"ora$="d"thena$=mid$(str$(jc),2)
13014 rem fire=conferma (a$ gia' chr$(13))
13015 if(val(a$)<1orval(a$)>5)anda$<>chr$(13)anda$<>" "thengosub10500:goto13007
13016 ifa$=chr$(13)ora$=" "thenprintcl$:goto13060
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
14000 rem scelta se giocare e quanto puntare
14001 gosub54000
14002 gj=g:gosub59000
14010 rd=int(rnd(0)*5)*an-2*an+an*(ap=0)
14020 w9=int(pt(g))
14022 w8=0:forw=1to4:ifvs(w)=-1thenw8=w8+1
14024 next
14026 ifw8=2thenrd=rd-4*an*(rnd(0)<.8)
14030 w9=(w9+(w9=7)*4)*2*an:rd=w9+rd
14040 ifap<>0then14250
14100 ifrd<=0thenms=5:gosub58000:return:rem passa
14200 sl=rd:ifsl>pmthensl=pm
14202 ifsl>s(g)thensl=s(g)
14203 ifsl<anthenms=5:gosub58000:return
14205 ms=2:gosub58000:c$="di "+mid$(str$(sl),2)+" "+eu$:gosub59950
14210 s(g)=s(g)-sl:vs(g)=sl:ap=g:pu=sl:ba=ba+sl:rem sistema l'apertura
14220 goto14530
14250 ms=10:gj=g:gosub58000
14252 ifvs(g)>anthen14260
14255 ifpu-rd>3*anthenms=1:gosub58000:kk=g:gosub60000:vs(g)=-1:return:rem lascia
14260 rd=rd-pu
14270 ifrd>=anthen14400
14300 s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem gioca
14320 ms=3:gj=g:gosub58000
14330 goto14530
14400 ifrd>pmthenrd=pm
14401 ifrd>s(g)-pu+vs(g)thenrd=s(g)-pu+vs(g)
14402 ifrd<anthen14300
14405 pu=pu+rd:s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem rilancia
14420 ms=4:gosub58000:c$="di "+mid$(str$(rd),2)+" "+eu$:gosub59950
14530 gosub56000:gosub57000:return
15000 rem puntata finale
15010 gosub54000
15020 gj=g:ms=10:gosub58000
15030 rd=int(rnd(0)*5)*an-2*an
15040 w9=int(pt(g))
15050 rd=rd+w9*an-(w9>1)*w9*w9*an+2*an*(ap=0)+4*an*(w9=0)
15070 w8=0:forw=1to4:ifvs(w)=-1thenw8=w8+1
15080 next
15090 ifw8=2andap<>0thenrd=rd-4*an*(w9<>0)
15100 ifap<>0then15250
15110 ifrd<=0thenms=7:gosub58000:return:rem cip
15200 sl=rd:ifsl>pmthensl=pm-int(rnd(0)*2)*an
15202 ifsl>s(g)thensl=s(g)
15203 ifsl<anthenms=7:gosub58000:return
15205 ms=0:gosub58000:c$="di "+mid$(str$(sl),2)+" "+eu$:gosub59950
15210 s(g)=s(g)-sl:vs(g)=sl:ap=g:pu=sl:ba=ba+sl:goto15600:rem sistema puntata
15250 ms=10:gosub58000
15260 ifvs(g)>3*anthen15280
15270 ifpu-rd>3*anthenms=1:gosub58000:kk=g:gosub60000:vs(g)=-1:return:rem lascio
15280 rd=rd-pu:ifw8=2andap<>0thenrd=rd+4*an*(w9<>0)
15290 ifrd>anthen15400
15300 ms=6:gosub58000:s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem vedo
15310 goto15600
15400 ifrd>pmthenrd=pm-(int(rnd(0)*2)*an)
15401 ifrd>s(g)-pu+vs(g)thenrd=s(g)-pu+vs(g)
15402 ifrd<anthen15300
15405 pu=pu+rd:s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem rilancia
15420 ms=4:gosub58000:c$="di "+mid$(str$(rd),2)+" "+eu$:gosub59950
15600 gosub56000:gosub57000:return
16000 rem puntata finale giocatore
16005 fz=2
16010 ifap<>0then16150
16020 ms=17:gj=4:gosub58000
16022 jo=1:jp=31:gosub63300
16030 geta$:jl$="l":jr$="r":jf$="f":ju$="":jd$="":gosub63100
16031 ifa$=""thengosub63190:goto16030
16032 ifa$="l"thenjo=1:gosub63300:goto16030
16033 ifa$="r"thenjo=2:gosub63300:goto16030
16034 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="p"
16035 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="c"
16036 ifa$<>"p"anda$<>"c"thengosub10500:goto16030
16040 ifa$="c"then16100
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
16166 if(a$="f"ora$=" "ora$=chr$(13))andjo=1thena$="v"
16167 if(a$="f"ora$=" "ora$=chr$(13))andjo=2thena$="r"
16168 if(a$="f"ora$=" "ora$=chr$(13))andjo=3thena$="l"
16169 ifa$<>"v"anda$<>"r"anda$<>"l"thengosub10500:goto16160
16170 ifa$="l"thenvs(4)=-1:kk=4:gosub60000:goto16400
16180 ifa$="v"thens(4)=s(4)-(pu-vs(4)):ba=ba+(pu-vs(4)):vs(4)=pu:goto16400
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
54600 rem nome combinazione
54605 pg=int(pt(g))
54610 ifpg>=8thenco$="scala reale":return
54615 ifpg=7thenco$="poker":return
54620 ifpg=vfthenco$="colore":return
54625 ifpg=11-vfthenco$="full":return
54630 ifpg=4thenco$="scala":return
54635 ifpg=3thenco$="tris":return
54640 ifpg=2thenco$="doppia coppia":return
54645 ifpg=1thenco$="coppia":return
54650 co$="niente":return
54660 rem mostra combinazione in area nome
54665 cx=0:cy=24:cw=20:c$=co$:cc=5:gosub59950
54675 return
54690 rem ripristina nome giocatore
54692 cx=0:cy=24:cw=20:c$=n$(4):cc=5:gosub59950
54696 return
54700 rem input numerico controllato
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
54740 rem aggiorna campo dopo su/giu
54745 forw7=1tow5:print"{left}";:next:forw7=1tow5:print" ";:next:forw7=1tow5:print"{left}";:next
54746 print"{down}";:forw7=0tow5:print" ";:next:forw7=0tow5:print"{left}";:next:print"{up}";
54747 ifa$="+"ora$="-"thenjk=0:goto54702
54748 return
54730 forw7=1to4
54731 ifw7/2=int(w7/2)thenprint"{blk}    importi non coerenti, ripetere!{up}":goto54733
54732 print"{red}    importi non coerenti, ripetere!{up}"
54733 forw6=1to400:nextw6:nextw7
54734 return
54850 rem cancella campo nome
54852 w8=w5-1:forw7=1tow8:print"{left}";:next:forw7=1tow8:print" ";:next:forw7=1tow8:print"{left}";:next
54853 print"{down}";:forw7=0tow8:print" ";:next:forw7=0tow8:print"{left}";:next:print"{up}";
54855 return
54760 rem mostra eliminato in area nome
54762 cx=0:cy=24:cw=20:c$="eliminato!":cc=2:gosub59950
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
56000 print"{rvon}{blk}{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}puntata =      {left}{left}{left}{left}{left}{left}"pu;eu$
56010 print"{rvon}{up}{up}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}piatto =       {left}{left}{left}{left}{left}{left}{left}"ba;eu$
56020 return
57000 w=g
57005 ifw=4then57035
57010 v$=mid$(str$(s(w)),2):ifs(w)<0thenv$=str$(s(w))
57015 cx=(w-1)*14:cy=1:cw=12:c$=v$+" "+eu$:cc=6:gosub59950
57030 goto57040
57035 v$=mid$(str$(s(4)),2):ifs(4)<0thenv$=str$(s(4))
57037 cx=20:cy=24:cw=20:c$=v$+" "+eu$:cc=6:gosub59950
57040 return
58000 print"{home}"
58001 ifms>11andms<19thenpoke198,0
58003 ifgj<>4then58008
58004 printin$"{blk}";
58005 ifms=9thenms=21
58006 ifms=10thenms=13
58007 print"{rvon}"ms$(ms);:goto58013
58008 cx=(gj-1)*14:cw=12:cc=9:c$=ms$(ms):cy=11:gosub59950
58009 ifms=9thenc$="carte":cy=12:gosub59950:goto58020
58010 c$="":cy=12:gosub59950:goto58020
58013 ifms<>12then58020
58014 jp=31
58015 geta$:jf$=" ":jl$="":jr$="":ju$="":jd$="":gosub63100:ifa$=""thengosub63190:goto58015
58016 ifa$<>" "thengosub10500:goto58015
58017 printcl$;
58020 return
58030 ms$(0)="punto"
58035 ms$(1)="lascio"
58040 ms$(2)="apro"
58050 ms$(3)="gioco"
58060 ms$(4)="rilancio"
58070 ms$(5)="passo"
58080 ms$(6)="vedo"
58090 ms$(7)="cip"
58100 ms$(8)="cambio"
58110 ms$(9)="mischio le"
58120 ms$(10)=""
58122 ms$(11)="servito"
58124 ms$(12)="{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}premi spazio/fire"
58126 ms$(13)=cl$+"{home}"
58130 ms$(14)="       [a] apro         [p] passo      "
58140 ms$(15)=" [g] gioco   [r] rilancio    [l] lascio"
58150 ms$(16)=" quanti soldi? (usa + e -)"
58160 ms$(17)="       [p] punto         [c] cip       "
58170 ms$(18)=" [v] vedo    [r] rilancio    [l] lascio"
58180 ms$(19)=" carte di: "
58190 ms$(20)="ho vinto!"
58195 ms$(21)="        stai mischiando le carte       "
58197 ms$(22)="     hai vinto!     "
58200 ms$(23)="eliminato!"
58210 return
59000 rem calcolo cambi
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
59200 rem controlla 4/5 colori
59202 forw1=0to3
59205 fc=0
59210 forw=1to5
59220 ifca(gj,w,2)<>w1thenfc=fc+1:cf=w
59230 nextw
59240 iffc=1thencb(cf,gj)=1:pt(gj)=2:goto59800
59250 nextw1
59300 rem controlla 4/5 scala
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
59805 rem messaggio delle carte da cambiare
59810 fc=0
59820 forw=1to5
59830 ifcb(w,gj)=1thenfc=fc+1
59840 nextw
59845 ms=10:gosub58000
59850 iffc=0thenms=11:goto59870
59860 cx=(gj-1)*14:cw=12:cc=9:cy=11:c$="cambio "+mid$(str$(fc),2):gosub59950
59862 c$="":cy=12:gosub59950:goto59880
59870 gosub58000
59880 forw=1to100:next
59900 return
59950 rem stampa centrata
59952 sa=1024+cy*40+cx
59954 forw7=satosa+cw-1:pokew7,160:pokew7+54272,cc:next
59956 ifc$=""then59960
59958 poke214,cy:poke211,cx+int((cw-len(c$))/2):sys58640:poke646,cc:print"{rvon}"c$;
59960 print"{home}";:return
60000 rem cancella
60005 print"{home}"
60010 ifkk=4then60050
60020 forw=0to1:y=2:x=(kk-1)*14+w*5
60030 cardx,y,0,0:nextw
60040 goto60100
60050 forw=1to5:x=(w-1)*8:y=14
60060 cardx,y,0,0:nextw
60100 return
61000 rem cambia le carte
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
62000 rem vede se 3 lasciano
62005 c0=0
62010 forw=1to4
62020 ifvs(w)=-1thenc0=c0+1:goto62040
62030 mx=w
62040 nextw
62050 return
63000 rem disegno poker 4
63005 w$=""
63010 forw=0to6
63020 w$=w$+chr$(peek(51193+w))
63030 nextw
63040 ifw$="poker 4"thenpoke53280,0:sys50944
63050 w$="":w=0
63060 return
63100 rem --- lettura joystick porta 2 ---
63110 jv=peek(56320)and31:rem legge stato joystick (bit 0-4, attivi bassi)
63115 ifa$<>""thenreturn:rem tasto tastiera gia' premuto, ignora joystick
63117 jx=(notjp)and31andjv:jp=jv:rem rileva rilascio: jx<>0 solo su transizione
63120 ifjx=0thenreturn:rem nessun rilascio rilevato
63130 if(jxand4)<>0thenifjl$<>""thena$=jl$:return:rem bit 2: sinistra
63140 if(jxand8)<>0thenifjr$<>""thena$=jr$:return:rem bit 3: destra
63150 if(jxand16)<>0thenifjf$<>""thena$=jf$:return:rem bit 4: fire
63160 if(jxand1)<>0thenifju$<>""thena$=ju$:return:rem bit 0: su
63170 if(jxand2)<>0thenifjd$<>""thena$=jd$:return:rem bit 1: giu
63180 return
63190 return
63200 rem evidenzia opzione splash
63210 s1=1024+sr*40+10:s2=1024+(sr+1)*40+10
63212 pokes1,155:pokes1+1,137:pokes1+2,157:pokes2,155:pokes2+1,135:pokes2+2,157
63214 ifjo=1thenpokes1,190:pokes1+1,9:pokes1+2,188
63216 ifjo=2thenpokes2,190:pokes2+1,7:pokes2+2,188
63220 return
63300 rem evidenzia opzione messaggio
63305 ifjo<1thenreturn
63310 iffz=1andms=14thengosub63320:return
63312 iffz=1andms=15thengosub63340:return
63314 iffz=2andms=17thengosub63360:return
63316 iffz=2andms=18thengosub63380:return
63318 return
63320 rem highlight apro/passo riga 23
63322 s1=1024+23*40+7:s2=1024+23*40+24
63324 pokes1,155:pokes1+1,129:pokes1+2,157:pokes2,155:pokes2+1,144:pokes2+2,157
63326 ifjo=1thenpokes1,190:pokes1+1,1:pokes1+2,188
63328 ifjo=2thenpokes2,190:pokes2+1,16:pokes2+2,188
63330 return
63340 rem highlight gioco/rilancio/lascio riga 23
63342 s1=1024+23*40+1:s2=1024+23*40+13:s3=1024+23*40+29
63344 pokes1,155:pokes1+1,135:pokes1+2,157:pokes2,155:pokes2+1,146:pokes2+2,157
63345 pokes3,155:pokes3+1,140:pokes3+2,157
63346 ifjo=1thenpokes1,190:pokes1+1,7:pokes1+2,188
63348 ifjo=2thenpokes2,190:pokes2+1,18:pokes2+2,188
63350 ifjo=3thenpokes3,190:pokes3+1,12:pokes3+2,188
63352 return
63360 rem highlight punto/cip riga 23
63362 s1=1024+23*40+7:s2=1024+23*40+25
63364 pokes1,155:pokes1+1,144:pokes1+2,157:pokes2,155:pokes2+1,131:pokes2+2,157
63366 ifjo=1thenpokes1,190:pokes1+1,16:pokes1+2,188
63368 ifjo=2thenpokes2,190:pokes2+1,3:pokes2+2,188
63370 return
63380 rem highlight vedo/rilancio/lascio riga 23
63382 s1=1024+23*40+1:s2=1024+23*40+13:s3=1024+23*40+29
63384 pokes1,155:pokes1+1,150:pokes1+2,157:pokes2,155:pokes2+1,146:pokes2+2,157
63385 pokes3,155:pokes3+1,140:pokes3+2,157
63386 ifjo=1thenpokes1,190:pokes1+1,22:pokes1+2,188
63388 ifjo=2thenpokes2,190:pokes2+1,18:pokes2+2,188
63390 ifjo=3thenpokes3,190:pokes3+1,12:pokes3+2,188
63392 return
63400 rem highlight carta exchange riga 23
63405 forjj=1to5:s1=1024+23*40+(jj-1)*8+2:pokes1,155:pokes1+1,48+jj+128:pokes1+2,157:next
63410 ifjc>=1andjc<=5thens1=1024+23*40+(jc-1)*8+2:pokes1,190:pokes1+1,48+jc:pokes1+2,188
63420 return
63500 rem evidenzia scelta mazzo
63505 s1=1024+mr*40+10:s2=1024+(mr+1)*40+10
63510 pokes1,27:pokes1+1,18:pokes1+2,29:pokes2,27:pokes2+1,3:pokes2+2,29
63515 ifjo=1thenpokes1,62:pokes1+2,60:pokes1+1,18+128
63520 ifjo=2thenpokes2,62:pokes2+2,60:pokes2+1,3+128
63525 return
63600 rem evidenzia s/n
63605 s1=1024+mr*40
63610 pokes1+22,27:pokes1+23,19:pokes1+24,29:pokes1+28,27:pokes1+29,14:pokes1+30,29
63615 ifjo=1thenpokes1+22,62:pokes1+24,60:pokes1+23,19+128
63620 ifjo=2thenpokes1+28,62:pokes1+30,60:pokes1+29,14+128
63625 return

