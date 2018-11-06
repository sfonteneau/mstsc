unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  MaskEdit, StdCtrls;

type

  { TLogin }

  TLogin = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Login: TLabeledEdit;
    Password: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PasswordChange(Sender: TObject);
    procedure PasswordKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Login: TLogin;

implementation

{$R *.lfm}


{ TLogin }

procedure TLogin.PasswordChange(Sender: TObject);
begin
  Password.PasswordChar:=chr(129);;
end;

procedure TLogin.PasswordKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
     ModalResult:=mrOk;
end;

procedure TLogin.Button1Click(Sender: TObject);
begin
end;

procedure TLogin.Button2Click(Sender: TObject);
begin

end;

procedure TLogin.FormCreate(Sender: TObject);
begin

end;


end.

