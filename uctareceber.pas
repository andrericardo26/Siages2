unit UCtaReceber;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db,
  DBCtrls, ActnList, Menus, LResources, MaskEdit, LCLType;
                    

type

  { TFrmCtaReceber }

  TFrmCtaReceber = class(TForm)
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BtnExcluiPesq: TBitBtn;
    BtnEditar: TBitBtn;
    BtnIncluiPesq: TBitBtn;
    BtnLimpa1: TBitBtn;
    BtnSairPes1: TBitBtn;
    ComboCampo: TComboBox;
    ComboCampo_Ord: TComboBox;
    ComboOper: TComboBox;
    Combo_PCategoria: TComboBox;
    Combo_PSubCategoria: TComboBox;
    EditConteudo: TEdit;
    EditP_Cliente: TEdit;
    EditP_Controle: TEdit;
    EditP_Nosso_Nro: TEdit;
    EditP_Nro_Nota: TEdit;
    EditP_Ser_Nota: TEdit;
    Edit_Controle_Banc: TEdit;
    Edit_Controle_Caixa: TEdit;
    Edit_Cta_Corr: TEdit;
    Edit_Documento_Banc: TEdit;
    Edit_Documento_Caixa: TEdit;
    Edit_Nro_Nota_Banc: TEdit;
    Edit_Nro_Nota_Caixa: TEdit;
    Edit_PDocumento: TEdit;
    Edit_Recibo_Banc: TEdit;
    Edit_Recibo_Caixa: TEdit;
    Edit_Ser_Nota_Banc: TEdit;
    Edit_Ser_Nota_Caixa: TEdit;
    Edit_Total_Banco: TEdit;
    Edit_Total_Caixa: TEdit;
    Edit_Vl_Desconto_Banc: TEdit;
    Edit_Vl_Desconto_Caixa: TEdit;
    Edit_Vl_Juros_Banc: TEdit;
    Edit_Vl_Juros_Caixa: TEdit;
    Edit_Vl_Parc_Banc: TEdit;
    Edit_Vl_Parc_Caixa: TEdit;
    F3P_Cliente: TSpeedButton;
    F3_CtaRec_Banc: TSpeedButton;
    F3_CtaRec_Caixa: TSpeedButton;
    F3_Cta_Corr: TSpeedButton;
     Grid_Pesquisa: TdbGrid;
     Datasource1: TDatasource;
     DBGrid_Rec_Banco: TdbGrid;
     DBGrid_Rec_Caixa: TdbGrid;
     Edit_Documento: TEdit;
     Edit_Valor: TEdit;
     Edit_Controle: TEdit;
     Edit_Cliente: TEdit;
     Edit_Banco: TEdit;              {
    JvQry_Pes: TJvUIBDataSet;
    JvQry_Banc_Rec: TJvUIBDataSet;
    JvQry_Parc_Rec: TJvUIBDataSet;
    JvQry_CatSubCat: TJvUIBDataSet; }
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label9: TLabel;
    LabelNominal: TLabel;
    LabelJuros: TLabel;
    LabelDescontos: TLabel;
    LabelSaldo: TLabel;
    Lbl_Status: TLabel;
    ListCriterios: TListBox;
    ListOrdem: TListBox;
    MskP_Data: TMaskEdit;
    MskP_Vencto: TMaskEdit;
    Msk_Dt_Pagto_Banc: TMaskEdit;
    Msk_Dt_Pagto_Caixa: TMaskEdit;
    PageControl: TPageControl;
    Paginas: TPageControl;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PanelCod_Banco: TPanel;
    PanelCod_Cli_Banc: TPanel;
    PanelCod_Cli_Caixa: TPanel;
    PanelCta_Corr: TPanel;
    PanelNome_Banco: TPanel;
    PanelNome_Cli_Banc: TPanel;
    PanelNome_Cli_Caixa: TPanel;
    PanelPCliente: TPanel;
{    Proc_Ctarec: TJvUIBQuery;
    Proc_RecBanco: TJvUIBQuery;
    Proc_RecCaixa: TJvUIBQuery;   }
    RB_Cresc: TRadioButton;
    RB_Decresc: TRadioButton;
    RG_Quitado: TRadioGroup;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    Panel12: TPanel;
    Panel13: TPanel;
    PageCadastro: TPageControl;
    TabCtaRec: TTabSheet;
    Panel9: TPanel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    F3_Cliente: TSpeedButton;
    Label1: TLabel;
    F3_Nota: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Edit_Nro_Nota: TEdit;
    Edit_Ser_Nota: TEdit;
    Panel6: TPanel;
    Combo_Categoria: TComboBox;
    Combo_SubCategoria: TComboBox;
    TabRec_Banc: TTabSheet;
    Panel10: TPanel;
    TabRec_Caixa: TTabSheet;
    Panel11: TPanel;
    TabPesquisa: TTabSheet;
    Panel1: TPanel;
    Panel4: TPanel;
    BtnAtualiza: TBitBtn;
    PanelBanco: TPanel;
    F3_Banco: TSpeedButton;
    Label2: TLabel;
    PanelCliente: TPanel;
    Label5: TLabel;
    Edit_Cheque_Nro: TEdit;
    Label6: TLabel;
    Edit_Emitente: TEdit;
    Edit_Nosso_Nro: TEdit;
    Msk_Data: TMaskEdit;
    Msk_VencTo: TMaskEdit;
    Memo_Observacao: TMemo;
    NaoLimpar: TCheckBox;
    Src_Banc_Rec: TDataSource;
    Src_Caixa_Rec: TDataSource;
    Panel5: TPanel;
    Btn_Recibo: TBitBtn;
 //   PrintFast1: TPrintFast;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Panel_Tot_Aberto: TPanel;
    Panel_Tot_Atrazo: TPanel;
    Panel_Tot_Juros: TPanel;
    Panel_Atrazo_Juros: TPanel;
    Btn_Quit_Mult: TBitBtn;
    Tab_Ordem: TTabSheet;
    Tab_PesAvanca: TTabSheet;
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExclui1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Combo_CategoriaDropDown(Sender: TObject);
    procedure Combo_PCategoriaDropDown(Sender: TObject);
    procedure DBGrid_Rec_Banco1DblClick(Sender: TObject);
    procedure EditP_ClienteKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_BancoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_ClienteKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Cta_CorrKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_DocumentoExit(Sender: TObject);
    procedure Edit_Documento_BancKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Documento_CaixaKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Nro_NotaKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    // procedure Carrega_Parametros(Proc : TJvUIBQuery);
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaDblClick(Sender: TObject);

       procedure Grid_PesquisaPrepareCanvas(sender: TObject; Col, Row: Integer; aState: TGridDrawState);
       procedure ListOrdemClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    Procedure Carrega_Categorias;
    Procedure Carrega_SubCategorias(aCategoria: String; oCombo: TComboBox);
    procedure FormActivate(Sender: TObject);
    procedure Combo_SubCategoriaDropDown(Sender: TObject);
    procedure Combo_PCategoriaChange(Sender: TObject);
    procedure Combo_PSubCategoriaDropDown(Sender: TObject);
    procedure PageCadastroChange(Sender: TObject);
    procedure Edit_ClienteExit(Sender: TObject);
    procedure Msk_DataEnter(Sender: TObject);
    procedure Msk_DataExit(Sender: TObject);
    procedure Edit_BancoExit(Sender: TObject);
    procedure F3_NotaClick(Sender: TObject);
    procedure F3_ClienteClick(Sender: TObject);
    procedure F3_BancoClick(Sender: TObject);
    procedure Edit_Nro_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Nro_NotaExit(Sender: TObject);
    Procedure Limpa_Labels;
    procedure PageCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    Procedure Carrega_Pagamentos_Caixa(oControle: Integer; oDocumento : String);
    Procedure Carrega_Pagamentos_Banco(oControle: Integer; oDocumento : String);
    procedure Edit_Cta_CorrExit(Sender: TObject);
    procedure F3_Cta_CorrClick(Sender: TObject);
    procedure DBGrid_Rec_BancoDblClick(Sender: TObject);
    procedure Edit_Documento_BancExit(Sender: TObject);
    procedure Edit_Documento_CaixaExit(Sender: TObject);
    procedure DBGrid_Rec_CaixaDblClick(Sender: TObject);
    procedure EditP_Nro_NotaExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure EditP_ClienteExit(Sender: TObject);
    procedure F3P_ClienteClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure F3_CtaRec_BancClick(Sender: TObject);
    procedure F3_CtaRec_CaixaClick(Sender: TObject);
    procedure Btn_ReciboClick(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure Calcula_Juros_Caixa;
    procedure Calcula_Juros_Banco;
    procedure Msk_Dt_Pagto_CaixaChange(Sender: TObject);
    procedure Msk_Dt_Pagto_BancChange(Sender: TObject);
    procedure Calcula_Total_Banco;
    procedure Calcula_Total_Caixa;
    procedure Edit_Vl_Parc_BancChange(Sender: TObject);
    procedure Edit_Vl_Parc_CaixaChange(Sender: TObject);
    procedure Btn_Quit_MultClick(Sender: TObject);
    procedure Edit_Vl_Parc_CaixaExit(Sender: TObject);
    procedure Edit_Vl_Parc_BancExit(Sender: TObject);
    procedure Imprime_Recibo;
    procedure SetStatus(Status: String);

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
  FrmCtaReceber: TFrmCtaReceber;
  vSelect_Quit : String;

implementation

uses UPrincipal, Global, UConsulta, UVariaveis, UQuit_Mult_Ctas;

procedure TFrmCtaReceber.SetStatus(Status: String);
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

procedure TFrmCtaReceber.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case vOper of
       opInsert : begin
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnSair.Enabled := False;
                     case PageCadastro.ActivePageIndex of
                        0: begin
                              Edit_Nro_Nota.Enabled := True;
                              Edit_Ser_Nota.Enabled := True;
                              F3_Nota.Enabled := True;
                              Edit_Documento.Enabled := True;
                              NaoLimpar.Enabled := True;
                           end;
                        1: Begin
                              Edit_Recibo_Banc.Enabled := True;
                              Btn_Recibo.Enabled := False;
                           end;
                        2: begin
                              Edit_Recibo_Caixa.Enabled := True;
                              Btn_Recibo.Enabled := False;
                           end;
                     end;
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     case PageCadastro.ActivePageIndex of
                        0: begin
                              Edit_Nro_Nota.Enabled := False;
                              Edit_Ser_Nota.Enabled := False;
                              F3_Nota.Enabled := False;
                              Edit_Documento.Enabled := False;
                              NaoLimpar.Enabled := False;
                           end;
                        1: Begin
                              Edit_Recibo_Banc.Enabled := False;
                              Btn_Recibo.Enabled := True;
                           end;
                        2: begin
                              Edit_Recibo_Caixa.Enabled := False;
                              Btn_Recibo.Enabled := True;
                           end;
                     end;
                  end;
    end;
  end;
end;


procedure TFrmCtaReceber.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmCtaReceber.BtnEditarClick(Sender: TObject);
begin
  Grid_PesquisaDblClick(self);
end;

procedure TFrmCtaReceber.BtnExclui1Click(Sender: TObject);
begin
  PageCadastro.ActivePageIndex := 0;
//  Carrega_Campos(JvQry_Pes);
  BtnExcluiClick(self);
  BtnAtualizaClick(self);
end;

procedure TFrmCtaReceber.Combo_CategoriaDropDown(Sender: TObject);
begin
   if (Sender as TComboBox).Text = '' then
   begin
      (Sender as TComboBox).ItemIndex := 0;
   end;
end;

procedure TFrmCtaReceber.Combo_PCategoriaDropDown(Sender: TObject);
begin

end;

procedure TFrmCtaReceber.DBGrid_Rec_Banco1DblClick(Sender: TObject);
begin

end;

procedure TFrmCtaReceber.EditP_ClienteKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3P_ClienteClick(self);
end;

procedure TFrmCtaReceber.Edit_BancoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_BancoClick(self);
end;

procedure TFrmCtaReceber.Edit_ClienteKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_ClienteClick(self);
end;

procedure TFrmCtaReceber.Edit_Cta_CorrKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_Cta_CorrClick(self);
end;

procedure TFrmCtaReceber.Edit_DocumentoExit(Sender: TObject);
begin

end;

procedure TFrmCtaReceber.Edit_Documento_BancKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_CtaRec_BancClick(self);
end;

procedure TFrmCtaReceber.Edit_Documento_CaixaKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_CtaRec_CaixaClick(self);
end;

procedure TFrmCtaReceber.Edit_Nro_NotaKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_NotaClick(self);
end;

procedure TFrmCtaReceber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //Grava campos da ordem e pesquisa
   ListOrdem.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'ord_ctareceber.dat');
   ListCriterios.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'cri_ctareceber.dat');
   Action := caFree;
