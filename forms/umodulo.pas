unit uModulo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, mysql56conn, sqldb;

type

  { TfModulo }

  TfModulo = class(TDataModule)
    Conection: TMySQL50Connection;
    SQLTransaction: TSQLTransaction;
    procedure ConectionAfterConnect(Sender: TObject);
  private

  public

  end;

var
  fModulo: TfModulo;

implementation

{$R *.lfm}

{ TfModulo }

procedure TfModulo.ConectionAfterConnect(Sender: TObject);
begin

end;

end.

