object dmClientes: TdmClientes
  OldCreateOrder = False
  Height = 150
  Width = 215
  object qry: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = dmConexao.con
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'ORDER BY NOME')
    Left = 48
    Top = 64
    object qryId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 32767
    end
    object qryDtNasc: TDateField
      FieldName = 'DtNasc'
      Origin = 'DtNasc'
    end
    object qryCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Size = 32767
    end
    object qryFone1: TStringField
      FieldName = 'Fone1'
      Origin = 'Fone1'
      Size = 32767
    end
    object qryFone2: TStringField
      FieldName = 'Fone2'
      Origin = 'Fone2'
      Size = 32767
    end
    object qryEmail: TStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 32767
    end
    object qryRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
      Size = 32767
    end
    object qryAtivo: TBooleanField
      FieldName = 'Ativo'
      Origin = 'Ativo'
    end
    object qryLimiteCompras: TFloatField
      FieldName = 'LimiteCompras'
      Origin = 'LimiteCompras'
    end
    object qryEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'Endereco'
      Size = 32767
    end
    object qryObs: TStringField
      FieldName = 'Obs'
      Origin = 'Obs'
      Size = 32767
    end
    object qrySexo: TBooleanField
      FieldName = 'Sexo'
      Origin = 'Sexo'
    end
    object qryFoto1: TBlobField
      FieldName = 'Foto1'
      Origin = 'Foto1'
    end
    object qryFoto2: TBlobField
      FieldName = 'Foto2'
      Origin = 'Foto2'
    end
  end
end
