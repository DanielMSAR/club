unit uAcceso;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, uPrincipal, inifiles;

type

  { TfAcceso }

  TfAcceso = class(TForm)
    edit_usuario: TEdit;
    edit_password: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    pnl_close: TPanel;
    pnl_titulo: TPanel;
    sql_usuario: TSQLQuery;
    sql_usuarioacceso: TLongintField;
    sql_usuarioidusuario: TAutoIncField;
    sql_usuarionombres: TStringField;
    sql_usuariopassword: TStringField;
    sql_usuariousuario: TStringField;
    procedure edit_passwordKeyPress(Sender: TObject; var Key: char);
    procedure edit_usuarioExit(Sender: TObject);
    procedure edit_usuarioKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure pnl_closeClick(Sender: TObject);
    procedure pnl_closeMouseEnter(Sender: TObject);
    procedure pnl_closeMouseLeave(Sender: TObject);
  private

  public

  end;

var
  fAcceso: TfAcceso;

implementation

{$R *.lfm}

{ TfAcceso }

procedure TfAcceso.pnl_closeMouseEnter(Sender: TObject);
begin
  pnl_close.Font.color := clblack ;
  pnl_close.color      := clwhite ;
end;

procedure TfAcceso.pnl_closeClick(Sender: TObject);
begin
  application.Terminate ;
end;

procedure TfAcceso.edit_passwordKeyPress(Sender: TObject; var Key: char);
begin
  If key = #13 then
  begin
    if edit_password.Text = sql_usuariopassword.AsString then
    begin
         application.CreateForm(TfPrincipal,fPrincipal);
         fPrincipal.ShowModal;
         fAcceso.Visible := False;
    end
    else
    begin
         edit_password.Text     := '' ;
         edit_password.TextHint := 'ERROR DE PASSWORD' ;
         edit_password.color    := $008CDBDD ;
         edit_password.setfocus ;
    end;
  end;
end;

procedure TfAcceso.edit_usuarioExit(Sender: TObject);
begin
  sql_usuario.close ;
  sql_usuario.SQL.Clear ;
  sql_usuario.sql.text := 'SELECT * FROM usuario where usuario = ' + quotedstr(edit_usuario.Text) ;
  sql_usuario.open ;
  if sql_usuario.RecordCount > 0 then
  begin
    edit_password.SetFocus ;
    edit_usuario.color := cldefault ;
  end
  else
  begin
    edit_usuario.Color    := $008CDBDD ;
    edit_usuario.text     := '' ;
    edit_usuario.TextHint := 'Usuario inexistente' ;
    edit_usuario.setfocus ;
  end;
end;

procedure TfAcceso.edit_usuarioKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
    edit_password.SetFocus ;
  end;
end;

procedure TfAcceso.FormShow(Sender: TObject);
var ini : Tinifile;
lastuser : string;
begin
     ini := tinifile.Create(extractfilepath(application.ExeName) +   '\config.ini') ;
     lastuser := ini.ReadString('Parametros','lastuser','error') ;
     edit_usuario.text := lastuser;
end;

procedure TfAcceso.pnl_closeMouseLeave(Sender: TObject);
begin
  pnl_close.Font.color := clwhite ;
  pnl_close.color      := clblack ;
end;

end.

