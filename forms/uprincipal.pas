unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, usocios;

type

  { TfPrincipal }

  TfPrincipal = class(TForm)
    Image1: TImage;
    Image2: TImage;
    pnl_abmsocios1: TPanel;
    pnl_contenedor: TPanel;
    pnl_abmsocios: TPanel;
    pnl_subSocios: TPanel;
    pnl_socios: TPanel;
    pnl_close: TPanel;
    pnl_contable: TPanel;
    pnl_titulo: TPanel;
    ScrollBox1: TScrollBox;
    Timer1: TTimer;
    procedure pnl_abmsociosClick(Sender: TObject);
    procedure pnl_abmsociosMouseEnter(Sender: TObject);
    procedure pnl_abmsociosMouseLeave(Sender: TObject);
    procedure pnl_closeClick(Sender: TObject);
    procedure pnl_closeMouseEnter(Sender: TObject);
    procedure pnl_closeMouseLeave(Sender: TObject);
    procedure pnl_contableMouseEnter(Sender: TObject);
    procedure pnl_contableMouseLeave(Sender: TObject);
    procedure pnl_sociosClick(Sender: TObject);
    procedure pnl_sociosMouseEnter(Sender: TObject);
    procedure pnl_sociosMouseLeave(Sender: TObject);
    procedure pnl_tituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnl_tituloMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
  FX, FY, MouseX, MouseY:Integer;
  public

  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.lfm}

{ TfPrincipal }

procedure TfPrincipal.pnl_sociosMouseEnter(Sender: TObject);
begin
  pnl_socios.Font.color := $008C5F00 ;
  pnl_socios.Color      := clwhite ;
end;

procedure TfPrincipal.pnl_sociosClick(Sender: TObject);
begin
  if pnl_subsocios.Visible = False then
  begin
    pnl_subsocios.Visible := True ;
  End
  Else
  Begin
    pnl_subsocios.Visible := False ;
  end;
end;

procedure TfPrincipal.pnl_closeClick(Sender: TObject);
begin
  application.Terminate ;
end;

procedure TfPrincipal.pnl_abmsociosMouseEnter(Sender: TObject);
begin
  pnl_abmsocios.Font.Style := [fsItalic,fsUnderline] ;
  pnl_abmsocios.Font.Color := clblue ;
end;

procedure TfPrincipal.pnl_abmsociosClick(Sender: TObject);
begin
  if fsocios = nil then
  begin
    application.CreateForm(tfsocios,fsocios) ;
    pnl_contenedor.Visible := True ;
    fsocios.BorderStyle    := bsNone ;
    fsocios.Parent         := pnl_contenedor ;
    fsocios.Align          := alClient ;
    fsocios.Show ;
  end
  else
  begin
    fsocios.Close;
    pnl_contenedor.visible := false ;
  end;
end;

procedure TfPrincipal.pnl_abmsociosMouseLeave(Sender: TObject);
begin
  pnl_abmsocios.Font.Style := [fsUnderline] ;
  pnl_abmsocios.Font.Color := clblue ;
end;

procedure TfPrincipal.pnl_closeMouseEnter(Sender: TObject);
begin
  pnl_close.BevelOuter := bvRaised ;
end;

procedure TfPrincipal.pnl_closeMouseLeave(Sender: TObject);
begin
    pnl_close.BevelOuter := bvNone ;
end;

procedure TfPrincipal.pnl_contableMouseEnter(Sender: TObject);
begin
  pnl_contable.Font.color := $008C5F00 ;
  pnl_contable.Color      := clwhite ;
end;

procedure TfPrincipal.pnl_contableMouseLeave(Sender: TObject);
begin
  pnl_contable.Color      := $008C5F00 ;
  pnl_contable.Font.color := clwhite ;
end;

procedure TfPrincipal.pnl_sociosMouseLeave(Sender: TObject);
begin
  pnl_socios.Color      := $008C5F00 ;
  pnl_socios.Font.color := clwhite ;
end;

procedure TfPrincipal.pnl_tituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FX := Left;
  FY := Top ;
  MouseX := Mouse.CursorPos.x ;
  MouseY := Mouse.CursorPos.y ;
  Timer1.Enabled := True;
end;

procedure TfPrincipal.pnl_tituloMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timer1.Enabled := False ;
end;

procedure TfPrincipal.Timer1Timer(Sender: TObject);
begin
  fPrincipal.Left := FX + (Mouse.CursorPos.x - MouseX) ;
  fPrincipal.Top  := FY + (Mouse.CursorPos.y - MouseY) ;
end;

end.

