unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ColorBox, ComCtrls, Spin, ExtDlgs, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    ColorListBox1: TColorListBox;
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    SavePictureDialog1: TSavePictureDialog;
    SpinEdit1: TSpinEdit;
    procedure ColorListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;
  X, Y: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssLeft in Shift {если нажата левая клавиша}
  then Image1.Canvas.LineTo (X, Y); {рисуем линию от до точки X, Y}
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  ShowMessage('Это графический редактор');
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  ShowMessage('Автор Мамонов Антон Дмитриевич из 2ИСиП-19-1');
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  Form1.close;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Image1.Canvas.Brush.Color:=clwhite;
  Image1.Canvas.FillRect (0, 0, Image1.Width, Image1.Height);
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  with OpenPictureDialog1 do
  if Execute
  then Image1.Picture.LoadFromFile(FileName);
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  with SavePictureDialog1 do
  if Execute
  then Image1.Picture.SaveToFile(FileName);
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  Image1.Canvas.Pen.Width:=SpinEdit1.Value;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Brush.Color:=clwhite;
  Image1.Canvas.FillRect (0, 0, Image1.Width, Image1.Height);
end;

procedure TForm1.ColorListBox1Click(Sender: TObject);
begin
  Image1.Canvas.Pen.Color:=ColorListBox1.selected;
  Image1.Canvas.Brush.Color:=ColorListBox1.selected;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with Image1.Canvas do
  case Button of {если нажата}
  mbLeft: MoveTo(X,Y);{левая клавиша, то рисуем линию}
  mbRight: FloodFill(X,Y, Pixels[X,Y], fsSurface);{закрашиваем область}
  end;
end;


//procedure TForm1.MenuItem2Click(Sender: TObject);
//begin
//  with SaveDialog1 do
//  if Execute
//  then ListBox1.Items.SaveToFile(FileName);
//end;

end.

