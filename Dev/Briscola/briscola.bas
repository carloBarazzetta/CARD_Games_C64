

;D:\DEV\CardGamesC64\CARD_Games_C64\dev\Briscola\briscola.prg ==1001==
   10 rem briscola
   20 rem by c&l barazzetta
   30 rem basic+comando 'card'
   40 :
   45 print"{clr}":k1=49152:sysk1+138
   50 dimmz(40,2):dimc(3,2):dimg(3,2)
   52 dimmt(10,4)
   55 poke53280,0
   60 poke53281,15
   65 poke54296,12
   70 fora=1to100
   80 cardrnd(0)*34,rnd(0)*17,rnd(0)*14+1,rnd(0)*4
   90 next
  100 print"{home}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry1}{rvon}                     "
  110 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}   b r i s c o l a   "
  120 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  122 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{orng}{rvon}                     "
  125 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}         by          "
  130 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}   carlo & lorenzo   "
  140 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}     barazzetta      "
  145 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}        1987         "
  150 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  160 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{grn}{rvon}                     "
  170 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [i] per istruzioni  "
  180 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} [g] per giocare     "
  190 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}                     "
  200 geta$:ifa$="g"then500
  210 ifa$<>"i"then200
  220 print"{clr}";
  230 print"{blu}istruzioni:"
  235 print"{blk}-----------"
  240 print"{blu}questo programma trasforma il vostro   "
  250 print"c=64 in un vero giocatore di briscola!"
  280 print:print"regole del gioco della briscola"
  290 print"{blk}-------------------------------"
  300 print"{blu}si gioca con un mazzo di 40 carte.     "
  310 print"la scala dei valori e' la seguente:    ":print
  320 print"nome            simbolo    punti"
  325 print"{blk}----            -------    -----{blu}"
  330 print"asso                  {SHIFT-*}       11":print
  340 print"tre                   B       10":print
  350 print"re (king)             L        4":print
  360 print"donna (queen)         K        3":print
  370 print"fante (jack)          J        2":print
  380 print"7,6,5,4,2     F,E,D,C,A        0"
  400 print:print"{red}     premi un tasto per continuare  ";
  410 geta$:ifa$=""then410
  420 print"{clr}{blu}";
  430 print"il mazzo lo mischia sempre il computer"
  435 print"e distribuisce tre carte ciascuno."
  440 print"poi mostra l'ultima carta del mazzo ed"
  445 print"il suo seme e' la briscola;i semi sono: "
  450 print"{blk}{$a0} picche{blu}; {blk}{CBM-K} fiori{blu}; {red}{CBM-I} quadri{blu}; {red}{CBM-T} cuori{blu}":print
  451 print"es.l'ultima carta e' il 5 di cuori {red}{CBM-T}{blu}."
  452 print"   percio' la briscola e' cuori e tutte"
  453 print"   le carte di cuori sono briscole."
  455 print"si gioca buttando una carta ciascuno."
  457 print"tra le due carte buttate una vince"
  458 print"seguendo questo ragionamento:"
  460 print"se i semi delle due carte sono uguali"
  465 print"vince quella di maggior valore, mentre"
  470 print"se sono diversi e una carta e' una"
  472 print"briscola vince la briscola, altrimenti"
  473 print"vince chi ha tirato la carta per primo."
  475 print"si prosegue pescando una carta ciascuno"
  480 print"dal mazzo e ripetendo la giocata fino"
  485 print"all'esaurimento delle carte nel mazzo."
  490 print"alla fine vince chi avra' totalizzato"
  493 print"piu' di 60 punti."
  495 print:print"{red}     premi un tasto per giocare  ";
  497 geta$:ifa$=""then497
  500 print"{blk}{clr}"
  502 print"come ti chiami (massimo 19 lettere)"
  504 inputn$
  506 iflen(n$)=0orlen(n$)>19thenprint"ripeti":goto502
  510 pg=0:pc=0:np=0:nf=0:nq=0:nc=0:bc=0:na=0:fa=0
  518 print"{clr}{rvon}{blk}briscola: by carlo & lorenzo barazzetta ";
  520 print"{rvon}{red}      computer       "
  525 print"{home}{down}{blk}";
  530 fori=1to23
  540 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} "
  550 next
  560 print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon} ";
  570 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rvon}                      "
  575 print"{rvon}                      "
  580 print"{rvon}                      "
  585 print"{blk}{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}1{rght}{rght}{rght}{rght}{rght}{rght}2{rght}{rght}{rght}{rght}{rght}{rght}3"
  590 print"{rvon}{red}                     {left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}";
  592 printtab((21-len(n$))/2);n$;
  595 fora=1to500:next
  600 pc=0:pg=0
  605 gosub40000:print"{rvon}{blk}   mischio il mazzo":gosub50000
  610 gosub40000
  620 forx=0to14step7
  622 fory=14to2step-12
  625 ify=2thencc=1:c1=x/7+1:goto640
  627 cc=0:g1=x/7+1
  640 gosub45000
  680 nexty,x
  682 forc1=1to3
  684 gosub55010
  686 nextc1
  690 gosub10000:card33,5,mz(40,1),mz(40,2)
  700 print"{home}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{down}{down}{blu}briscola:{down}{left}{left}{left}{left}{left}{left}{left}";
  710 onmz(40,2)+1goto730,740,750,760
  730 print"{blk}picche":goto770
  740 print"{blk} fiori":goto770
  750 print"{red}quadri":goto770
  760 print"{red} cuori"
  770 br=mz(40,2)
  775 forw=1to500:next
  780 gosub10000:card33,10,15,1
  790 gosub47000
  795 t=2
  800 fori=1to40step2
  810 ift=2thengosub20000:gosub30000:goto830
  820 gosub30000:gosub20000
  830 gosub60800
  950 pp=0
  970 ifj1=14orj1=15thenpp=pp+j1-4
  980 ify1=14ory1=15thenpp=pp+y1-4
  990 ifj1>10andj1<14thenpp=pp+j1-9
 1000 ify1>10andy1<14thenpp=pp+y1-9
 1020 ift=2andv=1ort=1andv=0then1025
 1023 goto1030
 1025 gosub40000:print"{rvon}  prendi tu";pp"punti":pg=pg+pp:t=2:goto1040
 1030 gosub40000:print"{rvon}  prendo io";pp"punti":pc=pc+pp:t=1
 1040 gosub55000:forw=1to2000:next
 1042 card22,6,0,0
 1044 card24,10,0,0
 1048 ifi=33then:card33,5,0,0:card33,10,0,0
 1050 ifi>34thenc(c1,1)=0:g(g1,1)=0:goto1250
 1150 ift=2thenx=g1*7-7:y=14:cc=0:goto1170
 1160 x=c1*7-7:y=2:cc=1
 1170 gosub45000:gosub47000
 1180 ift=1thenx=g1*7-7:y=14:cc=0:goto1210
 1200 x=c1*7-7:y=2:cc=1
 1210 gosub45000:gosub47000
 1250 nexti
 1260 gosub40000:print"{rvon}    fine partita":forw=1to1000:next
 1270 gosub40000
 1280 ifpc=pgthenprint"{rvon}parita' 60 - 60":goto1400
 1290 ifpc>pgthenprint"{rvon}ho vinto io!";pc;"-";pg:goto1400
 1300 print"{rvon}hai vinto tu";pg;"-";pc
 1400 forw=1to5000:next
 1410 gosub40000:print"{rvon}un'altra sfida (s/n)?"
 1420 poke198,0
 1430 geta$:ifa$="s"then510
 1440 ifa$<>"n"then1430
 1450 print"{clr}ciao":end
