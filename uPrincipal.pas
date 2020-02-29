unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxPC;

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    A1: TMenuItem;
    C1: TMenuItem;
    R1: TMenuItem;
    T1: TMenuItem;
    Paginador: TcxTabControl;
    V1: TMenuItem;
    procedure R1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreaVentana(Ventana: String);
    procedure EliminaVentana(Ventana: String);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uResponsables, uTareas, uVisorTareas;

procedure TfrmPrincipal.CreaVentana(Ventana: String);
begin
    Paginador.Tabs.Add(Ventana);
    If Paginador.Tabs.IndexOf(Ventana) <> -1 then
        Paginador.TabIndex := Paginador.Tabs.IndexOf(ActiveMDIChild.Caption);
end;

procedure TfrmPrincipal.EliminaVentana(Ventana: String);
begin
    If Paginador.Tabs.IndexOf(Ventana) <> -1 then
        Paginador.Tabs.Delete(Paginador.Tabs.IndexOf(Ventana));
end;

procedure TfrmPrincipal.R1Click(Sender: TObject);
begin
    if not Assigned(frmResponsables) then
    begin
        frmResponsables :=  TfrmResponsables.Create(self);
        CreaVentana(frmResponsables.Caption);
    end;
end;

procedure TfrmPrincipal.T1Click(Sender: TObject);
begin
    if not Assigned(frmTareas) then
    begin
        frmTareas :=  TfrmTareas.Create(self);
        CreaVentana(frmTareas.Caption);
    end;
end;

procedure TfrmPrincipal.V1Click(Sender: TObject);
begin
    if not Assigned(frmVisorTareas) then
    begin
        frmVisorTareas :=  TfrmVisorTareas.Create(self);
        CreaVentana(frmVisorTareas.Caption);
    end;
end;

end.
