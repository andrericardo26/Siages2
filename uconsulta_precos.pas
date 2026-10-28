unit UConsulta_Precos;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Db, LResources, LCLType;

type

  { TFrmConsulta_Precos }

  TFrmConsulta_Precos = class(TForm)
     // JvQuery: TJvUIBDataSet;
     Label4: TLabel;
    Label6: TLabel;
    Edit_Produto: TEdit;
    F3_Produto: TSpeedButton;
    Label7: TLabel;
    Label_Valor: TLabel;
    PanelNome: TPanel;
    Panel_Preco: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    PanelApelido: TPanel;
    PanelUnidade: TPanel;
    Memo_Ref_Tecnica: TMemo;
    PanelReferencia: TPanel;
    PanelRef_Fabricante: TPanel;
    PanelLocalizacao: TPanel;
    Label9: TLabel;
    Bevel1: TBevel;
    BtnSair: TBitBtn;
    Bevel2: TBevel;
    Label10: TLabel;
    Panel_Saldo: TPanel;
    StaticText2: TStaticText;
    procedure Edit_ProdutoExit(Sender: TObject);
    procedure Edit_ProdutoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure F3_ProdutoClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit_ProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_ProdutoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta_Precos: TFrmConsulta_Precos;

implementation

uses UPrincipal, UConsulta, Global;


procedure TFrmConsulta_Precos.Edit_ProdutoExit(Sender: TObject);
var vSelect, vCodBarra, oFormato : String;
    vTestaCodBarra : Boolean;
begin
   try
      StrToIntZero(Edit_Produto.Text);
   except
      showmessage('Digite um codigo valido!');
      exit;
   end;

   //JvQuery := TJvUIBDataset.Create(Self);
{   JvQuery.Database := FrmPrincipal.Base;
   JvQuery.Transaction := FrmPrincipal.Transaction;
   
   if Trim(Edit_Produto.Text) <> '' then
   begin
      // Testa por qual ele procura antes
      if Length(vCodBarra) > 6 then  // pra que esse teste?? teria q atribuir a vcodbarra antes
      begin
         vTestaCodBarra := True;
         vCodBarra := Trim(Edit_Produto.Text);
         While Length(vCodBarra) < 13 do vCodBarra := '0' + vCodBarra; //coloca os zeros na frente do codigo de barra ate atingir os 13 digitos
         if not FrmPrincipal.RodaConsulta('SELECT CODIGO, CODBARRA, NOME, APELIDO, UNIDADE, REFERENCIA, REFERENCIA1, REF_TECNICA, LOCALIZACAO, PRECO_VEND, CASAS_DECI_VALOR, CASAS_DECI_QTDE, SALDO_ATU FROM VW_PROD_GERAL WHERE CODBARRA = '''+ vCodBarra +'''',JvQuery) then Exit;
      end
      else
      begin
         vTestaCodBarra := False;
         if not FrmPrincipal.RodaConsulta('SELECT CODIGO, CODBARRA, NOME, APELIDO, UNIDADE, REFERENCIA, REFERENCIA1, REF_TECNICA, LOCALIZACAO, PRECO_VEND, CASAS_DECI_VALOR, CASAS_DECI_QTDE, SALDO_ATU FROM VW_PROD_GERAL WHERE CODIGO = '''+ Trim(Edit_Produto.Text) + '''',JvQuery) then Exit;
      end;
      
      if (JvQuery.Active = False) or (JvQuery.RecordCount = 0) then
      begin
         if vTestaCodBarra then
         begin
            if not FrmPrincipal.RodaConsulta('SELECT CODIGO, CODBARRA, NOME, APELIDO, UNIDADE, REFERENCIA, REFERENCIA1, REF_TECNICA, LOCALIZACAO, PRECO_VEND, CASAS_DECI_VALOR, CASAS_DECI_QTDE, SALDO_ATU FROM VW_PROD_GERAL WHERE CODIGO = '+ Trim(Edit_Produto.Text),JvQuery) then Exit;
         end
         else
         begin
            vCodBarra := Trim(Edit_Produto.Text);
            While Length(vCodBarra) < 13 do vCodBarra := '0' + vCodBarra;

            if not FrmPrincipal.RodaConsulta('SELECT CODIGO, CODBARRA, NOME, APELIDO, UNIDADE, REFERENCIA, REFERENCIA1, REF_TECNICA, LOCALIZACAO, PRECO_VEND, CASAS_DECI_VALOR, CASAS_DECI_QTDE, SALDO_ATU FROM VW_PROD_GERAL WHERE CODBARRA = '''+ vCodBarra +'''',JvQuery) then Exit;
         end;

         if (JvQuery.Active = False) or (JvQuery.RecordCount = 0) then
         begin
            MessageDlg('Produto não encontrado.',mtWarning,[mbOK],0);
            Edit_Produto.SetFocus;
            Exit;
         end
      end;
      PanelNome.Caption := JvQuery.FieldByName('NOME').asString;
      PanelApelido.Caption := JvQuery.FieldByName('APELIDO').asString;
      PanelUnidade.Caption := JvQuery.FieldByName('UNIDADE').asString;
      PanelReferencia.Caption := JvQuery.FieldByName('REFERENCIA').asString;
      PanelRef_Fabricante.Caption := JvQuery.FieldByName('REFERENCIA1').asString;
      PanelLocalizacao.Caption := JvQuery.FieldByName('LOCALIZACAO').asString;
      Panel_Saldo.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('SALDO_ATU').asFloat);
      Label_Valor.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('PRECO_VEND').asFloat);
      Memo_Ref_Tecnica.Lines.Text := JvQuery.FieldByName('REF_TECNICA').asString;
   end
   else
   begin
      PanelNome.Caption := '';
      PanelApelido.Caption := '';
      PanelUnidade.Caption := '';
      PanelReferencia.Caption := '';
      PanelRef_Fabricante.Caption := '';
      PanelLocalizacao.Caption := '';
      Memo_Ref_Tecnica.Lines.Text := '';
   end;}
   //Edit_Produto.SelectAll;
end;

procedure TFrmConsulta_Precos.Edit_ProdutoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_ProdutoClick(Self);
end;

procedure TFrmConsulta_Precos.F3_ProdutoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'SELECT CODIGO AS CODIGO, NOME AS NOME, CODBARRA FROM VW_PROD_GERAL  order by Nome';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Produtos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Produto.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_ProdutoExit(self);
         Edit_Produto.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmConsulta_Precos.Action1Execute(Sender: TObject);
begin

end;

procedure TFrmConsulta_Precos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_Escape then
      BtnSair.Click;
end;

procedure TFrmConsulta_Precos.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmConsulta_Precos.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmConsulta_Precos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmConsulta_Precos.FormShow(Sender: TObject);
begin
{   JvQuery.Database := FrmPrincipal.base;
   JvQuery.Transaction := FrmPrincipal.Transaction; }
end;

procedure TFrmConsulta_Precos.Edit_ProdutoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = 13 then
      Edit_ProdutoExit(Self);
end;

procedure TFrmConsulta_Precos.Edit_ProdutoEnter(Sender: TObject);
begin
   Edit_Produto.SelectAll;
end;

initialization
   {$i uconsulta_precos.lrs}

end.
