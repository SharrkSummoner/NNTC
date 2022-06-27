unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Shape1: TShape;
    Timer1: TTimer;



    procedure Timer1Timer(Sender: TObject);


  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
     with shape1 do
begin
  case tag of
  0:if shape1.Top>0 then begin shape1.Top:=shape1.Top-30; if shape1.Top<0 then shape1.Top:=0; end;
  1:if shape1.Top+shape1.height<form1.Height then begin shape1.Top:=shape1.Top+30; if shape1.Top+shape1.height>form1.height
  then shape1.top:=form1.height-shape1.height; end;
end;
   if shape1.top=0 then tag:=1;
   if shape1.Top+shape1.height=form1.Height then tag:=0;

  end;
end;






end.

