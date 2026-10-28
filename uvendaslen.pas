unit UVendasLen;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db,
  CheckLst, ActnList, Printers, Menus, LResources, MaskEdit, LCLType;

type

  { TFrmVendasLen }

  TFrmVendasLen = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnAtualiza: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnEditar: TBitBtn;
    BtnExclui: TBitBtn;
    BtnExcluiPesq: TBitBtn;
    BtnGrava: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnInclui: TBitBtn;
    BtnInclui1: TBitBtn;
    BtnLimpa1: TBitBtn;
    BtnPag_Prazo: TBitBtn;
    BtnPag_Vista: TBitBtn;
    BtnSair: TBitBtn;
    BtnSairPes: TBitBtn;
    Btn_Imprimir_Cobranca: TBitBtn;
    ComboCampo: TComboBox;
    ComboCampo_Ord: TComboBox;
    ComboOper: TComboBox;
    ComboP_Cli_Forn: TComboBox;
    Combo_Cli_Forn: TComboBox;
    Combo_Cta_Frete: TComboBox;
    DBGrid_Parcelas: TdbGrid;
    DBGrid_Prod: TdbGrid;
    DBGrid_Serv: TdbGrid;
    EditConteudo: TEdit;
    EditP_CliForn: TEdit;
    EditP_Controle: TEdit;
    EditP_Nro_Nota: TEdit;
    EditP_Ser_Nota: TEdit;
    EditP_Transportador: TEdit;
    EditP_Vendedor: TEdit;
    Edit_Acre_Geral: TEdit;
    Edit_CliForn: TEdit;
    Edit_CodBarra: TEdit;
    Edit_Cod_Observ: TEdit;
    Edit_Config_Impr: TEdit;
    Edit_Controle: TEdit;
    Edit_Controle_Pag: TEdit;
    Edit_Controle_Prod: TEdit;
    Edit_Controle_Serv: TEdit;
    Edit_Descr_Produto: TEdit;
    Edit_Descr_Servico: TEdit;
    Edit_Desc_Geral: TEdit;
    Edit_Icm_Frete: TEdit;
    Edit_Nro_Nota: TEdit;
    Edit_Nro_Nota_Pag: TEdit;
    Edit_Nro_Nota_Prod: TEdit;
    Edit_Nro_Nota_Serv: TEdit;
    Edit_NTEspecie: TEdit;
    Edit_NTMarca: TEdit;
    Edit_NTQuantid: TEdit;
    Edit_Obs: TEdit;
    Edit_Perct_Acre: TEdit;
    Edit_Perct_Desct: TEdit;
    Edit_Perc_Desc_prod: TEdit;
    Edit_Perc_Desc_Serv: TEdit;
    Edit_Peso_Liq: TEdit;
    Edit_Produto: TEdit;
    Edit_Quant_Prod: TEdit;
    Edit_Quant_Serv: TEdit;
    Edit_Seq_Prod: TEdit;
    Edit_Seq_Serv: TEdit;
    Edit_Servico: TEdit;
    Edit_Ser_Nota: TEdit;
    Edit_Ser_Nota_Pag: TEdit;
    Edit_Ser_Nota_Prod: TEdit;
    Edit_Ser_Nota_Serv: TEdit;
    Edit_Transportador: TEdit;
    Edit_Vendedor: TEdit;
    Edit_Vlr_Frete: TEdit;
    Edit_Vl_Unit_Prod: TEdit;
    Edit_Vl_Unit_Serv: TEdit;
    F3_Cfop: TSpeedButton;
    F3_CliForn: TSpeedButton;
    F3_Conf_Doc: TSpeedButton;
    F3_Nota_Pag: TSpeedButton;
    F3_Nota_Prod: TSpeedButton;
    F3_Nota_Serv: TSpeedButton;
    F3_Observacao: TSpeedButton;
    F3_PCfop: TSpeedButton;
    F3_PCliForn: TSpeedButton;
    F3_Produto: TSpeedButton;
    F3_PTransportador: TSpeedButton;
    F3_PVendedor: TSpeedButton;
    F3_Servico: TSpeedButton;
    F3_Transportador: TSpeedButton;
    F3_Vendedor: TSpeedButton;
    Grid_Pesquisa: TdbGrid;
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
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabelCli_Forn_Pag: TLabel;
    LabelCli_Forn_Prod: TLabel;
    LabelCli_Forn_Serv: TLabel;
    Lbl_Status: TLabel;
    ListCriterios: TListBox;
    ListOrdem: TListBox;
    MemoImpressao: TMemo;
    Memo_OBS_Prod: TMemo;
    Memo_OBS_Serv: TMemo;
    MskP_CFOP: TMaskEdit;
    MskP_Dt_Emiss: TMaskEdit;
    MskP_Dt_Saida: TMaskEdit;
    Msk_CFOP: TMaskEdit;
    Msk_Dt_Emiss: TMaskEdit;
    Msk_Dt_Saida: TMaskEdit;
    Msk_Hr_Saida: TMaskEdit;
    Msk_Placa: TMaskEdit;
    NaoLimpar: TCheckBox;
    PageCadastro: TPageControl;
    PageControl1: TPageControl;
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
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PanelCancelado: TPanel;
    PanelCancelado_Pag: TPanel;
    PanelCancelado_Prod: TPanel;
    PanelCancelado_Serv: TPanel;
    PanelCfop: TPanel;
    PanelCliForn: TPanel;
    PanelCod_Cli_Pag: TPanel;
    PanelCod_Cli_Prod: TPanel;
    PanelCod_Cli_Serv: TPanel;
    PanelEmiss_Pag: TPanel;
    PanelEmiss_Prod: TPanel;
    PanelEmiss_Serv: TPanel;
    PanelNome_Cli_Pag: TPanel;
    PanelNome_Cli_Prod: TPanel;
    PanelNome_Cli_Serv: TPanel;
    PanelObserv: TPanel;
    PanelPCfop: TPanel;
    PanelPCliForn: TPanel;
    PanelPTransportador: TPanel;
    PanelPVendedor: TPanel;
    PanelTotal_Prod: TPanel;
    PanelTotal_Serv: TPanel;
    PanelTot_Nota: TPanel;
    PanelTot_Prod: TPanel;
    PanelTot_Serv: TPanel;
    PanelTransportador: TPanel;
    PanelValor: TPanel;
    PanelVendedor: TPanel;
    Panel_Config_Desc: TPanel;
    Panel_VLDesc_Prod: TPanel;
    Panel_VLDesc_Serv: TPanel;
//    Proc_Impressao: TJvUIBQuery;
  //   Proc_Lanca_Retencao: TJvUIBQuery;
     Datasource1: TDatasource;
 {    JvQry_Pes: TJvUIBDataSet;
     JvTransaction: TJvUIBTransaction;
     JvQry_Produtos: TJvUIBDataSet;
     JvQry_Servicos: TJvUIBDataSet;
     JvQry_Parcelas: TJvUIBDataSet;
     JvProc_Cancela_Nota_Cupom: TJvUIBQuery;
     JvProc_Venda_Prazo: TJvUIBQuery;
     JvProc_Venda_Vista: TJvUIBQuery;
     PrintFast1: TPrintFast;
     Proc_Produtos: TJvUIBQuery;
     Proc_Servicos: TJvUIBQuery;
    Proc_Vendas: TJvUIBQuery;   }
    ActionList1: TActionList;
    Action1: TAction;
    ImageList1: TImageList;
    RB_Cresc: TRadioButton;
    RB_Decresc: TRadioButton;
    RG_Quitado: TRadioGroup;
    SBNotas: TSpeedButton;
    Shape1: TShape;
    Shape3: TShape;
    Src_Produtos: TDataSource;
    Src_Servicos: TDataSource;
    Src_Parcelas: TDataSource;
    PopupMenu1: TPopupMenu;
    ImpressoNotaFiscal1: TMenuItem;
    N1: TMenuItem;
    N2viadeCupomFiscal1: TMenuItem;
    TabCadastro: TTabSheet;
    TabPagamento: TTabSheet;
    TabPesquisa: TTabSheet;
    TabProdutos: TTabSheet;
    TabServicos: TTabSheet;
    TabVendas: TTabSheet;
    Tab_Ordem: TTabSheet;
    Tab_PesAvanca: TTabSheet;
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluiPesqClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditP_CliFornKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure EditP_TransportadorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure EditP_VendedorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_CliFornKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Cod_ObservKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Config_ImprKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Desc_GeralExit(Sender: TObject);
    procedure Edit_Nro_Nota_PagKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Nro_Nota_ProdKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Nro_Nota_ServKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Perc_Desc_ServChange(Sender: TObject);
    procedure Edit_Perc_Desc_ServExit(Sender: TObject);
    procedure Edit_Perc_Desc_prodChange(Sender: TObject);
    procedure Edit_Perc_Desc_prodExit(Sender: TObject);
    procedure Edit_ProdutoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_ServicoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_TransportadorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_VendedorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Vl_Unit_ServExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
  //  procedure Carrega_Parametros(Proc : TJvUIBQuery);
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure Grid_PesquisaPrepareCanvas(sender: TObject; Col, Row: Integer; aState: TGridDrawState);
    procedure MskP_CFOPKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Msk_CFOPKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Edit_Ser_NotaExit(Sender: TObject);
    procedure PageCadastroChange(Sender: TObject);
    procedure PageCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Msk_Dt_EmissEnter(Sender: TObject);
    procedure Msk_Dt_EmissExit(Sender: TObject);
    procedure Msk_Hr_SaidaEnter(Sender: TObject);
    procedure Msk_Hr_SaidaExit(Sender: TObject);
    procedure Msk_PlacaEnter(Sender: TObject);
    procedure Msk_PlacaExit(Sender: TObject);
    procedure F3_CfopClick(Sender: TObject);
    procedure Edit_CliFornExit(Sender: TObject);
    procedure F3_CliFornClick(Sender: TObject);
    procedure Msk_CFOPEnter(Sender: TObject);
    procedure Msk_CFOPExit(Sender: TObject);
    procedure Combo_Cli_FornExit(Sender: TObject);
    procedure Edit_VendedorExit(Sender: TObject);
    procedure F3_VendedorClick(Sender: TObject);
    procedure Edit_TransportadorExit(Sender: TObject);
    procedure Edit_Cod_ObservExit(Sender: TObject);
    procedure F3_TransportadorClick(Sender: TObject);
    procedure F3_ObservacaoClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Edit_Nro_NotaExit(Sender: TObject);
    procedure Edit_Nro_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Quant_ProdChange(Sender: TObject);
    procedure Calcula_Total;
    procedure Edit_ProdutoExit(Sender: TObject);
    procedure F3_Nota_ProdClick(Sender: TObject);
    procedure F3_ProdutoClick(Sender: TObject);
    procedure Edit_CodBarraExit(Sender: TObject);
    Procedure Carrega_Produtos(oControle: Integer);
    Procedure Carrega_Servicos(oControle: Integer);
    procedure Edit_Ser_Nota_ProdExit(Sender: TObject);
    procedure Edit_Controle_ProdExit(Sender: TObject);
    procedure DBGrid_ProdDblClick(Sender: TObject);
    procedure Edit_Nro_Nota_ProdExit(Sender: TObject);
    procedure Edit_Controle_ServExit(Sender: TObject);
    procedure Edit_Nro_Nota_ServExit(Sender: TObject);
    procedure Edit_Ser_Nota_ServExit(Sender: TObject);
    procedure Edit_ServicoExit(Sender: TObject);
    procedure F3_ServicoClick(Sender: TObject);
    procedure F3_Nota_ServClick(Sender: TObject);
    procedure DBGrid_ServDblClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure IBQry_PesCalcFields(DataSet: TDataSet);
    procedure SBNotasClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MskP_CFOPExit(Sender: TObject);
    procedure EditP_CliFornExit(Sender: TObject);
    procedure EditP_VendedorExit(Sender: TObject);
    procedure EditP_TransportadorExit(Sender: TObject);
    procedure F3_PCliFornClick(Sender: TObject);
    procedure F3_PCfopClick(Sender: TObject);
    procedure F3_PVendedorClick(Sender: TObject);
    procedure F3_PTransportadorClick(Sender: TObject);
    procedure EditP_Nro_NotaExit(Sender: TObject);
    procedure BtnPag_PrazoClick(Sender: TObject);
    procedure Edit_Nro_Nota_PagExit(Sender: TObject);
    procedure Edit_Ser_Nota_PagExit(Sender: TObject);
    procedure F3_Nota_PagClick(Sender: TObject);
    procedure Edit_Controle_PagExit(Sender: TObject);
    Procedure Carrega_Parcelas(oControle: Integer);
    procedure BtnPag_VistaClick(Sender: TObject);
    procedure Btn_Imprimir_CobrancaClick(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure F3_Conf_DocClick(Sender: TObject);
    procedure Edit_Config_ImprExit(Sender: TObject);
    procedure ImpressoNotaFiscal1Click(Sender: TObject);
    procedure N2viadeCupomFiscal1Click(Sender: TObject);
    procedure Edit_Perct_DesctExit(Sender: TObject);
    procedure Edit_Perct_AcreExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabProdutosContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure SetStatus(Status: String);

  private
    { Private declarations }
    vOper : Integer;
    procedure SetOper(const Value: Integer);

  published
    property Operacao:Integer read vOper write SetOper;

  public
    { Public declarations }
    Procedure Imprime_Nota(aNota, oControle, Cli_Forn: String);
    //Procedure Imprime_Duplicata(Conf_Duplic, oControle: String);
    //Procedure Imprime_Carne(Conf_Carne, oControle: String);

  end;

const
   opInsert = 0;
   opEdit   = 1;
   opDelete = 2;
   opBrowse = 3;

var
  FrmVendasLen: TFrmVendasLen;
  vConfig_Nota :  String;

implementation

uses UPrincipal, Global, UConsulta, UGeraParc, UVariaveis, UCalc_Retencao;


procedure TFrmVendasLen.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case voper of
       opInsert : begin
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnSair.Enabled := False;
                     case PageCadastro.ActivePageIndex of
                        0: begin
                              Edit_Nro_Nota.Enabled := True;
                              Edit_Ser_Nota.Enabled := True;
                              NaoLimpar.Enabled := True;
                              PanelCancelado.Visible := False;
                           end;
                        1: Begin
                              Edit_Produto.Enabled := True;
                              Edit_CodBarra.Enabled := True;
                              F3_Produto.Enabled := True;
                              PanelCancelado_Prod.Visible := False;
                           end;
                        2: begin
                              Edit_Servico.Enabled := True;
                              F3_Servico.Enabled := True;
                              PanelCancelado_Serv.Visible := False;
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
                              NaoLimpar.Enabled := False;
                           end;
                        1: Begin
                              Edit_Produto.Enabled := False;
                              Edit_CodBarra.Enabled := False;
                              F3_Produto.Enabled := False;
                           end;
                        2: begin
                              Edit_Servico.Enabled := False;
                              F3_Servico.Enabled := False;
                           end;
                     end;
                  end;
    end;
  end;
end;

procedure TFrmVendasLen.SetStatus(Status: String);
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

procedure TFrmVendasLen.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmVendasLen.BtnExcluiPesqClick(Sender: TObject);
begin
  PageCadastro.ActivePageIndex := 0;
//  Carrega_Campos(JvQry_Pes);
  BtnExcluiClick(self);
  BtnAtualizaClick(self);
end;

procedure TFrmVendasLen.BtnEditarClick(Sender: TObject);
begin
  Grid_PesquisaDblClick(self);
end;

procedure TFrmVendasLen.Button1Click(Sender: TObject);
begin

end;

procedure TFrmVendasLen.EditP_CliFornKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_PCliFornClick(Self);
end;

procedure TFrmVendasLen.EditP_TransportadorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_PTransportadorClick(Self);
end;

procedure TFrmVendasLen.EditP_VendedorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_PVendedorClick(Self);
end;

procedure TFrmVendasLen.Edit_CliFornKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_CliFornClick(Self);
end;

procedure TFrmVendasLen.Edit_Cod_ObservKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_ObservacaoClick(Self);
end;

procedure TFrmVendasLen.Edit_Config_ImprKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_Conf_DocClick(Self);
end;

procedure TFrmVendasLen.Edit_Desc_GeralExit(Sender: TObject);
begin

end;

procedure TFrmVendasLen.Edit_Nro_Nota_PagKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_Nota_PagClick(Self);
end;

procedure TFrmVendasLen.Edit_Nro_Nota_ProdKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_Nota_ProdClick(Self);
end;

procedure TFrmVendasLen.Edit_Nro_Nota_ServKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_Nota_ServClick(Self);
end;

procedure TFrmVendasLen.Edit_Perc_Desc_ServChange(Sender: TObject);
begin

end;

procedure TFrmVendasLen.Edit_Perc_Desc_ServExit(Sender: TObject);
begin

end;

procedure TFrmVendasLen.Edit_Perc_Desc_prodChange(Sender: TObject);
begin

end;

procedure TFrmVendasLen.Edit_Perc_Desc_prodExit(Sender: TObject);
begin

end;

procedure TFrmVendasLen.Edit_ProdutoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_ProdutoClick(Self);
end;

procedure TFrmVendasLen.Edit_ServicoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_ServicoClick(Self);
end;

procedure TFrmVendasLen.Edit_TransportadorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_TransportadorClick(Self);
end;

procedure TFrmVendasLen.Edit_VendedorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_VendedorClick(Self);
end;

procedure TFrmVendasLen.Edit_Vl_Unit_ServExit(Sender: TObject);
begin

end;

procedure TFrmVendasLen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   if JvTransaction.InTransaction then JvTransaction.Rollback;
   //Grava campos da ordem e pesquisa
   ListOrdem.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'ord_vendas.dat');
   ListCriterios.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'cri_vendas.dat');
   Action := caFree;
end;

procedure TFrmVendasLen.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmVendasLen.BtnIncluiClick(Sender: TObject);
begin
   Paginas.ActivePageIndex := 0;
   Operacao := opInsert;
   SetStatus('Inserção');
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(self,1);
            PanelCancelado.Visible := False;
            Edit_CliFornExit(Self);
            Msk_CFOPExit(Msk_CFOP);
            Edit_VendedorExit(Self);
            Edit_TransportadorExit(Self);
            Edit_Cod_ObservExit(Self);
//            Edit_Controle.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_CONTROLE'));
            Edit_Nro_Nota.SetFocus;
         end;
      1: Begin
            FrmPrincipal.LimpaCampos(self,3);
            Edit_Quant_Prod.Text := '1';
            Edit_Controle_ProdExit(Self);
            if StrToIntZero(Edit_Controle_Prod.Text) > 0 then
            begin
               Edit_ProdutoExit(Self);
               Edit_Produto.SetFocus;
            end
            else
            begin
               Edit_Nro_Nota_Prod.Text := '';
               Edit_Ser_Nota_Prod.Text := '';
               Edit_Controle_Prod.Text := '0';
               Edit_Nro_Nota_Prod.SetFocus;
            end;
         end;
      2: begin
            FrmPrincipal.LimpaCampos(self,4);
            Edit_Quant_Serv.Text := '1';
            Edit_Controle_ServExit(Self);
            if Edit_Controle_Serv.Text > '0' then
            begin
               Edit_ServicoExit(Self);
               Edit_Servico.SetFocus;
            end
            else
            begin
               Edit_Nro_Nota_Serv.Text := '';
               Edit_Ser_Nota_Serv.Text := '';
               Edit_Controle_Serv.Text := '0';
               Edit_Nro_Nota_Serv.SetFocus;
            end;
         end;
   end;
end;

procedure TFrmVendasLen.BtnGravaClick(Sender: TObject);
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
            //Emissao
            if not ValiData(Msk_Dt_Emiss.Text) then
            begin
               MessageDlg('Emissão deve ser preenchido.', mtInformation,[mbOK],0);
               Msk_Dt_Emiss.SetFocus;
               Exit;
            end;
            //CliForn
            if (Length(Trim(Edit_CliForn.Text)) = 0) or (Trim(Edit_CliForn.Text) = '0') then
            begin
               MessageDlg(Combo_Cli_Forn.Items[Combo_Cli_Forn.ItemIndex] + ' deve ser preenchido.', mtInformation,[mbOK],0);
               Edit_CliForn.SetFocus;
               Exit;
            end;
            //CFOP
            if Trim(Msk_CFOP.Text) = '' then
            begin
               MessageDlg('Código Fiscal deve ser preenchido.', mtInformation,[mbOK],0);
               Msk_CFOP.SetFocus;
               Exit;
            end;
            //Vendedor
            if (Length(Trim(Edit_Vendedor.Text)) = 0) or (Trim(Edit_Vendedor.Text) = '0') then
            begin
               MessageDlg('Vendedor deve ser preenchido.', mtInformation,[mbOK],0);
               Edit_Vendedor.SetFocus;
               Exit;
            end;
         end;
      1: begin
            //Nota Fiscal
            if StrToIntZero(Edit_Controle_Prod.Text) <= 0 then
            begin
               MessageDlg('Nota Fiscal deve ser preenchida.', mtInformation,[mbOK],0);
               Edit_Nro_Nota_Prod.SetFocus;
               Exit;
            end;
            //Produto
            if (Length(Trim(Edit_Produto.Text)) = 0) or (Trim(Edit_Produto.Text) = '0') then
            begin
               MessageDlg('Produto deve ser preenchido.', mtInformation,[mbOK],0);
               Exit;
            end;
         end;
      2: begin
            //Nota Fiscal
            if StrToIntZero(Edit_Controle_Serv.Text) <= 0 then
            begin
               MessageDlg('Nota Fiscal deve ser preenchida.', mtInformation,[mbOK],0);
               Edit_Nro_Nota_Serv.SetFocus;
               Exit;
            end;
            //Produto
            if (Length(Trim(Edit_Servico.Text)) = 0) or (Trim(Edit_Servico.Text) = '0') then
            begin
               MessageDlg('Serviço deve ser preenchido.', mtInformation,[mbOK],0);
               Exit;
            end;
         end;
   end;
   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   if PageCadastro.ActivePageIndex = 0 then
   begin
//      Carrega_Parametros(Proc_Vendas);
  //    FrmPrincipal.RodaSP(Proc_Vendas);
   end
   else
   begin
      if PageCadastro.ActivePageIndex = 1 then
      begin
///         Carrega_Parametros(Proc_Produtos);
   //      FrmPrincipal.RodaSP(Proc_Produtos);
      end
      else
      begin
//         Carrega_Parametros(Proc_Servicos);
//         FrmPrincipal.RodaSP(Proc_Servicos);
      end;
   end;
   Operacao := opBrowse;
   SetStatus('Edição');
   BtnInclui.SetFocus;
   //Se esta Marcada Inclusao Persistente
   Case PageCadastro.ActivePageIndex of
      0: begin
            if NaoLimpar.Checked then
            begin
               Operacao := opInsert;
               SetStatus('Inserção');
