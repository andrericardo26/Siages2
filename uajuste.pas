unit UAjuste;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db, LCLType,
  LResources, Maskedit;


type
  TFrmAjuste = class(TForm)
     Datasource1: TDatasource;
     Edit_CodProd_Direto: TEdit;
     Edit_Produto_Direto: TEdit;
     Edit_SaldoNovo: TEdit;
     F3_Produto_Direto: TSpeedButton;
     Grid_Pesquisa: TdbGrid;
     Edit_PProduto: TEdit;
     Edit_PReg: TEdit;
     Edit_reg: TEdit;
     Edit_Produto: TEdit;
     Edit_Entrada: TEdit;
     Edit_Saida: TEdit;
     // JvQry_Pes: TJvUIBDataSet;
     Label11: TLabel;
     Label12: TLabel;
     Label13: TLabel;
     Label14: TLabel;
     Label15: TLabel;
     Label16: TLabel;
     Label17: TLabel;
     Label18: TLabel;
     Label19: TLabel;
     Label7: TLabel;
    Paginas: TPageControl;
    Panel3: TPanel;
    PanelApelido: TPanel;
    PanelLocalizacao: TPanel;
    PanelNome: TPanel;
    PanelReferencia: TPanel;
    PanelRef_Fabricante: TPanel;
    PanelUnidade: TPanel;
    Panel_SaldoAtual: TPanel;
    Panel_Valor: TPanel;
