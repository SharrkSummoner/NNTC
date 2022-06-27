unit lab21;

{$mode objfpc}{$H+}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  r,g,b: integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  randomize;
  r:=random(255);
  g:=random(255);
  b:=random(255);
  Form1.color:=rgb(r,g,b);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit2.text:=Edit3.text;
  Edit3.text:='';
end;

end.

