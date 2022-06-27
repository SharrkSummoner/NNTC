unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Graph;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  L1, L2, k: double;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  L1:=StrToInt(Edit1.Text);
  L2:=StrToInt(Edit2.Text);
  k:=StrToInt(Edit3.Text);
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
  x, y, xc, yc: integer;
  Q, angle1, angle2: double;
begin
  Q:=pi/180;
  with PaintBox1 do
  begin
  xc:=Width div 2;
  yc:=Height div 2;
  Canvas.Pen.Color:=clWhite;
  Canvas.Pen.Width:=3;
  Canvas.Brush.Color:=RGBtocolor(120,200,160);
  Canvas.Rectangle(0, 0, Width, Height);
  end;
  angle1:=0;

  while angle1<=360 do
  begin
  angle2:=angle1*(1 + k) ;
  x:=round(L1*cos(Q*angle1)+L2*cos(Q*angle2));
  y:=-round(L1*sin(Q*angle1)+L2*sin (Q*angle2));
  if angle1=0
  then PaintBox1.Canvas.MoveTo(xc+x, yc+y)
  else PaintBox1.Canvas.LineTo(xc+x,yc+y);
  angle1:=angle1 + 1/(1 + k) ;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  L1:=StrToInt(Edit1.Text);
  L2:=StrToInt(Edit2.Text) ;
  k:=StrToInt(Edit3.Text) ;
  PaintBox1.Refresh;
end;

end.

