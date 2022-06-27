unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  w,h:integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  w:=random(Form1.Width);
  h:=random(Form1.height);
  if panel1.Left>w then while panel1.Left>w do
  panel1.left:=panel1.left-1
  else
  if panel1.left<(form1.width-panel1.Width)then while
  panel1.left<(form1.width-panel1.Width) do
  panel1.left:=panel1.left+1;

end;

end.

