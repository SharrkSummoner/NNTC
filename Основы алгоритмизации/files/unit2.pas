unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
    function GetTestValue: string;
    procedure SetTestValue(const AValue: string);
  public
    { public declarations }
    property TestValue: string read GetTestValue write SetTestValue;
  end;

  function RunTestForm(const InitialValue: string): string;

var
  Form2: TForm2;
