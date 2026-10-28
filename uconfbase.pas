unit uconfbase;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ImgList, FileCtrl, ExtCtrls, Buttons,
  ToolWin, Registry, LResources, EditBtn, Inifiles, ExtDlgs;

type

  { TFrmConfBase }

  TFrmConfBase = class(TForm)
    BtnAjuda: TBitBtn;
    Btn_Cancela: TBitBtn;
    Btn_OK: TBitBtn;
    EditCaminho: TEdit;
    EditHost: TEdit;
    EditPorta: TEdit;
    Btn_Localizar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    RadioGroup1: TRadioGroup;
    procedure BtnAjuda1Click(Sender: TObject);
    procedure Btn_Cancela1Click(Sender: TObject);
    procedure Btn_LocalizarClick(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
    procedure EditCaminhoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FrmConfBaseKeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroup1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    Function FmtServidor(oPath: String):String;
    
  end;

var
  FrmConfBase: TFrmConfBase;

implementation

uses uvariaveis, global;

procedure TFrmConfBase.Btn_Cancela1Click(Sender: TObject);
begin
   close;
end;

procedure TFrmConfBase.Btn_LocalizarClick(Sender: TObject);
begin
   if OpenDialog1.Execute then
   begin
      EditCaminho.Text := OpenDialog1.FileName;
   end;
end;

procedure TFrmConfBase.Btn_OKClick(Sender: TObject);
var ConexIni : TIniFile;
begin
   try
      ConexIni := TIniFile.Create(ExtractFileDir(Application.ExeName) + '/' + Apelido + '.ini');
      //Base dos Dados
      //ConexIni.NewSection( 'Banco de Dados' );
      ConexIni.WriteString('Banco de Dados','Caminho',EditCaminho.Text);
      if RadioGroup1.ItemIndex = 1 then
         ConexIni.WriteString('Banco de Dados','Servidor',FmtServidor(EditCaminho.Text));
      //ConexIni.WriteIniFile;
      ConexIni.Destroy;
      MessageDlg('Dados gravados com sucesso.',mtInformation,[mbok],0);
      Close;
   except
      MessageDlg('Os dados não puderam ser gravados. Teste a conexão e tente novamente.',mtWarning,[mbok],0);
   end;
end;

procedure TFrmConfBase.BtnAjuda1Click(Sender: TObject);
begin
   //Chama_Ajuda('Paginas/bemvindo.htm');
end;

Function TFrmConfBase.FmtServidor(oPath: String):String;
var oServer, aPorta : string;
begin
   oServer := EditHost.Text;
   aPorta := EditPorta.Text;
   Result := oServer + '/' + aPorta;
end;

procedure TFrmConfBase.EditCaminhoExit(Sender: TObject);
begin

end;

procedure TFrmConfBase.FormCreate(Sender: TObject);
begin

end;

procedure TFrmConfBase.FormShow(Sender: TObject);
var ConexIni : TIniFile;
    oCaminho, oServidor:String;
begin
   //DirectoryListBox1Change(self);
   try
      ConexIni := TIniFile.Create(ExtractFileDir(Application.ExeName) + '/' + Apelido + '.ini');
      //ConexIni.ReadIniFile;
      oCaminho := ConexIni.ReadString('Banco de Dados','Caminho','');
      oServidor := ConexIni.ReadString('Banco de Dados','Servidor','');
      ConexIni.Destroy;
      if Length(Trim(oCaminho)) > 0 then
      begin
         EditCaminho.Text := oCaminho;
      end
      else
      begin
         MessageDlg('As informações do Caminho do Servidor não puderam ser carregadas corretamente. Crie uma nova conexão.',mtWarning,[mbok],0);
      end;
      if Trim(oServidor) = '' then
         RadioGroup1.ItemIndex := 0
      else
      begin
         RadioGroup1.ItemIndex := 1;
         EditHost.Text := Copy(oServidor,1,Pos('/',oServidor)-1);
         EditPorta.Text := Copy(oServidor,Pos('/',oServidor)+1,Length(oServidor));
      end;
      RadioGroup1Click(self);
   except
      MessageDlg('As informações do Caminho do Servidor não puderam ser carregadas corretamente. Crie uma nova conexão.',mtWarning,[mbok],0);
   end;
end;

procedure TFrmConfBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmConfBase.FrmConfBaseKeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TFrmConfBase.RadioGroup1Click(Sender: TObject);
begin
   if RadioGroup1.ItemIndex = 1 then
   begin
      EditHost.Enabled := True;
      EditPorta.Enabled := True;
      Btn_Localizar.Enabled := False;
   end
   else
   begin
      EditHost.Enabled := False;
      EditPorta.Enabled := False;
      Btn_Localizar.Enabled := True;
   end;
end;

initialization
  {$i uconfbase.lrs}

end.
