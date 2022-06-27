unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Interfaces, Unit1, unit2;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
r,g,b:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
r:=random(255);
g:=random(255);
b:=random(255);
Form1.color:=rgb(r,g,b);

end;

procedure TForml. ImagelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer) ; begin

if ssLeft in Shift {если нажата левая клавиша}

then Image1.Canvas. LineTo(X, Y); {рисуем линию от до точки X, Y}

end;

end.
