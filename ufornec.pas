unit UFornec;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db, ActnList,
  LResources, MaskEdit, LCLType;


type

  { TFrmFornecedores }

  TFrmFornecedores = class(TForm)
//    BarChart1: TBarChart;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnAjuda1: TBitBtn;
    BtnAtlz_Grafico: TBitBtn;
    BtnAtlz_Mov_Geral: TBitBtn;
    BtnAtualiza: TBitBtn;
    BtnAtualiza1: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnCancelar1: TBitBtn;
    BtnEditar: TBitBtn;
    BtnExclui: TBitBtn;
    BtnExclui1: TBitBtn;
    BtnExcluiPesq: TBitBtn;
    BtnGrava: TBitBtn;
    BtnGrava1: TBitBtn;
    BtnImpr_Grafico: TBitBtn;
    BtnImpr_Mov_Geral: TBitBtn;
    BtnInclui: TBitBtn;
    BtnInclui1: TBitBtn;
    BtnIncluiPesq: TBitBtn;
    BtnLimpa1: TBitBtn;
    BtnLimpa_Mov_Geral: TBitBtn;
    BtnSair: TBitBtn;
    BtnSair1: TBitBtn;
    BtnSairPes1: TBitBtn;
    Campo1: TEdit;
    ComboMov_Aberto: TComboBox;
    ComboMov_Geral: TComboBox;
    Combo_Avaliacao: TComboBox;
    Edit_Ano: TEdit;
    Edit_Bairro: TEdit;
    Edit_Bairro1: TEdit;
    Edit_Cidade: TEdit;
    Edit_Cidade1: TEdit;
    Edit_Cx_Postal: TEdit;
    Edit_Cx_Postal1: TEdit;
    Edit_Email: TEdit;
    Edit_Email1: TEdit;
    Edit_Endereco: TEdit;
    Edit_Endereco1: TEdit;
    Edit_Fax: TEdit;
    Edit_Fax1: TEdit;
    Edit_Fone: TEdit;
    Edit_Fone1: TEdit;
    Edit_Fornecedor: TEdit;
    Edit_Fornec_Mov_Aberto: TEdit;
    Edit_Fornec_Mov_Geral: TEdit;
    Edit_Inscricao: TEdit;
    Edit_Inscricao1: TEdit;
    Edit_Nome: TEdit;
    Edit_Nome1: TEdit;
    Edit_PCodigo: TEdit;
    Edit_PNome: TEdit;
    Edit_Razao_Social: TEdit;
    Edit_Razao_Social1: TEdit;
    Edit_Representante: TEdit;
    Edit_Representante1: TEdit;
    Edit_UF: TEdit;
    Edit_UF1: TEdit;
    F3_Fornecedor: TSpeedButton;
    F3_Fornec_Mov_Aberto: TSpeedButton;
    F3_Fornec_Mov_Geral: TSpeedButton;
    Grid_Mov_Aberto: TdbGrid;
    Grid_Mov_Aberto1: TdbGrid;
    Grid_Mov_Geral: TdbGrid;
    Grid_Mov_Geral1: TdbGrid;
    Grid_Pesquisa: TdbGrid;
    Grid_Pesquisa1: TdbGrid;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label46: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_Total: TLabel;
    Label_Total1: TLabel;
    Label_Tot_Aberto: TLabel;
    Label_Tot_Aberto1: TLabel;
    Label_Tot_Atrazo: TLabel;
    Label_Tot_Atrazo1: TLabel;
    Lbl_Status: TLabel;
    Memo_Observacao: TMemo;
    Memo_Observacao1: TMemo;
    Msk_CEP: TMaskEdit;
    Msk_CEP1: TMaskEdit;
    Msk_CGC: TMaskEdit;
    Msk_CGC1: TMaskEdit;
    NaoLimpar: TCheckBox;
    NaoLimpar1: TCheckBox;
    PageCadastro: TPageControl;
    PageCadastro1: TPageControl;
    PageMovimento: TPageControl;
    PageMovimento1: TPageControl;
    Paginas: TPageControl;
    Paginas1: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PanelFornecedor: TPanel;
    Panel_Fornec_Mov_Aberto: TPanel;
    Panel_Fornec_Mov_Geral: TPanel;
     Src_MovAberto: TDatasource;
