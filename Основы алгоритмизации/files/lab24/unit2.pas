unit Unit2;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;
  C_time, C_traf, C_kurs: double;

implementation
uses Unit1;

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
  C_time:=StrToFloat(Edit1.Text);
  C_traf:=StrToFloat(Edit2.Text);
  C_kurs:=StrToFloat(Edit3.Text);
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  C_time:=StrToFloat(Edit1.Text);
  C_traf:=StrToFloat(Edit2.Text);
  C_kurs:=StrToFloat(Edit3.Text);
  Form2.Close;
  Form1.Button2.Click;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Form2.Close;
end;

end.