end;

procedure TFrmCtaReceber.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmCtaReceber.BtnIncluiClick(Sender: TObject);
begin
   Paginas.ActivePageIndex := 0;
   Operacao := opInsert;
   SetStatus('Inserção');
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(Self,1);
            Limpa_Labels;
            Edit_ClienteExit(Self);
            Msk_DataExit(Msk_Data);
            Msk_DataExit(Msk_VencTo);
            Edit_BancoExit(Self);
//            Edit_Controle.Text := IntToStr(FrmPrincipal.Busca_Controle('Gen_Controle'));
            Edit_Nro_Nota.SetFocus;
         end;
      1: Begin
            FrmPrincipal.LimpaCampos(Self,3);
            Msk_DataExit(Msk_Dt_Pagto_Banc);
            Edit_Cta_CorrExit(Self);
            Edit_Documento_BancExit(Self);
            if StrToIntZero(Edit_Controle_Banc.Text) > 0 then
            begin
               Edit_Recibo_Banc.SetFocus;
               if StrToFloat(TirarPonto(LabelSaldo.Caption)) > 0 then
                  Edit_Vl_Parc_Banc.Text := TirarPonto(LabelSaldo.Caption);
               Msk_DataEnter(Msk_Dt_Pagto_Banc);
               Msk_Dt_Pagto_Banc.Text := DateToStr(Date);
               Msk_DataExit(Msk_Dt_Pagto_Banc);
            end
            else
            begin
               Edit_Nro_Nota_Banc.Text := '';
               Edit_Ser_Nota_Banc.Text := '';
               Edit_Controle_Banc.Text := '0';
               Edit_Documento_Banc.SetFocus;
            end;
         end;
      2: begin
            FrmPrincipal.LimpaCampos(Self,4);
            Msk_DataExit(Msk_Dt_Pagto_Caixa);
            Edit_Documento_CaixaExit(Self);
            if StrToIntZero(Edit_Controle_Caixa.Text) > 0 then
            begin
               Edit_Recibo_Caixa.SetFocus;
               if StrToFloat(TirarPonto(LabelSaldo.Caption)) > 0 then
                  Edit_Vl_Parc_Caixa.Text := TirarPonto(LabelSaldo.Caption);
               Msk_DataEnter(Msk_Dt_Pagto_Caixa);
               Msk_Dt_Pagto_Caixa.Text := DateToStr(Date);
               Msk_DataExit(Msk_Dt_Pagto_Caixa);
            end
            else
            begin
               Edit_Nro_Nota_Caixa.Text := '';
               Edit_Ser_Nota_Caixa.Text := '';
               Edit_Controle_Caixa.Text := '0';
               Edit_Documento_Caixa.SetFocus;
            end;
         end;
   end;
end;

