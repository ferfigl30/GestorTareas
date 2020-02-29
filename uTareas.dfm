object frmTareas: TfrmTareas
  Left = 0
  Top = 0
  Caption = 'Tareas'
  ClientHeight = 478
  ClientWidth = 777
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbAcciones: TcxGroupBox
    Left = 0
    Top = 373
    Align = alBottom
    Caption = 'Acciones'
    PanelStyle.Active = True
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    ExplicitLeft = 40
    ExplicitTop = 128
    ExplicitWidth = 771
    Height = 105
    Width = 777
    object btnProcesar: TcxButton
      Left = 176
      Top = 24
      Width = 89
      Height = 65
      Action = Procesar
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnAgregar: TcxButton
      Left = 81
      Top = 24
      Width = 89
      Height = 65
      Action = Agregar
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object gbDatos: TcxGroupBox
    Left = 0
    Top = 0
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
    ExplicitTop = 48
    ExplicitWidth = 771
    Height = 373
    Width = 777
    object cxLabel1: TcxLabel
      Left = 40
      Top = 40
      Caption = 'Prioridad:'
    end
    object cxLabel2: TcxLabel
      Left = 40
      Top = 76
      Caption = 'Fecha Registro:'
    end
    object cxLabel3: TcxLabel
      Left = 40
      Top = 109
      Caption = 'Fecha L'#237'mite:'
    end
    object cxLabel4: TcxLabel
      Left = 40
      Top = 145
      Caption = 'Responsable:'
    end
    object txtPrioridad: TcxDBTextEdit
      Left = 179
      Top = 36
      DataBinding.DataField = 'PRIORIDAD'
      DataBinding.DataSource = dmDatos.dsTareas
      TabOrder = 0
      OnKeyPress = txtPrioridadKeyPress
      Width = 121
    end
    object txtFechaRegistro: TcxDBDateEdit
      Left = 179
      Top = 72
      DataBinding.DataField = 'FECHAREGISTRO'
      DataBinding.DataSource = dmDatos.dsTareas
      Enabled = False
      TabOrder = 1
      Width = 174
    end
    object txtFechaLimite: TcxDBDateEdit
      Left = 179
      Top = 108
      DataBinding.DataField = 'FECHALIMITE'
      DataBinding.DataSource = dmDatos.dsTareas
      TabOrder = 2
      OnKeyPress = txtFechaLimiteKeyPress
      Width = 174
    end
    object cmbResponsable: TcxDBLookupComboBox
      Left = 179
      Top = 144
      DataBinding.DataField = 'IDRESPONSABLE'
      DataBinding.DataSource = dmDatos.dsTareas
      Properties.KeyFieldNames = 'IDRESPONSABLE'
      Properties.ListColumns = <
        item
          FieldName = 'NOMBRE'
        end>
      Properties.ListSource = dmDatos.dsResponsables
      TabOrder = 3
      OnKeyPress = cmbResponsableKeyPress
      Width = 278
    end
  end
  object alBD: TActionList
    Left = 544
    Top = 48
    object Agregar: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Agregar'
      Hint = 'Insert'
      ImageIndex = 4
      OnExecute = AgregarExecute
      OnUpdate = AgregarUpdate
      DataSource = dmDatos.dsTareas
    end
    object Procesar: TDataSetPost
      Category = 'Dataset'
      Caption = '&Procesar'
      Hint = 'Post'
      ImageIndex = 7
      OnUpdate = ProcesarUpdate
      DataSource = dmDatos.dsTareas
    end
  end
end
