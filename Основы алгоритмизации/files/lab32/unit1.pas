unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses Unit2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
var a:array[1..10] of integer; st:string; max,j,imax,i,t,test:integer;
const n=10;
begin
  test:=0;
  for i:=1 to 10 do if StringGrid1.Cells[i,1]='' then test:=1;
  if test=1 then ShowMessage('Не все ячейки заполнены!')
  else
  begin
  st:='';
  for i:=1 to 10 do a[i]:=strtoint(StringGrid1.Cells[i,1]);
  for i:=1 to n-1 do begin max:=a[i]; imax:=i;
    for j:=i+1 to n do if a[j]>max then begin max:=a[j]; imax:=j end;
  t:=a[i]; a[i]:=max; a[imax]:=t;
  end;
  for i:=1 to n do st:= st + inttostr(a[i])+#13; ShowMessage(st);
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var g:array[1..10] of integer; sum,ind,test:integer;
begin
  test:=0;
  for ind:=1 to 10 do if StringGrid1.Cells[ind,1]='' then test:=1;
  if test=1 then ShowMessage('Не все ячейки заполнены!')
  else
  begin
  sum:=0;
  for ind:=1 to 10 do g[ind]:=strtoint(StringGrid1.Cells[ind,1]);
  for ind:=1 to 10 do sum:=sum+g[ind];
  Edit1.Text:=inttostr(sum);
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  Form2.Show;
end;

end.

