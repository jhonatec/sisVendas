unit uFrmProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.DB,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmListaPadrao, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.ImageList, FMX.ImgList,
  FMX.Objects, FMX.ListView, FMX.Controls.Presentation,
  FMX.MultiView, FMX.Layouts, FMX.TabControl, FMX.ListBox, uDMProdutos,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Edit,
  FMX.NumberBox, FMX.EditBox, FMX.SpinBox, FMX.ScrollBox, FMX.Memo,
  FMX.Grid.Style, FMX.Bind.Grid, Data.Bind.Controls, FMX.Bind.Navigator,
  Data.Bind.Grid, FMX.Grid, uFrmCaptura;

type
  TfrmProdutos = class(TfrmListaPadrao)
    tcFunc: TTabControl;
    tabDetalhe: TTabItem;
    tabCad: TTabItem;
    tabCategoria: TTabItem;
    lbDetalhes: TListBox;
    lbiNome: TListBoxItem;
    lbiValor: TListBoxItem;
    lbiEAN: TListBoxItem;
    lbiFoto: TListBoxItem;
    lbiCusto: TListBoxItem;
    lbiEstoque: TListBoxItem;
    lbiEstMinMax: TListBoxItem;
    lbiCategoria: TListBoxItem;
    lbiObs: TListBoxItem;
    ListBoxItem1: TListBoxItem;
    tbVisualizar: TToolBar;
    btnEditar: TButton;
    ListBoxHeader1: TListBoxHeader;
    Label1: TLabel;
    btnBack: TButton;
    ilProdutos: TImageList;
    source: TBindSourceDB;
    list: TBindingsList;
    picFotoDetalhe: TImage;
    vsCad: TVertScrollBox;
    gridCadastro: TGridPanelLayout;
    imProduto: TGlyph;
    tbCadastro: TToolBar;
    btnVoltar: TButton;
    btnSalvar: TButton;
    edtNome: TEdit;
    imValor: TGlyph;
    imCusto: TGlyph;
    imEAN: TGlyph;
    edtEAN: TEdit;
    btnEAN: TButton;
    imEstoque: TGlyph;
    numValor: TNumberBox;
    numCusto: TNumberBox;
    sourceCat: TBindSourceDB;
    sgCatProd: TStringGrid;
    linkGridCat: TLinkGridToDataSource;
    navigation: TBindNavigator;
    LinkListControlToField1: TLinkListControlToField;
    tbCategoria: TToolBar;
    btnVoltarCategoria: TButton;
    Label5: TLabel;
    tcCadastro: TTabControl;
    tabCadBasic: TTabItem;
    tabCadExtra: TTabItem;
    procedure FormCreate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure lvListaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAddCategoriaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAddFotoClick(Sender: TObject);
    procedure btnVoltarCategoriaClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
    procedure visualizar;
    procedure editar;
    procedure cadastras;
    procedure mudarFoto(image: TImage; nomeField: String);
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.fmx}

procedure TfrmProdutos.btnAddCategoriaClick(Sender: TObject);
begin
  inherited;

  tcFunc.ActiveTab := tabCategoria;

end;

procedure TfrmProdutos.btnAddClick(Sender: TObject);
begin
  inherited;

  dmProdutos.qryProd.Append;
  tcFunc.ActiveTab := tabCad;

end;

procedure TfrmProdutos.btnAddFotoClick(Sender: TObject);
begin
  inherited;
 // mudarFoto(picFotoCad, 'Foto');
end;

procedure TfrmProdutos.btnBackClick(Sender: TObject);
begin
  inherited;

  mvFunc.HideMaster;

end;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
begin
  inherited;

  editar;

end;

procedure TfrmProdutos.btnSalvarClick(Sender: TObject);
begin
  inherited;

  with dmProdutos.qryProd do
  begin

    ApplyUpdates(2);
    CommitUpdates;

    Refresh;

  end;

  visualizar;

end;

procedure TfrmProdutos.mudarFoto(image: TImage; nomeField: String);
var
  frm: TfrmCaptura;
  ms: TMemoryStream;
  bf: TBlobField;
begin

  frm := TfrmCaptura.Create(Self);

  frm.carregaFoto(image.Bitmap);
  try
    frm.ShowModal(
      procedure(ModalResult: TModalResult)
      begin
        if ModalResult = mrOk then
        begin
          dmProdutos.qryProd.Edit;
          image.Bitmap.Assign(frm.imgFoto.Bitmap);

          if (image.Bitmap.IsEmpty) then
          begin
            dmProdutos.qryProd.FieldByName(nomeField).Clear;

          end
          else
          begin
            bf := dmProdutos.qryProd.FieldByName(nomeField) as TBlobField;
            ms := TMemoryStream.Create;
            image.Bitmap.SaveToStream(ms);

            bf.LoadFromStream(ms);

            dmProdutos.qryProd.FieldByName(nomeField).Assign(bf);

          end;
        end;

        // frm.DisposeOf;
      end);
  finally

  end;

end;

procedure TfrmProdutos.btnVoltarCategoriaClick(Sender: TObject);
begin
  inherited;

  tcFunc.ActiveTab := tabCad;

end;

procedure TfrmProdutos.btnVoltarClick(Sender: TObject);
begin
  inherited;

  mvFunc.HideMaster;
  dmProdutos.qryProd.CancelUpdates;

end;

procedure TfrmProdutos.cadastras;
begin

end;

procedure TfrmProdutos.editar;
begin

  with dmProdutos.qryProd do
  begin
    edtNome.Text := FieldByName('Nome').AsString;
    edtEAN.Text := FieldByName('EAN').AsString;
    //edtObs.Text := FieldByName('Obs').AsString;

  end;
  tcFunc.ActiveTab := tabCad;
  dmProdutos.qryProd.Edit;

end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;

  tcFunc.ActiveTab := tabDetalhe;

  dmProdutos := TdmProdutos.Create(Self);
  dmProdutos.qryProd.Open();
  // dmProdutos.qryCat.Open();

end;

procedure TfrmProdutos.lvListaItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  inherited;
  visualizar;
end;

procedure TfrmProdutos.visualizar;
begin

  tcFunc.ActiveTab := tabDetalhe;

  btnEditar.Visible := true;

  with dmProdutos.qryProd do
  begin
    lbiNome.ItemData.Text := FieldByName('Nome').AsString;
    lbiValor.ItemData.Text := FieldByName('Valor').AsFloat.ToString;
    lbiCusto.ItemData.Text := FieldByName('Custo').AsFloat.ToString;
    lbiEstoque.ItemData.Text := FieldByName('Estoque').AsString;
    lbiEstMinMax.ItemData.Text := FieldByName('EstMin').AsString + '/' +
      FieldByName('EstMax').AsString;
    lbiEAN.ItemData.Text := FieldByName('EAN').AsString;
    lbiCategoria.ItemData.Text := FieldByName('Categoria').AsString;

  end;
end;

end.