//               Edit_Controle.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_CONTROLE'));
               Edit_Nro_Nota.Text := '';
               Edit_Ser_Nota.Text := '';
               Edit_Nro_Nota.SetFocus;
            end;
         end;
      1: begin
            Edit_Controle_ProdExit(Self);
         end;
      2: begin
            Edit_Controle_ServExit(Self);
         end;
   end;
end;
{
procedure TFrmVendasLen.Carrega_Parametros(Proc : TJvUIBQuery);
begin
   with Proc do
   begin
      case PageCadastro.ActivePageIndex of
        0: begin
              Params.ByNameasInteger['POPER'] := Operacao;
              Params.ByNameasInteger['PCONTROLE'] := StrToInt(Edit_Controle.Text);
              Params.ByNameasString['PNRO_NOTA'] := Edit_Nro_Nota.Text;
              Params.ByNameasString['PSER_NOTA'] := Edit_Ser_Nota.Text;
              //Numero do caixa da Impressora Fiscal
              Params.ByNameasString['PNUMCAIXA'] := '';
              Params.ByNameasString['PDT_EMISS'] := Msk_Dt_Emiss.Text;
              if Combo_Cli_Forn.ItemIndex = 0 then
              begin
                 Params.ByNameAsInteger['PCOD_CLIENTE'] := StrToIntZero(Edit_CliForn.Text);
                 Params.ByNameIsNull['PCOD_FORNEC'] := True;
              end
              else
              begin
                 Params.ByNameAsInteger['PCOD_FORNEC'] := StrToIntZero(Edit_CliForn.Text);
                 Params.ByNameIsNull['PCOD_CLIENTE'] := True;
              end;
              Params.ByNameasString['PCFOP'] := Msk_Cfop.Text;
              if StrToIntZero(Edit_Transportador.Text) > 0 then
                 Params.ByNameasInteger['PCOD_TRANS'] := StrToIntZero(Edit_Transportador.Text)
              else
                 Params.ByNameIsNull['PCOD_TRANS'] := True;
              Params.ByNameasInteger['PCOD_VENDEDOR'] := StrToIntZero(Edit_Vendedor.Text);
              Params.ByNameasString['PDT_SAIDA'] := Msk_Dt_Saida.Text;
              Params.ByNameasString['PHR_SAIDA'] := Msk_Hr_Saida.Text;
              Params.ByNameasString['PCTA_FRETE'] := Combo_Cta_Frete.Text{ Items[Combo_Cta_Frete.ItemIndex];

              Params.ByNameAsCurrency['PVL_FRETE'] := StrToFloatZero(Edit_Vlr_Frete.Text);
              Params.ByNameAsCurrency['PICM_FRETE'] := StrToFloatZero(Edit_Icm_Frete.Text);
              if StrToIntZero(Edit_Cod_Observ.Text) > 0 then
                 Params.ByNameAsInteger['PCOD_OBSERV'] := StrToIntZero(Edit_Cod_Observ.Text)
              else
                 Params.ByNameIsNull['PCOD_OBSERV'] := True;
              Params.ByNameasString['POBSERV2'] := Edit_Obs.Text;
              Params.ByNameasString['PPLACA'] := Msk_Placa.Text;
              Params.ByNameAsCurrency['PVLR_PAGO_D'] := 0;
              Params.ByNameAsCurrency['PTROCO'] := 0;
              Params.ByNameAsCurrency['PPERC_DESC'] := StrToFloatZero(Edit_Perct_Desct.Text);
              Params.ByNameAsCurrency['PVL_DESC'] := StrToFloatZero(Edit_Desc_Geral.Text);
              Params.ByNameAsCurrency['PPERC_ACRE'] := StrToFloatZero(Edit_Perct_Acre.Text);
              Params.ByNameAsCurrency['PVLR_ACRE'] := StrToFloatZero(Edit_Acre_Geral.Text);
              Params.ByNameAsString['PCLI_FORN'] := Combo_Cli_Forn.Items[Combo_Cli_Forn.ItemIndex];
              Params.ByNameAsCurrency['PNTQUANTID'] := StrToFloatZero(Edit_NTQuantid.Text);
              Params.ByNameAsString['PNTESPECIE'] := Edit_NTEspecie.Text;
              Params.ByNameAsString['PNTMARCA'] := Edit_NTMarca.Text;
              Params.ByNameIsNull['PCOD_FORMAPAGTO'] := True;
              Params.ByNameasInteger['PIND_VENDA_RAP'] := 0;
              //Postos de Gasolina
              Params.ByNameIsNull['PVEICULO'] := True;
              Params.ByNameIsNull['PMOTORISTA'] := True;
              Params.ByNameIsNull['PKILOMETRAGEM'] := True;
              Params.ByNameIsNull['PFROTA'] := True;
              Params.ByNameIsNull['PNRO_AUTORIZACAO'] := True;

           end;
        1: begin
              Params.ByNameasInteger['POPER'] := Operacao;
              Params.ByNameasInteger['PCONTROLE']:= StrToIntZero(Edit_Controle_Prod.Text);
              if StrToIntZero(Edit_Controle_Prod.Text) > 0 then
                 Params.ByNameasInteger['PSEQUENCIA'] := StrToIntZero(Edit_Seq_Prod.Text)
              else
                 Params.ByNameIsNull['PSEQUENCIA'] := True;
              Params.ByNameasInteger['PCOD_PRODUTO'] := StrToIntZero(Edit_Produto.Text);
              Params.ByNameAsCurrency['PQUANTIDADE'] := StrToFloatZero(Edit_Quant_Prod.Text);
              Params.ByNameAsCurrency['PVL_UNITARIO'] := StrToFloatZero(Edit_Vl_Unit_Prod.Text);
              Params.ByNameAsCurrency['PPERC_DESC'] := StrToFloatZero(Edit_Perc_Desc_prod.Text);
              if Parametros.ALTERA_NOME_PROD = 1 then
                 Params.ByNameAsString['PDESCR_SERVICO'] := Edit_Descr_Produto.Text
              else
                 Params.ByNameIsNull['PDESCR_SERVICO'] := True;
              Params.ByNameasInteger['PIND_VENDA_RAP'] := 0;
              Params.ByNameAsCurrency['PPESO_LIQUIDO'] := StrToFloatZero(Edit_Peso_Liq.text);
              if Memo_OBS_Serv.Visible = True then
                 Params.ByNameAsString['POBSERVACAO'] := Memo_OBS_Prod.Lines.Text
              else
                 Params.ByNameIsNull['POBSERVACAO'] := True;
           end;
        2: begin
              Params.ByNameasInteger['POPER'] := Operacao;
              Params.ByNameasInteger['PCONTROLE']:= StrToIntZero(Edit_Controle_Serv.Text);
              if StrToIntZero(Edit_Controle_Serv.Text) > 0 then
                 Params.ByNameasInteger['PSEQUENCIA'] := StrToIntZero(Edit_Seq_Serv.Text)
              else
                 Params.ByNameIsNull['PSEQUENCIA'] := True;
              Params.ByNameasInteger['PCOD_PRODUTO'] := StrToIntZero(Edit_Servico.Text);
              Params.ByNameAsCurrency['PQUANTIDADE'] := StrToFloatZero(Edit_Quant_Serv.Text);
              Params.ByNameAsCurrency['PVL_UNITARIO'] := StrToFloatZero(Edit_Vl_Unit_Serv.text);
              Params.ByNameAsCurrency['PPERC_DESC'] := StrToFloatZero(Edit_Perc_Desc_Serv.text);
              Params.ByNameAsString['PDESCR_SERVICO'] := Trim(Edit_Descr_Servico.Text);
              Params.ByNameAsCurrency['PPESO_LIQUIDO'] := 0;
              
              if Memo_OBS_Serv.Visible = True then
                 Params.ByNameAsString['POBSERVACAO'] := Memo_OBS_Serv.Lines.Text
              else
                 Params.ByNameIsNull['POBSERVACAO'] := True;

           end;
      end;
   end;
end;          }

procedure TFrmVendasLen.Carrega_Campos(oDataSet: TDataSet);
var I : Integer;
begin
   with oDataSet do
   begin
      case PageCadastro.ActivePageIndex of
        0: begin
              Edit_Controle.Text := FieldByName('CONTROLE').asString;
              Edit_Nro_Nota.Text := FieldByName('NRO_NOTA').asString;
              Edit_Ser_Nota.Text := FieldByName('SER_NOTA').asString;
              //Dt_Emiss
              Msk_Dt_EmissEnter(Msk_Dt_Emiss);
              Msk_Dt_Emiss.Text := FieldByName('DT_EMISS').asString;
              Msk_Dt_EmissExit(Msk_Dt_Emiss);
              //CLI_FORN
              Combo_Cli_Forn.ItemIndex := Procura_Item_ComboList(Combo_Cli_Forn,FieldByName('CLI_FORN').asString);

              if Combo_Cli_Forn.ItemIndex = 0 then
                 Edit_CliForn.Text := FieldByName('COD_CLIENTE').AsString
              else
                 Edit_CliForn.Text := FieldByName('COD_FORNEC').AsString;
              Edit_CliFornExit(self);

              //CFOP
              Msk_CFOPEnter(Msk_CFOP);
              Msk_Cfop.Text := FieldByName('CFOP').AsString;
              Msk_CFOPExit(Msk_CFOP);
              Edit_Transportador.Text := FieldByName('COD_TRANS').AsString;
              Edit_TransportadorExit(Self);
              Edit_Vendedor.Text := FieldByName('COD_VENDEDOR').AsString;
              Edit_VendedorExit(Self);
              //Dt_saida
              Msk_Dt_EmissEnter(Msk_Dt_Saida);
              Msk_Dt_Saida.Text := FieldByName('DT_SAIDA').asstring;
              Msk_Dt_EmissExit(Msk_Dt_Saida);
              //Hr_Saida
              Msk_Hr_SaidaEnter(Msk_Hr_Saida);
              Msk_Hr_Saida.Text := FormatDateTime('hh:nn',FieldByName('HR_SAIDA').AsDateTime);
              Msk_Hr_SaidaExit(Msk_Hr_Saida);
              //CTA_FRETE
              For I := 0 to Combo_Cta_Frete.Items.Count-1 do
              begin
                 if Combo_Cta_Frete.Items[I] = FieldByName('CTA_FRETE').asString then
                    Combo_Cta_Frete.ItemIndex := I;
              end;
              Edit_Vlr_Frete.Text := FieldByName('VL_FRETE').AsString;
              Edit_Icm_Frete.Text := FieldByName('ICM_FRETE').AsString;
              Edit_Cod_Observ.Text := FieldByName('COD_OBSERV').AsString;
              Edit_Cod_ObservExit(Self);
              Edit_Obs.Text := FieldByName('OBSERV2').asString;
              //Placa
              Msk_PlacaEnter(Msk_Placa);
              Msk_Placa.Text := FieldByName('PLACA').asString;
              Msk_PlacaExit(Msk_Placa);
              //CLI_FORN
              For I := 0 to Combo_Cli_Forn.Items.Count-1 do
              begin
                 if Combo_Cli_Forn.Items[I] = FieldByName('CLI_FORN').asString then
                    Combo_Cli_Forn.ItemIndex := I;
              end;
              Edit_NTQuantid.Text := FieldByName('NTQUANTID').AsString;
              Edit_NTEspecie.Text := FieldByName('NTESPECIE').asString;
              Edit_NTMarca.Text := FieldByName('NTMARCA').asString;
              if FieldByName('TOT_PROD').asFloat > 0 then
                 PanelTot_Prod.Caption := FormatFloat('#,###,##0.00',FieldByName('TOT_PROD').asFloat);
              if FieldByName('TOT_SERV').asFloat > 0 then
                 PanelTot_Serv.Caption := FormatFloat('#,###,##0.00',FieldByName('TOT_SERV').asFloat);
              Edit_Perct_Desct.Text := FieldByName('PERC_DESC').AsString;
              Edit_Desc_Geral.Text := FieldByName('VL_DESC').AsString;
              Edit_Perct_Acre.Text := FieldByName('PERC_ACRE').AsString;
              Edit_Acre_Geral.Text := FieldByName('VLR_ACRE').AsString;
              PanelTot_Nota.Caption := FormatFloat('#,###,##0.00',FieldByName('TOT_NOTA').asFloat);

              PanelCancelado.Visible := IIF(FieldByName('CANCELADO').AsInteger = 1,True,False);

           end;
        1: begin
              Edit_Controle_Prod.Text := FieldByName('CONTROLE').AsString;
              Edit_Controle_ProdExit(Self);
              Edit_Seq_Prod.Text := FieldByName('SEQUENCIA').AsString;
              Edit_Produto.text := FieldByName('COD_PRODUTO').AsString;
              Edit_ProdutoExit(Self);
              Edit_Quant_Prod.Text := FieldByName('QUANTIDADE').AsString;
              Edit_Vl_Unit_Prod.Text := FieldByName('VL_UNITARIO').AsString;
              Edit_Perc_Desc_Prod.Text := FieldByName('PERC_DESC').AsString;
              Edit_Peso_Liq.Text := FieldByName('PESO_LIQUIDO').AsString;
              Calcula_Total;
           end;
        2: begin
              //
           end;
      end;
   end;
end;

procedure TFrmVendasLen.Grid_PesquisaDblClick(Sender: TObject);
begin  {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      PageCadastro.ActivePageIndex := 0;
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
      PageCadastroChange(Self);
      SetStatus('Edição');
   end; }
end;

procedure TFrmVendasLen.Grid_PesquisaPrepareCanvas(sender: TObject; Col, Row: Integer; aState: TGridDrawState);
begin  {
   if JvQry_Pes.Active then
   begin
      if JvQry_Pes.FieldByName('CANCELADO').asInteger = 1 then
      begin
         Grid_Pesquisa.Canvas.Font.Color := clWhite;
         Grid_Pesquisa.Canvas.Brush.Color := clRed;
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
   end;  }
end;

procedure TFrmVendasLen.MskP_CFOPKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_PCfopClick(Self);
end;

procedure TFrmVendasLen.Msk_CFOPKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_CfopClick(Self);
end;

procedure TFrmVendasLen.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then AllowChange := False;
end;


procedure TFrmVendasLen.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(self,1);
            PanelCancelado.Visible := False;
            Edit_CliFornExit(Self);
            Msk_CFOPExit(Msk_CFOP);
            Edit_VendedorExit(Self);
            Edit_TransportadorExit(Self);
            Edit_Cod_ObservExit(Self);
         end;
      1: begin
            FrmPrincipal.LimpaCampos(self,3);
            Edit_ProdutoExit(Self);
            Carrega_Produtos(StrToIntZero(Edit_Controle_Prod.Text));
            Calcula_Total;
         end;
      2: begin
            FrmPrincipal.LimpaCampos(self,4);
            Edit_ServicoExit(Self);
            Carrega_Servicos(StrToIntZero(Edit_Controle_Serv.Text));
            Calcula_Total;
         end;
   end;
   BtnInclui.SetFocus;
end;

procedure TFrmVendasLen.FormShow(Sender: TObject);
// var  Qry : TJvUIBDataset;
var     I : Integer;
     vSelect : String;
begin
   Operacao := opBrowse;
   Edit_Nro_Nota.Text := '';
   Combo_Cli_Forn.ItemIndex := 0;
   ComboP_Cli_Forn.ItemIndex := 0;
  { 
   JvTransaction.DataBase := FrmPrincipal.base;
   
   Proc_Vendas.DataBase := frmprincipal.base;
   Proc_Vendas.Transaction := frmprincipal.transaction;
   Proc_Vendas.BuildStoredProc('PROC_VENDAS');

   Proc_Produtos.DataBase := FrmPrincipal.base;
   Proc_Produtos.Transaction := FrmPrincipal.Transaction;
   Proc_Produtos.BuildStoredProc('PROC_VENDITEM');

   Proc_Servicos.DataBase := FrmPrincipal.base;
   Proc_Servicos.Transaction := FrmPrincipal.Transaction;
   Proc_Servicos.BuildStoredProc('PROC_VENDITEM');
   
   JvProc_Cancela_Nota_Cupom.DataBase := frmprincipal.base;
   JvProc_Cancela_Nota_Cupom.Transaction := JvTransaction;
   JvProc_Cancela_Nota_Cupom.BuildStoredProc('CANCELA_NOTA_CUPOM');

   JvProc_Venda_Prazo.DataBase := frmprincipal.base;
   JvProc_Venda_Prazo.Transaction := JvTransaction;
   JvProc_Venda_Prazo.BuildStoredProc('EFETUA_VENDAS_PRAZO');
   
   JvProc_Venda_Vista.DataBase := frmprincipal.base;
   JvProc_Venda_Vista.Transaction := JvTransaction;
   JvProc_Venda_Vista.BuildStoredProc('EFETUA_VENDAS_VISTA');

   JvQry_Pes.Database := Frmprincipal.Base;
   JvQry_Pes.Transaction := Frmprincipal.Transaction;

   JvQry_Produtos.Database := Frmprincipal.Base;
   JvQry_Produtos.Transaction := Frmprincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' SELECT CONTROLE, SEQUENCIA, COD_PRODUTO, QUANTIDADE, ';
   vSelect := vSelect + ' CASAS_DECI_VALOR, CASAS_DECI_QTDE, VL_UNITARIO, PERC_DESC, ';
   vSelect := vSelect + ' TOT_PRODUTO, NOME, DESCR_SERVICO, PESO_LIQUIDO, ';
   vSelect := vSelect + ' VENDITEM.OBSERVACAO FROM VENDITEM, PRODUTOS WHERE ';
   vSelect := vSelect + ' VENDITEM.COD_PRODUTO=PRODUTOS.CODIGO AND PRODUTOS.TIPO <> 1 AND ';
   vSelect := vSelect + ' VENDITEM.CONTROLE = :oControle ORDER BY PRODUTOS.CODIGO';
   JvQry_Produtos.SQL.Add(vSelect);

   JvQry_Servicos.Database := Frmprincipal.Base;
   JvQry_Servicos.Transaction := Frmprincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' SELECT CONTROLE, SEQUENCIA, COD_PRODUTO, DESCR_SERVICO, ';
   vSelect := vSelect + ' QUANTIDADE, VL_UNITARIO, PERC_DESC, TOT_PRODUTO, NOME, ';
   vSelect := vSelect + ' CASAS_DECI_VALOR, CASAS_DECI_QTDE, VENDITEM.OBSERVACAO ';
   vSelect := vSelect + ' FROM VENDITEM ';
   vSelect := vSelect + ' LEFT JOIN PRODUTOS ON(VENDITEM.COD_PRODUTO=PRODUTOS.CODIGO) ';
   vSelect := vSelect + ' WHERE ';
   vSelect := vSelect + ' PRODUTOS.TIPO = 1 AND VENDITEM.CONTROLE = :oControle ';
   vSelect := vSelect + ' ORDER BY PRODUTOS.CODIGO ';
   JvQry_Servicos.SQL.Add(vSelect);


   JvQry_Parcelas.Database := Frmprincipal.Base;
   JvQry_Parcelas.Transaction := Frmprincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' Select * from CTASRECEBER ';
   vSelect := vSelect + ' where CONTROLE = :oControle ';
   JvQry_Parcelas.SQL.Add(vSelect);
   
   Proc_Impressao.DataBase := FrmPrincipal.base;
   Proc_Impressao.Transaction := FrmPrincipal.Transaction;
   Proc_Impressao.BuildStoredProc('PROC_IMPRESSAO');
   
   Proc_Lanca_Retencao.DataBase := FrmPrincipal.base;
   Proc_Lanca_Retencao.Transaction := JvTransaction;
   Proc_Lanca_Retencao.BuildStoredProc('LANCA_RETENCAO_NF');
   
   //Carrega os Campos para Pesquisa
   Qry := TJvUIBDataset.Create(Self);
   Try
      Qry.Database := FrmPrincipal.Base;
      Qry.Transaction := FrmPrincipal.Transaction;
      Qry.SQL.Clear;
      Qry.SQL.Add('Select * from Vendas where Controle = -1');
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
   end;
   
   //Busca a Configuracao da Nota
   Qry := TJvUIBDataset.Create(Self);
   Try
      Qry.Database := FrmPrincipal.Base;
      Qry.Transaction := FrmPrincipal.Transaction;
      Qry.SQL.Clear;
      Qry.SQL.Add('Select Config_Nota from Parametros');
      Qry.Open;
      vConfig_Nota := Qry.FieldByName('Config_Nota').asString;
   except
      Qry.Close;
      Qry.Free;
   end;   }
   
   //peso ou quantidade
   if Parametros.VENDA_PESO_LIQ = 0 then
   begin
      Label20.Visible := False;
      Edit_Peso_Liq.Visible := False;
      Label34.Left := Label34.Left - Edit_Peso_Liq.Width;
      Label35.Left := Label35.Left - Edit_Peso_Liq.Width;
      Edit_Vl_Unit_Prod.Left := Edit_Vl_Unit_Prod.Left - Edit_Peso_Liq.Width;
      Label36.Left := Label36.Left - Edit_Peso_Liq.Width;
      Label37.Left := Label37.Left - Edit_Peso_Liq.Width;
      Edit_Perc_Desc_Prod.Left := Edit_Perc_Desc_Prod.Left - Edit_Peso_Liq.Width;
      Label38.Left := Label38.Left - Edit_Peso_Liq.Width;
      Panel_VLDesc_Prod.Left := Panel_VLDesc_Prod.Left - Edit_Peso_Liq.Width;
      Label39.Left := Label39.Left - Edit_Peso_Liq.Width;
      Label40.Left := Label40.Left - Edit_Peso_Liq.Width;
      PanelTotal_Prod.Left := PanelTotal_Prod.Left - Edit_Peso_Liq.Width;
   end
   else
   begin
      Label20.Visible := True;
      Edit_Peso_Liq.Visible := True;
      //DBGrid_Prod.Columns[2].FieldName := 'PESO_LIQUIDO';
      //DBGrid_Prod.Columns[2].Title.Caption := 'Peso Liq.';
   end;

   //Altera descricao do Produto
   if Parametros.ALTERA_NOME_PROD = 0 then
   begin
      Edit_Descr_Produto.Enabled := False;
      Edit_Descr_Produto.Font.Color := clWhite;
      Edit_Descr_Produto.Color := clGray;
      Edit_Descr_Produto.ReadOnly := True;
      Edit_Descr_Produto.TabStop := False;
      {DBGrid_Prod.Columns[1].Visible := True;
      DBGrid_Prod.Columns[1].Width := 208;
      DBGrid_Prod.Columns[2].Visible := False;
      DBGrid_Prod.Columns[2].Width := 208;}
   end
   else
   begin
      Edit_Descr_Produto.Enabled := True;
      Edit_Descr_Produto.Font.Color := clWindowText;
      Edit_Descr_Produto.Color := clWindow;
      Edit_Descr_Produto.ReadOnly := False;
      Edit_Descr_Produto.TabStop := True;
      {DBGrid_Prod.Columns[1].Visible := False;
      DBGrid_Prod.Columns[1].Width := 208;
      DBGrid_Prod.Columns[2].Visible := True;
      DBGrid_Prod.Columns[2].Width := 208;}
   end;

   //Complemento dos produto (OBS)
   if Parametros.COMPLE_PROD_NT = 0 then
   begin
      //Grid Produto
      Memo_OBS_Prod.Visible := False;
      DBGrid_Prod.Height := 203;
      DBGrid_Prod.Top := 124;
      //Grid Serviço
      Memo_OBS_Serv.Visible := False;
      DBGrid_Serv.Height := 203;
      DBGrid_Serv.Top := 124;
   end
   else
   begin
      //Grid Produto
      Memo_OBS_Prod.Visible := True;
      DBGrid_Prod.Height := 131;
      DBGrid_Prod.Top := 196;
      //Grid Serviço
      Memo_OBS_Serv.Visible := True;
      DBGrid_Serv.Height := 131;
      DBGrid_Serv.Top := 196;
   end;

   //Define as mascaras no Grid
   //(IBQry_Produtos.FieldByName('QUANTIDADE') as TNumericField).DisplayFormat := Parametros.Mascara_Qtde;
   //(IBQry_Produtos.FieldByName('VL_UNITARIO') as TNumericField).DisplayFormat := Parametros.Mascara_Valor;
   //(IBQry_Produtos.FieldByName('TOT_PRODUTO') as TNumericField).DisplayFormat := Parametros.Mascara_Valor;
   //(IBQry_Servicos.FieldByName('QUANTIDADE') as TNumericField).DisplayFormat := Parametros.Mascara_Qtde;
   //(IBQry_Servicos.FieldByName('VL_UNITARIO') as TNumericField).DisplayFormat := Parametros.Mascara_Valor;
   //(IBQry_Servicos.FieldByName('TOT_PRODUTO') as TNumericField).DisplayFormat := Parametros.Mascara_Valor;

   PageCadastroChange(self);
   BtnInclui.SetFocus;

   Try
      ListOrdem.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'ord_vendas.dat');
      ListCriterios.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'cri_vendas.dat');
   except
   end;