//     JvQry_MovAberto: TJvUIBDataSet;
     Src_MovGeral: TDatasource;
     Datasource1: TDatasource;
   ///  JvQry_Pes: TJvUIBDataSet;
//     JvQry_MovGeral: TJvUIBDataSet;
  //  Proc: TJvUIBQuery;
    TabCadastro: TTabSheet;
    TabCadastro1: TTabSheet;
    TabFinanceiro: TTabSheet;
    TabFinanceiro1: TTabSheet;
    TabFornecedor: TTabSheet;
    TabFornecedor1: TTabSheet;
    TabMov_Geral: TTabSheet;
    TabMov_Geral1: TTabSheet;
    TabMov_Geral_Aberto: TTabSheet;
    TabMov_Geral_Aberto1: TTabSheet;
    TabMov_Mensal: TTabSheet;
    TabMov_Mensal1: TTabSheet;
    TabPesquisa: TTabSheet;
    TabPesquisa1: TTabSheet;
    procedure BitBtn7Click(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluiPesqClick(Sender: TObject);
    procedure BtnImpr_GraficoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Campo1Click(Sender: TObject);
    procedure Edit_Fornec_Mov_AbertoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Fornec_Mov_GeralKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_FornecedorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure FrmFornecedoresKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Edit_PNomeChange(Sender: TObject);
    procedure Edit_PCodigoChange(Sender: TObject);
    procedure Edit_PCodigoExit(Sender: TObject);
    procedure Msk_CepEnter(Sender: TObject);
    procedure Msk_CepExit(Sender: TObject);
    procedure Msk_CGCEnter(Sender: TObject);
    procedure Msk_CGCExit(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure BtnAtlz_GraficoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBChart1DblClick(Sender: TObject);
    procedure F3_FornecedorClick(Sender: TObject);
    procedure Edit_FornecedorExit(Sender: TObject);
    procedure PageCadastroChange(Sender: TObject);
    procedure PageCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure BtnAtlz_Mov_GeralClick(Sender: TObject);
    procedure Edit_Fornec_Mov_GeralExit(Sender: TObject);
    procedure BtnLimpa_Mov_GeralClick(Sender: TObject);
    procedure BtnImpr_Mov_GeralClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Edit_Fornec_Mov_AbertoExit(Sender: TObject);
    procedure F3_Fornec_Mov_GeralClick(Sender: TObject);
    procedure F3_Fornec_Mov_AbertoClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PageMovimentoChange(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure SetStatus(Status: String);

  Private
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
  FrmFornecedores: TFrmFornecedores;

implementation

uses UPrincipal, Global, UConsulta, UVariaveis;


procedure TFrmFornecedores.SetOper(const Value: Integer);
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

procedure TFrmFornecedores.SetStatus(Status: String);
begin
  Lbl_Status.Caption := Status;
  BtnGrava.Enabled := true;
  BtnExclui.Enabled := true;
  BtnCancelar.Enabled := true;
  BtnInclui.Enabled := true;
  if Status = 'Pesquisa' then
    begin
      BtnGrava.Enabled := false;
      BtnExclui.Enabled := false;
      BtnCancelar.Enabled := false;
      exit;
    end
  else if Status = 'Inserção' then
    begin
      BtnInclui.Enabled := false;
      BtnExclui.Enabled := false;
    end;
end;

procedure TFrmFornecedores.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmFornecedores.Campo1Click(Sender: TObject);
begin

end;

procedure TFrmFornecedores.Edit_Fornec_Mov_AbertoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then F3_Fornec_Mov_AbertoClick(self);
end;

procedure TFrmFornecedores.Edit_Fornec_Mov_GeralKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then F3_Fornec_Mov_GeralClick(self);
end;

procedure TFrmFornecedores.Edit_FornecedorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then F3_FornecedorClick(self);
end;

procedure TFrmFornecedores.BtnImpr_GraficoClick(Sender: TObject);
begin
   //If MessageDlg('Tem certaza que deseja imprimir o gráfico ?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
end;

procedure TFrmFornecedores.BitBtn7Click(Sender: TObject);
begin
//   JvQry_MovAberto.Close;
   Src_MovAberto.DataSet := Nil;
   Grid_Mov_Aberto.DataSource := Nil;;
   Label_Tot_Aberto.Caption := '0,00';
   Label_Tot_Atrazo.Caption := '0,00';
end;

procedure TFrmFornecedores.BtnEditarClick(Sender: TObject);
begin
  Grid_PesquisaDblClick(self);
end;

procedure TFrmFornecedores.BtnExcluiPesqClick(Sender: TObject);
begin
//  Carrega_Campos(JvQry_Pes);
  BtnExcluiClick(self);
  BtnAtualizaClick(self);
end;

procedure TFrmFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmFornecedores.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmFornecedores.BtnIncluiClick(Sender: TObject);
begin
   Paginas.ActivePageIndex := 0;
   SetStatus('Inserção');
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
//    if Parametros.Busca_Chave = 1 then Campo1.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_FORNECEDORES'));
   Campo1.SetFocus;
end;

procedure TFrmFornecedores.BtnGravaClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
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
   if Length(Trim(Edit_Nome.Text)) = 0 then
   begin
      MessageDlg('Nome deve ser preenchido.', mtInformation,[mbOK],0);
      Edit_Nome.SetFocus;
      Exit;
   end;
   //CGC
   if Length(Trim(Msk_CGC.Text)) <> 0 then
   begin
      if not ValidaCgc(Trim(Msk_CGC.Text)) then
      begin
         MessageDlg('CGC inválido.', mtInformation,[mbOK],0);
         Msk_CGC.SetFocus;
         Exit;
      end
      else
      begin     {
         //Procura para ver se esse CGC ja foi cadastrado
         JvQuery := TJvUIBDataset.Create(self);
         try
            JvQuery.Database := FrmPrincipal.Base;
            JvQuery.Transaction := FrmPrincipal.Transaction;

            if not FrmPrincipal.RodaConsulta('Select * from Fornecedores where CGC='''+ Msk_CGC.Text +''''+' and Codigo <> ' + Campo1.Text,JvQuery) then Exit;
            if JvQuery.Recordcount > 0 then
            begin
               //keybd_event(39,0,0,0);
               if MessageDlg('O CGC "'+ Msk_CGC.Text +'" já está cadastrado no sistema para '+ #13 +
                          JvQuery.FieldByName('Codigo').asString + ' - ' +  JvQuery.FieldByName('Nome').asString + #13 +
                          'Deseja localizar e carregar o fornecedor "'+ JvQuery.FieldByName('Nome').asString +'" ?',
                          mtWarning,[mbYes, mbNo],0) = mrYes then
               begin
                  Operacao := opBrowse;
                  Carrega_Campos(JvQuery);
               end
               else
               begin
                  Msk_CGC.SetFocus;
                  Exit;
               end;
            end;
         finally
            JvQuery.Close;
            JvQuery.Free;
         end;  }
      end;
   end;
   //UF
   if Length(Trim(Edit_UF.Text)) = 0 then
   begin
      MessageDlg('UF deve ser preenchido.', mtInformation,[mbOK],0);
      Edit_UF.SetFocus;
      Exit;
   end;
   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   Carrega_Parametros;
  // FrmPrincipal.RodaSP(Proc);
   SetStatus('Edição');
   Operacao := opBrowse;
   if NaoLimpar.Checked then
   begin
      Operacao := opInsert;
   SetStatus('Inserção');
      Campo1.Text := '0';
      Campo1.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmFornecedores.Carrega_Parametros;
begin     {
   with Proc do
   begin
      Params.ByNameasInteger['POPER'] := Operacao;
      Params.ByNameasInteger['PCODIGO'] := StrToInt(Campo1.Text);
      Params.ByNameasString['PNOME'] := Edit_Nome.Text;
      Params.ByNameasString['PRAZAO_SOCIAL'] := Edit_Razao_Social.Text;
      Params.ByNameasString['PENDERECO'] := Edit_Endereco.Text;
      Params.ByNameasString['PBAIRRO'] := Edit_Bairro.Text;
      Params.ByNameasString['PCIDADE'] := Edit_Cidade.Text;
      Params.ByNameasString['PUF'] := Edit_UF.Text;
      Params.ByNameasString['PCEP'] := Msk_CEP.Text;
      Params.ByNameasString['PCX_POSTAL'] := Edit_Cx_Postal.Text;
      Params.ByNameasString['PCGC'] := Msk_CGC.Text;
      Params.ByNameasString['PINSCRICAO'] := Edit_Inscricao.Text;
      Params.ByNameasString['PFONE'] := Edit_Fone.Text;
      Params.ByNameasString['PFAX'] := Edit_Fax.Text;
      Params.ByNameasString['PREPRESENTANTE'] := Edit_Representante.Text;
      Params.ByNameasString['PEMAIL'] := Edit_Email.Text;
      Params.ByNameasString['POBSERVACAO'] := Memo_Observacao.Lines.Text;
   end;  }
end;

procedure TFrmFornecedores.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataset do
   begin
      Campo1.Text := FieldByName('CODIGO').asString;
      Edit_Nome.Text := FieldByName('NOME').asString;
      Edit_Razao_Social.Text := FieldByName('RAZAO_SOCIAL').asString;
      Edit_Endereco.Text := FieldByName('ENDERECO').asString;
      Edit_Bairro.Text := FieldByName('BAIRRO').asString;
      Edit_Cidade.Text := FieldByName('CIDADE').asString;
      Edit_UF.Text := FieldByName('UF').asString;
      Msk_CepEnter(Msk_Cep);
      Msk_CEP.Text := FieldByName('CEP').asString;
      Msk_CepExit(Msk_Cep);
      Edit_Cx_Postal.Text := FieldByName('CX_POSTAL').asString;
      Msk_CGCEnter(Msk_CGC);
      Msk_CGC.Text := FieldByName('CGC').asString;
      Msk_CGCExit(Msk_CGC);
      Edit_Inscricao.Text := FieldByName('INSCRICAO').asString;
      Edit_Fone.Text := FieldByName('FONE').asString;
      Edit_Fax.Text := FieldByName('FAX').asString;
      Edit_Representante.Text := FieldByName('REPRESENTANTE').asString;
      Edit_Email.Text := FieldByName('EMAIL').asString;
      Memo_Observacao.Lines.Text := FieldByName('OBSERVACAO').asString;
   end;
end;

procedure TFrmFornecedores.FrmFornecedoresKeyPress(Sender: TObject;
   var Key: Char);
begin

end;

procedure TFrmFornecedores.Grid_PesquisaDblClick(Sender: TObject);
begin      {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      Paginas.ActivePageIndex := 0;
      PageCadastro.ActivePageIndex := 0;
      SetStatus('Edição');
      Carrega_Campos(JvQry_Pes);
   end;   }
end;

procedure TFrmFornecedores.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmFornecedores.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   FrmPrincipal.LimpaCampos(self,1);
   BtnInclui.SetFocus;
end;

procedure TFrmFornecedores.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin     {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from Fornecedores where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;  }
   end
   else
   begin
      Campo1.Text := '0';
   end;
end;

procedure TFrmFornecedores.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   Combo_Avaliacao.ItemIndex := 0;
   ComboMov_Geral.ItemIndex := 0;
   ComboMov_Aberto.ItemIndex := 0;
   Campo1.Text:= '0';
   Edit_PCodigo.Text := '0';
                                                  {
   Proc.database := frmprincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_FORNECEDORES');

   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;

   JvQry_MovGeral.Database := FrmPrincipal.base;
   JvQry_MovGeral.Transaction := FrmPrincipal.Transaction;

   JvQry_MovAberto.Database := FrmPrincipal.base;
   JvQry_MovAberto.Transaction := FrmPrincipal.Transaction;
                                                 }
   BtnInclui.SetFocus;
   //TabFinanceiro.Visible := False;
end;

procedure TFrmFornecedores.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   BtnExcluiPesq.enabled := false;
   BtnEditar.enabled := false;
   vSelect := '';
   vSelect := 'Select * from Fornecedores ';

   CRI := '';
   If (Length(Trim(Edit_PCodigo.Text)) > 0) and (StrToInt(Edit_PCodigo.Text) > 0) then
   begin
      CRI := CRI + ' and Codigo = '+ Trim(Edit_PCodigo.Text) +' ';
   end;
   If Length(Trim(Edit_PNome.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Nome) like Upper(''%'+ Trim(Edit_PNome.Text) +'%'')';
   end;
   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by Codigo ';

   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
                                                   {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      BtnExcluiPesq.enabled := true;
      BtnEditar.enabled := true;
      datasource1.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource1;
   end;                                           }
end;

procedure TFrmFornecedores.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from Fornecedores where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão de '+ Edit_Nome.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               SetStatus('Pesquisa');
               FrmPrincipal.LimpaCampos(self,1);
            end;
            Operacao := opBrowse;
         end
         else
         begin
            MessageDlg('Fornecedor com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
         end;
         BtnInclui.SetFocus;

      except
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmFornecedores.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmFornecedores.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
//   JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmFornecedores.Edit_PNomeChange(Sender: TObject);
begin

end;

procedure TFrmFornecedores.Edit_PCodigoChange(Sender: TObject);
begin

end;

procedure TFrmFornecedores.Edit_PCodigoExit(Sender: TObject);
begin

end;

procedure TFrmFornecedores.Msk_CepEnter(Sender: TObject);
begin
   {if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99999-999;1;_';
   end;}
end;

procedure TFrmFornecedores.Msk_CepExit(Sender: TObject);
begin
   {if Trim((Sender as TMaskEdit).Text) = '-' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;}
end;

procedure TFrmFornecedores.Msk_CGCEnter(Sender: TObject);
begin
   {if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99.999.999/9999-99;1;_';
   end;}
end;

procedure TFrmFornecedores.Msk_CGCExit(Sender: TObject);
begin
   {if Trim((Sender as TMaskEdit).Text) = '.   .   /    -' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;}
end;

procedure TFrmFornecedores.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Fornecedores',IBQry_Pes);
end;

procedure TFrmFornecedores.BtnAtlz_GraficoClick(Sender: TObject);
var I : Integer;
    vSelect : String;
//    JvQuery : TJvUIBDataset;
begin
   if Edit_Fornecedor.Text = '' then
   begin
      MessageDlg('Fornecedor deve ser preenchido.',mtWarning,[mbOK],0);
      Edit_Fornecedor.SetFocus;
      Exit;
   end;
   
   if Edit_Ano.Text = '' then
   begin
      MessageDlg('Ano deve ser preenchido.',mtWarning,[mbOK],0);
      Edit_Ano.SetFocus;
      Exit;
   end;
   
   if Combo_Avaliacao.ItemIndex = -1 then
   begin
      MessageDlg('Campo Avaliar deve ser preenchido.',mtWarning,[mbOK],0);
      Combo_Avaliacao.SetFocus;
      Exit;
   end;
   {
   Screen.Cursor := crHourGlass;
   Try
      BarChart1.Visible := False;

      vSelect :=           ' SELECT CAST(UDF_STRZERO(EXTRACT(MONTH FROM COMPRAS.DT_EMISS),2) AS VARCHAR(2)) MES, ';
      vSelect := vSelect + ' CAST(UDF_STRZERO(EXTRACT(YEAR FROM COMPRAS.DT_EMISS),4) AS VARCHAR(4)) ANO, ';
      vSelect := vSelect + ' CAST(UDF_STRZERO(EXTRACT(MONTH FROM COMPRAS.DT_EMISS),2)|| ''/'' || UDF_STRZERO(EXTRACT(YEAR FROM COMPRAS.DT_EMISS),4) AS VARCHAR(7)) REFERENCIA, ';
      vSelect := vSelect + ' CAST(UDF_SMONTHNAME(''1.''||EXTRACT(MONTH FROM COMPRAS.DT_EMISS)) AS VARCHAR(5)) MES_EXT, ';
      vSelect := vSelect + ' CAST(UDF_NVL(SUM(TOT_NOTA)) AS NUMERIC(18,2)) TOTAL_VENDAS, ';
      vSelect := vSelect + ' CAST(UDF_NVL(COUNT(*)) AS NUMERIC(18,2)) NRO_VENDAS, ';
      vSelect := vSelect + ' CAST(UDF_NVL(SUM(TOT_NOTA) / COUNT(*)) AS NUMERIC(18,2)) MEDIA_VENDAS ';
      vSelect := vSelect + ' FROM COMPRAS ';
      vSelect := vSelect + ' WHERE ';
      vSelect := vSelect + ' COMPRAS.COD_FORNEC = '+ Trim(Edit_Fornecedor.Text) +' AND ';
      vSelect := vSelect + ' CAST(UDF_STRZERO(EXTRACT(YEAR FROM COMPRAS.DT_EMISS),4) AS VARCHAR(4)) = ' + Trim(Edit_Ano.Text);
      vSelect := vSelect + ' GROUP BY ';
      vSelect := vSelect + ' UDF_STRZERO(EXTRACT(MONTH FROM COMPRAS.DT_EMISS),2),UDF_STRZERO(EXTRACT(YEAR FROM COMPRAS.DT_EMISS),4), ';
      vSelect := vSelect + ' UDF_SMONTHNAME(''1.''||EXTRACT(MONTH FROM COMPRAS.DT_EMISS)) ';
      vSelect := vSelect + ' ORDER BY 2,1 ';

      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta(vselect,JvQuery) then Exit;

         if JvQuery.RecordCount > 0 then
         begin
            JvQuery.First;
            BarChart1.BeginUpdate;
            BarChart1.Clear;
            while not JvQuery.EOF do
            begin
               case Combo_Avaliacao.ItemIndex of
                  0 : BarChart1.AddBar(JvQuery.FieldByName('REFERENCIA').AsString,JvQuery.FieldByName('NRO_VENDAS').AsInteger,clGreen);
                  1 : BarChart1.AddBar(JvQuery.FieldByName('REFERENCIA').AsString,JvQuery.FieldByName('TOTAL_VENDAS').AsInteger,clGreen);
                  2 : BarChart1.AddBar(JvQuery.FieldByName('REFERENCIA').AsString,JvQuery.FieldByName('MEDIA_VENDAS').AsInteger,clGreen);
               end;
               JvQuery.Next;
            end;
            BarChart1.EndUpdate;
            BarChart1.Visible := True;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   finally
      Screen.Cursor := crDefault;
   end; }
end;

procedure TFrmFornecedores.BitBtn3Click(Sender: TObject);
begin
   //Imprime_Pesquisa('Historico Financeiro(Fornecedores)',IBQry_Grafico);
end;

procedure TFrmFornecedores.DBChart1DblClick(Sender: TObject);
begin

end;

procedure TFrmFornecedores.F3_FornecedorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from FORNECEDORES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Fornecedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//          Edit_Fornecedor.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Fornecedor.Modified := True;
         Edit_FornecedorExit(Self);
         Edit_Fornecedor.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmFornecedores.Edit_FornecedorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Fornecedor.Text)) <> 0) and (Trim(Edit_Fornecedor.Text) <> '0') then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From FORNECEDORES where Codigo='+ Edit_Fornecedor.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelFornecedor.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Fornecedor não cadastrado.',mtInformation,[mbOK],0);
            PanelFornecedor.Caption := '';
            Edit_Fornecedor.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;  }
   end
   else
   begin
      Edit_Fornecedor.Text := '0';
      PanelFornecedor.Caption := '';
   end;
end;

procedure TFrmFornecedores.PageCadastroChange(Sender: TObject);
begin
   PageMovimento.ActivePageIndex := 0;
   PageMovimentoChange(self);
   Case PageCadastro.ActivePageIndex of
      0 : begin
             BtnInclui.Enabled := True;
             BtnExclui.Enabled := True;
             BtnGrava.Enabled := True;
             BtnCancelar.Enabled := True;
          end;
      1 : begin
             BtnInclui.Enabled := False;
             BtnExclui.Enabled := False;
             BtnGrava.Enabled := False;
             BtnCancelar.Enabled := False;
          end;
   end;
end;

procedure TFrmFornecedores.PageCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmFornecedores.BtnAtlz_Mov_GeralClick(Sender: TObject);
var vSelect : String;
// var JvQuery : TJvUIBDataset;
begin
   if Edit_Fornec_Mov_Geral.Text = '' then
   begin
      MessageDlg('Fornecedor deve ser preenchido.',mtWarning,[mbOK],0);
      Edit_Fornec_Mov_Geral.SetFocus;
      Exit;
   end;
{   
   Screen.Cursor := crHourGlass;
   Try
      vSelect :=           ' SELECT CONTROLE, NRO_NOTA, SER_NOTA, CFOP, DT_EMISS, DT_ENTRADA, ';
      vSelect := vSelect + ' UDF_NVL(TOT_NOTA) TOT_NOTA ';
      vSelect := vSelect + ' FROM COMPRAS ';
      vSelect := vSelect + ' WHERE COD_FORNEC = ' + Trim(Edit_Fornec_Mov_Geral.Text) + ' ';
      Case ComboMov_Geral.ItemIndex of
         0 : vSelect := vSelect + ' ORDER BY CONTROLE ';
         1 : vSelect := vSelect + ' ORDER BY NRO_NOTA, SER_NOTA ';
         2 : vSelect := vSelect + ' ORDER BY CFOP ';
         3 : vSelect := vSelect + ' ORDER BY DT_EMISS ';
         4 : vSelect := vSelect + ' ORDER BY DT_ENTRADA ';
      end;

      if not FrmPrincipal.RodaConsulta(vSelect,JvQry_MovGeral) then Exit;

      if JvQry_MovGeral.RecordCount > 0 then
      begin
         Src_MovGeral.DataSet := JvQry_MovGeral;
         Grid_Mov_Geral.DataSource := Src_MovGeral;
      end;
      
      //Busca o total
      vSelect :=           ' SELECT SUM(TOT_NOTA) TOTAL ';
      vSelect := vSelect + ' FROM COMPRAS ';
      vSelect := vSelect + ' WHERE COD_FORNEC = ' + Trim(Edit_Fornec_Mov_Geral.Text) + ' ';

      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         FrmPrincipal.RodaConsulta(vSelect,JvQuery);
         Label_Total.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOTAL').asFloat);
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   finally
      Screen.Cursor := crDefault;
   end;  }
end;

procedure TFrmFornecedores.Edit_Fornec_Mov_GeralExit(Sender: TObject);
/// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Fornec_Mov_Geral.Text)) <> 0) and (Trim(Edit_Fornec_Mov_Geral.Text) <> '0') then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From FORNECEDORES where Codigo='+ Edit_Fornec_Mov_Geral.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Panel_Fornec_Mov_Geral.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Fornecedor não cadastrado.',mtInformation,[mbOK],0);
            Panel_Fornec_Mov_Geral.Caption := '';
            Edit_Fornec_Mov_Geral.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Fornec_Mov_Geral.Text := '0';
      Panel_Fornec_Mov_Geral.Caption := '';
   end;
end;

procedure TFrmFornecedores.BtnLimpa_Mov_GeralClick(Sender: TObject);
begin
//    JvQry_MovGeral.Close;
   Src_MovGeral.DataSet := Nil;
   Grid_Mov_Geral.DataSource := Nil;;
   Label_Total.Caption := '0,00';
end;

procedure TFrmFornecedores.BtnImpr_Mov_GeralClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Movimento Geral(Fornecedores)',IBQry_Mov_Geral);
end;

procedure TFrmFornecedores.Action1Execute(Sender: TObject);
begin
   if Edit_Fornecedor.Focused then
      F3_FornecedorClick(self)
   else if Edit_Fornec_Mov_Geral.Focused then
      F3_Fornec_Mov_GeralClick(self)
   else if Edit_Fornec_Mov_Aberto.Focused then
      F3_Fornec_Mov_AbertoClick(self);
end;

procedure TFrmFornecedores.Edit_Fornec_Mov_AbertoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Fornec_Mov_Aberto.Text)) <> 0) and (Trim(Edit_Fornec_Mov_Aberto.Text) <> '0') then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From FORNECEDORES where Codigo='+ Edit_Fornec_Mov_Aberto.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Panel_Fornec_Mov_Aberto.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Fornecedor não cadastrado.',mtInformation,[mbOK],0);
            Panel_Fornec_Mov_Aberto.Caption := '';
            Edit_Fornec_Mov_Aberto.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Fornec_Mov_Aberto.Text := '0';
      Panel_Fornec_Mov_Aberto.Caption := '';
   end;
end;

procedure TFrmFornecedores.F3_Fornec_Mov_GeralClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from FORNECEDORES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Fornecedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Fornec_Mov_Geral.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Fornec_Mov_Geral.Modified := True;
         Edit_Fornec_Mov_GeralExit(Self);
         Edit_Fornec_Mov_Geral.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmFornecedores.F3_Fornec_Mov_AbertoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from FORNECEDORES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Fornecedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
  //       Edit_Fornec_Mov_Aberto.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Fornec_Mov_Aberto.Modified := True;
         Edit_Fornec_Mov_AbertoExit(Self);
         Edit_Fornec_Mov_Aberto.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmFornecedores.BitBtn4Click(Sender: TObject);
var vSelect : String;
//    JvQuery : TJvUIBDataset;
begin
   if Edit_Fornec_Mov_Aberto.Text = '' then
   begin
      MessageDlg('Fornecedor deve ser preenchido.',mtWarning,[mbOK],0);
      Edit_Fornec_Mov_Aberto.SetFocus;
      Exit;
   end;
{
   Screen.Cursor := crHourGlass;
   Try
      vSelect :=           ' SELECT NRO_NOTA, SER_NOTA, DOCUMENTO, DAT_NOTA, VENCTO, VL_SALDO ';
      vSelect := vSelect + ' FROM CTASPAGAR WHERE VL_SALDO > 0 ';
      vSelect := vSelect + ' AND COD_FORNEC = ' + Trim(Edit_Fornec_Mov_Aberto.Text) + ' ';
      Case ComboMov_Aberto.ItemIndex of
         0 : vSelect := vSelect + ' ORDER BY NRO_NOTA, SER_NOTA ';
         1 : vSelect := vSelect + ' ORDER BY DOCUMENTO ';
         2 : vSelect := vSelect + ' ORDER BY DAT_NOTA ';
         3 : vSelect := vSelect + ' ORDER BY VENCTO ';
      end;

      if not FrmPrincipal.RodaConsulta(vSelect,JvQry_MovAberto) then Exit;

      if JvQry_MovAberto.RecordCount > 0 then
      begin
         Src_MovAberto.DataSet := JvQry_MovAberto;
         Grid_Mov_Aberto.DataSource := Src_MovAberto;
      end;

      //Busca os Totais

      vSelect :=           ' SELECT SUM(VL_SALDO) SALDO ';
      vSelect := vSelect + ' FROM CTASPAGAR WHERE VL_SALDO > 0 ';
      vSelect := vSelect + ' AND COD_FORNEC = ' + Trim(Edit_Fornec_Mov_Aberto.Text) + ' ';

      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         FrmPrincipal.RodaConsulta(vSelect,JvQuery);
         if JvQuery.FieldByName('SALDO').asFloat > 0 then
            Label_Tot_Aberto.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('SALDO').asFloat);
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;

      vSelect :=           ' SELECT SUM(VL_SALDO) ATRAZO ';
      vSelect := vSelect + ' FROM CTASPAGAR WHERE VL_SALDO > 0 AND VENCTO < CURRENT_DATE ';
      vSelect := vSelect + ' AND COD_FORNEC = ' + Trim(Edit_Fornec_Mov_Aberto.Text) + ' ';

      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         FrmPrincipal.RodaConsulta(vSelect,JvQuery);
         if JvQuery.FieldByName('ATRAZO').asFloat > 0 then
            Label_Tot_Atrazo.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('ATRAZO').asFloat);
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   finally
      Screen.Cursor := crDefault;
   end; }
end;

procedure TFrmFornecedores.PageMovimentoChange(Sender: TObject);
begin
   if Campo1.Text <> '' then
   begin
      Case PageMovimento.ActivePageIndex of
         0 : begin
                Edit_Fornecedor.Text := Campo1.Text;
                Edit_FornecedorExit(Self);
             end;
         1 : begin
                Edit_Fornec_Mov_Geral.Text := Campo1.Text;
                Edit_Fornec_Mov_GeralExit(Self);
             end;
         2 : begin
                Edit_Fornec_Mov_Aberto.Text := Campo1.Text;
                Edit_Fornec_Mov_AbertoExit(Self);
             end;
      end;
   end;
end;

procedure TFrmFornecedores.BitBtn8Click(Sender: TObject);
begin
   //Imprime_Pesquisa('Movimento Aberto(Fornecedores)',IBQry_Mov_Aberto);
end;

procedure TFrmFornecedores.Panel4Click(Sender: TObject);
begin

end;


initialization
   {$i ufornec.lrs}

end.
