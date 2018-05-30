object dmProdutos: TdmProdutos
  OldCreateOrder = False
  Height = 150
  Width = 215
  object qryProd: TFDQuery
    CachedUpdates = True
    Connection = dmConexao.con
    SQL.Strings = (
      
        'SELECT P.ID, P.NOME, P.VALOR, P.CUSTO, P.ESTOQUE, P.ESTMIN, P.ES' +
        'TMAX, P.IDCAT, P.OBS, P.FOTO, P.EAN,'
      'C.NOME AS '#39'CATEGORIA'#39' '
      'FROM PRODUTOS P'
      'LEFT JOIN CATPRODUTOS C ON P.IDCAT = C.ID'
      'ORDER BY P.NOME')
    Left = 16
    Top = 32
    object qryProdId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 32767
    end
    object qryProdValor: TFloatField
      FieldName = 'Valor'
      Origin = 'Valor'
    end
    object qryProdCusto: TFloatField
      FieldName = 'Custo'
      Origin = 'Custo'
    end
    object qryProdEstoque: TIntegerField
      FieldName = 'Estoque'
      Origin = 'Estoque'
    end
    object qryProdEstMin: TIntegerField
      FieldName = 'EstMin'
      Origin = 'EstMin'
    end
    object qryProdEstMax: TIntegerField
      FieldName = 'EstMax'
      Origin = 'EstMax'
    end
    object qryProdIdCat: TIntegerField
      FieldName = 'IdCat'
      Origin = 'IdCat'
    end
    object qryProdObs: TStringField
      FieldName = 'Obs'
      Origin = 'Obs'
      Size = 32767
    end
    object qryProdFoto: TBlobField
      FieldName = 'Foto'
      Origin = 'Foto'
    end
    object qryProdEAN: TStringField
      FieldName = 'EAN'
      Origin = 'EAN'
      Size = 32767
    end
    object qryProdCATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CATEGORIA'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object qryCat: TFDQuery
    Active = True
    Connection = dmConexao.con
    SQL.Strings = (
      'SELECT * FROM CATPRODUTOS'
      'ORDER BY NOME')
    Left = 96
    Top = 40
    object qryCatId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCatNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 32767
    end
  end
end
