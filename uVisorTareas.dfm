object frmVisorTareas: TfrmVisorTareas
  Left = 0
  Top = 0
  Caption = 'Visor de Tareas'
  ClientHeight = 478
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gbParametros: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Parametros'
    PanelStyle.Active = True
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    ExplicitTop = -4
    Height = 153
    Width = 774
    object rgParametros: TcxRadioGroup
      Left = 24
      Top = 28
      Caption = 'Par'#225'metros'
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Fecha Registro'
        end
        item
          Caption = 'Fecha L'#237'mite'
        end>
      TabOrder = 0
      Height = 105
      Width = 345
    end
    object btnBuscar: TcxButton
      Left = 632
      Top = 39
      Width = 105
      Height = 73
      Caption = '&Buscar'
      TabOrder = 1
      OnClick = btnBuscarClick
    end
    object lblFecha: TcxLabel
      Left = 384
      Top = 40
      Caption = 'Fecha:'
    end
    object deFecha: TcxDateEdit
      Left = 451
      Top = 39
      TabOrder = 3
      Width = 175
    end
  end
  object gbDatos: TcxGroupBox
    Left = 0
    Top = 153
    Align = alClient
    Caption = 'Datos'
    PanelStyle.Active = True
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    ExplicitLeft = 112
    ExplicitTop = 176
    ExplicitWidth = 185
    ExplicitHeight = 105
    Height = 325
    Width = 774
    object gTareas: TcxGrid
      Left = 2
      Top = 2
      Width = 770
      Height = 321
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 1
      object gTareasDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dmDatos.dsBusTareas
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.NoDataToDisplayInfoText = 'No hay Tareas'
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object gTareasDBTableView1IDTAREA: TcxGridDBColumn
          Caption = 'Id'
          DataBinding.FieldName = 'IDTAREA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Width = 46
        end
        object gTareasDBTableView1PRIORIDAD: TcxGridDBColumn
          Caption = 'Prioridad'
          DataBinding.FieldName = 'PRIORIDAD'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Width = 104
        end
        object gTareasDBTableView1FECHAREGISTRO: TcxGridDBColumn
          Caption = 'Fecha Registro'
          DataBinding.FieldName = 'FECHAREGISTRO'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Width = 149
        end
        object gTareasDBTableView1FECHALIMITE: TcxGridDBColumn
          Caption = 'Fecha L'#237'mite'
          DataBinding.FieldName = 'FECHALIMITE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Width = 139
        end
        object gTareasDBTableView1IDRESPONSABLE: TcxGridDBColumn
          Caption = 'Respansable'
          DataBinding.FieldName = 'IDRESPONSABLE'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'IDRESPONSABLE'
          Properties.ListColumns = <
            item
              FieldName = 'NOMBRE'
            end>
          Properties.ListSource = dmDatos.dsResponsables2
          Properties.ReadOnly = True
          Width = 239
        end
      end
      object gTareasLevel1: TcxGridLevel
        GridView = gTareasDBTableView1
      end
    end
  end
end
