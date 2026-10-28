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
     // JvQry_Descontos: TJvUIBDataSet;
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
//      Proc_Descontos: TJvUIBQuery;
     RB_Cresc: TRadioButton;
     RB_Decresc: TRadioButton;
     RG_Class_Descontos: TRadioGroup;
//     RibbonGraph1: TRibbonGraph;
     ScrollBox1: TScrollBox;
     Src_Descontos: TDatasource;
     Src_MovAberto: TDatasource;
     Src_MovGeral: TDatasource;
     Proc: TZQuery;
{     JvQry_Pes: TJvUIBDataSet;
     JvQry_Veiculos: TJvUIBDataSet;
     JvQry_Motoristas: TJvUIBDataSet;
     JvQry_MovGeral: TJvUIBDataSet;
     JvQry_MovAberto: TJvUIBDataSet;
    Proc: TJvUIBQuery;
    Proc_Veiculos: TJvUIBQuery;
    Proc_Motoristas: TJvUIBQuery;  }
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
    zClientesBAIRRO: TZUnicodeStringField;
    zClientesCEP: TZUnicodeStringField;
    zClientesCEP_EMPR: TZUnicodeStringField;
    zClientesCGC: TZUnicodeStringField;
    zClientesCI: TZUnicodeStringField;
    zClientesCIDADE: TZUnicodeStringField;
    zClientesCIDA_EMPR: TZUnicodeStringField;
    zClientesCLASSIFICACAO: TZIntegerField;
    zClientesCLASS_DESCONTOS: TZSmallIntField;
    zClientesCOBR_BAIRR: TZUnicodeStringField;
    zClientesCOBR_CEP: TZUnicodeStringField;
    zClientesCOBR_CIDAD: TZUnicodeStringField;
    zClientesCOBR_ENDER: TZUnicodeStringField;
    zClientesCOBR_UF: TZUnicodeStringField;
    zClientesCODIGO: TZIntegerField;
    zClientesCONJUGE: TZUnicodeStringField;
    zClientesCONSU_FINAL: TZSmallIntField;
    zClientesCONS_SPC: TZDateField;
    zClientesCONTATO: TZUnicodeStringField;
    zClientesCPF: TZUnicodeStringField;
    zClientesCX_POSTAL: TZUnicodeStringField;
    zClientesDATA_FICHA: TZDateField;
    zClientesDATA_NASC: TZDateField;
    zClientesDESC_INDIVIDUAL: TZBCDField;
    zClientesEMAIL: TZUnicodeStringField;
    zClientesEMPRESA: TZUnicodeStringField;
    zClientesEMPR_ANT: TZUnicodeStringField;
    zClientesEMPR_CONJ: TZUnicodeStringField;
    zClientesENDERECO: TZUnicodeStringField;
    zClientesENDE_EMPR: TZUnicodeStringField;
    zClientesEND_ANTER: TZUnicodeStringField;
    zClientesEST_CIVIL: TZSmallIntField;
    zClientesFAX: TZUnicodeStringField;
    zClientesFILIACAO: TZUnicodeStringField;
    zClientesFONE: TZUnicodeStringField;
    zClientesFONE_EMPR: TZUnicodeStringField;
    zClientesFORMASPAGTO: TZIntegerField;
    zClientesFUNCAO: TZUnicodeStringField;
    zClientesFUNC_CONJ: TZUnicodeStringField;
    zClientesICM_IPI: TZSmallIntField;
    zClientesIMOBILIAR: TZUnicodeStringField;
    zClientesINSCRICAO: TZUnicodeStringField;
    zClientesNASC_CONJ: TZDateField;
    zClientesNATURA: TZUnicodeStringField;
    zClientesNOME: TZUnicodeStringField;
    zClientesNOM_FAN: TZUnicodeStringField;
    zClientesNUM_DEPEND: TZIntegerField;
    zClientesOBS_GERAL: TZUnicodeCLobField;
    zClientesOBS_SPC: TZUnicodeStringField;
    zClientesPATHIMAGE: TZUnicodeStringField;
    zClientesPRACA: TZIntegerField;
    zClientesREF_BANC: TZUnicodeStringField;
    zClientesREF_COML: TZUnicodeStringField;
    zClientesREMUNERAC: TZBCDField;
    zClientesREM_EXTRA: TZBCDField;
    zClientesSAL_CONJ: TZBCDField;
    zClientesSEXO: TZSmallIntField;
    zClientesSITUACAO: TZIntegerField;
    zClientesTEMP_RESID: TZUnicodeStringField;
    zClientesTEMP_SERV: TZUnicodeStringField;
    zClientesTIPO_ATIV: TZIntegerField;
    zClientesTIT_ELEITOR: TZUnicodeStringField;
    zClientesTRANSPORTADORA: TZIntegerField;
    zClientesUF: TZUnicodeStringField;
    zClientesUF_EMPR: TZUnicodeStringField;
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
    procedure Carrega_Parametros(Proc: TZQuery); // (Proc : TJvUIBQuery);
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
  else if Status = 'InserÃ§Ã£o' then
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
//  Carrega_Campos(JvQry_Pes);
  BtnExcluiClick(self);
  BtnAtualizaClick(self);
