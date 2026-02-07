

;D:\DEV\CardGamesC64\CARD_Games_C64\Dev\Poker4\poker-4.prg ==1001==
   10 rem p o k e r  4
   20 rem by c&l barazzetta
   30 rem basic+comando 'card'
   40 :
   41 poke54276,8:poke54283,8:poke54296,12:poke650,0
   42 gosub63000
   45 print"{clr}":k1=49152:sysk1+138
   50 poke53280,0
   60 poke53281,1
   67 dimmz(52,2):dimca(4,5,2):dimva(14,2):dimms$(22)
   70 fora=1to100
   80 cardrnd(0)*34,rnd(0)*17,rnd(0)*14+1,rnd(0)*4
   90 next
  100 print"{home}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{blk}{rvon}                     "
  110 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}    p o k e r   4    "
  120 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  122 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry1}{rvon}                     "
  125 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}         by          "
  130 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}   carlo & lorenzo   "
  140 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}     barazzetta      "
  145 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}        1987         "
  150 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  160 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry2}{rvon}                     "
  170 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [i] per istruzioni  "
  180 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [g] per giocare     "
  190 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  195 poke198,0
  200 geta$:ifa$=""then200
  205 ifa$="g"then600
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
  440 print:print"{gry1}{down}     premi un tasto per continuare";
  445 poke198,0
  450 geta$:ifa$=""then450                        "
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
  580 print:print:print"{gry1}       premi un tasto per giocare  "
  585 poke198,0
  590 geta$:ifa$=""then590                         "
  600 print"{clr}"
  605 print"{blk}     inserimento nomi dei giocatori"
  607 print:print
  608 w=4:n$(4)=""
  609 print"{brn}inserisci il tuo nome >            <{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}";:goto640
  610 print"{clr}"
  612 print"{blk}     inserimento nomi dei giocatori"
  613 print"{blk}          gestiti dal computer"
  615 print:print
  620 forw=1to3
  625 n$(w)=""
  630 print"{red}nome del"w"{left}' giocatore >        <{left}{left}{left}{left}{left}{left}{left}{left}{left}";
  640 w9=13:ifw<>4thenw9=9
  641 w5=1:print"{blu}";
  645 print"{down}{left} {blk}^{blu}{up}{left}";
  650 geta$:ifa$=""then650
  652 w6=asc(a$)
  655 if(w6<65orw6>90)andw6<>13andw6<>20andw6<>32thengosub10500:goto650
  657 ifw6=13thenprint"{down} ":goto685
  660 ifw6=20thenw5=w5-1:ifw5=0thenw5=1:gosub10500:goto645
  665 ifw6=20thenprint"{down} {up}{left}{left} {left}";:n$(w)=left$(n$(w),len(n$(w))-1):goto645
  670 ifw5=w9thengosub10500:goto650
  675 printa$;:n$(w)=n$(w)+a$
  680 w5=w5+1:goto645
  685 print:ifw=4then610
  686 nextw
  690 w8=0:forw=1to3:forw1=w+1to4:ifn$(w)=n$(w1)thenw8=1
  692 nextw1,w:ifw8=0then710
  695 forw7=1to20:print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
  696 ifw7/2=int(w7/2)thenprint"{blk} nomi duplicati, ripetere input!":goto698
  697 print"{red} nomi duplicati, ripetere input!"
  698 forw6=1to400:nextw6:nextw7:goto600
  710 print:print"{gry1}va bene cosi' (s/n)?"
  720 geta$:ifa$=""then720
  725 ifa$<>"s"anda$<>"n"thengosub10500:goto720
  730 ifa$="n"then600
  735 print"{clr}"
  736 print"{blk}         configurazione partita"
  737 print
  738 print"    (invio per confermare il valore)"
  739 bo=1000:an=10:pm=100:nm=52:print:print
  740 print"{grn}     borsellino:{blk} 1000 e {grn}>     <{left}{left}{left}{left}{left}{left}";:v=bo:gosub54700:bo=v
  742 print"{grn}         invito:{blk}   10 e {grn}>     <{left}{left}{left}{left}{left}{left}";:v=an:gosub54700:an=v
  744 print"{grn}puntata massima:{blk}  100 e {grn}>     <{left}{left}{left}{left}{left}{left}";:v=pm:gosub54700:pm=v
  745 ifbo<2*pmoran>=pmthengosub54730:goto735
  746 print:print"{grn}   mazzo: {red}[1]{grn} 52 carte  {red}[2]{grn} 32 carte"
  748 poke198,0
  750 geta$:ifa$=""then750
  752 ifa$<>"1"anda$<>"2"thengosub10500:goto750
  754 ifa$="2"thennm=32
  755 print:print"{blk}   mazzo scelto:";nm;"carte"
  756 ifnm=52thenvf=5:vh=3:goto759
  758 vf=6:vh=2
  759 poke198,0:print:print"{gry1}va bene cosi' (s/n)?"
  760 geta$:ifa$=""then760
  761 ifa$<>"s"anda$<>"n"thengosub10500:goto760
  762 ifa$="n"then735
  763 print"{clr}"
  770 forw=1to4
  775 s(w)=bo
  810 next
  885 gosub55000
  900 forw=1to3
  905 print"{home}";
  910 forw1=1tow*14-13+6-len(n$(w))/2:print"{rght}";:next:print"{left}{rvon}{grn}"n$(w)
  920 next
  925 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
  927 forw=1to(21-len(n$(4)))/2:print"{rght}";:next:print"{rvon}{grn}"n$(4);
  928 bn$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
  930 forw=1to4:gosub57005:nextw
  940 gosub56000
  950 in$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{blk}{rvon}"
  960 cl$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{blk}{rvon}                                        {home}"
  965 gosub 58030
  980 gosub50000
  999 g1=3
 1000 rem cuore del programma
 1005 pu=0:ba=0:gosub56000
 1007 forkk=1to4:gosub60000:next
 1010 ms=10:forgj=1to3:gosub58000:next
 1020 ap=0:ls=0
 1030 forw=1to4:vs(w)=0:next
 1050 g1=g1+1:ifg1=5theng1=1
 1070 g=g1+1:ifg=5theng=1
 1071 ba=ba+5*an:gosub56000
 1072 forw=1to4
 1074 s(w)=s(w)-an:ifw=g1thens(w)=s(w)-an
 1076 gosub57005
 1078 next
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
 1255 ifvs(1)<=0andvs(2)<=0andvs(3)<=0andvs(4)<=0thenforw=1to1000:next:goto1007
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
 1805 gj=4:printin$;"{rvon}{blk} "n$(g)": "co$;
 1810 ji=g:gosub52070
 1820 ms=12:gosub58000
 1830 g=g+1:nextw5
 1840 gosub54690:kk=4:gosub60000
 1850 printcl$;
 1855 ms=10:forgj=1to3:gosub58000:nextgj
 1860 ifmx=4thenms=22:gj=4:gosub58000:goto1930
 1900 ms=10:gj=mx:gosub58000:ms=20:gosub58000
 1930 ms=12:gj=4:gosub58000
 2000 s(mx)=s(mx)+ba:ba=0:pu=0:g=mx:gosub56000:gosub57000
 2010 printcl$
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
10540 forw7=1to200:next
10550 poke54283,32
10560 poke198,0
10590 return
11000 rem puntata iniziale giocatore
11005 fz=1
11010 ifap<>0then11150
11020 ms=14:gj=4:gosub58000
11030 geta$:ifa$=""then11030
11035 ifa$<>"a"anda$<>"p"thengosub10500:goto11030
11040 ifa$="p"then11100
11050 printcl$:gosub12000
11060 printcl$:pu=sl:s(4)=s(4)-sl:vs(4)=pu:ba=ba+pu:ap=4
11100 goto11400
11150 ms=15:gj=4:gosub58000
11160 geta$:ifa$=""then11160
11165 ifa$<>"g"anda$<>"r"anda$<>"l"thengosub10500:goto11160
11170 ifa$="l"thenvs(4)=-1:kk=4:gosub60000:goto11400
11180 ifa$="g"thens(4)=s(4)-(pu-vs(4)):ba=ba+(pu-vs(4)):vs(4)=pu:goto11400
11190 printcl$:gosub12000
11210 printcl$:ba=ba+pu+sl:s(4)=s(4)-(pu-vs(4))-sl:vs(4)=pu+sl:pu=vs(4)
11400 gosub56000:gosub57000:printcl$:return
12000 sl=an:poke650,128
12020 ms=16:gj=4:gosub58000:printsl;"{left}  {left}e ";
12030 geta$:ifa$=""then12030
12035 ifa$<>"+"anda$<>"-"anda$<>chr$(13)thengosub10500:goto12030
12040 ifa$=chr$(13)then12080
12050 ifa$<>"-"then12070
12060 sl=sl-an:ifsl<anthensl=an:gosub10500
12065 goto12020
12070 sl=sl+an:ifsl>pmorsl>s(4)-pu+vs(4)thensl=sl-an:gosub10500
12075 goto12020
12080 poke650,0
12090 return
13000 printcl$:printin$;"{rvon}{blk}   1       2       3       4       5";
13001 poke198,0
13005 forw=1to5:cb(w,4)=0:nextw
13007 ct=0
13010 geta$:ifa$=""then13010
13011 if(val(a$)<1orval(a$)>5)anda$<>chr$(13)thengosub10500:goto13010
13012 ifa$=chr$(13)thenprintcl$:goto13060
13015 y=14:x=(val(a$)-1)*8
13020 ifcb(val(a$),4)=0andct<>4then13040
13025 ifcb(val(a$),4)=1andct<>0then13030
13027 gosub10500:goto13010
13030 ct=ct-1:cb(val(a$),4)=0:gosub10000
13032 cardx,y,ca(4,val(a$),1)+(ca(4,val(a$),1)=14)*13,ca(4,val(a$),2)
13035 goto13010
13040 ct=ct+1:cb(val(a$),4)=1:gosub10000:cardx,y,15,2
13050 goto13010
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
14205 ms=2:gosub58000:print"{rvon}";sl;"e":rem apre di sl
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
14405 pu=pu+rd:s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem rilancia
14420 ms=4:gosub58000:print"{rvon}";rd;"e":rem rilancia di rd
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
15205 ms=0:gosub58000:print"{rvon}";sl;"e":rem puntata
15210 s(g)=s(g)-sl:vs(g)=sl:ap=g:pu=sl:ba=ba+sl:goto15600:rem sistema puntata
15250 ms=10:gosub58000
15260 ifvs(g)>3*anthen15280
15270 ifpu-rd>3*anthenms=1:gosub58000:kk=g:gosub60000:vs(g)=-1:return:rem lascio
15280 rd=rd-pu:ifw8=2andap<>0thenrd=rd+4*an*(w9<>0)
15290 ifrd>anthen15400
15300 ms=6:gosub58000:s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem vedo
15310 goto15600
15400 ifrd>pmthenrd=pm-(int(rnd(0)*2)*an)
15405 pu=pu+rd:s(g)=s(g)-(pu-vs(g)):ba=ba+(pu-vs(g)):vs(g)=pu:rem rilancia
15420 ms=4:gosub58000:print"{rvon}";rd;"e":rem rilancia di rd
15600 gosub56000:gosub57000:return
16000 rem puntata finale giocatore
16005 fz=2
16010 ifap<>0then16150
16020 ms=17:gj=4:gosub58000
16030 geta$:ifa$=""then16030
16035 ifa$<>"p"anda$<>"c"thengosub10500:goto16030
16040 ifa$="c"then16100
16050 printcl$:gosub12000
16060 printcl$:pu=sl:s(4)=s(4)-sl:vs(4)=pu:ba=ba+pu:ap=4
16100 goto16400
16150 ms=18:gj=4:gosub58000
16160 geta$:ifa$=""then16160
16165 ifa$<>"v"anda$<>"r"anda$<>"l"thengosub10500:goto16160
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
52010 cc=1:nu=0
52020 ifgi=4thenx=(w-1)*8:y=14:goto52052
52030 x=(w-1)+14*(gi-1):y=2
52052 ca(gi,w,1)=mz(ps,1):ca(gi,w,2)=mz(ps,2)
52053 gosub51000
52055 gi=gi+1
52057 forw2=1to80:next
52060 nextw1,w
52065 gosub53000
52067 return
52070 forw3=1to5
52075 forw4=1to100:nextw4
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
54665 printbn$;"{rvon}{grn}                    ";
54670 printbn$;:forw7=1to(21-len(co$))/2:print"{rght}";:next:print"{rvon}{grn}"co$"{home}";
54675 return
54690 rem ripristina nome giocatore
54692 printbn$;"{rvon}{grn}                    ";
54694 printbn$;:forw7=1to(21-len(n$(4)))/2:print"{rght}";:next:print"{rvon}{grn}"n$(4)"{home}";
54696 return
54700 rem input numerico controllato
54702 v$="":w5=0:print"{blu}";
54704 print"{down}{left} {blk}^{blu}{up}{left}";
54706 geta$:ifa$=""then54706
54708 w6=asc(a$)
54710 if(w6<48orw6>57)andw6<>13andw6<>20thengosub10500:goto54706
54711 ifw6<>13then54716
54712 ifw5>0thenprint"{down} ":goto54720
54714 v$=mid$(str$(v),2):printv$;"{down}";:forw7=1tolen(v$):print"{left}";:next:print" ":goto54720
54716 ifw6=20thenw5=w5-1:ifw5<0thenw5=0:gosub10500:goto54704
54717 ifw6=20thenprint"{down} {up}{left}{left} {left}";:v$=left$(v$,len(v$)-1):goto54704
54718 ifw5>=5thengosub10500:goto54706
54719 printa$;:v$=v$+a$:w5=w5+1:goto54704
54720 ifval(v$)>0thenv=val(v$)
54722 print"{blk}":return
54730 forw7=1to20
54731 ifw7/2=int(w7/2)thenprint"{blk} importi non coerenti, ripetere!{up}":goto54733
54732 print"{red} importi non coerenti, ripetere!{up}"
54733 forw6=1to400:nextw6:nextw7
54734 return
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
56000 print"{rvon}{blk}{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}puntata =      {left}{left}{left}{left}{left}{left}"pu"e"
56010 print"{rvon}{up}{up}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}piatto =       {left}{left}{left}{left}{left}{left}{left}"ba"e"
56020 return
57000 w=g
57005 ifw=4then57035
57010 print"{home}{down}";
57020 forw1=1tow*14-15+6-len(str$(s(w)))/2:print"{rght}";:next
57025 print"{rvon}{blu}         {left}{left}{left}{left}{left}{left}{left}{left}{left}"s(w)"e"
57030 goto57040
57035 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}";
57037 forw=1to(25-len(str$(s(4))))/2:print"{rght}";:next
57038 print"{rvon}{blu}            {left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}"s(4)"e{home}";
57040 return
58000 print"{home}"
58001 ifms>11andms<19thenpoke198,0
58003 ifgj<>4thenprint"{brn}":goto58008
58004 printin$"{blk}";
58005 ifms=9thenms=21
58006 ifms=10thenms=13
58007 goto58010
58008 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{left}";:forw=1to(gj-1)*14+1:print"{rght}";:next
58010 print"{rvon}"ms$(ms);
58013 ifms<>12then58020
58015 geta$:ifa$=""then58015
58016 ifa$<>" "thengosub10500:goto58015
58020 return
58030 ms$(00)="   punto    {down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}"
58035 ms$(01)="   lascio   "
58040 ms$(02)="    apro    {down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}di"
58050 ms$(03)="   gioco    "
58060 ms$(04)="  rilancio  {down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}di"
58070 ms$(05)="   passo    "
58080 ms$(06)="    vedo    "
58090 ms$(07)="    cip     "
58100 ms$(08)="  cambio"
58110 ms$(09)=" mischio le {down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}   carte    "
58120 ms$(10)="            {down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}            "
58122 ms$(11)="  servito   "
58124 ms$(12)="{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght} premi [spazio]"
58126 ms$(13)=cl$+"{home}"
58130 ms$(14)="       [a] apro         [p] passo      "
58140 ms$(15)=" [g] gioco   [r] rilancio    [l] lascio"
58150 ms$(16)=" quanti soldi? (usa + e -)"
58160 ms$(17)="       [p] punto         [c] cip       "
58170 ms$(18)=" [v] vedo    [r] rilancio    [l] lascio"
58180 ms$(19)=" carte di: "
58190 ms$(20)=" ho vinto ! "
58195 ms$(21)="        stai mischiando le carte       "
58197 ms$(22)="       hai vinto !      "
58200 return
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
59860 ms=8:gosub58000:print"{rvon}"fc:goto59880
59870 gosub58000
59880 forw=1to200:next
59900 return
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
61010 iffc=0thenforw=1to500:next:goto61900
61020 ck=0:forw=1to5
61030 ifcb(w,gj)=1thenck=ck+1
61040 nextw
61050 y=2
61060 forw=ckto1step-1
61070 x=(4-ck+w)+14*(gj-1):cardx,y,0,0
61075 cardx-1,y,15,2:forrr=1to50:next
61080 nextw
61090 forrr=1to500:next
61100 w1=1
61120 forw=1to5
61130 ifcb(w,gj)=0then61180
61140 ca(gj,w,1)=mz(ps,1):ca(gj,w,2)=mz(ps,2)
61150 ifgj<>4thenx=(4-ck+w1)+14*(gj-1):cc=1:gosub51000:w1=w1+1:goto61170
61160 x=(w-1)*8:cc=1:gosub51000:w1=w1+1
61170 forrr=1to100:nextrr
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

