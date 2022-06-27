program Project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

var
    f:file of char;
    g:file of integer;
    c,v:char;
    z,x:integer;
    i,n,m:byte;

begin
    assign(f, 'simv.dat');
    rewrite (f);
    write ('Kol-vo simvolov ');
    readln (n);
    for i:=1 to n do begin
        write ('Vvedite simvol: ');
        readln (c);
        write (f, c);
    end;
    close(f);

    assign(g, 'chisl.dat');
    rewrite(g);
    write ('Kol-vo chisel ');
    readln(m);
    for i:=1 to m do  begin
        write ('Vvedite chislo: ');
        readln (z);
        write (g, z);
    end;
    close(g);

    reset(f);
    while not eof(f) do
    begin
      read(f, v);
      writeln(v);
    end;
    close (f);

    writeln();

    reset(g);
    while not eof(g) do
    begin
      read(g, x);
      writeln(x);
    end;
    close(g);

readln;
end.
