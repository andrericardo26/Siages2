unit USenha;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, LResources;

type

  { TFrmSenha }

  TFrmSenha = class(TForm)
    Label1: TLabel;
    Edit_Usuario: TEdit;
    Btn_OK: TBitBtn;
    Btn_Cancela: TBitBtn;
    Label2: TLabel;
    Edit_Senha: TEdit;
    Label3: TLabel;
    Edit_Grupo: TEdit;
    procedure Btn_CancelaClick(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
    procedure Edit_UsuarioEnter(Sender: TObject);
    procedure Edit_SenhaEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenha: TFrmSenha;

implementation

uses UPrincipal, UVariaveis, Global;


procedure TFrmSenha.Edit_UsuarioEnter(Sender: TObject);
begin
//    Edit_Usuario.Text := '';
//   Edit_Usuario.Text := 'sysdba';
end;

procedure TFrmSenha.Btn_OKClick(Sender: TObject);
begin
  FrmPrincipal.SenhaModalResult := true;
  close;
end;

procedure TFrmSenha.Btn_CancelaClick(Sender: TObject);
begin
  FrmPrincipal.SenhaModalResult := false;
  close;
end;

procedure TFrmSenha.Edit_SenhaEnter(Sender: TObject);
begin
//   Edit_Senha.Text := '';
//   Edit_Senha.Text := 'masterkey';
end;

initialization
  {$i usenha.lrs}

end.