10000 poke54273,255
10010 poke54277,4*16
10020 poke54278,0
10030 poke54276,128
10035 poke54276,129
10040 return
20000 gosub40000:print"{rvon} tocca a te, carta ?":poke198,0
20010 geta$:ifval(a$)<1orval(a$)>3then20010
20020 g1=val(a$)
20030 ifg(g1,1)=0then20010
20040 cardg1*7-7,14,0,0
20050 gosub10000:card24,10,g(g1,1),g(g1,2)
20060 gosub40000:return
30000 gosub40000:print"{rvon}tocca a me...attendi"
30010 rem ifpc>60then30100
30020 ift=2then30200
30030 ift=1then32000
30100 forw=1to1000:next
30110 c1=int(rnd(0)*3)+1
30120 ifc(c1,1)=0then30110
30130 goto39000
30200 rem il computer risponde al gioco
30201 bc=0
30202 forw=1to3:ifc(w,2)=brthenbc=bc+1
30203 next
30204 forc1=1to3
30205 ifc(c1,1)=0thenpt(c1)=-100:goto31290
30210 gosub60800:pp=0
30220 ifj1=14orj1=15thenpp=pp+j1-4
30230 ify1=14ory1=15thenpp=pp+y1-4
30240 ifj1>10andj1<14thenpp=pp+j1-9
30260 ify1>10andy1<14thenpp=pp+y1-9
30270 ifv=1thenpt(c1)=-pp:goto30300
30280 pt(c1)=pp-.01
30300 ify1=15andy2=brthenpt(c1)=pt(c1)-20
30310 ify2=brandbc<2thenpt(c1)=-5
30320 ify2=brthenpt(c1)=pt(c1)-.7-(.1*(y1-8))
31290 nextc1
31300 fp=0:mx=1
31310 forw=2to3
31320 ifpt(w)>pt(mx)thenmx=w:goto31330
31330 next
31540 c1=mx
31550 goto39000
32000 rem gioca computer per primo
32010 bc=0:forc1=1to3
32020 ifc(c1,2)=brthenbc=bc+1
32030 nextc1
32040 ba=0:forw=1to10
32050 ifmt(w,br+1)=0thenba=1
32060 next
32070 forc1=1to3
32080 gosub62000
32090 nextc1
32100 cx=1
32110 forw=2to3
32120 ifpt(w)>pt(cx)thencx=w
32130 next
32140 c1=cx
39000 gosub40000
39010 cardc1*7-7,2,0,0
39020 gosub10000:card22,6,c(c1,1),c(c1,2):return
40000 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rvon}{blk}                    "
40010 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";:return
45000 gosub10000
45005 ifcc=1then:cardx,y,15,1:c(c1,1)=mz(ps,1):c(c1,2)=mz(ps,2)
45010 ifcc=0then:cardx,y,mz(ps,1),mz(ps,2):g(g1,1)=mz(ps,1):g(g1,2)=mz(ps,2)
45020 ps=ps+1
45030 ifcc=1thengosub55010:return
47000 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{gry1}carte";
47010 print"{down}{left}{left}{left}{left}{left}mazzo{down}{down}{left}{left}{left}{left}   {left}{left}{left}";40-ps+1
47020 return
50000 forc=1to40:mz(c,1)=0:nextc
50008 forc=0to3
50010 forb=1to10
50015 gosub10000
50020 ps=int(rnd(0)*40+1)
50030 ifmz(ps,1)=0thenmz(ps,1)=b:mz(ps,2)=c:goto50070
50040 ifps=40thenps=0
50050 ps=ps+1
50060 goto50030
50070 nextb,c
50080 forc=1to40
50090 ifmz(c,1)>7thenmz(c,1)=mz(c,1)+3
50100 next
50110 ps=1:return
55000 fl=0:ong(g1,2)+1gosub55100,55200,55300,55400
55010 fl=1:onc(c1,2)+1gosub55100,55200,55300,55400
55020 return
55100 np=np+1
55110 iffl=1thenmt((c(c1,1)+3*(c(c1,1)>10)),1)=1
55120 iffl=0thenmt((g(g1,1)+3*(g(g1,1)>10)),1)=1
55130 return
55200 nf=nf+1
55210 iffl=1thenmt((c(c1,1)+3*(c(c1,1)>10)),2)=1
55220 iffl=0thenmt((g(g1,1)+3*(g(g1,1)>10)),2)=1
55230 return
55300 nq=nq+1
55310 iffl=1thenmt((c(c1,1)+3*(c(c1,1)>10)),3)=1
55320 iffl=0thenmt((g(g1,1)+3*(g(g1,1)>10)),3)=1
55330 return
55400 nc=nc+1
55410 iffl=1thenmt((c(c1,1)+3*(c(c1,1)>10)),4)=1
55420 iffl=0thenmt((g(g1,1)+3*(g(g1,1)>10)),4)=1
55430 return
60800 ift=2thenj1=g(g1,1):j2=g(g1,2):y1=c(c1,1):y2=c(c1,2):goto60850
60840 j1=c(c1,1):j2=c(c1,2):y1=g(g1,1):y2=g(g1,2)
60850 ifj1=1thenj1=15
60860 ify1=1theny1=15
60870 ifj1=3thenj1=14
60880 ify1=3theny1=14
60890 ifj2<>y2andy2<>brthenv=1:goto60950
60910 ifj2<>y2andy2=brthenv=0:goto60950
60920 ifj1>y1thenv=1:goto60950
60930 v=0
60950 return
62000 rem routine megagalattica
62010 nn=c(c1,1)
62012 ifnn=0thenpt(c1)=-100:goto63000
62020 ifnn=1thennn=15
62025 ifnn=3thennn=14
62110 pt(c1)=0
62120 ifnn=14ornn=15thenpt(c1)=-20-nn
62130 ifbc<2andc(c1,2)=brthenpt(c1)=-17-nn
62140 ifmt(1,c(c1,2)+1)=0thenpt(c1)=pt(c1)-5
62150 ifmt(3,c(c1,2)+1)=0thenpt(c1)=pt(c1)-4
63000 return

