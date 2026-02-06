

;D:\DEV\CardGamesC64\CARD_Games_C64\Dev\Briscola-it\briscola-it.prg ==0801==
   10 rem briscola it
   20 rem by carlo & lorenzo barazzetta
   30 rem basic + comando 'card'
   40 :
   42 k1=49152:gosub 63900:sys k1+138:rem attiva il comando card
   45 print chr$(147);
   50 dim mz(40,2):rem mazzo di carte
   51 dim c(3,2):rem carte che il computer ha in mano
   52 dim g(3,2):rem carte che il giocatore ha in mano
   53 dim mt(10,4):rem flags delle carte gia' giocate
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
  170 gosub 9100:print" [i] per istruzioni  "
  180 gosub 9100:print" [g] per giocare     "
  190 gosub 9100:gosub 9200:print
  195 poke 198,0
  200 get a$:if a$="g" then 500
  210 if a$<>"i" then 200
  220 print chr$(147);
  230 print chr$(31);"istruzioni:"
  235 print chr$(144);"-----------"
  240 print chr$(31);"questo programma trasforma il tuo"
  250 print"c64 in un vero giocatore di briscola!"
  270 print
  280 print"regole del gioco della briscola"
  290 print chr$(144);"-------------------------------"
  300 print chr$(31);"si gioca con un mazzo di 40 carte.     "
  310 print"la scala dei valori e' la seguente:    "
  315 print
  320 print"nome            simbolo    punti"
  325 print chr$(144);
  327 print"----            -------    -----"
  330 print chr$(31);
  333 print"asso                  ";chr$(192);"       11"
  335 print
  340 print"tre                   ";chr$(194);"       10"
  345 print
  350 print"re (king)             ";chr$(204);"        4"
  355 print
  360 print"donna (queen)         ";chr$(203);"        3"
  365 print
  370 print"fante (jack)          ";chr$(202);"        2"
  375 print
  380 print"7,6,5,4,2     ";
  382 print chr$(198);",";chr$(197);",";chr$(196);",";chr$(195);",";chr$(193);
  385 print"        0"
  390 print
  400 print chr$(28);"     premi un tasto per continuare  ";
  405 poke 198,0
  410 get a$:if a$="" then 410
  420 print chr$(147);
  430 print chr$(31);"il mazzo viene mischiato a turno"
  432 print"tra il computer ed il giocatore."
  433 print
  435 print"chi mischia il mazzo distribuisce"
  437 print"tre carte ciascuno,"
  440 print"poi mostra l'ultima carta del mazzo ed"
  445 print"il seme di questa carta e' la briscola."
  446 print
  447 print"i semi sono:"
  448 print chr$(144);chr$(160);"=picche ";chr$(161);"=fiori ";
  449 print chr$(28);chr$(162);"=quadri ";chr$(163);"=cuori"
  450 print
  451 print chr$(31);"esempio: l'ultima carta e' il 5 di cuori"
  452 card int((40-7)/2),12,5,3:zc$=chr$(17):zn=8:gosub 9000
  453 print"percio' la briscola e' cuori e"
  454 print"tutte le carte di cuori sono briscole."
  455 print
  456 print chr$(28);"     premi un tasto per continuare  ";
  457 poke 198,0
  458 get a$:if a$="" then 458
  459 print chr$(147);
  460 print chr$(31);"si gioca mettendo sul tavolo"
  461 print"una carta ciascuno."
  462 print
  463 print"tra le due carte giocate, una vince"
  464 print"seguendo questo ragionamento:"
  465 print"se i semi delle due carte sono uguali"
  466 print"vince quella di maggior valore, mentre"
  470 print"se sono diversi e una carta e' una"
  472 print"briscola vince la briscola, altrimenti"
  473 print"vince chi ha tirato la carta per primo."
  474 print
  475 print"si prosegue pescando una carta ciascuno"
  480 print"dal mazzo e ripetendo la giocata fino"
  485 print"all'esaurimento delle carte nel mazzo."
  487 print
  490 print"alla fine vince chi avra' totalizzato"
  493 print"piu' di 60 punti."
  494 print"se entrambi i giocatori hanno"
  495 print"totalizzato 60 punti, la partita e' pari";
  496 print
  497 print chr$(28);"     premi un tasto per giocare  ";
  498 poke 198,0
  499 get a$:if a$="" then 499
  500 rem inizio del gioco
  501 print chr$(147);
  502 print chr$(144);"come ti chiami (massimo 19 lettere)"
  503 poke 198,0
  504 input n$
  506 if len(n$)=0 or len(n$)>19 then print"inserimento errato, ripeti":goto 502
  508 t1=int(rnd(0)*2)+1:rem decide chi deve iniziare a giocare la prima partita
  510 rem nuova partita
  511 rem inizia a giocare chi nella partita precedente ha giocato per secondo
  512 if t1=1 then t1=2:goto 514
  513 t1=1
  514 t=t1:rem t=1 gioca il computer, t=2 gioca il giocatore
  515 rem inizializzazione variabili
  516 pg=0:rem punti del giocatore
  517 pc=0:rem punti del computer
  518 np=0:rem numero di carte di picche gia' giocate
  519 nf=0:rem numero di carte di fiori gia' giocate
  520 nq=0:rem numero di carte di quadri gia' giocate
  521 nc=0:rem numero di carte di cuori gia' giocate
  522 bc=0:rem numero di carte di briscola che il computer ha in mano
  523 na=0:fa=0
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
  600 pc=0:rem punti del computer
  601 pg=0:rem punti del giocatore
  602 if t=1 then ms$="   mischi il mazzo":goto 605
  603 ms$="   mischio il mazzo"
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
  700 print chr$(19);
  701 zc$=chr$(29):zn=31:gosub 9000
  702 print chr$(17);chr$(17);chr$(31);"briscola:";chr$(17);
  703 zc$=chr$(157):zn=7:gosub 9000
  710 on mz(40,2)+1 goto 730,740,750,760
  730 print chr$(144);"picche":goto 770
  740 print chr$(144);" fiori":goto 770
  750 print chr$(28);"quadri":goto 770
  760 print chr$(28);" cuori"
  770 br=mz(40,2):rem salva il seme della briscola
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
 1025 gosub 40000:print chr$(18);"  prendi tu";pp;"punti";
 1027 pg=pg+pp:t=2
 1028 goto 1040
 1030 gosub 40000:print chr$(18);"  prendo io";pp;"punti";;
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
 1260 gosub 40000:print chr$(18);"    fine partita":for w=1 to 1000:next
 1270 gosub 40000
 1280 if pc=pg then print chr$(18);"parita' 60 - 60":goto 1400
 1290 if pc>pg then print chr$(18);"ho vinto io!";pc;"-";pg:goto 1400
 1300 print chr$(18);"hai vinto tu";pg;"-";pc
 1400 for w=1 to 9000:next
 1410 gosub 40000:print chr$(18);"un'altra sfida (s/n)?"
 1420 poke 198,0
 1430 get a$:if a$="s" then 510
 1440 if a$<>"n" then 1430
 1450 print chr$(147);chr$(144);"ciao":goto 63999:rem esce dal gioco
 9000 rem stampa a video il carattere contenuto in zc$ per zn volte
 9005 if zc$="" goto 9099
 9007 if zn<=0 goto 9099
 9010 for zi=1 to zn
 9020 print zc$;
 9030 next zi
 9099 return
 9100 rem sposta il cursore a destra e stampa in reverse
 9110 zc$=chr$(29):zn=9:gosub 9000
 9115 print chr$(18);
 9120 return
 9200 rem stampa 21 spazi
 9210 print"                     ";
 9220 return