end;

procedure TFrmVendasLen.TabProdutosContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TFrmVendasLen.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI, aOrdem : String;
    I: Integer;
begin
   BtnExcluiPesq.enabled := false;
   BtnEditar.enabled := false;
   vSelect := '';
   vSelect := ' SELECT VENDAS.*, ';
   {vSelect := ' SELECT VENDAS.CONTROLE, VENDAS.NRO_NOTA, VENDAS.SER_NOTA, VENDAS.NUMCAIXA, VENDAS.DT_EMISS, ';
   vSelect := vSelect + ' VENDAS.COD_CLIENTE, VENDAS.CFOP, VENDAS.COD_FORNEC, VENDAS.COD_TRANS, VENDAS.COD_VENDEDOR, ';
   vSelect := vSelect + ' VENDAS.COD_FORMAPAGTO, VENDAS.COD_OBSERV, VENDAS.VL_COMISS, VENDAS.DT_SAIDA, VENDAS.HR_SAIDA, ';
   vSelect := vSelect + ' VENDAS.CTA_FRETE, VENDAS.VL_FRETE, VENDAS.ICM_FRETE, VENDAS.BASE_ICMS, VENDAS.BASE_IPI, ';
   vSelect := vSelect + ' VENDAS.BASE_SUBST, VENDAS.VL_ICMS, VENDAS.VL_IPI, VENDAS.VL_SUBST, VENDAS.TOT_FUNR, VENDAS.TOT_ISS, ';
   vSelect := vSelect + ' VENDAS.TOT_IR, VENDAS.TOT_SERV, VENDAS.TOT_PROD, VENDAS.TOT_NOTA, VENDAS.OBSERV2, VENDAS.PLACA, ';
   vSelect := vSelect + ' VENDAS.VLR_PAGO_D, VENDAS.TROCO, VENDAS.PERC_DESC, VENDAS.VL_DESC, VENDAS.PERC_ACRE, VENDAS.VLR_ACRE, ';
   vSelect := vSelect + ' VENDAS.CLI_FORN, VENDAS.TT_PBRUTO, VENDAS.TT_PLIQUI, VENDAS.NTQUANTID, VENDAS.NTESPECIE, VENDAS.NTMARCA, VENDAS.CANCELADO, VENDAS.VLR_PAGO_D, ';}
   vSelect := vSelect + ' CLIENTES.NOME CLIENTES_NOME,  FORNECEDORES.NOME FORNECEDORES_NOME ';
   vSelect := vSelect + ' FROM VENDAS ';
   vSelect := vSelect + ' LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) ';
   vSelect := vSelect + ' LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
   //vSelect := vSelect + ' ORDER BY NRO_NOTA, SER_NOTA, CONTROLE ';

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
   If (Length(Trim(EditP_Controle.Text)) > 0) and (StrToIntZero(EditP_Controle.Text) > 0) then
   begin
      CRI := CRI + ' and Controle = '+ Trim(EditP_Controle.Text) +' ';
   end;
   //Emissao
   if (MskP_Dt_Emiss.Text <> '') and (ValiData(MskP_Dt_Emiss.Text)) then
   begin
      CRI := CRI + ' and Dt_Emiss = '''+ FormatDateTime('mm/dd/yyyy',StrToDate(MskP_Dt_Emiss.Text)) +''' ';
   end;
   //Data de Saida
   if (MskP_Dt_Saida.Text <> '') and (ValiData(MskP_Dt_Saida.Text)) then
   begin
      CRI := CRI + ' and Dt_Saida = '''+ FormatDateTime('mm/dd/yyyy',StrToDate(MskP_Dt_Saida.Text)) +''' ';
   end;
   //Cliente ou Fornecedor
   If (Length(Trim(EditP_CliForn.Text)) > 0) and (StrToIntZero(EditP_CliForn.Text) > 0) then
   begin
      if ComboP_Cli_Forn.ItemIndex = 0 then //Cliente
         CRI := CRI + ' and Cod_Cliente = '+ Trim(EditP_CliForn.Text) + ' '
      else //Fornecedor
         CRI := CRI + ' and Cod_Fornec = '+ Trim(EditP_CliForn.Text) +' ';
   end;
   //Cfop
   if Trim(MskP_CFOP.Text) <> '' then
   begin
      CRI := CRI + ' and CFOP = '''+ Trim(MskP_CFOP.Text) +''' ';
   end;
   //Vendedor
   If (Length(Trim(EditP_Vendedor.Text)) > 0) and (StrToIntZero(EditP_Vendedor.Text) > 0) then
   begin
      CRI := CRI + ' and Cod_Vendedor = '+ Trim(EditP_Vendedor.Text) +' ';
   end;
   //Transportador
   If (Length(Trim(EditP_Transportador.Text)) > 0) and (StrToIntZero(EditP_Transportador.Text) > 0) then
   begin
      CRI := CRI + ' and Cod_Trans = '+ Trim(EditP_Transportador.Text) +' ';
   end;

   //Quitado
   if RG_Quitado.ItemIndex <> -1 then
   begin
      if RG_Quitado.ItemIndex = 0 then //Quitado sim
         CRI := CRI + ' and VLR_PAGO_D >= TOT_NOTA '
      else
         CRI := CRI + ' and VLR_PAGO_D < TOT_NOTA ';
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
      aOrdem := aOrdem + ' Controle,';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + Copy(aOrdem,1,Length(aOrdem)-1);
   
   {vSelect := '';
   vSelect := ' SELECT VENDAS.*, ';
   vSelect := vSelect + ' CLIENTES.NOME as CLIENTES_NOME,  FORNECEDORES.NOME as FORNECEDORES_NOME ';
   vSelect := vSelect + ' FROM VENDAS ';
   vSelect := vSelect + ' LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) ';
   vSelect := vSelect + ' LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
   memo1.lines.text := vselect;}

   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
                     {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      BtnExcluiPesq.enabled := true;
      BtnEditar.enabled := true;
      datasource1.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource1;
      Grid_Pesquisa.SetFocus;
   end;             }
end;

procedure TFrmVendasLen.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin {
   JvQuery := TJvUIBDataset.Create(Self);
   JvQuery.Database := FrmPrincipal.Base;
   JvQuery.Transaction := FrmPrincipal.Transaction;
   try
      Case PageCadastro.ActivePageIndex of
      0: begin
            If (Length(Trim(Edit_Nro_Nota.Text)) <> 0) and (Length(Trim(Edit_Ser_Nota.Text)) <> 0) then
            begin
               if not FrmPrincipal.RodaConsulta('Select * from Vendas where Controle = ' + Edit_Controle.Text,JvQuery) then Exit;
               if JvQuery.RecordCount > 0 then
               begin
                  Operacao := opDelete;
                  Carrega_Campos(JvQuery);
                  if MessageDlg('ATENÇÃO: Notas/Cupons fiscais não podem ser excluídos, somente cancelados. '+ #13 +'Confirma cancelamento da Nota Fiscal Nro: "'+ Edit_Nro_Nota.Text +'" Serie: "'+ Edit_Ser_Nota.Text +'" Controle: "'+ Trim(Edit_Controle.Text) +'" ?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                  begin
                     //Carrega_Parametros;
                     //FrmPrincipal.RodaSP(IBProc);
                     JvProc_Cancela_Nota_Cupom.Params.ByNameAsInteger['PCONTROLE'] := StrToIntZero(Edit_Controle.Text);
                     FrmPrincipal.RodaSP(JvProc_Cancela_Nota_Cupom);
                     FrmPrincipal.LimpaCampos(self,1);
                     PanelCancelado.Visible := False;
                     Edit_CliFornExit(Self);
                     Msk_CFOPExit(Msk_CFOP);
                     Edit_VendedorExit(Self);
                     Edit_TransportadorExit(Self);
                     Edit_Cod_ObservExit(Self);
                       SetStatus('Pesquisa');
                  end;
                  Operacao := opBrowse;
               end
               else
               begin
                  MessageDlg('Nota Fiscal com Nro: "'+ Edit_Nro_Nota.Text +'" Serie: "'+ Edit_Ser_Nota.Text +'" Controle: "'+ Trim(Edit_Controle.Text) +'" não encontrada.',mtConfirmation,[mbOk],0);
                  FrmPrincipal.LimpaCampos(self,1);
                  PanelCancelado.Visible := False;
                  Edit_CliFornExit(Self);
                  Msk_CFOPExit(Msk_CFOP);
                  Edit_VendedorExit(Self);
                  Edit_TransportadorExit(Self);
                  Edit_Cod_ObservExit(Self);
               end;
               BtnInclui.SetFocus;
            end;
         end;
      1: begin
            //Venditem
            Edit_Controle_ProdExit(Self);
            if (StrToIntZero(Edit_Controle_Prod.Text) > 0) and (StrToIntZero(Edit_Produto.Text) > 0) then
            begin
               if not FrmPrincipal.RodaConsulta('Select * from VendItem where Controle = ' + Trim( Edit_Controle_Prod.Text) + ' and Sequencia = '+ Trim(Edit_Seq_Prod.Text),JvQuery) then Exit;
               if JvQuery.RecordCount > 0 then
               begin
                  Operacao := opDelete;
                  Carrega_Campos(JvQuery);
                  if MessageDlg('Confirma exclusão do produto'+ #13 + Edit_Produto.Text + ' - ' + Edit_Descr_Produto.Text + '?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                  begin
                     if PageCadastro.ActivePageIndex = 0 then
                     begin
                        Carrega_Parametros(Proc_Vendas);
                        FrmPrincipal.RodaSP(Proc_Vendas);
                     end
                     else
                     begin
                        if PageCadastro.ActivePageIndex = 1 then
                        begin
                           Carrega_Parametros(Proc_Produtos);
                           FrmPrincipal.RodaSP(Proc_Produtos);
                        end
                        else
                        begin
                           Carrega_Parametros(Proc_Servicos);
                           FrmPrincipal.RodaSP(Proc_Servicos);
                        end;
                     end;
                     SetStatus('Pesquisa');
                     BtnCancelarClick(Self);
                  end;
                  Operacao := opBrowse;
               end
               else
               begin
                  MessageDlg('Produto com CODIGO "'+ Edit_Produto.Text +'" não encontrado nesta Venda.',mtConfirmation,[mbOk],0);
                  SetStatus('Pesquisa');
                  BtnCancelarClick(Self);
               end;
               BtnInclui.SetFocus;
            end;
         end;
      2: begin
            //Venditem do Servico
            Edit_Controle_ServExit(Self);
            if (StrToIntZero(Edit_Controle_Serv.Text) > 0) and (StrToIntZero(Edit_Servico.Text) > 0) then
            begin
               if not FrmPrincipal.RodaConsulta('Select * from VendItem where Controle = ' + Trim( Edit_Controle_Serv.Text) + ' and Sequencia = '+ Trim(Edit_Seq_Serv.Text),JvQuery) then Exit;
               if JvQuery.RecordCount > 0 then
               begin
                  Operacao := opDelete;
                  Carrega_Campos(JvQuery);
                  if MessageDlg('Confirma exclusão do serviço'+ #13 + Edit_Servico.Text + ' - ' + Edit_Descr_Servico.Text + '?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                  begin
                     if PageCadastro.ActivePageIndex = 0 then
                     begin
                        Carrega_Parametros(Proc_Vendas);
                        FrmPrincipal.RodaSP(Proc_Vendas);
                     end
                     else
                     begin
                        if PageCadastro.ActivePageIndex = 1 then
                        begin
                           Carrega_Parametros(Proc_Produtos);
                           FrmPrincipal.RodaSP(Proc_Produtos);
                        end
                        else
                        begin
                           Carrega_Parametros(Proc_Servicos);
                           FrmPrincipal.RodaSP(Proc_Servicos);
                        end;
                     end;
                     SetStatus('Pesquisa');
                     BtnCancelarClick(Self);
                  end;
                  Operacao := opBrowse;
               end
               else
               begin
                  MessageDlg('Serviço com CODIGO "'+ Trim(Edit_Servico.Text) +'" não encontrado nesta Venda.',mtConfirmation,[mbOk],0);
                  SetStatus('Pesquisa');
                  BtnCancelarClick(Self);
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

procedure TFrmVendasLen.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self)
   else
      PageCadastro.ActivePageIndex := 0;
end;

procedure TFrmVendasLen.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   EditP_CliFornExit(self);
   MskP_CFOPExit(MskP_CFOP);
   EditP_VendedorExit(self);
   EditP_TransportadorExit(self);
   RG_Quitado.ItemIndex := -1;
   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
  // JvQry_Pes.Close;
   EditP_Nro_Nota.SetFocus;
end;

procedure TFrmVendasLen.Edit_Ser_NotaExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Edit_Nro_Nota.Text)) <> 0 then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from Vendas where NRO_NOTA='''+ Edit_Nro_Nota.Text +''' and SER_NOTA='''+ Edit_SER_NOTA.Text +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            JvQuery.Last;
            if JvQuery.RecordCount > 1 then
            begin
               FrmPesquisa := TFrmPesquisa.Create(self);
               try
                  FrmPesquisa.Select := ' Select * from Vendas where NRO_NOTA='''+ Edit_Nro_Nota.Text +''' and SER_NOTA='''+ Edit_SER_NOTA.Text +'''';
                  FrmPesquisa.Indice_Inicial := 'CONTROLE';
                  FrmPesquisa.Campo_Retorno := 'CONTROLE';
                  FrmPesquisa.Caption := 'Notas Fiscais com Nro: ' + Edit_Nro_Nota.Text + ' e Série: ' + Edit_Ser_Nota.Text;
                  FrmPesquisa.Mensagem := 'Foram encontradas '+ FormatFloat('000',JvQuery.RecordCount) +' ocorrência(s) para Nota '''+ Edit_Nro_Nota.Text +''' Série '''+ Edit_Ser_Nota.Text +'''';
                  FrmPesquisa.Abrir_Conteudo := True;
                  if FrmPesquisa.ShowModal = mrOK then
                  begin
                     Operacao := opBrowse;
                     Carrega_Campos(FrmPesquisa.JvQuery);
                     //Edit_Controle_Prod.Value := FrmPesquisa.IBQuery1.FieldByName('Controle').asFloat;
                     //Edit_Controle_ProdExit(self);
                  end;
               finally
                  FrmPesquisa.Free;
               end;
            end
            else
            begin
               Operacao := opBrowse;
               SetStatus('Edição');
               Carrega_Campos(JvQuery);
            end;
         end
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Nro_Nota.Text := '000000';
      Edit_Ser_Nota.Text := 'NI';
   end;
end;

procedure TFrmVendasLen.PageCadastroChange(Sender: TObject);
begin
   BtnInclui.Enabled := True;
   BtnExclui.Enabled := True;
   BtnGrava.Enabled := True;
   BtnCancelar.Enabled := True;
   BtnImprimir.Enabled := True;
   SetStatus('Pesquisa');
   Case PageCadastro.ActivePageIndex of
      0: begin
            //Proc.BuildStoredProc('PROC_VENDAS');
            if StrToIntZero(Edit_Controle.Text) > 0 then
               SetStatus('Edição');
         end;
      1: begin
            //Proc.BuildStoredProc('PROC_VENDITEM');
            PanelCancelado_Prod.Visible := False;
            if StrToIntZero(Edit_Controle.Text) > 0 then
            begin
               BtnCancelarClick(Self);
               Edit_Controle_Prod.Text := Edit_Controle.Text;
               Edit_Controle_ProdExit(self);
            end;
         end;
      2: begin
            //Proc.BuildStoredProc('PROC_VENDITEM');
            PanelCancelado_Serv.Visible := False;
            if StrToIntZero(Edit_Controle.Text) > 0 then
            begin
               BtnCancelarClick(Self);
               Edit_Controle_Serv.Text := Edit_Controle.Text;
               Edit_Controle_ServExit(self);
            end;
         end;
      3: begin
            BtnInclui.Enabled := False;
            BtnExclui.Enabled := False;
            BtnGrava.Enabled := False;
            BtnCancelar.Enabled := False;
            BtnImprimir.Enabled := False;
            if StrToIntZero(Edit_Controle.Text) > 0 then
            begin
               Edit_Controle_Pag.Text := Edit_Controle.Text;
               Edit_Controle_PagExit(self);
            end;
         end;
   end;
end;

procedure TFrmVendasLen.PageCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmVendasLen.Msk_Dt_EmissEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99/99/9999;1;_';
      (Sender as TMaskEdit).SelStart := 0;
      if Operacao = opInsert then
      begin
         (Sender as TMaskEdit).Text := DateToStr(Date);
         (Sender as TMaskEdit).SelectAll;
      end;
   end;
end;

procedure TFrmVendasLen.Msk_Dt_EmissExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '/  /' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmVendasLen.Msk_Hr_SaidaEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '!99:99;1;_';
      (Sender as TMaskEdit).SelStart := 0;
      if Operacao = opInsert then
      begin
         (Sender as TMaskEdit).Text := TimeToStr(Time);
         (Sender as TMaskEdit).SelectAll;
      end;
   end;
end;

procedure TFrmVendasLen.Msk_Hr_SaidaExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = ':' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmVendasLen.Msk_PlacaEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := 'aaa-aaaa;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmVendasLen.Msk_PlacaExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '-' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmVendasLen.F3_CfopClick(Sender: TObject);
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
       //  Msk_CFOP.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Msk_CFOPExit(Msk_CFOP);
         Msk_CFOP.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.Edit_CliFornExit(Sender: TObject);
var oSelect : String;
   // JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_CliForn.Text)) <> 0) and (Trim(Edit_CliForn.Text) <> '0') then
   begin     {
       JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if Combo_Cli_Forn.ItemIndex = 0 then
            oSelect := 'Select Codigo, Nome from CLIENTES where Codigo='+ Edit_CliForn.Text
         else
            oSelect := 'Select Codigo, Nome from FORNECEDORES where Codigo='+ Edit_CliForn.Text;
         if not FrmPrincipal.RodaConsulta(oSelect,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCliForn.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg(Combo_Cli_Forn.Items[Combo_Cli_Forn.ItemIndex] + ' não cadastrado.',mtInformation,[mbOK],0);
            PanelCliForn.Caption := '';
            Edit_CliForn.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;  }
   end
   else
   begin
      Edit_CliForn.Text := '0';
      PanelCliForn.Caption := '';
   end;
end;

procedure TFrmVendasLen.F3_CliFornClick(Sender: TObject);
var oSelect : String;
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      if Combo_Cli_Forn.ItemIndex = 0 then
         oSelect := 'Clientes'
      else
         oSelect := 'Fornecedores';
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from ' + oSelect;
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := oSelect;
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  Edit_CliForn.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_CliFornExit(Self);
         Edit_CliForn.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.Msk_CFOPEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '9.999.9;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmVendasLen.Msk_CFOPExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   if (Trim((Sender as TMaskEdit).Text) = '.  .') or (Trim((Sender as TMaskEdit).Text) = '') then
   begin
      (Sender as TMaskEdit).EditMask := '';
      Msk_CFOP.Text := '';
      PanelCfop.Caption := '';
   end
   else
   begin
      { JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Descricao from CodFiscais where Codigo='''+ (Sender as TMaskEdit).Text +'''',JvQuery) then Exit;
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
      end;  }
   end;
end;

procedure TFrmVendasLen.Combo_Cli_FornExit(Sender: TObject);
begin
   if StrToIntZero(Edit_CliForn.Text) > 0 then
      Edit_CliFornExit(self); 
end;

procedure TFrmVendasLen.Edit_VendedorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Vendedor.Text)) <> 0) and (Trim(Edit_Vendedor.Text) <> '0') then
   begin
      { JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from Vendedores where Codigo='+ Edit_Vendedor.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelVendedor.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Vendedor não cadastrado.',mtInformation,[mbOK],0);
           PanelVendedor.Caption := '';
           Edit_Vendedor.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;   }
   end
   else
   begin
      Edit_Vendedor.Text := '0';
      PanelVendedor.Caption := '';
   end;
end;

procedure TFrmVendasLen.F3_VendedorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO, NOME from VENDEDORES ';
      FrmPesquisa.Indice_Inicial := 'Nome';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Vendedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  Edit_Vendedor.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_VendedorExit(Edit_Vendedor);
         Edit_Vendedor.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.Edit_TransportadorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Transportador.Text)) <> 0) and (Trim(Edit_Transportador.Text) <> '0') then
   begin     {
       JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from Transportador where Codigo='+ Edit_Transportador.Text,JvQuery) then Exit;
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
      end;    }
   end
   else
   begin
      Edit_Transportador.Text := '0';
      PanelTransportador.Caption := '';
   end;
end;

procedure TFrmVendasLen.Edit_Cod_ObservExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cod_Observ.Text)) <> 0) and (Trim(Edit_Cod_Observ.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, Descricao from Observacoes where Codigo='+ Edit_Cod_Observ.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelObserv.Caption := JvQuery.FieldByName('DESCRICAO').asString;
         end
         else
         begin
            MessageDlg('Observação não cadastrada.',mtInformation,[mbOK],0);
            PanelObserv.Caption := '';
            Edit_Cod_Observ.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Cod_Observ.Text := '0';
      PanelObserv.Caption := '';
   end;
end;

procedure TFrmVendasLen.F3_TransportadorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO, NOME from Transportador ';
      FrmPesquisa.Indice_Inicial := 'Nome';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Transportadoras';
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  Edit_Transportador.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_TransportadorExit(Edit_Transportador);
         Edit_Transportador.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.F3_ObservacaoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select Codigo, Descricao from  Observacoes';
      FrmPesquisa.Indice_Inicial := 'Descricao';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Observações';
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  Edit_Cod_Observ.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Cod_ObservExit(Edit_Cod_Observ);
         Edit_Cod_Observ.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.Action1Execute(Sender: TObject);
begin
   if Edit_CliForn.Focused then
      F3_CliFornClick(self)
   else if Msk_CFOP.Focused then
      F3_CfopClick(self)
   else if Edit_Vendedor.Focused then
      F3_VendedorClick(Self)
   else if Edit_Transportador.Focused then
      F3_TransportadorClick(self)
   else if Edit_Cod_Observ.Focused then
      F3_ObservacaoClick(Self)
   else if (Edit_Nro_Nota_Prod.Focused) or (Edit_Ser_Nota_Prod.Focused) then
      F3_Nota_ProdClick(self)
   else if (Edit_Produto.Focused) or (Edit_CodBarra.Focused) then
      F3_ProdutoClick(self)
   else if EditP_CliForn.Focused then
      F3_PCliFornClick(self)
   else if MskP_CFOP.Focused then
      F3_PCfopClick(self)
   else if EditP_Vendedor.Focused then
      F3_PVendedorClick(Self)
   else if EditP_Transportador.Focused then
      F3_PTransportadorClick(self)
   else if (Edit_Nro_Nota_Serv.Focused) or (Edit_Nro_Nota_Serv.Focused) then
      F3_Nota_ServClick(self)
   else if (Edit_Servico.Focused) then
      F3_ServicoClick(self);
end;

procedure TFrmVendasLen.Edit_Nro_NotaExit(Sender: TObject);
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
         Edit_Nro_Nota.Text := StrZero(StrToIntZero(Edit_Nro_Nota.Text),6,0);
   end;
end;

procedure TFrmVendasLen.Edit_Nro_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (not (Key in ['0'..'9','-',#8,#13,#35,#36,#37,#39])) then Key := #15;
end;

procedure TFrmVendasLen.Edit_Quant_ProdChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      if Trim((Sender as TEdit).Text) <> '' then
         Calcula_Total;
   end;
end;

procedure TFrmVendasLen.Calcula_Total;
var vl_Total, vl_Desc : Double;
begin
   vl_Total := 0; vl_Desc := 0;
   case PageCadastro.ActivePageIndex of
      1: begin
            if Parametros.VENDA_PESO_LIQ = 0 then
            begin
               vl_Total := (StrToFloatZero(Edit_Quant_Prod.Text) * StrToFloatZero(Edit_Vl_Unit_Prod.Text));
               vl_Desc := (vl_Total*(StrToFloatZero(Edit_Perc_Desc_prod.Text)/100));
               Panel_VLDesc_Prod.Caption := FormatFloat('#,###,###,##0.00',vl_Desc);
               vl_Total := vl_Total - vl_Desc;
               PanelTotal_Prod.Caption := FormatFloat('#,###,###,##0.00',vl_Total);
            end
            else
            begin
               vl_Total := (StrToFloatZero(Edit_Peso_Liq.Text) * StrToFloatZero(Edit_Vl_Unit_Prod.Text));
               vl_Desc := (vl_Total*(StrToFloatZero(Edit_Perc_Desc_prod.Text)/100));
               Panel_VLDesc_Prod.Caption := FormatFloat('#,###,###,##0.00',vl_Desc);
               vl_Total := vl_Total - vl_Desc;
               PanelTotal_Prod.Caption := FormatFloat('#,###,###,##0.00',vl_Total);
            end;
         end;
      2: begin
            vl_Total := (StrToFloatZero(Edit_Quant_Serv.Text) * StrToFloatZero(Edit_Vl_Unit_Serv.Text));
            vl_Desc := (vl_Total*(StrToFloatZero(Edit_Perc_Desc_Serv.Text)/100));
            Panel_VLDesc_Serv.Caption := FormatFloat('#,###,###,##0.00',vl_Desc);
            vl_Total := vl_Total - vl_Desc;
            PanelTotal_Serv.Caption := FormatFloat('#,###,###,##0.00',vl_Total);
         end;
   end;                    
end;

procedure TFrmVendasLen.Edit_ProdutoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Produto.Text)) <> 0) and (Trim(Edit_Produto.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, CodBarra, Nome, PRECO_VEND, CASAS_DECI_VALOR, CASAS_DECI_QTDE, REF_TECNICA from VW_PROD_GERAL where Codigo='+ Trim(Edit_Produto.Text) + ' AND TIPO <> 1 ',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_CodBarra.Text := JvQuery.FieldByName('CODBARRA').asString;
            Edit_CodBarra.Modified := False;
            Edit_Descr_Produto.Text := JvQuery.FieldByName('NOME').asString;
            //Busca casas decimais do Valor
            Edit_Quant_Prod.Text := Edit_Quant_Prod.Text;
            Edit_Vl_Unit_Prod.Text := JvQuery.FieldByName('PRECO_VEND').AsString;
            Memo_OBS_Prod.Lines.Text := JvQuery.FieldByName('REF_TECNICA').AsString;
            Calcula_Total;
         end
         else
         begin
            MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
            Edit_CodBarra.Text := '';
            Edit_Descr_Produto.Text := '';
            Edit_Vl_Unit_Prod.text := '0';
            Edit_Produto.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Produto.Text := '0';
      Edit_CodBarra.Text := '';
      Edit_Vl_Unit_Prod.Text := '0';
      Edit_Descr_Produto.Text := '';
   end;
end;

procedure TFrmVendasLen.F3_Nota_ProdClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT VENDAS.CONTROLE, VENDAS.NRO_NOTA NOTA, VENDAS.SER_NOTA SERIE, VENDAS.DT_EMISS EMISSAO, VENDAS.COD_CLIENTE, CLIENTES.NOME NOME_CLIENTE, VENDAS.COD_FORNEC, FORNECEDORES.NOME NOME_FORNECEDOR ';
      FrmPesquisa.Select := FrmPesquisa.Select + ' FROM VENDAS LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
      FrmPesquisa.Indice_Inicial := 'CONTROLE';
      FrmPesquisa.Campo_Retorno := 'CONTROLE';
      FrmPesquisa.Caption := 'Notas Fiscais';
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  Edit_Controle_Prod.Text := FrmPesquisa.JvQuery.FieldByName('CONTROLE').asString;
         Edit_Controle_ProdExit(Self);
         Edit_Controle_Prod.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.F3_ProdutoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'SELECT  CODIGO Codigo, CODBARRA Codigo_Barra, NOME Nome, SALDO_ATU Quantidade, PRECO_VEND VL_UNITARIO FROM VW_PROD_GERAL WHERE TIPO <> 1 order by Nome';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Produtos';
      if FrmPesquisa.ShowModal = mrOK then
      begin
         // Edit_Produto.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_ProdutoExit(Self);
        // Edit_Vl_Unit_Prod.Text := FrmPesquisa.JvQuery.FieldByName('VL_UNITARIO').AsString;
         Calcula_Total;
         Edit_Produto.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.Edit_CodBarraExit(Sender: TObject);
//var JvQuery : TJvUIBDataset;
begin
   if Edit_CodBarra.Modified = False then Exit;
   If (Length(Trim(Edit_CodBarra.Text)) <> 0) and (Trim(Edit_CodBarra.Text) <> '0') then
   begin        {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('SELECT CODIGO, NOME, PRECO_VEND FROM VW_PROD_GERAL WHERE TIPO <> 1 AND CODBARRA = '''+ Edit_CodBarra.Text + '''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_Produto.Text := JvQuery.FieldByName('CODIGO').AsString;
            Edit_Descr_Produto.Text := JvQuery.FieldByName('NOME').AsString;
            Edit_Vl_Unit_Prod.Text := JvQuery.FieldByName('PRECO_VEND').AsString;
            Calcula_Total;
         end
         else
         begin
            MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
            Edit_Produto.Text := '0';
            Edit_Descr_Produto.Text := '';
            Edit_CodBarra.SetFocus;
        end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;     }
   end
   else
   begin
      Edit_Produto.Text := '0';
      Edit_CodBarra.Text := '';
      Edit_Descr_Produto.Text := '';
   end;
end;

Procedure TFrmVendasLen.Carrega_Produtos(oControle: Integer);
begin             {
   with JvQry_Produtos do
   begin
      if oControle = 0 then
      begin
         Src_Produtos.DataSet := Nil;
         DBGrid_Prod.DataSource := Nil;
         Close;
      end
      else
      begin
         Src_Produtos.DataSet := Nil;
         DBGrid_Prod.DataSource := Nil;
         Close;
         Params.ByNameAsInteger['oControle'] := oControle;
         Open;
         FormatNumericFields(JvQry_Produtos);
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Produtos.DataSet := JvQry_Produtos;
            DBGrid_Prod.DataSource := Src_Produtos;
         end;
      end;
   end;          }
end;

Procedure TFrmVendasLen.Carrega_Servicos(oControle: Integer);
begin               {
   with JvQry_Servicos do
   begin
      if oControle = 0 then
      begin
         Src_Servicos.DataSet := Nil;
         DBGrid_Serv.DataSource := Nil;
         Close;
      end
      else
      begin
         Src_Servicos.DataSet := Nil;
         DBGrid_Serv.DataSource := Nil;
         Close;
         Params.ByNameAsInteger['oControle'] := oControle;
         Open;
         FormatNumericFields(JvQry_Servicos);
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Servicos.DataSet := JvQry_Servicos;
            DBGrid_Serv.DataSource := Src_Servicos;
         end;
      end;
   end;            }
end;

procedure TFrmVendasLen.Edit_Ser_Nota_ProdExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   if Trim(Edit_Nro_Nota_Prod.Text) <> '' then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Controle from Vendas where Nro_Nota='''+ Trim(Edit_Nro_Nota_Prod.Text)+''' and Ser_Nota='''+ Trim(Edit_Ser_Nota_Prod.Text)+''' ',JvQuery) then Exit;
         if JvQuery.RecordCount <= 0 then
         begin
            MessageDlg('Nota Fiscal não cadastrada.',mtInformation,[mbOK],0);
            Edit_Controle_Prod.Text := '0';
            Edit_Nro_Nota_Prod.SetFocus;
         end;
         JvQuery.Last;
         if JvQuery.RecordCount > 1 then
         begin
            FrmPesquisa := TFrmPesquisa.Create(self);
            try
               FrmPesquisa.Select := ' SELECT VENDAS.CONTROLE, VENDAS.DT_EMISS EMISSAO, VENDAS.COD_CLIENTE, CLIENTES.NOME NOME_CLIENTE, VENDAS.COD_FORNEC, FORNECEDORES.NOME NOME_FORNECEDOR ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' FROM VENDAS LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' WHERE NRO_NOTA = '''+ Trim(Edit_Nro_Nota_Prod.Text)+''' AND SER_NOTA='''+ Trim(Edit_Ser_Nota_Prod.Text)+'''';
               FrmPesquisa.Indice_Inicial := 'CONTROLE';
               FrmPesquisa.Campo_Retorno := 'CONTROLE';
               FrmPesquisa.Caption := 'Notas Fiscais com Nro: ' + Edit_Nro_Nota_Prod.Text + ' e Série: ' + Edit_Ser_Nota_Prod.Text;
               FrmPesquisa.Mensagem := 'Foram encontradas '+ FormatFloat('000',JvQuery.RecordCount) +' ocorrência(s) para Nota '''+ Edit_Nro_Nota_Prod.Text +''' Série '''+ Edit_Ser_Nota_Prod.Text +'''';
               FrmPesquisa.Abrir_Conteudo := True;
               if FrmPesquisa.ShowModal = mrOK then
               begin
                  Edit_Controle_Prod.Text := FrmPesquisa.JvQuery.FieldByName('Controle').AsString;
                  Edit_Controle_ProdExit(self);
               end;
            finally
               FrmPesquisa.Free;
            end;
         end
         else
         begin
            Edit_Controle_Prod.Text := JvQuery.FieldByName('Controle').AsString;
            Edit_Controle_ProdExit(self);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmVendasLen.Edit_Controle_ProdExit(Sender: TObject);
var oSelect : String;
//    JvQuery : TJvUIBDataset;
begin
   if (Length(Trim(Edit_Controle_Prod.Text)) > 0) and (StrToIntZero(Edit_Controle_Prod.Text) > 0) then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         oSelect := '';
         oSelect := 'SELECT VENDAS.CONTROLE, VENDAS.NRO_NOTA, VENDAS.SER_NOTA, VENDAS.CLI_FORN, VENDAS.COD_CLIENTE, VENDAS.COD_FORNEC, CLIENTES.NOME NOME_CLIENTE, FORNECEDORES.NOME NOME_FORNEC, VENDAS.DT_EMISS, VENDAS.CANCELADO FROM VENDAS ';
         oSelect := oSelect + 'LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) WHERE CONTROLE = ';

         if not FrmPrincipal.RodaConsulta(oSelect + Trim(Edit_Controle_Prod.Text),JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_Nro_Nota_Prod.Text := JvQuery.FieldByName('Nro_Nota').asString;
            Edit_Ser_Nota_Prod.Text := JvQuery.FieldByName('Ser_Nota').asString;
            PanelEmiss_Prod.Caption := JvQuery.FieldByName('Dt_Emiss').asString;
            if Trim(UpperCase(JvQuery.FieldByName('CLI_FORN').asString)) = 'CLIENTE' then
            begin
               LabelCli_Forn_Prod.Caption := 'Cliente';
               PanelCod_Cli_Prod.Caption := JvQuery.FieldByName('Cod_Cliente').asString;
               PanelNome_Cli_Prod.Caption := JvQuery.FieldByName('Nome_Cliente').asString;
            end
            else
            begin
               LabelCli_Forn_Prod.Caption := 'Fornecedor';
               PanelCod_Cli_Prod.Caption := JvQuery.FieldByName('Cod_Fornec').asString;
               PanelNome_Cli_Prod.Caption := JvQuery.FieldByName('Nome_Fornec').asString;
            end;
            PanelCancelado_Prod.Visible := IIF(JvQuery.FieldByName('CANCELADO').AsInteger = 1,True,False);
         end
         else
         begin
            MessageDlg('Nota Fiscal não cadastrada.',mtInformation,[mbOK],0);
            Edit_Controle_Prod.Text := '0';
            Edit_Nro_Nota_Prod.Text := '';
            Edit_Ser_Nota_Prod.Text := '';
            PanelEmiss_Prod.Caption := '';
            PanelCod_Cli_Prod.Caption := '';
            PanelNome_Cli_Prod.Caption := '';
            PanelCancelado_Prod.Visible := False;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Controle_Prod.Text := '0';
      Edit_Nro_Nota_Prod.Text := '';
      Edit_Ser_Nota_Prod.Text := '';
      PanelEmiss_Prod.Caption := '';
      PanelCod_Cli_Prod.Caption := '';
      PanelNome_Cli_Prod.Caption := '';
      PanelCancelado_Prod.Visible := False;
   end;
   Carrega_Produtos(StrToIntZero(Edit_Controle_Prod.Text));
end;

procedure TFrmVendasLen.DBGrid_ProdDblClick(Sender: TObject);
begin {
   with JvQry_Produtos do
   begin
      if not (Eof and Bof) then
      begin
         if Operacao = opBrowse then
         begin
            SetStatus('Edição');
            Edit_Controle_Prod.Text := FieldByName('CONTROLE').AsString;
            Edit_Seq_Prod.Text := FieldByName('SEQUENCIA').AsString;
            Edit_Produto.Text := FieldByName('COD_PRODUTO').AsString;
            Edit_ProdutoExit(Self);
            if Parametros.ALTERA_NOME_PROD = 1 then
               Edit_Descr_Produto.Text := FieldByName('DESCR_SERVICO').AsString;
            Edit_Quant_Prod.Text := FieldByName('QUANTIDADE').AsString;

            //Busca casas decimais do Valor

            Edit_Vl_Unit_Prod.Text := FieldByName('VL_UNITARIO').AsString;
            Edit_Perc_Desc_Prod.Text := FieldByName('PERC_DESC').AsString;
            Edit_Peso_Liq.Text := FieldByName('PESO_LIQUIDO').AsString;
            Memo_OBS_Prod.Lines.Text := FieldByName('OBSERVACAO').AsString;
            Calcula_Total;
            Edit_Quant_Prod.SetFocus;
         end;
      end;
   end; }
end;

procedure TFrmVendasLen.Edit_Nro_Nota_ProdExit(Sender: TObject);
begin
   if Length(Trim(Edit_Nro_Nota_Prod.Text)) > 0 then
   begin
      if not ValInteger(Edit_Nro_Nota_Prod.Text) then
      begin
         MessageDlg('Nota Fiscal deve ser um número inteiro válido.', mtInformation,[mbOK],0);
         Edit_Nro_Nota_Prod.SetFocus;
         Exit;
      end
      else
         Edit_Nro_Nota_Prod.Text := StrZero(StrToIntZero(Edit_Nro_Nota_Prod.Text),6,0);
   end;
end;

procedure TFrmVendasLen.Edit_Controle_ServExit(Sender: TObject);
var oSelect : String;
//    JvQuery : TJvUIBDataset;
begin
   if (Length(Trim(Edit_Controle_Serv.Text)) > 0) and (StrToIntZero(Edit_Controle_Serv.Text) > 0) then
   begin {
      oSelect := '';
      oSelect := 'SELECT VENDAS.CONTROLE, VENDAS.NRO_NOTA, VENDAS.SER_NOTA, VENDAS.CLI_FORN, VENDAS.COD_CLIENTE, VENDAS.COD_FORNEC, CLIENTES.NOME NOME_CLIENTE, FORNECEDORES.NOME NOME_FORNEC, VENDAS.DT_EMISS, VENDAS.CANCELADO FROM VENDAS ';
      oSelect := oSelect + 'LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) WHERE CONTROLE = ';

      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta(oSelect + Trim(Edit_Controle_Serv.Text),JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_Nro_Nota_Serv.Text := JvQuery.FieldByName('Nro_Nota').asString;
            Edit_Ser_Nota_Serv.Text := JvQuery.FieldByName('Ser_Nota').asString;
            PanelEmiss_Serv.Caption := JvQuery.FieldByName('Dt_Emiss').asString;
            if Trim(UpperCase(JvQuery.FieldByName('CLI_FORN').asString)) = 'CLIENTE' then
            begin
               LabelCli_Forn_Serv.Caption := 'Cliente';
               PanelCod_Cli_Serv.Caption := JvQuery.FieldByName('Cod_Cliente').asString;
               PanelNome_Cli_Serv.Caption := JvQuery.FieldByName('Nome_Cliente').asString;
            end
            else
            begin
               LabelCli_Forn_Serv.Caption := 'Fornecedor';
               PanelCod_Cli_Serv.Caption := JvQuery.FieldByName('Cod_Fornec').asString;
              PanelNome_Cli_Serv.Caption := JvQuery.FieldByName('Nome_Fornec').asString;
            end;
            PanelCancelado_Serv.Visible := IIF(JvQuery.FieldByName('CANCELADO').AsInteger = 1,True,False);
         end
         else
         begin
            MessageDlg('Nota Fiscal não cadastrada.',mtInformation,[mbOK],0);
            Edit_Controle_Serv.Text := '0';
            Edit_Nro_Nota_Serv.Text := '';
            Edit_Ser_Nota_Serv.Text := '';
            PanelEmiss_Serv.Caption := '';
            PanelCod_Cli_Serv.Caption := '';
            PanelNome_Cli_Serv.Caption := '';
            PanelCancelado_Serv.Visible := False;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Controle_Serv.Text := '0';
      Edit_Nro_Nota_Serv.Text := '';
      Edit_Ser_Nota_Serv.Text := '';
      PanelEmiss_Serv.Caption := '';
      PanelCod_Cli_Serv.Caption := '';
      PanelNome_Cli_Serv.Caption := '';
      PanelCancelado_Serv.Visible := False;
   end;
   Carrega_Servicos(StrToIntZero(Edit_Controle_Serv.Text));
end;

procedure TFrmVendasLen.Edit_Nro_Nota_ServExit(Sender: TObject);
begin
   if Length(Trim(Edit_Nro_Nota_Serv.Text)) > 0 then
   begin
      if not ValInteger(Edit_Nro_Nota_Serv.Text) then
      begin
         MessageDlg('Nota Fiscal deve ser um número inteiro válido.', mtInformation,[mbOK],0);
         Edit_Nro_Nota_Serv.SetFocus;
         Exit;
      end
      else
         Edit_Nro_Nota_Serv.Text := StrZero(StrToIntZero(Edit_Nro_Nota_Serv.Text),6,0);
   end;
end;

procedure TFrmVendasLen.Edit_Ser_Nota_ServExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   if Trim(Edit_Nro_Nota_Serv.Text) <> '' then
   begin  {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Controle from Vendas where Nro_Nota='''+ Trim(Edit_Nro_Nota_Serv.Text)+''' and Ser_Nota='''+ Trim(Edit_Ser_Nota_Serv.Text)+'''',JvQuery) then Exit;
         if JvQuery.RecordCount <= 0 then
         begin
            MessageDlg('Nota Fiscal não cadastrada.',mtInformation,[mbOK],0);
            Edit_Controle_Serv.Text := '0';
            Edit_Nro_Nota_Serv.SetFocus;
         end;
         JvQuery.Last;
         if JvQuery.RecordCount > 1 then
         begin
            FrmPesquisa := TFrmPesquisa.Create(self);
            try
               FrmPesquisa.Select := ' SELECT VENDAS.CONTROLE, VENDAS.DT_EMISS, VENDAS.COD_CLIENTE, CLIENTES.NOME , VENDAS.COD_FORNEC, FORNECEDORES.NOME  ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' FROM VENDAS LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' WHERE NRO_NOTA = '''+ Trim(Edit_Nro_Nota_Serv.Text)+''' AND SER_NOTA='''+ Trim(Edit_Ser_Nota_Serv.Text)+'''';
               FrmPesquisa.Indice_Inicial := 'CONTROLE';
               FrmPesquisa.Campo_Retorno := 'CONTROLE';
               FrmPesquisa.Caption := 'Notas Fiscais com Nro: ' + Edit_Nro_Nota_Serv.Text + ' e Série: ' + Edit_Ser_Nota_Serv.Text;
               FrmPesquisa.Mensagem := 'Foram encontradas '+ FormatFloat('000',JvQuery.RecordCount) +' ocorrência(s) para Nota '''+ Edit_Nro_Nota_Serv.Text +''' Série '''+ Edit_Ser_Nota_Serv.Text +'''';
               FrmPesquisa.Abrir_Conteudo := True;
               if FrmPesquisa.ShowModal = mrOK then
               begin
                  Edit_Controle_Serv.Text := FrmPesquisa.JvQuery.FieldByName('Controle').AsString;
                  Edit_Controle_ServExit(self);
               end;
            finally
               FrmPesquisa.Free;
            end;
         end
         else
         begin
            Edit_Controle_Serv.Text := JvQuery.FieldByName('Controle').AsString;
            Edit_Controle_ServExit(self);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;   }
   end;
end;

procedure TFrmVendasLen.Edit_ServicoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Servico.Text)) <> 0) and (Trim(Edit_Servico.Text) <> '0') then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('SELECT CODIGO, NOME, PRECO_VEND, CASAS_DECI_VALOR, CASAS_DECI_QTDE, REF_TECNICA FROM VW_PROD_GERAL WHERE CODIGO = '+ Trim(Edit_Servico.Text) + ' AND TIPO = 1 ',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_Descr_Servico.Text := JvQuery.FieldByName('NOME').asString;
            //Busca casas decimais do Valor

            //Busca casas decimais da Quantidade

            Edit_Quant_Serv.Text := Edit_Quant_Serv.Text;
            Edit_Vl_Unit_Serv.Text := JvQuery.FieldByName('PRECO_VEND').AsString;
            Memo_OBS_Serv.Lines.Text := JvQuery.FieldByName('REF_TECNICA').AsString;
            Calcula_Total;
         end
         else
         begin
            MessageDlg('Serviço não cadastrado.',mtInformation,[mbOK],0);
            Edit_Descr_Servico.Text := '';
            Edit_Vl_Unit_Serv.Text := '0';
            Edit_Servico.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Servico.Text := '0';
      Edit_Descr_Servico.Text := '';
      Edit_Vl_Unit_Serv.Text := '0';
   end;
end;

procedure TFrmVendasLen.F3_ServicoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'SELECT CODIGO CODIGO, CODBARRA CODIGO_BARRA, NOME NOME, SALDO_ATU QUANTIDADE, PRECO_VEND VL_UNITARIO FROM VW_PROD_GERAL WHERE TIPO = 1 order by Nome';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Serviços';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Servico.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_ServicoExit(Self);
  //       Edit_Vl_Unit_Serv.Text := FrmPesquisa.JvQuery.FieldByName('VL_UNITARIO').AsString;
         Calcula_Total;
         Edit_Servico.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.F3_Nota_ServClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT VENDAS.CONTROLE, VENDAS.NRO_NOTA NOTA, VENDAS.SER_NOTA SERIE, VENDAS.DT_EMISS EMISSAO, VENDAS.COD_CLIENTE, CLIENTES.NOME NOME_CLIENTE, VENDAS.COD_FORNEC, FORNECEDORES.NOME NOME_FORNECEDOR ';
      FrmPesquisa.Select := FrmPesquisa.Select + ' FROM VENDAS LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
      FrmPesquisa.Indice_Inicial := 'CONTROLE';
      FrmPesquisa.Campo_Retorno := 'CONTROLE';
      FrmPesquisa.Caption := 'Notas Fiscais';
      if FrmPesquisa.ShowModal = mrOK then
      begin
    //     Edit_Controle_Serv.Text := FrmPesquisa.JvQuery.FieldByName('CONTROLE').asString;
         Edit_Controle_ServExit(Self);
         Edit_Controle_Serv.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.DBGrid_ServDblClick(Sender: TObject);
begin    {
   with JvQry_Servicos do
   begin
      if not (Eof and Bof) then
      begin
         if Operacao = opBrowse then
         begin
            Edit_Controle_Serv.Text := FieldByName('CONTROLE').AsString;
            Edit_Seq_Serv.Text := FieldByName('SEQUENCIA').AsString;
            Edit_Servico.Text := FieldByName('COD_PRODUTO').AsString;
            Edit_ServicoExit(Self);
            Edit_Descr_Servico.Text := FieldByName('DESCR_SERVICO').asString;
            //Busca casas decimais do Valor

            //Busca casas decimais da Quantidade

            Edit_Quant_Serv.Text := FieldByName('QUANTIDADE').AsString;
            Edit_Vl_Unit_Serv.Text := FieldByName('VL_UNITARIO').AsString;
            Edit_Perc_Desc_Serv.Text := FieldByName('PERC_DESC').AsString;
            Memo_OBS_Serv.Lines.Text := FieldByName('OBSERVACAO').AsString;
            Calcula_Total;
            Edit_Quant_Serv.SetFocus;
         end;
      end;
   end; }
end;

procedure TFrmVendasLen.BtnImprimirClick(Sender: TObject);
begin
   if PageCadastro.ActivePageIndex = 0 then
   begin
      if StrToInt(Edit_Controle.Text) <= 0 then
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
         if StrToIntZero(Edit_Controle_Prod.Text) <= 0 then
            PopupMenu1.Items[0].Enabled := False
         else
            //Se for Cupom Fiscal
            if Trim(Edit_Ser_Nota_Prod.Text) = 'CF' then
               PopupMenu1.Items[0].Enabled := False;

      if PageCadastro.ActivePageIndex = 2 then
         if StrToIntZero(Edit_Controle_Serv.Text) <= 0 then
            PopupMenu1.Items[0].Enabled := False
         else
            //Se for Cupom Fiscal
            if Trim(Edit_Ser_Nota_Serv.Text) = 'CF' then
               PopupMenu1.Items[0].Enabled := False;

      PopupMenu1.Items[2].Enabled := False;
   end;                               
   PopupMenu1.Popup(Left + BtnImprimir.Left + 5,Top + BtnImprimir.Height + 52 );
end;

procedure TFrmVendasLen.IBQry_PesCalcFields(DataSet: TDataSet);
begin

end;

procedure TFrmVendasLen.SBNotasClick(Sender: TObject);
begin
   EditP_Nro_Nota.Text := '000000';
   EditP_Ser_Nota.Text := 'NI';
end;

procedure TFrmVendasLen.BitBtn5Click(Sender: TObject);
var vOrd : String;
begin
   if RB_Cresc.Checked then
      vOrd := 'Crescente'
   else
      vOrd := 'Decrescente';
   ListOrdem.Items.Add(ComboCampo_Ord.Items[ComboCampo_Ord.ItemIndex] + ' ' + vOrd);
end;

procedure TFrmVendasLen.BitBtn6Click(Sender: TObject);
begin
   ListOrdem.Items.Delete(ListOrdem.ItemIndex);
end;

procedure TFrmVendasLen.BitBtn1Click(Sender: TObject);
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

procedure TFrmVendasLen.BitBtn2Click(Sender: TObject);
begin
   ListCriterios.Items.Delete(ListCriterios.ItemIndex);
end;

procedure TFrmVendasLen.MskP_CFOPExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   if (Trim((Sender as TMaskEdit).Text) = '.  .') or (Trim((Sender as TMaskEdit).Text) = '') then
   begin
      (Sender as TMaskEdit).EditMask := '';
      MskP_CFOP.Text := '';
      PanelPCfop.Caption := '';
   end
   else
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Descricao from CodFiscais where Codigo='''+ MskP_CFOP.Text +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPCfop.Caption := JvQuery.FieldByName('Descricao').asString;
         end
         else
         begin
            MessageDlg('Código Fiscal não cadastrado.',mtInformation,[mbOK],0);
            PanelPCfop.Caption := '';
            MskP_CFOP.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmVendasLen.EditP_CliFornExit(Sender: TObject);
