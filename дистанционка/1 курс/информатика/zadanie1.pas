program zadanie1;
Uses crt;
var
a,b,c:integer;
x,y:real;

begin
clrscr;
readln(a);
readln(b);
readln(c);
x:=-b/(2*a);
y:=a*x*x+b*x+c;
write('(',x,',',y,')');
readkey;
end.
