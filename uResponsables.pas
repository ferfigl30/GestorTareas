unit uResponsables;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxTextEdit, cxDBEdit,
  cxLabel, Vcl.Menus, Vcl.StdCtrls, cxButtons, System.Actions, Vcl.ActnList,
  Vcl.DBActns;

type
  TfrmResponsables = class(TForm)
    gbAcciones: TcxGroupBox;
    gbDatos: TcxGroupBox;
    lblNombre: TcxLabel;
    txtNombre: TcxDBTextEdit;
    btnProcesar: TcxButton;
    alBD: TActionList;
    Agregar: TDataSetInsert;
    btnAgregar: TcxButton;
    Procesar: TDataSetPost;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure AgregarUpdate(Sender: TObject);
    procedure AgregarExecute(Sender: TObject);
    procedure ProcesarUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResponsables: TfrmResponsables;

implementation

{$R *.dfm}

uses uPrincipal, udmDatos,data.db;

procedure TfrmResponsables.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action  :=  CaFree;
end;

procedure TfrmResponsables.FormDestroy(Sender: TObject);
begin
    frmPrincipal.EliminaVentana(frmResponsables.Caption);
    dmDatos.qResponsables.Close;
    frmResponsables :=  nil;
end;

procedure TfrmResponsables.FormShow(Sender: TObject);
begin
    txtNombre.SetFocus;
end;

procedure TfrmResponsables.ProcesarUpdate(Sender: TObject);
begin
    Procesar.Enabled  :=  dmDatos.qResponsables.State in [dsInsert];
end;

procedure TfrmResponsables.AgregarExecute(Sender: TObject);
begin
    dmDatos.qResponsables.Close;
    if dmDatos.qResponsables.Active = false then
        dmDatos.qResponsables.Active  :=  true;
    dmDatos.qResponsables.Insert;
    txtNombre.SetFocus;
end;

procedure TfrmResponsables.AgregarUpdate(Sender: TObject);
begin
    Agregar.Enabled  :=  dmDatos.qResponsables.State  in [dsInActive,dsBrowse];
end;

procedure TfrmResponsables.btnProcesarClick(Sender: TObject);
begin
    dmDatos.qResponsables.Post;
    application.MessageBox('El ingreso del Responsable fue satisfactorio','Ingreso de Responsable satisfactorio',mb_ok);
end;

end.
