unit uVisorTareas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxRadioGroup, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxDBLookupComboBox;

type
  TfrmVisorTareas = class(TForm)
    gbParametros: TcxGroupBox;
    gbDatos: TcxGroupBox;
    gTareasDBTableView1: TcxGridDBTableView;
    gTareasLevel1: TcxGridLevel;
    gTareas: TcxGrid;
    rgParametros: TcxRadioGroup;
    btnBuscar: TcxButton;
    lblFecha: TcxLabel;
    deFecha: TcxDateEdit;
    gTareasDBTableView1IDTAREA: TcxGridDBColumn;
    gTareasDBTableView1PRIORIDAD: TcxGridDBColumn;
    gTareasDBTableView1FECHAREGISTRO: TcxGridDBColumn;
    gTareasDBTableView1FECHALIMITE: TcxGridDBColumn;
    gTareasDBTableView1IDRESPONSABLE: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisorTareas: TfrmVisorTareas;

implementation

{$R *.dfm}

uses udmDatos, uPrincipal;

procedure TfrmVisorTareas.btnBuscarClick(Sender: TObject);
Var
    fecha : string;
begin
    if rgParametros.ItemIndex=-1 then
    begin
        application.MessageBox('Por favor, escoja un parámetro para realizar la búsqueda de tareas','Parámetro inválido',mb_ok);
    end
    else
    begin
        dmDatos.qBusTareas.Close;
        fecha :=  formatdatetime('yyyymmdd',VarToDateTime(deFecha.EditingValue));
        if rgParametros.ItemIndex = 0 then//Fecha de Registro
        begin
            dmDatos.qBusTareas.SQL.Text :=  'SELECT * FROM TAREAS '+
                                            'WHERE CONVERT(VARCHAR(10),FECHAREGISTRO,112) = '+
                                            quotedStr(fecha);
            //dmDatos.qBusTareas.Parameters.ParamByName('FECHAREGISTRO').Value  :=  quotedStr(fecha);
            dmDatos.qBusTareas.Open;
        end;
        if rgParametros.ItemIndex = 1 then//Fecha Límite
        begin
            dmDatos.qBusTareas.SQL.Text :=  'SELECT * FROM TAREAS '+
                                            'WHERE CONVERT(VARCHAR(10),FECHALIMITE,112) = '+
                                            ':FECHALIMITE';
            dmDatos.qBusTareas.Parameters.ParamByName('FECHALIMITE').Value  :=  quotedStr(fecha);
            dmDatos.qBusTareas.Open;
        end;
        if dmDatos.qBusTareas.RecordCount = 0 then
            application.MessageBox('No hay tareas con ese parámetro','Tareas',mb_ok);
    end;
end;

procedure TfrmVisorTareas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action  :=  CaFree;
end;

procedure TfrmVisorTareas.FormCreate(Sender: TObject);
begin
    dmDatos.qBusResponsables.Close;
    dmDatos.qBusResponsables.Open;
end;

procedure TfrmVisorTareas.FormDestroy(Sender: TObject);
begin
    frmPrincipal.EliminaVentana(frmVisorTareas.Caption);
    frmVisorTareas  :=  nil;
    dmDatos.qBusTareas.Close;
end;

end.
