object dmDatos: TdmDatos
  OldCreateOrder = False
  Height = 362
  Width = 536
  object conPrincipal: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=gr2013!;Persist Security Info=True;' +
      'User ID=sa;Initial Catalog=GESPRO;Data Source=SISTEMAS1\DESARROL' +
      'LO2'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 160
    Top = 64
  end
  object qResponsables: TADOQuery
    Connection = conPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from RESPONSABLES')
    Left = 240
    Top = 128
    object qResponsablesIDRESPONSABLE: TAutoIncField
      FieldName = 'IDRESPONSABLE'
      ReadOnly = True
    end
    object qResponsablesNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 300
    end
  end
  object dsResponsables: TDataSource
    DataSet = qResponsables
    Left = 328
    Top = 120
  end
  object qTareas: TADOQuery
    Connection = conPrincipal
    CursorType = ctStatic
    BeforePost = qTareasBeforePost
    OnNewRecord = qTareasNewRecord
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM TAREAS')
    Left = 208
    Top = 200
    object qTareasIDTAREA: TAutoIncField
      FieldName = 'IDTAREA'
      ReadOnly = True
    end
    object qTareasPRIORIDAD: TIntegerField
      FieldName = 'PRIORIDAD'
    end
    object qTareasFECHAREGISTRO: TDateTimeField
      FieldName = 'FECHAREGISTRO'
    end
    object qTareasFECHALIMITE: TDateTimeField
      FieldName = 'FECHALIMITE'
    end
    object qTareasIDRESPONSABLE: TIntegerField
      FieldName = 'IDRESPONSABLE'
    end
  end
  object dsTareas: TDataSource
    DataSet = qTareas
    Left = 272
    Top = 208
  end
  object qBusTareas: TADOQuery
    Connection = conPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 112
    Top = 232
  end
  object dsBusTareas: TDataSource
    DataSet = qBusTareas
    Left = 200
    Top = 256
  end
  object dsResponsables2: TDataSource
    DataSet = qBusResponsables
    Left = 472
    Top = 272
  end
  object qBusResponsables: TADOQuery
    Connection = conPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM RESPONSABLES')
    Left = 400
    Top = 240
    object qBusResponsablesIDRESPONSABLE: TAutoIncField
      FieldName = 'IDRESPONSABLE'
      ReadOnly = True
    end
    object qBusResponsablesNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 300
    end
  end
end
