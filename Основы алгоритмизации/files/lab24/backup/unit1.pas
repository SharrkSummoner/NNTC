unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

typ

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses Unit2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  time, traf, val: double;
begin
  Time:=StrToFloat(Edit1.Text);
  Traf:=StrToFloat(Edit2.Text);
  Val:=(C_time*Time + C_traf*Traf)*C_kurs;
  Panel1.Caption:=FloatToStrF(Val, ffFixed, 10, 2);
end;

end.

