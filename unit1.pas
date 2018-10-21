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
    Button1: TButton;
    Connexion: TButton;
    ImageMS: TImage;
    usermsgtlabel: TLabel;
    msgserver: TLabel;
    serverandport: TLabeledEdit;
    procedure ConnexionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msgserverClick(Sender: TObject);
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
  noservermessage: string;
  msgserverok: string;
  usermsg: string;

implementation

{$R *.lfm}

{ TFormmstsc }

procedure TFormmstsc.FormCreate(Sender: TObject);
begin
  noservermessage:= 'Le champ du nom de l'+ #39 + 'ordinateur est vide. ' + #13 +' Entrez un nom complet d'+ #39 +'ordinateur distant';
  msgserverok:= 'Vos informations d' +  #39 + 'identification seront demandées lors de la connexion.';
  usermsg:= 'Nom d' +  #39 + 'utilisateur : Aucun parametre n'+  #39 + 'a été spécifié';
  usermsgtlabel.Caption:=usermsg;
  msgserver.Caption:=noservermessage;
end;

procedure TFormmstsc.msgserverClick(Sender: TObject);
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
  if serverandport.Text = '' then
    msgserver.Caption:=noservermessage
  else
    msgserver.Caption:=msgserverok;
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

