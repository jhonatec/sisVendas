unit uDMClientes;

interface

uses
  System.SysUtils, System.Classes, uDMConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmClientes = class(TDataModule)
    qry: TFDQuery;
    qryId: TIntegerField;
    qryNome: TStringField;
    qryDtNasc: TDateField;
    qryCPF_CNPJ: TStringField;
    qryFone1: TStringField;
    qryFone2: TStringField;
    qryEmail: TStringField;
    qryRG: TStringField;
    qryAtivo: TBooleanField;
    qryLimiteCompras: TFloatField;
    qryEndereco: TStringField;
    qryObs: TStringField;
    qrySexo: TBooleanField;
    qryFoto1: TBlobField;
    qryFoto2: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClientes: TdmClientes;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
