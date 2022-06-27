unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, CheckLst, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckListBox1: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.CheckListBox1Click(Sender: TObject);
var i : word; S : double;
begin
  S:=0;
  with CheckListBox1 do
  for i:=0 to Items.Count-1 do
  if Checked[i] then S:=S+StrToFloat(ListBox1.Items[i]) ;
  Panel1.Caption:=FloatToStr(S);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  form1.close;
end;

end.

