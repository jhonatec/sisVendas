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
    sbEstoque: TSpinBox;
    numValor: TNumberBox;
    numCusto: TNumberBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sbEstMin: TSpinBox;
    sbEstMax: TSpinBox;
    gridEstoque: TGridPanelLayout;
    lblEstoque: TLabel;
    lblValor: TLabel;
    lblCusto: TLabel;
    lblEAN: TLabel;
    lblCatgoria: TLabel;
    cbCategoria: TComboBox;
    btnAddCategoria: TButton;
    imCategoria: TGlyph;
    lblObs: TLabel;
    imObs: TGlyph;
    edtObs: TMemo;
    lblFoto: TLabel;
    btnAddFoto: TButton;
    picFotoCad: TImage;
    sourceCat: TBindSourceDB;
    sgCatProd: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    navigation: TBindNavigator;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkListControlToField1: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkPropertyToFieldBitmap2: TLinkPropertyToField;
    LinkControlToField8: TLinkControlToField;
    tbCategoria: TToolBar;
    btnVoltarCategoria: TButton;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure lvListaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAddCategoriaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAddFotoClick(Sender: TObject);
    procedure btnVoltarCategoriaClick(Sender: TObject);
  private
    { Private declarations }
    procedure visualizar;
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

procedure TfrmProdutos.btnAddFotoClick(Sender: TObject);
begin
  inherited;
  mudarFoto(picFotoCad, 'Foto');
end;

procedure TfrmProdutos.btnBackClick(Sender: TObject);
begin
  inherited;

  mvFunc.HideMaster;

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

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;

  dmProdutos := TdmProdutos.Create(Self);
  dmProdutos.qryProd.Open();
  dmProdutos.qryCat.Open();

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