10000 rem genera il suono della carta
10005 poke 54273,255
10010 poke 54277,4*16
10020 poke 54278,0
10030 poke 54276,128
10035 poke 54276,129
10040 return
20000 rem tocca al giocatore giocare la propria carta
20005 gosub 40000:print chr$(18);"tocca a te, carta ?"
20007 poke 198,0
20010 get a$:if val(a$)<1 or val(a$)>3 then 20010
20020 g1=val(a$)
20030 if g(g1,1)=0 then 20010
20040 card g1*7-7,14,0,0
20050 gosub 10000:card 24,10,g(g1,1),g(g1,2)
20060 gosub 40000
20070 return
30000 rem tocca al computer giocare la propria carta
30005 gosub 40000:print chr$(18);"tocca a me... attendi"
30010 rem if pc>60 then 30100:rem sceglie una carta a caso da giocare
30020 if t=2 then 30200
30030 if t=1 then 32000
30100 for w=1 to 1000:next
30110 c1=int(rnd(0)*3)+1:rem sceglie una carta a caso tra le 3 carte
30120 if c(c1,1)=0 then 30110
30130 goto 39000
30200 rem il computer risponde al gioco
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
32000 rem gioca il computer per primo
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
40000 rem pulisce la zona nera dei messaggi e posiziona il cursore per scriverci
40001 print chr$(19);
40002 zc$=chr$(17):zn=12:gosub 9000
40003 print chr$(18);chr$(144);
40005 print"                     "
40006 print chr$(19);
40007 zc$=chr$(17):zn=12:gosub 9000
40010 return
45000 rem assegna una carta al computer o al giocatore e la disegna sul tavolo
45001 rem se cc=1 la carta e' assegnata al computer, se cc=0 al giocatore
45002 gosub 10000
45005 if cc=1 then:card x,y,15,1:c(c1,1)=mz(ps,1):c(c1,2)=mz(ps,2)
45010 if cc=0 then:card x,y,mz(ps,1),mz(ps,2):g(g1,1)=mz(ps,1):g(g1,2)=mz(ps,2)
45020 ps=ps+1
45025 if cc=1 then gosub 55010
45030 return
47000 rem stampa il numero di carte che ci sono nel mazzo
47001 print chr$(19)
47002 zc$=chr$(17):zn=18:gosub 9000
47003 zc$=chr$(29):zn=34:gosub 9000
47004 print chr$(151);
47009 print"carte";
47010 print chr$(17);
47011 zc$=chr$(157):zn=5:gosub 9000
47012 print"mazzo";
47013 print chr$(17);chr$(17);
47014 zc$=chr$(157):zn=4:gosub 9000
47015 print"   ";
47016 zc$=chr$(157):zn=3:gosub 9000
47019 print 40-ps+1
47020 return
50000 rem mischia il mazzo
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
50080 rem converte le carte da 8,9,10 in fante,donna,re
50085 for c=1 to 40
50090 if mz(c,1)>7 then mz(c,1)=mz(c,1)+3
50100 next
50110 ps=1:rem prima carta da pescare dal mazzo
50120 return
55000 rem salva la carta come giocata
55005 fl=0:on g(g1,2)+1 gosub 55100,55200,55300,55400
55010 fl=1:on c(c1,2)+1 gosub 55100,55200,55300,55400
55020 return
55100 rem salva la carta di picche come giocata
55105 np=np+1
55110 if fl=1 then mt((c(c1,1)+3*(c(c1,1)>10)),1)=1
55120 if fl=0 then mt((g(g1,1)+3*(g(g1,1)>10)),1)=1
55130 return
55200 rem salva la carta di fiori come giocata
55205 nf=nf+1
55210 if fl=1 then mt((c(c1,1)+3*(c(c1,1)>10)),2)=1
55220 if fl=0 then mt((g(g1,1)+3*(g(g1,1)>10)),2)=1
55230 return
55300 rem salva la carta di quadri come giocata
55305 nq=nq+1
55310 if fl=1 then mt((c(c1,1)+3*(c(c1,1)>10)),3)=1
55320 if fl=0 then mt((g(g1,1)+3*(g(g1,1)>10)),3)=1
55330 return
55400 rem salva la carta di cuori come giocata
55405 nc=nc+1
55410 if fl=1 then mt((c(c1,1)+3*(c(c1,1)>10)),4)=1
55420 if fl=0 then mt((g(g1,1)+3*(g(g1,1)>10)),4)=1
55430 return
60800 rem calcola chi ha vinto la mano corrente
60801 rem se t=1 allora il computer ha giocato la carta per primo
60802 rem se t=2 allora il computer ha giocato la carta per secondo
60810 if t=2 then j1=g(g1,1):j2=g(g1,2):y1=c(c1,1):y2=c(c1,2):goto 60850
60840 j1=c(c1,1):j2=c(c1,2):y1=g(g1,1):y2=g(g1,2)
60845 rem j1(carta) e j2(seme) indicano la carta giocata per prima
60847 rem y1(carta) e y2(seme) indicano la carta giocata per seconda
60850 if j1=1 then j1=15
60860 if y1=1 then y1=15
60870 if j1=3 then j1=14
60880 if y1=3 then y1=14
60890 if j2<>y2 and y2<>br then v=1:goto 60950
60910 if j2<>y2 and y2=br then v=0:goto 60950
60920 if j1>y1 then v=1:goto 60950
60930 v=0
60950 rem se v=0 allora chi ha giocato la carta per primo ha perso
60955 rem se v=1 allora chi ha giocato la carta per primo ha vinto
60957 return
62000 rem routine megagalattica
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
63900 rem verifica se il comando card e' stato caricato in memoria
63905 if k1=0 then print"variabile k1 non inizializzata":goto 63960
63910 w1=peek(k1+120)
63920 w2=peek(k1+121)
63930 w3=peek(k1+122)
63940 w4=peek(k1+123)-128
63950 if w1=asc("c") and w2=asc("a") and w3=asc("r") and w4=asc("d") then 63990
63960 print"comando card non caricato in memoria":goto 63999
63990 return
63999 end

