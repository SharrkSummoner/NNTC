unit Unit1;


interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons;

{ TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Unit2;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Text := RunTestForm(Edit1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit2.Text := RunTestForm(Edit2.Text);
end;

initialization
  {$I unit1.lrs}

end.

end.

