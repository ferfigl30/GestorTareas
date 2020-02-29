unit udmDatos;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmDatos = class(TDataModule)
    conPrincipal: TADOConnection;
    qResponsables: TADOQuery;
    qResponsablesIDRESPONSABLE: TAutoIncField;
    qResponsablesNOMBRE: TStringField;
    dsResponsables: TDataSource;
    qTareas: TADOQuery;
    qTareasIDTAREA: TAutoIncField;
    qTareasPRIORIDAD: TIntegerField;
    qTareasFECHAREGISTRO: TDateTimeField;
    qTareasFECHALIMITE: TDateTimeField;
    qTareasIDRESPONSABLE: TIntegerField;
    dsTareas: TDataSource;
    qBusTareas: TADOQuery;
    dsBusTareas: TDataSource;
    dsResponsables2: TDataSource;
    qBusResponsables: TADOQuery;
    qBusResponsablesIDRESPONSABLE: TAutoIncField;
    qBusResponsablesNOMBRE: TStringField;
    procedure qTareasNewRecord(DataSet: TDataSet);
    procedure qTareasBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatos: TdmDatos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses vcl.forms,windows;

procedure TdmDatos.qTareasBeforePost(DataSet: TDataSet);
begin
    if DataSet.FieldByName('IDRESPONSABLE').AsInteger = 0 then
    begin
        application.MessageBox('Registre por favor un responsable de la tarea','Responsable inválido',mb_ok);
        abort;
    end;
end;

procedure TdmDatos.qTareasNewRecord(DataSet: TDataSet);
begin
    DataSet.FieldByName('FECHAREGISTRO').AsDateTime :=  NOW;
    DataSet.FieldByName('FECHALIMITE').AsDateTime :=  NOW;
end;

end.