procedure TFrmCtaReceber.BtnGravaClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   Case PageCadastro.ActivePageIndex of
      0: begin
            //Nota
            if Length(Trim(Edit_Nro_Nota.Text)) > 0 then
            begin
               if not ValInteger(Edit_Nro_Nota.Text) then
               begin
                  MessageDlg('Nota Fiscal deve ser número inteiro válido.', mtInformation,[mbOK],0);
                  Edit_Nro_Nota.SetFocus;
                  Exit;
               end;
            end;

            //Documento
            if Length(Trim(Edit_Documento.Text)) > 0 then
            begin
               if Operacao = opInsert then
               begin
                  //Procura para ver se esse DOCUMENTO ja foi cadastrado
               {   JvQuery := TJvUIBDataset.Create(self);
                  try
                     JvQuery.Database := FrmPrincipal.Base;
                     JvQuery.Transaction := FrmPrincipal.Transaction;
                     if not FrmPrincipal.RodaConsulta('Select * from CTASRECEBER where DOCUMENTO='''+ Edit_Documento.Text +'''',JvQuery) then Exit;
                     if JvQuery.RecordCount > 0 then
                     begin
                        //keybd_event(39,0,0,0);
                        if MessageDlg('O DOCUMENTO "'+ Edit_Documento.Text +'" já está cadastrado nas Contas a Receber.'+ #13 +
                                   'Nota Fiscal : ' + JvQuery.FieldByName('NRO_NOTA').asString + ' ' + JvQuery.FieldByName('SER_NOTA').asString + '         Controle : ' +  JvQuery.FieldByName('CONTROLE').asString + #13 +
                                   'Deseja localizar e carregar o documento "'+ JvQuery.FieldByName('DOCUMENTO').asString +'" já cadastrado ("SIM") ou continuar com a inclusão de um novo registro ("NÃO") ?',
                                   mtWarning,[mbYes, mbNo],0) = mrYes then
                        begin
                           SetStatus('Edição');
                           Operacao := opBrowse;
                           Carrega_Campos(JvQuery);
                        end;
                     end;
                  finally
                     JvQuery.Close;
                     JvQuery.Free;
                  end;  }
               end;
            end
            else
            begin
               MessageDlg('Documento deve ser preenchido.', mtInformation,[mbOK],0);
               Edit_Documento.SetFocus;
               Exit;
            end;
            //Vencimento
            if not ValiData(Msk_VencTo.Text) then
            begin
               MessageDlg('Vencimento deve ser preenchido.', mtInformation,[mbOK],0);
               Msk_VencTo.SetFocus;
               Exit;
            end;
            //Data
            if not ValiData(Msk_Data.Text) then
            begin
               MessageDlg('Data deve ser preenchido.', mtInformation,[mbOK],0);
               Msk_Data.SetFocus;
               Exit;
            end;
            //Valor
            if (StrToFloatZero(Edit_Valor.Text) <= 0) or (Trim(Edit_Valor.Text) = '0') then
            begin
               MessageDlg('Valor deve ser maior que zero.', mtInformation,[mbOK],0);
               Edit_Valor.SetFocus;
               Exit;
            end;         
            //Categoria
            if Length(Trim(Combo_Categoria.Text)) = 0 then
            begin
               MessageDlg('Categoria deve ser preenchida.', mtInformation,[mbOK],0);
               Combo_Categoria.SetFocus;
               Exit;
            end;
            //SubCategoria
            if Length(Trim(Combo_SubCategoria.Text)) = 0 then
            begin
               MessageDlg('SubCategoria deve ser preenchida.', mtInformation,[mbOK],0);
               Combo_SubCategoria.SetFocus;
               Exit;
            end;
         end;
      1: begin
            //Conta a Receber
            if StrToIntZero(Edit_Controle_Banc.Text) = 0 then
            begin
               MessageDlg('Documento deve ser preenchida.', mtInformation,[mbOK],0);
               Edit_Documento_Banc.SetFocus;
               Exit;
            end;
            //Recibo
            if Length(Trim(Edit_Recibo_Banc.Text)) = 0 then
            begin
               MessageDlg('Recibo deve ser preenchido.', mtInformation,[mbOK],0);
               if Edit_Recibo_Banc.Enabled then Edit_Recibo_Banc.SetFocus;
               Exit;
            end;
            //Data pagamento
            if not ValiData(Msk_Dt_Pagto_Banc.Text) then
            begin
               MessageDlg('Data Pagamento deve ser uma data válida.', mtInformation,[mbOK],0);
               Msk_Dt_Pagto_Banc.SetFocus;
               Exit;
            end;
            //Conta Corrente
            if StrToInt(Edit_Cta_Corr.Text) = 0 then
            begin
               MessageDlg('Conta Corrente deve ser preenchida.', mtInformation,[mbOK],0);
               Edit_Cta_Corr.SetFocus;
               Exit;
            end;
         end;
      2: begin
            //Conta a Receber
            if StrToIntZero(Edit_Controle_Caixa.Text) = 0 then
            begin
               MessageDlg('Documento deve ser preenchida.', mtInformation,[mbOK],0);
               Edit_Documento_Caixa.SetFocus;
               Exit;
            end;
            //Recibo
            if Length(Trim(Edit_Recibo_Caixa.Text)) = 0 then
            begin
               MessageDlg('Recibo deve ser preenchido.', mtInformation,[mbOK],0);
               if Edit_Recibo_Caixa.Enabled then Edit_Recibo_Caixa.SetFocus;
               Exit;
            end;
            //Data pagamento
            if not ValiData(Msk_Dt_Pagto_Caixa.Text) then
            begin
               MessageDlg('Data Pagamento deve ser uma data válida.', mtInformation,[mbOK],0);
               Msk_Dt_Pagto_Caixa.SetFocus;
               Exit;
            end;
         end;
   end;
   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   if PageCadastro.ActivePageIndex = 0 then
   begin
//      Carrega_Parametros(Proc_Ctarec);
//      FrmPrincipal.RodaSP(Proc_Ctarec);
   end
   else
   begin
      if PageCadastro.ActivePageIndex = 1 then
      begin
//         Carrega_Parametros(Proc_RecBanco);
//         FrmPrincipal.RodaSP(Proc_RecBanco);
      end
      else
      begin
//         Carrega_Parametros(Proc_RecCaixa);
//         FrmPrincipal.RodaSP(Proc_RecCaixa);
      end;
   end;
   Operacao := opBrowse;
   SetStatus('Edição');
   BtnAtualizaClick(Self);
   //Se esta Marcada Inclusao Persistente
   Case PageCadastro.ActivePageIndex of
      0: begin
            if NaoLimpar.Checked then
            begin
               SetStatus('Inserção');
               Operacao := opInsert;
//               Edit_Controle.Text := IntTostr(FrmPrincipal.Busca_Controle('Gen_Controle'));
               Edit_Nro_Nota.SetFocus;
            end
            else
            begin     {
               JvQuery := TJvUIBDataset.Create(self);
               try
                  JvQuery.Database := FrmPrincipal.Base;
                  JvQuery.Transaction := FrmPrincipal.Transaction;

                  if FrmPrincipal.RodaConsulta('Select * from CtasReceber where Controle = '+ Trim(Edit_Controle.Text) +' and Documento = '''+ Edit_Documento.Text +'''',JvQuery) then
                     Carrega_Campos(JvQuery);
               finally
                  JvQuery.Close;
                  JvQuery.Free;
               end;  }
               BtnInclui.SetFocus;
            end;
         end;
      1: begin
            Edit_Documento_BancExit(Self);
            BtnInclui.SetFocus;
         end;
      2: begin
            Edit_Documento_CaixaExit(Self);
            BtnInclui.SetFocus;
         end;
   end;
end;
{
procedure TFrmCtaReceber.Carrega_Parametros(Proc : TJvUIBQuery);
begin
   with Proc do
   begin
      case PageCadastro.ActivePageIndex of
        0: begin
              Params.ByNameAsInteger['POPER'] := Operacao;
              Params.ByNameAsInteger['PCONTROLE'] := StrToInt(Edit_Controle.Text);
              Params.ByNameAsString['PDOCUMENTO'] := Edit_Documento.Text;
              Params.ByNameAsString['PNRO_NOTA'] := Edit_Nro_Nota.Text;
              Params.ByNameAsString['PSER_NOTA'] := Edit_Ser_Nota.Text;
              Params.ByNameAsString['PCOD_CLIENTE'] := Edit_Cliente.Text;
              if Msk_Data.Text <> '' then
                 Params.ByNameAsString['PDATA'] := Msk_Data.Text;
              if Msk_VencTo.Text <> '' then
                 Params.ByNameAsString['PVENCTO'] := Msk_VencTo.Text;
              Params.ByNameAsCurrency['PVALOR'] := StrToFloatZero(Edit_Valor.Text);
              Params.ByNameAsString['POBSERVACAO'] := Memo_Observacao.Lines.Text;
              Params.ByNameAsString['PCATEGORIA'] := Combo_Categoria.Items[Combo_Categoria.ItemIndex];
              Params.ByNameAsString['PSUBCATEGO'] := Combo_SubCategoria.Items[Combo_SubCategoria.ItemIndex];
              Params.ByNameAsString['PNOSSO_NRO'] := Edit_Nosso_Nro.Text;
              if StrToInt(Edit_Banco.Text) <> 0 then
                 Params.ByNameAsInteger['PBANCO'] := StrToInt(Edit_Banco.Text)
              else
                 Params.ByNameIsNull['PBANCO'] := True;
              Params.ByNameAsString['PCHEQUE_NRO'] := Edit_Cheque_Nro.Text;
              Params.ByNameAsString['PEMITENTE'] := Edit_Emitente.Text;
           end;
        1: begin
              Params.ByNameAsInteger['POPER'] := Operacao;
              Params.ByNameAsInteger['PCONTROLE']:= StrToIntZero(Edit_Controle_Banc.Text);
              Params.ByNameAsString['PDOCUMENTO'] := Edit_Documento_Banc.Text;
              Params.ByNameAsString['PNOSSO_NRO'] := Edit_Recibo_Banc.Text;
              Params.ByNameAsInteger['PCTA_CORR'] := StrToIntZero(Edit_Cta_Corr.Text);
              if Msk_Dt_Pagto_Banc.Text <> '' then
                 Params.ByNameAsString['PDT_PAGTO'] := Msk_Dt_Pagto_Banc.Text;
              Params.ByNameAsCurrency['PVL_PARC'] := StrToFloatZero(Edit_Vl_Parc_Banc.Text);
              Params.ByNameAsCurrency['PVL_JUROS'] := StrToFloatZero(Edit_Vl_Juros_Banc.Text);
              Params.ByNameAsCurrency['PVL_DESCONTO'] := StrToFloatZero(Edit_Vl_Desconto_Banc.Text);
           end;
        2: begin
              Params.ByNameAsInteger['POPER'] := Operacao;
              Params.ByNameAsInteger['PCONTROLE']:= StrToIntZero(Edit_Controle_Caixa.Text);
              Params.ByNameAsString['PDOCUMENTO'] := Edit_Documento_Caixa.Text;
              Params.ByNameAsString['PRECIBO'] := Edit_Recibo_Caixa.Text;
              if Msk_Dt_Pagto_Caixa.Text <> '' then
                 Params.ByNameAsString['PDT_PAGTO'] := Msk_Dt_Pagto_Caixa.Text;
              Params.ByNameAsCurrency['PVL_PARC'] := StrToFloatZero(Edit_Vl_Parc_Caixa.Text);
              Params.ByNameAsCurrency['PVL_JUROS'] := StrToFloatZero(Edit_Vl_Juros_Caixa.Text);
              Params.ByNameAsCurrency['PVL_DESCONTO'] := StrToFloatZero(Edit_Vl_Desconto_Caixa.Text);
           end;
      end;
   end;
end; }

procedure TFrmCtaReceber.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataSet do
   begin
      case PageCadastro.ActivePageIndex of
        0: begin
              Edit_Controle.Text := FieldByName('CONTROLE').asString;
              Edit_Nro_Nota.Text := FieldByName('NRO_NOTA').asString;
              Edit_Ser_Nota.Text := FieldByName('SER_NOTA').asString;
              Edit_Cliente.Text := FieldByName('COD_CLIENTE').AsString;
              Edit_ClienteExit(Self);
              Edit_Documento.Text := FieldByName('DOCUMENTO').AsString;
              Edit_Nosso_Nro.Text := FieldByName('NOSSO_NRO').AsString;
              //DATA
              Msk_DataEnter(Msk_Data);
              Msk_Data.Text := FieldByName('DATA').asString;
              Msk_DataExit(Msk_Data);
              //VENCIMENTO
              Msk_DataEnter(Msk_VencTo);
              Msk_VencTo.Text := FieldByName('VENCTO').asString;
              Msk_DataExit(Msk_VencTo);

              Edit_Valor.Text := FieldByName('VALOR').AsString;
              Combo_Categoria.ItemIndex := Combo_Categoria.Items.IndexOf(FieldByName('CATEGORIA').asString);
              Carrega_SubCategorias(Combo_Categoria.Items[Combo_Categoria.ItemIndex],Combo_SubCategoria);
              //Combo_SubCategoria.ItemIndex := Combo_SubCategoria.Items.IndexOf(FieldByName('SUBCATEGO').asString);
              Combo_SubCategoria.Text := FieldByName('SUBCATEGO').asString;
              Memo_Observacao.Lines.Text := FieldByName('OBSERVACAO').AsString;
              //CHEQUE PRE DATADO
              Edit_Banco.Text := FieldByName('BANCO').AsString;
              Edit_BancoExit(self);
              Edit_Cheque_Nro.Text := FieldByName('CHEQUE_NRO').AsString;
              Edit_Emitente.Text := FieldByName('EMITENTE').AsString;
              //SITUACAO
              LabelNominal.Caption := FormatFloat('#,###,##0.00',FieldByName('VL_PAGTO').asFloat);
              LabelJuros.Caption := FormatFloat('#,###,##0.00',FieldByName('VL_JUROS').asFloat);
              LabelDescontos.Caption := FormatFloat('#,###,##0.00',FieldByName('VL_DESCONTO').asFloat);
              LabelSaldo.Caption := FormatFloat('#,###,##0.00',FieldByName('VL_SALDO').asFloat);
           end;
        1: begin
              Edit_Controle_Banc.Text := FieldByName('CONTROLE').asstring;
              Edit_Documento_BancExit(Self);
              Edit_Recibo_Banc.Text := FieldByName('NOSSO_NRO').AsString;
              Edit_Cta_Corr.Text := FieldByName('CTA_CORR').AsString;
              Edit_Cta_CorrExit(Self);
              Msk_DataEnter(Msk_Dt_Pagto_Banc);
              Msk_Dt_Pagto_Banc.Text := FieldByName('DT_PAGTO').asString;
              Msk_DataExit(Msk_Dt_Pagto_Banc);
              Edit_Vl_Parc_Banc.Text := FieldByName('VL_PARC').AsString;
              Edit_Vl_Desconto_Banc.Text := FieldByName('VL_DESCONTO').AsString;
              Edit_Vl_Juros_Banc.Text := FieldByName('VL_JUROS').AsString;
           end;
        2: begin
              Edit_Controle_Caixa.Text := FieldByName('CONTROLE').AsString;
              Edit_Documento_CaixaExit(Self);
              Edit_Recibo_Caixa.Text := FieldByName('RECIBO').AsString;
              Msk_DataEnter(Msk_Dt_Pagto_Caixa);
              Msk_Dt_Pagto_Caixa.Text := FieldByName('DT_PAGTO').asString;
              Msk_DataExit(Msk_Dt_Pagto_Caixa);
              Edit_Vl_Parc_Caixa.Text := FieldByName('VL_PARC').AsString;
              Edit_Vl_Desconto_Caixa.Text := FieldByName('VL_DESCONTO').AsString;
              Edit_Vl_Juros_Caixa.Text := FieldByName('VL_JUROS').AsString;
           end;
      end;
   end;
end;

procedure TFrmCtaReceber.Grid_PesquisaDblClick(Sender: TObject);
begin            {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      PageCadastro.ActivePageIndex := 0;
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
      PageCadastroChange(Self);
      SetStatus('Edição');
   end;         }
end;

procedure TFrmCtaReceber.Grid_PesquisaPrepareCanvas(sender: TObject; Col, Row: Integer; aState: TGridDrawState);
begin           {
   if JvQry_Pes.Active then
   begin
      if JvQry_Pes.FieldByName('SALDO_JUROS').AsFloat > 0 then
      begin
         if JvQry_Pes.FieldByName('VENCTO').AsDateTime >= Date then
         begin
            Grid_Pesquisa.Canvas.Font.Color := clBlack;
            Grid_Pesquisa.Canvas.Brush.Color := clYellow;
         end
         else
         begin
            Grid_Pesquisa.Canvas.Font.Color := clWhite;
            Grid_Pesquisa.Canvas.Brush.Color := clRed;
         end;
      end
      else
      begin
         Grid_Pesquisa.Canvas.Font.Color := clBlack;
         Grid_Pesquisa.Canvas.Brush.Color := clWhite;
      end;
      if gdFocused in aState then
      begin
         Grid_Pesquisa.Canvas.Font.Color := clWhite;
         Grid_Pesquisa.Canvas.Brush.Color := clBlack;
      end;
      if gdFixed in aState then
      begin
         Grid_Pesquisa.Canvas.Font.Color := clblack;
         Grid_Pesquisa.Canvas.Brush.Color := clBtnFace;
      end;
   end;        }
end;

procedure TFrmCtaReceber.ListOrdemClick(Sender: TObject);
begin

end;

procedure TFrmCtaReceber.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmCtaReceber.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(Self,1);
            Limpa_Labels;
            Edit_ClienteExit(Self);
            Msk_DataExit(Msk_Data);
            Msk_DataExit(Msk_VencTo);
            Edit_BancoExit(Self);
         end;
      1: begin
            FrmPrincipal.LimpaCampos(Self,3);
            Edit_Cta_CorrExit(Self);
            Msk_DataExit(Msk_Dt_Pagto_Banc);
            Carrega_Pagamentos_Banco(StrToIntZero(Edit_Controle_Banc.Text), Edit_Documento_Banc.Text);
         end;
      2: begin
            FrmPrincipal.LimpaCampos(Self,4);
            Msk_DataExit(Msk_Dt_Pagto_Caixa);
            Carrega_Pagamentos_Caixa(StrToIntZero(Edit_Controle_Caixa.Text), Edit_Documento_Caixa.Text);
         end;
   end;
   BtnInclui.SetFocus;
end;

procedure TFrmCtaReceber.FormShow(Sender: TObject);
// var JvQuery : TJvUIBDataset;
var    I : Integer;
    vSelect : String;
begin
   //Top := 25; Left := 93;
   Operacao := opBrowse;
          {
   Proc_Ctarec.DataBase := FrmPrincipal.base;
   Proc_Ctarec.Transaction := FrmPrincipal.Transaction;
   Proc_Ctarec.BuildStoredProc('PROC_CTASRECEBER');
   
   Proc_RecCaixa .DataBase := FrmPrincipal.base;
   Proc_RecCaixa.Transaction := FrmPrincipal.Transaction;
   Proc_RecCaixa.BuildStoredProc('PROC_PARCRECEBER');

   Proc_RecBanco .DataBase := FrmPrincipal.base;
   Proc_RecBanco.Transaction := FrmPrincipal.Transaction;
   Proc_RecBanco.BuildStoredProc('PROC_BANCRECEBER');
   
   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;
   
   JvQry_CatSubCat.Database := FrmPrincipal.base;
   JvQry_CatSubCat.Transaction := FrmPrincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' Select Categorias.Nome Cat, ';
   vSelect := vSelect + ' Categorias.Tipo, ';
   vSelect := vSelect + ' SubCategorias.Nome Subcat ';
   vSelect := vSelect + ' from Subcategorias ';
   vSelect := vSelect + ' right join Categorias on Subcategorias.categoria = Categorias.Nome ';
   vSelect := vSelect + ' where Tipo = 0 ';
   vSelect := vSelect + ' order by Categorias.Nome, SubCategorias.Nome';
   //JvQry_CatSubCat.SQL.Add(vSelect);
   //JvQry_CatSubCat.Open;
   FrmPrincipal.RodaConsulta(vSelect,JvQry_CatSubCat);
   
   JvQry_Banc_Rec.Database := FrmPrincipal.base;
   JvQry_Banc_Rec.Transaction := FrmPrincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' Select * From BANCRECEBER where Controle = :oControle and Documento=:oDocumento ';
   JvQry_Banc_Rec.SQL.Add(vSelect);
      
      
   JvQry_Parc_Rec.Database := FrmPrincipal.base;
   JvQry_Parc_Rec.Transaction := FrmPrincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' Select * From ParcReceber where Controle = :oControle and Documento = :oDocumento ';
   JvQry_Parc_Rec.SQL.Add(vSelect);

   //Msk_DataMov.Text := '';
   //Edit_Reg.Value := 0;
   BtnInclui.SetFocus;
   Carrega_Categorias;
   PageCadastroChange(Self);
   //Carrega os Campos para Pesquisa
   JvQuery := TJvUIBDataset.Create(Self);
   Try
      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction;
      //JvQuery.SQL.Clear;
      //JvQuery.SQL.Add('Select * from CtasReceber where Controle is null ');
      //JvQuery.Open;
      FrmPrincipal.RodaConsulta('Select * from CtasReceber where Controle is null',JvQuery);
      ComboCampo.Items.Clear;
      ComboCampo_Ord.Items.Clear;
      For I := 0 to JvQuery.FieldCount-1 do
      begin
         if JvQuery.FieldDefs[I].DataType = ftString then
            ComboCampo.Items.Add(JvQuery.FieldDefs[I].Name + ' (S)')
         else
            ComboCampo.Items.Add(JvQuery.FieldDefs[I].Name);
         ComboCampo_Ord.Items.Add(JvQuery.FieldDefs[I].Name);
      end;
   except
      JvQuery.Close;
      JvQuery.Free;
   end;
         }
   //Juros
   {if Parametros.JUROS_DIARIO > 0 then
   begin                         
      Grid_Pesquisa.Columns[9].Visible := True;
      Grid_Pesquisa.Columns[9].Width := 75;
      Grid_Pesquisa.Columns[8].Visible := False;
   end
   else
   begin
      Grid_Pesquisa.Columns[8].Visible := True;
      Grid_Pesquisa.Columns[8].Width := 75;
      Grid_Pesquisa.Columns[9].Visible := False;
   end;}
   //Carregar campos da ordem e pesquisa
   Try
//      ListOrdem.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'ord_ctareceber.dat');
//      ListCriterios.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'cri_ctareceber.dat');
   except
   end;
   //BtnAtualizaClick(Self);
end;

procedure TFrmCtaReceber.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI, aOrdem : String;
    I : Integer;
//     JvQuery : TJvUIBDataset;
begin
   BtnExcluiPesq.enabled := false;
   BtnEditar.enabled := false;
   vSelect := '';
   vSelect := 'SELECT CTASRECEBER.CONTROLE, CTASRECEBER.DOCUMENTO, CTASRECEBER.NRO_NOTA, ';
   vSelect := vSelect + ' CTASRECEBER.SER_NOTA, CTASRECEBER.COD_CLIENTE, CLIENTES.NOME, CTASRECEBER.DATA, CTASRECEBER.VENCTO, ';
   vSelect := vSelect + ' CTASRECEBER.VALOR, CTASRECEBER.OBSERVACAO, CTASRECEBER.VL_PAGTO, CTASRECEBER.VL_JUROS, ';
   vSelect := vSelect + ' CTASRECEBER.VL_DESCONTO, CTASRECEBER.VL_SALDO, (SELECT OSALDO_JUROS FROM CALCULA_JUROS(CTASRECEBER.CONTROLE,CTASRECEBER.DOCUMENTO,CURRENT_DATE)) SALDO_JUROS, ';
   vSelect := vSelect + ' CTASRECEBER.CATEGORIA, CTASRECEBER.SUBCATEGO, ';
   vSelect := vSelect + ' CTASRECEBER.NOSSO_NRO, CTASRECEBER.BANCO, CTASRECEBER.CHEQUE_NRO, CTASRECEBER.EMITENTE ';
   vSelect := vSelect + ' FROM CTASRECEBER ';
   vSelect := vSelect + ' INNER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) ';

   CRI := '';

   //Nota
   If (Length(Trim(EditP_Nro_Nota.Text)) > 0) then
   begin
      CRI := CRI + ' and Nro_Nota = '''+ Trim(EditP_Nro_Nota.Text) +''' ';
   end;
   //Serie
   If Length(Trim(EditP_Ser_Nota.Text)) > 0 then
   begin
      CRI := CRI + ' and Ser_Nota = '''+ Trim(EditP_Ser_Nota.Text) +''' ';
      //CRI := CRI + ' and Upper(Nome) like Upper(''%'+ Trim(Edit_PNome.Text) +'%'')';
   end;
   //Controle
   If (Length(Trim(EditP_Controle.Text)) > 0) and (StrToInt(EditP_Controle.Text) > 0) then
   begin
      CRI := CRI + ' and Controle = '+ Trim(EditP_Controle.Text) +' ';
   end;
   //Documento
   If Length(Trim(Edit_PDocumento.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Documento) = '''+ Trim(Edit_PDocumento.Text) +''' ';
   end;
   //Nosso Numero
   If Length(Trim(EditP_Nosso_Nro.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Nosso_Nro) = '''+ Trim(EditP_Nosso_Nro.Text) +''' ';
   end;
   //Data
   if Trim(MskP_Data.Text) <> '' then
   begin
      if ValiData(MskP_Data.Text)then
      begin
         CRI := CRI + ' and Data = '''+ FormatDateTime('mm/dd/yyyy',StrToDate(MskP_Data.Text)) + ''' ';
      end
      else
      begin
         MessageDlg('Data inválida.',mtWarning,[mbOK],0);
         MskP_Data.SetFocus;
      end;
   end;

   //Vencimento
   if Trim(MskP_Vencto.Text) <> '' then
   begin
      if ValiData(MskP_Vencto.Text)then
      begin
         CRI := CRI + ' and VENCTO = '''+ FormatDateTime('mm/dd/yyyy',StrToDate(MskP_Vencto.Text)) + ''' ';
      end
      else
      begin
         MessageDlg('Data inválida.',mtWarning,[mbOK],0);
         MskP_Vencto.SetFocus;
      end;
   end;
   //Cliente
   if StrToInt(EditP_Cliente.Text) > 0 then
   begin
      CRI := CRI + ' and COD_CLIENTE = ' + EditP_Cliente.Text + ' ';
   end;

   //Categoria
   If Length(Trim(Combo_PCategoria.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(CATEGORIA) = Upper('''+ Combo_PCategoria.Text +''')';
   end;

   //SubCategoria
   If Length(Trim(Combo_PSubCategoria.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(SUBCATEGO) = Upper('''+ Combo_PSubCategoria.Text +''')';
   end;

   //Conta Paga
   if RG_Quitado.ItemIndex <> -1 then
   begin
      if RG_Quitado.ItemIndex = 0 then
         CRI := CRI + ' and VL_SALDO = 0'
      else
         CRI := CRI + ' and VL_SALDO <> 0';
   end;

   //Pesquisa Avançada
   if ListCriterios.Items.Count > 0 then
   begin
      For I := 0 to ListCriterios.Items.Count-1 do
      begin
         CRI := CRI + ' and ' + ListCriterios.Items[I];
      end;
   end;

   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   //Ordem
   aOrdem := ' order by ';
   if ListOrdem.Items.Count > 0 then
   begin
      For I := 0 to ListOrdem.Items.Count -1 do
      begin
         if Pos('Decrescente', ListOrdem.Items[I]) > 0 then
            aOrdem := aOrdem + ' ' + Copy(Trim(ListOrdem.Items[I]),1,Pos('Decrescente', ListOrdem.Items[I])-1) + ' DESC,'
         else
            aOrdem := aOrdem + ' ' + Copy(Trim(ListOrdem.Items[I]),1,Pos('Crescente', ListOrdem.Items[I])-1) + ' ASC,';
      end;
   end
   else
      aOrdem := aOrdem + ' Codigo,';

   if Pos('where',vSelect) = 0 then
      vSelect_Quit := vSelect + Copy(CRI, 6, Length(CRI)) + ' WHERE VL_SALDO > 0 AND VENCTO < CURRENT_DATE ORDER BY CTASRECEBER.VENCTO'
   else
      vSelect_Quit := vSelect + Copy(CRI, 6, Length(CRI)) + ' AND VL_SALDO > 0 AND VENCTO < CURRENT_DATE ORDER BY CTASRECEBER.VENCTO';


   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + Copy(aOrdem,1,Length(aOrdem)-1);

   Datasource1.DataSet := nil;
   Grid_Pesquisa.DataSource := nil;
   {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.Active = True) and (JvQry_Pes.RecordCount > 0) then
   begin
      BtnEditar.enabled := true;
      BtnExcluiPesq.enabled := true;
      Datasource1.DataSet := (JvQry_Pes as TDataSet);
      Grid_Pesquisa.DataSource := Datasource1;
      
      //Busca os totalizadores
      JvQuery := TJvUIBDataset.Create(self);
      try
         vSelect :=           ' SELECT ';
         vSelect := vSelect + ' SUM(CTASRECEBER.VL_SALDO) TOT_ABERTO, ';
         vSelect := vSelect + ' SUM((SELECT CTASRECEBER.VL_SALDO FROM RDB$DATABASE WHERE CTASRECEBER.VENCTO < CURRENT_DATE)) TOT_ATRAZO, ';
         vSelect := vSelect + ' SUM((SELECT OVLR_JUROS FROM CALCULA_JUROS(CTASRECEBER.CONTROLE,CTASRECEBER.DOCUMENTO,CURRENT_DATE))) TOT_JUROS ';
         vSelect := vSelect + ' FROM CTASRECEBER ';
         vSelect := vSelect + ' INNER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) ';

         if Length(Trim(CRI)) > 0 then
            vSelect := vSelect + ' WHERE ';

         vSelect := vSelect  + Copy(CRI, 6, Length(CRI));

         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         if not FrmPrincipal.RodaConsulta(vSelect,JvQuery) then Exit;
         Panel_Tot_Aberto.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_ABERTO').asFloat);
         Panel_Tot_Atrazo.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_ATRAZO').asFloat);
         Panel_Tot_Juros.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_JUROS').asFloat);
         Panel_Atrazo_Juros.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_ATRAZO').asFloat + JvQuery.FieldByName('TOT_JUROS').asFloat);

         if JvQuery.FieldByName('TOT_ATRAZO').asFloat > 0 then
            Btn_Quit_Mult.Enabled := True
         else
            Btn_Quit_Mult.Enabled := False;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end;   }

   Grid_Pesquisa.SetFocus;
end;

procedure TFrmCtaReceber.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
{   JvQuery := TJvUIBDataset.Create(self);
   try
      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction;

      Case PageCadastro.ActivePageIndex of
        0: begin
              if StrToInt(Edit_Controle.Text) <> 0 then
              begin
                 if not FrmPrincipal.RodaConsulta('Select * from CtasReceber where Controle='+ Trim(Edit_Controle.Text) +'and Documento = '''+ Trim(Edit_Documento.Text) +'''',JvQuery) then Exit;
                 if JvQuery.RecordCount> 0 then
                 begin
                    Operacao := opDelete;
                    Carrega_Campos(JvQuery);
                    if MessageDlg('Confirma exclusão da Conta a Receber?'+ #13 +
                    'Nota Fiscal : ' + JvQuery.FieldByName('NRO_NOTA').asString + ' ' + JvQuery.FieldByName('SER_NOTA').asString + '   Controle : ' +  JvQuery.FieldByName('CONTROLE').asString + #13 +
                    'Documento : ' + Edit_Documento.Text, mtConfirmation,[mbNo, mbYes],0) = mrYes then
                    begin
                       Carrega_Parametros(Proc_Ctarec);
                       FrmPrincipal.RodaSP(Proc_Ctarec);

                       FrmPrincipal.LimpaCampos(Self,1);
                       Edit_ClienteExit(Self);
                       Msk_DataExit(Msk_Data);
                       Msk_DataExit(Msk_VencTo);
                       Edit_BancoExit(Self);
                       SetStatus('Pesquisa');
                    end;
                    Operacao := opBrowse;
                 end
                 else
                 begin
                    MessageDlg('Conta a Receber com controle "'+ Trim(Edit_Controle.Text) +'" não encontrado.',mtConfirmation,[mbOk],0);
                    FrmPrincipal.LimpaCampos(Self,1);
                    Edit_ClienteExit(Self);
                    Msk_DataExit(Msk_Data);
                    Msk_DataExit(Msk_VencTo);
                    Edit_BancoExit(Self);
                 end;
                 BtnInclui.SetFocus;
              end;
           end;
        1: begin
              if StrToIntZero(Edit_Controle_Banc.Text) > 0 then
              begin
                 if not FrmPrincipal.RodaConsulta('Select * from BancReceber where Controle = ' + Trim( Edit_Controle_Banc.Text) + ' and Documento = '''+ Trim(Edit_Documento_Banc.Text) + ''' and NOSSO_NRO = '''+ Trim(Edit_Recibo_Banc.Text) +'''',JvQuery) then Exit;
                 if JvQuery.RecordCount > 0 then
                 begin
                    Operacao := opDelete;
                    Carrega_Campos(JvQuery);
                    if MessageDlg('Confirma exclusão do pagamento '+ #13 + 'Recibo : ' + Edit_Recibo_Banc.Text + #13 + 'Conta Corrente : ' + Edit_Cta_Corr.Text + PanelCta_Corr.Caption + #13 + 'Valor :   ' + Trim(Edit_Vl_Parc_Banc.Text)  + ' ?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                    begin
                       Carrega_Parametros(Proc_RecBanco);
                       FrmPrincipal.RodaSP(Proc_RecBanco);
                       BtnCancelarClick(Self);
                       SetStatus('Pesquisa');
                    end;
                    Operacao := opBrowse;
                 end
                 else
                 begin
                    MessageDlg('Pagamento com Recibo "'+ Edit_Recibo_Banc.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
                    BtnCancelarClick(Self);
                    SetStatus('Pesquisa');
                 end;
                 Edit_Documento_BancExit(Self);
                 BtnInclui.SetFocus;
              end;
           end;
        2: begin
              if StrToIntZero(Edit_Controle_Caixa.Text) > 0 then
              begin
                 if not FrmPrincipal.RodaConsulta('Select * from ParcReceber where Controle = ' + Trim(Edit_Controle_Caixa.Text) + ' and Documento = '''+ Trim(Edit_Documento_Caixa.Text) + ''' and RECIBO = '''+ Trim(Edit_Recibo_Caixa.Text) +'''',JvQuery) then Exit;
                 if JvQuery.RecordCount > 0 then
                 begin
                    Operacao := opDelete;
                    Carrega_Campos(JvQuery);
                    if MessageDlg('Confirma exclusão do pagamento '+ #13 + 'Recibo : ' + Edit_Recibo_Caixa.Text  + #13 + 'Valor :   ' + Trim(Edit_Vl_Parc_Caixa.Text)  + ' ?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                    begin
                       Carrega_Parametros(Proc_RecCaixa);
                       FrmPrincipal.RodaSP(Proc_RecCaixa);
                       BtnCancelarClick(Self);
                    SetStatus('Pesquisa');
                    end;
                    Operacao := opBrowse;
                 end
                 else
                 begin
                    MessageDlg('Pagamento com Recibo "'+ Edit_Recibo_Caixa.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
                    BtnCancelarClick(Self);
                    SetStatus('Pesquisa');
                  end;
                 BtnInclui.SetFocus;
                 Edit_Documento_CaixaExit(Self);
              end;
           end;
      end;
   finally
      JvQuery.Close;
      JvQuery.Free;
   end; }
end;

procedure TFrmCtaReceber.PaginasChange(Sender: TObject);
begin                                     {
   if (JvQry_Pes.Active) and (Paginas.ActivePageIndex = 0) then
      Grid_PesquisaDblClick(self)
   else
      PageCadastro.ActivePageIndex := 0; }
end;

procedure TFrmCtaReceber.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(Self,2);
   RG_Quitado.ItemIndex := -1;
   EditP_ClienteExit(Self);
   Datasource1.DataSet := nil;
   Grid_Pesquisa.DataSource := nil;
  // JvQry_Pes.Close;
   Btn_Quit_Mult.Enabled := False;
   EditP_Nro_Nota.SetFocus;
end;

Procedure TFrmCtaReceber.Carrega_Categorias;
var aCategoria : String;
    I : Integer;
begin    {
   JvQry_CatSubCat.First;
   Combo_Categoria.Items.Clear;
   Combo_PCategoria.Items.Clear;
   aCategoria := '';
   aCategoria := JvQry_CatSubCat.FieldByName('CAT').asString;
   Combo_Categoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);
   Combo_PCategoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);

   For I := 1 to JvQry_CatSubCat.RecordCount do
   begin
      if JvQry_CatSubCat.FieldByName('CAT').asString <> aCategoria then
      begin
         Combo_Categoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);
         Combo_PCategoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);
         aCategoria := JvQry_CatSubCat.FieldByName('CAT').asString;
      end;
      JvQry_CatSubCat.Next;
   end; }
   Combo_Categoria.Text := '';
   Combo_PCategoria.Text := '';
end;

Procedure TFrmCtaReceber.Carrega_SubCategorias(aCategoria: String; oCombo: TComboBox);
var I : Integer;
begin    {
   JvQry_CatSubCat.First;
   oCombo.Items.Clear;
   if Trim(aCategoria) = '' then Exit;

   For I := 1 to JvQry_CatSubCat.RecordCount do
   begin
      if JvQry_CatSubCat.FieldByName('CAT').asString = aCategoria then
      begin
         oCombo.Items.Add(JvQry_CatSubCat.FieldByName('SUBCAT').asString);
      end;
      JvQry_CatSubCat.Next;
   end; }
   oCombo.Text := '';
end;

procedure TFrmCtaReceber.FormActivate(Sender: TObject);
begin
   //JvQry_CatSubCat.Close;
   //JvQry_CatSubCat.Open;
   //Carrega_Categorias;
end;

procedure TFrmCtaReceber.Combo_SubCategoriaDropDown(Sender: TObject);
begin
   if Combo_Categoria.Text <> '' then
      Carrega_SubCategorias(Combo_Categoria.Items[Combo_Categoria.ItemIndex],Combo_SubCategoria);
   if Combo_SubCategoria.Text = '' then
      Combo_SubCategoria.ItemIndex := -1;
end;

procedure TFrmCtaReceber.Combo_PCategoriaChange(Sender: TObject);
begin
   //Combo_SubCategoria.ItemIndex := -1;
   //Carrega_SubCategorias(Combo_PCategoria.Items[Combo_PCategoria.ItemIndex],Combo_PSubCategoria);
end;

procedure TFrmCtaReceber.Combo_PSubCategoriaDropDown(Sender: TObject);
begin
   if Combo_PCategoria.Text <> '' then
      Carrega_SubCategorias(Combo_PCategoria.Items[Combo_PCategoria.ItemIndex],Combo_PSubCategoria);
   if Combo_PSubCategoria.Text = '' then
      Combo_PSubCategoria.ItemIndex := -1;
end;

procedure TFrmCtaReceber.PageCadastroChange(Sender: TObject);
begin
   Case PageCadastro.ActivePageIndex of
      0: begin
            //Proc.BuildStoredProc('PROC_CTASRECEBER');
            Btn_Recibo.Enabled := False;
            if (StrToIntZero(EditP_Controle.Caption) > 0) then
               SetStatus('Edição')
            else
               SetStatus('Pesquisa');
         end;
      1: begin
            //Proc.BuildStoredProc('PROC_BANCRECEBER');
            if (Edit_Controle.Text <> '') and (StrToInt(Edit_Controle.Text) > 0) then
            begin
               BtnCancelarClick(Self);
               SetStatus('Pesquisa');
               Edit_Documento_Banc.Text := Edit_Documento.Text;
               Edit_Controle_Banc.Text := Edit_Controle.Text;
               Edit_Documento_BancExit(self);
            end;
            Btn_Recibo.Enabled := True;
         end;
      2: begin
            //Proc.BuildStoredProc('PROC_PARCRECEBER');
            if (Edit_Controle.Text <> '') and (StrToInt(Edit_Controle.Text) > 0)then
            begin
               BtnCancelarClick(Self);
               SetStatus('Pesquisa');
               Edit_Documento_Caixa.Text := Edit_Documento.Text;
               Edit_Controle_Caixa.Text := Edit_Controle.Text;
               Edit_Documento_CaixaExit(self);
            end;
            Btn_Recibo.Enabled := True;
         end;
   end;
end;

procedure TFrmCtaReceber.Edit_ClienteExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cliente.Text)) <> 0) and (Trim(Edit_Cliente.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from Clientes where Codigo='+ Edit_Cliente.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCliente.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            PanelCliente.Caption := '';
            Edit_Cliente.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Cliente.Text := '0';
      PanelCliente.Caption := '';
   end;
end;

procedure TFrmCtaReceber.Msk_DataEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99/99/9999;1;_';
      (Sender as TMaskEdit).SelStart := 0;
      if (Operacao = opInsert) and ((Sender as TMaskEdit) = Msk_Data) then
         (Sender as TMaskEdit).Text := DateToStr(Date);
      (Sender as TMaskEdit).SelectAll;
   end;
end;

procedure TFrmCtaReceber.Msk_DataExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '/  /' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmCtaReceber.Edit_BancoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Banco.Text)) <> 0) and (Trim(Edit_Banco.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, CodBanco || '' - '' || NomeBanco Nome from Bancos where Codigo='+ Edit_Banco.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelBanco.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Banco não cadastrado.',mtInformation,[mbOK],0);
            PanelBanco.Caption := '';
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
   end;
end;

procedure TFrmCtaReceber.F3_NotaClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT VENDAS.CONTROLE, VENDAS.NRO_NOTA, VENDAS.SER_NOTA, VENDAS.DT_EMISS, VENDAS.COD_CLIENTE, CLIENTES.NOME, VENDAS.COD_FORNEC, FORNECEDORES.NOME NOME_FORNEC';
      FrmPesquisa.Select := FrmPesquisa.Select + ' FROM VENDAS LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) order by Nro_Nota, Ser_Nota ';
      FrmPesquisa.Indice_Inicial := 'CONTROLE';
      FrmPesquisa.Campo_Retorno := 'CONTROLE';
      FrmPesquisa.Caption := 'Vendas';
      if FrmPesquisa.ShowModal = mrOK then
      begin
  //       Edit_Nro_Nota.Text := FrmPesquisa.JvQuery.FieldByName('NRO_NOTA').asString;
//         Edit_Ser_Nota.Text := FrmPesquisa.JvQuery.FieldByName('SER_NOTA').asString;
         Edit_Nro_Nota.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCtaReceber.F3_ClienteClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT * from CLIENTES';
      FrmPesquisa.Indice_Inicial := 'Nome';
      FrmPesquisa.Campo_Retorno := 'Codigo';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
    //     Edit_Cliente.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_ClienteExit(Self);
         Edit_Cliente.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCtaReceber.F3_BancoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT * from Bancos';
      FrmPesquisa.Indice_Inicial := 'NomeBanco';
      FrmPesquisa.Campo_Retorno := 'Codigo';
      FrmPesquisa.Caption := 'Bancos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
      //   Edit_Banco.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_BancoExit(Self);
         Edit_Banco.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCtaReceber.Edit_Nro_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (not (Key in ['0'..'9','-',#8,#13,#35,#36,#37,#39])) then Key := #15;
end;

procedure TFrmCtaReceber.Edit_Nro_NotaExit(Sender: TObject);
begin
   if Length(Trim(Edit_Nro_Nota.Text)) > 0 then
   begin
      if not ValInteger(Edit_Nro_Nota.Text) then
      begin
         MessageDlg('Nota Fiscal deve ser um número inteiro válido.', mtInformation,[mbOK],0);
         Edit_Nro_Nota.SetFocus;
         Exit;
      end
      else
         Edit_Nro_Nota.Text := StrZero(StrToInt(Edit_Nro_Nota.Text),6,0);
   end;
end;

Procedure TFrmCtaReceber.Limpa_Labels;
begin
   LabelNominal.Caption   := '0,00';
   LabelJuros.Caption     := '0,00';
   LabelDescontos.Caption := '0,00';
   LabelSaldo.Caption     := '0,00';
end;

procedure TFrmCtaReceber.PageCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

Procedure TFrmCtaReceber.Carrega_Pagamentos_Caixa(oControle: Integer; oDocumento : String);
begin      {
   with JvQry_Parc_Rec do
   begin
      if oControle = 0 then
      begin
         Close;
         Src_Caixa_Rec.DataSet := nil;
         DBGrid_Rec_Caixa.DataSource := nil;
      end
      else
      begin
         Close;
         Src_Caixa_Rec.DataSet := nil;
         DBGrid_Rec_Caixa.DataSource := nil;
         Params.ByNameAsInteger['oControle'] := oControle;
         Params.ByNameAsString['oDocumento'] := oDocumento;
         Open;
         FormatNumericFields(JvQry_Parc_Rec);
         if (JvQry_Parc_Rec.Active) and (JvQry_Parc_Rec.RecordCount > 0) then
         begin
            Src_Caixa_Rec.DataSet := JvQry_Parc_Rec;
            DBGrid_Rec_Caixa.DataSource := Src_Caixa_Rec;
         end;
      end;
   end;   }
end;

Procedure TFrmCtaReceber.Carrega_Pagamentos_Banco(oControle: Integer; oDocumento : String);
begin        {
   with JvQry_Banc_Rec do
   begin
      if oControle = 0 then
      begin
         Close;
         Src_Banc_Rec.DataSet := nil;
         DBGrid_Rec_Banco.DataSource := nil;
      end
      else
      begin
         Close;
         Src_Banc_Rec.DataSet := nil;
         DBGrid_Rec_Banco.DataSource := nil;
         Params.ByNameAsInteger['oControle'] := oControle;
         Params.ByNameAsString['oDocumento'] := oDocumento;
         Open;
         FormatNumericFields(JvQry_Banc_Rec);
         if (JvQry_Banc_Rec.Active) and (JvQry_Banc_Rec.RecordCount > 0) then
         begin
            Src_Banc_Rec.DataSet := JvQry_Banc_Rec;
            DBGrid_Rec_Banco.DataSource := Src_Banc_Rec;
         end;
      end;
   end;     }
end;

procedure TFrmCtaReceber.Edit_Cta_CorrExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cta_Corr.Text)) <> 0) and (Trim(Edit_Cta_Corr.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('SELECT BANCOS.CODBANCO, BANCOS.NOMEBANCO, BANCOS.CODAGENCIA, BANCOS.NOMEAGENCIA, CTACORRENTE.CODIGO, CTACORRENTE.CTA_CORR FROM CTACORRENTE INNER JOIN BANCOS ON (CTACORRENTE.BANCO = BANCOS.CODIGO) where CTACORRENTE.Codigo='+ Edit_Cta_Corr.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCta_Corr.Caption := JvQuery.FieldByName('CTA_CORR').asString;
            PanelCod_Banco.Caption := JvQuery.FieldByName('CODIGO').asString;
            PanelNome_Banco.Caption := JvQuery.FieldByName('CODBANCO').asString + ' - ' + JvQuery.FieldByName('NOMEBANCO').asString;
         end
         else
         begin
            MessageDlg('Conta Corrente não cadastrada.',mtInformation,[mbOK],0);
            PanelCta_Corr.Caption := '';
            PanelCod_Banco.Caption := '';
            PanelNome_Banco.Caption := '';
            Edit_Cta_Corr.SetFocus;
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Cta_Corr.Text := '0';
      PanelCta_Corr.Caption := '';
      PanelCod_Banco.Caption := '';
      PanelNome_Banco.Caption := '';
   end;
end;

procedure TFrmCtaReceber.F3_Cta_CorrClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT * from CTACORRENTE';
      FrmPesquisa.Indice_Inicial := 'CTA_CORR';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Contas Corrente';
      if FrmPesquisa.ShowModal = mrOK then
      begin
      //   Edit_Cta_Corr.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Cta_CorrExit(Self);
         Edit_Cta_Corr.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCtaReceber.DBGrid_Rec_BancoDblClick(Sender: TObject);
begin
{   with JvQry_Banc_Rec do
   begin
      if RecordCount > 0 then
      begin
         if Operacao = opBrowse then
         begin
            Edit_Controle_Banc.Text := FieldByName('CONTROLE').AsString;
            Edit_Recibo_Banc.Text := FieldByName('NOSSO_NRO').AsString;
            Edit_Cta_Corr.Text := FieldByName('CTA_CORR').AsString;
            Edit_Cta_CorrExit(Self);
            Msk_DataEnter(Msk_Dt_Pagto_Banc);
            Msk_Dt_Pagto_Banc.Text := FieldByName('DT_PAGTO').asString;
            Msk_DataExit(Msk_Dt_Pagto_Banc);
            Edit_Vl_Parc_Banc.Text := FieldByName('VL_PARC').AsString;
            Edit_Vl_Juros_Banc.Text := FieldByName('VL_JUROS').AsString;
            Edit_Vl_Desconto_Banc.Text := FieldByName('VL_DESCONTO').AsString;
            Calcula_Total_Banco;
            SetStatus('Edição');
         end;
      end;
   end; }
end;

procedure TFrmCtaReceber.Edit_Documento_BancExit(Sender: TObject);
var vSelect : String;
//    JvQuery : TJvUIBDataset;
begin               {
   if Trim(Edit_Documento_Banc.Text) <> '' then
   begin
      vSelect :=  '';
      vSelect := 'SELECT CTASRECEBER.CONTROLE, CTASRECEBER.DOCUMENTO, CTASRECEBER.NRO_NOTA, CTASRECEBER.SER_NOTA, CTASRECEBER.VENCTO, CTASRECEBER.COD_CLIENTE, ';
      vSelect :=  vSelect + ' CLIENTES.NOME, CTASRECEBER.VALOR, CTASRECEBER.VL_SALDO, CTASRECEBER.VL_PAGTO, CTASRECEBER.VL_JUROS, CTASRECEBER.VL_DESCONTO FROM CTASRECEBER INNER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) ';
      if Edit_Documento_Banc.Modified then
         vSelect :=  vSelect + ' Where Documento = '''+ Trim(Edit_Documento_Banc.Text)+''''
      else
         vSelect :=  vSelect + ' Where Controle = ' + Trim(Edit_Controle_Banc.Text)  + ' and  Documento = '''+ Trim(Edit_Documento_Banc.Text)+'''';

      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta(vSelect,JvQuery) then Exit;
         if JvQuery.RecordCount <= 0 then
         begin
            MessageDlg('Documento não cadastrado.',mtInformation,[mbOK],0);
            Edit_Controle_Banc.Text := '0';
            Edit_Nro_Nota_Banc.Text := '';
            Edit_Ser_Nota_Banc.Text := '';
            PanelCod_Cli_Banc.Caption := '';
            PanelNome_Cli_Banc.Caption := '';
            Limpa_Labels;
            Edit_Documento_Banc.SetFocus;
         end;
         JvQuery.Last;
         if JvQuery.RecordCount > 1 then
         begin
            FrmPesquisa := TFrmPesquisa.Create(self);
            try
               FrmPesquisa.Select := ' SELECT CTASRECEBER.CONTROLE, CTASRECEBER.DOCUMENTO, CTASRECEBER.NRO_NOTA, CTASRECEBER.SER_NOTA, CTASRECEBER.VENCTO, CTASRECEBER.COD_CLIENTE, ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' CLIENTES.NOME, CTASRECEBER.VALOR, CTASRECEBER.VL_SALDO, CTASRECEBER.VL_PAGTO, CTASRECEBER.VL_JUROS, CTASRECEBER.VL_DESCONTO FROM CTASRECEBER INNER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' WHERE Upper(DOCUMENTO) = '''+ AnsiUpperCase(Trim(Edit_Documento_Banc.Text)) +'''';
               FrmPesquisa.Indice_Inicial := 'CONTROLE';
               FrmPesquisa.Campo_Retorno := 'CONTROLE';
               FrmPesquisa.Caption := 'Contas a Receber com Documento ' + Edit_Documento_Banc.Text;
               FrmPesquisa.Mensagem := 'Foram encontradas '+ FormatFloat('000',JvQuery.RecordCount) +' ocorrência(s) para Documento '''+ Edit_Documento_Banc.Text +'''';
               FrmPesquisa.Abrir_Conteudo := True;
               if FrmPesquisa.ShowModal = mrOK then
               begin
                  Edit_Controle_Banc.Text := FrmPesquisa.JvQuery.FieldByName('Controle').AsString;
                  Edit_Nro_Nota_Banc.Text := FrmPesquisa.JvQuery.FieldByName('Nro_Nota').asString;
                  Edit_Ser_Nota_Banc.Text := FrmPesquisa.JvQuery.FieldByName('Ser_Nota').asString;
                  PanelCod_Cli_Banc.Caption := FrmPesquisa.JvQuery.FieldByName('Cod_Cliente').asString;
                  PanelNome_Cli_Banc.Caption := FrmPesquisa.JvQuery.FieldByName('Nome').asString;
                  //SITUACAO
                  LabelNominal.Caption := FormatFloat('#,###,##0.00',FrmPesquisa.JvQuery.FieldByName('VL_PAGTO').asFloat);
                  LabelJuros.Caption := FormatFloat('#,###,##0.00',FrmPesquisa.JvQuery.FieldByName('VL_JUROS').asFloat);
                  LabelDescontos.Caption := FormatFloat('#,###,##0.00',FrmPesquisa.JvQuery.FieldByName('VL_DESCONTO').asFloat);
                  LabelSaldo.Caption := FormatFloat('#,###,##0.00',FrmPesquisa.JvQuery.FieldByName('VL_SALDO').asFloat);
                  Carrega_Pagamentos_Banco(StrToIntZero(Edit_Controle_Banc.Text), Edit_Documento_Banc.Text);
               end;
            finally
               FrmPesquisa.Free;
            end;
         end
         else
         begin
            Edit_Controle_Banc.Text := JvQuery.FieldByName('Controle').AsString;
            Edit_Nro_Nota_Banc.Text := JvQuery.FieldByName('Nro_Nota').asString;
            Edit_Ser_Nota_Banc.Text := JvQuery.FieldByName('Ser_Nota').asString;
            PanelCod_Cli_Banc.Caption := JvQuery.FieldByName('Cod_Cliente').asString;
            PanelNome_Cli_Banc.Caption := JvQuery.FieldByName('Nome').asString;
            //SITUACAO
            LabelNominal.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('VL_PAGTO').asFloat);
            LabelJuros.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('VL_JUROS').asFloat);
            LabelDescontos.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('VL_DESCONTO').asFloat);
            LabelSaldo.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('VL_SALDO').asFloat);
            Carrega_Pagamentos_Banco(StrToIntZero(Edit_Controle_Banc.Text), Edit_Documento_Banc.Text);
         end;
         FrmPrincipal.LimpaCampos(Self,3);
         Msk_DataExit(Msk_Dt_Pagto_Banc);
         Edit_Cta_CorrExit(Self);
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Controle_Banc.Text := '0';
      Edit_Nro_Nota_Banc.Text := '';
      Edit_Ser_Nota_Banc.Text := '';
      PanelCod_Cli_Banc.Caption := '';
      PanelNome_Cli_Banc.Caption := '';
      Limpa_Labels;
   end;              }
   Edit_Documento_Banc.Modified := False;
end;

procedure TFrmCtaReceber.Edit_Documento_CaixaExit(Sender: TObject);
var vSelect : String;
//    JvQuery : TJvUIBDataset;
begin
   if Trim(Edit_Documento_Caixa.Text) <> '' then
   begin
   {   vSelect :=  '';
      vSelect := 'SELECT CTASRECEBER.CONTROLE, CTASRECEBER.DOCUMENTO, CTASRECEBER.NRO_NOTA, CTASRECEBER.SER_NOTA, CTASRECEBER.VENCTO, CTASRECEBER.COD_CLIENTE, ';
      vSelect :=  vSelect + ' CLIENTES.NOME, CTASRECEBER.VALOR, CTASRECEBER.VL_SALDO, CTASRECEBER.VL_PAGTO, CTASRECEBER.VL_JUROS, CTASRECEBER.VL_DESCONTO FROM CTASRECEBER INNER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) ';
      if Edit_Documento_Caixa.Modified then
         vSelect :=  vSelect + ' Where Documento = '''+ Trim(Edit_Documento_Caixa.Text)+''''
      else
         vSelect :=  vSelect + ' Where Controle = ' + Trim(Edit_Controle_Caixa.Text)  + ' and  Documento = '''+ Trim(Edit_Documento_Caixa.Text)+'''';
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta(vSelect,JvQuery) then Exit;
         if JvQuery.RecordCount <= 0 then
         begin
            MessageDlg('Documento não cadastrado.',mtInformation,[mbOK],0);
            Edit_Controle_Caixa.Text := '0';
            Edit_Nro_Nota_Caixa.Text := '';
            Edit_Ser_Nota_Caixa.Text := '';
            PanelCod_Cli_Caixa.Caption := '';
            PanelNome_Cli_Caixa.Caption := '';
            Limpa_Labels;
            Edit_Documento_Caixa.SetFocus;
         end;
         JvQuery.Last;
         if JvQuery.RecordCount > 1 then
         begin
            FrmPesquisa := TFrmPesquisa.Create(self);
            try
               FrmPesquisa.Select := ' SELECT CTASRECEBER.CONTROLE, CTASRECEBER.DOCUMENTO, CTASRECEBER.NRO_NOTA, CTASRECEBER.SER_NOTA, CTASRECEBER.VENCTO, CTASRECEBER.COD_CLIENTE, ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' CLIENTES.NOME, CTASRECEBER.VALOR, CTASRECEBER.VL_SALDO, CTASRECEBER.VL_PAGTO, CTASRECEBER.VL_JUROS, CTASRECEBER.VL_DESCONTO FROM CTASRECEBER INNER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' WHERE Upper(DOCUMENTO) = '''+ AnsiUpperCase(Trim(Edit_Documento_Caixa.Text)) +'''';
               FrmPesquisa.Indice_Inicial := 'CONTROLE';
               FrmPesquisa.Campo_Retorno := 'CONTROLE';
               FrmPesquisa.Caption := 'Contas a Receber com Documento ' + Edit_Documento_Caixa.Text;
               FrmPesquisa.Mensagem := 'Foram encontradas '+ FormatFloat('000',JvQuery.RecordCount) +' ocorrência(s) para Documento '''+ Edit_Documento_Banc.Text +'''';
               FrmPesquisa.Abrir_Conteudo := True;
               if FrmPesquisa.ShowModal = mrOK then
               begin
                  Edit_Controle_Caixa.Text := FrmPesquisa.JvQuery.FieldByName('Controle').AsString;
                  Edit_Nro_Nota_Caixa.Text := FrmPesquisa.JvQuery.FieldByName('Nro_Nota').asString;
                  Edit_Ser_Nota_Caixa.Text := FrmPesquisa.JvQuery.FieldByName('Ser_Nota').asString;
                  PanelCod_Cli_Caixa.Caption := FrmPesquisa.JvQuery.FieldByName('Cod_Cliente').asString;
                  PanelNome_Cli_Caixa.Caption := FrmPesquisa.JvQuery.FieldByName('Nome').asString;
                  //SITUACAO
                  LabelNominal.Caption := FormatFloat('#,###,##0.00',FrmPesquisa.JvQuery.FieldByName('VL_PAGTO').asFloat);
                  LabelJuros.Caption := FormatFloat('#,###,##0.00',FrmPesquisa.JvQuery.FieldByName('VL_JUROS').asFloat);
                  LabelDescontos.Caption := FormatFloat('#,###,##0.00',FrmPesquisa.JvQuery.FieldByName('VL_DESCONTO').asFloat);
                  LabelSaldo.Caption := FormatFloat('#,###,##0.00',FrmPesquisa.JvQuery.FieldByName('VL_SALDO').asFloat);
                  Carrega_Pagamentos_Caixa(StrToIntZero(Edit_Controle_Caixa.Text), Edit_Documento_Caixa.Text);
               end;
            finally
               FrmPesquisa.Free;
            end;
         end
         else
         begin
            Edit_Controle_Caixa.Text := JvQuery.FieldByName('Controle').AsString;
            Edit_Nro_Nota_Caixa.Text := JvQuery.FieldByName('Nro_Nota').asString;
            Edit_Ser_Nota_Caixa.Text := JvQuery.FieldByName('Ser_Nota').asString;
            PanelCod_Cli_Caixa.Caption := JvQuery.FieldByName('Cod_Cliente').asString;
            PanelNome_Cli_Caixa.Caption := JvQuery.FieldByName('Nome').asString;
            //SITUACAO
            LabelNominal.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('VL_PAGTO').asFloat);
            LabelJuros.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('VL_JUROS').asFloat);
            LabelDescontos.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('VL_DESCONTO').asFloat);
            LabelSaldo.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('VL_SALDO').asFloat);
            Carrega_Pagamentos_Caixa(StrToIntZero(Edit_Controle_Caixa.Text), Edit_Documento_Caixa.Text);
         end;
         FrmPrincipal.LimpaCampos(Self,4);
         Msk_DataExit(Msk_Dt_Pagto_Caixa);
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Controle_Caixa.Text := '0';
      Edit_Nro_Nota_Caixa.Text := '';
      Edit_Ser_Nota_Caixa.Text := '';
      PanelCod_Cli_Caixa.Caption := '';
      PanelNome_Cli_Caixa.Caption := '';
      Limpa_Labels;
   end;
   Edit_Documento_Caixa.Modified := False;
end;

procedure TFrmCtaReceber.DBGrid_Rec_CaixaDblClick(Sender: TObject);
begin     {
   with JvQry_Parc_Rec do
   begin
      if RecordCount > 0 then
      begin
         if Operacao = opBrowse then
         begin
            Edit_Controle_Caixa.Text := FieldByName('CONTROLE').AsString;
            Edit_Recibo_Caixa.Text := FieldByName('RECIBO').asString;
            Msk_DataEnter(Msk_Dt_Pagto_Caixa);
            Msk_Dt_Pagto_Caixa.Text := FieldByName('DT_PAGTO').asString;
            Msk_DataExit(Msk_Dt_Pagto_Caixa);
            Edit_Vl_Parc_Caixa.Text := FieldByName('VL_PARC').AsString;
            Edit_Vl_Juros_Caixa.Text := FieldByName('VL_JUROS').AsString;
            Edit_Vl_Desconto_Caixa.Text := FieldByName('VL_DESCONTO').AsString;
            Calcula_Total_Caixa;
            SetStatus('Edição');
         end;
      end;
   end;  }
end;

procedure TFrmCtaReceber.EditP_Nro_NotaExit(Sender: TObject);
begin
   if Length(Trim(EditP_Nro_Nota.Text)) > 0 then
   begin
      if not ValInteger(EditP_Nro_Nota.Text) then
      begin
         MessageDlg('Nota Fiscal deve ser um número inteiro válido.', mtInformation,[mbOK],0);
         EditP_Nro_Nota.SetFocus;
         Exit;
      end
      else
         EditP_Nro_Nota.Text := StrZero(StrToInt(EditP_Nro_Nota.Text),6,0);
   end;
end;

procedure TFrmCtaReceber.BitBtn2Click(Sender: TObject);
var vOrd : String;
begin
   if RB_Cresc.Checked then
      vOrd := 'Crescente'
   else
      vOrd := 'Decrescente';
   ListOrdem.Items.Add(ComboCampo_Ord.Items[ComboCampo_Ord.ItemIndex] + ' ' + vOrd);
end;

procedure TFrmCtaReceber.BitBtn6Click(Sender: TObject);
begin
   if ListOrdem.ItemIndex >= 0 then
     ListOrdem.Items.Delete(ListOrdem.ItemIndex);
end;

procedure TFrmCtaReceber.BitBtn4Click(Sender: TObject);
var Conteudo : String;
begin
   if Pos('(S)',ComboCampo.Items[ComboCampo.ItemIndex]) > 0 then
   begin
      Conteudo := '''' + EditConteudo.Text + '''';
      ListCriterios.Items.Add(Copy(ComboCampo.Items[ComboCampo.ItemIndex],1,Length(ComboCampo.Items[ComboCampo.ItemIndex])-3)+ ' ' + ComboOper.Items[ComboOper.ItemIndex]+ ' ' + Conteudo);
   end
   else
   begin
      Conteudo := EditConteudo.Text;
      ListCriterios.Items.Add(ComboCampo.Items[ComboCampo.ItemIndex]+ ' ' + ComboOper.Items[ComboOper.ItemIndex]+ ' ' + Conteudo);
   end;
end;

procedure TFrmCtaReceber.BitBtn7Click(Sender: TObject);
begin
   ListCriterios.Items.Delete(ListCriterios.ItemIndex);
end;

procedure TFrmCtaReceber.EditP_ClienteExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(EditP_Cliente.Text)) <> 0) and (Trim(EditP_Cliente.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from Clientes where Codigo='+ EditP_Cliente.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPCliente.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            PanelPCliente.Caption := '';
            EditP_Cliente.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      EditP_Cliente.Text := '0';
      PanelPCliente.Caption := '';
   end;
end;

procedure TFrmCtaReceber.F3P_ClienteClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT * from CLIENTES';
      FrmPesquisa.Indice_Inicial := 'Nome';
      FrmPesquisa.Campo_Retorno := 'Codigo';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  EditP_Cliente.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         EditP_ClienteExit(Self);
         EditP_Cliente.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCtaReceber.Action1Execute(Sender: TObject);
begin
   if (Edit_Nro_Nota.Focused or Edit_Ser_Nota.Focused) then
      F3_NotaClick(self)
   else if Edit_Cliente.Focused then
      F3_ClienteClick(self)
   else if Edit_Banco.Focused then
      F3_BancoClick(self)
   else if Edit_Documento_Banc.Focused then
      F3_CtaRec_BancClick(self)
   else if Edit_Documento_Caixa.Focused then
      F3_CtaRec_CaixaClick(self)
   else if Edit_Cta_Corr.Focused then
      F3_Cta_CorrClick(self)
   else if EditP_Cliente.Focused then
      F3P_ClienteClick(self);
end;

procedure TFrmCtaReceber.F3_CtaRec_BancClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT * FROM CTASRECEBER ORDER BY CONTROLE ';
      FrmPesquisa.Indice_Inicial := 'Documento';
      FrmPesquisa.Campo_Retorno := 'Documento';
      FrmPesquisa.Caption := 'Contas a Receber';
      if FrmPesquisa.ShowModal = mrOK then
      begin
         Edit_Documento_Banc.Modified := False;
         // Edit_Documento_Banc.Text := FrmPesquisa.JvQuery.FieldByName('DOCUMENTO').AsString;
//         Edit_Controle_Banc.Text := FrmPesquisa.JvQuery.FieldByName('CONTROLE').AsString;
         Edit_Documento_BancExit(Self);
         Edit_Documento_Banc.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCtaReceber.F3_CtaRec_CaixaClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT * FROM CTASRECEBER ORDER BY CONTROLE ';
      FrmPesquisa.Indice_Inicial := 'Documento';
      FrmPesquisa.Campo_Retorno := 'Documento';
      FrmPesquisa.Caption := 'Contas a Receber';
      if FrmPesquisa.ShowModal = mrOK then
      begin
         Edit_Documento_Caixa.Modified := False;
    //     Edit_Documento_Caixa.Text := FrmPesquisa.JvQuery.FieldByName('DOCUMENTO').AsString;
  //       Edit_Controle_Caixa.Text := FrmPesquisa.JvQuery.FieldByName('CONTROLE').AsString;
         Edit_Documento_CaixaExit(Self);
         Edit_Documento_Caixa.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCtaReceber.Btn_ReciboClick(Sender: TObject);
begin
   {if PageCadastro.ActivePageIndex = 0 then
   begin
      if Edit_Controle.Value <= 0 then
      begin
         PopupMenu1.Items[0].Enabled := False;
         PopupMenu1.Items[2].Enabled := False;
      end
      else
         //Se for Cupom Fiscal
         if Trim(Edit_Ser_Nota.Text) = 'CF' then
         begin
            PopupMenu1.Items[0].Enabled := False;
            if PanelCancelado.Visible = True then
               PopupMenu1.Items[2].Enabled := False
            else
               PopupMenu1.Items[2].Enabled := True;
         end
         else
         begin
            PopupMenu1.Items[0].Enabled := True;
            PopupMenu1.Items[2].Enabled := False;
         end;
   end
   else
   begin
      PopupMenu1.Items[0].Enabled := True;
      if PageCadastro.ActivePageIndex = 1 then
         if Edit_Controle_Prod.Value <= 0 then
            PopupMenu1.Items[0].Enabled := False
         else
            //Se for Cupom Fiscal
            if Trim(Edit_Ser_Nota_Prod.Text) = 'CF' then
               PopupMenu1.Items[0].Enabled := False;

      if PageCadastro.ActivePageIndex = 2 then
         if Edit_Controle_Serv.Value <= 0 then
            PopupMenu1.Items[0].Enabled := False
         else
            //Se for Cupom Fiscal
            if Trim(Edit_Ser_Nota_Serv.Text) = 'CF' then
               PopupMenu1.Items[0].Enabled := False;

      PopupMenu1.Items[2].Enabled := False;
   end;
   PopupMenu1.Popup(Left + BtnImprimir.Left + 12,Top + BtnImprimir.Height + 134 );}
   Imprime_Recibo;
end;

procedure TFrmCtaReceber.Imprime_Recibo;
var vlTotal : Real;
 //   JvQuery : TJvUIBDataset;
begin
   if PageCadastro.ActivePageIndex = 2 then //Recebimento por Caixa
   begin
      if (StrToFloatZero(Edit_Vl_Parc_Caixa.Text) <= 0) and (StrToFloatZero(Edit_Vl_Juros_Caixa.Text) <= 0) then
      begin
         MessageDlg('Não há valor para imprimir recibo.',mtWarning,[mbOK],0);
         exit;
      end;
   end
   else
   begin
      if (StrToFloatZero(Edit_Vl_Parc_Banc.Text) <= 0) and (StrToFloatZero(Edit_Vl_Juros_Banc.Text) <= 0) then
      begin
         MessageDlg('Não há valor para imprimir recibo.',mtWarning,[mbOK],0);
         exit;
      end;
   end;
{
   JvQuery := TJvUIBDataset.Create(self);
   try
      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction;

      //Busca dados complementares
      if PageCadastro.ActivePageIndex = 1 then
      begin
         if not FrmPrincipal.RodaConsulta('SELECT CLIENTES.CPF, CLIENTES.CGC, CTASRECEBER.DATA, CTASRECEBER.VENCTO FROM CTASRECEBER INNER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) WHERE CONTROLE = '+ Trim(Edit_Controle_Banc.Text) +' AND DOCUMENTO = '''+ Trim(Edit_Documento_Banc.Text)+'''',JvQuery) then Exit;
      end
      else
      begin
         if not FrmPrincipal.RodaConsulta('SELECT CLIENTES.CPF, CLIENTES.CGC, CTASRECEBER.DATA, CTASRECEBER.VENCTO FROM CTASRECEBER INNER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) WHERE CONTROLE = '+ Trim(Edit_Controle_Caixa.Text) +' AND DOCUMENTO = '''+ Trim(Edit_Documento_Caixa.Text)+'''',JvQuery) then Exit;
      end;

      if JvQuery.RecordCount = 0 then
      begin
         MessageDlg('As informações não puderam ser carregadas. Feche o formulário e tente novamente.',mtError,[mbOK],0);
         Exit;
      end;

      PrintFast1.PageWidth := 132;
      Configura_Impressora(Parametros.IMPR_PADRAO,PrintFast1);
      PrintFast1.IniciaImpr;
      PrintFast1.ImprComo(#27+'C'+CHR(22));

      PrintFast1.ImprComo(pElite12);

      PrintFast1.ImprString('',PrintFast1.Repete('-',78),4,TRUE);
      PrintFast1.ImprString('',' ',5,TRUE);
      PrintFast1.ImprString(PExpand,Parametros.RAZAO_SOCIAL,2,True);
      PrintFast1.ImprComo(tExpand);
      PrintFast1.ImprString('','CGC: '+ Parametros.CGC ,4,FALSE);

      if PageCadastro.ActivePageIndex = 2 then
      begin
         PrintFast1.ImprString(pNegrito,Msk_Dt_Pagto_Caixa.Text,72,TRUE);
         PrintFast1.ImprComo(tNegrito);
         PrintFast1.ImprString('','Caixa',4,TRUE);
      end
      else
      begin
         PrintFast1.ImprString(pNegrito,Msk_Dt_Pagto_Banc.Text,72,TRUE);
         PrintFast1.ImprComo(tNegrito);
         PrintFast1.ImprString('','Banco: ('+ PanelCod_Banco.Caption + ') ' ,4,FALSE);
         PrintFast1.ImprString('',PanelNome_Banco.Caption + '  ',16,FALSE);
         PrintFast1.ImprString('','C.C.: '+ PanelCta_Corr.Caption ,14 + Length(PanelNome_Banco.Caption),TRUE);
      end;


      PrintFast1.ImprString(pExpand,'R E C I B O',16,TRUE);
      PrintFast1.ImprComo(tExpand);
      PrintFast1.ImprString('','Cliente: ',4,FALSE);
      if PageCadastro.ActivePageIndex = 1 then
      begin
         PrintFast1.ImprString('',PanelCod_Cli_Banc.Caption,13,FALSE);
         PrintFast1.ImprString('',Copy(PanelNome_Cli_Banc.Caption,0,45),20,FALSE);
      end
      else
      begin
         PrintFast1.ImprString('',PanelCod_Cli_Caixa.Caption,13,FALSE);
         PrintFast1.ImprString('',Copy(PanelNome_Cli_Caixa.Caption,0,45),20,FALSE);
      end;

      if Trim(JvQuery.FieldByName('CGC').asString) <> '' then
      begin
         PrintFast1.ImprString('','CGC: ',59,FALSE);
         PrintFast1.ImprString('',Trim(JvQuery.FieldByName('CGC').asString),64,TRUE);
      end
      else
      begin
         PrintFast1.ImprString('','CPF: ',59,FALSE);
         PrintFast1.ImprString('',Trim(JvQuery.FieldByName('CPF').asString),64,TRUE);
      end;

      PrintFast1.ImprComo(tElite12);
      PrintFast1.ImprComo(pCompr175);
      PrintFast1.ImprString('',PrintFast1.Repete('-',112),5,TRUE);
      PrintFast1.ImprString('','EMISSAO       DOCUMENTO      VENCIMENTO         VALOR NOMINAL            JUROS        DESCONTO       VALOR TOTAL',5,TRUE);
      PrintFast1.ImprString('',PrintFast1.Repete('-',112),5,TRUE);
      PrintFast1.ImprString('',' ',5,TRUE);

      PrintFast1.ImprString('',JvQuery.FieldByName('DATA').asString,5,FALSE);
      if PageCadastro.ActivePageIndex = 1 then
      begin
         PrintFast1.ImprString('',Edit_Documento_Banc.Text,19,FALSE);
         PrintFast1.ImprString('',JvQuery.FieldByName('VENCTO').asString,34,FALSE);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',StrToFloatZero(Edit_Vl_Parc_Banc.Text)),53,FALSE);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('###,##0.00',StrToFloatZero(Edit_Vl_Juros_Banc.Text)),72,FALSE);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',StrToFloatZero(Edit_Vl_Desconto_Banc.Text)),90,FALSE);
         vlTotal := (StrToFloatZero(Edit_Vl_Parc_Banc.Text) + StrToFloatZero(Edit_Vl_Juros_Banc.Text)) - StrToFloatZero(Edit_Vl_Desconto_Banc.Text);
      end
      else
      begin
         PrintFast1.ImprString('',Edit_Documento_Caixa.Text,19,FALSE);
         PrintFast1.ImprString('',JvQuery.FieldByName('VENCTO').asString,34,FALSE);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',StrToFloatZero(Edit_Vl_Parc_Caixa.Text)),53,FALSE);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('###,##0.00',StrToFloatZero(Edit_Vl_Juros_Caixa.Text)),72,FALSE);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',StrToFloatZero(Edit_Vl_Desconto_Caixa.Text)),90,FALSE);
         vlTotal := (StrToFloatZero(Edit_Vl_Parc_Caixa.Text) + StrToFloatZero(Edit_Vl_Juros_Caixa.Text)) - StrToFloatZero(Edit_Vl_Desconto_Caixa.Text);
      end;
      PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',vlTotal),105,TRUE);

      PrintFast1.ImprString('',PrintFast1.Repete('-',12),105,TRUE);
      PrintFast1.ImprString('','Valor Recebido ..................',72,FALSE);
      PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',vlTotal),105,TRUE);
      PrintFast1.ImprString('',' ',0,true);
      PrintFast1.ImprString('',Parametros.RAZAO_SOCIAL,5,TRUE);
      PrintFast1.ImprString('',' ',5,TRUE);
      PrintFast1.ImprString('',' ',5,TRUE);
      PrintFast1.ImprString('',PrintFast1.Repete('-',50),5,TRUE);
      PrintFast1.ImprComo(tCompr175);
      PrintFast1.ImprComo(pElite12);
      PrintFast1.ImprString('',PrintFast1.Repete('-',78),4,TRUE);

      PrintFast1.ImprString('',' ',5,TRUE);
      PrintFast1.Ejeta;
      PrintFast1.ImprComo(#27+'C'+CHR(66));

      PrintFast1.FimImpr;
   finally
      JvQuery.Close;
      JvQuery.Free;
   end;     }
end;

procedure TFrmCtaReceber.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('CtasReceber',IBQry_Pes);
end;

procedure TFrmCtaReceber.Calcula_Juros_Banco;
var vSelect : String;
   // JvQuery : TJvUIBDataset;
begin
   if (Msk_Dt_Pagto_Banc.Text <> '') and (ValiData(Msk_Dt_Pagto_Banc.Text)) then
   begin
   {   vSelect := '';
      vSelect := 'SELECT UDF_NVL(OVLR_JUROS) JUROS FROM CALCULA_JUROS('+ Trim(Edit_Controle_Banc.Text) +','''+ Trim(Edit_Documento_Banc.Text) +''','''+ FormatDateTime('mm/dd/yyyy',StrToDate(Msk_Dt_Pagto_Banc.Text)) +''')';
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta(vSelect,JvQuery) then Exit;
         if (JvQuery.RecordCount > 0) and (JvQuery.FieldByName('JUROS').asFloat > 0) then
         begin
            Edit_Vl_Juros_Banc.Text := FormatFloat('#,##0.00',JvQuery.FieldByName('JUROS').AsFloat);
         end
         else
         begin
            Edit_Vl_Juros_Banc.Text := '0';
         end;
         Calcula_Total_Banco;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmCtaReceber.Calcula_Juros_Caixa;
var vSelect : String;
    // JvQuery : TJvUIBDataset;
begin
   if (Msk_Dt_Pagto_Caixa.Text <> '') and (ValiData(Msk_Dt_Pagto_Caixa.Text)) then
   begin
   {   vSelect := '';
      vSelect := 'SELECT UDF_NVL(OVLR_JUROS) JUROS FROM CALCULA_JUROS('+ Trim(Edit_Controle_Caixa.Text) +','''+ Trim(Edit_Documento_Caixa.Text) +''','''+ FormatDateTime('mm/dd/yyyy',StrToDate(Msk_Dt_Pagto_Caixa.Text)) +''')';
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta(vSelect,JvQuery) then Exit;
         if (JvQuery.Recordcount > 0) and (JvQuery.FieldByName('JUROS').asFloat > 0) then
         begin
            Edit_Vl_Juros_Caixa.Text := FormatFloat('#,##0.00',JvQuery.FieldByName('JUROS').AsFloat);
         end
         else
         begin
            Edit_Vl_Juros_Caixa.Text := '0';
         end;
         Calcula_Total_Caixa;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmCtaReceber.Msk_Dt_Pagto_CaixaChange(Sender: TObject);
begin
   if Operacao = opInsert then
      Calcula_Juros_Caixa;
end;

procedure TFrmCtaReceber.Msk_Dt_Pagto_BancChange(Sender: TObject);
begin
   if Operacao = opInsert then
      Calcula_Juros_Banco;
end;

procedure TFrmCtaReceber.Calcula_Total_Banco;
begin
   Edit_Total_Banco.Text := FormatFloat('#,##0.00',StrToFloatZero(Edit_Vl_Parc_Banc.Text) + StrToFloatZero(Edit_Vl_Juros_Banc.Text) - StrToFloatZero(Edit_Vl_Desconto_Banc.Text));
end;

procedure TFrmCtaReceber.Calcula_Total_Caixa;
begin
   Edit_Total_Caixa.Text := FormatFloat('#,##0.00',StrToFloatZero(Edit_Vl_Parc_Caixa.Text) + StrToFloatZero(Edit_Vl_Juros_Caixa.Text) - StrToFloatZero(Edit_Vl_Desconto_Caixa.Text));
end;

procedure TFrmCtaReceber.Edit_Vl_Parc_BancChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      if Trim((Sender as TEdit).Text) <> '' then
         Calcula_Total_Banco;
   end;
end;

procedure TFrmCtaReceber.Edit_Vl_Parc_CaixaChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      if Trim((Sender as TEdit).Text) <> '' then
         Calcula_Total_Caixa;
   end;
end;

procedure TFrmCtaReceber.Btn_Quit_MultClick(Sender: TObject);
begin
   FrmMultiplasParcelas := TFrmMultiplasParcelas.Create(Self);
   FrmMultiplasParcelas.vSelect := vSelect_Quit;
   FrmMultiplasParcelas.vTot_Devedor := StrToFloat(TirarPonto(Panel_Atrazo_Juros.Caption));
   FrmMultiplasParcelas.Panel_Cod_Cliente.Caption := EditP_Cliente.Text;
   FrmMultiplasParcelas.Panel_Nome_Cliente.Caption := PanelPCliente.Caption;
   FrmMultiplasParcelas.ShowModal;
   FrmMultiplasParcelas.Release;
   FrmMultiplasParcelas := Nil;
end;

procedure TFrmCtaReceber.Edit_Vl_Parc_CaixaExit(Sender: TObject);
begin
   if (Operacao = opInsert) and (StrToFloatZero(TirarPonto(LabelSaldo.Caption)) > 0) and (StrToFloatZero(Edit_Vl_Parc_Caixa.Text) > StrToFloatZero(TirarPonto(LabelSaldo.Caption))) then
   begin
      Edit_Vl_Juros_Caixa.Text := FloatTostr(StrToFloatZero(Edit_Vl_Parc_Caixa.Text) - StrToFloatZero(TirarPonto(LabelSaldo.Caption)));
      Edit_Vl_Parc_Caixa.Text := (TirarPonto(LabelSaldo.Caption));
   end;
end;

procedure TFrmCtaReceber.Edit_Vl_Parc_BancExit(Sender: TObject);
begin
   if (StrToFloatZero(TirarPonto(LabelSaldo.Caption)) > 0) and (StrToFloatZero(Edit_Vl_Parc_Banc.Text) > StrToFloatZero(TirarPonto(LabelSaldo.Caption))) then
   begin
      Edit_Vl_Juros_Banc.Text := FloatToStr(StrToFloatZero(Edit_Vl_Parc_Banc.Text) - StrToFloatZero(TirarPonto(LabelSaldo.Caption)));
      Edit_Vl_Parc_Banc.Text := (TirarPonto(LabelSaldo.Caption));
   end;
end;

initialization
   {$i uctareceber.lrs}

end.


