unit ufrmTeste;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.MediaLibrary,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  System.ImageList, FMX.ImgList, FMX.ScrollBox, FMX.Memo, FMX.DateTimeCtrls,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, System.Math.Vectors,
  FMX.Controls3D, FMX.Layers3D, FMX.Media, FMX.Platform, System.Messaging,
  FMX.Objects, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions;

type
  TForm1 = class(TForm)
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{ TForm1 }

procedure TForm1.Button4Click(Sender: TObject);
begin

end;

(* var
  Service: IFMXCameraService;
  Params: TParamsPhotoQuery;
  begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXCameraService,
  Service) then
  begin
  Params.Editable := True;
  // Specifies whether to save a picture to device Photo Library
  Params.NeedSaveToAlbum := False;
  Params.RequiredResolution := TSize.Create(340, 340);
  Params.OnDidFinishTaking := DoDidFinish;
  Service.TakePhoto(Button3, Params);
  end
  else
  ShowMessage('This device does not support the camera service');
  end;

*)

end.
