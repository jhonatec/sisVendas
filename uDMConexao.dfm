object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object con: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\DB\Vendas.db3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    Connected = True
    LoginPrompt = False
    BeforeConnect = conBeforeConnect
    Left = 88
    Top = 56
  end
  object cursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 152
    Top = 32
  end
end
