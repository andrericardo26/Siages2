unit UCancItem;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, LResources, Buttons;

type
  TFrmCancItem = class(TForm)
    Btn_Sim: TButton;
    Edit_Numero: TEdit;
    Image1: TImage;
    Btn_Nao: TButton;
    RB_Ultimo: TRadioButton;
    RB_Generico: TRadioButton;
    Label1: TLabel;
    procedure Btn_SimClick(Sender: TObject);
    procedure RB_UltimoClick(Sender: TObject);
    procedure RB_GenericoClick(Sender: TObject);
    procedure Btn_NaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancItem: TFrmCancItem;

implementation

uses Global, UVendas, UPrincipal;


procedure TFrmCancItem.Btn_SimClick(Sender: TObject);
begin
   if (RB_Generico.Checked) and (StrToIntZero(Edit_Numero.Text) = 0) then
   begin
      MessageDlg('Cancelamento do item de número inválido.', mtWarning,[mbOK],0);
      Exit;
   end;
   oItemRetorno := StrToIntZero(Trim(Edit_Numero.Text));
   ModalResult := mrOk;
   //Close;
end;

procedure TFrmCancItem.RB_UltimoClick(Sender: TObject);
begin
   if RB_Ultimo.Checked then
   begin
      Edit_Numero.Text := '0';
      Edit_Numero.Enabled := False;
   end;
end;

procedure TFrmCancItem.RB_GenericoClick(Sender: TObject);
begin
   if RB_Generico.Checked then
   begin
      Edit_Numero.Enabled := True;
      Edit_Numero.SetFocus;
   end;
end;

procedure TFrmCancItem.Btn_NaoClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

initialization
   {$i ucancitem.lrs}

end.