var oSelect : String;
//    JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(EditP_CliForn.Text)) <> 0) and (Trim(EditP_CliForn.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if ComboP_Cli_Forn.ItemIndex = 0 then
            oSelect := 'Select Codigo, Nome from CLIENTES where Codigo='+ EditP_CliForn.Text + ' '
         else
            oSelect := 'Select Codigo, Nome from FORNECEDORES where Codigo='+ EditP_CliForn.Text + ' ';

         if not FrmPrincipal.RodaConsulta(oSelect,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPCliForn.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg(ComboP_Cli_Forn.Items[ComboP_Cli_Forn.ItemIndex] + ' não cadastrado.',mtInformation,[mbOK],0);
            PanelPCliForn.Caption := '';
            EditP_CliForn.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      EditP_CliForn.Text := '0';
      PanelPCliForn.Caption := '';
   end;
end;

procedure TFrmVendasLen.EditP_VendedorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(EditP_Vendedor.Text)) <> 0) and (Trim(EditP_Vendedor.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from Vendedores where Codigo='+ EditP_Vendedor.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPVendedor.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Vendedor não cadastrado.',mtInformation,[mbOK],0);
            PanelPVendedor.Caption := '';
            EditP_Vendedor.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      EditP_Vendedor.Text := '0';
      PanelPVendedor.Caption := '';
   end;
end;

procedure TFrmVendasLen.EditP_TransportadorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(EditP_Transportador.Text)) <> 0) and (Trim(EditP_Transportador.Text) <> '0') then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from Transportador where Codigo='+ EditP_Transportador.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPTransportador.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Transportador não cadastrado.',mtInformation,[mbOK],0);
            PanelPTransportador.Caption := '';
            EditP_Transportador.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      EditP_Transportador.Text := '0';
      PanelPTransportador.Caption := '';
   end;
