

;D:\DEV\CardGamesC64\CARD_Games_C64\Dev\BlackJack\black-jack.prg ==1001==
   10 rem black jack
   20 rem by c&l barazzetta
   30 rem basic+comando 'card'
   40 :
   45 print"{clr}":k1=49152:sysk1+138
   50 poke53280,0
   60 poke53281,15
   65 poke54296,12
   70 fora=1to100
   80 cardrnd(0)*34,rnd(0)*17,rnd(0)*14+1,rnd(0)*4
   90 next
  100 print"{home}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{blk}{rvon}                     "
  110 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{blk}{rvon} b l a c k   j a c k "
  120 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{blk}{rvon}                     "
  122 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{red}{rvon}                     "
  125 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{red}{rvon}         by          "
  130 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}   carlo & lorenzo   "
  140 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}     barazzetta      "
  145 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{red}{rvon}        1986         "
  150 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{red}{rvon}                     "
  160 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{blu}{rvon}                     "
  170 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [i] per istruzioni  "
  180 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [g] per giocare     "
  190 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{blu}{rvon}                     "
  200 geta$:ifa$="g"then500
  210 ifa$<>"i"then200
  220 print"{blk}{clr}";
  230 print"istruzioni:"
  240 print"-----------"
  250 print"black jack e' il classico gioco"
  260 print"d'azzardo con le carte."
  270 print"il computer che e' il mazziere gioca "
  280 print"contro tutti."
  290 print"il gioco consiste nel pescare una carta"
  300 print"alla volta per ottenere un punteggio il"
  310 print"piu' vicino possibile a 21 ma non oltre!";
  320 print"ogni giocatore dovra' quindi arrischiare";
  330 print"per avvicinarsi a 21."
  340 print"il punteggio si calcola cosi':"
  350 print"l'asso puo' valere a piacimento 1 o 11."
  360 print"le figure 'vestite' valgono 10."
  370 print"tutte le altre carte valgono il proprio"
  380 print"valore."
  390 print"qualora i punteggi tra i giocatori e il"
  400 print"computer fossero pari vince il computer.";
  410 print"solo se si fa black jack, cioe' 21 con"
  420 print"2 sole carte, si vince sicuramente!!!"
  430 print:print"buona fortuna!!!"
  440 print:print"premere un tasto per giocare"
  450 geta$:ifa$=""then450
  500 print"{clr}{blk}":clr
  510 ps=40:dimmz(40,2)
  520 input"quanti giocatori (max 20)";gi
  530 gi=int(gi)
  540 ifgi>20thenprint"meno di venti!!!":goto520
  542 ifgi<1thenprint"almeno uno!!!":goto520
  545 dimno$(gi):dimso(gi,3)
  550 fora=1togi
  560 print:print"giocatore"a"inserisci il tuo nome"
  570 inputno$(a)
  580 iflen(no$(a))>15thenprint"troppo lungo max 15 lettere":goto570
  590 next
  600 print:print"tutto o.k. (s/n)"
  610 geta$:ifa$="n"then500
  620 ifa$<>"s"then610
  625 print"{clr}";
  630 fora=1togi
  635 print
  640 printno$(a)", quanti soldi hai":sl=0:input" \ ";sl:so(a,1)=int(sl)
  645 ifso(a,1)<=0thenprint"ripeti!!!":goto640
  647 ifso(a,1)>1e7thenprint"non si accettano somme sopra 10 milioni":goto640
  650 next
  660 print:print"tutto o.k. (s/n)"
  670 geta$:ifa$="n"then625
  680 ifa$<>"s"then670
  690 print"{clr}{blk}inserimento delle puntate":print
  692 forw=1togi
  693 ifso(w,1)<>0then700
  694 next
  695 print"siete tutti a bolletta!!!"
  696 print:print"[r] per rigiocare  [f] per finire"
  697 geta$:ifa$="r"thenrun
  698 ifa$<>"f"then697
  699 end
  700 fora=1togi
  710 ifso(a,1)=0then750
  715 print
  720 printno$(a)", possiedi \";so(a,1)
  730 pu=0:input"quanto punti \ ";pu
  735 pu=int(pu)
  740 ifpu>so(a,1)thenprint"non faccio credito!!!":goto720
  742 ifpu<=0thenprint"punta qualcosa, taccagno!!!":goto720
  745 so(a,2)=pu
  750 next
  760 print:print"tutto o.k. (s/n)"
  770 geta$:ifa$="n"then690
  780 ifa$<>"s"then770
 1000 print"{clr}"
 1010 rem ps=40
 1020 print"{home}{blk}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rvon}                                        "
 1025 print"{blk}{up}{up}{up}carte del computer"
 1030 pt=0:flag=0:x=1:y=1:gosub6000
 1040 forw=1to500:next
 1050 x=3:rv=1:gosub6000:rv=0:pc=pt:fc=flag:c1=mz(ps,1):c2=mz(ps,2)
 1055 fora=1togi
 1060 ifso(a,1)=0then1140
 1062 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
 1063 print"{blk}carte di                 {left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}"no$(a);
 1064 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
 1065 print"{up}{up}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{grn}puntata \               {left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}"so(a,2)
 1066 pt=0:flag=0
 1070 y=13:x=1:gosub6000:forw=1to500:next
 1080 x=x+2:gosub6000:gosub7000
 1085 ifpt>21thenforw=1to1500:next:goto1140
 1090 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{brn}[a] ancora"
 1100 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}[b] basta"
 1110 poke198,0
 1120 geta$:ifa$="a"then1080
 1130 ifa$<>"b"then1120
 1135 so(a,3)=pt-(x=3andpt=21)
 1140 forw=0to33step3:cardw,12,0,0:cardw,14,0,0:nextw,a
 1150 y=1:x=3:gosub10000:card3,1,c1,c2:pt=pc:flag=fc:gosub8000
 1155 forw=1to1500:next
 1160 ifpt>21thenso(0,3)=0:goto1200
 1170 ifpt>17andflag=0orpt>19thenso(0,3)=pt:goto1197
 1190 x=x+2:gosub6000:gosub8000
 1195 goto1155
 1197 so(0,3)=pt
 1200 forw=1to2000:next
 1205 print"{clr}";
 1210 print"{red}nome            risultato       soldi{blk}":print
 1230 forq=1togi
 1235 ifso(q,1)=0then1280
 1240 print"{blu}"no$(q)spc(16-len(no$(q)))"{grn}";
 1250 ifso(q,3)>so(0,3)thenprint"  vinto";:so(q,1)=so(q,1)+so(q,2):goto1270
 1260 print"  perso";:so(q,1)=so(q,1)-so(q,2)
 1270 print"{brn}"spc(14-len(str$(so(q,1))));so(q,1)"\"
 1280 nextq
 1290 poke198,0:print:print"{blk}premi un tasto per continuare";
 1300 geta$:ifa$=""then1300
 1310 goto690
 4999 end
 5000 print"{home}{blu}***** attendere mischiamento carte *****";
 5005 forc=1to40:mz(c,1)=0:nextc
 5008 forc=0to3
 5010 forb=1to10
 5015 gosub10000
 5020 ps=int(rnd(0)*40+1)
 5030 ifmz(ps,1)=0thenmz(ps,1)=b:mz(ps,2)=c:goto5070
 5040 ifps=40thenps=0
 5050 ps=ps+1
 5060 goto5030
 5070 nextb,c
 5080 forc=1to40
 5090 ifmz(c,1)>7thenmz(c,1)=mz(c,1)+3
 5100 next
 5105 print"{home}                                        "
 5110 ps=1:return
 6000 ps=ps+1
 6010 ifps=41thengosub5000
 6015 cr=mz(ps,1)
 6017 gosub10000
 6020 ifrv=0then:cardx,y,cr,mz(ps,2):goto6040
 6030 cardx,y,15,1
 6040 ifcr<>1andcr<8thenpt=pt+cr:goto6100
 6050 ifcr>7thenpt=pt+10:goto6100
 6060 flag=flag+1
 6070 pt=pt+11
 6100 ifpt>21andflag<>0thenflag=flag-1:pt=pt-10
 6110 return
 7000 print"{blu}":ifpt>21then7010
 7001 ifnot(x=3andpt=21)then7005
 7003 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}black jack":return
 7005 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}punti    {left}{left}{left}{left}"pt:return
 7010 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}fuori      ":so(a,3)=0
 7020 return
 8000 print"{blu}"
 8005 ifpt<22thenprint"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}punti    {left}{left}{left}{left}"pt:return
 8010 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}fuori       ":return
10000 poke54273,255
10010 poke54277,4*16
10020 poke54278,0
10030 poke54276,128
10035 poke54276,129
10040 return

