unit USituacaoClientes;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db,
  LResources, ZDataset, ZAbstractRODataset;


type

  { TFrmSituacaoClientes }

  TFrmSituacaoClientes = class(TForm)
     dsSituacoesClientes: TDatasource;
     Campo1: TEdit;
     Grid_Pesquisa: TdbGrid;
     Edit_PCodigo: TEdit;
     Edit_LimiteCred: TEdit;
//     JvQry_Pes: TJvUIBDataSet;
    Paginas: TPageControl;
//    Proc: TJvUIBQuery;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    TabPesquisa: TTabSheet;
    Panel1: TPanel;
    Label60: TLabel;
    Label61: TLabel;
    Panel4: TPanel;
    BtnImprime: TBitBtn;
    BtnLimpa: TBitBtn;
    BtnAjudaPes: TBitBtn;
    BtnAtualiza: TBitBtn;
    Edit_PDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Descricao: TEdit;
    NaoLimpar: TCheckBox;
    BtnSairPes: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    RB_Situacao: TRadioGroup;
    Memo_Mensagem: TMemo;
    Chk_Avista: TCheckBox;
    Chk_Aprazo: TCheckBox;
    Panel3: TPanel;
    Panel5: TPanel;
    Chk_Ctas_Atrazadas: TCheckBox;
    Panel6: TPanel;
    Chk_Reg_SPC_Mens: TCheckBox;
    zSituacaoClientes: TZQuery;
    zSituacaoClientesCODIGO: TZIntegerField;
    zSituacaoClientesDESCRICAO: TZUnicodeStringField;
    zSituacaoClientesIND_CTAS_ATRA: TZSmallIntField;
    zSituacaoClientesIND_REG_SPC_MENS: TZSmallIntField;
    zSituacaoClientesLIMITE_CRED: TZBCDField;
    zSituacaoClientesMENSAGEM: TZUnicodeCLobField;
    zSituacaoClientesSIT_CLIENTE: TZSmallIntField;
    zSituacaoClientesSIT_VENDAS: TZSmallIntField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure FrmSituacaoClientesKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);

  private
    { Private declarations }
    vOper : Integer;
    procedure SetOper(const Value: Integer);

  published
    property Operacao:Integer read vOper write SetOper;

  public
    { Public declarations }
  end;

const
   opInsert = 0;
   opEdit   = 1;
   opDelete = 2;
   opBrowse = 3;

var
  FrmSituacaoClientes: TFrmSituacaoClientes;

implementation

uses UPrincipal, Global, UVariaveis;


procedure TFrmSituacaoClientes.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case voper of
       opInsert : begin
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnSair.Enabled := False;
                     Campo1.Enabled := True;
                     NaoLimpar.Enabled := True;
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     Campo1.Enabled := False;
                     NaoLimpar.Enabled := False;
                  end;
    end;
  end;
end;


procedure TFrmSituacaoClientes.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmSituacaoClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmSituacaoClientes.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmSituacaoClientes.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
//   if Parametros.Busca_Chave = 1 then Campo1.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_SITUACOES'));
   Campo1.SetFocus;
end;

procedure TFrmSituacaoClientes.BtnGravaClick(Sender: TObject);
begin
   //Codigo
   if Length(Trim(Campo1.Text)) > 0 then
   begin
      if not ValNumero(Campo1.Text) then
      begin
         MessageDlg('Código deve ser número inteiro válido.', mtInformation,[mbOK],0);
         Campo1.SetFocus;
         Exit;
      end;
   end;
   //Nome
   if Length(Trim(Edit_Descricao.Text)) = 0 then
   begin
      MessageDlg('Descrição deve serself, preenchida.', mtInformation,[mbOK],0);
      Edit_Descricao.SetFocus;
      Exit;
   end;
   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   Carrega_Parametros;
//   FrmPrincipal.RodaSP(Proc);
   Operacao := opBrowse;
   if NaoLimpar.Checked then
   begin
      Operacao := opInsert;
      Campo1.Text := '0';
      Campo1.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmSituacaoClientes.Carrega_Parametros;