end;

procedure TFrmVendasLen.F3_PCliFornClick(Sender: TObject);
var oSelect : String;
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      if ComboP_Cli_Forn.ItemIndex = 0 then
         oSelect := 'Clientes'
      else
         oSelect := 'Fornecedores';
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from ' + oSelect;
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := oSelect;
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         EditP_CliForn.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         EditP_CliFornExit(Self);
         EditP_CliForn.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.F3_PCfopClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, DESCRICAO as Descricao from CodFiscais';
      FrmPesquisa.Indice_Inicial := 'DESCRICAO';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Códigos Fiscais';
      if FrmPesquisa.ShowModal = mrOK then
      begin
         Msk_CFOPEnter(MskP_CFOP);
  //       MskP_CFOP.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         MskP_CFOPExit(MskP_CFOP);
         MskP_CFOP.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.F3_PVendedorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO, NOME from VENDEDORES ';
      FrmPesquisa.Indice_Inicial := 'Nome';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Vendedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
    //     EditP_Vendedor.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         EditP_VendedorExit(EditP_Vendedor);
         EditP_Vendedor.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.F3_PTransportadorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO, NOME from Transportador ';
      FrmPesquisa.Indice_Inicial := 'Nome';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Transportadoras';
      if FrmPesquisa.ShowModal = mrOK then
      begin
      //   EditP_Transportador.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         EditP_TransportadorExit(EditP_Transportador);
         EditP_Transportador.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.EditP_Nro_NotaExit(Sender: TObject);
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
         EditP_Nro_Nota.Text := StrZero(StrToIntZero(EditP_Nro_Nota.Text),6,0);
   end;
end;

Procedure TFrmVendasLen.Imprime_Nota(aNota, oControle, Cli_Forn: String);
var vCompr, osCampos, vCod_SitTrib_Padrao : String;
    I, J, vLinha, vColuna, CountLinha, CountColuna, LinhasOBS, Impressora : Integer;
////    JvQry_Cabec, JvQry_Corpo, JvQry_Dados, Qry : TJvUIBDataset;
//    JvExecuta : TJvUIBQuery;
    Linhas : TStringList;
begin
   if Trim(aNota) = '' then
   begin
      MessageDlg('Configuração da Nota Inválida!',mtWarning,[mbOk],0);
      exit;
   end;

//   PrintFast1.Preview := False;

