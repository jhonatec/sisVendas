unit uDMProdutos;

interface

uses
  System.SysUtils, System.Classes, uDMConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmProdutos = class(TDataModule)
    qryProd: TFDQuery;
    qryCat: TFDQuery;
    qryCatId: TIntegerField;
    qryCatNome: TStringField;
    qryProdId: TIntegerField;
    qryProdNome: TStringField;
    qryProdValor: TFloatField;
    qryProdCusto: TFloatField;
    qryProdEstoque: TIntegerField;
    qryProdEstMin: TIntegerField;
    qryProdEstMax: TIntegerField;
    qryProdIdCat: TIntegerField;
    qryProdObs: TStringField;
    qryProdFoto: TBlobField;
    qryProdEAN: TStringField;
    qryProdCATEGORIA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProdutos: TdmProdutos;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