begin
   with zSituacaoClientes do
   begin
      Active:= True;
     if NaoLimpar.Checked = True then
     begin
        Insert;
     end;

     FieldByName('CODIGO').AsInteger:= StrToInt(Campo1.Text);
     FieldByName('DESCRICAO').AsString:= Edit_Descricao.Text;
     FieldByName('SIT_CLIENTE').AsInteger:= RB_Situacao.ItemIndex;
     FieldByName('SIT_VENDAS').AsInteger:= 3;
     FieldByName('MENSAGEM').AsString:= Memo_Mensagem.Lines.Text;
     FieldByName('LIMITE_CRED').AsCurrency:= StrToFloatZero(Edit_LimiteCred.Text);

     Post;

     { Params.ByNameAsInteger['POPER'] := Operacao;
      Params.ByNameAsInteger['PCODIGO'] := StrToInt(Campo1.Text);
      Params.ByNameAsString['PDESCRICAO'] := Edit_Descricao.Text;
      Params.ByNameAsInteger['PSIT_CLIENTE'] := RB_Situacao.ItemIndex;
      if Chk_Avista.Checked and Chk_Aprazo.Checked then
         Params.ByNameAsInteger['PSIT_VENDAS'] := 3
      else if Chk_Avista.Checked then
         Params.ByNameAsInteger['PSIT_VENDAS'] := 1
      else if Chk_Aprazo.Checked then
         Params.ByNameAsInteger['PSIT_VENDAS'] := 2
      else //nenhum esta checado - nao pode vender
         Params.ByNameAsInteger['PSIT_VENDAS'] := 0;
      Params.ByNameAsString['PMENSAGEM'] := Memo_Mensagem.Lines.Text;
      Params.ByNameAsCurrency['PLIMITE_CRED'] := StrToFloatZero(Edit_LimiteCred.Text);
      Params.ByNameAsInteger['PIND_CTAS_ATRA'] := IIF(Chk_Ctas_Atrazadas.Checked,1,0);
      Params.ByNameAsInteger['PIND_REG_SPC_MENS'] := IIF(Chk_Reg_SPC_Mens.Checked,1,0); }
   end;
end;

procedure TFrmSituacaoClientes.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataSet do
   begin
      Campo1.Text := FieldByName('CODIGO').asString;
      Edit_Descricao.Text := FieldByName('DESCRICAO').asString;
      RB_Situacao.ItemIndex := FieldByName('SIT_CLIENTE').asInteger;
      case FieldByName('SIT_VENDAS').asInteger of
         0 : begin
                Chk_Avista.Checked := False;
                Chk_Aprazo.Checked := False;
             end;
         1 : begin
                Chk_Avista.Checked := True;
                Chk_Aprazo.Checked := False;
             end;
         2 : begin
                Chk_Avista.Checked := False;
                Chk_Aprazo.Checked := True;
             end;
         3 : begin
                Chk_Avista.Checked := True;
                Chk_Aprazo.Checked := True;
             end;
      end;
      Memo_Mensagem.Lines.Text := FieldByName('MENSAGEM').asString;
      Edit_LimiteCred.Text := FieldByName('LIMITE_CRED').asString;
      Chk_Ctas_Atrazadas.Checked := IIF(FieldByName('IND_CTAS_ATRA').asInteger = 1,True,False);
      Chk_Reg_SPC_Mens.Checked := IIF(FieldByName('IND_REG_SPC_MENS').asInteger = 1,True,False);
   end;
end;

procedure TFrmSituacaoClientes.FrmSituacaoClientesKeyPress(Sender: TObject;
   var Key: Char);
begin

end;

procedure TFrmSituacaoClientes.Grid_PesquisaDblClick(Sender: TObject);
begin       {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
   end;    }
end;

procedure TFrmSituacaoClientes.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmSituacaoClientes.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   BtnInclui.SetFocus;
end;

procedure TFrmSituacaoClientes.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from Situacoes where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Campo1.Text := '0';
   end;
end;

procedure TFrmSituacaoClientes.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;                               {
   Proc.database := FrmPrincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_SITUACOES');
   jvqry_pes.database := frmprincipal.base;
   jvqry_pes.transaction := frmprincipal.transaction; }
   Campo1.Text:= '0';
   Edit_PCodigo.Text := '0';
   BtnInclui.SetFocus;
end;

procedure TFrmSituacaoClientes.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := 'Select * from Situacoes ';

   CRI := '';
   If (Length(Trim(Edit_PCodigo.Text)) > 0) and (StrToint(Edit_PCodigo.Text) > 0) then
   begin
      CRI := CRI + ' and Codigo = '+ Trim(Edit_PCodigo.Text) +' ';
   end;
   If Length(Trim(Edit_PDescricao.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(DESCRICAO) like Upper(''%'+ Trim(Edit_PDescricao.Text) +'%'')';
   end;
   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by Codigo ';

   dsSituacoesClientes.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
                                                         {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      dsSituacoesClientes.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := dsSituacoesClientes;
   end;                                                 }
end;

procedure TFrmSituacaoClientes.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin                                 {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from Situacoes where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.recordcount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão de '+ Edit_descricao.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               FrmPrincipal.LimpaCampos(self,1);
            end;
            Operacao := opBrowse;
         end
         else
         begin
            MessageDlg('Situação com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
         end;
         BtnInclui.SetFocus;
      except
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmSituacaoClientes.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmSituacaoClientes.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
//   JvQry_Pes.Close;
   dsSituacoesClientes.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
   BtnAtualiza.SetFocus;
end;

procedure TFrmSituacaoClientes.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Situacoes',IBQry_Pes);
end;

initialization
   {$i usituacaoclientes.lrs}

end.
