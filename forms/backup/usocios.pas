unit usocios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, DBGrids, DBCtrls, Buttons, MaskEdit, DBExtCtrls, LR_DBSet, LR_Class;

type

  { Tfsocios }

  Tfsocios = class(TForm)
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    ds_gruposanguineo: TDataSource;
    ds_nacionalidad: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    ds_documentos: TDataSource;
    ds_localidades: TDataSource;
    edit_apellido: TDBEdit;
    edit_nombre: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    EDIT_FIJO: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    ds_socios: TDataSource;
    report: TfrReport;
    fr_dssocios: TfrDBDataSet;
    grid_socios: TDBGrid;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbl_socios: TLabel;
    Panel1: TPanel;
    pnl_campos: TPanel;
    pnl_fondo: TPanel;
    pnl_titulo: TPanel;
    btn_nuevo: TSpeedButton;
    btn_editar: TSpeedButton;
    btn_grabar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    BTN_PRINT: TSpeedButton;
    sql_grupo: TSQLQuery;
    sql_grupogrupo: TStringField;
    sql_grupoidgrupo: TAutoIncField;
    sql_localidadesidlocalidad: TAutoIncField;
    sql_localidadesidprovincia: TLongintField;
    sql_localidadeslocalidad: TStringField;
    sql_nacionalidad: TSQLQuery;
    sql_nacionalidadidnacionalidad: TAutoIncField;
    sql_nacionalidadnacionalidad: TStringField;
    sql_tipodoc: TSQLQuery;
    sql_localidades: TSQLQuery;
    sql_socio: TSQLQuery;
    sql_socioACTIVO: TLongintField;
    sql_socioAPELLIDOS: TStringField;
    sql_socioCBU: TStringField;
    sql_socioCELULAR: TStringField;
    sql_socioCONYUGE: TStringField;
    sql_socioCTABCO: TStringField;
    sql_socioCUIT: TStringField;
    sql_socioDIRECCION: TStringField;
    sql_socioDNI: TStringField;
    sql_socioFECHAINGRESO: TDateField;
    sql_socioFECHANAC: TDateField;
    sql_socioIDESTADOCIVIL: TLongintField;
    sql_socioIDGRUPO: TLongintField;
    sql_socioIDLOCALIDAD: TLongintField;
    sql_socioIDNAC: TLongintField;
    sql_socioIDPROFESION: TLongintField;
    sql_socioIDSOCIO: TAutoIncField;
    sql_socioNOMBRES: TStringField;
    sql_socioNUMEROSOCIO: TStringField;
    sql_socioTELEFONO: TStringField;
    sql_socioTIPODOC: TLongintField;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_grabarClick(Sender: TObject);
    procedure btn_nuevoClick(Sender: TObject);
    procedure BTN_PRINTClick(Sender: TObject);
    procedure edit_apellidoKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure pnl_closeClick(Sender: TObject);
  private

  public

  end;

var
  fsocios: Tfsocios;
implementation

{$R *.lfm}

{ Tfsocios }

procedure Tfsocios.pnl_closeClick(Sender: TObject);
begin
  CLOSE;
end;

procedure Tfsocios.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  fsocios := nil ;
end;

procedure Tfsocios.FormKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
    Key := #0;
    selectnext(ActiveControl,true,true);
  end;
end;

procedure Tfsocios.btn_nuevoClick(Sender: TObject);
begin
  sql_localidades.open ;
  pnl_campos.Enabled   := true ;
  sql_socio.Append ;
  edit_apellido.SetFocus ;
  btn_nuevo.Enabled    := false ;
  btn_cancelar.Enabled := True ;
  btn_grabar.Enabled   := True ;
  btn_editar.Enabled   := False ;
end;

procedure Tfsocios.BTN_PRINTClick(Sender: TObject);
var ruta:string;
begin
  ruta:= extractfilepath(application.exename);
  report.LoadFromFile(ruta + 'reportes/Socios.lrf') ;
  //preview
  report.ShowReport ;
end;

procedure Tfsocios.edit_apellidoKeyPress(Sender: TObject; var Key: char);
begin
  if (key = #13) and (edit_apellido.Text <> '') then
  begin
    edit_nombre.SetFocus;
  end;
end;

procedure Tfsocios.btn_editarClick(Sender: TObject);
begin
  sql_socio.Edit ;
  pnl_campos.Enabled   := True ;
  btn_nuevo.Enabled    := false ;
  btn_cancelar.Enabled := True ;
  btn_grabar.Enabled   := True ;
  btn_editar.Enabled   := False ;
  edit_apellido.SetFocus ;
  grid_socios.Enabled  := False ;
end;

procedure Tfsocios.btn_grabarClick(Sender: TObject);
begin
  sql_socio.Post ;
  btn_nuevo.Enabled    := True ;
  btn_cancelar.Enabled := False ;
  btn_grabar.Enabled   := False ;
  btn_editar.Enabled   := True ;
  pnl_campos.Enabled   := false ;
end;

procedure Tfsocios.btn_cancelarClick(Sender: TObject);
begin
  sql_socio.Cancel ;
  btn_nuevo.Enabled    := True ;
  btn_cancelar.Enabled := False ;
  btn_grabar.Enabled   := False ;
  btn_editar.Enabled   := True ;

end;

procedure Tfsocios.FormShow(Sender: TObject);
begin
  sql_localidades.Open ;
  sql_tipodoc.Open ;
  sql_nacionalidad.Open ;
  sql_grupo.Open ;
  sql_socio.Open;
end;

procedure Tfsocios.Label6Click(Sender: TObject);
begin

end;

end.

