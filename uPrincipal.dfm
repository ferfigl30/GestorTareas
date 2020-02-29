object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Gestor de Proyectos'
  ClientHeight = 465
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnuPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Paginador: TcxTabControl
    Left = 0
    Top = 0
    Width = 758
    Height = 25
    Align = alTop
    TabOrder = 0
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 11
    LookAndFeel.SkinName = 'Blue'
    ExplicitLeft = -200
    ExplicitTop = 52
    ExplicitWidth = 958
    ClientRectBottom = 20
    ClientRectLeft = 2
    ClientRectRight = 753
    ClientRectTop = 2
  end
  object mnuPrincipal: TMainMenu
    Left = 208
    Top = 72
    object A1: TMenuItem
      Caption = 'Archivo'
      object C1: TMenuItem
        Caption = 'Catalogos'
        object R1: TMenuItem
          Caption = 'Responsables'
          OnClick = R1Click
        end
      end
      object T1: TMenuItem
        Caption = 'Tareas'
        OnClick = T1Click
      end
      object V1: TMenuItem
        Caption = 'Visor de Tareas'
        OnClick = V1Click
      end
    end
  end
end
