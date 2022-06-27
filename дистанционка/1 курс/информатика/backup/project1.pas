program zadanie1;
Uses crt;
var
a,b,c:integer;
x,y:real;

begin
clrscr;
write('vvedite a=');
readln(a);
write('vvedite b=');
readln(b);
write('vvedite c=');
readln(c);
x:=-b/(2*a);
y:=a*x*x+b*x+c;
write('(',x,',',y,')');
readkey;
end.
