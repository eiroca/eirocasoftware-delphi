uses datamngr, crt;

const
  mc = 8;
  mr = 90;

var
  erstr, spstr, zestr, scstr: string;
  a_arr: array[0..mr, 0..mc] of real;
  cstr: array[0..mc] of string[40];
  mi, ma, nr, su: array[0..mc] of real;
  lstr: array[0..12] of string;
  jx, xs, lx, ys, ly: real;
  flg, l, nc, i, lg, z: integer;
  rf, tf, gf, af, cf, w: real;

function r(z: real): real; begin r:= int(z * 100 + 0.5) * 0.01; end;
function ii(z: real): real; begin ii:= jx * int(z / jx + 0.0001); end;
function x(z: real): real; begin x:= (231 / xs) * (z - lx) + 48; end;
function y(z: real): real; begin y:= 171 - (162 / ys) * (z - ly); end;

procedure gosub240;
var i: integer;
begin
  for i:= 1 to nc do begin
    write('intestazione ', l, ' colonna ', cstr[l]);
  end;
  for i:= 1 to 40 do write('-');
  writeln;
end;

begin
scstr:= '';
nc:= 0;
z:= 0;
w:= 10;
erstr:= '**********';
spstr:= ' ';
zestr:= '0000000000';
cf:= 0;
rf:= 0;
tf:= 0;
gf:= 0;
af:= 0;
clrscr;
textcolor(7);
gotoxy(14, 8);
write('chart manager');
gotoxy(9, 10);
write('(c) 1986 by enrico croce');
gotoxy(6, 19);
write('premi un tasto per continuare');
readkey;
repeat
clrscr;
writeln(' visualizza dati statistici di base.');
writeln(' trasformazione dei dati' );
writeln(' ordina i dati nella tavola.');
writeln('11. disegna un grafico lineare.');
writeln('12. disegna un grafico a barre.');
writeln('13. disegna un grafico a torta.');
writeln('18. fine delle operazioni.');
gotoxy(1, 23); clreol;
inputint('scegli un numero e premi: ', z, 1, 18);
clrscr;
if (nc > 0) and ((z = 1) or (z= 10) or (z = 18)) then begin
gotoxy(1, 5);
flg:= 0;
getsino('ogni dato che non e'' stato salvato sara'' perso. continui (s/n)? ', flg);
if flg = 0 then continue;
end;
if (z <> 1) and (z <> 10) and (z <> 14) and (z <> 16) and (z <> 15) and (z <> 17) and (z <> 18) and (tf = 0) then begin
gotoxy(1, 8); writeln('nessuna tavola dati presente.');
continue;
end;
case z of
11: gosub2430;
12: gosub2780;
13: gosub3020;
18: gosub3730;
end;
until false;
end.
procedure gosub260;
begin
for l:= 1 to nc do begin
if zstr = cstr[l] then begin
z:= l;
exit;
end;
end;
z:= val(zstr);
if z < 1 or z > nc then (* pop* );
goto 3610;
end;
gettitolo;
input 'titolo del grafico', tstr);
end;
gettitolox;
input 'titolo asse x', xstr;
end;
330;
r:= (ma(a) - mi(a)) / 1.21;
jx:= 4 * 10 ^ int(0.4343 * log(r));
for i:= 1 to 5;
jx:= jx / 2;
hx:= -fni(-ma(a));
lx:= fni(mi(a));
xs:= hx - lx;
gx:= int(1.0001 * xs / jx);
if gx < 5 then end;
b:= 2 * jx * int(-xs / jx / 2.1);
hx:= lx - b;
xs:= hx - lx;
end;
360;
xx:= xx * 7;
yy:= yy * 8;
370;
if zstr:= '' then end;
for l:= 1 to len(zstr);
zzstr:= midstr(zstr, l, 1);
zz:= asc(zzstr);
if zzstr<> ' ' then begin
if zz > 95 then zz:= zz - 32;
if zz >= 32 and zz <= 94 then draws zz - 32, xx, yy;
end;
xx:= xx + 7;
if xx > 273 then xx:= 0;
yy:= yy + 8;
if yy > 184 then yy:= 0;
end;
end;
450;
writeln;
cf:= 0;
input 'vuoi collegare i punti?';
zstr;
zstr:= leftstr(zstr, 1);
if zstr <> 's' then exit;
writeln;
write('poiche' questa opzione ordinera' le due colonne scelte accertarsi di aver salva-to i dati prima di continuare.';
writeln;
input 'vuoi continuare il tracciamento? ', ystr;
ystr:= leftstr(ystr, 1);
if ystr <> 's' then gosub190;
goto 3510;
end;
490;
b:= nr(z1);
500;
a:= 0;
b:= b - 1;
for l:= 1 to b;
if a(l, z1) <:= a(l + 1, z1) then 520;
c:= a(l, z1);
a(l, z1):= a(l + 1, z1);
a(l + 1, z1):= c;
c:= a(l, z);
a(l, z):= a(l + 1, z);
a(l + 1, z):= c;
a:= 1;
520;
end;
540;
xx:= fnx(a(1, z1));
yy:= fny(a(1, z));
gosub590;
if pf then hplot xx, yy;
for l:= 2 to nr(z1);
xx:= fnx(a(l, z1));
yy:= fny(a(l, z));
gosub590;
if not pf then 580;
if cf:= 1 then line -(xx, yy);
if not cf then hplot xx, yy;
580;
end;
end;
590;
pf:= -1;
if xx < 48 then pf:= 0;
if xx > 279 then pf:= 0;
if yy < 9 then pf:= 0;
if yy > 171 then pf:= 0;
end;
640;
writeln;
input 'vuoi le linee della griglia? ';
zstr;
zstr:= leftstr(zstr, 1);
gf:= 10;
if zstr:= 's' then gf:= 1;
if zstr:= 'n' then gf:= 0;
if gf:= 10 then writeln;
write('si oppure no. riprova';
goto 640;
end;
680;
zstr:= tstr;
xx:= 20 - len(tstr) / 2;
if len(tstr) < 34 then xx:= xx + 3;
yy:= 0;
gosub360;
zstr:= xstr;
xx:= 20 - len(zstr) / 2;
if len(zstr) < 34 then xx:= xx + 3;
yy:= 23;
gosub360;
end;
710;
for j:= ly to hy - jy step jy;
zstr:= strstr(fnr(j));
xx:= 7 * (7 - len(zstr));
if xx < 0 then zstr:= '';
yy:= fny(j);
hplot 47, yy, 49, yy;
yy:= yy - 4;
gosub370;
end;
end;
2430 if nc < 2 then gotoxy(wherex, 8;
write('occorrono almeno 2 colonne.';
gosub190;
goto 3510;
gosub240;
writeln;
write('scegli le 2 colonne per il grafico.';
writeln;
writeln;
input 'colonna asse x;
';
zstr;
gosub260;
z1:= z;
writeln;
input 'colonna asse y;
';
zstr;
gosub260;
if z:= z1 or not nr(z) or not nr(z1) then 3610;
gettitolo;
gettitolox;
gosub450;
gosub640;
clrscr;
gotoxy(wherex, 5;
write('quando il grafico e' stato disegnato, premi 'esc' per tornare al testo.';
a:= z;
gosub330;
ly:= lx;
hy:= hx;
jy:= jx;
ys:= xs;
gy:= gs;
a:= z1;
gosub330;
gosub490;
hgr;
hcolor:= 3;
hplot 48, 9, 48, 171;
line -(279, 171);
gosub540;
if not gf then 2570;
for l:= ly to hy step jy;
yy:= fny(l);
hplot 48, yy, 279, yy;
end;
for l:= lx to hx step jx;
xx:= fnx(l);
hplot xx, 171, xx, 9;
end;
2570 zstr:= tstr;
xx:= 20 - len(tstr) / 2;
yy:= 0;
gosub360;
zstr:= xstr;
xx:= 20 - len(zstr) / 2;
yy:= 23;
gosub360;
for j:= lx to hx - jx step jx;
zstr:= strstr(fnr(j));
xx:= fnx(j);
yy:= 174;
hplot xx, 169, xx, 172;
gosub370;
end;
gosub710;
2600 get zstr;
if zstr <> chrstr(27) then 2600;
2610
text;
clrscr;
gotoxy(wherex, 4;
write('vuoi tracciare la regressione';
writeln;
input 'lineare per questi dati? ';
zstr;
rf:= 10;
zstr:= leftstr(zstr, 1);
if zstr:= 's' then rf:= 1;
if zstr:= 'n' then rf:= 0;
if rf:= 10 then 2610;
if not rf then 2700;
gosub1740;
for l:= lx to hx step jx / 20;
xx:= fnx(l);
yy:= fny(sl * l + in);
gosub590;
if pf then hplot xx, yy;
end;
2680 get zstr;
if zstr <> chrstr(27) then 2680;
text;
clrscr;
rf:= 0;
2700 if nc < 3 then 3510;
2710 writeln;
write('vuoi tracciare altre due colonne';
writeln;
input 'usando lo stesso grafico? ';
zstr;
zstr:= leftstr(zstr, 1);
if zstr:= 'n' then gosub190;
goto 3510;
if zstr <> 's' then writeln;
write('rispondi solo si' o no.';
goto 2710;
clrscr;
gosub240;
writeln;
write('scegli le 2 nuove colonne.';
writeln;
input 'colonna asse x;
';
zstr;
gosub260;
z1:= z;
writeln;
input 'colonna asse y;
';
zstr;
gosub260;
if z1:= z then 3610;
gosub450;
gosub490;
gosub540;
2750
get zstr;
if zstr <> chrstr(27) then 2750;
goto 2610;
2780
gosub240;
writeln;
write('scegli la colonna con cui tracciare.';
writeln;
input 'colonna;
';
zstr;
gosub260;
if nr(z) > 12 then write('spiacente, puoi tracciare solo 12 barre.';
gosub190;
goto 3510;
gettitolo;
gettitolox;
gosub640;
mstr:= 'genfebmaraprmaggiulugagosetottnovdic';
2810 writeln;
write('come vuoi etichettare l'asse x;
';
writeln;
write('1. per anno';
write('2. per mese';
write('3. nessuna indicazione';
writeln;
input 'selezione;
';
zstr;
lf:= val(zstr);
if lf < 1 or lf > 3 then 2810;
if lf:= 1 then writeln;
input 'introduci l'anno iniziale;
';
zstr;
e:= val(zstr);
goto 2870;
if lf:= 3 then 2870;
2850 writeln;
input 'introduci il mese iniziale;
';
zstr;
for l:= 1 to 12;
if leftstr(zstr, 3):= midstr(mstr, 3 * l - 2, 3) then e:= l;
goto 2870;
end;
e:= val(zstr);
if e < 1 or e > 12 then 2850;
2870 a:= z;
gosub330;
c:= mi(z);
mi(z):= mi(z) - .5 * jx;
gosub330;
mi(z):= c;
ly:= lx;
hy:= hx;
jy:= jx;
ys:= xs;
gy:= gx;
jx:= 231 / (nr(z) + 1);
a:= (jx - 4) / 2;
clrscr;
gotoxy(wherex, 5;
write('premi 'esc' per tornare al testo';
writeln;
write('dopo il tracciamento.';
for l:= 1 to 2000;
end;
hgr;
hcolor:= 3;
hplot 48, 9, 48, 171;
line -(279, 171);
if gf:= 1 then for l:= ly to hy step jy;
yy:= fny(l);
hplot 48, yy, 279, yy;
end;
hplot 279, 171, 279, 9;
for l:= 1 to nr(z);
yy:= fny(a(l, z));
xx:= 48 + (l * jx);
for j:= 171 to yy step -1;
hplot xx - a, j, xx + a, j;
end;
end;
gosub680;
gosub710;
if lf:= 1 then for j:= 1 to nr(z);
yy:= 174;
xx:= 42 + j * jx;
zstr:= rightstr(strstr(e), 2);
gosub370;
e:= e + 1;
end;
if lf <> 2 then 3000;
for j:= 1 to nr(z);
yy:= 174;
xx:= 45 + j * jx;
zstr:= midstr(mstr, 3 * e - 2, 1);
gosub370;
e:= e + 1;
if e > 12 then e:= 1;
end;
3000 get zstr;
if zstr <> chrstr(27) then 3000;
text;
goto 3510;
3020
gosub240;
writeln;
write('scegli la colonna con cui tracciare.';
writeln;
input 'colonna',zstr;
gosub260;
if nr(z) < 2 or nr(z) > 12 then writeln;
write('spiacente, solo da 1 a 12 settori.';
gosub190;
goto 3510;
writeln;
write('scrivi un nome per ogni riga.';
writeln;
write tab(20);
'--nome--';
writeln;
for l:= 1 to nr(z);
write('riga '; l; ':= ';fnr(a(l, z));
gotoxy( 20;
input lstr(l);
end;
writeln;
gettitolo;
gettitolox;
clrscr;
gotoxy(wherex, 5;
write('premi 'esc' per tornare al testo';
writeln;
write('dopo il tracciamento.';
for l:= 1 to 2000;
end;
hgr;
hcolor:= 3;
goto 3080;
3070 xx:= 1.1 * b * cos(a);
yy:= b * sin(a);
end;
3080 b:= 78;
a:= 0;
gosub3070;
hplot xx + 194, 100 - yy;
for a:= 0 to 6.35 step .05;
gosub3070;
line -(xx + 194, 100 - yy);
end;
a:= 0;
for l:= 1 to nr(z);
a:= a + a(l, z) / su(z) * 6.3;
gosub3070;
hplot 194, 100, xx + 194, 100 - yy;
end;
xx:= 14;
yy:= 8 - nr(z) / 2;
zstr:= '%';
gosub360;
for j:= 1 to nr(z);
xx:= 0;
yy:= (j + (9 - nr(z) / 2)) * 10;
zstr:= chrstr(j + 64) + '-' + leftstr(lstr(j), 11);
3130 if len(zstr) < 13 then zstr:= zstr + ' ';
goto 3130;
zstr:= zstr + strstr(int(a(j, z) / su(z) * 100 + .5));
gosub370;
end;
c:= 0;
a:= 0;
for j:= 1 to nr(z);
c:= a(j, z) / su(z) * 6.3;
a:= a + .5 * c;
b:= 70;
gosub3070;
xx:= xx + 194;
yy:= 100 - yy;
zstr:= chrstr(64 + j);
gosub370;
b:= 80;
a:= a + .5 * c;
end;
gosub680;
3170 get zstr;
if zstr <> chrstr(27) then 3170;
text;
goto 3510;
