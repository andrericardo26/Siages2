unit UParametros;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ExtCtrls, ComCtrls, StdCtrls, Buttons, Db, ExtDlgs, CheckLst,
  DBGrids, ActnList, LResources, MaskEdit, LCLType, ZDataset,
  ZAbstractRODataset, ZStoredProcedure;

type

  { TFrmParametros }

  TFrmParametros = class(TForm)
     Chk_PisCofins: TCheckBox;
     Chk_CSLL: TCheckBox;
     Chk_IRRF: TCheckBox;
     Edit_FunRural: TEdit;
     Edit_IRRF: TEdit;
     Edit_ISS: TEdit;
     F3_Config_Nota: TBitBtn;
     F3_FormaRec_Vista: TBitBtn;
     F3_FormaPag_Vista: TBitBtn;
     F3_Prod_Padrao_Bal: TBitBtn;
     dsParametros: TDatasource;
     Grid_Cod_Sequenciais: TdbGrid;
     Edit_CodFilial: TEdit;
     Edit_Esp_Impr_Ped: TEdit;
     Edit_Cod_VendPadrao: TEdit;
     Edit_NovoValor: TEdit;
     Edit_IniCod_Bal: TEdit;
     Edit_IniPreco_Bal: TEdit;
     Edit_QtdPreco_Bal: TEdit;
     Edit_QtdCod_Bal: TEdit;
     Edit_Custo_Fixo: TEdit;
     Edit_Custo_Aliq: TEdit;
     Edit_Cod_CliPadrao: TEdit;
     Edit_Cod_FormaPadrao: TEdit;
     Edit_Vl_Margem: TEdit;
     Edit_FormaRec_Vista: TEdit;
     Edit_FormaPag_Vista: TEdit;
     Edit_Juros_Diario: TEdit;
     Edit_Prod_Padrao_Bal: TEdit;
     Edit_DigIni_Bal: TEdit;
     GroupBox1: TGroupBox;
     GroupBox2: TGroupBox;
  //   JvQry_Gen: TJvUIBDataSet;
     Label2: TLabel;
     Label3: TLabel;
     Label4: TLabel;
    Paginas: TPageControl;
    Panel12: TPanel;
 //   Proc: TJvUIBQuery;
    TabEmpresa: TTabSheet;
    Panel7: TPanel;
    TabParametros: TTabSheet;
    Panel1: TPanel;
    MenuImageList: TImageList;
    Panel8: TPanel;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancela: TBitBtn;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BtnGravaPara: TBitBtn;
    BtnCancelaPara: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    bt_imagem: TSpeedButton;
    Label49: TLabel;
    Label52: TLabel;
    Edit_Razao_Social: TEdit;
    Edit_Endereco: TEdit;
    Edit_Cidade: TEdit;
    Edit_Inscricao: TEdit;
    Edit_Fone: TEdit;
    Edit_Fax: TEdit;
    Edit_Cep: TMaskEdit;
    Edit_Cgc: TMaskEdit;
    Edit_Bairro: TEdit;
    Panel16: TPanel;
    Image1: TImage;
    Edit_Pathlogo: TEdit;
    Edit_Insc_Municipal: TEdit;
    Edit_End_Complem: TEdit;
    Label1: TLabel;
    Edit_UF: TEdit;
    TabCodigos: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BtnGravaCod: TBitBtn;
    BtnCancelaCod: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel5: TPanel;
    Label5: TLabel;
    PanelNome: TPanel;
    Label6: TLabel;
    PanelVLCorrente: TPanel;
    Label7: TLabel;
    BtnAtualiza: TBitBtn;
    ScrollBox1: TScrollBox;
    Panel6: TPanel;
    Label17: TLabel;
    Label19: TLabel;
    F3_Cliente: TSpeedButton;
    PanelCliente: TPanel;
    Edit_Observacao: TEdit;
    Label20: TLabel;
    F3_Forma: TSpeedButton;
    PanelForma: TPanel;
    Label22: TLabel;
    Edit_Mensagem: TEdit;
    Label23: TLabel;
    F3_CFOP: TSpeedButton;
    PanelCfop: TPanel;
    Msk_CFOP: TMaskEdit;
    RG_Estq_Negativo: TRadioGroup;
    Panel10: TPanel;
    Panel11: TPanel;
    Chk_Usar_Balanca: TCheckBox;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Combo_Conteudo_Bal: TComboBox;
    Label29: TLabel;
    PanelProd_Padrao_bal: TPanel;
    Label30: TLabel;
    F3_Vendedor: TSpeedButton;
    PanelVendedor: TPanel;
    Chk_Imp_Cliente: TCheckBox;
    Chk_Imp_Vendedor: TCheckBox;
    Chk_Imp_Mensagem: TCheckBox;
    Chk_Testa_Preco: TCheckBox;
    Chk_Fecha_Rapido: TCheckBox;
    Chk_Margem_Seg: TCheckBox;
    PanelGenerator: TPanel;
    Label32: TLabel;
    Panel13: TPanel;
    Label33: TLabel;
    Edit_Nro_Nota: TEdit;
    Edit_Ser_Nota: TEdit;
    Label34: TLabel;
    PanelConfig_Nota: TPanel;
    Edit_Config_Nota: TEdit;
    Panel14: TPanel;
    GBox_MovCaixa: TGroupBox;
    Chk_CtaRec_MovCaixa: TCheckBox;
    Chk_CtaPag_MovCaixa: TCheckBox;
    GBox_MovBanco: TGroupBox;
    Chk_CtaRec_MovBanco: TCheckBox;
    Chk_CtaPag_MovBanco: TCheckBox;
    Panel15: TPanel;
    Label35: TLabel;
    PanelFormaRec_Vista: TPanel;
    Panel17: TPanel;
    Label36: TLabel;
    PanelFormaPag_Vista: TPanel;
    Panel19: TPanel;
    RG_Tipo_Custo: TRadioGroup;
    Chk_Calcula_Preco_Venda: TCheckBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Chk_Custo_Icms: TCheckBox;
    Label41: TLabel;
    Chk_Venda_Peso: TCheckBox;
    Label42: TLabel;
    Label43: TLabel;
    Chk_Gaveta_Dinheiro: TCheckBox;
    Chk_Vlr_Total_Posto: TCheckBox;
    Panel20: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label50: TLabel;
    Chk_CF_Adicional: TCheckBox;
    Chk_Descr_Produto_Venda: TCheckBox;
    Panel22: TPanel;
    Panel23: TPanel;
    Label54: TLabel;
    Chk_Cad_Mot_Veic: TCheckBox;
    Chk_Obs_Postos: TCheckBox;
    Panel24: TPanel;
    Label55: TLabel;
    Chk_Complemento_Produto_Venda: TCheckBox;
    Panel18: TPanel;
    Combo_Impr_Padrao: TComboBox;
    Label56: TLabel;
    RG_Usar_Filial: TRadioGroup;
    Chk_Busca_Chave: TCheckBox;
    Label51: TLabel;
    Label53: TLabel;
    Combo_Msk_Valor: TComboBox;
    Combo_Msk_Qtde: TComboBox;
    Panel9: TPanel;
    RG_Col_Impr_Ped: TRadioGroup;
    Chk_Cab_Impr_Ped: TCheckBox;
    Label57: TLabel;
    RG_Contr_Estq_Ped: TRadioGroup;
    Chk_Tot_Orc_Impr_Ped: TCheckBox;
    Chk_Altera_Estq_Direto: TCheckBox;
    RG_Impr_Ped_Balcao: TRadioGroup;
    zParamentros: TZQuery;
    zParamentrosALIQ_FUNR: TZBCDField;
    zParamentrosALIQ_IR: TZBCDField;
    zParamentrosALIQ_ISS: TZBCDField;
    zParamentrosALTERA_ESTQ_DIRETO: TZSmallIntField;
    zParamentrosBAIRRO: TZRawStringField;
    zParamentrosBUSCA_CHAVE: TZSmallIntField;
    zParamentrosCAB_IMPR_PED: TZSmallIntField;
    zParamentrosCAD_VEICULOS_MOTORISTAS: TZSmallIntField;
    zParamentrosCALCULA_PRECO_VENDA: TZSmallIntField;
    zParamentrosCEP: TZRawStringField;
    zParamentrosCF_ADICIONAL_PRAZO: TZSmallIntField;
    zParamentrosCGC: TZRawStringField;
    zParamentrosCIDADE: TZRawStringField;
    zParamentrosCOD: TZSmallIntField;
    zParamentrosCODFILIAL: TZIntegerField;
    zParamentrosCOD_CFOPPADRAO: TZRawStringField;
    zParamentrosCOD_CLIPADRAO: TZIntegerField;
    zParamentrosCOD_FORMAPADRAO: TZIntegerField;
    zParamentrosCOD_VENDPADRAO: TZIntegerField;
    zParamentrosCOL_IMPR_PED: TZIntegerField;
    zParamentrosCOMPLE_PROD_NOTA: TZSmallIntField;
    zParamentrosCONFIG_NOTA: TZRawStringField;
    zParamentrosCONTEUDO_BAL: TZSmallIntField;
    zParamentrosCONTR_ESTQ_PED: TZSmallIntField;
    zParamentrosCTAPAG_MOVBANCO: TZSmallIntField;
    zParamentrosCTAPAG_MOVCAIXA: TZSmallIntField;
    zParamentrosCTAREC_MOVBANCO: TZSmallIntField;
    zParamentrosCTAREC_MOVCAIXA: TZSmallIntField;
    zParamentrosCUSTO_ALIQ: TZBCDField;
    zParamentrosCUSTO_FIXO: TZBCDField;
    zParamentrosCUSTO_ICMS: TZSmallIntField;
    zParamentrosDESCR_PRODUTO_NOTA: TZSmallIntField;
    zParamentrosDIGINI_BAL: TZSmallIntField;
    zParamentrosENDERECO: TZRawStringField;
    zParamentrosEND_COMPLEM: TZRawStringField;
    zParamentrosESP_IMPR_PED: TZIntegerField;
    zParamentrosESTQ_NEGATIVO: TZSmallIntField;
    zParamentrosFAX: TZRawStringField;
    zParamentrosFECHA_RAPIDO: TZSmallIntField;
    zParamentrosFONE: TZRawStringField;
    zParamentrosFORMAPAG_VISTA: TZIntegerField;
    zParamentrosFORMAREC_VISTA: TZIntegerField;
    zParamentrosGAVETA_DINHEIRO: TZSmallIntField;
    zParamentrosIMPR_PADRAO: TZRawStringField;
    zParamentrosIMPR_PED_BALCAO: TZSmallIntField;
    zParamentrosIMP_CLIENTE: TZSmallIntField;
    zParamentrosIMP_MENSAGEM: TZSmallIntField;
    zParamentrosIMP_VENDEDOR: TZSmallIntField;
    zParamentrosIND_CSLL: TZSmallIntField;
    zParamentrosIND_IRRF: TZSmallIntField;
    zParamentrosIND_PISCOFINS: TZSmallIntField;
    zParamentrosINICIAR_PED: TZSmallIntField;
    zParamentrosINICOD_BAL: TZSmallIntField;
    zParamentrosINIPRECO_BAL: TZSmallIntField;
    zParamentrosINSCRICAO: TZRawStringField;
    zParamentrosINSC_MUNICIPAL: TZRawStringField;
    zParamentrosJUROS_DIARIO: TZBCDField;
    zParamentrosMARGEM_SEG: TZSmallIntField;
    zParamentrosMASK_QTDE: TZRawStringField;
    zParamentrosMASK_VALOR: TZRawStringField;
    zParamentrosMENSAGEM: TZRawStringField;
    zParamentrosOBSERVACAO: TZRawStringField;
    zParamentrosOBS_POSTO_COMB: TZSmallIntField;
    zParamentrosPATHLOGO: TZRawStringField;
    zParamentrosPROD_PADRAO_BAL: TZIntegerField;
    zParamentrosQTDCOD_BAL: TZSmallIntField;
    zParamentrosQTDPRECO_BAL: TZSmallIntField;
    zParamentrosRAZAO_SOCIAL: TZRawStringField;
    zParamentrosSER_NOTA: TZRawStringField;
    zParamentrosTESTA_PRECO: TZSmallIntField;
    zParamentrosTIPO_CUSTO: TZSmallIntField;
    zParamentrosTOT_ORC_IMPR_PED: TZSmallIntField;
    zParamentrosUF: TZRawStringField;
    zParamentrosUSAR_BALANCA: TZSmallIntField;
    zParamentrosUSAR_FILIAL: TZSmallIntField;
    zParamentrosVENDA_PESO_LIQ: TZSmallIntField;
    zParamentrosVERSAO_OF: TZSmallIntField;
    zParamentrosVLR_TOTAL_POSTO: TZSmallIntField;
    zParamentrosVL_MARGEM: TZBCDField;
    ZStoredProc1: TZStoredProc;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure Chk_PisCofinsClick(Sender: TObject);
    procedure Edit_Cod_CliPadraoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Cod_FormaPadraoChange(Sender: TObject);
    procedure Edit_Cod_FormaPadraoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Cod_VendPadraoChange(Sender: TObject);
    procedure Edit_Cod_VendPadraoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Config_NotaKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_FormaPag_VistaKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_FormaRec_VistaKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Prod_Padrao_BalChange(Sender: TObject);
    procedure Edit_Prod_Padrao_BalKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Edit_CepEnter(Sender: TObject);
    procedure Edit_CepExit(Sender: TObject);
    procedure Edit_CgcEnter(Sender: TObject);
    procedure Edit_CgcExit(Sender: TObject);
    procedure Edit_Razao_SocialChange(Sender: TObject);
    procedure Edit_CepChange(Sender: TObject);
    procedure Edit_CodFilialChange(Sender: TObject);
    procedure FrmParametrosPaint(Sender: TObject);
    procedure Grid_Cod_SequenciaisDblClick(Sender: TObject);
    procedure Msk_CFOPKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure bt_imagemClick(Sender: TObject);
    procedure Edit_PathlogoExit(Sender: TObject);
    procedure BtnAjudaClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure Edit_NovoValorChange(Sender: TObject);
    procedure BtnCancelaCodClick(Sender: TObject);
    procedure BtnGravaCodClick(Sender: TObject);
    procedure F3_ClienteClick(Sender: TObject);
    procedure Edit_Cod_CliPadraoExit(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure Edit_Cod_CliPadraoChange(Sender: TObject);
    procedure Edit_ObservacaoChange(Sender: TObject);
    procedure BtnGravaParaClick(Sender: TObject);
    procedure Edit_Cod_FormaPadraoExit(Sender: TObject);
    procedure BtnCancelaParaClick(Sender: TObject);
    procedure F3_FormaClick(Sender: TObject);
    procedure Msk_CFOPEnter(Sender: TObject);
    procedure Msk_CFOPExit(Sender: TObject);
    procedure F3_CFOPClick(Sender: TObject);
    procedure Msk_CFOPChange(Sender: TObject);
    procedure Chk_Usar_BalancaClick(Sender: TObject);
    procedure Combo_Conteudo_BalDropDown(Sender: TObject);
    procedure F3_Prod_Padrao_BalClick(Sender: TObject);
    procedure Edit_Prod_Padrao_BalExit(Sender: TObject);
    procedure Edit_Cod_VendPadraoExit(Sender: TObject);
    procedure F3_VendedorClick(Sender: TObject);
    procedure Chk_Imp_ClienteClick(Sender: TObject);
    procedure Chk_Margem_SegClick(Sender: TObject);
    procedure RG_Estq_NegativoClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure Edit_Config_NotaExit(Sender: TObject);
    procedure F3_Config_NotaClick(Sender: TObject);
    procedure Edit_FormaRec_VistaExit(Sender: TObject);
    procedure F3_FormaRec_VistaClick(Sender: TObject);
    procedure F3_FormaPag_VistaClick(Sender: TObject);
    procedure Edit_FormaPag_VistaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Chk_Calcula_Preco_VendaClick(Sender: TObject);
    procedure Combo_Msk_ValorChange(Sender: TObject);
    
  private
    { Private declarations }
    vOper : Integer;
    vCod : Integer;
  public
    { Public declarations }
  end;

var
  FrmParametros: TFrmParametros;

implementation

uses UPrincipal, Global, UConsulta;


procedure TFrmParametros.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmParametros.BtnGravaClick(Sender: TObject);
begin
   //Razao
   if Length(Trim(Edit_Razao_Social.Text)) = 0 then
   begin
      MessageDlg('Razão Social deve ser preenchida.', mtInformation,[mbOK],0);
      Edit_Razao_Social.SetFocus;
      Exit;
   end;
   //UF
   if Length(Trim(Edit_UF.Text)) = 0 then
   begin
      MessageDlg('UF deve ser preenchida.', mtInformation,[mbOK],0);
      Edit_UF.SetFocus;
      Exit;
   end;

   Carrega_Parametros;
//   FrmPrincipal.RodaSP(Proc);
   FormShow(Self);
   
   BtnGrava.Enabled := False;
   BtnCancela.Enabled := False;
   FrmPrincipal.Carrega_Parametros;
end;

procedure TFrmParametros.BtnCancelaClick(Sender: TObject);
begin
   FormShow(self);
   BtnGrava.Enabled := False;
   BtnCancela.Enabled := False;
end;

procedure TFrmParametros.Chk_PisCofinsClick(Sender: TObject);
begin
   BtnGrava.Enabled := True;
   BtnCancela.Enabled := True;
end;

procedure TFrmParametros.Edit_Cod_CliPadraoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_ClienteClick(Self);
end;

procedure TFrmParametros.Edit_Cod_FormaPadraoChange(Sender: TObject);
begin

end;

procedure TFrmParametros.Edit_Cod_FormaPadraoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_FormaClick(Self);
end;

procedure TFrmParametros.Edit_Cod_VendPadraoChange(Sender: TObject);
begin

end;

procedure TFrmParametros.Edit_Cod_VendPadraoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_VendedorClick(Self);
end;

procedure TFrmParametros.Edit_Config_NotaKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_Config_NotaClick(Self);
end;

procedure TFrmParametros.Edit_FormaPag_VistaKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_FormaPag_VistaClick(Self);
end;

procedure TFrmParametros.Edit_FormaRec_VistaKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_FormaRec_VistaClick(Self);
end;

procedure TFrmParametros.Edit_Prod_Padrao_BalChange(Sender: TObject);
begin

end;

procedure TFrmParametros.Edit_Prod_Padrao_BalKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_Prod_Padrao_BalClick(Self);
end;

procedure TFrmParametros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmParametros.Carrega_Parametros;
begin
   with zParamentros do
   begin
      FieldByName('RAZAO_SOCIAL').AsString := Edit_Razao_Social.Text;
      FieldByName('ENDERECO').AsString := Edit_Endereco.Text;
      FieldByName('END_COMPLEM').AsString := Edit_End_Complem.Text;
      FieldByName('BAIRRO').AsString := Edit_Bairro.Text;
      FieldByName('CIDADE').AsString := Edit_Cidade.Text;
      FieldByName('UF').AsString := Edit_UF.Text;
      FieldByName('CEP').AsString := Edit_Cep.Text;
      FieldByName('CGC').AsString := Edit_Cgc.Text;
      FieldByName('INSCRICAO').AsString := Edit_Inscricao.Text;

      //Codigo das chaves primarias ao incluir
      FieldByName('BUSCA_CHAVE').AsInteger := IIF(Chk_Busca_Chave.Checked,1,0);
   end;
      {
      if vCod <> 0 then
         Params.ByNameAsInteger['POPER'] := 1
      else
         Params.ByNameAsInteger['POPER'] := 0;
      Params.ByNameAsInteger['PCOD'] := 1;

      Params.ByNameAsString['PINSC_MUNICIPAL'] := Edit_Insc_Municipal.Text;
      Params.ByNameAsString['PFONE'] := Edit_Fone.Text;
      Params.ByNameAsString['PFAX'] := Edit_Fax.Text;
      Params.ByNameAsString['PPATHLOGO'] := Edit_Pathlogo.Text;
      Params.ByNameAsInteger['PCODFILIAL'] := StrToIntZero(Edit_CodFilial.Text);
      Params.ByNameAsCurrency['PALIQ_ISS'] := StrToFloatZero(Edit_ISS.Text);

      Params.ByNameAsCurrency['PALIQ_IR'] := StrToFloatZero(Edit_IRRF.Text);
      Params.ByNameAsCurrency['PALIQ_ISS'] := StrToFloatZero(Edit_ISS.Text);
      Params.ByNameAsCurrency['PALIQ_FUNR'] := StrToFloatZero(Edit_FunRural.Text);

      Params.ByNameAsInteger['PIND_PISCOFINS'] := IIF(Chk_PisCofins.Checked,1,0);
      Params.ByNameAsInteger['PIND_CSLL'] := IIF(Chk_CSLL.Checked,1,0);
      Params.ByNameAsInteger['PIND_IRRF'] := IIF(Chk_IRRF.Checked,1,0);

      Params.ByNameAsInteger['PUSAR_FILIAL'] := RG_Usar_Filial.ItemIndex;
      //Aba dos Parametros
      //CLIENTES
      if StrToIntZero(Edit_Cod_CliPadrao.Text) > 0 then
         Params.ByNameAsInteger['PCOD_CLIPADRAO'] := StrToIntZero(Edit_Cod_CliPadrao.Text)
      else
         Params.ByNameIsNull['PCOD_CLIPADRAO'] := True;
      //FORMA DE PAGAMENTO
      if StrToIntZero(Edit_Cod_FormaPadrao.Text) > 0 then
         Params.ByNameAsInteger['PCOD_FORMAPADRAO'] := StrToIntZero(Edit_Cod_FormaPadrao.Text)
      else
         Params.ByNameIsNull['PCOD_FORMAPADRAO'] := True;
      //CFOP PADRAO
      if Msk_CFOP.Text <> '' then
         Params.ByNameAsString['PCOD_CFOPPADRAO'] := Msk_CFOP.Text
      else
         Params.ByNameIsNull['PCOD_CFOPPADRAO'] := True;
      //Vendedor
      if StrToIntZero(Edit_Cod_VendPadrao.Text) > 0 then
         Params.ByNameAsInteger['PCOD_VENDPADRAO'] := StrToIntZero(Edit_Cod_VendPadrao.Text)
      else
         Params.ByNameIsNull['PCOD_VENDPADRAO'] := True;

      Params.ByNameAsString['POBSERVACAO'] := Edit_Observacao.Text;
      Params.ByNameAsString['PMENSAGEM'] := Edit_Mensagem.Text;

      //Imprime cliente
      if Chk_Imp_Cliente.Checked then
         Params.ByNameAsInteger['PIMP_CLIENTE'] := 1
      else
         Params.ByNameAsInteger['PIMP_CLIENTE'] := 0;
      //Imprime Vendedor
      if Chk_Imp_Vendedor.Checked then
         Params.ByNameAsInteger['PIMP_VENDEDOR'] := 1
      else
         Params.ByNameAsInteger['PIMP_VENDEDOR'] := 0;
      //Imprime Mensagem
      if Chk_Imp_Mensagem.Checked then
         Params.ByNameAsInteger['PIMP_MENSAGEM'] := 1
      else
         Params.ByNameAsInteger['PIMP_MENSAGEM'] := 0;
      //Testa Preco antes de vender produto
      if Chk_Testa_Preco.Checked then
         Params.ByNameAsInteger['PTESTA_PRECO'] := 1
      else
         Params.ByNameAsInteger['PTESTA_PRECO'] := 0;
      //Fechamento rápido
      if Chk_Fecha_Rapido.Checked then
         Params.ByNameAsInteger['PFECHA_RAPIDO'] := 1
      else
         Params.ByNameAsInteger['PFECHA_RAPIDO'] := 0;

      //Margem de Segurança
      if Chk_Margem_Seg.Checked then
         Params.ByNameAsInteger['PMARGEM_SEG'] := 1
      else
         Params.ByNameAsInteger['PMARGEM_SEG'] := 0;
      Params.ByNameAsCurrency['PVL_MARGEM'] := StrToFloatZero(Edit_Vl_Margem.Text);

      //Utilizacao da balanca
      if not Chk_Usar_Balanca.Checked then
         Params.ByNameAsInteger['PUSAR_BALANCA'] := 0
      else
         Params.ByNameAsInteger['PUSAR_BALANCA'] := 1;
      Params.ByNameAsInteger['PCONTEUDO_BAL'] := Combo_Conteudo_Bal.ItemIndex;
      Params.ByNameAsInteger['PDIGINI_BAL'] := StrToIntZero(Edit_DigIni_Bal.Text);
      Params.ByNameAsInteger['PINICOD_BAL'] := StrToIntZero(Edit_IniCod_Bal.Text);
      Params.ByNameAsInteger['PQTDCOD_BAL'] := StrToIntZero(Edit_QtdCod_Bal.Text);
      Params.ByNameAsInteger['PINIPRECO_BAL'] := StrToIntZero(Edit_IniPreco_Bal.Text);
      Params.ByNameAsInteger['PQTDPRECO_BAL'] := StrToIntZero(Edit_QtdPreco_Bal.Text);
      //Produto padrao na balanca
      if StrToIntZero(Edit_Prod_Padrao_Bal.Text) > 0 then
         Params.ByNameAsInteger['PPROD_PADRAO_BAL'] := StrToIntZero(Edit_Prod_Padrao_Bal.Text)
      else
         Params.ByNameIsNull['PPROD_PADRAO_BAL'] := True;
      //Estoque Minimo e Negativo
      Params.ByNameAsInteger['PESTQ_NEGATIVO'] := RG_Estq_Negativo.ItemIndex;
      Params.ByNameAsInteger['PALTERA_ESTQ_DIRETO'] := IIF(Chk_Altera_Estq_Direto.Checked,1,0);
      //Nota Fiscal
      Params.ByNameAsString['PSER_NOTA'] := Edit_Ser_Nota.Text;
      if Trim(Edit_Config_Nota.Text) = '' then
         Params.ByNameIsNull['PCONFIG_NOTA'] := True
      else
         Params.ByNameAsString['PCONFIG_NOTA'] := Edit_Config_Nota.Text;
      //Financeiro
      Params.ByNameAsInteger['PCTAREC_MOVCAIXA'] := IIF(Chk_CtaRec_MovCaixa.Checked,1,0);
      Params.ByNameAsInteger['PCTAPAG_MOVCAIXA'] := IIF(Chk_CtaPag_MovCaixa.Checked,1,0);
      Params.ByNameAsInteger['PCTAREC_MOVBANCO'] := IIF(Chk_CtaRec_MovBanco.Checked,1,0);
      Params.ByNameAsInteger['PCTAPAG_MOVBANCO'] := IIF(Chk_CtaPag_MovBanco.Checked,1,0);
      //Forma de Recebimento a Vista
      if StrToIntZero(Edit_FormaRec_Vista.Text) > 0 then
         Params.ByNameAsInteger['PFORMAREC_VISTA'] := StrToIntZero(Edit_FormaRec_Vista.Text)
      else
        Params.ByNameIsNull['PFORMAREC_VISTA'] := True;
      //Forma de Pagamento a Vista
      if StrToIntZero(Edit_FormaPag_Vista.Text) > 0 then
         Params.ByNameAsInteger['PFORMAPAG_VISTA'] := StrToIntZero(Edit_FormaPag_Vista.Text)
      else
         Params.ByNameIsNull['PFORMAPAG_VISTA'] := True;
      //Impressora Padrão
      if Combo_Impr_Padrao.ItemIndex >= 0 then
         Params.ByNameAsString['PIMPR_PADRAO'] := Combo_Impr_Padrao.Text
      else
         Params.ByNameIsNull['PIMPR_PADRAO'] := True;
      //Preço de Custo
      Params.ByNameAsInteger['PTIPO_CUSTO'] := RG_Tipo_Custo.ItemIndex;
      if Chk_Calcula_Preco_Venda.Checked then
         Params.ByNameAsInteger['PCALCULA_PRECO_VENDA'] := 1
      else
         Params.ByNameAsInteger['PCALCULA_PRECO_VENDA'] := 0;
      Params.ByNameAsCurrency['PCUSTO_FIXO'] := StrToFloatZero(Edit_Custo_Fixo.Text);
      Params.ByNameAsCurrency['PCUSTO_ALIQ'] := StrToFloatZero(Edit_Custo_Aliq.Text);
      if Chk_Custo_Icms.Checked then
         Params.ByNameAsInteger['PCUSTO_ICMS'] := 1
      else
         Params.ByNameAsInteger['PCUSTO_ICMS'] := 0;
      //Peso liquido nas vendas / devolucoes
      if Chk_Venda_Peso.Checked then
         Params.ByNameAsInteger['PVENDA_PESO_LIQ'] := 1
      else
         Params.ByNameAsInteger['PVENDA_PESO_LIQ'] := 0;
      //Juros Diario
      Params.ByNameAsCurrency['PJUROS_DIARIO'] := StrToFloatZero(Edit_Juros_Diario.Text);
      //Gaveta Dinheiro
      Params.ByNameAsInteger['PGAVETA_DINHEIRO'] := IIF(Chk_Gaveta_Dinheiro.Checked,1,0);
      //Valor toptal informado na tela de vendas rapidas como Valor Unitario.
      Params.ByNameAsInteger['PVLR_TOTAL_POSTO'] := IIF(Chk_Vlr_Total_Posto.Checked,1,0);
      //Imprime Cupom Fiscal Adicional para vendas a Prazo
      Params.ByNameAsInteger['PCF_ADICIONAL_PRAZO'] := IIF(Chk_CF_Adicional.Checked,1,0);
      //Altera nome do produto na hora da venda
      Params.ByNameAsInteger['PDESCR_PRODUTO_NOTA'] := IIF(Chk_Descr_Produto_Venda.Checked,1,0);
      //Mostra o cadastro de veiculos e motoristas
      Params.ByNameAsInteger['PCAD_VEICULOS_MOTORISTAS'] := IIF(Chk_Cad_Mot_Veic.Checked,1,0);
      //Mostra as OBS de postos de comb.  - Kilometragem, frota etc...
      Params.ByNameAsInteger['POBS_POSTO_COMB'] := IIF(Chk_Obs_Postos.Checked,1,0);
      //Utiliza varias linhas na impressao dos produtos nas notas fiscais
      Params.ByNameAsInteger['PCOMPLE_PROD_NOTA'] := IIF(Chk_Complemento_Produto_Venda.Checked,1,0);

      //Mascaras de Valores e Quantidades
      Params.ByNameAsString['PMASK_VALOR'] := Combo_Msk_Valor.Text;
      Params.ByNameAsString['PMASK_QTDE'] := Combo_Msk_Qtde.Text;


      //Pedidos
      Params.ByNameAsInteger['PCOL_IMPR_PED'] := RG_Col_Impr_Ped.ItemIndex;
      Params.ByNameAsInteger['PCAB_IMPR_PED'] := IIF(Chk_Cab_Impr_Ped.Checked,1,0);
      Params.ByNameAsInteger['PIMPR_PED_BALCAO'] := RG_Impr_Ped_Balcao.ItemIndex;
      Params.ByNameAsInteger['PESP_IMPR_PED'] := StrToIntZero(Edit_Esp_Impr_Ped.Text);
      Params.ByNameAsInteger['PCONTR_ESTQ_PED'] := RG_Contr_Estq_Ped.ItemIndex;
      Params.ByNameAsInteger['PTOT_ORC_IMPR_PED'] := IIF(Chk_Tot_Orc_Impr_Ped.Checked,1,0);
   end;     }
end;

procedure TFrmParametros.Carrega_Campos(oDataSet: TDataSet);
// var JvQry_NroNF : TJvUIBDataset;
begin
   with oDataset do
   begin
      Edit_Razao_Social.Text := FieldByName('RAZAO_SOCIAL').asString;
      Edit_Endereco.Text := FieldByName('ENDERECO').asString;
      Edit_End_Complem.Text := FieldByName('END_COMPLEM').asString;
      Edit_Bairro.Text := FieldByName('BAIRRO').asString;
      Edit_Cidade.Text := FieldByName('CIDADE').asString;
      Edit_UF.Text := FieldByName('UF').asString;
      //Cep
      Edit_CepEnter(Edit_Cep);
      Edit_Cep.Text := FieldByName('CEP').asString;
      Edit_CepExit(Edit_Cep);
      //cgc
      Edit_CgcEnter(Edit_Cgc);
      Edit_Cgc.Text := FieldByName('CGC').asString;
      Edit_CgcExit(Edit_Cgc);
      Edit_Inscricao.Text := FieldByName('INSCRICAO').asString;
      Edit_Insc_Municipal.Text := FieldByName('INSC_MUNICIPAL').asString;
      Edit_Fone.Text := FieldByName('FONE').asString;
      Edit_Fax.Text := FieldByName('FAX').asString;
      Edit_Pathlogo.Text := FieldByName('PATHLOGO').asString;
      Edit_PathlogoExit(Self);
      Edit_CodFilial.text := FieldByName('CODFILIAL').AsString;

      Chk_PisCofins.Checked := IIF(FieldByName('IND_PISCOFINS').AsInteger = 1,True,False);
      Chk_CSLL.Checked := IIF(FieldByName('IND_CSLL').AsInteger = 1,True,False);
      Chk_IRRF.Checked := IIF(FieldByName('IND_IRRF').AsInteger = 1,True,False);
      
      Edit_IRRF.text := FieldByName('ALIQ_IR').AsString;
      Edit_ISS.text := FieldByName('ALIQ_ISS').AsString;
      Edit_FunRural.Text := FieldByName('ALIQ_FUNR').AsString;

      //CLIENTE
      Edit_Cod_CliPadrao.Text := FieldByName('COD_CLIPADRAO').AsString;
      Edit_Cod_CliPadraoExit(self);
      //FORMA DE PAGAMENTO
      Edit_Cod_FormaPadrao.Text := FieldByName('COD_FORMAPADRAO').AsString;
      Edit_Cod_FormaPadraoExit(self);
      //Codigo Fiscal
      Msk_CFOPEnter(Msk_CFOP);
      Msk_CFOP.Text := FieldByName('COD_CFOPPADRAO').AsString;
      Msk_CFOPExit(Msk_CFOP);
      //Vendedor
      Edit_Cod_VendPadrao.Text := FieldByName('COD_VENDPADRAO').AsString;
      Edit_Cod_VendPadraoExit(self);
      Edit_Observacao.Text := FieldByName('OBSERVACAO').asString;
      Edit_Mensagem.Text := FieldByName('MENSAGEM').asString;
      RG_Usar_Filial.ItemIndex := FieldByName('USAR_FILIAL').AsInteger;

      //Utilizacao da balanca
      if FieldByName('USAR_BALANCA').asInteger = 0 then
         Chk_Usar_Balanca.Checked := False
      else
         Chk_Usar_Balanca.Checked := True;
      Chk_Usar_BalancaClick(Self);

      Combo_Conteudo_Bal.ItemIndex := FieldByName('CONTEUDO_BAL').asInteger;
      Edit_DigIni_Bal.Text := FieldByName('DIGINI_BAL').AsString;
      Edit_IniCod_Bal.Text := FieldByName('INICOD_BAL').AsString;
      Edit_QtdCod_Bal.Text := FieldByName('QTDCOD_BAL').AsString;
      Edit_IniPreco_Bal.Text := FieldByName('INIPRECO_BAL').AsString;
      Edit_QtdPreco_Bal.Text := FieldByName('QTDPRECO_BAL').AsString;
      Edit_Prod_Padrao_Bal.Text := FieldByName('PROD_PADRAO_BAL').AsString;
      Edit_Prod_Padrao_BalExit(Self);
      //Imprime cliente
      if FieldByName('IMP_CLIENTE').asInteger = 0 then
         Chk_Imp_Cliente.Checked := False
      else
         Chk_Imp_Cliente.Checked := True;
      //Imprime Vendedor
      if FieldByName('IMP_VENDEDOR').asInteger = 0 then
         Chk_Imp_Vendedor.Checked := False
      else
         Chk_Imp_Vendedor.Checked := True;
      //Imprime Mensagem
      if FieldByName('IMP_MENSAGEM').asInteger = 0 then
         Chk_Imp_Mensagem.Checked := False
      else
         Chk_Imp_Mensagem.Checked := True;
      //Testa Preco antes de vender produto
      if FieldByName('TESTA_PRECO').asInteger = 0 then
         Chk_Testa_Preco.Checked := False
      else
         Chk_Testa_Preco.Checked := True;
      //Fechamento rápido
      if FieldByName('FECHA_RAPIDO').asInteger = 0 then
         Chk_Fecha_Rapido.Checked := False
      else
         Chk_Fecha_Rapido.Checked := True;

      //Margem de Segurança
      if FieldByName('MARGEM_SEG').asInteger = 0 then
         Chk_Margem_Seg.Checked := False
      else
         Chk_Margem_Seg.Checked := True;
      Edit_Vl_Margem.Text := FieldByName('VL_MARGEM').AsString;

      //Estoque
      RG_Estq_Negativo.ItemIndex := FieldByName('ESTQ_NEGATIVO').AsInteger;
      Chk_Altera_Estq_Direto.Checked := IIF(FieldByName('ALTERA_ESTQ_DIRETO').asInteger = 1,True,False);
      
      //Nota Fiscal
{      JvQry_NroNF := TJvUIBDataset.Create(self);
      try
         JvQry_NroNF.Database := FrmPrincipal.Base;
         JvQry_NroNF.Transaction := FrmPrincipal.Transaction;
         
         JvQry_NroNF.SQL.Clear;
         JvQry_NroNF.SQL.Add('Select GEN_ID(GEN_NOTA_FISCAL, 0) CURRENT_VALUE from RDB$DATABASE');
         JvQry_NroNF.Open;
         Edit_Nro_Nota.Text := StrZero(JvQry_NroNF.FieldByName('CURRENT_VALUE').asFloat,6,0);
         JvQry_NroNF.Close;
      finally
         JvQry_NroNF.Close;
         JvQry_NroNF.Free;
      end;        }

      Edit_Ser_Nota.Text := FieldByName('SER_NOTA').asString;
      Edit_Config_Nota.Text := FieldByName('CONFIG_NOTA').asString;
      Edit_Config_NotaExit(Self);
      //Financeiro
      Chk_CtaRec_MovCaixa.Checked := IIF(FieldByName('CTAREC_MOVCAIXA').asInteger = 1,True,False);
      Chk_CtaPag_MovCaixa.Checked := IIF(FieldByName('CTAPAG_MOVCAIXA').asInteger = 1,True,False);
      Chk_CtaRec_MovBanco.Checked := IIF(FieldByName('CTAREC_MOVBANCO').asInteger = 1,True,False);
      Chk_CtaPag_MovBanco.Checked := IIF(FieldByName('CTAPAG_MOVBANCO').asInteger = 1,True,False);
      //Forma de Recebimento a Vista
      Edit_FormaRec_Vista.Text := FieldByName('FORMAREC_VISTA').AsString;
      Edit_FormaRec_VistaExit(self);
      //Forma de Pagamento a Vista
      Edit_FormaPag_Vista.Text := FieldByName('FORMAPAG_VISTA').AsString;
      Edit_FormaPag_VistaExit(self);
      //Impressora Padrão
      Combo_Impr_Padrao.ItemIndex := Procura_Item_ComboList(Combo_Impr_Padrao,FieldByName('IMPR_PADRAO').asString);
      //Preco de Custo
      RG_Tipo_Custo.ItemIndex := FieldByName('TIPO_CUSTO').asInteger;
      //Preco de Venda
      if FieldByName('CALCULA_PRECO_VENDA').asInteger = 0 then
         Chk_Calcula_Preco_Venda.Checked := False
      else
         Chk_Calcula_Preco_Venda.Checked := True;
      Chk_Calcula_Preco_VendaClick(Self);
      Edit_Custo_Fixo.Text := FieldByName('CUSTO_FIXO').AsString;
      Edit_Custo_Aliq.Text := FieldByName('CUSTO_ALIQ').AsString;
      if FieldByName('CUSTO_ICMS').asInteger = 0 then
         Chk_Custo_Icms.Checked := False
      else
         Chk_Custo_Icms.Checked := True;
      //Peso liquido nas vendas / devolucoes
      if FieldByName('VENDA_PESO_LIQ').asInteger = 0 then
         Chk_Venda_Peso.Checked := False
      else
         Chk_Venda_Peso.Checked := True;

      //Juros Diario
      Edit_Juros_Diario.Text := FieldByName('JUROS_DIARIO').AsString;

      //Gaveta Dinheiro
      Chk_Gaveta_Dinheiro.Checked := IIF(FieldByName('GAVETA_DINHEIRO').asInteger = 1,True,False);

      //Valor toptal informado na tela de vendas rapidas como Valor Unitario.
      Chk_Vlr_Total_Posto.Checked := IIF(FieldByName('VLR_TOTAL_POSTO').asInteger = 1,True,False);

      //Imprime Cupom Fiscal Adicional para vendas a Prazo
      Chk_CF_Adicional.Checked := IIF(FieldByName('CF_ADICIONAL_PRAZO').asInteger = 1,True,False);

      //Altera descricao dos produtos na hora da venda
      Chk_Descr_Produto_Venda.Checked := IIF(FieldByName('DESCR_PRODUTO_NOTA').asInteger = 1,True,False);

      //Mostra o cadastro de veiculos e motoristas
      Chk_Cad_Mot_Veic.Checked := IIF(FieldByName('CAD_VEICULOS_MOTORISTAS').asInteger = 1,True,False);

      //Mostra as OBS de postos de comb.  - Kilometragem, frota etc...
      Chk_Obs_Postos.Checked := IIF(FieldByName('OBS_POSTO_COMB').asInteger = 1,True,False);

      //Utiliza varias linhas na impressao dos produtos nas notas fiscais
      Chk_Complemento_Produto_Venda.Checked := IIF(FieldByName('COMPLE_PROD_NOTA').asInteger = 1,True,False);

      //Mascaras de Valor e Quantidade
      Combo_Msk_Valor.Text := FieldByName('MASK_VALOR').asString;
      Combo_Msk_Qtde.Text := FieldByName('MASK_QTDE').asString;

      //Codigo das chaves primarias ao incluir
      Chk_Busca_Chave.Checked := IIF(FieldByName('BUSCA_CHAVE').asInteger = 1,True,False);

      //Pedidos
      RG_Col_Impr_Ped.ItemIndex := FieldByName('COL_IMPR_PED').asInteger;
      Chk_Cab_Impr_Ped.Checked := IIF(FieldByName('CAB_IMPR_PED').asInteger = 1,True,False);
      RG_Impr_Ped_Balcao.ItemIndex := FieldByName('IMPR_PED_BALCAO').asInteger;
      Edit_Esp_Impr_Ped.Text := FieldByName('ESP_IMPR_PED').AsString;
      RG_Contr_Estq_Ped.ItemIndex := FieldByName('CONTR_ESTQ_PED').asInteger;
      Chk_Tot_Orc_Impr_Ped.Checked := IIF(FieldByName('TOT_ORC_IMPR_PED').asInteger = 1,True,False);
   end;
end;

procedure TFrmParametros.FormShow(Sender: TObject);
var zQuery : TZQuery;
begin
   zQuery := TZQuery.Create(self);
   try
{      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction; }

      zQuery.Connection := FrmPrincipal.Conexao;

      if not FrmPrincipal.RodaConsulta('Select * from Parametros ',zQuery) then Exit;

      if zQuery.RecordCount > 0 then
      begin
         vCod := zQuery.FieldByName('COD').asInteger;
         Carrega_Campos(zParamentros);
         TabParametros.TabVisible := True;
         vCod := 1;
      end
      else
      begin
         vCod := 0;
         TabParametros.TabVisible := False;
      end;
   finally
      zQuery.Close;
      zQuery.Free;
   end;
   BtnGrava.Enabled := False;
   BtnCancela.Enabled := False;
   BtnGravaCod.Enabled := False;
   BtnCancelaCod.Enabled := False;
   BtnGravaPara.Enabled := False;
   BtnCancelaPara.Enabled := False;
end;

procedure TFrmParametros.Edit_CepEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99999-999;1;_';
      (Sender as TMaskEdit).SelectAll;
   end;
end;

procedure TFrmParametros.Edit_CepExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '-' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmParametros.Edit_CgcEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99.999.999/9999-99;1;_';
   end;
end;

procedure TFrmParametros.Edit_CgcExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '.   .   /    -' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmParametros.Edit_Razao_SocialChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      BtnGrava.Enabled := True;
      BtnCancela.Enabled := True;
   end;
end;

procedure TFrmParametros.Edit_CepChange(Sender: TObject);
begin
   If (Sender as TMaskEdit).Modified then
   begin
      BtnGrava.Enabled := True;
      BtnCancela.Enabled := True;
   end;
end;

procedure TFrmParametros.Edit_CodFilialChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      BtnGrava.Enabled := True;
      BtnCancela.Enabled := True;
   end;
end;

procedure TFrmParametros.FrmParametrosPaint(Sender: TObject);
begin
   //ScrollBox1.VertScrollBar.Position := 0;
   ScrollBox1.UpdateScrollbars;
end;

procedure TFrmParametros.Grid_Cod_SequenciaisDblClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
{   JvQuery := TJvUIBDataset.Create(self);
   try
      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction;
      if not FrmPrincipal.RodaConsulta('Select Gen_ID('+ JvQry_Gen.FieldByName('GENERATORS').asString +',0) as CONTROLE from RDB$DATABASE' ,JvQuery) then
      begin
         Raise EDatabaseError.Create('Controle não pode ser carregado. Feche a aplicação e tente novamente.');
      end
      else
      begin
         PanelVLCorrente.Caption := JvQuery.FieldByName('CONTROLE').AsString;
      end;
   except
      JvQuery.Close;
      JvQuery.Free;
   end; }
   Edit_NovoValor.Text := '0';
   Edit_NovoValor.SetFocus;
end;

procedure TFrmParametros.Msk_CFOPKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_CFOPClick(Self);
end;

procedure TFrmParametros.bt_imagemClick(Sender: TObject);
begin
   if OpenPictureDialog1.Execute then
   begin
      Edit_Pathlogo.Text := OpenPictureDialog1.FileName;
      Edit_Pathlogo.Modified := True;
      Edit_PathlogoExit(self);
      Edit_Pathlogo.SetFocus;
   end;
   Edit_Razao_SocialChange(Edit_Pathlogo);
end;

procedure TFrmParametros.Edit_PathlogoExit(Sender: TObject);
begin
   if Trim(Edit_PathLogo.Text) <> '' then
   begin
      if FileExists(Edit_PathLogo.Text) then
         Image1.Picture.LoadFromFile((Trim(Edit_PathLogo.Text)))
      else
      begin
         MessageDlg('Arquivo inválido.'+#13+'"'+ Edit_PathLogo.Text +'"',mtWarning,[mbOK],0);
         Edit_PathLogo.SetFocus;
      end;
   end
   else
      Image1.Picture := nil;
end;

procedure TFrmParametros.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmParametros.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 //  PanelNome.Caption := JvQry_Gen.FieldByName('NOME').asString;
 //  PanelGenerator.Caption := JvQry_Gen.FieldByName('GENERATORS').asString;
   //PanelVLCorrente.Caption := JvQry_Gen.FieldByName('CURRENT_VALUE').asString;
   Edit_NovoValor.Text := '0';
end;

procedure TFrmParametros.BtnAtualizaClick(Sender: TObject);
var vSelect : String;
begin
   dsParametros.DataSet := nil;
   Grid_Cod_Sequenciais.DataSource := nil;
   
   vSelect :=           ' SELECT ';
   vSelect := vSelect + ' RDB$GENERATOR_ID AS NRO, ';
   vSelect := vSelect + ' RDB$GENERATOR_NAME AS GENERATORS, ';
   vSelect := vSelect + ' SUBSTRING(RDB$GENERATOR_NAME FROM 5 FOR 30) AS NOME ';
   vSelect := vSelect + ' FROM ';
   vSelect := vSelect + ' RDB$GENERATORS, ';
   vSelect := vSelect + ' RDB$DATABASE ';
   vSelect := vSelect + ' WHERE ';
   vSelect := vSelect + ' RDB$GENERATORS.RDB$SYSTEM_FLAG is NULL ';
         {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Gen)) and not (JvQry_Gen.BOF and JvQry_Gen.EOF) then
   begin
      dsParametros.dataset := (JvQry_Gen as Tdataset);
      Grid_Cod_Sequenciais.DataSource := dsParametros;
   end; }
