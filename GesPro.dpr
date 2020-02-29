program GesPro;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  udmDatos in 'udmDatos.pas' {dmDatos: TDataModule},
  uResponsables in 'uResponsables.pas' {frmResponsables},
  uTareas in 'uTareas.pas' {frmTareas},
  uVisorTareas in 'uVisorTareas.pas' {frmVisorTareas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDatos, dmDatos);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
