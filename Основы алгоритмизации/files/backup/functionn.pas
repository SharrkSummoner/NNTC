unit functionn;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
const n=100;
type
  massiv=array [1..n] of integer;
function max(var mas:massiv):integer;

implementation
function max(var mas:massiv):integer;
var j,m:integer;
begin
  m:=mas[1];
  for j:=2 to n do
  if mas[j]>m
  then m:=mas[j];
  max:=m;
end;
end.

