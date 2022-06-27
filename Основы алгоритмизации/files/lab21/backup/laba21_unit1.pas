unit laba21_unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (Panel1.Left > 0) then Panel1.Left:= Panel1.Left - 5;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if ((Panel1.Left + Panel1.Width) < Form1.Width) then Panel1.Left:= Panel1.Left + 5;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (Panel1.Top > 0) then Panel1.Top:= Panel1.Top - 5;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if ((Panel1.Top + Panel1.Height) < Form1.Height) then Panel1.Top:= Panel1.Top + 5;
end;

end.

