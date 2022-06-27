unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Panel1: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
   if panel1.top>0 then panel1.top:=panel1.top-10;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if panel1.Left>0 then panel1.left:=panel1.left-10;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if panel1.left<(form1.width-panel1.Width) then panel1.left:=panel1.left+10;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 panel1.Left:=random(form1.width-panel1.width);
 panel1.Top:=random(form1.Height-panel1.height-390);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 shape2.shape:=stCircle;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  shape2.shape:=stSquare;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if (shape3.height>10) and (shape3.Width>10) then
  begin
  shape3.height:=shape3.height-4;
  shape3.width:=shape3.width-4;
  shape3.top:=shape3.top+2;
  shape3.left:=shape3.Left+2;
  end;
  end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if (shape3.height<180) and (shape3.Width<180) then
  begin
  shape3.height:=shape3.height+4;
  shape3.width:=shape3.width+4;
  shape3.top:=shape3.top-2;
  shape3.left:=shape3.Left-2;
  end;
end;

procedure TForm1.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  shape1.brush.color:=random(color);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if panel1.top<170 then panel1.top:=panel1.top+10;
end;

end.
  //210
