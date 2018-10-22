unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, Types;

type

  { TFormmstsc }

  TFormmstsc = class(TForm)
    Aide: TButton;
    Button1: TButton;
    Connexion: TButton;
    ImageMS: TImage;
    msgserver: TLabel;
    PageControl1: TPageControl;
    serverandport: TLabeledEdit;
    TabSheet1: TTabSheet;
    Affichage: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    usermsgtlabel: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ConnexionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure serverandportChange(Sender: TObject);
    procedure serverandportKeyPress(Sender: TObject; var Key: char);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
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
  avanced: Boolean;

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
  TabSheet1.TabVisible:=True;
  Affichage.TabVisible:=False;
  TabSheet3.TabVisible:=False;
  TabSheet4.TabVisible:=False;
  TabSheet5.TabVisible:=False;
  TabSheet6.TabVisible:=False;
  Constraints.MaxWidth:=471;
  Constraints.MaxHeight:=319;
end;

procedure TFormmstsc.PageControl1Change(Sender: TObject);
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

procedure TFormmstsc.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TFormmstsc.ConnexionClick(Sender: TObject);
begin
  runxfreerdp;
end;

procedure TFormmstsc.Button1Click(Sender: TObject);
begin

  if avanced then
    begin
    usermsgtlabel.Visible:=True;
    TabSheet1.TabVisible:=True;
    Affichage.TabVisible:=False;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=False;
    TabSheet5.TabVisible:=False;
    TabSheet6.TabVisible:=False;
    avanced:=False;
    end
  else
  begin
    usermsgtlabel.Visible:=False;
    TabSheet1.TabVisible:=True;
    Affichage.TabVisible:=True;
    TabSheet3.TabVisible:=True;
    TabSheet4.TabVisible:=True;
    TabSheet5.TabVisible:=True;
    TabSheet6.TabVisible:=True;
    avanced:= True;
  end;

end;

end.

