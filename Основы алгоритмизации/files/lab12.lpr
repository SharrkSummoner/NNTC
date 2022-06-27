program lab12;

{$mode objfpc}{$H+}

uses
{$IFDEF UNIX}{$IFDEF UseCThreads}
cthreads,
{$ENDIF}{$ENDIF}
Classes, SysUtils, CustApp
{ you can add units after this };

var
f1, f2: text;
a: integer;
b: char;
r: char;
s, letter: string;

begin
[letter]:=['A'..'Z','a'..'z','А'..'Я','а'..'я'];

assign(f1,'chisla.dat');
rewrite(f1);
repeat
      readln(a);
      writeln(f1,a);
      write('Введите число=');
      readln(r);
until r='*';
close(f1);

reset(f1);
while not eof(f1) do
      begin
      readln(f1,a);
      writeln(a);
      end;

assign(f2,'symbol.dat');
rewrite(f2);
repeat
      readln(b);
      writeln(f2,b);
      write('Введите символ=');
      readln(r);
until r='*';
close(f2);

reset(f2);
while not eof(f2) do
      begin
      readln(f2,b);
      writeln(b);
      end;
readln;
s:='';
close(f2);

assign(f2, 'symbol.dat');
reset(f2);
while not eof(f2) do
      begin
      readln(f2,b);
      if (pos(b, letter) <> 0) or (pos(b, letter) <> 0)
         then s:=s+b;
         end;

writeln('Ваша строка - ',s);
readln;
end.
