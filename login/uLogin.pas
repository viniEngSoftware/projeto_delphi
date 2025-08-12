unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    pnlBemVindo: TPanel;
    pnlLogin: TPanel;
    Panel3: TPanel;
    edUsuario: TEdit;
    edSenha: TEdit;
    lbUsuario: TLabel;
    lbBemvindo: TLabel;
    lbSenha: TLabel;
    btnAcessar: TButton;
    btnFechar: TButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin

  Application.Terminate;
end;

end.
