unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids;

type
  rec = record
    gr:string[11];
    fam:string[45];
    oc:string[4];
  end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
  private

  public

  end;

var
  Form1: TForm1; c:integer; a:rec; f: file of rec;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormActivate(Sender: TObject);
begin
  StringGrid1.ColCount:=4; StringGrid1.RowCount:=100;
  StringGrid1.colwidths[0]:=20; StringGrid1.colwidths[1]:=50;
  StringGrid1.colwidths[2]:=100; StringGrid1.colwidths[3]:=50;
  StringGrid1.Cells[1,0]:='Группа';
  StringGrid1.Cells[2,0]:='Фамилия';
  StringGrid1.Cells[3,0]:='CР.БАЛЛ';
end;

procedure TForm1.StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
const Value: string);
var X,Y: Integer;
begin
  {if (StringGrid1.Cells[ACol,ARow]<'2') and (StringGrid1.Cells[ACol,ARow]>'5')
  and (StringGrid1.Col=3) then
  StringGrid1.Cells[ACol,ARow]:='';}
end;

procedure TForm1.Button2Click(Sender: TObject);
var j:byte;
begin
  Assignfile(f,'file');
  rewrite(f); c:=0;
  for j:=1 to (StringGrid1.Rowcount-1) do if
  StringGrid1.Cells[2,j]<>'' then c:=c+1;
  for j:=1 to c do begin a.gr:=StringGrid1.Cells[1,j]; a.fam:=StringGrid1.Cells[2,j];
  a.oc:=Stringgrid1.Cells[3,j]; write(f,a) end; closefile(f);
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
  for i:=1 to (StringGrid1.Rowcount-1) do begin
  StringGrid1.Cells[1,i]:='';
  StringGrid1.Cells[2,i]:='';
  StringGrid1.Cells[3,i]:='';
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
begin
  i:=1;
  Assignfile(f,'file');
  reset(f);
  for i:=0 to (filesize(f)-1) do begin
  seek(f,i);
  read(f, a);
  StringGrid1.Cells[1,(i+1)]:=a.gr;
  StringGrid1.Cells[2,(i+1)]:=a.fam;
  StringGrid1.Cells[3,(i+1)]:=a.oc;
  end;
  closefile(f);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Button5Click(Sender: TObject);
var j,x:byte; sr:double;
begin
  x:=0;
  sr:=0;
  for j:=1 to (StringGrid1.Rowcount-1) do if
  StringGrid1.Cells[2,j]<>'' then x:=x+1;
  for j:=1 to x do begin
  sr:=(sr + strtofloat(StringGrid1.Cells[3,j]))
  end;
  sr:=sr/x;
  ShowMessage(floattostr(sr));

end;

procedure TForm1.Button6Click(Sender: TObject);
var i,j,x:integer;
begin
  x:=0;
  for i:=1 to (StringGrid1.Rowcount-1) do if
  StringGrid1.Cells[2,i]<>'' then x:=x+1;
  for i:=1 to x-1 do
  for j:=i+1 to x do
  if StringGrid1.Cells[2,i]>StringGrid1.Cells[2,j] then begin
  StringGrid1.Cols[1].Exchange(j,i);
  StringGrid1.Cols[2].Exchange(j,i);
  StringGrid1.Cols[3].Exchange(j,i);
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
var i:integer; st:string; aboba:double;
begin
   if CheckBox1.Checked=True then begin
   st:='';
   for i:=1 to (StringGrid1.Rowcount-1) do begin
   if StringGrid1.Cells[3,i]<>'' then aboba:=strtofloat(StringGrid1.Cells[3,i]);
   if (aboba < 3) and (StringGrid1.Cells[2,i]<>'') then st:=st + StringGrid1.Cells[2,i] + #13;
   end;
   ShowMessage(st);
   CheckBox1.Checked:=False;
end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin

end;

end.

