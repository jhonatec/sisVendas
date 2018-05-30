unit uFrmClientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.DB,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmListaPadrao, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.ImageList, FMX.ImgList, FMX.MultiView,
  FMX.Controls.Presentation, FMX.Objects, FMX.ListView, FMX.Layouts,
  uFRAMEcadCli, uDMClientes, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  Data.Bind.Components, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.DBScope, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.DateTimeCtrls,
  FMX.ListBox, FMX.TabControl, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.PhoneDialer.Actions, uFrmCaptura;

type
  TfrmClientes = class(TfrmListaPadrao)
    source: TBindSourceDB;
    bList: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ilCliente: TImageList;
    tcFunc: TTabControl;
    tbDetalhe: TTabItem;
    lbDetalhes: TListBox;
    lbiNome: TListBoxItem;
    lbiNasc: TListBoxItem;
    lbiDoc: TListBoxItem;
    lbiFone1: TListBoxItem;
    lbiFone2: TListBoxItem;
    lbiLimite: TListBoxItem;
    ListBoxHeader1: TListBoxHeader;
    Label1: TLabel;
    btnBack: TButton;
    tbCad: TTabItem;
    tbCadastro: TToolBar;
    btnVoltar: TButton;
    btnSalvar: TButton;
    tcCadastro: TTabControl;
    tabBasic: TTabItem;
    vsBasic: TVertScrollBox;
    gridBasic: TGridPanelLayout;
    dtNasc: TDateEdit;
    edtCPF_CNPJ: TEdit;
    edtEndereco: TMemo;
    edtFone1: TEdit;
    edtFone2: TEdit;
    edtNome: TEdit;
    edtRG_IE: TEdit;
    imgCPF: TGlyph;
    imgData: TGlyph;
    imgFone: TGlyph;
    imgLocation: TGlyph;
    imgNome: TGlyph;
    lblNasc: TLabel;
    lblSexo: TLabel;
    gridSexo: TGridLayout;
    lblMasc: TLabel;
    swSexo: TSwitch;
    lblFem: TLabel;
    lblEndereco: TLabel;
    tabExtras: TTabItem;
    vsExtras: TVertScrollBox;
    gridExtras: TGridPanelLayout;
    imgEmail: TGlyph;
    edtEmail: TEdit;
    imgLimiteCompras: TGlyph;
    edtLimite: TEdit;
    picFoto1: TImage;
    lblFotoDoc: TLabel;
    picFoto2: TImage;
    imgObs: TGlyph;
    edtObs: TMemo;
    lblObs: TLabel;
    btnFoto1: TButton;
    btnFoto2: TButton;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    Actions: TActionList;
    actLigar: TPhoneCallAction;
    tbVisualizar: TToolBar;
    btnEditar: TButton;
    lbiRG: TListBoxItem;
    lbiEndereco: TListBoxItem;
    lbiObs: TListBoxItem;
    lbiEmail: TListBoxItem;
    ListBoxItem1: TListBoxItem;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldBitmap2: TLinkPropertyToField;
    procedure frameCadCliente1btnBackClick(Sender: TObject);
    procedure frameCadCliente1btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure lblMascClick(Sender: TObject);
    procedure lblFemClick(Sender: TObject);
    procedure lvListaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnAddClick(Sender: TObject);
    procedure lbiFone1Click(Sender: TObject);
    procedure lbiFone2Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnFoto1Click(Sender: TObject);
    procedure btnFoto2Click(Sender: TObject);
  private
    { Private declarations }
    procedure editar;
    procedure cadastrar;
    procedure visualizar;
    procedure ligar(item: TListBoxItem);
    procedure mudarFoto(image: TImage; nomeField: string);
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.fmx}

procedure TfrmClientes.btnAddClick(Sender: TObject);
begin
  inherited;

  cadastrar;
end;

procedure TfrmClientes.btnBackClick(Sender: TObject);
begin
  inherited;

  mvFunc.HideMaster;

end;

procedure TfrmClientes.btnEditarClick(Sender: TObject);
begin
  inherited;
  editar;
end;

procedure TfrmClientes.btnFoto1Click(Sender: TObject);
begin
  inherited;
  mudarFoto(picFoto1, 'Foto1');
end;

procedure TfrmClientes.btnFoto2Click(Sender: TObject);
begin
  inherited;
  mudarFoto(picFoto2, 'Foto2');