//    Proc: TJvUIBQuery;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Panel8: TPanel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    NaoLimpar: TCheckBox;
    Msk_DataMov: TMaskEdit;
    Msk_Data: TMaskEdit;
    TabPesquisa: TTabSheet;
    Panel1: TPanel;
    Panel4: TPanel;
    BtnImprime: TBitBtn;
    BtnLimpa: TBitBtn;
    BtnAjudaPes: TBitBtn;
    BtnAtualiza: TBitBtn;
    BtnSairPes: TBitBtn;
    Label30: TLabel;
    Edit_CodBarra: TEdit;
    F3_Produto: TSpeedButton;
    PanelProduto: TPanel;
    Memo_Obs: TMemo;
    Label4: TLabel;
    Label2: TLabel;
    Msk_PDataMov: TMaskEdit;
    Label8: TLabel;
    Edit_PCodBarra: TEdit;
    F3_PProduto: TSpeedButton;
    PanelPProduto: TPanel;
    Label9: TLabel;
    Msk_PData: TMaskEdit;
    IBQry_PesENTRADA: TFloatField;
    IBQry_PesSAIDA: TFloatField;
    TabAjuste_Direto: TTabSheet;
    Panel2: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure Edit_CodBarraKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_PCodBarraKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Produto_DiretoEnter(Sender: TObject);
    procedure Edit_Produto_DiretoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_SaldoNovoEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaCellClick(Column: TColumn);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Edit_RegExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Msk_DataMovEnter(Sender: TObject);
    procedure Msk_DataMovExit(Sender: TObject);
    procedure Edit_ProdutoExit(Sender: TObject);
    procedure Edit_CodBarraExit(Sender: TObject);
    procedure F3_ProdutoClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Edit_PProdutoExit(Sender: TObject);
    procedure Edit_PCodBarraExit(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure F3_Produto_DiretoClick(Sender: TObject);
    procedure Edit_Produto_DiretoExit(Sender: TObject);
    procedure Edit_SaldoNovoExit(Sender: TObject);

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
  FrmAjuste: TFrmAjuste;

implementation

uses UPrincipal, Global, UConsulta, UVariaveis;


procedure TFrmAjuste.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case vOper of
       opInsert : begin
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnSair.Enabled := False;
                     Msk_DataMov.Enabled := True;
                     Edit_Reg.Enabled := True;
                     NaoLimpar.Enabled := True;
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     Msk_DataMov.Enabled := False;
                     Edit_Reg.Enabled := False;
                     NaoLimpar.Enabled := False;
                  end;
    end;
  end;
end;


procedure TFrmAjuste.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmAjuste.Edit_CodBarraKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_ProdutoClick(F3_Produto);
end;

procedure TFrmAjuste.Edit_PCodBarraKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_ProdutoClick(F3_PProduto);
end;

procedure TFrmAjuste.Edit_Produto_DiretoEnter(Sender: TObject);
begin
   Edit_Produto_Direto.SelectAll;
end;

procedure TFrmAjuste.Edit_Produto_DiretoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_Produto_DiretoClick(self);
end;

procedure TFrmAjuste.Edit_SaldoNovoEnter(Sender: TObject);
begin
   Edit_SaldoNovo.SelectAll;
end;

procedure TFrmAjuste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   JvQry_Pes.close;
   Action := caFree;
end;

procedure TFrmAjuste.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmAjuste.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
   Edit_ProdutoExit(Self);
   Msk_DataMov.SetFocus;
end;

procedure TFrmAjuste.BtnGravaClick(Sender: TObject);
begin
   //DataMov e Reg
   if not ValiData(Msk_DataMov.Text) then
   begin
      MessageDlg('Data Movimento deve ser uma data válida.', mtInformation,[mbOK],0);
      Msk_DataMov.SetFocus;
      Exit;
   end;

   //Produto
   if StrToIntZero(Edit_Produto.Text) = 0 then
   begin
      MessageDlg('Produto deve ser preenchido.', mtInformation,[mbOK],0);
      Edit_Produto.SetFocus;
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
      Msk_DataMov.Text := DateToStr(Date);
      Edit_Reg.Text := '0';
      Msk_DataMov.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmAjuste.Carrega_Parametros;
begin
{   with Proc do
   begin
      Params.ByNameAsInteger['POPER'] := Operacao;
      Params.ByNameAsString['PDATAMOV'] := Msk_DataMov.Text;
      Params.ByNameAsInteger['PREG'] := StrToIntZero(Edit_Reg.Text);
      Params.ByNameAsInteger['PPRODUTO'] := StrToIntZero(Edit_Produto.Text);
      Params.ByNameAsCurrency['PENTRADA'] := StrToFloatZero(Edit_Entrada.Text);
      Params.ByNameAsCurrency['PSAIDA'] := StrToFloatZero(Edit_Saida.Text);
      if Trim(Msk_Data.Text) <> '' then
         Params.ByNameAsString['PDATA'] := Msk_Data.Text
      else
         Params.ByNameIsNull['PDATA'] := True;
      Params.ByNameAsString['POBSERVACAO'] := Memo_Obs.Lines.Text;
   end; }
end;

procedure TFrmAjuste.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataSet do
   begin
      Msk_DataMovEnter(Msk_DataMov);
      Msk_DataMov.Text := FieldByName('DATAMOV').asString;
      Msk_DataMovExit(Msk_DataMov);
      Edit_Reg.Text := FieldByName('REG').AsString;
      Edit_Produto.Text := FieldByName('PRODUTO').AsString;
      Edit_ProdutoExit(Self);
      Edit_Entrada.Text := FieldByName('ENTRADA').AsString;
      Edit_Saida.Text := FieldByName('SAIDA').AsString;
      Msk_DataMovEnter(Msk_Data);
      Msk_Data.Text := FieldByName('DATA').asString;
      Msk_DataMovExit(Msk_Data);
      Memo_Obs.Lines.Text := FieldByName('OBSERVACAO').asString;
  end;
end;

procedure TFrmAjuste.Grid_PesquisaCellClick(Column: TColumn);
begin

end;

procedure TFrmAjuste.Grid_PesquisaDblClick(Sender: TObject);
begin            {
   if (JvQry_Pes.Active) and (JvQry_Pes.Recordcount > 0) then
   begin
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
   end;         }
end;

procedure TFrmAjuste.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmAjuste.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   Edit_ProdutoExit(Self);
   BtnInclui.SetFocus;
end;

procedure TFrmAjuste.Edit_RegExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Msk_DataMov.Text)) > 0) and (Length(Trim(Edit_Reg.Text)) > 0) then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from AJUSTE where DATAMOV='''+ FormatDateTime('mm/dd/yyyy',StrToDate(Msk_DataMov.Text)) +''' and REG = '+ Edit_Reg.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmAjuste.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
   Msk_DataMov.Text := '';
   Edit_Reg.text := '0';
{
   Proc.DataBase := FrmPrincipal.base;
   Proc.Transaction := FrmPrincipal.Transaction;
   Proc.BuildStoredProc('PROC_AJUSTE');
   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;}
   
   {(IBQry_Pes.FieldByName('ENTRADA') as TNumericField).DisplayFormat := Parametros.Mascara_Qtde;
   (IBQry_Pes.FieldByName('SAIDA') as TNumericField).DisplayFormat := Parametros.Mascara_Valor;}

   if parametros.ALT_ESTQ_DIRETO = 1 then
      TabAjuste_Direto.Visible := True
   else
      TabAjuste_Direto.Visible := False;
   BtnInclui.SetFocus;
