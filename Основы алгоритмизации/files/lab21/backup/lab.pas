unit lab;

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
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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

procedure TForm1.Button3Click(Sender: TObject);
var t:string;
begin
 t:=edit4.text;
 edit4.text:=edit5.text;
 edit5.text:=t;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if Button4.caption='>>' then
  begin
    edit7.text:=edit6.text;
    edit6.text:='';
    Button4.caption:='<<';
  end
  else
  begin
  edit6.text:=edit7.text;
  edit7.text:='';
  Button4.caption:='>>';
  end;

end;
end.

