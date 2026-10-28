Unit UClientes;

{$MODE Delphi}

interface

uses
  LCLIntf,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db, ExtDlgs,
  ActnList, Menus, LResources, MaskEdit, LCLType, ZDataset, ZAbstractRODataset;


type

  { TFrmClientes }

  TFrmClientes = class(TForm)
    Bevel1: TBevel;
    Bevel10: TBevel;
    Bevel12: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BtnAtlz_Grafico: TBitBtn;
    BtnAtlz_Grafico1: TBitBtn;
    BtnAtlz_Mov_Geral: TBitBtn;
    BtnAtualiza: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnEditar: TBitBtn;
    BtnExclui: TBitBtn;
    BtnExcluiPesq: TBitBtn;
    BtnGrava: TBitBtn;
    BtnImpr_Mov_Geral: TBitBtn;
    BtnInclui: TBitBtn;
    BtnIncluiPesq: TBitBtn;
    BtnLimpa1: TBitBtn;
    BtnLimpa_Mov_Geral: TBitBtn;
    BtnSair: TBitBtn;
    BtnSairPes: TBitBtn;
    bt_imagem: TSpeedButton;
    Campo1: TEdit;
    Chk_Aluguel: TRadioGroup;
    Chk_Consu_Final: TCheckBox;
    Chk_Est_Civil: TRadioGroup;
    Chk_Sexo: TRadioGroup;
    ComboCampo: TComboBox;
    ComboCampo_Ord: TComboBox;
    ComboMov_Aberto: TComboBox;
    ComboMov_Geral: TComboBox;
    ComboOper: TComboBox;
    Combo_Avaliacao: TComboBox;
    Combo_Avaliacao1: TComboBox;
    Combo_Tempo: TComboBox;
    Combo_Tempo1: TComboBox;
     Datasource: TDatasource;
     dtClientes: TDataSource;
     DBGrid_Descontos: TdbGrid;
     DBGrid_Motoristas: TdbGrid;
     DBGrid_Veiculos: TdbGrid;
     EditConteudo: TEdit;
     Edit_Bairro: TEdit;
     Edit_Cart_Mot: TEdit;
     Edit_CI: TEdit;
     Edit_Cidade: TEdit;
     Edit_Cida_Empr: TEdit;
     Edit_Classificacao: TEdit;
     Edit_Cliente: TEdit;
     Edit_Cliente1: TEdit;
     Edit_Cliente_Desconto: TEdit;
     Edit_Cliente_Mot: TEdit;
     Edit_Cliente_Mov_Aberto: TEdit;
     Edit_Cliente_Mov_Geral: TEdit;
     Edit_Cliente_Veiculo: TEdit;
     Edit_Cobr_Bairr: TEdit;
     Edit_Cobr_Cidad: TEdit;
     Edit_Cobr_Ender: TEdit;
     Edit_Cobr_Uf: TEdit;
     Edit_Cod_Mot: TEdit;
     Edit_Conjuge: TEdit;
     Edit_Contato: TEdit;
     Edit_Cor: TEdit;
     Edit_CPF_Mot: TMaskEdit;
     Edit_Cx_Postal: TEdit;
     Edit_Desconto: TEdit;
     Edit_Descricao: TEdit;
     Edit_Desc_Individual: TEdit;
     Edit_Email: TEdit;
     Edit_Empresa: TEdit;
     Edit_Empr_Ant: TEdit;
     Edit_Empr_Conj: TEdit;
     Edit_Endereco: TEdit;
     Edit_Ende_Empr: TEdit;
     Edit_End_Anter: TEdit;
     Edit_Fax: TEdit;
     Edit_Filiacao: TEdit;
     Edit_Fone: TEdit;
     Edit_Fone_Empr: TEdit;
     Edit_Forma_Pagto: TEdit;
     Edit_Funcao: TEdit;
     Edit_Func_Conj: TEdit;
     Edit_Grupo: TEdit;
     Edit_Imobiliar: TEdit;
     Edit_Inscricao: TEdit;
     Edit_Marca: TEdit;
     Edit_Natura: TEdit;
     Edit_Nome: TEdit;
     Edit_Nome_Mot: TEdit;
     Edit_Nom_Fan: TEdit;
     Edit_Num_Depend: TEdit;
     Edit_Obs_Spc: TEdit;
     Edit_PathImage: TEdit;
     Edit_PClassificacao: TEdit;
     Edit_PCodigo: TEdit;
     Edit_Placa: TMaskEdit;
     Edit_PNome: TEdit;
     Edit_PPraca: TEdit;
     Edit_Praca: TEdit;
     Edit_PSituacao: TEdit;
     Edit_Ref_Banc: TEdit;
     Edit_Ref_Coml: TEdit;
     Edit_Remunerac: TEdit;
     Edit_Rem_Extra: TEdit;
     Edit_RG_Mot: TEdit;
     Edit_Sal_Conj: TEdit;
     Edit_Situacao: TEdit;
     Edit_Temp_Resid: TEdit;
     Edit_Temp_Serv: TEdit;
     Edit_Tipo_Ativ: TEdit;
     Edit_Tit_Eleitor: TEdit;
     Edit_Transportador: TEdit;
     Edit_UF: TEdit;
     Edit_UF_Empr: TEdit;
     Edit_Val_Aluguel: TEdit;
     Edit_Vendedor: TEdit;
     F3_Classificacao: TBitBtn;
     F3_Clientes: TSpeedButton;
     F3_Clientes1: TSpeedButton;
     F3_Cliente_Desconto: TSpeedButton;
     F3_Cliente_Mot: TSpeedButton;
     F3_Cliente_Mov_Aberto: TSpeedButton;
     F3_Cliente_Mov_Geral: TSpeedButton;
     F3_Cliente_Veiculo: TSpeedButton;
     F3_FormaPagto: TBitBtn;
     F3_Grupo1: TSpeedButton;
     F3_PClassificacao: TSpeedButton;
     F3_PPraca: TSpeedButton;
     F3_Praca: TBitBtn;
     F3_PSituacao: TSpeedButton;
     F3_Situacao: TBitBtn;
     F3_TipoAtiv: TBitBtn;
     F3_Transportador: TBitBtn;
     F3_vendedor: TBitBtn;
     Grid_Mov_Aberto: TdbGrid;
     Grid_Mov_Geral: TdbGrid;
     Grid_Pesquisa: TdbGrid;
     GroupBox1: TGroupBox;
     Image1: TImage;
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
     Label28: TLabel;
     Label29: TLabel;
     Label3: TLabel;
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
     Label4: TLabel;
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
     Label5: TLabel;
     Label50: TLabel;
     Label51: TLabel;
     Label52: TLabel;
     Label53: TLabel;
     Label54: TLabel;
     Label55: TLabel;
     Label56: TLabel;
     Label57: TLabel;
     Label58: TLabel;
     Label59: TLabel;
     Label6: TLabel;
     Label60: TLabel;
     Label61: TLabel;
     Label62: TLabel;
     Label63: TLabel;
     Label64: TLabel;
     Label65: TLabel;
     Label66: TLabel;
     Label67: TLabel;
     Label68: TLabel;
     Label69: TLabel;
     Label7: TLabel;
     Label70: TLabel;
     Label71: TLabel;
     Label72: TLabel;
     Label73: TLabel;
     Label74: TLabel;
     Label75: TLabel;
     Label76: TLabel;
     Label77: TLabel;
     Label78: TLabel;
     Label79: TLabel;
     Label8: TLabel;
     Label80: TLabel;
     Label81: TLabel;
     Label82: TLabel;
     Label83: TLabel;
     Label84: TLabel;
     Label85: TLabel;
     Label86: TLabel;
     Label87: TLabel;
     Label88: TLabel;
     Label89: TLabel;
     Label9: TLabel;
     Label90: TLabel;
     Label91: TLabel;
     Label92: TLabel;
     Label93: TLabel;
     Label94: TLabel;
     Label95: TLabel;
     LabelCli_Forn_Prod: TLabel;
     Label_Total: TLabel;
     Lbl_Status: TLabel;
     ListCriterios: TListBox;
     ListOrdem: TListBox;
     Memo_Obs_Geral: TMemo;
     Msk_Admissao: TMaskEdit;
     Msk_CEP: TMaskEdit;
     Msk_Cep_Empr: TMaskEdit;
     Msk_CGC: TMaskEdit;
     Msk_Cobr_Cep: TMaskEdit;
     Msk_Cons_Spc: TMaskEdit;
     Msk_CPF: TMaskEdit;
     Msk_Data_Ficha: TMaskEdit;
     Msk_Data_Nasc: TMaskEdit;
     Msk_Nasc_Conj: TMaskEdit;
     Msk_PCGC: TMaskEdit;
     Msk_PCPF: TMaskEdit;
     NaoLimpar: TCheckBox;
     PageCadastro: TPageControl;
     PageControl: TPageControl;
     PageMovimento: TPageControl;
     Paginas: TPageControl;
     Panel1: TPanel;
     Panel10: TPanel;
     Panel11: TPanel;
     Panel12: TPanel;
     Panel13: TPanel;
     Panel14: TPanel;
     Panel15: TPanel;
     Panel16: TPanel;
     Panel17: TPanel;
     Panel18: TPanel;
     Panel19: TPanel;
     Panel2: TPanel;
     Panel20: TPanel;
     Panel21: TPanel;
     Panel3: TPanel;
     Panel4: TPanel;
     Panel5: TPanel;
     Panel6: TPanel;
     Panel7: TPanel;
     Panel8: TPanel;
     Panel9: TPanel;
     PanelClassificacao: TPanel;
     PanelCliente: TPanel;
     PanelCliente1: TPanel;
     PanelCliente_Desconto: TPanel;
     PanelCliente_Mot: TPanel;
     PanelCliente_Veiculo: TPanel;
     PanelFormasPagto: TPanel;
     PanelGrupo: TPanel;
     PanelPClassificacao: TPanel;
     PanelPPraca: TPanel;
     PanelPraca: TPanel;
     PanelPSituacao: TPanel;
     PanelSituacao: TPanel;
     PanelTipoAtiv: TPanel;
     PanelTransportador: TPanel;
     PanelVendedor: TPanel;
     Panel_Atrazo_Juros: TPanel;
     Panel_Cliente_Mov_Aberto: TPanel;
     Panel_Cliente_Mov_Geral: TPanel;
     Panel_Tot_Aberto: TPanel;
     Panel_Tot_Atrazo: TPanel;
     Panel_Tot_Juros: TPanel;
     RB_Cresc: TRadioButton;
     RB_Decresc: TRadioButton;
     RG_Class_Descontos: TRadioGroup;
     ScrollBox1: TScrollBox;
     Src_Descontos: TDatasource;
     Src_MovAberto: TDatasource;
     Src_MovGeral: TDatasource;
    Src_Motoristas: TDatasource;
    MenuImageList: TImageList;
    OpenPictureDialog1: TOpenPictureDialog;
    Pop_NumReg: TPopupMenu;
    Nmeroderegistrosencontrados1: TMenuItem;
    Src_Veiculos: TDataSource;
    TabCadastro: TTabSheet;
    TabCliente: TTabSheet;
    TabDescontos: TTabSheet;
    TabFinanceiro: TTabSheet;
    TabMotoristas: TTabSheet;
    TabMov_Geral: TTabSheet;
    TabMov_Geral_Aberto: TTabSheet;
    TabMov_Mensal: TTabSheet;
    TabPesquisa: TTabSheet;
    TabVeiculos: TTabSheet;
    Tab_Ordem: TTabSheet;
    Tab_PesAvanca1: TTabSheet;
    zClientes: TZQuery;
    zClientesADMISSAO: TZDateField;
    zClientesALUGUEL: TZSmallIntField;
    zClientesBAIRRO: TZRawStringField;
    zClientesCEP: TZRawStringField;
    zClientesCEP_EMPR: TZRawStringField;
    zClientesCGC: TZRawStringField;
    zClientesCI: TZRawStringField;
    zClientesCIDADE: TZRawStringField;
    zClientesCIDA_EMPR: TZRawStringField;
    zClientesCLASSIFICACAO: TZIntegerField;
    zClientesCLASS_DESCONTOS: TZSmallIntField;
    zClientesCOBR_BAIRR: TZRawStringField;
    zClientesCOBR_CEP: TZRawStringField;
    zClientesCOBR_CIDAD: TZRawStringField;
    zClientesCOBR_ENDER: TZRawStringField;
    zClientesCOBR_UF: TZRawStringField;
    zClientesCODIGO: TZIntegerField;
    zClientesCONJUGE: TZRawStringField;
    zClientesCONSU_FINAL: TZSmallIntField;
    zClientesCONS_SPC: TZDateField;
    zClientesCONTATO: TZRawStringField;
    zClientesCPF: TZRawStringField;
    zClientesCX_POSTAL: TZRawStringField;
    zClientesDATA_FICHA: TZDateField;
    zClientesDATA_NASC: TZDateField;
    zClientesDESC_INDIVIDUAL: TZBCDField;
    zClientesEMAIL: TZRawStringField;
    zClientesEMPRESA: TZRawStringField;
    zClientesEMPR_ANT: TZRawStringField;
    zClientesEMPR_CONJ: TZRawStringField;
    zClientesENDERECO: TZRawStringField;
    zClientesENDE_EMPR: TZRawStringField;
    zClientesEND_ANTER: TZRawStringField;
    zClientesEST_CIVIL: TZSmallIntField;
    zClientesFAX: TZRawStringField;
    zClientesFILIACAO: TZRawStringField;
    zClientesFONE: TZRawStringField;
    zClientesFONE_EMPR: TZRawStringField;
    zClientesFORMASPAGTO: TZIntegerField;
    zClientesFUNCAO: TZRawStringField;
    zClientesFUNC_CONJ: TZRawStringField;
    zClientesICM_IPI: TZSmallIntField;
    zClientesIMOBILIAR: TZRawStringField;
    zClientesINSCRICAO: TZRawStringField;
    zClientesNASC_CONJ: TZDateField;
    zClientesNATURA: TZRawStringField;
    zClientesNOME: TZRawStringField;
    zClientesNOM_FAN: TZRawStringField;
    zClientesNUM_DEPEND: TZIntegerField;
    zClientesOBS_GERAL: TZRawCLobField;
    zClientesOBS_SPC: TZRawStringField;
    zClientesPATHIMAGE: TZRawStringField;
    zClientesPRACA: TZIntegerField;
    zClientesREF_BANC: TZRawStringField;
    zClientesREF_COML: TZRawStringField;
    zClientesREMUNERAC: TZBCDField;
    zClientesREM_EXTRA: TZBCDField;
    zClientesSAL_CONJ: TZBCDField;
    zClientesSEXO: TZSmallIntField;
    zClientesSITUACAO: TZIntegerField;
    zClientesTEMP_RESID: TZRawStringField;
    zClientesTEMP_SERV: TZRawStringField;
    zClientesTIPO_ATIV: TZIntegerField;
    zClientesTIT_ELEITOR: TZRawStringField;
    zClientesTRANSPORTADORA: TZIntegerField;
    zClientesUF: TZRawStringField;
    zClientesUF_EMPR: TZRawStringField;
    zClientesVAL_ALUGUEL: TZBCDField;
    zClientesVENDEDOR: TZIntegerField;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnEditar1Click(Sender: TObject);
    procedure BtnExcluiPesqClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid_DescontosDblClick(Sender: TObject);
    procedure DBGrid_MotoristasDblClick(Sender: TObject);
    procedure DBGrid_VeiculosDblClick(Sender: TObject);
    procedure dtClientesDataChange(Sender: TObject; Field: TField);
    procedure Edit_ClassificacaoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_ClienteKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Cliente_DescontoExit(Sender: TObject);
    procedure Edit_Cliente_MotKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Cliente_Mov_AbertoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Cliente_Mov_GeralKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Cliente_VeiculoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Forma_PagtoEnter(Sender: TObject);
    procedure Edit_Forma_PagtoExit(Sender: TObject);
    procedure Edit_Forma_PagtoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_GrupoExit(Sender: TObject);
    procedure Edit_GrupoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_NomeChange(Sender: TObject);
    procedure Edit_PClassificacaoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_PPracaKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_PSituacaoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_PracaKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_SituacaoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Tipo_AtivKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_TransportadorExit(Sender: TObject);
    procedure Edit_TransportadorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_VendedorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure F3_FormaPagtoClick(Sender: TObject);
    procedure F3_GrupoClick(Sender: TObject);
    procedure F3_PracaEnter(Sender: TObject);
    procedure F3_TransportadorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros(Proc : TZQuery);
    procedure Carrega_Campos(oDataSet: TZQuery);
    procedure FrmClientesPaint(Sender: TObject);
    procedure Grid_PesquisaCellClick(Column: TColumn);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Edit_PDescricaoChange(Sender: TObject);
    procedure Edit_PCodigoChange(Sender: TObject);
    procedure Edit_PCodigoExit(Sender: TObject);
    procedure Msk_CEPEnter(Sender: TObject);
    procedure Msk_CEPExit(Sender: TObject);
    procedure Msk_Data_FichaEnter(Sender: TObject);
    procedure Msk_Data_FichaExit(Sender: TObject);
    procedure Msk_CPFEnter(Sender: TObject);
    procedure Msk_CPFExit(Sender: TObject);
    procedure Msk_CGCEnter(Sender: TObject);
    procedure Msk_CGCExit(Sender: TObject);
    procedure PanelSituacaoClick(Sender: TObject);
    procedure RG_Class_DescontosClick(Sender: TObject);
    procedure TabClienteContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabClienteExit(Sender: TObject);
    procedure TabClienteHide(Sender: TObject);
    procedure bt_imagemClick(Sender: TObject);
    procedure Edit_PracaExit(Sender: TObject);
    procedure Edit_PathImageExit(Sender: TObject);
    procedure Edit_VendedorExit(Sender: TObject);
    procedure Edit_Tipo_AtivExit(Sender: TObject);
    procedure F3_PracaClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure F3_vendedorClick(Sender: TObject);
    procedure F3_tipoativClick(Sender: TObject);
    procedure Chk_AluguelExit(Sender: TObject);
    procedure Edit_PPracaExit(Sender: TObject);
    procedure Edit_PSituacaoExit(Sender: TObject);
    procedure Edit_PClassificacaoExit(Sender: TObject);
    procedure F3_PPracaClick(Sender: TObject);
    procedure F3_PSituacaoClick(Sender: TObject);
    procedure F3_PClassificacaoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Nmeroderegistrosencontrados1Click(Sender: TObject);
    procedure Edit_Nom_FanEnter(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure F3_ClientesClick(Sender: TObject);
    procedure Edit_ClienteExit(Sender: TObject);
    procedure BtnAtlz_GraficoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure PageCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure PageCadastroChange(Sender: TObject);
    procedure BtnImpr_Mov_GeralClick(Sender: TObject);
    procedure DBChart1DblClick(Sender: TObject);
    procedure F3_Cliente_Mov_GeralClick(Sender: TObject);
    procedure Edit_Cliente_Mov_GeralExit(Sender: TObject);
    procedure BtnAtlz_Mov_GeralClick(Sender: TObject);
    procedure BtnLimpa_Mov_GeralClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure F3_Cliente_Mov_AbertoClick(Sender: TObject);
    procedure Edit_Cliente_Mov_AbertoExit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure PageMovimentoChange(Sender: TObject);
    procedure F3_Cliente_VeiculoClick(Sender: TObject);
    procedure Edit_Cliente_VeiculoExit(Sender: TObject);
    Procedure Carrega_Veiculos(oCliente: Integer);
    Procedure Carrega_Motoristas(oCliente: Integer);
    Procedure Carrega_Descontos(oCliente: Integer);
    procedure Edit_PlacaExit(Sender: TObject);
    procedure Edit_PlacaEnter(Sender: TObject);
    procedure Edit_Cliente_MotExit(Sender: TObject);
    procedure F3_Cliente_MotClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure F3_SituacaoClick(Sender: TObject);
    procedure Edit_SituacaoExit(Sender: TObject);
    procedure Edit_ClassificacaoExit(Sender: TObject);
    procedure F3_ClassificacaoClick(Sender: TObject);
    procedure dbGrid3DblClick(Sender: TObject);

  private
    { Private declarations }
    vOper : Integer;
    procedure SetOper(const Value: Integer);
    procedure SetStatus(Status: String);

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
  FrmClientes: TFrmClientes;

implementation

uses UPrincipal, Global, UConsulta, UVariaveis;


procedure TFrmClientes.SetStatus(Status: String);
begin
  Lbl_Status.Caption := Status;
  BtnGrava.Enabled := true;
  BtnExclui.Enabled := true;
  BtnCancelar.Enabled := true;
  BtnInclui.Enabled := true;
//  PageCadastro.Visible := true;
  if Status = 'Pesquisa' then
    begin
      BtnGrava.Enabled := false;
      BtnExclui.Enabled := false;
      BtnCancelar.Enabled := false;
//      PageCadastro.Visible := false;
//      Paginas.ActivePage := TabPesquisa;
      exit;
    end
  else if Status = 'Inserção' then
    begin
      BtnInclui.Enabled := false;
      BtnExclui.Enabled := false;
    end;
end;

procedure TFrmClientes.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case voper of
       opInsert : begin
                     //BtnInclui.Enabled := False;
                     //BtnExclui.Enabled := False;
                     //BtnSair.Enabled := False;
                     Campo1.Enabled := True;
                     NaoLimpar.Enabled := True;
                  end;
       opBrowse : begin
                     //BtnInclui.Enabled := True;
                     //BtnExclui.Enabled := True;
                     //BtnSair.Enabled := True;
                     Campo1.Enabled := False;
                     NaoLimpar.Enabled := False;
                  end;
    end;

  end;
end;


procedure TFrmClientes.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmClientes.BitBtn9Click(Sender: TObject);
begin

end;

procedure TFrmClientes.BtnEditar1Click(Sender: TObject);
begin
  Grid_PesquisaDblClick(self);
end;

procedure TFrmClientes.BtnExcluiPesqClick(Sender: TObject);
begin
  PageCadastro.ActivePageIndex := 0;
//   Carrega_Campos(JvQry_Pes);
  BtnExcluiClick(self);
  BtnAtualizaClick(self);
end;

procedure TFrmClientes.Button1Click(Sender: TObject);
begin
end;

procedure TFrmClientes.DBGrid_DescontosDblClick(Sender: TObject);
begin    {
   if (JvQry_Descontos.Active) and (JvQry_Descontos.RecordCount > 0) then
   begin
      with JvQry_Descontos do
      begin
         if Operacao = opBrowse then
         begin
            Carrega_Campos(JvQry_Descontos);
            SetStatus('Edição');
         end;
      end;
   end; }
end;

procedure TFrmClientes.DBGrid_MotoristasDblClick(Sender: TObject);
begin
{   if (JvQry_Motoristas.Active) and (JvQry_Motoristas.RecordCount > 0) then
   begin
      with JvQry_Motoristas do
      begin
         if Operacao = opBrowse then
         begin
            Carrega_Campos(JvQry_Motoristas);
            Edit_Nome.SetFocus;
            SetStatus('Edição');
         end;
      end;
   end;   }
end;

procedure TFrmClientes.DBGrid_VeiculosDblClick(Sender: TObject);
begin
{   if (JvQry_Veiculos.Active) and (JvQry_Veiculos.RecordCount > 0) then
   begin
      with JvQry_Veiculos do
      begin
         if Operacao = opBrowse then
         begin
            Carrega_Campos(JvQry_Veiculos);
            Edit_Placa.SetFocus;
            SetStatus('Edição');
         end;
      end;
   end; }
end;

procedure TFrmClientes.dtClientesDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFrmClientes.Edit_ClassificacaoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_ClassificacaoClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_ClienteKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_ClientesClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_Cliente_DescontoExit(Sender: TObject);
begin                                                            {
   If (Length(Trim(Edit_Cliente_Desconto.Text)) <> 0) and (Trim(Edit_Cliente_Desconto.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From CLIENTES where Codigo = '+ Edit_Cliente_Desconto.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCliente_Desconto.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            PanelCliente_Desconto.Caption := '';
            Edit_Cliente_Desconto.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Cliente_Desconto.Text := '0';
      PanelCliente_Desconto.Caption := '';
   end;
   Carrega_Descontos(StrToIntZero(Edit_Cliente_Desconto.Text)); }
end;

procedure TFrmClientes.Edit_Cliente_MotKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_Cliente_MotClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_Cliente_Mov_AbertoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
       F3_Cliente_Mov_AbertoClick(Self);
       key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_Cliente_Mov_GeralKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_Cliente_Mov_GeralClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_Cliente_VeiculoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_Cliente_VeiculoClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_Forma_PagtoEnter(Sender: TObject);
begin
   {ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + 50;
   ScrollBox1.Repaint;
   ScrollBox1.UpdateScrollbars;
   ScrollBox1.Repaint;}
end;

procedure TFrmClientes.Edit_Forma_PagtoExit(Sender: TObject);
begin
 {  If (Length(Trim(Edit_Forma_Pagto.Text)) <> 0) and (Trim(Edit_Forma_Pagto.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from FORMASPAGTO where Codigo='+ Edit_Forma_Pagto.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelFormasPagto.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Forma de Pagamento não cadastrada.',mtInformation,[mbOK],0);
            PanelFormasPagto.Caption := '';
            Edit_Forma_Pagto.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Forma_Pagto.Text := '0';
      PanelFormasPagto.Caption := '';
   end;
}
end;

procedure TFrmClientes.Edit_Forma_PagtoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_FormaPagtoClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_GrupoExit(Sender: TObject);
begin
{   If (Length(Trim(Edit_Grupo.Text)) <> 0) and (Trim(Edit_Grupo.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from GRUPOS where Codigo='+ Edit_Grupo.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
           PanelGrupo.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Grupo não cadastrado.',mtInformation,[mbOK],0);
            PanelGrupo.Caption := '';
            Edit_Grupo.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Grupo.Text := '0';
      PanelGrupo.Caption := '';
   end; }
end;

procedure TFrmClientes.Edit_GrupoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_Grupoclick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_NomeChange(Sender: TObject);
begin

end;

procedure TFrmClientes.Edit_PClassificacaoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_PClassificacaoClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_PPracaKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_PracaClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_PSituacaoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_PSituacaoClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_PracaKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_PracaClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_SituacaoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_SituacaoClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_Tipo_AtivKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_tipoativClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_TransportadorExit(Sender: TObject);
begin
{   If (Length(Trim(Edit_Transportador.Text)) <> 0) and (Trim(Edit_Transportador.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from TRANSPORTADOR where Codigo='+ Edit_Transportador.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelTransportador.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Transportador não cadastrado.',mtInformation,[mbOK],0);
            PanelTransportador.Caption := '';
            Edit_Transportador.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Transportador.Text := '0';
      PanelTransportador.Caption := '';
   end; }
end;

procedure TFrmClientes.Edit_TransportadorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_TransportadorClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.Edit_VendedorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then
   begin
      F3_vendedorClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmClientes.F3_FormaPagtoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from FormasPagto order by NOME';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Formas de Pagamento';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Forma_Pagto.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Forma_PagtoExit(Self);
         Edit_Forma_Pagto.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.F3_GrupoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from GRUPOS ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Grupos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Grupo.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Grupo.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.F3_PracaEnter(Sender: TObject);
begin

end;

procedure TFrmClientes.F3_TransportadorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from TRANSPORTADOR order by NOME';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Transportadoras';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Transportador.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_TransportadorExit(Self);
         Edit_Transportador.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //Grava campos da ordem e pesquisa
   ListOrdem.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'ord_clientes.dat');
   ListCriterios.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'cri_clientes.dat');
   Action := caFree;
end;

procedure TFrmClientes.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmClientes.BtnIncluiClick(Sender: TObject);
begin
   Paginas.ActivePageIndex := 0;
   Operacao := opInsert;
   zClientes.Active:= True;

   SetStatus('Inserção');
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(Self,1);
            Chk_Consu_Final.Checked := True;
            Edit_PathImageExit(Self);
            Edit_PracaExit(Self);
            Edit_SituacaoExit(Self);
            Edit_ClassificacaoExit(Self);
            Edit_VendedorExit(Self);
            Edit_Tipo_AtivExit(Self);
            Edit_Forma_PagtoExit(Self);
            Edit_TransportadorExit(Self);
            ScrollBox1.VertScrollBar.Position := 0;
            if Parametros.Busca_Chave = 1 then Campo1.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_CLIENTES'));
         end;
      1: Begin  //Descontos
            FrmPrincipal.LimpaCampos(self,5);
            Edit_Cliente_DescontoExit(Self);
            if StrToFloatZero(Edit_Cliente_Desconto.Text) > 0 then
            begin
               Edit_Grupo.SetFocus;
            end
            else
            begin
               Edit_Cliente_Desconto.Text := '0';
               Edit_Cliente_Desconto.SetFocus;
            end;
         end;
      2: Begin  //Veiculos
            FrmPrincipal.LimpaCampos(self,3);
            Edit_Cliente_VeiculoExit(Self);
            if StrToFloatZero(Edit_Cliente_Veiculo.Text) > 0 then
            begin
               Edit_Placa.SetFocus;
            end
            else
            begin
               Edit_Cliente_Veiculo.Text := '0';
               Edit_Cliente_Veiculo.SetFocus;
            end;
         end;
      3: begin //Motoristas
            FrmPrincipal.LimpaCampos(self,4);
            Edit_Cliente_MotExit(Self);
            if StrToFloatZero(Edit_Cliente_Mot.Text) > 0 then
            begin
               Edit_Nome_Mot.SetFocus;
            end
            else
            begin
               Edit_Cliente_Mot.Text := '0';
               Edit_Cliente_Mot.SetFocus;
            end;
         end;
   end;
   Edit_Nome.SetFocus;
end;

procedure TFrmClientes.BtnGravaClick(Sender: TObject);
var
  zqConsultaID: TZQuery;
begin
   if PageCadastro.ActivePageIndex = 0 then
   begin
      //Codigo
      if Length(Trim(Campo1.Text)) > 0 then
      begin
         if not ValNumero(Campo1.Text) then
         begin       {
            MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Código deve sernúmero inteiro válido.', mtInformation,[mbOK],0);
            Campo1.SetFocus;
            Exit;   }
         end;
      end;
      //Nome
      if Length(Trim(Edit_Nome.Text)) = 0 then
      begin     {
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Nome deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_Nome.SetFocus;
         Exit; }
      end;
      //UF
      if Length(Trim(Edit_UF.Text)) = 0 then
      begin       {
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'UF deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_UF.SetFocus;
         Exit;   }
      end;
      //CGC
      if Length(Trim(Msk_CGC.Text)) <> 0 then
      begin
         if not ValidaCgc(Trim(Msk_CGC.Text)) then
         begin     {
            MessageDlg('CGC inválido.', mtInformation,[mbOK],0);
            Msk_CGC.SetFocus;
            Exit; }
         end
         else
         begin
            //Procura para ver se esse CGC ja foi cadastrado
         {   JvQuery := TUIBDataset.Create(self);
            try
               JvQuery.Database := FrmPrincipal.Base;
               JvQuery.Transaction := FrmPrincipal.Transaction;

               if not FrmPrincipal.RodaConsulta('Select * from CLIENTES where CGC='''+ Msk_CGC.Text +''''+' and Codigo <> ' + Campo1.Text,JvQuery) then Exit;
               if JvQuery.RecordCount > 0 then
               begin
                  //keybd_event(39,0,0,0);
                  if MessageDlg('O CGC "'+ Msk_CGC.Text +'" já está cadastrado no sistema para '+ #13 +
                             JvQuery.FieldByName('Codigo').asString + ' - ' +  JvQuery.FieldByName('Nome').asString + #13 +
                             'Deseja localizar e carregar o cliente "'+ JvQuery.FieldByName('Nome').asString +'" ?',
                             mtWarning,[mbYes, mbNo],0) = mrYes then
                  begin
                     Operacao := opBrowse;
                     Carrega_Campos(JvQuery);
                     ScrollBox1.VertScrollBar.Position := 0;
                  end
                  else
                  begin
                     Msk_CGC.SetFocus;
                  end;
               end;
            finally
               JvQuery.Close;
               JvQuery.Free;
            end;}
         end;
      end;
      //Praca
      {
      if (Length(Trim(Edit_Praca.Text)) = 0) or (Trim(Edit_Praca.Text) = '0') then
      begin
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Praça deve ser preenchida.', mtInformation,[mbOK],0);
         Edit_Praca.SetFocus;
         Exit;
      end;
      //Situacao
      if (Length(Trim(Edit_Situacao.Text)) = 0) or (Trim(Edit_Situacao.Text) = '0') then
      begin
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Situação deve ser preenchida.', mtInformation,[mbOK],0);
         Edit_Situacao.SetFocus;
         Exit;
      end;
      //Classificacao
      if (Length(Trim(Edit_Classificacao.Text)) = 0) or (Trim(Edit_Classificacao.Text) = '0') then
      begin
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Classificação deve ser preenchida.', mtInformation,[mbOK],0);
         Edit_Classificacao.SetFocus;
         Exit;
      end;
      //Tipo de Atividade
      if (Length(Trim(Edit_Tipo_Ativ.Text)) = 0) or (Trim(Edit_Tipo_Ativ.Text) = '0') then
      begin
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Tipo de Atividade deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_Tipo_Ativ.SetFocus;
         Exit;
      end;
      //Vendedor
      if (Length(Trim(Edit_Vendedor.Text)) = 0) or (Trim(Edit_Vendedor.Text) = '0') then
      begin
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Vendedor deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_Vendedor.SetFocus;
         Exit;
      end;
      //Formas Pagto
      if (Length(Trim(Edit_Forma_Pagto.Text)) = 0) or (Trim(Edit_Forma_Pagto.Text) = '0') then
      begin
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Formas Pagamento deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_Forma_Pagto.SetFocus;
         Exit;
      end;
      //Transportadora
      if (Length(Trim(Edit_Transportador.Text)) = 0) or (Trim(Edit_Transportador.Text) = '0') then
      begin
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Transportador deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_Transportador.SetFocus;
         Exit;
      end;           }
      //CPF
      if Length(Trim(Msk_CPF.Text)) <> 0 then
      begin
         if not ValidaCPF(Trim(Msk_CPF.Text)) then
         begin      {
            MessageDlg('CPF inválido.', mtInformation,[mbOK],0);
            Msk_CPF.SetFocus;
            Exit;  }
         end
         else
         begin
            //Procura para ver se esse CGC ja foi cadastrado
{            JvQuery := TUIBDataset.Create(self);
            try
               JvQuery.Database := FrmPrincipal.Base;
               JvQuery.Transaction := FrmPrincipal.Transaction;

               if not FrmPrincipal.RodaConsulta('Select * from CLIENTES where CPF='''+ Msk_CPF.Text +''''+' and Codigo <> ' + Campo1.Text,JvQuery) then Exit;
               if JvQuery.RecordCount > 0 then
               begin
                  //keybd_event(39,0,0,0);
                  if MessageDlg('O CPF "'+ Msk_CPF.Text +'" já está cadastrado no sistema para '+ #13 +
                             JvQuery.FieldByName('Codigo').asString + ' - ' +  JvQuery.FieldByName('Nome').asString + #13 +
                             'Deseja localizar e carregar o cliente "'+ JvQuery.FieldByName('Nome').asString +'" ?',
                             mtWarning,[mbYes, mbNo],0) = mrYes then
                  begin
                     Operacao := opBrowse;
                     Carrega_Campos(JvQuery);
                     ScrollBox1.VertScrollBar.Position := 0;
                  end
                  else
                     Msk_CPF.SetFocus;
               end;
            finally
               JvQuery.Close;
               JvQuery.Free;
            end; }
         end;
      end;
   end else
   if PageCadastro.ActivePageIndex = 1 then //Descontos
   begin
      //Cliente
      if Length(Trim(Edit_Cliente_Veiculo.Text)) > 0 then
      begin
         if not ValNumero(Edit_Cliente_Veiculo.Text) then
         begin
            MessageDlg('Código do Cliente deve ser número inteiro válido.', mtInformation,[mbOK],0);
            Edit_Cliente_Veiculo.SetFocus;
            Exit;
         end;
      end;
      //Grupo
      if Length(Trim(Edit_Grupo.Text)) = 0 then
      begin
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Grupo deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_Grupo.SetFocus;
         Exit;
      end;
   end else
   {
   if PageCadastro.ActivePageIndex = 2 then //Veiculos
   begin
      //Cliente
      if Length(Trim(Edit_Cliente_Veiculo.Text)) > 0 then
      begin
         if not ValNumero(Edit_Cliente_Veiculo.Text) then
         begin
            MessageDlg('Código do Cliente deve ser número inteiro válido.', mtInformation,[mbOK],0);
            Edit_Cliente_Veiculo.SetFocus;
            Exit;
         end;
      end;
      //Placa
      if Length(Trim(Edit_Placa.Text)) = 0 then
      begin
         MessageDlg('Campos em negrito são obrigatórios!' +#13 + 'Placa deve ser preenchida.', mtInformation,[mbOK],0);
         Edit_Placa.SetFocus;
         Exit;
      end;
   end else
   if PageCadastro.ActivePageIndex = 3 then //Motoristas
   begin
      //Cliente
      if Length(Trim(Edit_Cliente_Mot.Text)) > 0 then
      begin
         if not ValNumero(Edit_Cliente_Mot.Text) then
         begin
            MessageDlg('Código do Cliente deve ser número inteiro válido.', mtInformation,[mbOK],0);
            Edit_Cliente_Mot.SetFocus;
            Exit;
         end;
      end;
      //Nome Motorista
      if Length(Trim(Edit_Nome_Mot.Text)) = 0 then
      begin
         MessageDlg('Campos em negrito devem ser preenchidos!' +#13 + 'Nome deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_Nome_Mot.SetFocus;
         Exit;
      end;
   end;            }

   //se grava como browse entao esta editando
   zClientes.Active:= True;
   if Operacao = opBrowse then Operacao := opEdit;
   SetStatus('Edição');

   if Operacao = opInsert Then zclientes.insert;

   if PageCadastro.ActivePageIndex = 0 then
   begin
     Carrega_Parametros(zClientes);

     if Operacao = opInsert Then
     begin
       zqConsultaID := TZQuery.Create(Self);

       zqConsultaID.Connection := FrmPrincipal.Conexao;

       zqConsultaID.SQL.Clear;
       zqConsultaID.SQL.Add('SELECT GEN_ID( GEN_CLIENTE_ID, 1 ) FROM RDB$DATABASE');

       zqConsultaID.Open;
       zqConsultaID.First;

        ShowMessage('Inserindo clientes... '+zqConsultaID.FieldByName('GEN_ID').AsString);
        zClientes.FieldByName('CODIGO').AsInteger:= zqConsultaID.FieldByName('GEN_ID').AsInteger;

        zclientes.insert;
        FrmPrincipal.RodaSP(zClientes);
     end;
     if Operacao = opEdit Then FrmPrincipal.RodaSP(zClientes);
{      Carrega_Parametros(Proc);
      FrmPrincipal.RodaSP(Proc); }
   end
   else
   begin
      if PageCadastro.ActivePageIndex = 1 then
      begin                                    {
         Carrega_Parametros(Proc_Descontos);
         FrmPrincipal.RodaSP(Proc_Descontos); }
      end else
      if PageCadastro.ActivePageIndex = 2 then
      begin                                      {
         Carrega_Parametros(Proc_Veiculos);
         FrmPrincipal.RodaSP(Proc_Veiculos);    }
      end
      else
      begin                                        {
         Carrega_Parametros(Proc_Motoristas);
         FrmPrincipal.RodaSP(Proc_Motoristas);    }
      end;
   end;

   Operacao := opBrowse;
   BtnAtualizaClick(Self);
   Case PageCadastro.ActivePageIndex of
      0: begin
            if NaoLimpar.Checked then
            begin
               Operacao := opInsert;
               Campo1.Text := '0';
               Campo1.SetFocus;
            end;
         end;
      1: begin
            Edit_Cliente_DescontoExit(Self);
         end;
      2: begin
            Edit_Cliente_VeiculoExit(Self);
         end;
      3: begin
            Edit_Cliente_MotExit(Self);
         end;
   end;
   BtnInclui.SetFocus;
end;

procedure TFrmClientes.Carrega_Parametros(Proc : TZQuery);
begin
   with Proc do
   begin
      if PageCadastro.ActivePageIndex = 0 then
      begin
           FieldByName('CODIGO').AsInteger:= StrToIntZero(Campo1.Text);
           FieldByName('NOME').AsString:=  Edit_Nome.Text;
           FieldByName('NOM_FAN').AsString:= Edit_Nom_Fan.Text;
           FieldByName('ENDERECO').AsString:= Edit_Endereco.Text;
           FieldByName('BAIRRO').AsString:= Edit_Bairro.Text;
           FieldByName('CIDADE').AsString:= Edit_Cidade.Text;
           FieldByName('UF').AsString:= Edit_UF.Text;
           FieldByName('CEP').AsString:= Msk_Cep.Text;
           FieldByName('CX_POSTAL').AsString:= Edit_Cx_Postal.Text;
           FieldByName('FONE').AsString:= Edit_Fone.Text;
           FieldByName('FAX').AsString:= Edit_Fax.Text;
           FieldByName('CONTATO').AsString:= Edit_Contato.Text;
           FieldByName('PATHIMAGE').AsString:= Edit_PathImage.Text;
           FieldByName('EMAIL').AsString:= Edit_Email.Text;
           FieldByName('CGC').AsString:=  Msk_CGC.Text;
           FieldByName('INSCRICAO').AsString:=  Edit_Inscricao.Text;
           FieldByName('PRACA').AsInteger:= 1; // Edit_Praca.Text;
           FieldByName('SITUACAO').AsInteger:= 1; // Edit_Situacao.Text;
           FieldByName('CLASSIFICACAO').AsInteger:= 1; // Edit_Classificacao.Text;
           FieldByName('VENDEDOR').AsInteger:= 1; //  Edit_Vendedor.Text;
           FieldByName('TIPO_ATIV').AsInteger:= 1; //
           FieldByName('FORMASPAGTO').AsInteger:= 1; // Formas de Pagto
      end;
{         Params.ByNameasInteger['POPER'] := Operacao;
         Params.ByNameAsInteger['PCODIGO'] := StrToIntZero(Campo1.Text);
         Params.ByNameAsString['PNOME'] := Edit_Nome.Text;
         Params.ByNameAsString['PNOM_FAN'] := Edit_Nom_Fan.Text;
         Params.ByNameAsString['PENDERECO'] := Edit_Endereco.Text;
         Params.ByNameAsString['PBAIRRO'] := Edit_Bairro.Text;
         Params.ByNameAsString['PCIDADE'] := Edit_Cidade.Text;
         Params.ByNameAsString['PUF'] := Edit_UF.Text;
         Params.ByNameAsString['PCEP'] := Msk_Cep.Text;
         Params.ByNameAsString['PCX_POSTAL'] := Edit_Cx_Postal.Text;
         Params.ByNameAsString['PFONE'] := Edit_Fone.Text;
         Params.ByNameAsString['PFAX'] := Edit_Fax.Text;
         Params.ByNameAsString['PCONTATO'] := Edit_Contato.Text;
         Params.ByNameAsString['PPATHIMAGE'] := Edit_PathImage.Text;
         Params.ByNameAsString['PEMAIL'] := Edit_Email.Text;
         Params.ByNameAsString['PCGC'] := Msk_CGC.Text;
         Params.ByNameAsString['PINSCRICAO'] := Edit_Inscricao.Text;
         Params.ByNameAsString['PPRACA'] := Edit_Praca.Text;
         Params.ByNameAsString['PSITUACAO'] := Edit_Situacao.Text;
         Params.ByNameAsString['PCLASSIFICACAO'] := Edit_Classificacao.Text;
         Params.ByNameAsString['PVENDEDOR'] := Edit_Vendedor.Text;
         Params.ByNameAsString['PTIPO_ATIV'] := Edit_Tipo_Ativ.Text;
         if Trim(Msk_Data_Ficha.Text) <> '' then
            Params.ByNameAsDateTime['PDATA_FICHA'] := StrToDateTime(Msk_Data_Ficha.Text)
         else
            Params.ByNameIsNull['PDATA_FICHA'] := True;
         //Crediário
         Params.ByNameAsString['PCPF'] := Msk_CPF.Text;
         Params.ByNameAsString['PCI'] := Edit_CI.Text;
         Params.ByNameAsString['PTIT_ELEITOR'] := Edit_Tit_Eleitor.Text;
         if Trim(Msk_Data_Nasc.Text) <> '' then
            Params.ByNameAsDateTime['PDATA_NASC'] := StrToDateTime(Msk_Data_Nasc.Text)
         else
            Params.ByNameIsNull['PDATA_NASC'] := True;
         Params.ByNameAsString['PNATURA'] := Edit_Natura.Text;
         Params.ByNameAsString['PFILIACAO'] := Edit_Filiacao.Text;
         Params.ByNameAsInteger['PNUM_DEPEND'] := StrToIntZero(Edit_Num_Depend.Text);
         Params.ByNameAsInteger['PSEXO'] := Chk_Sexo.ItemIndex;
         Params.ByNameAsInteger['PEST_CIVIL'] := Chk_Est_Civil.ItemIndex;
         Params.ByNameAsString['PCONJUGE'] := Edit_Conjuge.Text;
         if Trim(Msk_Nasc_Conj.Text) <> '' then
            Params.ByNameAsDateTime['PNASC_CONJ'] := StrToDateTime(Msk_Nasc_Conj.Text)
         else
            Params.ByNameIsNull['PNASC_CONJ'] := True;
         Params.ByNameAsString['PEMPR_CONJ'] := Edit_Empr_Conj.Text;
         Params.ByNameAsCurrency['PSAL_CONJ'] := StrToFloatZero(Edit_Sal_Conj.Text);
         Params.ByNameAsString['PFUNC_CONJ'] := Edit_Func_Conj.Text;
         Params.ByNameAsInteger['PALUGUEL'] := Chk_Aluguel.ItemIndex;
         Params.ByNameAsCurrency['PVAL_ALUGUEL'] := StrToFloatZero(Edit_Val_Aluguel.Text);
         Params.ByNameAsString['PTEMP_RESID'] := Edit_Temp_Resid.Text;
         Params.ByNameAsString['PIMOBILIAR'] := Edit_Imobiliar.Text;
         Params.ByNameAsString['PEND_ANTER'] := Edit_End_Anter.Text;
         //
         Params.ByNameAsString['PEMPRESA'] := Edit_Empresa.Text;
         Params.ByNameAsString['PENDE_EMPR'] := Edit_Ende_Empr.Text;
         Params.ByNameAsString['PCIDA_EMPR'] := Edit_Cida_Empr.Text;
         Params.ByNameAsString['PCEP_EMPR'] := Msk_Cep_Empr.Text;
         Params.ByNameAsString['PUF_EMPR'] := Edit_UF_Empr.Text;
         Params.ByNameAsString['PFONE_EMPR'] := Edit_Fone_Empr.Text;
         if Trim(Msk_Admissao.Text) <> '' then
            Params.ByNameAsDateTime['PADMISSAO'] := StrToDateTime(Msk_Admissao.Text)
         else
            Params.ByNameIsNull['PADMISSAO'] := True;
         Params.ByNameAsString['PFUNCAO'] := Edit_Funcao.Text;
         Params.ByNameAsCurrency['PREMUNERAC'] := StrToFloatZero(Edit_Remunerac.Text);
         Params.ByNameAsCurrency['PREM_EXTRA'] := StrToFloatZero(Edit_Rem_Extra.Text);
         Params.ByNameAsString['PEMPR_ANT'] := Edit_Empr_Ant.Text;
         Params.ByNameAsString['PTEMP_SERV'] := Edit_Temp_Serv.Text;
         Params.ByNameAsString['PREF_COML'] := Edit_Ref_Coml.Text;
         Params.ByNameAsString['PREF_BANC'] := Edit_Ref_Banc.Text;
         if Trim(Msk_Cons_Spc.Text) <> '' then
            Params.ByNameAsDateTime['PCONS_SPC'] := StrToDateTime(Msk_Cons_Spc.Text)
         else
            Params.ByNameIsNull['PCONS_SPC'] := True;
         Params.ByNameAsString['POBS_SPC'] := Edit_Obs_Spc.Text;
         Params.ByNameAsString['POBS_GERAL'] := Memo_Obs_Geral.Lines.Text;

         Params.ByNameAsString['PCOBR_ENDER'] := Edit_Cobr_Ender.Text;
         Params.ByNameAsString['PCOBR_BAIRR'] := Edit_Cobr_Bairr.Text;
         Params.ByNameAsString['PCOBR_CIDAD'] := Edit_Cobr_Cidad.Text;
         Params.ByNameAsString['PCOBR_UF'] := Edit_Cobr_Uf.Text;
         Params.ByNameAsString['PCOBR_CEP'] := Msk_Cobr_Cep.Text;
         Params.ByNameAsInteger['PCONSU_FINAL'] := IIF(Chk_Consu_Final.Checked = True,1,0);

         Params.ByNameAsString['PTRANSPORTADORA'] := Edit_Transportador.Text; //fernando -> adicionei o campo no banco e na proc
         Params.ByNameAsString['PFORMASPAGTO'] := Edit_Forma_Pagto.Text; //fernando -> adicionei o campo no banco e na proc
         Params.ByNameAsInteger['PCLASS_DESCONTOS'] := RG_Class_Descontos.ItemIndex; //fernando -> adicionei o campo no banco e na proc
         Params.ByNameAsCurrency['PDESC_INDIVIDUAL'] := StrToFloatZero(Edit_Desc_Individual.Text); //fernando -> adicionei o campo no banco e na proc
         //  Tirar da Procedure
         Params.ByNameAsInteger['PICM_IPI'] := 1;
      end else
      if PageCadastro.ActivePageIndex = 1 then //Descontos
      begin
         Params.ByNameasInteger['POPER'] := Operacao;
         Params.ByNameasInteger['PCLIENTE'] := StrToIntZero(Edit_Cliente_Desconto.Text);
         Params.ByNameasString['PGRUPO'] := Edit_Grupo.Text;
         Params.ByNameAsCurrency['PDESCONTO'] := StrToFloatZero(Edit_Desconto.Text);
      end else
      if PageCadastro.ActivePageIndex = 2 then //Veiculos
      begin
         Params.ByNameasInteger['POPER'] := Operacao;
         Params.ByNameasInteger['PCLIENTE'] := StrToIntZero(Edit_Cliente_Veiculo.Text);
         Params.ByNameasString['PPLACA'] := Edit_Placa.Text;
         Params.ByNameasString['PDESCRICAO'] := Edit_Descricao.Text;
         Params.ByNameasString['PMARCA'] := Edit_Marca.Text;
         Params.ByNameasString['PCOR'] := Edit_Cor.Text;
      end else
      if PageCadastro.ActivePageIndex = 3 then //Motoristas
      begin
         Params.ByNameasInteger['POPER'] := Operacao;
         Params.ByNameasInteger['PCLIENTE'] := StrToIntZero(Edit_Cliente_Mot.Text);
         if Edit_Cod_Mot.Text = '' then
            Params.ByNameIsNull['PCODIGO'] :=  True
         else
            Params.ByNameAsInteger['PCODIGO'] := StrToIntZero(Edit_Cod_Mot.Text);
         Params.ByNameasString['PNOME'] := Edit_Nome_Mot.Text;
         Params.ByNameasString['PCPF'] := Edit_CPF_Mot.Text;
         Params.ByNameasString['PRG'] := Edit_RG_Mot.Text;
         Params.ByNameasString['PCART_MOT'] := Edit_Cart_Mot.Text;
      end; }
   end;
end;

procedure TFrmClientes.Carrega_Campos(oDataSet: TZQuery);
begin
   with oDataset do
   begin
      if PageCadastro.ActivePageIndex = 0 then
      begin
         Campo1.Text := FieldByName('CODIGO').asString;
         Edit_Nome.Text := FieldByName('NOME').asString;
         Edit_Nom_Fan.Text := FieldByName('NOM_FAN').asString;
         Edit_Endereco.Text := FieldByName('ENDERECO').asString;
         Edit_Bairro.Text := FieldByName('BAIRRO').asString;
         Edit_Cidade.Text := FieldByName('CIDADE').asString;
         Edit_UF.Text := FieldByName('UF').asString;
         //CEP
         Msk_CEPEnter(Msk_CEP);
         Msk_CEP.Text := FieldByName('CEP').asString;
         Msk_CEPExit(Msk_CEP);
         //
         Edit_Cx_Postal.Text := FieldByName('CX_POSTAL').asString;
         Edit_Fone.Text := FieldByName('FONE').asString;
         Edit_Fax.Text := FieldByName('FAX').asString;
         Edit_Contato.Text := FieldByName('CONTATO').asString;
         Edit_PathImage.Text := FieldByName('PATHIMAGE').asString;
         Edit_PathImageExit(Self);
         Edit_Email.Text := FieldByName('EMAIL').asString;
         //CGC
         Msk_CGCEnter(Msk_CGC);
         Msk_CGC.Text := FieldByName('CGC').asString;
         Msk_CGCExit(Msk_CGC);
         //
         Edit_Inscricao.Text := FieldByName('INSCRICAO').asString;
         //Edit_Praca.Text := FieldByName('PRACA').asString;
         Edit_Praca.Text := FieldByName('PRACA').AsString;
         Edit_PracaExit(Self);
         Edit_Situacao.Text := FieldByName('SITUACAO').AsString;
         Edit_SituacaoExit(Self);
         Edit_Classificacao.Text := FieldByName('CLASSIFICACAO').AsString;
         Edit_ClassificacaoExit(Self);
         //Edit_Vendedor.Text := FieldByName('VENDEDOR').asString;
         Edit_Vendedor.Text := FieldByName('VENDEDOR').AsString;
         Edit_VendedorExit(Self);
         //Edit_Tipo_Ativ.Text := FieldByName('TIPO_ATIV').asString;
         Edit_Tipo_Ativ.Text := FieldByName('TIPO_ATIV').AsString;
         Edit_Tipo_AtivExit(Self);
         //Data Ficha
         Msk_Data_FichaEnter(Msk_Data_Ficha);
         Msk_Data_Ficha.Text := FieldByName('DATA_FICHA').asString;
         Msk_Data_FichaExit(Msk_Data_Ficha);
         //
         //CPF
         Msk_CPFEnter(Msk_CPF);
         Msk_CPF.Text := FieldByName('CPF').asString;
         Msk_CPFExit(Msk_CPF);
         //
         Edit_CI.Text := FieldByName('CI').asString;
         Edit_Tit_Eleitor.Text := FieldByName('TIT_ELEITOR').asString;
         //Data Nasc
         Msk_Data_FichaEnter(Msk_Data_Nasc);
         Msk_Data_Nasc.Text := FieldByName('DATA_NASC').asString;
         Msk_Data_FichaExit(Msk_Data_Nasc);
         //
         Edit_Natura.Text := FieldByName('NATURA').asString;
         Edit_Filiacao.Text := FieldByName('FILIACAO').asString;
         Edit_Num_Depend.Text := FieldByName('NUM_DEPEND').asString;
         Chk_Sexo.ItemIndex := FieldByName('SEXO').asInteger;
         Chk_Est_Civil.ItemIndex := FieldByName('EST_CIVIL').asInteger;
         Edit_Conjuge.Text := FieldByName('CONJUGE').asString;
         //Data Nasc
         Msk_Data_FichaEnter(Msk_Nasc_Conj);
         Msk_Nasc_Conj.Text := FieldByName('NASC_CONJ').asString;
         Msk_Data_FichaExit(Msk_Nasc_Conj);
         //
         Edit_Empr_Conj.Text := FieldByName('EMPR_CONJ').asString;
         Edit_Sal_Conj.Text := FieldByName('SAL_CONJ').AsString;
         Edit_Func_Conj.Text := FieldByName('FUNC_CONJ').asString;
         Chk_Aluguel.ItemIndex := FieldByName('ALUGUEL').asInteger;
         Edit_Val_Aluguel.Text := FieldByName('VAL_ALUGUEL').AsString;
         Edit_Temp_Resid.Text := FieldByName('TEMP_RESID').asString;
         Edit_Imobiliar.Text := FieldByName('IMOBILIAR').asString;
         Edit_End_Anter.Text := FieldByName('END_ANTER').asString;
         Edit_Empresa.Text := FieldByName('EMPRESA').asString;
         Edit_Ende_Empr.Text := FieldByName('ENDE_EMPR').asString;
         Edit_Cida_Empr.Text := FieldByName('CIDA_EMPR').asString;
         //CEP empresa
         Msk_CEPEnter(Msk_Cep_Empr);
         Msk_Cep_Empr.Text := FieldByName('CEP_EMPR').asString;
         Msk_CEPExit(Msk_Cep_Empr);
         //
         Edit_UF_Empr.Text := FieldByName('UF_EMPR').asString;
         Edit_Fone_Empr.Text := FieldByName('FONE_EMPR').asString;
         //Admissao
         Msk_Data_FichaEnter(Msk_Admissao);
         Msk_Admissao.Text := FieldByName('ADMISSAO').asString;
         Msk_Data_FichaExit(Msk_Admissao);
         //
         Edit_Funcao.Text := FieldByName('FUNCAO').asString;
         Edit_Funcao.Text := FieldByName('FUNCAO').asString;
         Edit_Remunerac.Text := FieldByName('REMUNERAC').AsString;
         Edit_Rem_Extra.Text := FieldByName('REM_EXTRA').AsString;
         Edit_Empr_Ant.Text := FieldByName('EMPR_ANT').asString;
         Edit_Temp_Serv.Text := FieldByName('TEMP_SERV').asString;
         Edit_Ref_Coml.Text := FieldByName('REF_COML').asString;
         Edit_Ref_Banc.Text := FieldByName('REF_BANC').asString;
         //Data_SPC
         Msk_Data_FichaEnter(Msk_Cons_Spc);
         Msk_Cons_Spc.Text := FieldByName('CONS_SPC').asString;
         Msk_Data_FichaExit(Msk_Cons_Spc);
         //
         Edit_Obs_Spc.Text := FieldByName('OBS_SPC').asString;
         Memo_Obs_Geral.Lines.Text := FieldByName('OBS_GERAL').asString;
         Edit_Cobr_Ender.Text := FieldByName('COBR_ENDER').asString;
         Edit_Cobr_Bairr.Text := FieldByName('COBR_BAIRR').asString;
         Edit_Cobr_Cidad.Text := FieldByName('COBR_CIDAD').asString;
         Edit_Cobr_Uf.Text := FieldByName('COBR_UF').asString;
         //CEP empresa
         Msk_CEPEnter(Msk_Cobr_Cep);
         Msk_Cobr_Cep.Text := FieldByName('COBR_CEP').asString;
         Msk_CEPExit(Msk_Cobr_Cep);

         Edit_Transportador.Text := FieldByName('TRANSPORTADORA').AsString;
         Edit_TransportadorExit(Self);
         Edit_Forma_Pagto.Text := FieldByName('FORMASPAGTO').AsString;
         Edit_Forma_PagtoExit(Self);
         RG_Class_Descontos.ItemIndex := FieldByName('CLASS_DESCONTOS').AsInteger;
         Edit_Desc_Individual.Text := FieldByName('DESC_INDIVIDUAL').asString;

         //
         Chk_Consu_Final.Checked := IIF(FieldByName('CONSU_FINAL').AsInteger = 1,True,False);
      end else
      if PageCadastro.ActivePageIndex = 1 then //Descontos
      begin
         Edit_Cliente_Desconto.Text := FieldByName('CLIENTE').AsString;
         Edit_Grupo.Text := FieldByName('GRUPO').asString;
         Edit_GrupoExit(Self);
         Edit_Desconto.Text := FieldByName('DESCONTO').asString;
      end else
      if PageCadastro.ActivePageIndex = 2 then //Veiculos
      begin
         Edit_Cliente_Veiculo.Text := FieldByName('CLIENTE').AsString;
         Edit_PlacaEnter(Edit_Placa);
         Edit_Placa.Text := FieldByName('PLACA').asString;
         Edit_PlacaExit(Edit_Placa);
         Edit_Descricao.Text := FieldByName('DESCRICAO').asString;
         Edit_Marca.Text := FieldByName('MARCA').asString;
         Edit_Cor.Text := FieldByName('COR').asString;
      end else
      if PageCadastro.ActivePageIndex = 3 then //Motoristas
      begin
         Edit_Cliente_Veiculo.Text := FieldByName('CLIENTE').AsString;
         Edit_Nome_Mot.Text := FieldByName('NOME').AsString;
         Edit_Cod_Mot.Text := FieldByName('CODIGO').AsString;
         Msk_CPFEnter(Edit_CPF_Mot);
         Edit_CPF_Mot.Text := FieldByName('CPF').AsString;
         Msk_CPFExit(Edit_CPF_Mot);
         Edit_Cart_Mot.Text := FieldByName('CART_MOT').AsString;
         Edit_RG_Mot.Text := FieldByName('RG').AsString;
      end;
   end;
end;

procedure TFrmClientes.FrmClientesPaint(Sender: TObject);
begin
   //ScrollBox1.VertScrollBar.Position := 0;
   ScrollBox1.UpdateScrollbars;
end;

procedure TFrmClientes.Grid_PesquisaCellClick(Column: TColumn);
begin

end;

procedure TFrmClientes.Grid_PesquisaDblClick(Sender: TObject);
begin   {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      PageCadastro.ActivePageIndex := 0;
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
      ScrollBox1.VertScrollBar.Position := 0;
      SetStatus('Edição');
      //ScrollBox1.UpdateScrollbars;
   end;}
end;

procedure TFrmClientes.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmClientes.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(self,1);
            Edit_PathImageExit(Self);
            Edit_PracaExit(Self);
            Edit_SituacaoExit(Self);
            Edit_ClassificacaoExit(Self);
            Edit_VendedorExit(Self);
            Edit_Tipo_AtivExit(Self);
            Edit_Forma_PagtoExit(Self);
            Edit_TransportadorExit(Self);
            ScrollBox1.VertScrollBar.Position := 0;
            ScrollBox1.UpdateScrollbars;
         end;
      1: begin
            FrmPrincipal.LimpaCampos(self,5);
            Edit_GrupoExit(Self);
            Edit_Cliente_DescontoExit(Self);
            Carrega_Descontos(StrToIntZero(Edit_Cliente_Desconto.Text));
         end;
      2: begin
            FrmPrincipal.LimpaCampos(self,3);
            Edit_Cliente_VeiculoExit(Self);
            Carrega_Veiculos(StrToIntZero(Edit_Cliente_Veiculo.Text));
         end;
      3: begin
            FrmPrincipal.LimpaCampos(self,4);
            Edit_Cliente_MotExit(Self);
            Carrega_Motoristas(StrToIntZero(Edit_Cliente_Mot.Text));
         end;
   end;
   BtnInclui.SetFocus;
end;

procedure TFrmClientes.Campo1Exit(Sender: TObject);
begin    {
   If Length(Trim(Campo1.Text)) <> 0 then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         if not FrmPrincipal.RodaConsulta('Select * from Clientes where Codigo='+ Campo1.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Campo1.text := '0';
   end; }
end;

procedure TFrmClientes.FormShow(Sender: TObject);
var I : Integer;
    vSelect : String;
begin
   Combo_Avaliacao.ItemIndex := 0;
   ComboMov_Geral.ItemIndex := 0;
   ComboMov_Aberto.ItemIndex := 0;
   Operacao := opBrowse;
   SetStatus('Pesquisa');
         {
   Proc.database := frmprincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_CLIENTES');

   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;

   Proc_Descontos.DataBase := frmprincipal.base;
   Proc_Descontos.Transaction := frmprincipal.transaction;
   Proc_Descontos.BuildStoredProc('PROC_CLIENTESDESCONTOS');

   JvQry_Descontos.Database := Frmprincipal.Base;
   JvQry_Descontos.Transaction := Frmprincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' Select CLIENTESDESCONTOS.Cliente, CLIENTESDESCONTOS.Grupo, GRUPOS.Nome, CLIENTESDESCONTOS.Desconto From CLIENTESDESCONTOS inner join GRUPOS on (GRUPOS.Codigo = CLIENTESDESCONTOS.Grupo) ';
   vSelect := vSelect + ' where';
   vSelect := vSelect + ' CLIENTESDESCONTOS.Cliente = :oCliente';
   vSelect := vSelect + ' order by Grupo';
   JvQry_Descontos.SQL.Add(vSelect);

   Proc_Veiculos.DataBase := frmprincipal.base;
   Proc_Veiculos.Transaction := frmprincipal.transaction;
   Proc_Veiculos.BuildStoredProc('PROC_VEICULOS');

   JvQry_Veiculos.Database := Frmprincipal.Base;
   JvQry_Veiculos.Transaction := Frmprincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' Select Cliente, Placa, Descricao, Marca, Cor From Veiculos ';
   vSelect := vSelect + ' where';
   vSelect := vSelect + ' Cliente = :oCliente';
   vSelect := vSelect + ' order by Placa';
   JvQry_Veiculos.SQL.Add(vSelect);

   Proc_Motoristas.DataBase := frmprincipal.base;
   Proc_Motoristas.Transaction := frmprincipal.transaction;
   Proc_Motoristas.BuildStoredProc('PROC_MOTORISTAS');

   JvQry_Motoristas.Database := Frmprincipal.Base;
   JvQry_Motoristas.Transaction := Frmprincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' Select Cliente, Codigo, Nome, Cart_Mot, CPF, RG From Motoristas ';
   vSelect := vSelect + ' where';
   vSelect := vSelect + ' Cliente = :oCliente';
   vSelect := vSelect + ' order by Nome';
   JvQry_Motoristas.SQL.Add(vSelect);

   JvQry_MovGeral.Database := FrmPrincipal.base;
   JvQry_MovGeral.Transaction := FrmPrincipal.Transaction;

   JvQry_MovAberto.Database := FrmPrincipal.base;
   JvQry_MovAberto.Transaction := FrmPrincipal.Transaction;

   //TabFinanceiro.Visible := False;
   TabMotoristas.Visible := False;
   TabVeiculos.Visible := False;

   //Carrega os Campos para Pesquisa
   Qry := TUIBDataset.Create(Self);
   Try
      Qry.Database := FrmPrincipal.Base;
      Qry.Transaction := FrmPrincipal.Transaction;
      Qry.SQL.Clear;
      Qry.SQL.Add('Select * from Clientes where Codigo = -1');
      Qry.Open;
      ComboCampo.Items.Clear;
      ComboCampo_Ord.Items.Clear;
      For I := 0 to Qry.FieldCount-1 do
      begin
         if Qry.FieldDefs[I].DataType = ftString then
            ComboCampo.Items.Add(Qry.FieldDefs[I].Name + ' (S)')
         else
            ComboCampo.Items.Add(Qry.FieldDefs[I].Name);
         ComboCampo_Ord.Items.Add(Qry.FieldDefs[I].Name);
      end;
   except
      Qry.Close;
      Qry.Free;
   end; }

   //Tab Veiculos e Motoristas
   if Parametros.CAD_VEIC_MOTO = 1 then
   begin
      TabMotoristas.Visible := True;
      TabVeiculos.Visible := True;
   end
   else
   begin
      TabMotoristas.Visible := False;
      TabVeiculos.Visible := False;
   end;
   //Carregar campos da ordem e pesquisa
   Try
      ListOrdem.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'ord_clientes.dat');
      ListCriterios.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'cri_clientes.dat');
   except
   end;

  // RibbonGraph1.Clear;
   //BtnAtualizaClick(Self); // carrega clientes na grid
end;

procedure TFrmClientes.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI, aOrdem : String;
    I: Integer;
begin
   BtnEditar.enabled := false;
   BtnExcluiPesq.enabled := false;
   vSelect := '';

   vSelect := 'Select * from Clientes ';

   CRI := '';
   //Codigo
   If (Length(Trim(Edit_PCodigo.Text)) > 0) and (StrToIntZero(Edit_PCodigo.Text) > 0) then
   begin
      CRI := CRI + ' and Codigo = '+ Trim(Edit_PCodigo.Text) +' ';
   end;
   //Nome
   If Length(Trim(Edit_PNome.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Nome) like Upper(''%'+ Trim(Edit_PNome.Text) +'%'')';
   end;
   //Praca
   If (Length(Trim(Edit_PPraca.Text)) > 0) and (StrToIntZero(Edit_PPraca.Text) > 0) then
   begin
      CRI := CRI + ' and Praca = '+ Trim(Edit_PPraca.Text) +' ';
   end;
   //Situacao
   If (Length(Trim(Edit_PSituacao.Text)) > 0) and (StrToIntZero(Edit_PSituacao.Text) > 0) then
   begin
      CRI := CRI + ' and Situacao = '+ Trim(Edit_PSituacao.Text) +' ';
   end;
   //Tipo de Atividade
   If (Length(Trim(Edit_PClassificacao.Text)) > 0) and (StrToIntZero(Edit_PClassificacao.Text) > 0) then
   begin
      CRI := CRI + ' and Classificacao = '+ Trim(Edit_PClassificacao.Text) +' ';
   end;
   //CGC
   If Length(Trim(Msk_PCGC.Text)) > 0 then
   begin
      CRI := CRI + ' and CGC = ''' + Trim(Msk_PCGC.Text) +'''';
   end;
   //CPF
   If Length(Trim(Msk_PCPF.Text)) > 0 then
   begin
      CRI := CRI + ' and CPF = ''' + Trim(Msk_PCPF.Text) +'''';
   end;
   //Pesquisa Avançada
   if ListCriterios.Items.Count > 0 then
   begin
      For I := 0 to ListCriterios.Items.Count-1 do
      begin
         CRI := CRI + ' and ' +ListCriterios.Items[I];
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

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + Copy(aOrdem,1,Length(aOrdem)-1);

{   datasource.dataset := nil;
   Grid_Pesquisa.DataSource := nil; }

   if (FrmPrincipal.RodaConsulta(vSelect,zclientes)) and (zclientes.RecordCount > 0) then
   begin
      BtnEditar.enabled := true;
      BtnExcluiPesq.enabled := true;
      Carrega_Campos(zClientes);
      {
      datasource.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource;
      Grid_Pesquisa.SetFocus;}
   end;
end;

procedure TFrmClientes.BtnExcluiClick(Sender: TObject);
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin
{      JvQuery := TUIBDataset.Create(Self);
      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction;
      try
         Case PageCadastro.ActivePageIndex of
            0: begin
                  if not FrmPrincipal.RodaConsulta('Select * from Clientes where Codigo='+ Campo1.Text,JvQuery) then Exit;
                  if JvQuery.RecordCount > 0 then
                  begin
                     Operacao := opDelete;
                     Carrega_Campos(JvQuery);
                     try
                       if MessageDlg('Confirma exclusão de '+ Edit_Nome.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                       begin
                          Carrega_Parametros(Proc);
                          FrmPrincipal.RodaSP(Proc);
                          FrmPrincipal.LimpaCampos(self,1);
                          Edit_PathImageExit(Self);
                          Edit_PracaExit(Self);
                          Edit_SituacaoExit(Self);
                          Edit_ClassificacaoExit(Self);
                          Edit_VendedorExit(Self);
                          Edit_Tipo_AtivExit(Self);
                          Edit_Forma_PagtoExit(Self);
                          Edit_TransportadorExit(Self);
                          SetStatus('Pesquisa');
                       end;
                       Operacao := opBrowse;
                     except
                        showmessage('Este cliente não pode ser deletado!');
                     end;
                  end
                  else
                  begin
                     MessageDlg('Cliente com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
                     FrmPrincipal.LimpaCampos(self,1);
                     Edit_PathImageExit(Self);
                     Edit_PracaExit(Self);
                     Edit_SituacaoExit(Self);
                     Edit_ClassificacaoExit(Self);
                     Edit_VendedorExit(Self);
                     Edit_Tipo_AtivExit(Self);
                     Edit_Forma_PagtoExit(Self);
                     Edit_TransportadorExit(Self);
                  end;
                  BtnInclui.SetFocus;
               end;
            1: begin
                  Edit_Cliente_DescontoExit(Self);
                  if StrToIntZero(Edit_Cliente_Desconto.Text) > 0 then
                  begin
                     if not FrmPrincipal.RodaConsulta('Select * from ClientesDescontos where Cliente = ' + Trim( Edit_Cliente_Desconto.Text) + ' and Grupo = '+ Trim(Edit_Grupo.Text) + '',JvQuery) then Exit;
                     if JvQuery.RecordCount > 0 then
                     begin
                        Operacao := opDelete;
                        Carrega_Campos(JvQuery);
                        if MessageDlg('Confirma exclusão do Grupo '+ Edit_Grupo.Text + ' ?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                        begin
                           Carrega_Parametros(Proc_Descontos);
                           FrmPrincipal.RodaSP(Proc_Descontos);
                           BtnCancelarClick(Self);
                           SetStatus('Pesquisa');
                        end;
                        Operacao := opBrowse;
                     end
                     else
                     begin
                        MessageDlg('Grupo "'+ Edit_Grupo.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
                        BtnCancelarClick(Self);
                     end;
                     BtnInclui.SetFocus;
                  end;
               end;
            2: begin
                  Edit_Cliente_VeiculoExit(Self);
                  if StrToIntZero(Edit_Cliente_Veiculo.Text) > 0 then
                  begin
                     if not FrmPrincipal.RodaConsulta('Select * from Veiculos where Cliente = ' + Trim( Edit_Cliente_Veiculo.Text) + ' and Placa = '''+ Trim(Edit_Placa.Text) + '''',JvQuery) then Exit;
                     if JvQuery.RecordCount > 0 then
                     begin
                        Operacao := opDelete;
                        Carrega_Campos(JvQuery);
                        if MessageDlg('Confirma exclusão do veículo de placa '+ Edit_Placa.Text + ' de propriedade de ' + PanelCliente_Veiculo.Caption + ' ?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                        begin
                           Carrega_Parametros(Proc_Veiculos);
                           FrmPrincipal.RodaSP(Proc_Veiculos);
                           BtnCancelarClick(Self);
                           SetStatus('Pesquisa');
                        end;
                        Operacao := opBrowse;
                     end
                     else
                     begin
                        MessageDlg('Veículo de Placa "'+ Edit_Placa.Text +'" não encontrado neste Cliente.',mtConfirmation,[mbOk],0);
                        BtnCancelarClick(Self);
                        SetStatus('Pesquisa');
                     end;
                     BtnInclui.SetFocus;
                  end;
               end;
            3: begin
                  Edit_Cliente_MotExit(Self);
                  if StrToIntZero(Edit_Cliente_Mot.Text) > 0 then
                  begin
                     if not FrmPrincipal.RodaConsulta('Select * from Motoristas where Cliente = ' + Trim( Edit_Cliente_Mot.Text) + ' and CODIGO = '+ Trim(Edit_Cod_Mot.Text),JvQuery) then Exit;
                     if JvQuery.RecordCount > 0 then
                     begin
                        Operacao := opDelete;
                        Carrega_Campos(JvQuery);
                        if MessageDlg('Confirma exclusão do Motorista '+ Edit_Nome_Mot.Text + ' do cliente ' + PanelCliente_Mot.Caption + ' ?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                        begin
                           Carrega_Parametros(Proc_Motoristas);
                           FrmPrincipal.RodaSP(Proc_Motoristas);
                           BtnCancelarClick(Self);
                           SetStatus('Pesquisa');
                        end;
                        Operacao := opBrowse;
                     end
                     else
                     begin
                        MessageDlg('Motorista não encontrado neste Cliente.',mtConfirmation,[mbOk],0);
                        BtnCancelarClick(Self);
                        SetStatus('Pesquisa');
                     end;
                     BtnInclui.SetFocus;
                  end;
               end;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmClientes.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(Self)
   else
      PageCadastro.ActivePageIndex := 0;
end;

procedure TFrmClientes.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   Edit_PPracaExit(Self);
   Edit_PSituacaoExit(Self);
   Edit_PClassificacaoExit(Self);
   datasource.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
   // JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmClientes.Edit_PDescricaoChange(Sender: TObject);
begin

end;

procedure TFrmClientes.Edit_PCodigoChange(Sender: TObject);
begin

end;

procedure TFrmClientes.Edit_PCodigoExit(Sender: TObject);
begin

end;

procedure TFrmClientes.Msk_CEPEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99999-999;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmClientes.Msk_CEPExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '-' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmClientes.Msk_Data_FichaEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99/99/9999;1;_';
      if (Operacao = opInsert) and ((Sender as TMaskEdit) = Msk_Data_Ficha) then
         (Sender as TMaskEdit).Text := DateToStr(Date);
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmClientes.Msk_Data_FichaExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '/  /' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmClientes.Msk_CPFEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '999.999.999-99;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmClientes.Msk_CPFExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '.   .   -' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmClientes.Msk_CGCEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99.999.999/9999-99;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmClientes.Msk_CGCExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '.   .   /    -' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmClientes.PanelSituacaoClick(Sender: TObject);
begin

end;

procedure TFrmClientes.RG_Class_DescontosClick(Sender: TObject);
begin
   if RG_Class_Descontos.ItemIndex = 0 then
   begin
      Edit_Desc_Individual.Enabled := True;
      Edit_Desc_Individual.SetFocus;
   end
   else
      Edit_Desc_Individual.Enabled := False;
end;

procedure TFrmClientes.TabClienteContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
end;

procedure TFrmClientes.TabClienteExit(Sender: TObject);
begin
end;

procedure TFrmClientes.TabClienteHide(Sender: TObject);
begin
end;

procedure TFrmClientes.bt_imagemClick(Sender: TObject);
begin
   if OpenPictureDialog1.Execute then
   begin
      Edit_PathImage.Text := OpenPictureDialog1.FileName;
      Edit_PathImageExit(self);
      Edit_PathImage.SetFocus;
   end;
end;

procedure TFrmClientes.Edit_PracaExit(Sender: TObject);
begin
{   If (Length(Trim(Edit_Praca.Text)) <> 0) and (Trim(Edit_Praca.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from PRACAS where Codigo='+ Edit_Praca.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
           PanelPraca.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Praça não cadastrada.',mtInformation,[mbOK],0);
            PanelPraca.Caption := '';
            Edit_Praca.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Praca.Text := '0';
      PanelPraca.Caption := '';
   end; }
end;

procedure TFrmClientes.Edit_PathImageExit(Sender: TObject);
begin
   if Trim(Edit_PathImage.Text) <> '' then
   begin
      if FileExists(Edit_PathImage.Text) then
         Image1.Picture.LoadFromFile(Edit_PathImage.Text)
      else
      begin
         MessageDlg('Arquivo inválido.'+#13+'"'+ Edit_PathImage.Text +'"',mtWarning,[mbOK],0);
         Edit_PathImage.SetFocus;
      end;
   end
   else
      Image1.Picture := nil;
end;

procedure TFrmClientes.Edit_VendedorExit(Sender: TObject);
begin    {
   If (Length(Trim(Edit_Vendedor.Text)) <> 0) and (Trim(Edit_Vendedor.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from VENDEDORES where Codigo='+ Edit_Vendedor.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelVendedor.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Vendedor não cadastrada.',mtInformation,[mbOK],0);
            PanelVendedor.Caption := '';
            Edit_Vendedor.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Vendedor.Text := '0';
      PanelVendedor.Caption := '';
   end; }
end;

procedure TFrmClientes.Edit_Tipo_AtivExit(Sender: TObject);
begin
{   If (Length(Trim(Edit_Tipo_Ativ.Text)) <> 0) and (Trim(Edit_Tipo_Ativ.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from ATIVIDADES where Codigo='+ Edit_Tipo_Ativ.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelTipoAtiv.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Tipo de Atividade não cadastrada.',mtInformation,[mbOK],0);
            PanelTipoAtiv.Caption := '';
            Edit_Tipo_Ativ.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Tipo_Ativ.Text := '0';
      PanelTipoAtiv.Caption := '';
   end; }
end;

procedure TFrmClientes.F3_PracaClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from PRACAS order by NOME';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Praças';
      if FrmPesquisa.ShowModal = mrOK then
      begin
 //        Edit_Praca.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_PracaExit(Self);
         Edit_Praca.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.Action1Execute(Sender: TObject);
begin
   if Edit_Praca.Focused then
      F3_pracaClick(self)
   else if Edit_PPraca.Focused then
      F3_PPracaClick(self)
   else if Edit_Vendedor.Focused then
      F3_vendedorClick(Self)
   else if Edit_Situacao.Focused then
      F3_SituacaoClick(self)
   else if Edit_PSituacao.Focused then
      F3_PSituacaoClick(self)
   else if Edit_Classificacao.Focused then
      F3_ClassificacaoClick(self)
   else if Edit_PClassificacao.Focused then
      F3_PClassificacaoClick(self)
   else if Edit_Tipo_Ativ.Focused then
      F3_TipoativClick(Self)
   else if Edit_Cliente.Focused then
      F3_ClientesClick(self)
   else if Edit_Cliente_Mov_Geral.Focused then
      F3_Cliente_Mov_GeralClick(self)
   else if Edit_Cliente_Mov_Aberto.Focused then
      F3_Cliente_Mov_AbertoClick(self)
   else if Edit_Cliente_Veiculo.Focused then
      F3_Cliente_VeiculoClick(self)
   else if Edit_Cliente_Mot.Focused then
      F3_Cliente_MotClick(self);
end;

procedure TFrmClientes.F3_vendedorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from VENDEDORES order by NOME';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Vendedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Vendedor.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_VendedorExit(Self);
         Edit_Vendedor.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.F3_tipoativClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from ATIVIDADES order by NOME';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Tipo Atividades';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Tipo_Ativ.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Tipo_AtivExit(Self);
         Edit_Tipo_Ativ.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.Chk_AluguelExit(Sender: TObject);
begin
   if Chk_Aluguel.ItemIndex = 1 then
      Edit_End_Anter.SetFocus;
end;

procedure TFrmClientes.Edit_PPracaExit(Sender: TObject);
begin    {
   If (Length(Trim(Edit_PPraca.Text)) <> 0) and (Trim(Edit_PPraca.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from PRACAS where Codigo='+ Edit_PPraca.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPPraca.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Praça não cadastrada.',mtInformation,[mbOK],0);
            PanelPPraca.Caption := '';
            Edit_PPraca.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_PPraca.Text := '0';
      PanelPPraca.Caption := '';
   end; }
end;

procedure TFrmClientes.Edit_PSituacaoExit(Sender: TObject);
begin   {
   If (Length(Trim(Edit_PSituacao.Text)) <> 0) and (Trim(Edit_PSituacao.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Descricao from SITUACOES where Codigo='+ Edit_PSituacao.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
             PanelPSituacao.Caption := JvQuery.FieldByName('Descricao').asString;
         end
         else
         begin
            MessageDlg('Situação não cadastrada.',mtInformation,[mbOK],0);
            PanelPSituacao.Caption := '';
            Edit_PSituacao.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_PSituacao.Text := '0';
      PanelPSituacao.Caption := '';
   end;}
end;

procedure TFrmClientes.Edit_PClassificacaoExit(Sender: TObject);
begin    {
   If (Length(Trim(Edit_PClassificacao.Text)) <> 0) and (Trim(Edit_PClassificacao.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Descricao from Classificacoes where Codigo='+ Edit_PClassificacao.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPClassificacao.Caption := JvQuery.FieldByName('Descricao').asString;
         end
         else
         begin
            MessageDlg('Classificação de Atividade não cadastrada.',mtInformation,[mbOK],0);
            PanelPClassificacao.Caption := '';
            Edit_PClassificacao.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_PClassificacao.Text := '0';
      PanelPClassificacao.Caption := '';
   end; }
end;

procedure TFrmClientes.F3_PPracaClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from PRACAS order by Nome';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Praças';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_PPraca.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_PPracaExit(Self);
         Edit_PPraca.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.F3_PSituacaoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO, DESCRICAO from SITUACOES order by Descricao';
      FrmPesquisa.Indice_Inicial := 'Descricao';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Situações';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_PSituacao.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_PSituacaoExit(Self);
         Edit_PSituacao.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.F3_PClassificacaoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from Classificacoes order by Descricao';
      FrmPesquisa.Indice_Inicial := 'DESCRICAO';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Classificações';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_PClassificacao.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_PClassificacaoExit(Self);
         Edit_PClassificacao.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.BitBtn1Click(Sender: TObject);
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

procedure TFrmClientes.BitBtn2Click(Sender: TObject);
begin
   ListCriterios.Items.Delete(ListCriterios.ItemIndex);
end;

procedure TFrmClientes.BitBtn5Click(Sender: TObject);
var vOrd : String;
begin
   if RB_Cresc.Checked then
      vOrd := 'Crescente'
   else
      vOrd := 'Decrescente';
   ListOrdem.Items.Add(ComboCampo_Ord.Items[ComboCampo_Ord.ItemIndex] + ' ' + vOrd);
end;

procedure TFrmClientes.BitBtn6Click(Sender: TObject);
begin
   ListOrdem.Items.Delete(ListOrdem.ItemIndex);
end;

procedure TFrmClientes.Nmeroderegistrosencontrados1Click(Sender: TObject);
begin
//   NumeroRegistros(JvQry_Pes.SQL.Text);
end;

procedure TFrmClientes.Edit_Nom_FanEnter(Sender: TObject);
begin
   if (Operacao = opInsert) and (Edit_Nome.Text <> '') then
      Edit_Nom_Fan.Text := Edit_Nome.Text;
   Edit_Nom_Fan.SelectAll;
end;

procedure TFrmClientes.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Clientes',IBQry_Pes);
   //frPrintGrid1.PreviewReport;
end;

procedure TFrmClientes.F3_ClientesClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from CLIENTES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Cliente.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Cliente.Modified := True;
         Edit_ClienteExit(Self);
         Edit_Cliente.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.Edit_ClienteExit(Sender: TObject);
begin   {
   If (Length(Trim(Edit_Cliente.Text)) <> 0) and (Trim(Edit_Cliente.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From CLIENTES where Codigo='+ Edit_Cliente.Text, JvQuery) then Exit;
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
      end;
   end
   else
   begin
      Edit_Cliente.text := '0';
      PanelCliente.Caption := '';
   end;}
end;

procedure TFrmClientes.BtnAtlz_GraficoClick(Sender: TObject);
var I : Integer;
    AnaliseTempo : String;
    vSelect : String;
begin
   if Edit_Cliente.Text = '' then
   begin
      MessageDlg('Cliente deve ser preenchido.',mtWarning,[mbOK],0);
      Edit_Cliente.SetFocus;
      Exit;
   end;

   if Combo_Avaliacao.ItemIndex = -1 then
   begin
      MessageDlg('Campo Avaliar deve ser preenchido.',mtWarning,[mbOK],0);
      Combo_Avaliacao.SetFocus;
      Exit;
   end;
{{
   Screen.Cursor := crHourGlass;
   Try
      RibbonGraph1.Clear;
      RibbonGraph1.Repaint;

      vSelect :=           ' SELECT VW_VENDAS.DT_EMISS, ';
      vSelect := vSelect + ' CAST(UDF_NVL(SUM(TOT_NOTA)) AS NUMERIC(18,2)) TOTAL_VENDAS, ';
      vSelect := vSelect + ' CAST(UDF_NVL(COUNT(*)) AS NUMERIC(18,2)) NRO_VENDAS, ';
      vSelect := vSelect + ' CAST(UDF_NVL(SUM(TOT_NOTA) / COUNT(*)) AS NUMERIC(18,2)) MEDIA_VENDAS ';
      vSelect := vSelect + ' FROM VW_VENDAS ';
      vSelect := vSelect + ' WHERE ';
      vSelect := vSelect + ' VW_VENDAS.COD_CLIENTE = ' + Trim(Edit_Cliente.Text) + ' AND ';

      AnaliseTempo := '';
      case Combo_Tempo.ItemIndex of
         0 : AnaliseTempo := (FormatDateTime('dd.mm',Date) + '.' + IntToStr(StrToInt(FormatDateTime('yyyy',Date))-1));
         1 : AnaliseTempo := FormatDateTime('dd.mm.yyyy',Date - 180) ;
         2 : AnaliseTempo := FormatDateTime('dd.mm.yyyy',Date - 90) ;
      end;

      vSelect := vSelect + ' VW_VENDAS.DT_EMISS >= ''' + AnaliseTempo + ''' AND VW_VENDAS.DT_EMISS <= ''' + FormatDateTime('dd.mm.yyyy',Date) + '''';
      vSelect := vSelect + ' GROUP BY VW_VENDAS.DT_EMISS ';
      vSelect := vSelect + ' ORDER BY VW_VENDAS.DT_EMISS ';

      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta(vselect,JvQuery) then Exit;

         if JvQuery.RecordCount > 0 then
         begin
            RibbonGraph1.DateFormat := 'dd/mm/yyyy';
            case Combo_Avaliacao.ItemIndex of
               0 : RibbonGraph1.CurrencyFormat := 'R$ %.2n';//TOTAL_VENDAS
               1 : RibbonGraph1.CurrencyFormat := '%.0n';//NRO_VENDAS
               2 : RibbonGraph1.CurrencyFormat := 'R$ %.2n';//MEDIA_VENDAS
            end;

            JvQuery.First;
            RibbonGraph1.StartDate := JvQuery.FieldByName('DT_EMISS').AsDateTime;
            while not JvQuery.EOF do
            begin
               MyPoint.Date := JvQuery.FieldByName('DT_EMISS').AsDateTime;
               case Combo_Avaliacao.ItemIndex of
                  0 : MyPoint.Y := JvQuery.FieldByName('TOTAL_VENDAS').AsFloat;
                  1 : MyPoint.Y := JvQuery.FieldByName('NRO_VENDAS').AsFloat;
                  2 : MyPoint.Y := JvQuery.FieldByName('MEDIA_VENDAS').AsFloat;
               end;
               RibbonGraph1.Add(MyPoint);
               JvQuery.Next;
            end;
            RibbonGraph1.EndDate := JvQuery.FieldByName('DT_EMISS').AsDateTime;
            RibbonGraph1.Paint;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   finally
      Screen.Cursor := crDefault;
   end; }
end;

procedure TFrmClientes.BitBtn3Click(Sender: TObject);
begin
   //Imprime_Pesquisa('Historico Financeiro(Clientes)',IBQry_Grafico);
end;

procedure TFrmClientes.PageCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmClientes.PageCadastroChange(Sender: TObject);
begin
  // BtnInclui.Enabled := True;
  // BtnExclui.Enabled := True;
  // BtnGrava.Enabled := True;
  // BtnCancelar.Enabled := True;

   Case PageCadastro.ActivePageIndex of
      0: begin
            ScrollBox1.UpdateScrollbars;
            if (StrToIntZero(Campo1.Caption) > 0) then
               SetStatus('Edição')
            else
               SetStatus('Pesquisa');
         end;
      1: begin
            if StrToIntZero(Campo1.Text) > 0 then
            begin
               BtnCancelarClick(Self);
               Edit_Cliente_Desconto.Text := Campo1.Text;
               Edit_Cliente_DescontoExit(Self);
               SetStatus('Pesquisa');
            end;
         end;
      2: begin
            if StrToIntZero(Campo1.Text) > 0 then
            begin
               BtnCancelarClick(Self);
               Edit_Cliente_Veiculo.Text := Campo1.Text;
               Edit_Cliente_VeiculoExit(Self);
               SetStatus('Pesquisa');
            end;
         end;
      3: begin
            if StrToIntZero(Campo1.text) > 0 then
            begin
               BtnCancelarClick(Self);
               Edit_Cliente_Mot.text := Campo1.Text;
               Edit_Cliente_MotExit(Self);
               SetStatus('Pesquisa');
            end;
         end;
      4: begin
            SetStatus('Pesquisa');
            BtnInclui.Enabled := False;
            BtnExclui.Enabled := False;
            BtnGrava.Enabled := False;
            BtnCancelar.Enabled := False;
            PageMovimento.ActivePageIndex := 0;
            PageMovimentoChange(self);
         end;
   end;
end;

procedure TFrmClientes.BtnImpr_Mov_GeralClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Movimento Geral(Clientes)',IBQry_Mov_Geral);
end;

procedure TFrmClientes.DBChart1DblClick(Sender: TObject);
begin
   If MessageDlg('Tem certaza que deseja imprimir o gráfico ?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      //DBChart1.Print;
end;

procedure TFrmClientes.F3_Cliente_Mov_GeralClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from CLIENTES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Cliente_Mov_Geral.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Cliente_Mov_Geral.Modified := True;
         Edit_Cliente_Mov_GeralExit(Self);
         Edit_Cliente_Mov_Geral.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.Edit_Cliente_Mov_GeralExit(Sender: TObject);
begin    {
   If (Length(Trim(Edit_Cliente_Mov_Geral.Text)) <> 0) and (Trim(Edit_Cliente_Mov_Geral.Text) <> '0') then
   begin
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From CLIENTES where Codigo='+ Edit_Cliente_Mov_Geral.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Panel_Cliente_Mov_Geral.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            Panel_Cliente_Mov_Geral.Caption := '';
            Edit_Cliente_Mov_Geral.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Cliente_Mov_Geral.Text := '0';
      Panel_Cliente_Mov_Geral.Caption := '';
   end; }
end;

procedure TFrmClientes.BtnAtlz_Mov_GeralClick(Sender: TObject);
var vSelect : String;
begin
   if Edit_Cliente_Mov_Geral.Text = '' then
   begin
      MessageDlg('Cliente deve ser preenchido.',mtWarning,[mbOK],0);
      Edit_Cliente_Mov_Geral.SetFocus;
      Exit;
   end;
           {
   Screen.Cursor := crHourGlass;
   Try
      vSelect :=           ' SELECT NRO_NOTA, SER_NOTA, DT_EMISS, CFOP, ';
      vSelect := vSelect + ' TOT_PROD TOTAL_PRODUTOS, TOT_SERV TOTAL_SERVICOS, ';
      vSelect := vSelect + ' TOT_NOTA TOTAL_NOTA, UDF_NVL(TOT_PROD) TOT_PROD, ';
      vSelect := vSelect + ' UDF_NVL(TOT_SERV) TOT_SERV, UDF_NVL(TOT_NOTA) TOT_NOTA ';
      vSelect := vSelect + ' FROM VW_VENDAS ';
      vSelect := vSelect + ' WHERE COD_CLIENTE = ' + Trim(Edit_Cliente_Mov_Geral.Text) + ' ';
      Case ComboMov_Geral.ItemIndex of
         0 : vSelect := vSelect + ' ORDER BY CONTROLE ';
         1 : vSelect := vSelect + ' ORDER BY NRO_NOTA, SER_NOTA ';
         2 : vSelect := vSelect + ' ORDER BY CFOP ';
         3 : vSelect := vSelect + ' ORDER BY DT_EMISS DESC';
         4 : vSelect := vSelect + ' ORDER BY TOT_NOTA DESC ';
      end;

      if not FrmPrincipal.RodaConsulta(vSelect,JvQry_MovGeral) then Exit;

      if JvQry_MovGeral.RecordCount > 0 then
      begin
         Src_MovGeral.DataSet := JvQry_MovGeral;
         Grid_Mov_Geral.DataSource := Src_MovGeral;
      end;

      //Busca o total
      vSelect :=           ' SELECT SUM(TOT_NOTA) TOTAL ';
      vSelect := vSelect + ' FROM VW_VENDAS ';
      vSelect := vSelect + ' WHERE COD_CLIENTE = ' + Trim(Edit_Cliente_Mov_Geral.Text) + ' ';

      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         FrmPrincipal.RodaConsulta(vSelect,JvQuery);
         if JvQuery.FieldByName('TOTAL').asFloat > 0 then
            Label_Total.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOTAL').asFloat)
         else
            Label_Total.Caption := '0.00';
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   finally
      Screen.Cursor := crDefault;
   end;     }
end;

procedure TFrmClientes.BtnLimpa_Mov_GeralClick(Sender: TObject);
begin
   //JvQry_MovGeral.Close;
   Src_MovGeral.DataSet := Nil;
   Grid_Mov_Geral.DataSource := Nil;
   Label_Total.Caption := '0,00';
end;

procedure TFrmClientes.BitBtn4Click(Sender: TObject);
var vSelect : String;
begin
   if Edit_Cliente_Mov_Aberto.Text = '' then
   begin
      MessageDlg('Cliente deve ser preenchido.',mtWarning,[mbOK],0);
      Edit_Cliente_Mov_Aberto.SetFocus;
      Exit;
   end;
         {
   Screen.Cursor := crHourGlass;
   Try
      vSelect :=           ' SELECT NRO_NOTA, SER_NOTA, DOCUMENTO, DATA, VENCTO, VL_SALDO, ';
      vSelect := vSelect + ' (SELECT OVLR_JUROS FROM CALCULA_JUROS(CTASRECEBER.CONTROLE,CTASRECEBER.DOCUMENTO,CURRENT_DATE)) VL_JUROS ';
      vSelect := vSelect + ' FROM CTASRECEBER WHERE VL_SALDO > 0 ';
      vSelect := vSelect + ' AND COD_CLIENTE = ' + Trim(Edit_Cliente_Mov_Aberto.Text) + ' ';
      Case ComboMov_Aberto.ItemIndex of
         0 : vSelect := vSelect + ' ORDER BY NRO_NOTA, SER_NOTA ';
         1 : vSelect := vSelect + ' ORDER BY DOCUMENTO ';
         2 : vSelect := vSelect + ' ORDER BY DATA ';
         3 : vSelect := vSelect + ' ORDER BY VENCTO ';
      end;

      if not FrmPrincipal.RodaConsulta(vSelect,JvQry_MovAberto) then Exit;

      if JvQry_MovAberto.RecordCount > 0 then
      begin
         Src_MovAberto.DataSet := JvQry_MovAberto;
         Grid_Mov_Aberto.DataSource := Src_MovAberto;
      end;

      //Busca os Totais
      vSelect := ' SELECT * FROM RESUMO_FINANCEIRO_CLIENTE(' + Trim(Edit_Cliente_Mov_Aberto.Text) + ') ';

      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         FrmPrincipal.RodaConsulta(vSelect,JvQuery);
         Panel_Tot_Aberto.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_ABERTO').asFloat);
         Panel_Tot_Atrazo.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_ATRAZO').asFloat);
         Panel_Tot_Juros.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_JUROS').asFloat);
         Panel_Atrazo_Juros.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_DEVEDOR').asFloat);
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   finally
      Screen.Cursor := crDefault;
   end; }

   {Screen.Cursor := crHourGlass;
   Try
      vSelect :=           ' SELECT NRO_NOTA, SER_NOTA, DOCUMENTO, DATA, VENCTO, VL_SALDO, ';
      vSelect := vSelect + ' (SELECT OVLR_JUROS FROM CALCULA_JUROS(CTASRECEBER.CONTROLE,CTASRECEBER.DOCUMENTO,CURRENT_DATE)) VL_JUROS ';
      vSelect := vSelect + ' FROM CTASRECEBER WHERE VL_SALDO > 0 ';
      vSelect := vSelect + ' AND COD_CLIENTE = ' + Trim(Edit_Cliente_Mov_Aberto.Text) + ' ';
      Case ComboMov_Aberto.ItemIndex of
         0 : vSelect := vSelect + ' ORDER BY NRO_NOTA, SER_NOTA ';
         1 : vSelect := vSelect + ' ORDER BY DOCUMENTO ';
         2 : vSelect := vSelect + ' ORDER BY DATA ';
         3 : vSelect := vSelect + ' ORDER BY VENCTO ';
      end;

      IBQry_Mov_Aberto.Close;
      IBQry_Mov_Aberto.SQL.Clear;
      IBQry_Mov_Aberto.SQL.Add(vSelect);
      If not IBQry_Mov_Aberto.Prepared then IBQry_Mov_Aberto.Prepare;
      IBQry_Mov_Aberto.Open;

      vSelect := ' SELECT * FROM RESUMO_FINANCEIRO_CLIENTE(' + Trim(Edit_Cliente_Mov_Aberto.Text) + ') ';

      IBQuery1.Close;
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add(vSelect);
      If not IBQuery1.Prepared then IBQuery1.Prepare;
      IBQuery1.Open;
      Panel_Tot_Aberto.Caption := FormatFloat('#,###,##0.00',IBQuery1.FieldByName('TOT_ABERTO').asFloat);
      Panel_Tot_Atrazo.Caption := FormatFloat('#,###,##0.00',IBQuery1.FieldByName('TOT_ATRAZO').asFloat);
      Panel_Tot_Juros.Caption := FormatFloat('#,###,##0.00',IBQuery1.FieldByName('TOT_JUROS').asFloat);
      Panel_Atrazo_Juros.Caption := FormatFloat('#,###,##0.00',IBQuery1.FieldByName('TOT_DEVEDOR').asFloat);

      IBQuery1.Close;
   finally
      Screen.Cursor := crDefault;
   end;}
end;

procedure TFrmClientes.BitBtn8Click(Sender: TObject);
begin
   //Imprime_Pesquisa('Movimento Aberto(Clientes)',IBQry_Mov_Aberto);
end;

procedure TFrmClientes.F3_Cliente_Mov_AbertoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from CLIENTES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Cliente_Mov_Aberto.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Cliente_Mov_Aberto.Modified := True;
         Edit_Cliente_Mov_AbertoExit(Self);
         Edit_Cliente_Mov_Aberto.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.Edit_Cliente_Mov_AbertoExit(Sender: TObject);
begin
   If (Length(Trim(Edit_Cliente_Mov_Aberto.Text)) <> 0) and (Trim(Edit_Cliente_Mov_Aberto.Text) <> '0') then
   begin
{      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From CLIENTES where Codigo='+ Edit_Cliente_Mov_Aberto.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Panel_Cliente_Mov_Aberto.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            Panel_Cliente_Mov_Aberto.Caption := '';
            Edit_Cliente_Mov_Aberto.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Cliente_Mov_Aberto.text := '0';
      Panel_Cliente_Mov_Aberto.Caption := '';
   end;
end;

procedure TFrmClientes.BitBtn7Click(Sender: TObject);
begin
   // JvQry_MovAberto.Close;
   Src_MovAberto.DataSet := Nil;
   Grid_Mov_Aberto.DataSource := Nil;
   Panel_Tot_Aberto .Caption  := '0,00';
   Panel_Tot_Juros.Caption    := '0,00';
   Panel_Tot_Atrazo .Caption  := '0,00';
   Panel_Atrazo_Juros.Caption := '0,00';
end;

procedure TFrmClientes.PageMovimentoChange(Sender: TObject);
begin
   if StrToIntZero(Campo1.text) > 0 then
   begin
      Case PageMovimento.ActivePageIndex of
         0 : begin
                Edit_Cliente.Text := Campo1.Text;
                Edit_ClienteExit(Self);
             end;
         1 : begin
                Edit_Cliente_Mov_Geral.Text := Campo1.Text;
                Edit_Cliente_Mov_GeralExit(Self);
             end;
         2 : begin
                Edit_Cliente_Mov_Aberto.Text := Campo1.Text;
                Edit_Cliente_Mov_AbertoExit(Self);
             end;
      end;
   end;
end;

procedure TFrmClientes.F3_Cliente_VeiculoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from CLIENTES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Cliente_Veiculo.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Cliente_Veiculo.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.Edit_Cliente_VeiculoExit(Sender: TObject);
begin
   If (Length(Trim(Edit_Cliente_Veiculo.Text)) <> 0) and (Trim(Edit_Cliente_Veiculo.Text) <> '0') then
   begin    {
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From CLIENTES where Codigo='+ Edit_Cliente_Veiculo.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCliente_Veiculo.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            PanelCliente_Veiculo.Caption := '';
            Edit_Cliente_Veiculo.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Cliente_Veiculo.text := '0';
      PanelCliente_Veiculo.Caption := '';
   end;
   Carrega_Veiculos(StrToIntZero(Edit_Cliente_Veiculo.Text));
end;

Procedure TFrmClientes.Carrega_Veiculos(oCliente: Integer);
begin      {
   with JvQry_Veiculos do
   begin
      if oCliente = 0 then
      begin
         Src_Veiculos.DataSet := Nil;
         DBGrid_Veiculos.DataSource := Nil;
         Close;
      end
      else
      begin
         Src_Veiculos.DataSet := Nil;
         DBGrid_Veiculos.DataSource := Nil;
         Close;
         Params.ByNameAsInteger['oCliente'] := oCliente;
         Open;
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Veiculos.DataSet := JvQry_Veiculos;
            DBGrid_Veiculos.DataSource := Src_Veiculos;
         end;
      end;
   end;   }
end;

Procedure TFrmClientes.Carrega_Motoristas(oCliente: Integer);
begin    {
   with JvQry_Motoristas do
   begin
      if oCliente = 0 then
      begin
         Src_Motoristas.DataSet := Nil;
         DBGrid_Motoristas.DataSource := Nil;
         Close;
      end
      else
      begin
         Src_Motoristas.DataSet := Nil;
         DBGrid_Motoristas.DataSource := Nil;
         Close;
         Params.ByNameAsInteger['oCliente'] := oCliente;
         Open;
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Motoristas.DataSet := JvQry_Motoristas;
            DBGrid_Motoristas.DataSource := Src_Motoristas;
         end;
      end;
   end; }
end;

Procedure TFrmClientes.Carrega_Descontos(oCliente: Integer);
begin      {
   with JvQry_Descontos do
   begin
      if oCliente = 0 then
      begin
         Src_Descontos.DataSet := Nil;
         DBGrid_Descontos.DataSource := Nil;
         Close;
      end
      else
      begin
         Src_Descontos.DataSet := Nil;
         DBGrid_Descontos.DataSource := Nil;
         Close;
         Params.ByNameAsInteger['oCliente'] := oCliente;
         Open;
         FormatNumericFields(JvQry_Descontos);
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Descontos.DataSet := JvQry_Descontos;
            DBGrid_Descontos.DataSource := Src_Descontos;
         end;
      end;
   end;   }
end;

procedure TFrmClientes.Edit_PlacaExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '-' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmClientes.Edit_PlacaEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := 'LLL-9999;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmClientes.Edit_Cliente_MotExit(Sender: TObject);
begin
   If (Length(Trim(Edit_Cliente_Mot.Text)) <> 0) and (Trim(Edit_Cliente_Mot.Text) <> '0') then
   begin   {
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From CLIENTES where Codigo='+ Edit_Cliente_Mot.Text, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCliente_Mot.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            PanelCliente_Mot.Caption := '';
            Edit_Cliente_Mot.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;}
   end
   else
   begin
      Edit_Cliente_Mot.Text := '0';
      PanelCliente_Mot.Caption := '';
   end;
   Carrega_Motoristas(StrToIntZero(Edit_Cliente_Mot.Text));
end;

procedure TFrmClientes.F3_Cliente_MotClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from CLIENTES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Cliente_Mot.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_Cliente_Mot.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.DBGrid4DblClick(Sender: TObject);
begin

end;

procedure TFrmClientes.F3_SituacaoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from SITUACOES order by DESCRICAO';
      FrmPesquisa.Indice_Inicial := 'DESCRICAO';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Situações de Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
  //       Edit_Situacao.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_SituacaoExit(Self);
         Edit_Situacao.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.Edit_SituacaoExit(Sender: TObject);
begin
   If (Length(Trim(Edit_Situacao.Text)) <> 0) and (Trim(Edit_Situacao.Text) <> '0') then
   begin    {
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Descricao from Situacoes where Codigo='+ Edit_Situacao.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelSituacao.Caption := JvQuery.FieldByName('DESCRICAO').asString;
         end
         else
         begin
            MessageDlg('Situação não cadastrada.',mtInformation,[mbOK],0);
            PanelSituacao.Caption := '';
            Edit_Situacao.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Situacao.Text := '0';
      PanelSituacao.Caption := '';
   end;
end;

procedure TFrmClientes.Edit_ClassificacaoExit(Sender: TObject);
begin
   If (Length(Trim(Edit_Classificacao.Text)) <> 0) and (Trim(Edit_Classificacao.Text) <> '0') then
   begin    {
      JvQuery := TUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Descricao from Classificacoes where Codigo='+ Edit_Classificacao.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelClassificacao.Caption := JvQuery.FieldByName('DESCRICAO').asString;
         end
         else
         begin
            MessageDlg('Situação não cadastrada.',mtInformation,[mbOK],0);
            PanelClassificacao.Caption := '';
            Edit_Classificacao.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Classificacao.Text := '0';
      PanelClassificacao.Caption := '';
   end;
end;

procedure TFrmClientes.F3_ClassificacaoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from CLASSIFICACOES order by DESCRICAO';
      FrmPesquisa.Indice_Inicial := 'DESCRICAO';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Classificações de Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Classificacao.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_ClassificacaoExit(Self);
         Edit_Classificacao.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmClientes.dbGrid3DblClick(Sender: TObject);
begin

end;




initialization
   {$i uclientes.lrs}

end.