end;

procedure TFrmAjuste.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := 'SELECT AJUSTE.DATAMOV, AJUSTE.REG, AJUSTE.PRODUTO, AJUSTE.DATA, ';
   vSelect := vSelect + 'AJUSTE.ENTRADA, AJUSTE.SAIDA, AJUSTE.OBSERVACAO, ';
   vSelect := vSelect + '(AJUSTE.PRODUTO||'' - ''||PRODUTOS.NOME) AS PRODUTO_NOME ';
   vSelect := vSelect + 'FROM AJUSTE ';
   vSelect := vSelect + 'INNER JOIN PRODUTOS ON (AJUSTE.PRODUTO = PRODUTOS.CODIGO) ';

   CRI := '';

   //Data Movimento
   if (Msk_PDataMov.Text <> '') and (ValiData(Msk_PDataMov.Text)) then
   begin
      CRI := CRI + ' and AJUSTE.DATAMOV = '''+ FormatDateTime('mm/dd/yyyy',StrToDate(Msk_PDataMov.Text)) + ''' ';
   end;

   //Reg
   if StrToIntZero(Edit_PReg.Text) > 0 then
   begin
      CRI := CRI + ' and AJUSTE.REG = '+ Trim(Edit_PReg.Text) + ' ';
   end;

   //Produto
   if StrToIntZero(Edit_PProduto.Text) > 0 then
   begin
      CRI := CRI + ' and AJUSTE.PRODUTO = '+ Trim(Edit_PProduto.Text) + ' ';
   end;

   //Data
   if ValiData(Msk_PData.Text) and (Msk_PData.Text <> '') then
   begin
      CRI := CRI + ' and AJUSTE.DATA = '''+ FormatDateTime('mm/dd/yyyy',StrTodate(Msk_PData.Text)) + ''' ';
   end;

   if Length(CRI) > 0 then
      vSelect := vSelect + ' where ';


   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by AJUSTE.DATAMOV, AJUSTE.REG ';
   
   Datasource1.DataSet := nil;
   Grid_Pesquisa.DataSource := nil;
                                                   {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0)  then
   begin
      datasource1.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource1;
   end;                                           }
   Grid_Pesquisa.SetFocus;
end;

procedure TFrmAjuste.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Msk_DataMov.Text)) <> 0) and (StrToIntZero(Edit_Reg.Text) > 0) then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from Ajuste where DataMov='''+ FormatDateTime('mm/dd/yyyy',StrTodate(Msk_DataMov.Text)) +''' and Reg='+ Trim(Edit_Reg.Text),JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão do Ajuste ?'+ #13 + 'Data Mov. : ' + Msk_DataMov.Text +'   Registro : '+ Trim(Edit_Reg.Text)+ #13 +'Produto : ' + Trim(Edit_Produto.Text)+ #13 +'Entrada : ' + Trim(Edit_Entrada.Text)+ #13 +'Saída : ' + Trim(Edit_Saida.Text), mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               FrmPrincipal.LimpaCampos(self,1);
               Edit_ProdutoExit(Self);
            end;
            Operacao := opBrowse;
         end
         else
         begin
            MessageDlg('Ajuste com Data "'+ Msk_DataMov.Text +'" e Registro "'+ Trim(Edit_Reg.Text) +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
            Edit_ProdutoExit(Self);
         end;
         BtnInclui.SetFocus;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmAjuste.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmAjuste.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
   Edit_PProdutoExit(self);
//   JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmAjuste.Msk_DataMovEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99/99/9999;1;_';
      if (Operacao = opInsert) and ((Sender as TMaskEdit) = Msk_DataMov) then
         (Sender as TMaskEdit).Text := DateToStr(Date);
      (Sender as TMaskEdit).SelectAll;
   end;    
end;

procedure TFrmAjuste.Msk_DataMovExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '/  /' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmAjuste.Edit_ProdutoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Produto.Text)) <> 0) and (Trim(Edit_Produto.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('SELECT CODIGO, CODBARRA, NOME, CASAS_DECI_QTDE FROM VW_PROD_GERAL WHERE CODIGO = '+ Edit_Produto.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_CodBarra.Text := JvQuery.FieldByName('CODBARRA').asString;
            Edit_CodBarra.Modified := False;
            PanelProduto.Caption := JvQuery.FieldByName('NOME').asString;

         end
         else
         begin
            MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
            Edit_CodBarra.Text := '';
            PanelProduto.Caption := '';
            Edit_Produto.SetFocus;
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Produto.Text := '0';
      Edit_CodBarra.Text := '';
      PanelProduto.Caption := '';
   end;
end;

procedure TFrmAjuste.Edit_CodBarraExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   if Edit_CodBarra.Modified = False then Exit;
   If (Length(Trim(Edit_CodBarra.Text)) <> 0) and (Trim(Edit_CodBarra.Text) <> '0') then
   begin  {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('SELECT CODIGO, NOME, PRECO_VEND FROM VW_PROD_GERAL WHERE CODBARRA = '''+ Edit_CodBarra.Text + '''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_Produto.Text := JvQuery.FieldByName('CODIGO').AsString;
            PanelProduto.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
            Edit_Produto.Text := '0';
            PanelProduto.Caption := '';
            Edit_CodBarra.SetFocus;
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end;}
   end
   else
   begin
      Edit_Produto.Text := '0';
      Edit_CodBarra.Text := '';
      PanelProduto.Caption := '';
   end;
end;

procedure TFrmAjuste.F3_ProdutoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'SELECT CODIGO CODIGO, CODBARRA CODIGO_BARRA, NOME NOME, SALDO_ATU QUANTIDADE, PRECO_VEND VL_UNITARIO FROM VW_PROD_GERAL order by Nome';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Produtos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
         if (Sender as TSpeedButton).Name = 'F3_Produto' then
         begin
           // Edit_Produto.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
            Edit_ProdutoExit(Self);
            Edit_Entrada.SetFocus;
         end
         else
         begin
//            Edit_PProduto.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
            Edit_PProdutoExit(Self);
         end;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmAjuste.Action1Execute(Sender: TObject);
begin

end;

procedure TFrmAjuste.Edit_PProdutoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_PProduto.Text)) <> 0) and (Trim(Edit_PProduto.Text) <> '0') then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('SELECT CODIGO, CODBARRA, NOME, PRECO_VEND FROM VW_PROD_GERAL WHERE CODIGO = '+ Edit_PProduto.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_PCodBarra.Text := JvQuery.FieldByName('CODBARRA').asString;
            Edit_PCodBarra.Modified := False;
            PanelPProduto.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
            Edit_PCodBarra.Text := '';
            PanelPProduto.Caption := '';
            Edit_PProduto.SetFocus;
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end;  }
   end
   else
   begin
      Edit_PProduto.Text := '0';
      Edit_PCodBarra.Text := '';
      PanelPProduto.Caption := '';
   end;
end;

procedure TFrmAjuste.Edit_PCodBarraExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   if Edit_PCodBarra.Modified = False then Exit;
   If (Length(Trim(Edit_PCodBarra.Text)) <> 0) and (Trim(Edit_PCodBarra.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('SELECT CODIGO, NOME, PRECO_VEND FROM VW_PROD_GERAL WHERE CODBARRA = '''+ Edit_PCodBarra.Text + '''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_PProduto.Text := JvQuery.FieldByName('CODIGO').AsString;
            PanelPProduto.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
            Edit_PProduto.Text := '0';
            PanelPProduto.Caption := '';
            Edit_PCodBarra.SetFocus;
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_PProduto.Text := '0';
      Edit_PCodBarra.Text := '';
      PanelPProduto.Caption := '';
   end;
end;

procedure TFrmAjuste.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Ajuste',JvQry_Pes);
end;

procedure TFrmAjuste.F3_Produto_DiretoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'SELECT CODIGO AS CODIGO, NOME AS NOME, CODBARRA FROM VW_PROD_GERAL order by Nome';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Produtos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Produto_Direto.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Produto_Direto.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmAjuste.Edit_Produto_DiretoExit(Sender: TObject);
var vSelect, vCodBarra, oFormato : String;
  //  JvQuery : TJvUIBDataset;
begin
   if Trim(Edit_Produto_Direto.Text) <> '' then
   begin
{      vCodBarra := Trim(Edit_Produto_Direto.Text);
      While Length(vCodBarra) < 13 do vCodBarra := '0' + vCodBarra;

      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;


         if not FrmPrincipal.RodaConsulta('SELECT CODIGO, CODBARRA, NOME, PRECO_VEND, CASAS_DECI_VALOR, CASAS_DECI_QTDE, SALDO_ATU, UNIDADE, APELIDO FROM VW_PROD_GERAL WHERE CODBARRA = '''+ vCodBarra +'''',JvQuery) then Exit;
         if JvQuery.RecordCount <= 0 then
         begin
            if not FrmPrincipal.RodaConsulta('SELECT CODIGO, CODBARRA, NOME, PRECO_VEND, CASAS_DECI_VALOR, CASAS_DECI_QTDE, SALDO_ATU, UNIDADE, APELIDO FROM VW_PROD_GERAL WHERE CODIGO = '+ Trim(Edit_Produto_Direto.Text),JvQuery) then Exit;
            if JvQuery.RecordCount <= 0 then
            begin
               MessageDlg('Produto não encontrado.',mtWarning,[mbOK],0);
               Edit_Produto_Direto.SetFocus;
               Exit;
            end
         end;
         Edit_Produto_Direto.Text := vCodBarra;
         Edit_CodProd_Direto.Text := JvQuery.FieldByName('CODIGO').asString;;
         PanelNome.Caption := JvQuery.FieldByName('NOME').asString;
         PanelApelido.Caption := JvQuery.FieldByName('APELIDO').asString;
         PanelUnidade.Caption := JvQuery.FieldByName('UNIDADE').asString;
         //Busca casas decimais da Quantidade

         Panel_SaldoAtual.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('SALDO_ATU').asFloat);
         Edit_SaldoNovo.Text := JvQuery.FieldByName('SALDO_ATU').AsString;

         //Busca casas decimais do Valor

         Panel_Valor.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('PRECO_VEND').asFloat);
         Edit_SaldoNovo.Modified := False;
         Edit_SaldoNovo.setfocus;
         Edit_SaldoNovo.SelectAll;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmAjuste.Edit_SaldoNovoExit(Sender: TObject);
var vSQL : String;
begin
   //Atualiza o Preco de Venda
   if (Trim(Edit_Produto_Direto.Text) <> '') and (Edit_SaldoNovo.Modified = True) then
   begin
      vSQL := '';
      vSQL := vSQL + ' UPDATE PRODUTOS SET ';
      vSQL := vSQL + ' SALDO_ATU = ' + TrocaVirgula_Ponto(TirarPonto(Edit_SaldoNovo.Text));
      vSQL := vSQL + ' WHERE ';
      vSQL := vSQL + ' CODIGO = ' + Edit_CodProd_Direto.Text + ';';
      // FrmPrincipal.RodaComando(vSQL);
      Edit_Produto_DiretoExit(Self);
   end;
   Edit_Produto_Direto.SetFocus;
end;

initialization
   {$i uajuste.lrs}

end.