end;

procedure TFrmClientes.Button1Click(Sender: TObject);
begin
end;

procedure TFrmClientes.DBGrid_DescontosDblClick(Sender: TObject);
begin       {
   if (JvQry_Descontos.Active) and (JvQry_Descontos.RecordCount > 0) then
   begin
      with JvQry_Descontos do
      begin
         if Operacao = opBrowse then
         begin
            Carrega_Campos(JvQry_Descontos);
            SetStatus('EdiÃ§Ã£o');
         end;
      end;
   end;    }
end;

procedure TFrmClientes.DBGrid_MotoristasDblClick(Sender: TObject);
begin         {
   if (JvQry_Motoristas.Active) and (JvQry_Motoristas.RecordCount > 0) then
   begin
      with JvQry_Motoristas do
      begin
         if Operacao = opBrowse then
         begin
            Carrega_Campos(JvQry_Motoristas);
            Edit_Nome.SetFocus;
            SetStatus('EdiÃ§Ã£o');
         end;
      end;
   end;      }
end;

procedure TFrmClientes.DBGrid_VeiculosDblClick(Sender: TObject);
begin           {
   if (JvQry_Veiculos.Active) and (JvQry_Veiculos.RecordCount > 0) then
   begin
      with JvQry_Veiculos do
      begin
         if Operacao = opBrowse then
         begin
            Carrega_Campos(JvQry_Veiculos);
            Edit_Placa.SetFocus;
            SetStatus('EdiÃ§Ã£o');
         end;
      end;
   end;        }
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
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cliente_Desconto.Text)) <> 0) and (Trim(Edit_Cliente_Desconto.Text) <> '0') then
   begin          {
      JvQuery := TJvUIBDataset.Create(self);
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
            MessageDlg('Cliente nÃ£o cadastrado.',mtInformation,[mbOK],0);
            PanelCliente_Desconto.Caption := '';
            Edit_Cliente_Desconto.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;       }
   end
   else
   begin
      Edit_Cliente_Desconto.Text := '0';
      PanelCliente_Desconto.Caption := '';
   end;
   Carrega_Descontos(StrToIntZero(Edit_Cliente_Desconto.Text));
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
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Forma_Pagto.Text)) <> 0) and (Trim(Edit_Forma_Pagto.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
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
            MessageDlg('Forma de Pagamento nÃ£o cadastrada.',mtInformation,[mbOK],0);
            PanelFormasPagto.Caption := '';
            Edit_Forma_Pagto.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Forma_Pagto.Text := '0';
      PanelFormasPagto.Caption := '';
   end;

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
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Grupo.Text)) <> 0) and (Trim(Edit_Grupo.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
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
            MessageDlg('Grupo nÃ£o cadastrado.',mtInformation,[mbOK],0);
            PanelGrupo.Caption := '';
            Edit_Grupo.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Grupo.Text := '0';
      PanelGrupo.Caption := '';
   end;
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
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Transportador.Text)) <> 0) and (Trim(Edit_Transportador.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
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
            MessageDlg('Transportador nÃ£o cadastrado.',mtInformation,[mbOK],0);
            PanelTransportador.Caption := '';
            Edit_Transportador.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Transportador.Text := '0';
      PanelTransportador.Caption := '';
   end;
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
{   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from FormasPagto order by NOME';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Formas de Pagamento';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Forma_Pagto.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Forma_PagtoExit(Self);
         Edit_Forma_Pagto.SetFocus;
      end;   }
end;

initialization
   {$i uclientes.lrs}

end.
