unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  two: array [0..2] of tcolor=(clred, clyellow, clgreen);
  three: array [0..3] of tcolor=(clred, clyellow, clgreen, clyellow);
  four: array [0..7] of tcolor=(clred,clred, clyellow, clgreen,clgreen,clgreen,
                        clgreen, clyellow);
  red: array [0..2] of tcolor=(clred, clgray, clgray);
  yellow: array [0..2] of tcolor=(clgray, clyellow, clgray);
  green: array [0..2] of tcolor=(clgray, clgray, clgreen);
  z,x,c, v,b,n: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  shape1.brush.color:=random(color);
  shape2.brush.color:=two[z];
  shape3.brush.color:=three[x];
  shape4.brush.color:=four[c];
  z:=z+1;
  x:=x+1;
  c:=c+1;
  if z>2 then z:=0;
  if x>3 then x:=0;
  if c>7 then c:=0;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  shape5.brush.color:=red[v];
  shape6.brush.color:=yellow[b];
  shape7.brush.color:=green[n];
  v:=v+1;
  b:=b+1;
  n:=n+1;
  if v>2 then v:=0;
  if b>2 then b:=0;
  if n>2 then n:=0;
end;


end.

