unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Spin,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    ColorDialog1: TColorDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Shape1: TShape;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0: Shape1.Shape:=stCircle;
  1: Shape1.Shape:=stEllipse;
  2: Shape1.Shape:=stSquare;
  end;
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
  0: Shape1.Brush.Style:=bsSolid;
  1: Shape1.Brush.Style:=bsCross;
  2: Shape1.Brush.Style:=bsDiagCross;
  end;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  Shape1.Pen.Width:=SpinEdit1.Value;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  Button1.Enabled:=CheckBox1.Checked;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  Shape1.Brush.Color:=ColorDialog1.Color;
end;

end.

