unit off;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

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
end.

