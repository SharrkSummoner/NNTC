program zadanie2;
Uses crt;
var a,b,c,P,S:real;
begin
readln(c);
a:=c/2;
b:=sqrt(c*c-a*a);
S:=(a*b)*1/2 ;
P:=a+b+c;
writeln('P=', P);
writeln('S=', S);
readkey;
end.


