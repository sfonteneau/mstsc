unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TFormmstsc }

  TFormmstsc = class(TForm)
    Aide: TButton;
    Connexion: TButton;
    ImageMS: TImage;
    serverandport: TLabeledEdit;
    procedure ConnexionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Formmstsc: TFormmstsc;
  server: string;
  port: string;
  ListServerAndPort: TStringList;

implementation

{$R *.lfm}

{ TFormmstsc }

procedure TFormmstsc.FormCreate(Sender: TObject);
begin

end;

procedure TFormmstsc.ConnexionClick(Sender: TObject);
begin
  ListServerAndPort := TStringList.Create;
  ListServerAndPort.Delimiter := ':';
  ListServerAndPort.DelimitedText := serverandport.Text;
  server:= ListServerAndPort[0] ;
  if int(ListServerAndPort.Count) > 1 then
      port:= ListServerAndPort[1]
  else
      port:= '3389';
  ExecuteProcess('/usr/bin/xfreerdp',['/v:' + Server ,'/port:' + port ,'/sec:rdp','&']);
end;

end.