end;

procedure TFrmParametros.Edit_NovoValorChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      BtnGravaCod.Enabled := True;
      BtnCancelaCod.Enabled := True;
   end;
end;

procedure TFrmParametros.BtnCancelaCodClick(Sender: TObject);
begin
   BtnGravaCod.Enabled := False;
   BtnCancelaCod.Enabled := False;
   Edit_NovoValor.Text := '0';
end;

procedure TFrmParametros.BtnGravaCodClick(Sender: TObject);
// var JvQuery : TJvUIBQuery;
begin                               {
   if FrmPrincipal.RodaComando('SET GENERATOR '+ Trim(PanelGenerator.Caption) +' TO '+ Edit_NovoValor.Text +';') then
      MessageDlg(Trim(PanelNome.Caption) + ' alterado para '+ Edit_NovoValor.Text +' com sucesso.', mtInformation,[mbOK],0)
   else
      MessageDlg(Trim(PanelNome.Caption) + ' não pode ser alterado.', mtInformation,[mbOK],0);
   BtnAtualizaClick(self);
   Edit_NovoValor.Text := '0';
   BtnGravaCod.Enabled := False;
   BtnCancelaCod.Enabled := False; }
end;

procedure TFrmParametros.F3_ClienteClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from CLIENTES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
         // Edit_Cod_CliPadrao.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Cod_CliPadrao.Modified := True;
         Edit_Cod_CliPadraoChange(Edit_Cod_CliPadrao);
         Edit_Cod_CliPadraoExit(Self);
         Edit_Cod_CliPadrao.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmParametros.Edit_Cod_CliPadraoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cod_CliPadrao.Text)) <> 0) and (Trim(Edit_Cod_CliPadrao.Text) <> '0') then
   begin
   {   JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From CLIENTES where Codigo='+ Edit_Cod_CliPadrao.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCliente.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            PanelCliente.Caption := '';
            Edit_Cod_CliPadrao.SetFocus;
        end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Cod_CliPadrao.Text := '0';
      PanelCliente.Caption := '';
   end;
end;

procedure TFrmParametros.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if (BtnGrava.Enabled = True) or (BtnGravaCod.Enabled = True) or (BtnGravaPara.Enabled = True) then
      AllowChange := False
   else
      AllowChange := True;
end;

procedure TFrmParametros.Edit_Cod_CliPadraoChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      BtnGravaPara.Enabled := True;
      BtnCancelaPara.Enabled := True;
   end;
end;

procedure TFrmParametros.Edit_ObservacaoChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      BtnGravaPara.Enabled := True;
      BtnCancelaPara.Enabled := True;
   end;
end;

procedure TFrmParametros.BtnGravaParaClick(Sender: TObject);
begin
   if vCod = 1 Then
   begin
      zParamentros.Edit;
   end;

   Carrega_Parametros;
   zParamentros.Post;
//    FrmPrincipal.RodaSP(Proc);
   FormShow(Self);

   //ScrollBox1.VertScrollBar.Position := 0;
   ScrollBox1.UpdateScrollbars;

   BtnGravaPara.Enabled := False;
   BtnCancelaPara.Enabled := False;
   FrmPrincipal.Carrega_Parametros;
end;

procedure TFrmParametros.Edit_Cod_FormaPadraoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cod_FormaPadrao.Text)) <> 0) and (Trim(Edit_Cod_FormaPadrao.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From FORMASPAGTO where Codigo='+ Edit_Cod_FormaPadrao.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelForma.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Forma de Pagamento não cadastrado.',mtInformation,[mbOK],0);
            PanelForma.Caption := '';
            Edit_Cod_FormaPadrao.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Cod_FormaPadrao.Text := '0';
      PanelForma.Caption := '';
   end;
end;

procedure TFrmParametros.BtnCancelaParaClick(Sender: TObject);
begin
   FormShow(self);
   BtnGravaPara.Enabled := False;
   BtnCancelaPara.Enabled := False;
end;

procedure TFrmParametros.F3_FormaClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from FORMASPAGTO ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Formas de Pagamento';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Cod_FormaPadrao.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Cod_FormaPadrao.Modified := True;
         Edit_Cod_CliPadraoChange(Edit_Cod_FormaPadrao);
         Edit_Cod_FormaPadraoExit(Self);
         Edit_Cod_FormaPadrao.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmParametros.Msk_CFOPEnter(Sender: TObject);
begin
   {if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '9.999.9;1;_';
   end;}
end;

procedure TFrmParametros.Msk_CFOPExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   if (Trim((Sender as TMaskEdit).Text) = '.   .') or (Trim((Sender as TMaskEdit).Text) = '') then
   begin
      (Sender as TMaskEdit).EditMask := '';
      Msk_CFOP.Text := '';
      PanelCfop.Caption := '';
   end
   else
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, Descricao from CodFiscais where Codigo='''+ Msk_CFOP.Text +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCfop.Caption := JvQuery.FieldByName('Descricao').asString;
         end
         else
         begin
            MessageDlg('Código Fiscal não cadastrado.',mtInformation,[mbOK],0);
            PanelCfop.Caption := '';
            Msk_CFOP.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmParametros.F3_CFOPClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, DESCRICAO as Descricao from CodFiscais';
      FrmPesquisa.Indice_Inicial := 'DESCRICAO';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Códigos Fiscais';
      if FrmPesquisa.ShowModal = mrOK then
      begin
         Msk_CFOPEnter(Msk_CFOP);
        // Msk_CFOP.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Msk_CFOP.Modified := True;
         Msk_CFOPChange(Msk_CFOP);
         Msk_CFOPExit(Msk_CFOP);
         Msk_CFOP.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmParametros.Msk_CFOPChange(Sender: TObject);
begin
   If (Sender as TMaskEdit).Modified then
   begin
      BtnGravaPara.Enabled := True;
      BtnCancelaPara.Enabled := True;
   end;
end;

procedure TFrmParametros.Chk_Usar_BalancaClick(Sender: TObject);
begin
   BtnGravaPara.Enabled := True;
   BtnCancelaPara.Enabled := True;
   if Chk_Usar_Balanca.Checked then
   begin
      Label24.Enabled := True;
      Label25.Enabled := True;
      Label26.Enabled := True;
      Label27.Enabled := True;
      Label28.Enabled := True;
      Edit_DigIni_Bal.Enabled := True;
      Edit_IniCod_Bal.Enabled := True;
      Edit_QtdCod_Bal.Enabled := True;
      Edit_IniPreco_Bal.Enabled := True;
      Edit_QtdPreco_Bal.Enabled := True;
      Combo_Conteudo_Bal.Enabled := True;
      Label29.Enabled := True;
      Edit_Prod_Padrao_Bal.Enabled := True;
      F3_Prod_Padrao_Bal.Enabled := True;
      PanelProd_Padrao_bal.Enabled := True;
   end
   else
   begin
      Label24.Enabled := False;
      Label25.Enabled := False;
      Label26.Enabled := False;
      Label27.Enabled := False;
      Label28.Enabled := False;
      Edit_DigIni_Bal.Enabled := False;
      Edit_IniCod_Bal.Enabled := False;
      Edit_QtdCod_Bal.Enabled := False;
      Edit_IniPreco_Bal.Enabled := False;
      Edit_QtdPreco_Bal.Enabled := False;
      Combo_Conteudo_Bal.Enabled := False;
      Label29.Enabled := False;
      Edit_Prod_Padrao_Bal.Enabled := False;
      F3_Prod_Padrao_Bal.Enabled := False;
      PanelProd_Padrao_bal.Enabled := False;
   end;
end;

procedure TFrmParametros.Combo_Conteudo_BalDropDown(Sender: TObject);
begin
   BtnGravaPara.Enabled := True;
   BtnCancelaPara.Enabled := True;
end;

procedure TFrmParametros.F3_Prod_Padrao_BalClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from VW_PROD_GERAL order by Nome';
      FrmPesquisa.Indice_Inicial := 'Nome';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Produtos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  Edit_Prod_Padrao_Bal.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Prod_Padrao_Bal.Modified := True;
         Edit_Cod_CliPadraoChange(Edit_Prod_Padrao_Bal);
         Edit_Prod_Padrao_BalExit(Self);
         Edit_Prod_Padrao_Bal.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmParametros.Edit_Prod_Padrao_BalExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Prod_Padrao_Bal.Text)) <> 0) and (Trim(Edit_Prod_Padrao_Bal.Text) <> '0') then
   begin            {
       JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome From VW_PROD_GERAL where Codigo='+ Edit_Prod_Padrao_Bal.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelProd_Padrao_bal.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
            PanelProd_Padrao_bal.Caption := '';
            Edit_Prod_Padrao_Bal.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;         }
   end
   else
   begin
      Edit_Prod_Padrao_Bal.text := '0';
      PanelProd_Padrao_bal.Caption := '';
   end;
end;

procedure TFrmParametros.Edit_Cod_VendPadraoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cod_VendPadrao.Text)) <> 0) and (Trim(Edit_Cod_VendPadrao.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * From VENDEDORES where Codigo='+ Edit_Cod_VendPadrao.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelVendedor.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Vendedor não cadastrado.',mtInformation,[mbOK],0);
            PanelVendedor.Caption := '';
            Edit_Cod_VendPadrao.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Cod_VendPadrao.Text := '0';
      PanelVendedor.Caption := '';
   end;
end;

procedure TFrmParametros.F3_VendedorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from Vendedores ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Vendedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Cod_VendPadrao.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Cod_VendPadrao.Modified := True;
         Edit_Cod_CliPadraoChange(Edit_Cod_VendPadrao);
         Edit_Cod_VendPadraoExit(Self);
         Edit_Cod_VendPadrao.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmParametros.Chk_Imp_ClienteClick(Sender: TObject);
begin
   BtnGravaPara.Enabled := True;
   BtnCancelaPara.Enabled := True;
end;

procedure TFrmParametros.Chk_Margem_SegClick(Sender: TObject);
begin
   Chk_Imp_ClienteClick(Self);
   if Chk_Margem_Seg.Checked then
   begin
      Edit_Vl_Margem.Enabled := True;
   end
   else
      Edit_Vl_Margem.Enabled := False;
end;

procedure TFrmParametros.RG_Estq_NegativoClick(Sender: TObject);
begin
   BtnGravaPara.Enabled := True;
   BtnCancelaPara.Enabled := True;
end;

procedure TFrmParametros.PaginasChange(Sender: TObject);
begin
   FormShow(Self);
end;

procedure TFrmParametros.Edit_Config_NotaExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Edit_Config_Nota.Text)) <> 0 then
   begin   {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * From DOCSCAPA where Upper(NOME) = '''+ AnsiUpperCase(Edit_Config_Nota.Text) + ''' AND TIPO = 0 ', JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_Config_Nota.Text := JvQuery.FieldByName('NOME').asString;
            PanelConfig_Nota.Caption := JvQuery.FieldByName('DESCRICAO').asString;
         end
         else
         begin
            MessageDlg('Configuração não cadastrado.',mtInformation,[mbOK],0);
            PanelConfig_Nota.Caption := '';
            Edit_Config_Nota.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;}
   end
   else
   begin
      Edit_Config_Nota.Text := '';
      PanelConfig_Nota.Caption := '';
   end;
end;

procedure TFrmParametros.F3_Config_NotaClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from DOCSCAPA WHERE TIPO = 0 ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'NOME';
      FrmPesquisa.Caption := 'Configurações de Documentos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//          Edit_Config_Nota.Text := FrmPesquisa.JvQuery.FieldByName('NOME').asString;
         Edit_Config_Nota.Modified := True;
         Edit_ObservacaoChange(Edit_Config_Nota);
         Edit_Config_NotaExit(Self);
         Edit_Config_Nota.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmParametros.Edit_FormaRec_VistaExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_FormaRec_Vista.Text)) <> 0) and (Trim(Edit_FormaRec_Vista.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('SELECT FORMASPAGTO.CODIGO, FORMASPAGTO.NOME FROM FORMASPAGTO INNER JOIN CATEGORIAS ON (FORMASPAGTO.CATEGORIA = CATEGORIAS.NOME) WHERE CATEGORIAS.TIPO = 0 AND FORMASPAGTO.CODIGO = ' + Trim(Edit_FormaRec_Vista.Text),JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelFormaRec_Vista.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Forma de Recebimento não cadastrado.',mtInformation,[mbOK],0);
            PanelFormaRec_Vista.Caption := '';
            Edit_FormaRec_Vista.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_FormaRec_Vista.Text := '0';
      PanelFormaRec_Vista.Caption := '';
   end;
end;

procedure TFrmParametros.F3_FormaRec_VistaClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'SELECT FORMASPAGTO.*, CATEGORIAS.TIPO FROM FORMASPAGTO INNER JOIN CATEGORIAS ON (FORMASPAGTO.CATEGORIA = CATEGORIAS.NOME) WHERE CATEGORIAS.TIPO = 0 ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Formas de Recebimento';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_FormaRec_Vista.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_FormaRec_Vista.Modified := True;
         Edit_Cod_CliPadraoChange(Edit_FormaRec_Vista);
         Edit_FormaRec_VistaExit(Self);
         Edit_Formarec_Vista.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmParametros.F3_FormaPag_VistaClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'SELECT FORMASPAGTO.*, CATEGORIAS.TIPO FROM FORMASPAGTO INNER JOIN CATEGORIAS ON (FORMASPAGTO.CATEGORIA = CATEGORIAS.NOME) WHERE CATEGORIAS.TIPO = 1 ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Formas de Pagamento';
      if FrmPesquisa.ShowModal = mrOK then
      begin
  //       Edit_FormaPag_Vista.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_FormaPag_Vista.Modified := True;
         Edit_Cod_CliPadraoChange(Edit_FormaPag_Vista);
         Edit_FormaPag_VistaExit(Self);
         Edit_FormaPag_Vista.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmParametros.Edit_FormaPag_VistaExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_FormaPag_Vista.Text)) <> 0) and (Trim(Edit_FormaPag_Vista.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('SELECT FORMASPAGTO.CODIGO, FORMASPAGTO.NOME FROM FORMASPAGTO INNER JOIN CATEGORIAS ON (FORMASPAGTO.CATEGORIA = CATEGORIAS.NOME) WHERE CATEGORIAS.TIPO = 1 AND FORMASPAGTO.CODIGO = ' + Trim(Edit_FormaPag_Vista.Text),JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelFormaPag_Vista.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Forma de Pagamento não cadastrado.',mtInformation,[mbOK],0);
            PanelFormaPag_Vista.Caption := '';
            Edit_FormaPag_Vista.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_FormaPag_Vista.Text := '0';
      PanelFormaPag_Vista.Caption := '';
   end;
end;

procedure TFrmParametros.FormCreate(Sender: TObject);
begin                                            {
   Proc.database := frmprincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_PARAMETROS');
   JvQry_Gen.Database := FrmPrincipal.base;
   JvQry_Gen.Transaction := FrmPrincipal.Transaction;

   Carrega_ComboImpressoras(Combo_Impr_Padrao); }
end;

procedure TFrmParametros.Chk_Calcula_Preco_VendaClick(Sender: TObject);
begin
   BtnGravaPara.Enabled := True;
   BtnCancelaPara.Enabled := True;
   if Chk_Calcula_Preco_Venda.Checked then
   begin
      Label37.Enabled := True;
      Label39.Enabled := True;
      Label41.Enabled := True;
      Edit_Custo_Fixo.Enabled := True;
      Edit_Custo_Aliq.Enabled := True;
      Chk_Custo_Icms.Enabled := True;
   end
   else
   begin
      Label37.Enabled := False;
      Label39.Enabled := False;
      Label41.Enabled := False;
      Edit_Custo_Fixo.Enabled := False;
      Edit_Custo_Aliq.Enabled := False;
      Chk_Custo_Icms.Enabled := False;
   end;
end;

procedure TFrmParametros.Combo_Msk_ValorChange(Sender: TObject);
begin
   BtnGravaPara.Enabled := True;
   BtnCancelaPara.Enabled := True;
end;

initialization
   {$i uparametros.lrs}

end.
