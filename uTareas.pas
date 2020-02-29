unit uTareas;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxLabel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxDBEdit, cxTextEdit, Vcl.DBActns,
  System.Actions, Vcl.ActnList;

type
  TfrmTareas = class(TForm)
    gbAcciones: TcxGroupBox;
    gbDatos: TcxGroupBox;
    btnProcesar: TcxButton;
    btnAgregar: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    txtPrioridad: TcxDBTextEdit;
    txtFechaRegistro: TcxDBDateEdit;
    txtFechaLimite: TcxDBDateEdit;
    cmbResponsable: TcxDBLookupComboBox;
    alBD: TActionList;
    Agregar: TDataSetInsert;
    Procesar: TDataSetPost;
    procedure AgregarUpdate(Sender: TObject);
    procedure AgregarExecute(Sender: TObject);
    procedure ProcesarUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtPrioridadKeyPress(Sender: TObject; var Key: Char);
    procedure cmbResponsableKeyPress(Sender: TObject; var Key: Char);
    procedure txtFechaLimiteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTareas: TfrmTareas;

implementation

{$R *.dfm}

uses udmDatos,data.db, uPrincipal;

procedure TfrmTareas.AgregarExecute(Sender: TObject);
begin
    dmDatos.qTareas.Close;
    if dmDatos.qTareas.Active = false then
        dmDatos.qTareas.Active  :=  true;
    dmDatos.qTareas.Insert;
    txtPrioridad.SetFocus;
end;

procedure TfrmTareas.AgregarUpdate(Sender: TObject);
begin
    Agregar.Enabled  :=  dmDatos.qTareas.State  in [dsInActive,dsBrowse];
end;

procedure TfrmTareas.cmbResponsableKeyPress(Sender: TObject; var Key: Char);
begin
    if key  = #13 then
    begin
      key :=  #0;
      txtPrioridad.SetFocus;
    end;
end;

procedure TfrmTareas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action  :=  CaFree;
end;

procedure TfrmTareas.FormCreate(Sender: TObject);
begin
    dmDatos.qResponsables.Close;
    dmDatos.qResponsables.Open;
end;

procedure TfrmTareas.FormDestroy(Sender: TObject);
begin
    frmPrincipal.EliminaVentana(frmTareas.Caption);
    frmTareas :=  nil;
end;

procedure TfrmTareas.FormShow(Sender: TObject);
begin
    txtPrioridad.SetFocus;
end;

procedure TfrmTareas.ProcesarUpdate(Sender: TObject);
begin
    Procesar.Enabled  :=  dmDatos.qTareas.State in [dsInsert]
end;

procedure TfrmTareas.txtFechaLimiteKeyPress(Sender: TObject; var Key: Char);
begin
    if key  = #13 then
    begin
      key :=  #0;
      selectNext(ActiveControl,true,true);
    end;
end;

procedure TfrmTareas.txtPrioridadKeyPress(Sender: TObject; var Key: Char);
begin
    if key  = #13 then
    begin
      key :=  #0;
      txtFechaLimite.SetFocus;
    end;
end;

end.
