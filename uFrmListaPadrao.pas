unit uFrmListaPadrao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.Messaging,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  Data.Bind.GenData, FMX.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.TabControl, ufrmTeste, FMX.MultiView, FMX.Platform;

type
  TfrmListaPadrao = class(TForm)
    lytBase: TLayout;
    lvLista: TListView;
    btnAdd: TRoundRect;
    tbMenu: TToolBar;
    btnMenu: TButton;
    btnExtras: TButton;
    mvFunc: TMultiView;
    ilPadrao: TImageList;
    lytLista: TLayout;
    Glyph1: TGlyph;
    lblJanela: TLabel;

    procedure lvListaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnAddClick(Sender: TObject);
    procedure mvFuncShown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mvFuncStartShowing(Sender: TObject);
  private
    { Private declarations }
    procedure resizeMV;
    procedure DoOrientationChanged(const Sender: TObject; const M: TMessage);
  public
    { Public declarations }
  end;

var
  frmListaPadrao: TfrmListaPadrao;

implementation

{$R *.fmx}
{ TfrmListaPadrao }

procedure TfrmListaPadrao.btnAddClick(Sender: TObject);
begin
  if not mvFunc.IsShowed then
    mvFunc.ShowMaster;
end;

procedure TfrmListaPadrao.DoOrientationChanged(const Sender: TObject;
  const M: TMessage);
var
  screenService: IFMXScreenService;
begin

  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    screenService) then
  begin
    resizeMV;
  end;
end;

procedure TfrmListaPadrao.FormCreate(Sender: TObject);
begin

  mvFunc.HideMaster;

  resizeMV;
  TMessageManager.DefaultManager.SubscribeToMessage(TOrientationChangedMessage,
    DoOrientationChanged);

end;

procedure TfrmListaPadrao.FormDestroy(Sender: TObject);
begin
  TMessageManager.DefaultManager.Unsubscribe(TOrientationChangedMessage,
    DoOrientationChanged);
end;

procedure TfrmListaPadrao.lvListaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if not mvFunc.IsShowed then
    mvFunc.ShowMaster;
end;

procedure TfrmListaPadrao.mvFuncShown(Sender: TObject);
begin

  lytLista.Margins.Left := 5;

end;

procedure TfrmListaPadrao.mvFuncStartShowing(Sender: TObject);
begin
  // resizeMV;
end;

procedure TfrmListaPadrao.resizeMV;
begin

{$IF DEFINED (MSWINDOWS)}
  mvFunc.Width := 380;
  mvFunc.Mode := TMultiViewMode.Panel;

{$ENDIF}
  Application.ProcessMessages;
  if (Screen.Size.Width < 700) then
  begin

    mvFunc.Width := Screen.Size.Width;

  end
  else
    mvFunc.Width := 400;

  Application.ProcessMessages;
end;

end.
