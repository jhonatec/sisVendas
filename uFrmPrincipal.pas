unit uFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Platform,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.MultiView, FMX.Layouts,
  System.ImageList, FMX.ImgList, FMX.ListBox, FMX.Ani,
  ufrmTeste, FMX.ScrollBox, FMX.Memo, uDMConexao, FMX.Edit, FMX.SearchBox,
  uFrmClientes, uFrmProdutos;

type
  TfrmPrincipal = class(TForm)
    mvMenu: TMultiView;
    lytPrincipal: TLayout;
    imgLista: TImageList;
    lbMenu: TListBox;
    lbiClientes: TListBoxItem;
    Memo1: TMemo;
    ToolBar1: TToolBar;
    btnMenu: TButton;
    Button1: TButton;
    lbiProdutos: TListBoxItem;
    StyleBook1: TStyleBook;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem3: TListBoxItem;
    procedure btnClientesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure lbiProdutosClick(Sender: TObject);
  private
    { Private declarations }
    FFormularioAtivo: TForm;
    procedure Log(s: string);
    procedure abreForm(TForm: TComponentClass);
  public
    { Public declarations }
    function HandleAppEvent(AAppEvent: TApplicationEvent;
      AContext: TObject): Boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  System.IOUtils;

{$R *.fmx}

procedure TfrmPrincipal.abreForm(TForm: TComponentClass);
var
  btnMenu, LayoutBase: TComponent;

begin

  if Assigned(FFormularioAtivo) then
  begin

    if FFormularioAtivo.ClassType = TForm then
    begin
      mvMenu.HideMaster;
      Exit;
    end
    else
    begin
      FFormularioAtivo.DisposeOf;
      FFormularioAtivo := nil;

    end;
  end;

  Application.CreateForm(TForm, FFormularioAtivo);
  LayoutBase := FFormularioAtivo.FindComponent('lytBase');
  btnMenu := FFormularioAtivo.FindComponent('btnMenu');

  if Assigned(LayoutBase) then
    lytPrincipal.AddObject(TLayout(LayoutBase));

  ToolBar1.Visible := false;

  if Assigned(btnMenu) then
    mvMenu.MasterButton := btnMenu as TControl;

  mvMenu.HideMaster;

end;

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin

  abreForm(TfrmClientes);

end;

procedure TfrmPrincipal.btnMenuClick(Sender: TObject);
begin
  mvMenu.ShowMaster;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  // mvMenu.HideMaster;

  dmConexao := TdmConexao.Create(nil);

end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  dmConexao.Free;
end;

function TfrmPrincipal.HandleAppEvent(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin

  (*
    FinishedLaunching, BecameActive, WillBecomeInactive,
    EnteredBackground, WillBecomeForeground, WillTerminate,
    LowMemory, TimeChange, OpenURL);
  *)
  if (DebugHook <> 0) then
    case AAppEvent of

      TApplicationEvent.FinishedLaunching:
        Log('Finished Launching');

      TApplicationEvent.BecameActive:
        Log('Became Active');

      TApplicationEvent.WillBecomeInactive:
        Log('Will Become Inactive');

      TApplicationEvent.EnteredBackground:
        Log('Entered Background');

      TApplicationEvent.WillBecomeForeground:
        Log('Will Become Foreground');

      TApplicationEvent.WillTerminate:
        Log('Will Terminate');

      TApplicationEvent.LowMemory:
        Log('Low Memory');

      TApplicationEvent.TimeChange:
        Log('Time Change');

      TApplicationEvent.OpenURL:
        Log('Open URL');

    end;

  Result := true;
end;

procedure TfrmPrincipal.lbiProdutosClick(Sender: TObject);
begin

  abreForm(TfrmProdutos);
end;

procedure TfrmPrincipal.Log(s: string);
begin
  Memo1.Lines.Add(TimeToStr(Now) + ': ' + s);
end;

end.
