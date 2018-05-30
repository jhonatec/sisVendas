program SisVendas;



uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDMConexao in 'uDMConexao.pas' {dmConexao: TDataModule},
  uFrmListaPadrao in 'uFrmListaPadrao.pas' {frmListaPadrao},
  uDMClientes in 'uDMClientes.pas' {dmClientes: TDataModule},
  ufrmTeste in 'ufrmTeste.pas' {Form1},
  uFrmCaptura in 'uFrmCaptura.pas' {frmCaptura},
  uFrmClientes in 'uFrmClientes.pas' {frmClientes},
  uFrmProdutos in 'uFrmProdutos.pas' {frmProdutos},
  uDMProdutos in 'uDMProdutos.pas' {dmProdutos: TDataModule};

{$R *.res}

begin
  Application.Initialize;

  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
