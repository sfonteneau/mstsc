unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, ActnList, Types, Unit2, Process;

type

  { TFormmstsc }

  TFormmstsc = class(TForm)
    Aide: TButton;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox2: TComboBox;
    fullscreen: TCheckBox;
    ComboBox1: TComboBox;
    Connexion: TButton;
    ImageMS: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PageControl1: TPageControl;
    serverandport: TLabeledEdit;
    TabSheet1: TTabSheet;
    Affichage: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    ToggleBox1: TToggleBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure CheckBox1Change(Sender: TObject);
    procedure fullscreenChange(Sender: TObject);
    procedure ConnexionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure serverandportChange(Sender: TObject);
    procedure serverandportKeyPress(Sender: TObject; var Key: char);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabSheet1Enter(Sender: TObject);
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
  var s : ansistring;


implementation

{$R *.lfm}

{ TFormmstsc }

procedure TFormmstsc.FormCreate(Sender: TObject);
begin
  noservermessage:= 'Le champ du nom de l'+ #39 + 'ordinateur est vide. ' + #13 +' Entrez un nom complet d'+ #39 +'ordinateur distant';
  msgserverok:= 'Vos informations d' +  #39 + 'identification seront demandées lors de la connexion.';
  usermsg:= 'Nom d' +  #39 + 'utilisateur : Aucun parametre n'+  #39 + 'a été spécifié';
  ComboBox1.Items.Add('RDP Protocol Security');
  ComboBox1.Items.Add('TLS protocol security');
  ComboBox1.Items.Add('NLA protocol security');
  ComboBox1.Items.Add('NLA Extended protocol security');
  ComboBox1.Text:='NLA protocol security';
end;


procedure TFormmstsc.PageControl1Change(Sender: TObject);
begin

end;

procedure TFormmstsc.PageControl1Enter(Sender: TObject);
begin
  serverandport.SetFocus;
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
  if not (Formmstsc.serverandport.Text = '') then
  begin
    if Formmstsc.ComboBox1.Text = 'NLA protocol security' then
      begin
         Unit2.Login.ShowModal;

      end;

    if int(ListServerAndPort.Count) > 1 then
        begin
        port:= ListServerAndPort[1]
        end
    else
        port:= '3389';
    RunCommand('/usr/bin/xfreerdp',['/v:' + Server ,'/port:' + port,'/u:' + Login.Login.Text ,'/p:' + Login.Password.Text ],s);

{    ExecuteProcess('/usr/bin/xfreerdp',['/v:' + Server ,'/port:' + port,'/u:' + Login.Login.Text ,'/p:' + Login.Password.Text ]);}
    Login.Password.Clear;
    Login.Login.Clear;
  end
  else
  begin
    ShowMessage('Vous devez indiquer un serveur correct');
  end

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

procedure TFormmstsc.TabSheet1Enter(Sender: TObject);
begin
end;

procedure TFormmstsc.ConnexionClick(Sender: TObject);
begin
  runxfreerdp;
end;

procedure TFormmstsc.CheckBox1Change(Sender: TObject);
begin

end;

procedure TFormmstsc.fullscreenChange(Sender: TObject);
begin

end;



end.

