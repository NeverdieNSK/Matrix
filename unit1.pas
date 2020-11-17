unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Grids,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
var a:array of array of integer;
    n,m,i,j:integer;
    b:array of integer;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  StringGrid1.ColCount:=TrackBar1.Position;
  StringGrid2.ColCount:=TrackBar1.Position;
  n:=TrackBar1.Position;
  Button2.Enabled:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

SetLength(a,n,m);
     randomize;
     for i:=0 to n-1 do
     for j:=0 to m-1 do
       a[i][j]:=(100-random(200));

for i:=0 to n-1 do begin
     for j:=0 to m-1 do
     StringGrid1.cells[i,j]:=IntToStr(a[i][j]);
  end;
 Button2.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i2,min,tmp:integer;

begin
SetLength(b,n*m);
 i2:=0;
for i:=0 to n-1 do
  for j:= 0 to m-1 do begin
    b[i2] := a[i][j];
    i2:=i2+1;
  end;

for i:=0 to n*m-2 do
 begin
  min:=i;
  for j:=i+1 to n*m-1 do
  if b[j]<b[min] then min:=j;
  if b[min]<b[i] then
   begin
    tmp:=b[i];
    b[i]:=b[min];
    b[min]:=tmp;
   end;
 end;



i2:=0;
for i:=0 to m-1 do
  for j:= 0 to n-1 do begin
  StringGrid2.Cells[j,i]:=IntToStr(b[i2]);
  i2:=i2+1;
  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.ColCount:=TrackBar1.Position;
  StringGrid1.RowCount:=TrackBar2.Position;
  StringGrid2.ColCount:=TrackBar1.Position;
  StringGrid2.RowCount:=TrackBar2.Position;
  n:=TrackBar1.Position;
  m:=TrackBar2.Position;
  Button2.Enabled:=false;

end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  StringGrid1.RowCount:=TrackBar2.Position;
  StringGrid2.RowCount:=TrackBar2.Position;
  m:=TrackBar2.Position;
  Button2.Enabled:=false;
end;

end.

