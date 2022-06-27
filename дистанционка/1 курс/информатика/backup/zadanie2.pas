program zadanie2;
Uses crt;
var a,b,c,S,P:real;
begin
readln(c);
a:=c/2;
writeln(a);
b:=sqrt(c*c-a*a);
writeln(b);
S:=(a*b)*1/2 ;
P:=c+a;
writeln(P);
P:=P+b;
writeln('P=', P);
writeln('S=', S);
readkey;
end.


