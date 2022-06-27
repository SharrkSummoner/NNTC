unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
{$R *.lfm}

procedure GrOfFunc;
var
x1,x2:real;
y1,y2:real;
x:real;
y:real;
dx:real;
l,b:integer;
w,h:integer;
mx,my:real;
x0,y0:integer;

begin
l:=10;
b:=Form1.ClientHeight-20;
h:=Form1.ClientHeight-40;
w:=Form1.Width-40;

x1:=0;
x2:=25;
dx:=0.01;

y1:=Cos(x1)*x1;
y2:=Cos(x1)*x1;
x:=x1;

repeat
y := Cos(x)*x;
if y < y1 then y1:=y;
if y > y2 then y2:=y;
x:=x+dx;

until (x>=x2);
my:=h/abs(y2-y1);
mx:=w/abs(x2-x1);
x0:=l;
y0:=b-Abs(Round(y1*my));

with Form1.Canvas do
begin
MoveTo(l,b);LineTo(l,b-h);
MoveTo(x0,y0);LineTo(x0+w,y0);
TextOut(l+5,b-h,FloatToStrF(y2,ffGeneral,6,3));
TextOut(l+5,b,FloatToStrF(y1,ffGeneral,6,3));

x:=x1;
repeat
y:=Cos(x)*x;
Pixels[x0+Round(x*mx),y0-Round(y*my)]:=clRed;
x:=x+dx;
until (x>=x2);
end;
end;



{ TForm1 }
procedure TForm1.FormPaint(Sender: TObject);
begin
 GrOfFunc;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Form1.Canvas.FillRect(Rect(0,0,ClientWidth,ClientHeight));
  GrOfFunc;
end;

end.

