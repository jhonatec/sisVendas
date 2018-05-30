unit uFRAMEcadCli;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.ImgList, FMX.ScrollBox, FMX.Memo,
  FMX.Controls.Presentation, FMX.Edit, FMX.DateTimeCtrls, FMX.TabControl,
  System.ImageList, FMX.ListBox;

type
  TframeCadCliente = class(TFrame)
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
    ToolBar1: TToolBar;
    btnVoltar: TButton;
    btnSalvar: TButton;
    ilFrame: TImageList;
    tcFunc: TTabControl;
    tbCad: TTabItem;
    tbDetalhe: TTabItem;
    ListBox1: TListBox;
    ListBoxHeader1: TListBoxHeader;
    lbiNome: TListBoxItem;
    lbiNasc: TListBoxItem;
    lbiDoc: TListBoxItem;
    lbiFone1: TListBoxItem;
    lbiFone2: TListBoxItem;
    lbiCompras: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    Label1: TLabel;
    btnBack: TButton;
    procedure FrameClick(Sender: TObject);
    procedure lblMascClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TframeCadCliente.FrameClick(Sender: TObject);
begin
  tcFunc.ActiveTab := tbDetalhe;
end;

procedure TframeCadCliente.lblMascClick(Sender: TObject);
begin
  swSexo.IsChecked := false;
end;

end.