{
   JvQry_Cabec := TJvUIBDataset.Create(self);
   try
      JvQry_Cabec.Database := Frmprincipal.Base;
      JvQry_Cabec.Transaction := Frmprincipal.Transaction;

      JvQry_Cabec.SQL.Clear;
      JvQry_Cabec.SQL.Add('Select * from DOCSCAPA where Nome = '''+ aNota +'''');
      JvQry_Cabec.Open;

      if (Trim(oControle) = '0') or (Trim(oControle) = '') then
      begin
         MessageDlg('Nota Inválida!',mtWarning,[mbOk],0);
         exit;
      end;

      //Configura a Impresora
      For I := Low(Impressoras) to High(Impressoras) do
         if Impressoras[I].Nome = JvQry_Cabec.FieldByName('IMPRPADRAO').asString then
            Impressora := I-1;
      Configura_Impressora(Impressora,PrintFast1);

      //Testa o número de Itens
      JvQry_Dados := TJvUIBDataSet.Create(self);
      try
         JvQry_Dados.Database := FrmPrincipal.Base;
         JvQry_Dados.Transaction := JvTransaction;
         FrmPrincipal.RodaConsulta('SELECT COUNT(*) FROM VENDITEM LEFT JOIN PRODUTOS ON (VENDITEM.COD_PRODUTO=PRODUTOS.CODIGO) WHERE CONTROLE = 5 AND PRODUTOS.TIPO =0',JvQry_Dados);
         if JvQry_Cabec.FieldByName('QT_LINHASPROD').AsInteger < JvQry_Dados.FieldByName('COUNT').AsInteger then
         begin
            MessageDlg('Quantidade de linhas da nota insuficiente.'+#13+'Linhas da Nota: '+JvQry_Cabec.FieldByName('QT_LINHASPROD').AsString+#13+'Número de produtos: '+ JvQry_Dados.FieldByName('COUNT').AsString,mtWarning,[mbOk],0);
            Exit;
         end;
      finally
         JvQry_Dados.Close;
         JvQry_Dados.Free;
      end;

      if JvTransaction.InTransaction then
         JvTransaction.RollbackRetaining
      else
         JvTransaction.StartTransaction;

      //Atualiza o numero e serie da nota
      JvExecuta := TJvUIBQuery.Create(self);
      try
         JvExecuta.DataBase := FrmPrincipal.base;
         JvExecuta.Transaction := JvTransaction;
         JvExecuta.BuildStoredProc('ATLZ_NRO_SER_NOTA');
         JvExecuta.Params.ByNameAsInteger['CONTROLE'] := StrToIntZero(oControle);
         FrmPrincipal.RodaSP(JvExecuta);
      finally
         JvExecuta.Free;
      end;

      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle + ';');

   //************************************  Valor em Extenso ******************************************
      JvQry_Corpo := TJvUIBDataSet.Create(self);
      try
         JvQry_Corpo.Database := FrmPrincipal.base;
         JvQry_Corpo.Transaction := FrmPrincipal.Transaction;
         JvQry_Corpo.SQL.Clear;
         JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ aNota +''' and UPPER(Tabela) = ''EXTENSO'' and UPPER(Imprimir) = ''SIM''');
         JvQry_Corpo.Open;
         JvQry_Corpo.First;
         if JvQry_Corpo.RecordCount > 0 then
         begin
            //Busca o valor para faze-lo extenso
            JvQry_Dados := TJvUIBDataset.Create(self);
            try
               JvQry_Dados.Database := FrmPrincipal.Base;
               JvQry_Dados.Transaction := JvTransaction;
               JvQry_Dados.SQL.Clear;
               JvQry_Dados.SQL.Add(' SELECT TOT_NOTA FROM VENDAS ');
               JvQry_Dados.SQL.Add(' WHERE VENDAS.CONTROLE='+oControle);
               JvQry_Dados.Open;
               try
                  MemoImpressao.Width := (JvQry_Cabec.FieldByName('VL_EXT_LARG').asInteger * 9);//para transformar pixels em caracteres
                  MemoImpressao.Lines.Clear;
                  MemoImpressao.Lines.Text := Extenso_Valor(JvQry_Dados.FieldByName('TOT_NOTA').asFloat);
                  For I := 0 to MemoImpressao.Lines.Count-1 do
                  begin
                     if (I+1) > JvQry_Cabec.FieldByName('VL_EXT_LINHAS').asInteger Then Break;
                     with Proc_Impressao do
                     begin
                        Params.ByNameAsInteger['POPER'] := 0;
                        Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                        Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger + I;
                        Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                        Params.ByNameAsString['PCONTEUDO'] := MemoImpressao.Lines[I];
                        Params.ByNameAsString['PMASCARA'] := '';
                        Execute;
                     end;
                     Proc_Impressao.Close(etmCommit);
                  end;
                  JvTransaction.CommitRetaining;
               except
                  JvTransaction.RollbackRetaining;
               end;
            finally
               JvQry_Dados.Close;
               JvQry_Dados.Free;
            end;
         end;
      finally
         JvQry_Corpo.close;
         JvQry_Corpo.Free;
      end;

   //**********************  Primeiro Coloca os campos que NAO vem de tabelas   ******************
      JvQry_Corpo := TJvUIBDataSet.Create(self);
      try
         JvQry_Corpo.Database := FrmPrincipal.base;
         JvQry_Corpo.Transaction := FrmPrincipal.Transaction;
         JvQry_Corpo.SQL.Clear;
         JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ aNota +''' and ((Tabela is NULL) or (Tabela = '''')) and UPPER(Imprimir) = ''SIM''');
         JvQry_Corpo.Open;
         JvQry_Corpo.First;
         try
            while not JvQry_Corpo.Eof do
            begin
               with Proc_Impressao do
               begin
                  Params.ByNameAsInteger['POPER'] := 0;
                  Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                  Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger;
                  Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;

                  if (Pos('NOTA SAÍDA', AnsiUpperCase(JvQry_Corpo.FieldByName('DESCRICAO').asString)) > 0) or
                     (Pos('NOTA ENTRADA', UpperCase(JvQry_Corpo.FieldByName('DESCRICAO').asString)) > 0) then
                  begin
                     if (Pos('NOTA SAÍDA', AnsiUpperCase(JvQry_Corpo.FieldByName('DESCRICAO').asString)) > 0) and
                        (Cli_Forn = 'Cliente') then
                        Params.ByNameAsString['CONTEUDO'] := JvQry_Corpo.FieldByName('CAMPO').asString;

                     if (Pos('NOTA ENTRADA', UpperCase(JvQry_Corpo.FieldByName('DESCRICAO').asString)) > 0) and
                        (Cli_Forn = 'Fornecedor') then
                        Params.ByNameAsString['PCONTEUDO'] := JvQry_Corpo.FieldByName('CAMPO').asString;
                  end
                  else
                     Params.ByNameAsString['PCONTEUDO'] := JvQry_Corpo.FieldByName('CAMPO').asString;

                  Params.ByNameAsString['PMASCARA'] := JvQry_Corpo.FieldByName('MASKVLR').asString;
                  Execute;
               end;
               Proc_Impressao.Close(etmCommit);
               JvQry_Corpo.Next;
            end;
            JvTransaction.CommitRetaining;
         except
            JvTransaction.RollbackRetaining;
         end;
      finally
         JvQry_Corpo.close;
         JvQry_Corpo.Free;
      end;

   //************************************** Vem de varias tabelas **************************************************************
      //Busca os CAMPOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
      JvQry_Corpo := TJvUIBDataSet.Create(self);
      try

         JvQry_Corpo.Database := FrmPrincipal.base;
         JvQry_Corpo.Transaction := FrmPrincipal.Transaction;
         JvQry_Corpo.SQL.Clear;
         JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ aNota +''' and UPPER(Tabela) IN (''PARAMETROS'',''VENDAS'',''TRANSPORTADOR'',''CODFISCAIS'',''VW_CLIENTES'',''OBSERVACOES'',''VENDEDORES'') and UPPER(Imprimir) = ''SIM''');
         JvQry_Corpo.Open;
         JvQry_Corpo.First;
         osCampos := '';
         while not JvQry_Corpo.Eof do
         begin
            if (JvQry_Corpo.FieldByName('TABELA').asString = 'VW_CLIENTES') and (Cli_Forn = 'Fornecedor') then
            begin
               osCampos := osCampos + 'FORNECEDORES' + '.'+JvQry_Corpo.FieldByName('CAMPO').asString+' as '+ 'CLIENTES' +'_'+JvQry_Corpo.FieldByName('CAMPO').asString+', '
            end
            else
               osCampos := osCampos + JvQry_Corpo.FieldByName('TABELA').asString+'.'+JvQry_Corpo.FieldByName('CAMPO').asString+' as '+JvQry_Corpo.FieldByName('TABELA').asString+'_'+JvQry_Corpo.FieldByName('CAMPO').asString+', ';
            JvQry_Corpo.Next;
         end;
         osCampos := Copy(osCampos,1,Length(osCampos)-2);
         //Busca os DADOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
         JvQry_Dados := TJvUIBDataset.Create(self);
         try
            JvQry_Dados.Database := FrmPrincipal.Base;
            JvQry_Dados.Transaction := JvTransaction;
            JvQry_Dados.SQL.Clear;
            //Alem dos campos do DocsItem busca tambem a Situação Tributaria do CFOP se Tiver, Sera usado nos produtos
            JvQry_Dados.SQL.Add(' SELECT '+ osCampos +',CODFISCAIS.COD_SITTRIB FROM PARAMETROS, VENDAS ');
            JvQry_Dados.SQL.Add(' LEFT JOIN TRANSPORTADOR ON (VENDAS.COD_TRANS = TRANSPORTADOR.CODIGO) ');
            JvQry_Dados.SQL.Add(' LEFT JOIN CODFISCAIS ON (VENDAS.CFOP = CODFISCAIS.CODIGO) ');
            if Cli_Forn = 'Cliente' then
               JvQry_Dados.SQL.Add(' LEFT JOIN VW_CLIENTES ON (VENDAS.COD_CLIENTE = VW_CLIENTES.CODIGO) ')
            else
               JvQry_Dados.SQL.Add(' LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) ');
            JvQry_Dados.SQL.Add(' LEFT JOIN OBSERVACOES ON (VENDAS.COD_OBSERV = OBSERVACOES.CODIGO) ');
            JvQry_Dados.SQL.Add(' LEFT JOIN VENDEDORES ON (VENDAS.COD_VENDEDOR = VENDEDORES.CODIGO) ');
            JvQry_Dados.SQL.Add(' WHERE VENDAS.CONTROLE=' + oControle);
            JvQry_Dados.Open;

            //Busca a Situação Tributaria Padrão do CFOP se Tiver
            vCod_SitTrib_Padrao := '';
            vCod_SitTrib_Padrao := Trim(JvQry_Dados.FieldByName('COD_SITTRIB').asString);

            //Faz um LOOP com os campos e dados
            JvQry_Corpo.First;
            try
               while not JvQry_Corpo.Eof do
               begin
                  if (AnsiUpperCase(JvQry_Corpo.FieldByName('CAMPO').asString) = 'DESCRICAO') and
                     (AnsiUpperCase(JvQry_Corpo.FieldByName('TABELA').asString) = 'OBSERVACOES') and
                     (JvQry_Cabec.FieldByName('OBS_LINHAS').asInteger <> 0)  then
                  begin
                     MemoImpressao.Width := (JvQry_Cabec.FieldByName('OBS_LARG').asInteger * 9);//para transformar pixels em caracteres
                     MemoImpressao.Lines.Clear;
                     MemoImpressao.Lines.Text := JvQry_Dados.FieldByName(JvQry_Corpo.FieldByName('TABELA').asString+'_'+JvQry_Corpo.FieldByName('CAMPO').asString).asString;
                     For I := 0 to MemoImpressao.Lines.Count-1 do
                     begin
                        if (I+1) > JvQry_Cabec.FieldByName('OBS_LINHAS').asInteger Then Break;
                        with Proc_Impressao do
                        begin
                           Params.ByNameAsInteger['POPER'] := 0;
                           Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                           Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger + I;
                           Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                           Params.ByNameAsString['PCONTEUDO'] := MemoImpressao.Lines[I];
                           Params.ByNameAsString['PMASCARA'] := '';
                           Execute;
                        end;
                        Proc_Impressao.Close(etmCommit);
                     end;
                     JvQry_Corpo.Next;
                  end
                  else
                  begin

                     with Proc_Impressao do
                     begin
                        Params.ByNameAsInteger['POPER'] := 0;
                        Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                        Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger;
                        Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                        Params.ByNameAsString['PCONTEUDO'] := JvQry_Dados.FieldByName(JvQry_Corpo.FieldByName('TABELA').asString+'_'+JvQry_Corpo.FieldByName('CAMPO').asString).asString;
                        Params.ByNameAsString['PMASCARA'] := JvQry_Corpo.FieldByName('MASKVLR').asString;
                        //Ajusta o TAMANHO, se Tiver
                        if JvQry_Corpo.FieldByName('TAMANHO').asInteger <> 0 then
                           Params.ByNameAsString['PCONTEUDO'] := AlinharStr(Params.ByNameAsString['PCONTEUDO'],JvQry_Corpo.FieldByName('TAMANHO').asInteger,'E');
                        Execute;
                     end;
                     Proc_Impressao.Close(etmCommit);
                     JvQry_Corpo.Next;
                  end;
               end;
               JvTransaction.CommitRetaining;
            except
               JvTransaction.RollbackRetaining;
            end;
         finally
            JvQry_Dados.Close;
            JvQry_Dados.Free;
         end;
      finally
         JvQry_Corpo.close;
         JvQry_Corpo.Free;
      end;
   //***********************************   Faturamento   ****************************************
      if JvQry_Cabec.FieldByName('IMPR_FAT').AsInteger = 1 then
      begin
         //Linhas
         vLinha := 0;  vColuna := 0;
         //Busca o que deve-se imprimir
         JvQry_Corpo := TJvUIBDataset.Create(self);
         try
            JvQry_Corpo.Database := FrmPrincipal.Base;
            JvQry_Corpo.Transaction := JvTransaction;

            JvQry_Corpo.SQL.Clear;
            JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ aNota +''' and Upper(Tabela) = ''CTASRECEBER'' and UPPER(Imprimir) = ''SIM''');
            JvQry_Corpo.Open;
            try
               //Busca os Dados
               JvQry_Dados := TJvUIBDataset.Create(self);
               try
                  JvQry_Dados.Database := FrmPrincipal.Base;
                  JvQry_Dados.Transaction := JvTransaction;
                  JvQry_Dados.SQL.Clear;
                  JvQry_Dados.SQL.Add('SELECT * FROM CTASRECEBER WHERE CTASRECEBER.CONTROLE = ' + oControle);
                  JvQry_Dados.Open;
                  JvQry_Dados.First;
                  CountColuna := 0; CountLinha := 0;
                  while not JvQry_Dados.Eof do
                  begin
                     JvQry_Corpo.First;
                     while not JvQry_Corpo.Eof do
                     begin
                        vColuna := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                        vLinha := JvQry_Corpo.FieldByName('LINHA').asInteger;
                        with Proc_Impressao do
                        begin
                           Params.ByNameAsInteger['POPER'] := 0;
                           Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                           Params.ByNameAsInteger['PLINHA'] := vLinha + CountLinha;
                           Params.ByNameAsInteger['PCOLUNA'] := vColuna + (CountColuna * JvQry_Cabec.FieldByName('FAT_ESPACO').asInteger)+3;
                           Params.ByNameAsString['PCONTEUDO'] := JvQry_Dados.FieldByName(JvQry_Corpo.FieldByName('CAMPO').asString).asString;
                           Params.ByNameAsString['PMASCARA'] := JvQry_Corpo.FieldByName('MASKVLR').asString;
                           //Ajusta o TAMANHO, se Tiver
                           if JvQry_Corpo.FieldByName('TAMANHO').asInteger <> 0 then
                              Params.ByNameAsString['PCONTEUDO'] := AlinharStr(Params.ByNameAsString['PCONTEUDO'],JvQry_Corpo.FieldByName('TAMANHO').asInteger,'E');
                           Execute;
                        end;
                        Proc_Impressao.Close(etmCommit);
                        JvQry_Corpo.Next;
                     end;
                     JvTransaction.CommitRetaining;
                     JvQry_Dados.Next;
                     Inc(CountColuna);
                     //Inc(CountColuna) := JvQry_Cabec.FieldByName('FAT_ESPACO').asInteger;
                     if CountColuna = JvQry_Cabec.FieldByName('FAT_COLUNAS').AsInteger then
                     begin
                        CountColuna := 0;
                        Inc(vLinha);
                        Inc(CountLinha);
                     end;

                     if (CountLinha+1) > JvQry_Cabec.FieldByName('FAT_LINHAS').AsInteger then
                        Break;
                  end;
               finally
                  JvQry_Dados.Close;
                  JvQry_Dados.Free;
               end;
            except
               JvTransaction.RollbackRetaining;
            end;
         finally
            JvQry_Corpo.close;
            JvQry_Corpo.Free;
         end;
      end;

      //**********************************   VendItem - Produtos   *********************************
      //DADOS
      //Busca os CAMPOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
      JvQry_Corpo := TJvUIBDataset.Create(self);
      try
         JvQry_Corpo.Database := FrmPrincipal.Base;
         JvQry_Corpo.Transaction := JvTransaction;

         JvQry_Corpo.SQL.Clear;
         JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ aNota +''' and UPPER(Tabela) IN (''VENDITEM'',''PRODUTOS'',''VW_VENDITEM'') and UPPER(Imprimir) = ''SIM''');
         JvQry_Corpo.Open;
         JvQry_Corpo.First;
         JvQry_Dados := TJvUIBDataset.Create(self);
         try
            JvQry_Dados.Database := FrmPrincipal.Base;
            JvQry_Dados.Transaction := JvTransaction;
            //Busca os DADOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
            osCampos := '';
            //Busca os campos do VENDITEM
            Qry := TJvUIBDataset.Create(Self);
            Try
               Qry.Database := FrmPrincipal.Base;
               Qry.Transaction := FrmPrincipal.Transaction;
               Qry.SQL.Clear;
               Qry.SQL.Add('Select * from VENDITEM where Controle = -1');
               Qry.Open;
               For I := 0 to Qry.FieldCount-1 do
               begin
                  osCampos := osCampos + 'VENDITEM.' + Qry.FieldDefs[I].Name + ', ';
               end;
            except
               Qry.Close;
               Qry.Free;
            end;
            //Busca os campos do VW_VENDITEM_NOTA_PROD
            Qry := TJvUIBDataset.Create(Self);
            Try
               Qry.Database := FrmPrincipal.Base;
               Qry.Transaction := FrmPrincipal.Transaction;
               Qry.SQL.Clear;
               Qry.SQL.Add('Select * from VW_VENDITEM_NOTA_PROD where Controle = -1');
               Qry.Open;
               For I := 0 to Qry.FieldCount-1 do
               begin
                  if (Qry.FieldDefs[I].Name <> 'CONTROLE') and
                     (Qry.FieldDefs[I].Name <> 'SEQUENCIA') then
                     osCampos := osCampos + 'VW_VENDITEM_NOTA_PROD.' + Qry.FieldDefs[I].Name + ', ';
               end;
            except
               Qry.Close;
               Qry.Free;
            end;
            //Busca os campos do PRODUTOS
            Qry := TJvUIBDataset.Create(Self);
            Try
               Qry.Database := FrmPrincipal.Base;
               Qry.Transaction := FrmPrincipal.Transaction;
               Qry.SQL.Clear;
               Qry.SQL.Add('Select * from PRODUTOS where Codigo = -1');
               Qry.Open;
               For I := 0 to Qry.FieldCount-1 do
               begin
                  osCampos := osCampos + 'PRODUTOS.' + Qry.FieldDefs[I].Name + ', ';
               end;
            except
               Qry.Close;
               Qry.Free;
            end;

            osCampos := Copy(osCampos,1,Length(osCampos)-2);

            JvQry_Dados.SQL.Clear;
            JvQry_Dados.SQL.Add(' SELECT '+ osCampos +' FROM VENDITEM ');
            if Cli_Forn = 'Cliente' then
               JvQry_Dados.SQL.Add(' INNER JOIN VW_VENDITEM_NOTA_PROD ON (VENDITEM.CONTROLE = VW_VENDITEM_NOTA_PROD.CONTROLE) AND (VENDITEM.SEQUENCIA = VW_VENDITEM_NOTA_PROD.SEQUENCIA) AND (VENDITEM.COD_PRODUTO = VW_VENDITEM_NOTA_PROD.COD_PROD) ')
            else
               JvQry_Dados.SQL.Add(' INNER JOIN VW_VENDITEM_DEVO_PROD ON (VENDITEM.CONTROLE = VW_VENDITEM_DEVO_PROD.CONTROLE) AND (VENDITEM.SEQUENCIA = VW_VENDITEM_DEVO_PROD.SEQUENCIA) AND (VENDITEM.COD_PRODUTO = VW_VENDITEM_DEVO_PROD.COD_PROD) ');
            JvQry_Dados.SQL.Add(' INNER JOIN PRODUTOS ON (VENDITEM.COD_PRODUTO = PRODUTOS.CODIGO) ');
            JvQry_Dados.SQL.Add(' WHERE VENDITEM.CONTROLE = ' + oControle + ' and Produtos.Tipo <> 1');
            JvQry_Dados.Open;
            JvQry_Dados.First;

            vLinha := 0;
            //Faz um LOOP com os campos e dados
            while not JvQry_Dados.Eof do
            begin
               JvQry_Corpo.First;
               try
                  while not JvQry_Corpo.Eof do
                  begin
                     //Testa se for o Campo do Complemento da Descricao dos produtos
                     if AnsiUpperCase(JvQry_Corpo.FieldByName('CAMPO').asString) = 'OBSERVACAO' then
                     begin
                        MemoImpressao.Width := (JvQry_Corpo.FieldByName('TAMANHO').asInteger * 9);//para transformar pixels em caracteres
                        MemoImpressao.Lines.Clear;
                        MemoImpressao.Lines.Text := JvQry_Dados.fieldbyname(JvQry_Corpo.FieldByName('CAMPO').asString).asString;;
                        For I := 0 to MemoImpressao.Lines.Count-1 do
                        begin
                           with Proc_Impressao do
                           begin
                              Params.ByNameAsInteger['POPER'] := 0;
                              Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                              Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger + vLinha;
                              Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                              Params.ByNameAsString['PCONTEUDO'] := MemoImpressao.Lines[I];
                              Params.ByNameAsString['PMASCARA'] := '';
                              Execute;
                           end;
                           Proc_Impressao.Close(etmCommit);
                           Inc(vLinha);
                        end;
                     end
                     else
                     begin
                        with Proc_Impressao do
                        begin
                           Params.ByNameAsInteger['POPER'] := 0;
                           Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                           Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger + vLinha;
                           Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                           //Situação Tributária Padrão da CFOP
                           if (vCod_SitTrib_Padrao <> '') and (Trim(JvQry_Corpo.FieldByName('CAMPO').asString) = 'COD_STRIB') then
                              Params.ByNameAsString['PCONTEUDO'] := vCod_SitTrib_Padrao
                           else
                           begin
                              Params.ByNameAsString['PCONTEUDO'] := JvQry_Dados.fieldbyname(JvQry_Corpo.FieldByName('CAMPO').asString).asString;
                           end;
                           Params.ByNameAsString['PMASCARA'] := JvQry_Corpo.FieldByName('MASKVLR').asString;
                           //Ajusta o TAMANHO, se Tiver
                           if JvQry_Corpo.FieldByName('TAMANHO').asInteger <> 0 then
                              Params.ByNameAsString['PCONTEUDO'] := AlinharStr(Params.ByNameAsString['PCONTEUDO'],JvQry_Corpo.FieldByName('TAMANHO').asInteger,'E');
                           Execute;
                        end;
                        Proc_Impressao.Close(etmCommit);
                     end;
                     JvQry_Corpo.Next;
                  end;
                  JvTransaction.CommitRetaining;
                  Inc(vLinha);
               except
                  JvTransaction.RollbackRetaining;
               end;
               JvQry_Dados.Next;
            end;
         finally
            JvQry_Dados.Close;
            JvQry_Dados.Free;
         end;
      finally
         JvQry_Corpo.close;
         JvQry_Corpo.Free;
      end;
   //**********************************   VendItem - SERVIÇOS   *********************************
      //DADOS
      //Busca os CAMPOS das Tabelas: * Serviços

      JvQry_Corpo := TJvUIBDataset.Create(self);
      try
         JvQry_Corpo.Database := FrmPrincipal.Base;
         JvQry_Corpo.Transaction := JvTransaction;

         JvQry_Corpo.SQL.Clear;
         JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ aNota +''' and UPPER(Tabela) = ''SERVIÇOS'' and UPPER(Imprimir) = ''SIM'' ORDER BY LINHA,COLUNA');
         JvQry_Corpo.Open;
         JvQry_Corpo.First;

         JvQry_Dados := TJvUIBDataset.Create(self);
         try
            JvQry_Dados.Database := FrmPrincipal.Base;
            JvQry_Dados.Transaction := JvTransaction;

            JvQry_Dados.SQL.Clear;
            JvQry_Dados.SQL.Add(' SELECT * FROM VENDITEM ');
            JvQry_Dados.SQL.Add(' INNER JOIN PRODUTOS ON (VENDITEM.COD_PRODUTO = PRODUTOS.CODIGO) ');
            JvQry_Dados.SQL.Add(' WHERE VENDITEM.CONTROLE = ' + oControle + ' and Produtos.Tipo = 1');
            JvQry_Dados.Open;
            JvQry_Dados.Last;
            JvQry_Dados.First;

            vLinha := 0;
            //Faz um LOOP com os campos e dados
            while not JvQry_Dados.Eof do
            begin
               JvQry_Corpo.First;
               try
                  while not JvQry_Corpo.Eof do
                  begin
                     //Testa se for o Campo do Complemento da Descricao dos produtos
                     if AnsiUpperCase(JvQry_Corpo.FieldByName('CAMPO').asString) = 'OBSERVACAO' then
                     begin
                        Linhas := TStringList.Create;
                        Try
                           Linhas.Text := WrapText(JvQry_Dados.fieldbyname(JvQry_Corpo.FieldByName('CAMPO').asString).asString, #13#10, ['.',' ',#9,'-'],JvQry_Corpo.FieldByName('TAMANHO').asInteger);
                           //MemoImpressao.Width := (JvQry_Corpo.FieldByName('TAMANHO').asInteger * 9);//para transformar pixels em caracteres
                           //MemoImpressao.Lines.Clear;
                           //MemoImpressao.Lines.Text := JvQry_Dados.fieldbyname(JvQry_Corpo.FieldByName('CAMPO').asString).asString;
                           For I := 0 to Linhas.Count-1 do
                           begin
                              with Proc_Impressao do
                              begin
                                 Params.ByNameAsInteger['POPER'] := 0;
                                 Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                                 Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger + vLinha;
                                 Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                                 Params.ByNameAsString['PCONTEUDO'] := Linhas[I];
                                 Params.ByNameAsString['PMASCARA'] := '';
                                 Execute;
                              end;
                              Proc_Impressao.Close(etmCommit);
                              Inc(vLinha);
                           end;
                        finally
                           Linhas.Free;
                        end;
                     end
                     else
                     begin
                        with Proc_Impressao do
                        begin
                           Params.ByNameAsInteger['POPER'] := 0;
                           Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                           Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger + vLinha;
                           Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                           //Situao Tributária Padrão da CFOP
                           if (vCod_SitTrib_Padrao <> '') and (Trim(JvQry_Corpo.FieldByName('CAMPO').asString) = 'COD_STRIB') then
                              Params.ByNameAsString['PCONTEUDO'] := vCod_SitTrib_Padrao
                           else
                              Params.ByNameAsString['PCONTEUDO'] := JvQry_Dados.fieldbyname(JvQry_Corpo.FieldByName('CAMPO').asString).asString;


                           Params.ByNameAsString['PMASCARA'] := JvQry_Corpo.FieldByName('MASKVLR').asString;
                           //Ajusta o TAMANHO, se Tiver
                           if JvQry_Corpo.FieldByName('TAMANHO').asInteger <> 0 then
                              Params.ByNameAsString['PCONTEUDO'] := AlinharStr(Params.ByNameAsString['CONTEUDO'],JvQry_Corpo.FieldByName('TAMANHO').asInteger,'E');
                           Execute;
                        end;
                        Proc_Impressao.Close(etmCommit);
                     end;
                     JvQry_Corpo.Next;
                  end;
                  JvTransaction.CommitRetaining;
                  Inc(vLinha);
               except
                  JvTransaction.RollbackRetaining;
               end;
               JvQry_Dados.Next;
            end;
         finally
            JvQry_Dados.Close;
            JvQry_Dados.Free;
         end;
      finally
         JvQry_Corpo.close;
         JvQry_Corpo.Free;
      end;

      PrintFast1.PageHeader := False;
      PrintFast1.IniciaImpr;
      //ConfImpr(Tabelas.T_ParametrosIMPRPADRAO.value,Tabelas.T_Impressoras,PrintFast1);

      if JvQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(JvQry_Cabec.FieldByName('LINHAS').asInteger));

      if JvQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo( p8LinPol);

      // aqui coloca a compressao escolhida no cadastro da nota
      vCompr := JvQry_Cabec.FieldByName('COMPRESSAO').asString;
      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(pElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(pCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(pCompr20);

      JvQry_Dados := TJvUIBDataset.Create(self);
      try
         JvQry_Dados.Database := FrmPrincipal.Base;
         JvQry_Dados.Transaction := JvTransaction;

         JvQry_Dados.SQL.Clear;
         JvQry_Dados.SQL.Add('Select * from IMPRESSAO where Controle = '+oControle+' order by Linha, Coluna');
         JvQry_Dados.Open;
         JvQry_Dados.First;
         while not JvQry_Dados.Eof do
         begin
            if JvQry_Dados.FieldByName('MASCARA').asString <> '' then
            begin
               if Trim(JvQry_Dados.FieldByName('Conteudo').asString) = '' then
                  PrintFast1.Say(JvQry_Dados.FieldByName('Linha').asInteger, JvQry_Dados.FieldByName('Coluna').asInteger,PrintFast1.MascaraVlr(JvQry_Dados.FieldByName('MASCARA').asString,0))
               else
                  PrintFast1.Say(JvQry_Dados.FieldByName('Linha').asInteger, JvQry_Dados.FieldByName('Coluna').asInteger,PrintFast1.MascaraVlr(JvQry_Dados.FieldByName('MASCARA').asString,StrToFloat(JvQry_Dados.FieldByName('Conteudo').asString)));
            end
            else
            begin
               PrintFast1.Say(JvQry_Dados.FieldByName('Linha').asInteger, JvQry_Dados.FieldByName('Coluna').asInteger,JvQry_Dados.FieldByName('Conteudo').asString);
            end;
            JvQry_Dados.Next;
         end;
      finally
         JvQry_Dados.Close;
         JvQry_Dados.Free;
      end;

      PrintFast1.ImprString('',' ',0,true);
      PrintFast1.Ejeta;

      if JvQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(t8LinPol);
      if JvQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(66));
   finally
      JvQry_Cabec.Close;
      JvQry_Cabec.Free;
   end;
   if vCompr = 'Elite 12'  then PrintFast1.ImprComo(tElite12);
   if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(tCompr175);
   if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(tCompr20);
   PrintFast1.FimImpr;

   // Deleta os Dados
   FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle + ';');
   }
end;

{procedure TFrmVendasLen.Grid_PesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if IBQry_Pes.FieldByName('CANCELADO').asInteger = 1 then
   begin
      Grid_Pesquisa.Canvas.Font.Color := clWhite;
      Grid_Pesquisa.Canvas.Brush.Color := clRed;
   end
   else
   begin
      Grid_Pesquisa.Canvas.Font.Color := clBlack;
      Grid_Pesquisa.Canvas.Brush.Color := clWhite;
   end;
   if gdFocused in State then
   begin
      Grid_Pesquisa.Canvas.Font.Color := clWhite;
      Grid_Pesquisa.Canvas.Brush.Color := clNavy;
   end;
   Grid_Pesquisa.DefaultDrawColumnCell(Rect,Datacol,Column,State);
end;}

procedure TFrmVendasLen.BtnPag_PrazoClick(Sender: TObject);
var I : Integer;
    Vlr_Pago : Double;
//    JvQry_Executa : TJvUIBQuery;
begin
   Edit_Controle_PagExit(Self);
            {
   if JvQry_Parcelas.RecordCount > 0 then
   begin
      JvQry_Parcelas.First;
      Vlr_Pago := 0;
      while not JvQry_Parcelas.Eof do
      begin
         Vlr_Pago := Vlr_Pago + JvQry_Parcelas.FieldByName('VL_PAGTO').asFloat;
         JvQry_Parcelas.Next;
      end;
      if Vlr_Pago > 0 then
      begin
         MessageDlg('Parcelamento já possui valores pagos. Impossível nova geração.',mtWarning,[mbOK],0);
         Exit;
      end
      else
      begin
         if MessageDlg('Esta venda já possui parcelas geradas.'+ #13 +'Deseja parcelar novamente?',mtConfirmation,[mbyes,mbno],0) = mrno then
            Exit;
      end;
   end;
   FrmGeraParcelas := TFrmGeraParcelas.Create(self);
   with FrmGeraParcelas do
   begin
      Compra_Venda := 'VENDA';
      Valor_Total := StrToFloatZero(TirarPonto(PanelValor.Caption));
      Emissao := Date;
      Nota := Edit_Nro_Nota_Pag.Text;
      if ShowModal = mrok then
      begin
         //Inclui as parcelas
         if JvTransaction.InTransaction then
            JvTransaction.Rollback;
         JvTransaction.StartTransaction;
         try
            //Exclui as parcelas velhas  
            JvQry_Executa := TJvUIBQuery.Create(self);
            try
               JvQry_Executa.DataBase := FrmPrincipal.base;
               JvQry_Executa.Transaction := JvTransaction;
               
               JvQry_Executa.SQL.Clear;
               JvQry_Executa.SQL.Add('Delete from CtasReceber where controle = '+Trim(Edit_Controle_Pag.Text));
               JvQry_Executa.Prepare;
               JvQry_Executa.ExecSQL;
            finally
               JvQry_Executa.Close;
               JvQry_Executa.Free;
            end;

            For I := 1 to StringGrid1.RowCount-1 do
            begin
               JvProc_Venda_Prazo.Params.ByNameAsInteger['OCONTROLE'] := StrToIntZero(Edit_Controle_Pag.Text);
               JvProc_Venda_Prazo.Params.ByNameAsInteger['AFORMAPAGTO'] := StrToIntZero(Edit_Forma.Text);
               JvProc_Venda_Prazo.Params.ByNameAsString['ODOCUMENTO'] := StringGrid1.Cells[1,I];
               JvProc_Venda_Prazo.Params.ByNameAsDateTime['OVENCIMENTO'] := StrToDate(StringGrid1.Cells[2,I]);
               JvProc_Venda_Prazo.Params.ByNameAsCurrency['OVALOR'] := StrToFloatZero(TirarPonto(StringGrid1.Cells[3,I]));
               if (Trim(StringGrid1.Cells[4,I]) = '') or (StrToIntZero(StringGrid1.Cells[4,I]) = 0) then
                  JvProc_Venda_Prazo.Params.ByNameIsNull['OBANCO'] := True
               else
                  JvProc_Venda_Prazo.Params.ByNameAsInteger['OBANCO'] := StrToIntZero(StringGrid1.Cells[4,I]);
               JvProc_Venda_Prazo.Params.ByNameAsString['ONRO_CHEQUE'] := Trim(StringGrid1.Cells[5,I]);
               JvProc_Venda_Prazo.Params.ByNameAsString['OEMITENTE'] := Trim(StringGrid1.Cells[6,I]);
               JvProc_Venda_Prazo.Execute;
            end;
            JvTransaction.Commit;
         except
            On E:Exception do
            begin
               FrmPrincipal.TrataErro(E);
               JvTransaction.RollbackRetaining;
            end;
         end;     
      end;
      Edit_Controle_PagExit(Self);
   end;    }
   FrmGeraParcelas.Free;
end;

procedure TFrmVendasLen.Edit_Nro_Nota_PagExit(Sender: TObject);
begin
   if Length(Trim(Edit_Nro_Nota_Pag.Text)) > 0 then
   begin
      if not ValInteger(Edit_Nro_Nota_Pag.Text) then
      begin
         MessageDlg('Nota Fiscal deve ser um número inteiro válido.', mtInformation,[mbOK],0);
         Edit_Nro_Nota_Pag.SetFocus;
         Exit;
      end
      else
         Edit_Nro_Nota_Pag.Text := StrZero(StrToIntZero(Edit_Nro_Nota_Pag.Text),6,0);
   end;
end;

procedure TFrmVendasLen.Edit_Ser_Nota_PagExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   if Trim(Edit_Nro_Nota_Pag.Text) <> '' then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Controle from Vendas where Nro_Nota='''+ Trim(Edit_Nro_Nota_Pag.Text)+''' and Ser_Nota='''+ Trim(Edit_Ser_Nota_Pag.Text)+'''',JvQuery) then Exit;
         if JvQuery.RecordCount <= 0 then
         begin
            MessageDlg('Nota Fiscal não cadastrada.',mtInformation,[mbOK],0);
            Edit_Controle_Pag.text := '0';
            Edit_Nro_Nota_Pag.SetFocus;
         end;
         JvQuery.Last;
         if JvQuery.RecordCount > 1 then
         begin
            FrmPesquisa := TFrmPesquisa.Create(self);
            try
               FrmPesquisa.Select := ' SELECT VENDAS.CONTROLE, VENDAS.DT_EMISS, VENDAS.COD_CLIENTE, CLIENTES.NOME , VENDAS.COD_FORNEC, FORNECEDORES.NOME, (VENDAS.TOT_NOTA - VENDAS.VLR_PAGO_D) AS SALDO  ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' FROM VENDAS LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' WHERE NRO_NOTA = '''+ Trim(Edit_Nro_Nota_Pag.Text)+''' AND SER_NOTA='''+ Trim(Edit_Ser_Nota_Pag.Text)+'''';
               FrmPesquisa.Indice_Inicial := 'CONTROLE';
               FrmPesquisa.Campo_Retorno := 'CONTROLE';
               FrmPesquisa.Caption := 'Notas Fiscais com Nro: ' + Edit_Nro_Nota_Pag.Text + ' e Série: ' + Edit_Ser_Nota_Pag.Text;
               FrmPesquisa.Mensagem := 'Foram encontradas '+ FormatFloat('000',JvQuery.RecordCount) +' ocorrência(s) para Nota '''+ Edit_Nro_Nota_Pag.Text +''' Série '''+ Edit_Ser_Nota_Pag.Text +'''';
               FrmPesquisa.Abrir_Conteudo := True;
               if FrmPesquisa.ShowModal = mrOK then
               begin
                  Edit_Controle_Pag.Text := FrmPesquisa.JvQuery.FieldByName('Controle').AsString;
                  Edit_Controle_PagExit(self);
               end;
            finally
               FrmPesquisa.Free;
            end;
         end
         else
         begin
            Edit_Controle_Pag.text := JvQuery.FieldByName('Controle').AsString;
            Edit_Controle_PagExit(self);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;   }
   end;
end;

procedure TFrmVendasLen.F3_Nota_PagClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT VENDAS.CONTROLE, VENDAS.NRO_NOTA NOTA, VENDAS.SER_NOTA SERIE, VENDAS.DT_EMISS EMISSAO, VENDAS.COD_CLIENTE, CLIENTES.NOME NOME_CLIENTE, VENDAS.COD_FORNEC, FORNECEDORES.NOME NOME_FORNECEDOR ';
      FrmPesquisa.Select := FrmPesquisa.Select + ' FROM VENDAS LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
      FrmPesquisa.Indice_Inicial := 'CONTROLE';
      FrmPesquisa.Campo_Retorno := 'CONTROLE';
      FrmPesquisa.Caption := 'Notas Fiscais';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//          Edit_Controle_Pag.Text := FrmPesquisa.JvQuery.FieldByName('CONTROLE').asString;
         Edit_Controle_PagExit(Self);
         Edit_Controle_Pag.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

Procedure TFrmVendasLen.Carrega_Parcelas(oControle: Integer);
begin {
   with JvQry_Parcelas do
   begin
      if oControle = 0 then
      begin
         Src_Parcelas.DataSet := Nil;
         DBGrid_Parcelas.DataSource := Nil;
         Close;
      end
      else
      begin
         Src_Parcelas.DataSet := Nil;
         DBGrid_Parcelas.DataSource := Nil;
         Close;
         Params.ByNameAsInteger['oControle'] := oControle;
         Open;
         FormatNumericFields(JvQry_Parcelas);
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Parcelas.DataSet := JvQry_Parcelas;
            DBGrid_Parcelas.DataSource := Src_Parcelas;
         end;
      end;
   end; }
end;



procedure TFrmVendasLen.Edit_Controle_PagExit(Sender: TObject);
var oSelect : String;
//     JvQuery : TJvUIBDataset;
begin
   if (Length(Trim(Edit_Controle_Pag.Text)) > 0) and (StrToIntZero(Edit_Controle_Pag.Text) > 0) then
   begin        {
      oSelect := '';
      oSelect := 'SELECT VENDAS.CONTROLE,VENDAS.NRO_NOTA,VENDAS.SER_NOTA,VENDAS.CLI_FORN,VENDAS.COD_CLIENTE, ';
      oSelect := oSelect + ' VENDAS.COD_FORNEC,CLIENTES.NOME NOME_CLIENTE,FORNECEDORES.NOME NOME_FORNEC,VENDAS.CFOP,CODFISCAIS.TIPO, ';
      oSelect := oSelect + ' VENDAS.DT_EMISS,VENDAS.CANCELADO,VENDAS.TOT_SERV,VENDAS.TOT_NOTA,VENDAS.VLR_PAGO_D,VENDAS.TROCO, VENDAS.VL_DESC, VENDAS.VLR_ACRE FROM VENDAS ';
      oSelect := oSelect + ' LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) ';
      oSelect := oSelect + ' LEFT JOIN CODFISCAIS ON (VENDAS.CFOP = CODFISCAIS.CODIGO) WHERE CONTROLE = ';
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta(oSelect + Trim(Edit_Controle_Pag.Text),JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_Nro_Nota_Pag.Text := JvQuery.FieldByName('Nro_Nota').asString;
            Edit_Ser_Nota_Pag.Text := JvQuery.FieldByName('Ser_Nota').asString;
            PanelEmiss_Pag.Caption := JvQuery.FieldByName('Dt_Emiss').asString;
            if JvQuery.FieldByName('TIPO').asInteger = 4 then
               PanelValor.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_SERV').asFloat - JvQuery.FieldByName('VL_DESC').asFloat + JvQuery.FieldByName('VLR_ACRE').asFloat)
            else
               PanelValor.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('TOT_NOTA').asFloat);
            if Trim(UpperCase(JvQuery.FieldByName('CLI_FORN').asString)) = 'CLIENTE' then
            begin
               LabelCli_Forn_Pag.Caption := 'Cliente';
               PanelCod_Cli_Pag.Caption := JvQuery.FieldByName('Cod_Cliente').asString;
               PanelNome_Cli_Pag.Caption := JvQuery.FieldByName('Nome_Cliente').asString;
            end
            else
            begin
               LabelCli_Forn_Pag.Caption := 'Fornecedor';
               PanelCod_Cli_Pag.Caption := JvQuery.FieldByName('Cod_Fornec').asString;
               PanelNome_Cli_Pag.Caption := JvQuery.FieldByName('Nome_Fornec').asString;
            end;
            PanelCancelado_Pag.Visible := IIF(JvQuery.FieldByName('CANCELADO').AsInteger = 1,True,False);
            BtnPag_Vista.Enabled := True;
            BtnPag_Prazo.Enabled := True;
         end
         else
         begin
            MessageDlg('Nota Fiscal não cadastrada.',mtInformation,[mbOK],0);
            Edit_Controle_Pag.text := '0';
            Edit_Nro_Nota_Pag.Text := '';
            Edit_Ser_Nota_Pag.Text := '';
            PanelEmiss_Pag.Caption := '';
            PanelValor.Caption := '0,00';
            PanelCod_Cli_Pag.Caption := '';
            PanelNome_Cli_Pag.Caption := '';
            PanelCancelado_Pag.Visible := False;
            BtnPag_Vista.Enabled := False;
            BtnPag_Prazo.Enabled := False;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;     }
   end
   else
   begin
      Edit_Controle_Pag.Text := '0';
      Edit_Nro_Nota_Pag.Text := '';
      Edit_Ser_Nota_Pag.Text := '';
      PanelEmiss_Pag.Caption := '';
      PanelCod_Cli_Pag.Caption := '';
      PanelNome_Cli_Pag.Caption := '';
      PanelCancelado_Pag.Visible := False;
      BtnPag_Vista.Enabled := False;
      BtnPag_Prazo.Enabled := False;
   end;
   Carrega_Parcelas(StrToIntZero(Edit_Controle_Pag.Text));
end;


procedure TFrmVendasLen.BtnPag_VistaClick(Sender: TObject);
begin
   Edit_Controle_PagExit(Self);
   {
   if JvTransaction.InTransaction then
      JvTransaction.Rollback;
   JvTransaction.StartTransaction;
   try
      JvProc_Venda_Vista.Params.ByNameAsInteger['OCONTROLE'] := StrToInt(Edit_Controle_Pag.Text);
      JvProc_Venda_Vista.Execute;
      JvTransaction.Commit;
   except
      On E:Exception do
      begin
         ShowMessage(E.Message);
         JvTransaction.RollbackRetaining;
      end;
   end;     }
   Edit_Controle_PagExit(Self);
end;

{Procedure TFrmVendasLen.Imprime_Duplicata(Conf_Duplic, oControle: String);
var vCompr, osCampos, vCod_SitTrib_Padrao : String;
    I,J,vLinha,vColuna, CountLinha, CountColuna, LinhasProd : Integer;
begin
   if (Trim(oControle) = '0') or (Trim(oControle) = '') then
   begin
      MessageDlg('Nota Inválida!',mtWarning,[mbOk],0);
      exit;
   end;

   IBQry_Cabec.SQL.Clear;
   IBQry_Cabec.SQL.Add('Select * from DOCSCAPA where Nome = '''+ Conf_Duplic +'''');
   if not IBQry_Cabec.Prepared then IBQry_Cabec.Prepare;
   IBQry_Cabec.Open;

   if (IBQry_Cabec.EOF) and (IBQry_Cabec.BOF) then
   begin
      MessageDlg('Configuração de Documento Inválida!',mtWarning,[mbOk],0);
      exit;
   end;


//********************************Começa o Laco das parcelas ************************************
   IBQry_Parcelas.First;
   while not IBQry_Parcelas.Eof do
   begin

      if IBTransaction1.InTransaction then
         IBTransaction1.RollbackRetaining
      else
         IBTransaction1.StartTransaction;
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle,IBQry_Corpo);
      IBDataSet1.Active := False;
      IBDataSet1.Params[0].AsInteger := StrToInt(oControle);
      IBDataSet1.Active := True;

      //************************************  Valor em Extenso ******************************************
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Duplic +''' and UPPER(Tabela) = ''EXTENSO'' and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      if not (IBQry_Corpo.Eof and IBQry_Corpo.Bof) then
      begin
         try
            MemoImpressao.Width := (IBQry_Cabec.FieldByName('VL_EXT_LARG').asInteger * 9);//para transformar pixels em caracteres
            MemoImpressao.Lines.Clear;
            Extenso1.Numero := IBQry_Parcelas.FieldByName('VALOR').asString;
            MemoImpressao.Lines.Text := Extenso1.Extenso;
            For I := 0 to MemoImpressao.Lines.Count-1 do
            begin
               if (I+1) > IBQry_Cabec.FieldByName('VL_EXT_LINHAS').asInteger Then Break;
               IBDataSet1.Append;
               IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
               IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger + I;
               IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
               IBDataSet1.FieldByName('CONTEUDO').AsString := MemoImpressao.Lines[I];
               IBDataSet1.FieldByName('MASCARA').AsString := '';
               IBDataSet1.Post;
            end;
            IBTransaction1.CommitRetaining;
         except
            IBDataSet1.Close;
            IBTransaction1.RollbackRetaining;
         end;
      end;

      //**********************  Primeiro Coloca os campos que NAO vem de tabelas   ******************
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Duplic +''' and Tabela is NULL and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      try
         while not IBQry_Corpo.Eof do
         begin
            IBDataSet1.Append;
            IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
            IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
            IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
            IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Corpo.FieldByName('CAMPO').asString;
            IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
            IBDataSet1.Post;
            IBQry_Corpo.Next;
         end;
         IBTransaction1.CommitRetaining;
      except
         IBDataSet1.Close;
         IBTransaction1.RollbackRetaining;
      end;

      //**********************  Campos que vem do DOCSCAPA   ******************
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Duplic +''' and UPPER(Tabela) = ''DOCSCAPA'' and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      try
         while not IBQry_Corpo.Eof do
         begin
            IBDataSet1.Append;
            IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
            IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
            IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
            IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Cabec.FieldByName(IBQry_Corpo.FieldByName('CAMPO').asString).asString;
            IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
            IBDataSet1.Post;
            IBQry_Corpo.Next;
         end;
         IBTransaction1.CommitRetaining;
      except
         IBDataSet1.Close;
         IBTransaction1.RollbackRetaining;
      end;

      //************************************** Vem de varias tabelas **************************************************************
      //Busca os CAMPOS das Tabelas:  CTASRECEBER, PARAMETROS, VENDAS, CLIENTES
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Duplic +''' and UPPER(Tabela) IN (''CTASRECEBER'',''PARAMETROS'',''VENDAS'',''CLIENTES'') and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      osCampos := '';
      while not IBQry_Corpo.Eof do
      begin
         osCampos := osCampos + IBQry_Corpo.FieldByName('TABELA').asString+'.'+IBQry_Corpo.FieldByName('CAMPO').asString+' as '+IBQry_Corpo.FieldByName('TABELA').asString+'_'+IBQry_Corpo.FieldByName('CAMPO').asString+', ';
         IBQry_Corpo.Next;
      end;
      osCampos := Copy(osCampos,1,Length(osCampos)-2);
      if osCampos <> '' then
      begin
         //Busca os DADOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
         IBQry_Dados.SQL.Clear;
         //Alem dos campos do DocsItem busca tambem a Situação Tributaria do CFOP se Tiver, Sera usado nos produtos
         IBQry_Dados.SQL.Add(' SELECT '+ osCampos +' FROM PARAMETROS, CTASRECEBER ');
         IBQry_Dados.SQL.Add(' LEFT OUTER JOIN VENDAS ON (CTASRECEBER.CONTROLE = VENDAS.CONTROLE) ');
         IBQry_Dados.SQL.Add(' LEFT OUTER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) ');
         IBQry_Dados.SQL.Add(' WHERE CTASRECEBER.CONTROLE=' + oControle + ' AND CTASRECEBER.DOCUMENTO=''' + IBQry_Parcelas.FieldByName('DOCUMENTO').asString+'''');
         if not IBQry_Dados.Prepared then IBQry_Dados.Prepare;
         IBQry_Dados.Open;

         //Faz um LOOP com os campos e dados
         IBQry_Corpo.First;
         try
            while not IBQry_Corpo.Eof do
            begin
               IBDataSet1.Append;
               IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
               IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
               IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
               IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Dados.FieldByName(IBQry_Corpo.FieldByName('TABELA').asString+'_'+IBQry_Corpo.FieldByName('CAMPO').asString).asString;
               IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
               //Ajusta o TAMANHO, se Tiver
               if IBQry_Corpo.FieldByName('TAMANHO').asInteger <> 0 then
                  IBDataSet1.FieldByName('CONTEUDO').AsString := AlinharStr(IBDataSet1.FieldByName('CONTEUDO').AsString,IBQry_Corpo.FieldByName('TAMANHO').asInteger,'E');
               IBDataSet1.Post;
               IBQry_Corpo.Next;
            end;
            IBTransaction1.CommitRetaining;
         except
            IBDataSet1.Close;
            IBTransaction1.RollbackRetaining;
         end;
      end;

      if IBQry_Cabec.FieldByName('IMPRESSAO_TIPO').asInteger = 1 then
         PrintFast1.Windows.PrintForWindows := True
      else
         PrintFast1.Windows.PrintForWindows := False;
      PrintFast1.Windows.Orientation := poPortrait;
      PrintFast1.Windows.Font.Size := IBQry_Cabec.FieldByName('IMPRES_WIN_FONTE').asInteger;
      PrintFast1.Windows.LineSpace := IBQry_Cabec.FieldByName('IMPRES_WIN_ESPACO').asInteger;

      PrintFast1.PageHeader := False;
      PrintFast1.IniciaImpr;
      //ConfImpr(Tabelas.T_ParametrosIMPRPADRAO.value,Tabelas.T_Impressoras,PrintFast1);

      if IBQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(IBQry_Cabec.FieldByName('LINHAS').asInteger));

      if IBQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(p8LinPol);

      // aqui coloca a compressao escolhida no cadastro da nota
      vCompr := IBQry_Cabec.FieldByName('COMPRESSAO').asString;
      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(pElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(pCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(pCompr20);

      IBQry_Dados.SQL.Clear;
      IBQry_Dados.SQL.Add('Select * from IMPRESSAO where Controle = '+oControle+' order by Linha, Coluna');
      if not IBQry_Dados.Prepared then IBQry_Dados.Prepare;
      IBQry_Dados.Open;
      IBQry_Dados.First;
      while not IBQry_Dados.Eof do
      begin
         if IBQry_Dados.FieldByName('MASCARA').asString <> '' then
            PrintFast1.Say(IBQry_Dados.FieldByName('Linha').asInteger, IBQry_Dados.FieldByName('Coluna').asInteger,PrintFast1.MascaraVlr(IBQry_Dados.FieldByName('MASCARA').asString,StrToFloat(IBQry_Dados.FieldByName('Conteudo').asString)))
         else
            PrintFast1.Say(IBQry_Dados.FieldByName('Linha').asInteger, IBQry_Dados.FieldByName('Coluna').asInteger,IBQry_Dados.FieldByName('Conteudo').asString);
         IBQry_Dados.Next;
      end;

      PrintFast1.ImprString('',' ',0,true);
      PrintFast1.Ejeta;

      if IBQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(t8LinPol);
      if IBQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(66));

      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(tElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(tCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(tCompr20);
      PrintFast1.FimImpr;

      // Deleta os Dados
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle,IBQry_Corpo);

      //Incrementa uma parcela
      IBQry_Parcelas.Next;
   end;
end;

Procedure TFrmVendasLen.Imprime_Carne(Conf_Carne, oControle: String);
var vCompr, osCampos, vCod_SitTrib_Padrao : String;
    I,J,vLinha,vColuna, CountLinha, CountColuna, LinhasProd : Integer;
begin
   if (Trim(oControle) = '0') or (Trim(oControle) = '') then
   begin
      MessageDlg('Nota Inválida!',mtWarning,[mbOk],0);
      exit;
   end;

   IBQry_Cabec.SQL.Clear;
   IBQry_Cabec.SQL.Add('Select * from DOCSCAPA where Nome = '''+ Conf_Carne +'''');
   if not IBQry_Cabec.Prepared then IBQry_Cabec.Prepare;
   IBQry_Cabec.Open;

   if (IBQry_Cabec.EOF) and (IBQry_Cabec.BOF) then
   begin
      MessageDlg('Configuração de Documento Inválida!',mtWarning,[mbOk],0);
      exit;
   end;


//********************************Começa o Laco das parcelas ************************************
   IBQry_Parcelas.First;
   while not IBQry_Parcelas.Eof do
   begin
      if IBTransaction1.InTransaction then
         IBTransaction1.RollbackRetaining
      else
         IBTransaction1.StartTransaction;
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle,IBQry_Corpo);
      IBDataSet1.Active := False;
      IBDataSet1.Params[0].AsInteger := StrToInt(oControle);
      IBDataSet1.Active := True;

      //**********************  Primeiro Coloca os campos que NAO vem de tabelas   ******************
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Carne +''' and Tabela is NULL and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      try
         while not IBQry_Corpo.Eof do
         begin
            IBDataSet1.Append;
            IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
            IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
            IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
            IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Corpo.FieldByName('CAMPO').asString;
            IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
            IBDataSet1.Post;
            IBQry_Corpo.Next;
         end;
         IBTransaction1.CommitRetaining;
      except
         IBDataSet1.Close;
         IBTransaction1.RollbackRetaining;
      end;

      //**********************  Campos que vem do DOCSCAPA   ******************
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Carne +''' and UPPER(Tabela) = ''DOCSCAPA'' and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      try
         while not IBQry_Corpo.Eof do
         begin
            IBDataSet1.Append;
            IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
            IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
            IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
            IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Cabec.FieldByName(IBQry_Corpo.FieldByName('CAMPO').asString).asString;
            IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
            IBDataSet1.Post;
            IBQry_Corpo.Next;
         end;
         IBTransaction1.CommitRetaining;
      except
         IBDataSet1.Close;
         IBTransaction1.RollbackRetaining;
      end;

      //************************************** Vem de varias tabelas **************************************************************
      //Busca os CAMPOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Carne +''' and UPPER(Tabela) IN (''CTASRECEBER'',''PARAMETROS'',''VW_CLIENTES'') and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      osCampos := '';
      while not IBQry_Corpo.Eof do
      begin
         osCampos := osCampos + IBQry_Corpo.FieldByName('TABELA').asString+'.'+IBQry_Corpo.FieldByName('CAMPO').asString+' as '+IBQry_Corpo.FieldByName('TABELA').asString+'_'+IBQry_Corpo.FieldByName('CAMPO').asString+', ';
         IBQry_Corpo.Next;
      end;
      osCampos := Copy(osCampos,1,Length(osCampos)-2);
      if osCampos <> '' then
      begin
         //Busca os DADOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
         IBQry_Dados.SQL.Clear;
         //Alem dos campos do DocsItem busca tambem a Situação Tributaria do CFOP se Tiver, Sera usado nos produtos
         IBQry_Dados.SQL.Add(' SELECT '+ osCampos +' FROM PARAMETROS, CTASRECEBER ');
         //IBQry_Dados.SQL.Add(' LEFT OUTER JOIN VENDAS ON (CTASRECEBER.CONTROLE = VENDAS.CONTROLE) ');
         IBQry_Dados.SQL.Add(' LEFT OUTER JOIN VW_CLIENTES ON (CTASRECEBER.COD_CLIENTE = VW_CLIENTES.CODIGO) ');
         IBQry_Dados.SQL.Add(' WHERE CTASRECEBER.CONTROLE=' + oControle + ' AND CTASRECEBER.DOCUMENTO=''' + IBQry_Parcelas.FieldByName('DOCUMENTO').asString+'''');
         if not IBQry_Dados.Prepared then IBQry_Dados.Prepare;
         IBQry_Dados.Open;

         //Faz um LOOP com os campos e dados
         IBQry_Corpo.First;
         try
            while not IBQry_Corpo.Eof do
            begin
               IBDataSet1.Append;
               IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
               IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
               IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
               IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Dados.FieldByName(IBQry_Corpo.FieldByName('TABELA').asString+'_'+IBQry_Corpo.FieldByName('CAMPO').asString).asString;
               IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
               //Ajusta o TAMANHO, se Tiver
               if IBQry_Corpo.FieldByName('TAMANHO').asInteger <> 0 then
                  IBDataSet1.FieldByName('CONTEUDO').AsString := AlinharStr(IBDataSet1.FieldByName('CONTEUDO').AsString,IBQry_Corpo.FieldByName('TAMANHO').asInteger,'E');
               IBDataSet1.Post;
               IBQry_Corpo.Next;
            end;
            IBTransaction1.CommitRetaining;
         except
            IBDataSet1.Close;
            IBTransaction1.RollbackRetaining;
         end;
      end;

      if IBQry_Cabec.FieldByName('IMPRESSAO_TIPO').asInteger = 1 then
         PrintFast1.Windows.PrintForWindows := True
      else
         PrintFast1.Windows.PrintForWindows := False;
      PrintFast1.Windows.Orientation := poPortrait;
      PrintFast1.Windows.Font.Size := IBQry_Cabec.FieldByName('IMPRES_WIN_FONTE').asInteger;
      PrintFast1.Windows.LineSpace := IBQry_Cabec.FieldByName('IMPRES_WIN_ESPACO').asInteger;

      PrintFast1.PageHeader := False;
      PrintFast1.IniciaImpr;
      //ConfImpr(Tabelas.T_ParametrosIMPRPADRAO.value,Tabelas.T_Impressoras,PrintFast1);

      if IBQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(IBQry_Cabec.FieldByName('LINHAS').asInteger));

      if IBQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(p8LinPol);

      // aqui coloca a compressao escolhida no cadastro da nota
      vCompr := IBQry_Cabec.FieldByName('COMPRESSAO').asString;
      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(pElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(pCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(pCompr20);

      IBQry_Dados.SQL.Clear;
      IBQry_Dados.SQL.Add('Select * from IMPRESSAO where Controle = '+oControle+' order by Linha, Coluna');
      if not IBQry_Dados.Prepared then IBQry_Dados.Prepare;
      IBQry_Dados.Open;
      IBQry_Dados.First;
      while not IBQry_Dados.Eof do
      begin
         if IBQry_Dados.FieldByName('MASCARA').asString <> '' then
            PrintFast1.Say(IBQry_Dados.FieldByName('Linha').asInteger, IBQry_Dados.FieldByName('Coluna').asInteger,PrintFast1.MascaraVlr(IBQry_Dados.FieldByName('MASCARA').asString,StrToFloat(IBQry_Dados.FieldByName('Conteudo').asString)))
         else
            PrintFast1.Say(IBQry_Dados.FieldByName('Linha').asInteger, IBQry_Dados.FieldByName('Coluna').asInteger,IBQry_Dados.FieldByName('Conteudo').asString);
         IBQry_Dados.Next;
      end;

      PrintFast1.ImprString('',' ',0,True);
      if IBQry_Cabec.FieldByName('IMPRESSAO_TIPO').asInteger = 0 then //Se impressao para windows nao ejeta
         PrintFast1.Ejeta;

      if IBQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(t8LinPol);
      if IBQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(66));

      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(tElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(tCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(tCompr20);
      PrintFast1.FimImpr;

      // Deleta os Dados
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle,IBQry_Corpo);

      //Incrementa uma parcela
      IBQry_Parcelas.Next;
   end;
end;}

procedure TFrmVendasLen.Btn_Imprimir_CobrancaClick(Sender: TObject);
begin
   if Edit_Config_Impr.Text = '' then
   begin
      MessageDlg('Configuração Inválida.',mtWarning,[mbOK],0);
      Edit_Config_Impr.SetFocus;
      Exit;
   end;

   if Pos('Fat./Duplic',Edit_Config_Impr.Text) > 0 then
   begin
      Imprime_Duplicata(Copy(Edit_Config_Impr.Text,1,Pos('-',Edit_Config_Impr.Text)-1),Edit_Controle_Pag.Text);
   end else
   if Pos('Carnê',Edit_Config_Impr.Text) > 0 then
   begin
      //Imprime_Carne(Copy(Edit_Config_Impr.Text,1,Pos('-',Edit_Config_Impr.Text)-1),Edit_Controle_Pag.Text);
   end else
   if Pos('Bloqueto',Edit_Config_Impr.Text) > 0 then
   begin
      //Imprime_Bloqueto(Copy(Edit_Config_Impr.Text,1,Pos('-',Edit_Config_Impr.Text)-1),Edit_Controle_Pag.Text);
   end;
end;

procedure TFrmVendasLen.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Vendas',IBQry_Pes);
end;

procedure TFrmVendasLen.F3_Conf_DocClick(Sender: TObject);
var vTipo : String;
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT NOME, DESCRICAO, TIPO FROM DOCSCAPA WHERE TIPO IN (1,3,4)';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'NOME';
      FrmPesquisa.Caption := 'Configuração de documentos';
      if FrmPesquisa.ShowModal = mrOK then
      begin                               {
         Case FrmPesquisa.JvQuery.FieldByName('TIPO').asInteger of
            1 : vTipo := ' - Fat./Duplic';
            3 : vTipo := ' - Carnê';
            4 : vTipo := ' - Bloqueto';
         end;
         Edit_Config_Impr.Text := FrmPesquisa.JvQuery.FieldByName('NOME').asString + vTipo;
         Edit_Config_ImprExit(Self);
         Edit_Config_Impr.SetFocus;      }
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasLen.Edit_Config_ImprExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Trim(Edit_Config_Impr.Text) <> '' then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select DESCRICAO from DOCSCAPA where Nome=''' + Copy(Edit_Config_Impr.Text,1,Pos('-',Edit_Config_Impr.Text)-1) + '''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Panel_Config_Desc.Caption := JvQuery.FieldByName('DESCRICAO').asString;
         end
         else
         begin
            MessageDlg('Configuração não cadastrada.',mtInformation,[mbOK],0);
            Panel_Config_Desc.Caption := '';
            Edit_Config_Impr.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Config_Impr.Text := '';
      Panel_Config_Desc.Caption := '';
   end;
end;

procedure TFrmVendasLen.ImpressoNotaFiscal1Click(Sender: TObject);
// var JvQuery   : TJvUIBDataset;
var    oControle : Integer;
begin
   Case PageCadastro.ActivePageIndex of
      0: oControle := StrToInt(Edit_Controle.Text);
      1: oControle := StrToInt(Edit_Controle_Prod.Text);
      2: oControle := StrToInt(Edit_Controle_Serv.Text);
   end;
   
   if (Parametros.RETEN_PISCOFINS = 1) or
      (Parametros.RETEN_CSLL = 1) or
      (Parametros.RETEN_IRRF = 1) then
   begin
      FrmCalcRetencao := TFrmCalcRetencao.Create(Self); {
      try
         FrmCalcRetencao.Valor_NF := StrToFloat(TirarPonto(PanelTot_Nota.Caption));
         //Busca se ja tem valores
         JvQuery := TJvUIBDataset.Create(self);
         try
            JvQuery.Database := FrmPrincipal.Base;
            JvQuery.Transaction := FrmPrincipal.Transaction;
            if not FrmPrincipal.RodaConsulta('Select TOT_PISCOFINS, TOT_CSLL, TOT_IRRF from VENDAS where CONTROLE = ' + IntTostr(oControle),JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               if JvQuery.FieldByName('TOT_PISCOFINS').AsFloat > 0 then
                  FrmCalcRetencao.Edit_Vlr_PisCofins.Text := JvQuery.FieldByName('TOT_PISCOFINS').AsString;

               if JvQuery.FieldByName('TOT_CSLL').AsFloat > 0 then
                  FrmCalcRetencao.Edit_Vlr_CSLL.Text := JvQuery.FieldByName('TOT_CSLL').AsString;

               if JvQuery.FieldByName('TOT_IRRF').AsFloat > 0 then
                  FrmCalcRetencao.Edit_Vlr_IRRF.Text := JvQuery.FieldByName('TOT_IRRF').AsString;
            end;
         finally
            JvQuery.Close;
            JvQuery.Free;
         end;
      
         if FrmCalcRetencao.ShowModal = mrOk then
         begin
            if JvTransaction.InTransaction then JvTransaction.Rollback;
            JvTransaction.StartTransaction;
            try
               Proc_Lanca_Retencao.Params.ByNameAsInteger['OCONTROLE'] := oControle;
               Proc_Lanca_Retencao.Params.ByNameAsCurrency['PPISCOFINS'] := StrToFloat(TirarPonto(FrmCalcRetencao.Edit_Vlr_PisCofins.Text));
               Proc_Lanca_Retencao.Params.ByNameAsCurrency['PCSLL'] := StrToFloat(TirarPonto(FrmCalcRetencao.Edit_Vlr_CSLL.Text));
               Proc_Lanca_Retencao.Params.ByNameAsCurrency['PIRRF'] := StrToFloat(TirarPonto(FrmCalcRetencao.Edit_Vlr_IRRF.Text));
               Proc_Lanca_Retencao.Execute;
               JvTransaction.Commit;
            except
               on E:Exception do
               begin
                  ShowMessage(E.Message);
                  JvTransaction.RollbackRetaining;
               end;
            end;
         end;
      finally
         FrmCalcRetencao.Free;
         FrmCalcRetencao := Nil;
      end;    }
   end;
              
   if MessageDlg('Confirma impressão da nota fiscal ?', mtConfirmation, [mbNo, MbYes],0) = mrYes then
   begin
      Case PageCadastro.ActivePageIndex of
         0: Imprime_Nota(vConfig_Nota, Edit_Controle.Text, Combo_Cli_Forn.Items[Combo_Cli_Forn.ItemIndex]);
         1: Imprime_Nota(vConfig_Nota, Edit_Controle_Prod.Text, LabelCli_Forn_Prod.Caption);
         2: Imprime_Nota(vConfig_Nota, Edit_Controle_Serv.Text, LabelCli_Forn_Serv.Caption);
      end;
   end;
end;

procedure TFrmVendasLen.N2viadeCupomFiscal1Click(Sender: TObject);
// var JvQuery : TJvUIBDataset;
var    Itens : Integer;
begin
{   PrintFast1.Preview := True;
   PrintFast1.PageWidth := 80;
   //PrintFast1.Windows.Orientation := poPortrait;
   PrintFast1.Windows.Font.Size := 7;
   PrintFast1.Windows.LineSpace := 25;

   PrintFast1.IniciaImpr;

   PrintFast1.ImprComo(Pcompr175);

   PrintFast1.ImprString('',AnsiUpperCase(Parametros.RAZAO_SOCIAL),((48-Length(Parametros.RAZAO_SOCIAL)) div 2),True);
   PrintFast1.ImprString('',AnsiUpperCase(Parametros.ENDERECO) + '  ' + AnsiUpperCase(Parametros.BAIRRO),2,TRUE);
   PrintFast1.ImprString('',AnsiUpperCase(Parametros.CIDADE) + '  ' + Parametros.UF + '  ' + Parametros.CEP,2,TRUE);
   PrintFast1.ImprString('','FONE/FAX: ' + Parametros.FONE + '  ' + Parametros.FAX,2,TRUE);
   PrintFast1.ImprString('','CNPJ: ' + Parametros.CGC + '   IE: ' + Parametros.IE,2,TRUE);
   PrintFast1.ImprString('',FormatDateTime('dd/mm/yyyy  hh:nn',Now),2,False);
   PrintFast1.ImprString('','COO: ' + Trim(Edit_Nro_Nota.Text),39,TRUE);
   PrintFast1.ImprString('',PrintFast1.Repete('-',48),2,TRUE);
   PrintFast1.ImprString('','COMPROVANTE DE CUPOM FISCAL',12,True);
   PrintFast1.ImprString('',PrintFast1.Repete('-',48),2,TRUE);
   PrintFast1.ImprString('','NAO E DOCUMENTO FISCAL',15,True);
   PrintFast1.ImprString('',PrintFast1.Repete('-',48),2,TRUE);
   PrintFast1.ImprString('','ITEM CODIGO         DESCRICAO',2,TRUE);
   PrintFast1.ImprString('','    QTD X UNITARIO              VALOR TOTAL(R$)',2,TRUE);
   PrintFast1.ImprString('',PrintFast1.Repete('-',48),2,TRUE);

   JvQuery := TJvUIBDataset.Create(self);
   try
      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction;

      JvQuery.SQL.Clear;
      JvQuery.SQL.Add(' SELECT VENDITEM.CONTROLE,VENDITEM.SEQUENCIA,VENDITEM.COD_PRODUTO,VENDITEM.QUANTIDADE, ');
      JvQuery.SQL.Add(' VENDITEM.PESO_LIQUIDO,VENDITEM.VL_UNITARIO,VENDITEM.PERC_DESC, ((CAST(((VENDITEM.PESO_LIQUIDO * VENDITEM.VL_UNITARIO) * (VENDITEM.PERC_DESC / 100)) AS NUMERIC(18,2)))) VL_DESC,VENDITEM.TOT_PRODUTO,PRODUTOS.CODBARRA, ');
      JvQuery.SQL.Add(' PRODUTOS.NOME,PRODUTOS.APELIDO,PRODUTOS.CASAS_DECI_VALOR,CASAS_DECI_QTDE,(VENDAS.TOT_SERV + VENDAS.TOT_PROD) SUBTOTAL,(VENDAS.VL_DESC) DESC_TOTAL,VENDAS.TOT_NOTA,VENDAS.VLR_PAGO_D,VENDAS.TROCO ');
      JvQuery.SQL.Add(' FROM VENDITEM ');
      JvQuery.SQL.Add(' LEFT JOIN VENDAS ON (VENDITEM.CONTROLE=VENDAS.CONTROLE) ');
      JvQuery.SQL.Add(' LEFT JOIN PRODUTOS ON (VENDITEM.COD_PRODUTO=PRODUTOS.CODIGO) ');
      JvQuery.SQL.Add(' WHERE ');
      JvQuery.SQL.Add(' VENDITEM.CONTROLE = ' + Trim(Edit_Controle.Text));
      JvQuery.SQL.Add(' ORDER BY PRODUTOS.CODIGO');

      JvQuery.Open;

      JvQuery.Last;
      JvQuery.First;
      Itens := 0;
      While (JvQuery.RecordCount > 0) and (not JvQuery.Eof) do
      begin
         //PrintFast1.ImprString('','ITEM  CODIGO          DESCRICAO',3,TRUE);
         PrintFast1.ImprString('',FormatFloat('000',Itens),2,False);
         if Trim(JvQuery.FieldByName('CODBARRA').asString) = '' then
            PrintFast1.ImprString('',FormatFloat('000000000000',JvQuery.FieldByName('CODIGO').asInteger),7,False)
         else
            PrintFast1.ImprString('',JvQuery.FieldByName('CODBARRA').asString,7,False);
         PrintFast1.ImprString('',JvQuery.FieldByName('APELIDO').asString,22,True);
         //PrintFast1.ImprString('','    QTD X UNITARIO                   VALOR(R$)',3,TRUE);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('##0.00',JvQuery.FieldByName('QUANTIDADE').asFloat),3,False);
         PrintFast1.ImprString('','X',10,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',JvQuery.FieldByName('VL_UNITARIO').asFloat),16,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',JvQuery.FieldByName('TOT_PRODUTO').asFloat),37,True);
         if JvQuery.FieldByName('PERC_DESC').asFloat > 0 then
         begin
            PrintFast1.ImprString('','Desconto',7,False);
            PrintFast1.ImprString('',PrintFast1.MascaraVlr('##0.00',JvQuery.FieldByName('PERC_DESC').asFloat)+'%',16,False);
            PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',(JvQuery.FieldByName('VL_DESC').asFloat * -1)),37,True);
         end;
         JvQuery.Next;
         Inc(Itens);
      end;

      PrintFast1.ImprString('','',2,True);
      if JvQuery.FieldByName('DESC_TOTAL').asFloat > 0 then
      begin
         PrintFast1.ImprString('','SUBTOTAL ',2,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',JvQuery.FieldByName('SUBTOTAL').asFloat),37,True);
         PrintFast1.ImprString('','DESCONTO',3,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',(JvQuery.FieldByName('DESC_TOTAL').asFloat * -1)),37,True);
      end;

      PrintFast1.ImprString('','',2,True);
      PrintFast1.ImprString('','T O T A L ',2,False);
      PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',JvQuery.FieldByName('TOT_NOTA').asFloat),37,True);
      PrintFast1.ImprString('','Valor Recebido',2,False);
      PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',JvQuery.FieldByName('VLR_PAGO_D').asFloat),37,True);
      PrintFast1.ImprString('','T R O C O',2,False);
      PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',JvQuery.FieldByName('TROCO').asFloat),37,True);

   finally
      JvQuery.close;
      JvQuery.Free;
   end;

   PrintFast1.ImprString('',PrintFast1.Repete('-',48),2,TRUE);
   PrintFast1.ImprString('','NAO E DOCUMENTO FISCAL',15,True);
   PrintFast1.ImprString('',PrintFast1.Repete('-',48),2,TRUE);

   PrintFast1.ImprString('','Cliente : ' + Trim(Edit_CliForn.Text) + '-' + Trim(PanelCliForn.Caption),2,True);
   PrintFast1.ImprString('','Vendedor: ' + Trim(Edit_Vendedor.Text) + '-' + Trim(PanelVendedor.Caption),2,True);
   PrintFast1.ImprString('',Trim(Edit_Obs.Text),2,True);
   PrintFast1.ImprString('',PrintFast1.Repete('=',48),2,TRUE);

   PrintFast1.ImprComo(tCompr175);
//   PrintFast1.ImprString('',PrintFast1.Repete('-',48),3,TRUE);

   PrintFast1.ImprString('',' ',0,TRUE);
   PrintFast1.Ejeta;

   PrintFast1.FimImpr;
   JvQuery.Close; }
end;

procedure TFrmVendasLen.Edit_Perct_DesctExit(Sender: TObject);
var Total : Double;
begin
   Total := StrToFloatZero(TirarPonto(PanelTot_Prod.Caption)) + StrToFloatZero(TirarPonto(PanelTot_Serv.Caption));
   if (Total > 0) and (StrToFloatZero(Edit_Perct_Desct.text) > 0) then
      Edit_Desc_Geral.Text := FloatToStr(Total * (StrToFloatZero(Edit_Perct_Desct.Text) / 100));
end;

procedure TFrmVendasLen.Edit_Perct_AcreExit(Sender: TObject);
var Total : Double;
begin
   Total := StrToFloatZero(TirarPonto(PanelTot_Prod.Caption)) + StrToFloatZero(TirarPonto(PanelTot_Serv.Caption));
   if (Total > 0) and (StrToFloatZero(Edit_Perct_Acre.text) > 0) then
      Edit_Acre_Geral.text := FloatToStr(Total * (StrToFloatZero(Edit_Perct_Acre.text) / 100));
end;

initialization
   {$i uvendaslen.lrs}

end.
