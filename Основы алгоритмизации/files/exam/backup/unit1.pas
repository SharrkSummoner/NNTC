unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  n: longint;
  i,min,max: byte;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  n:=2147483647;
  if strtoint(Edit1.text) > n then begin
  showmessage('Число слишком большое');
  exit;
  end
  else n:=strtoint(edit1.text);
  //if (not (trystrtoint(Edit1.text, n)))
  //then
  //begin
  //showmessage('Число слишком большое');
  //exit;
  //end;

  edit2.text:=inttostr(n);
  min:=9;
  max:=0;

  while n>0 do
  begin
    i:=n mod 10;
    n:=n div 10;
    if i<min then min:=i;
    if i>max then max:=i;
  end;

  label4.caption:=inttostr(max);
  label5.Caption:=inttostr(min);
end;

end.

