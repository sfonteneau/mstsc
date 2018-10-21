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
    procedure serverandportChange(Sender: TObject);
    procedure serverandportKeyPress(Sender: TObject; var Key: char);
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

procedure TFormmstsc.serverandportChange(Sender: TObject);
begin
  ListServerAndPort := TStringList.Create;
  ListServerAndPort.Delimiter := ':';
  ListServerAndPort.DelimitedText := serverandport.Text;
  if int(ListServerAndPort.Count) > 0
  then
    server:= ListServerAndPort[0]
  else
    server:= '';
end;

procedure runxfreerdp;
begin
  if int(ListServerAndPort.Count) > 1 then
      port:= ListServerAndPort[1]
  else
      port:= '3389';
  ExecuteProcess('/usr/bin/xfreerdp',['/v:' + Server ,'/port:' + port ,'/sec:rdp','&']);
end;

procedure TFormmstsc.serverandportKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
    runxfreerdp;
end;

procedure TFormmstsc.ConnexionClick(Sender: TObject);
begin
  runxfreerdp;
end;

end.

