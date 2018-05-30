unit uFrmCaptura;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Platform,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Actions, FMX.ActnList,
  FMX.StdActns, FMX.MediaLibrary.Actions, System.ImageList, FMX.ImgList;

type
  TfrmCaptura = class(TForm)
    tbCaptura: TToolBar;
    imgFoto: TImage;
    btnAbortar: TButton;
    btnOk: TButton;
    btnLibrary: TButton;
    btnCamera: TButton;
    ActionList1: TActionList;
    btnCarregaWindows: TButton;
    actCam: TTakePhotoFromCameraAction;
    actLibrary: TTakePhotoFromLibraryAction;
    ilCaptura: TImageList;
    abrirDialog: TOpenDialog;
    btnClear: TButton;
    procedure actCamDidFinishTaking(Image: TBitmap);
    procedure FormCreate(Sender: TObject);
    procedure btnCarregaWindowsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregaFoto(img: TBitmap);

  end;

var
  frmCaptura: TfrmCaptura;

implementation

uses
  System.IOUtils, uFrmPrincipal;

{$R *.fmx}
{ TfrmCaptura }

procedure TfrmCaptura.actCamDidFinishTaking(Image: TBitmap);
begin

  carregaFoto(Image);

end;

procedure TfrmCaptura.btnCarregaWindowsClick(Sender: TObject);
var
  JPG: TBitmap;
  save: TBitmapCodecSaveParams;
  FileName: String;
begin

  if abrirDialog.Execute then
  begin
    Try
      JPG := TBitmap.Create();
      JPG.LoadFromFile(abrirDialog.FileName);
      imgFoto.Bitmap := Nil; // Coloca essa linha
      FileName := (ExtractFilePath(ParamStr(0)) + 'arquivoTemp.jpg');

      if FileExists(FileName) then
      begin
        DeleteFile(FileName);
      end;

      save.Quality := 50;

      JPG.SaveToFile(FileName, @save);

      if FileExists(FileName) then
      begin
        imgFoto.Bitmap.LoadFromFile(FileName);
      end
      else
        MessageDlg('Não foi possível carregar a imagem selecionada',
          TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      // Ou pode fazer assim
      // DBImage1.Picture.LoadFromFile(OpenDialog1.FileName);
    Finally
      FreeAndNil(JPG);
    end;
  end;

end;

procedure TfrmCaptura.btnClearClick(Sender: TObject);
var
  bit: TBitmap;
begin

  bit := TBitmap.Create;
  imgFoto.Bitmap := bit;

  FreeandNil(bit)

end;

procedure TfrmCaptura.Button1Click(Sender: TObject);
begin

  ShowMEssage('isEmpty: ' + BoolToStr(imgFoto.Bitmap.IsEmpty, true) + ' size ' +
    imgFoto.Bitmap.Size.Width.ToString + ' * ' +
    imgFoto.Bitmap.Size.Height.ToString);

end;

procedure TfrmCaptura.carregaFoto(img: TBitmap);
begin

  if Assigned(img) then
    imgFoto.Bitmap.Assign(img);

end;

procedure TfrmCaptura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  // frmCaptura := nil;
end;

procedure TfrmCaptura.FormCreate(Sender: TObject);
begin

{$IF DEFINED (MSWINDOWS)}
  btnCarregaWindows.Visible := true;

{$ENDIF}
end;

end.
