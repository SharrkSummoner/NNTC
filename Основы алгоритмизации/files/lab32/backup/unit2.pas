unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  Buttons;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.BitBtn1Click(Sender: TObject);
var i,test:integer; st:string;
begin
  test:=0;
  for i:=1 to 10 do if StringGrid1.Cells[i,1]='' then test:=1;
  for i:=1 to 10 do if StringGrid1.Cells[i,2]='' then test:=1;
  if test=1 then ShowMessage('Не все ячейки заполнены!')
  else
    begin
       st:='';
       for i:=1 to 10 do if i=10 then st:= st + StringGrid1.Cells[i,1]+#13
       else
         st:= st + StringGrid1.Cells[i,1]+' ';
       for i:=1 to 10 do st:= st + StringGrid1.Cells[i,2]+' ';
       ShowMessage(st)
    end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Form2.Close;
end;

end.

