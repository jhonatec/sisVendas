unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client;

type
  TdmConexao = class(TDataModule)
    con: TFDConnection;
    cursor: TFDGUIxWaitCursor;
    procedure conBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses
  System.IOUtils;

procedure TdmConexao.conBeforeConnect(Sender: TObject);
begin

{$IF DEFINED (MSWINDOWS)}
  // con.Params.Values['Database'] := TPath.Combine(ExtractFilePath(ParamStr(0)),
  // 'Vendas.db3');

{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID) }
  con.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath,
    'database.db3');

{$ENDIF}
end;

end.