end;

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if (edtNome.Text.Length < 3) then
  begin

    ShowMessage('Digite um nome válido');
    tcCadastro.ActiveTab := tabBasic;
    edtNome.SetFocus;
    Exit;

  end;

  mvFunc.HideMaster;

  with dmClientes.qry do
  begin

    ApplyUpdates(2);
    CommitUpdates;

  end;

  visualizar;

end;

procedure TfrmClientes.btnVoltarClick(Sender: TObject);
begin
  inherited;

  mvFunc.HideMaster;

  with dmClientes.qry do
  begin

    CancelUpdates;

  end;

  if (mvFunc.Mode = TMultiViewMode.Panel) then
  begin

    visualizar;

  end;

end;

procedure TfrmClientes.cadastrar;
begin

  dmClientes.qry.Append;
  editar;

end;

procedure TfrmClientes.editar;
begin

  tcFunc.ActiveTab := tbCad;
  tcCadastro.ActiveTab := tabBasic;

end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  dmClientes := TdmClientes.Create(Self);
  dmClientes.qry.Open();
  btnEditar.Visible := false;
  tcFunc.ActiveTab := tbDetalhe;

end;

procedure TfrmClientes.frameCadCliente1btnBackClick(Sender: TObject);
begin
  inherited;
  mvFunc.HideMaster;
end;

procedure TfrmClientes.frameCadCliente1btnVoltarClick(Sender: TObject);
begin
  inherited;

  mvFunc.HideMaster;

  // cancelar updates
end;

procedure TfrmClientes.lbiFone1Click(Sender: TObject);
begin
  inherited;

  ligar(lbiFone1);

end;

procedure TfrmClientes.lbiFone2Click(Sender: TObject);
begin
  inherited;
  ligar(lbiFone2);
end;

procedure TfrmClientes.lblFemClick(Sender: TObject);
begin
  inherited;
  swSexo.IsChecked := true;
end;

procedure TfrmClientes.lblMascClick(Sender: TObject);
begin
  inherited;

  swSexo.IsChecked := false;
end;

procedure TfrmClientes.ligar(item: TListBoxItem);
begin

  if Length(item.ItemData.Text) > 4 then
  begin
    actLigar.TelephoneNumber := item.ItemData.Detail;
    actLigar.ExecuteTarget(Self);
  end;
end;

procedure TfrmClientes.lvListaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  visualizar;
  inherited;

end;

procedure TfrmClientes.mudarFoto(image: TImage; nomeField: String);
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
          dmClientes.qry.Edit;
          image.Bitmap.Assign(frm.imgFoto.Bitmap);

          if (image.Bitmap.IsEmpty) then
          begin
            dmClientes.qry.FieldByName(nomeField).Clear;

          end
          else
          begin
            bf := dmClientes.qry.FieldByName(nomeField) as TBlobField;
            ms := TMemoryStream.Create;
            image.Bitmap.SaveToStream(ms);

            bf.LoadFromStream(ms);

            dmClientes.qry.FieldByName(nomeField).Assign(bf);

          end;
        end;

        // frm.DisposeOf;
      end);
  finally

  end;

end;

procedure TfrmClientes.visualizar;
begin

  tcFunc.ActiveTab := tbDetalhe;

  btnEditar.Visible := true;

  with dmClientes.qry do
  begin
    lbiNome.ItemData.Text := FieldByName('Nome').AsString;
    lbiNasc.ItemData.Text := DateToStr(FieldByName('DtNasc').AsDateTime);
    lbiDoc.ItemData.Text := FieldByName('CPF_CNPJ').AsString;
    lbiFone1.ItemData.Text := FieldByName('Fone1').AsString;
    lbiFone2.ItemData.Text := FieldByName('Fone2').AsString;
    lbiLimite.ItemData.Text := FieldByName('LimiteCompras').AsString;
    lbiRG.ItemData.Text := FieldByName('RG').AsString;
    lbiEndereco.ItemData.Text := FieldByName('Endereco').AsString;
    lbiObs.ItemData.Text := FieldByName('Obs').AsString;
    lbiEmail.ItemData.Text := FieldByName('Email').AsString;
    // lbiLimite.ItemData.Detail := FieldByName('LimiteCompras').AsString;

  end;

end;

end.
