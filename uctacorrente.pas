unit UCtaCorrente;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db,ActnList,
  LResources, LCLType;


type
  TFrmCtaCorrente = class(TForm)
     Campo1: TEdit;
     Datasource1: TDatasource;
     Grid_Saldos: TdbGrid;
     Grid_Pesquisa: TdbGrid;
     Src_Saldos: TDatasource;
     Edit_Banco: TEdit;
     Edit_PCodigo: TEdit;
     EditP_Banco: TEdit;
{     JvQry_Pes: TJvUIBDataSet;
     JvQry_Saldos: TJvUIBDataSet; }
    Paginas: TPageControl;
//    Proc: TJvUIBQuery;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    TabPesquisa: TTabSheet;
    Panel1: TPanel;
    Panel4: TPanel;
    BtnImprime: TBitBtn;
    BtnLimpa: TBitBtn;
    BtnAjudaPes: TBitBtn;
    BtnAtualiza: TBitBtn;
    BtnSairPes: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    F3P_Banco: TSpeedButton;
    PanelPBanco: TPanel;
    Label9: TLabel;
    EditP_Cta_Corr: TEdit;
    PageCadastro: TPageControl;
    TabCtaCorr: TTabSheet;
    Panel5: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    F3_banco: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    NaoLimpar: TCheckBox;
    Edit_Cta_Corr: TEdit;
    Edit_Contato: TEdit;
    Edit_Fone: TEdit;
    Edit_Nome_Cor: TEdit;
    PanelBanco: TPanel;
    PanelSaldo: TPanel;
    PanelBanco2: TPanel;
    TabSaldos: TTabSheet;
    procedure BtnSairClick(Sender: TObject);
    procedure EditP_BancoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_BancoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Edit_BancoExit(Sender: TObject);
    procedure F3_bancoClick(Sender: TObject);
    procedure F3P_BancoClick(Sender: TObject);
    procedure EditP_BancoExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure PageCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure PageCadastroChange(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
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
  FrmCtaCorrente: TFrmCtaCorrente;

implementation

uses UPrincipal, Global, UConsulta, UVariaveis;


procedure TFrmCtaCorrente.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case vOper of
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


procedure TFrmCtaCorrente.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmCtaCorrente.EditP_BancoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3P_BancoClick(self);
end;

procedure TFrmCtaCorrente.Edit_BancoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_bancoClick(self);
end;

procedure TFrmCtaCorrente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmCtaCorrente.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmCtaCorrente.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
   Edit_BancoExit(Self);
   PanelSaldo.Caption := '0,00';
//   if Parametros.Busca_Chave = 1 then Campo1.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_CTACORRENTE'));
   Campo1.SetFocus;
end;

procedure TFrmCtaCorrente.BtnGravaClick(Sender: TObject);
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
   //Conta Corrente
   if Length(Trim(Edit_Cta_Corr.Text)) = 0 then
   begin
      MessageDlg('Conta Corrente deve ser preenchido.', mtInformation,[mbOK],0);
      Edit_Cta_Corr.SetFocus;
      Exit;
   end;
   //Banco
   if (Length(Trim(Edit_Banco.Text)) = 0) or (Trim(Edit_Banco.Text) = '0') then
   begin
      MessageDlg('Banco deve ser preenchido.', mtInformation,[mbOK],0);
      Edit_Banco.SetFocus;
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
      Campo1.text := '0';
      Campo1.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmCtaCorrente.Carrega_Parametros;
begin    {
   with Proc do
   begin
      Params.ByNameAsInteger['POPER'] := Operacao;
      Params.ByNameAsInteger['PCODIGO'] := StrToInt(Campo1.Text);
      Params.ByNameAsString['PCTA_CORR'] := Edit_Cta_Corr.Text;
      Params.ByNameAsInteger['PBANCO'] := StrToIntZero(Edit_Banco.Text);
      Params.ByNameAsString['PNOME_COR'] := Edit_Nome_Cor.Text;
      Params.ByNameAsString['PCONTATO'] := Edit_Contato.Text;
      Params.ByNameAsString['PFONE'] := Edit_Fone.Text;
   end; }
end;

procedure TFrmCtaCorrente.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataSet do
   begin
      Campo1.Text := FieldByName('CODIGO').AsString;
      Edit_Cta_Corr.Text := FieldByName('CTA_CORR').AsString;
      Edit_Banco.Text := FieldByName('BANCO').asString;
      Edit_BancoExit(Self);
      Edit_Nome_Cor.Text := FieldByName('NOME_COR').asString;
      Edit_Contato.Text := FieldByName('CONTATO').asString;
      Edit_Fone.Text := FieldByName('FONE').asString;
      PanelSaldo.Caption := FormatFloat('#,###,##0.00',FieldByName('SALDO').asFloat);
  end;
end;

procedure TFrmCtaCorrente.Grid_PesquisaDblClick(Sender: TObject);
begin    {
   if (JvQry_Pes.Active) and (JvQry_Pes.Recordcount > 0) then
   begin
      PageCadastro.ActivePageIndex := 0;
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
   end; }
end;

procedure TFrmCtaCorrente.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmCtaCorrente.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   Edit_BancoExit(Self);
   PanelSaldo.Caption := '0,00';
   BtnInclui.SetFocus;
end;

procedure TFrmCtaCorrente.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
{
   Proc.database := frmprincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_CTACORRENTE');

   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;

   JvQry_Saldos.Database := FrmPrincipal.base;
   JvQry_Saldos.Transaction := FrmPrincipal.Transaction;
   JvQry_Saldos.SQL.Clear;
   JvQry_Saldos.SQL.Add('Select * From SLDCTACORRENTE where Conta = :aConta order by CONTA, DT_SALDO');}

   Campo1.Text := '0';
   BtnInclui.SetFocus;
end;

procedure TFrmCtaCorrente.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI, vOrdem : String;
begin
   vSelect := '';
   vSelect := vSelect + ' SELECT BANCOS.NOMEBANCO, CTACORRENTE.CODIGO, CTACORRENTE.BANCO, CTACORRENTE.CTA_CORR, ';
   vSelect := vSelect + ' CTACORRENTE.NOME_COR, CTACORRENTE.CONTATO, CTACORRENTE.FONE, ';
   vSelect := vSelect + ' (SELECT SALDO FROM SLDCTACORRENTE WHERE SLDCTACORRENTE.CONTA = CTACORRENTE.CODIGO AND DT_SALDO = (SELECT MAX(SLDCTACORRENTE.DT_SALDO) FROM SLDCTACORRENTE WHERE SLDCTACORRENTE.CONTA = CTACORRENTE.CODIGO)) SALDO ';
   vSelect := vSelect + ' FROM CTACORRENTE ';
   vSelect := vSelect + ' INNER JOIN BANCOS ON (CTACORRENTE.BANCO = BANCOS.CODIGO) ';
   
   CRI := '';

   //Codigo
   If (Length(Trim(Edit_PCodigo.Text)) > 0) and (StrToIntZero(Edit_PCodigo.Text) > 0) then
   begin
      CRI := CRI + ' and CTACORRENTE.CODIGO = '+ Trim(Edit_PCodigo.Text) + ' ';
   end;
   //Conta Corrente
   If Length(Trim(EditP_Cta_Corr.Text)) > 0 then
   begin
      CRI := CRI + ' and Cta_Corr = '+ EditP_Cta_Corr.Text + ' ';
   end;
   //Banco
   If (Length(Trim(EditP_Banco.Text)) > 0) and (StrToIntZero(EditP_Banco.Text) > 0) then
   begin
      CRI := CRI + ' and Banco = '+ Trim(EditP_Banco.Text) + ' ';
   end;

   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vOrdem := '';
   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + vOrdem;

   Datasource1.DataSet := nil;
   Grid_Pesquisa.DataSource := nil;
        {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and not (JvQry_Pes.BOF and JvQry_Pes.EOF) then
   begin
      Datasource1.DataSet := JvQry_Pes;
      Grid_Pesquisa.DataSource := Datasource1;
   end;}
end;

procedure TFrmCtaCorrente.BtnExcluiClick(Sender: TObject);
var vSelect : String;
//    JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin
{      vSelect := '';
      vSelect := vSelect + ' SELECT CODIGO, BANCO, CTA_CORR, NOME_COR, CONTATO, FONE, (SELECT SALDO FROM SLDCTACORRENTE ';
      vSelect := vSelect + ' WHERE CONTA = CTACORRENTE.CODIGO AND DT_SALDO = (SELECT MAX(SLDCTACORRENTE.DT_SALDO) FROM SLDCTACORRENTE)) SALDO ';
      vSelect := vSelect + ' FROM CTACORRENTE WHERE CODIGO = '+ Trim(Campo1.Text);
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta(vSelect, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão da conta corrente "'+ Edit_Cta_Corr.Text +'"?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               FrmPrincipal.LimpaCampos(self,1);
               Edit_BancoExit(Self);
               PanelSaldo.Caption := '0,00';
            end;
            Operacao := opBrowse;
         end
         else
         begin
            MessageDlg('Conta Corrente "'+ Edit_Cta_Corr.Text +'" não encontrada.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
            Edit_BancoExit(Self);
            PanelSaldo.Caption := '0,00';
         end;
         BtnInclui.SetFocus;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;   }
   end;
end;

procedure TFrmCtaCorrente.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmCtaCorrente.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   EditP_BancoExit(Self);
   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
 //  JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmCtaCorrente.Edit_BancoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Banco.Text)) <> 0) and (Trim(Edit_Banco.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from Bancos where Codigo='+ Edit_Banco.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelBanco.Caption := 'Agência ' + JvQuery.FieldByName('CODAGENCIA').asString + ' - ' + JvQuery.FieldByName('NOMEAGENCIA').asString;
            PanelBanco2.Caption := JvQuery.FieldByName('CODBANCO').asString + ' - ' + JvQuery.FieldByName('NOMEBANCO').asString;
         end
         else
         begin
            MessageDlg('Banco não cadastrado.',mtInformation,[mbOK],0);
            PanelBanco.Caption := '';
            PanelBanco2.Caption := '';
            Edit_Banco.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Banco.Text := '0';
      PanelBanco.Caption := '';
      PanelBanco2.Caption := '';
   end;
end;

procedure TFrmCtaCorrente.F3_bancoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from Bancos order by Codigo';
      FrmPesquisa.Indice_Inicial := 'CODBANCO';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Bancos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
        // Edit_Banco.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_BancoExit(Self);
         Edit_Banco.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCtaCorrente.F3P_BancoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from Bancos order by Codigo';
      FrmPesquisa.Indice_Inicial := 'CODBANCO';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Bancos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
      ///   EditP_Banco.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         EditP_BancoExit(Self);
         EditP_Banco.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCtaCorrente.EditP_BancoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(EditP_Banco.Text)) <> 0) and (Trim(EditP_Banco.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from Bancos where Codigo='+ EditP_Banco.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPBanco.Caption := 'Agência ' + JvQuery.FieldByName('CODAGENCIA').asString + ' Banco ' + JvQuery.FieldByName('CODBANCO').asString + ' - ' + JvQuery.FieldByName('NOMEBANCO').asString;
         end
         else
         begin
            MessageDlg('Banco não cadastrado.',mtInformation,[mbOK],0);
            PanelPBanco.Caption := '';
            EditP_Banco.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      EditP_Banco.Text := '0';
      PanelPBanco.Caption := '';
   end;
end;

procedure TFrmCtaCorrente.Action1Execute(Sender: TObject);
begin
   if Edit_Banco.Focused then
      F3_bancoClick(self)
   else if EditP_Banco.Focused then
      F3P_BancoClick(self);
end;

procedure TFrmCtaCorrente.PageCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmCtaCorrente.PageCadastroChange(Sender: TObject);
begin
   if PageCadastro.ActivePageIndex = 0 then
   begin
      BtnInclui.Enabled := True;
      BtnExclui.Enabled := True;
      BtnGrava.Enabled := True;
      BtnCancelar.Enabled := True;
   end
   else
   begin
      BtnInclui.Enabled := False;
      BtnExclui.Enabled := False;
      BtnGrava.Enabled := False;
      BtnCancelar.Enabled := False;
      if StrToIntZero(Campo1.Text) > 0 then
      begin
{         Screen.Cursor := crHourGlass;
         try
            Src_Saldos.DataSet := nil;
            Grid_Saldos.DataSource := nil;
            JvQry_Saldos .Close;
            JvQry_Saldos.Params.ByNameAsInteger['aConta'] := StrToIntZero(Campo1.Text);
            JvQry_Saldos.Open;
            FormatNumericFields(JvQry_Saldos);
            if (JvQry_Saldos.Active) and (JvQry_Saldos.RecordCount > 0) then
            begin
               Src_Saldos.DataSet := JvQry_Saldos;
               Grid_Saldos.DataSource := Src_Saldos;
               JvQry_Saldos.Last;
            end;
         finally
            Screen.Cursor := crDefault;
         end; }
      end;
   end;
end;

procedure TFrmCtaCorrente.Campo1Exit(Sender: TObject);
var vSelect : String;
 //   JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin    {
      vSelect := vSelect + ' SELECT CODIGO, BANCO, CTA_CORR, NOME_COR, CONTATO, FONE, (SELECT SALDO FROM SLDCTACORRENTE ';
      vSelect := vSelect + ' WHERE CONTA = CTACORRENTE.CODIGO AND DT_SALDO = (SELECT MAX(SLDCTACORRENTE.DT_SALDO) FROM SLDCTACORRENTE)) SALDO ';
      vSelect := vSelect + ' FROM CTACORRENTE WHERE CODIGO = '+ Trim(Campo1.Text);

      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta(vSelect,JvQuery) then Exit;
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

procedure TFrmCtaCorrente.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('CtasCorrente',IBQry_Pes);
end;

initialization
   {$i uctacorrente.lrs}

end.
