{$codepage utf8}
Program var2;

uses function;

const
  n=100;
type
  massiv=array [1..n] of integer;
var
  mass1, mass2, mass3, masmax: massiv;
  i,n1,n2,n3,m1,m2,m3,min:integer;

begin
  for i:=1 to 5 do
  randomize;

  n1:=random(10)+5;
  for i:=1 to n1 do
  begin
    mass1[i]:=random(100)-50;
    writeln('a[',i,']=',mass1[i]);
  end;

  writeln;
  n2:=random(10)+5;
  for i:=1 to n2 do
  begin
    mass2[i]:=random(100)-50;
    writeln('a[',i,']=',mass2[i]);
  end;

  writeln;
  n3:=random(10)+5;
  for i:=1 to n3 do
  begin
    mass3[i]:=random(100)-50;
    writeln('a[',i,']=',mass3[i]);
  end;
 writeln;

 m1:=max(mass1);
 write('max1=',m1,'  ');
 m2:=max(mass2);
 write('max2=',m2,'  ');
 m3:=max(mass3);
 write('max3=',m3,'  ');

 if (m1<m2) AND (m1<m3) then min:=m1 else
   if (m2<m3) and (m2<m1) then min:=m2 else min:=m3;
 writeln('Минимальный из максимальных=',min);
 readln;
 end.

