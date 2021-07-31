program Club;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uAcceso, uModulo, uPrincipal, usocios, ulocalidades
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfModulo, fModulo);
  Application.CreateForm(TfAcceso, fAcceso);
  Application.CreateForm(Tlocalidades, localidades);
  Application.Run;
end.

