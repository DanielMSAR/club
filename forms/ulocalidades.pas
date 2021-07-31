unit ulocalidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { Tlocalidades }

  Tlocalidades = class(TForm)
    lbl_socios: TLabel;
    pnl_titulo: TPanel;
    sql_localidades: TSQLQuery;
    procedure lbl_sociosClick(Sender: TObject);
  private

  public

  end;

var
  localidades: Tlocalidades;

implementation

{$R *.lfm}

{ Tlocalidades }

procedure Tlocalidades.lbl_sociosClick(Sender: TObject);
begin

end;

end.

