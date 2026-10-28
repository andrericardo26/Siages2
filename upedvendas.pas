unit upedvendas;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db, LCLType,
  LResources, MaskEdit, Menus;

type

  TColecaoItem   =  Record
     Produto : Integer;
     Vl_Unitario : Double;
     Quantidade : Double;
  end;

  { TFrmPedVenda }

  TFrmPedVenda = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
     BtnAtualiza: TBitBtn;
     BtnCancelar: TBitBtn;
     BtnEditar: TBitBtn;
     BtnExclui: TBitBtn;
     BtnExcluiPesq: TBitBtn;
     BtnGrava: TBitBtn;
     BtnImprimePed1: TBitBtn;
     BtnInclui: TBitBtn;
     BtnIncluiPesq: TBitBtn;
     BtnLimpa: TBitBtn;
     BtnSair: TBitBtn;
     BtnSairPes: TBitBtn;
     BtnSituacao: TBitBtn;
     Chk_Vl_Anterior: TCheckBox;
     Datasource1: TDatasource;
     DBGrid_Prod: TdbGrid;
     Edit_Cliente: TEdit;
     Edit_CodBarra: TEdit;
     Edit_Nro_Pedido_Prod: TEdit;
     Edit_PCliente: TEdit;
     Edit_PControle: TEdit;
     Edit_Perct_Desc: TEdit;
     Edit_PNro_Pedido: TEdit;
     Edit_Produto: TEdit;
     Edit_PTransportador: TEdit;
     Edit_PVendedor: TEdit;
     Edit_Controle: TEdit;
     Edit_Nro_Pedido: TEdit;
     Edit_Quant_Prod: TEdit;
     Edit_Sequencia: TEdit;
     Edit_Transportador: TEdit;
     Edit_Vendedor: TEdit;
     Edit_FormaPagto: TEdit;
     F3_PClientes: TSpeedButton;
     F3_Pedido: TSpeedButton;
     F3_Produto: TSpeedButton;
     F3_PTransportador: TSpeedButton;
     F3_PVendedor: TSpeedButton;
     F3_Transportador: TSpeedButton;
     F3_Clientes: TSpeedButton;
     F3_Vendedor: TSpeedButton;
     F3_FormaPagto: TSpeedButton;
     Grid_Pesquisa: TdbGrid;
{     JvQry_Pes: TJvUIBDataSet;
     JvQry_Produtos: TJvUIBDataSet;
     JvTransaction: TJvUIBTransaction; }
     Label10: TLabel;
     Label11: TLabel;
     Label12: TLabel;
     Label16: TLabel;
     Label17: TLabel;
     Label18: TLabel;
     Label19: TLabel;
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
     Label30: TLabel;
     Label9: TLabel;
     Lbl_Status: TLabel;
     Msk_PData: TMaskEdit;
     Panel6: TPanel;
     Panel9: TPanel;
     PanelClienteNome_Prod: TPanel;
     PanelCliente_Prod: TPanel;
     PanelPCliente: TPanel;
     PanelProduto: TPanel;
     PanelPTransportador: TPanel;
     PanelPVendedor: TPanel;
     PanelTotal: TPanel;
     Panel_Vl_Unitario: TPanel;
     Panel_Vl_Unitario2: TPanel;
     Panel_Vl_Unitario3: TPanel;
{     PrintFast1: TPrintFast;
     Proc_SituacaoPedido: TJvUIBQuery; }
     Label1: TLabel;
     Label13: TLabel;
     Label14: TLabel;
     Label15: TLabel;
     Label2: TLabel;
     Label3: TLabel;
     Label4: TLabel;
     Label49: TLabel;
     Label5: TLabel;
     Label6: TLabel;
     Label7: TLabel;
     Label8: TLabel;
     Memo_OBS: TMemo;
     MenuItem1: TMenuItem;
     MenuItem2: TMenuItem;
     MenuItem3: TMenuItem;
     MenuItem4: TMenuItem;
     MenuItem5: TMenuItem;
     MenuItem6: TMenuItem;
     MenuItem7: TMenuItem;
     Msk_Data: TMaskEdit;
     NaoLimpar: TCheckBox;
     PageCadastro: TPageControl;
     Paginas: TPageControl;
     Panel1: TPanel;
     Panel2: TPanel;
     Panel3: TPanel;
     Panel4: TPanel;
     Panel5: TPanel;
     Panel7: TPanel;
     Panel8: TPanel;
     PanelCliente: TPanel;
     PanelSituacao_Data: TPanel;
     PanelSituacao_Usuario: TPanel;
     PanelSituacao: TPanel;
     PanelVendedor: TPanel;
     PanelFormaPagto: TPanel;
     PanelTransportador: TPanel;
     Panel_Tot_Geral: TPanel;
     PopupMenu1: TPopupMenu;
{    Proc_PedVendas: TJvUIBQuery;
    Proc_Produtos: TJvUIBQuery; }
    RG_Pes_Situacao: TRadioGroup;
    RG_Pes_Tipo: TRadioGroup;
    RG_Tipo: TRadioGroup;
    Src_Produtos: TDatasource;
    TabCadastro: TTabSheet;
    TabPedVenda: TTabSheet;
    TabPesquisa: TTabSheet;
    TabProdutos: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluiPesqClick(Sender: TObject);
    procedure BtnImprime1Click(Sender: TObject);
    procedure BtnImprimePedClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSituacaoClick(Sender: TObject);
    procedure Edit_ClienteExit(Sender: TObject);
    procedure Edit_ClienteKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_FormaPagtoExit(Sender: TObject);
    procedure Edit_FormaPagtoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Nro_PedidoExit(Sender: TObject);
    procedure Edit_Nro_PedidoKeyPress(Sender: TObject; var Key: char);
    procedure Edit_Nro_Pedido_ProdExit(Sender: TObject);
    procedure Edit_PClienteExit(Sender: TObject);
    procedure Edit_PClienteKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_PNro_PedidoExit(Sender: TObject);
    procedure Edit_PTransportadorExit(Sender: TObject);
    procedure Edit_PTransportadorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_PVendedorExit(Sender: TObject);
    procedure Edit_PVendedorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_ProdutoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Quant_ProdChange(Sender: TObject);
    procedure Edit_TransportadorExit(Sender: TObject);
    procedure Edit_TransportadorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_VendedorExit(Sender: TObject);
    procedure Edit_VendedorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure F3_ClientesClick(Sender: TObject);
    procedure F3_FormaPagtoClick(Sender: TObject);
    procedure F3_PClientesClick(Sender: TObject);
    procedure F3_PTransportadorClick(Sender: TObject);
    procedure F3_PVendedorClick(Sender: TObject);
    procedure F3_TransportadorClick(Sender: TObject);
    procedure F3_VendedorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
///    procedure Carrega_Parametros(Proc : TJvUIBQuery);
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaCellClick(Column: TColumn);
    procedure Grid_PesquisaDblClick(Sender: TObject);

       procedure Grid_PesquisaPrepareCanvas(sender: TObject; Col, Row: Integer; aState: TGridDrawState);
       procedure MenuItem1Click(Sender: TObject);
       procedure MenuItem3Click(Sender: TObject);
       procedure MenuItem5Click(Sender: TObject);
       procedure MenuItem7Click(Sender: TObject);
    procedure Msk_DataEnter(Sender: TObject);
    procedure Msk_DataExit(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure PageCadastroChange(Sender: TObject);
    procedure PageCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure F3_ObservacaoClick(Sender: TObject);
    procedure Edit_ProdutoExit(Sender: TObject);
    procedure Edit_CodBarraExit(Sender: TObject);
    procedure Calcula_Total;
    Procedure Carrega_Produtos(oNroPedido : Integer);
    procedure DBGrid_ProdDblClick(Sender: TObject);
    procedure F3_ProdutoClick(Sender: TObject);
    procedure DBGrid_ProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel3Click(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
    procedure Troca_Situacao(oPedido,aSituacao,oControle : Integer);
    procedure ImprimePedido;
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
  FrmPedVenda: TFrmPedVenda;
  vPed_VlAnterior : SmallInt;
  Colecao : Array of TColecaoItem;
  Tipo_Colecao_Parcial : Boolean;
  
implementation

uses UPrincipal, Global, UConsulta, UGeraParc, UVariaveis, UPacotes;


procedure TFrmPedVenda.SetOper(const Value: Integer);
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
                              Edit_Nro_Pedido.Enabled := True;
                              NaoLimpar.Enabled := True;
                           end;
                        1: Begin
                              Edit_Produto.Enabled := True;
                              Edit_CodBarra.Enabled := True;
                              F3_Produto.Enabled := True;
                              Tipo_Colecao_Parcial := False;
                           end;
                     end;
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     case PageCadastro.ActivePageIndex of
                        0: begin
                              Edit_Nro_Pedido.Enabled := False;
                              NaoLimpar.Enabled := False;
                           end;
                        1: Begin
                              Edit_Produto.Enabled := False;
                              Edit_CodBarra.Enabled := False;
                              F3_Produto.Enabled := False;
                           end;
                     end;
                  end;
    end;
  end;
end;

procedure TFrmPedVenda.SetStatus(Status: String);
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

procedure TFrmPedVenda.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmPedVenda.BtnSituacaoClick(Sender: TObject);
begin
   PopupMenu1.Popup(Left + BtnSituacao.Left + 22,Top + BtnSituacao.Height + 365);
end;

procedure TFrmPedVenda.Edit_ClienteExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cliente.Text)) <> 0) and (Trim(Edit_Cliente.Text) <> '0') then
   begin
    {  JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome, FormasPagto, Transportadora from CLIENTES where Codigo='+ Edit_Cliente.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCliente.Caption := JvQuery.FieldByName('NOME').asString;
            Edit_FormaPagto.Text := JvQuery.FieldByName('FormasPagto').asString;
            Edit_FormaPagtoExit(Self);
            Edit_Transportador.Text := JvQuery.FieldByName('Transportadora').asString;
            Edit_TransportadorExit(Self);
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

procedure TFrmPedVenda.Edit_ClienteKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_ClientesClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedVenda.Edit_FormaPagtoExit(Sender: TObject);
// var JvQuery :TJvUIBDataset;
begin
   If (Length(Trim(Edit_FormaPagto.Text)) <> 0) and (Trim(Edit_FormaPagto.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from FORMASPAGTO where Codigo='+ Edit_FormaPagto.Text + '',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelFormaPagto.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Forma Pagamento não cadastrada.',mtInformation,[mbOK],0);
            PanelFormaPagto.Caption := '';
            Edit_FormaPagto.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_FormaPagto.Text := '0';
      PanelFormaPagto.Caption := '';
   end;
end;

procedure TFrmPedVenda.Edit_FormaPagtoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_FormaPagtoClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedVenda.BitBtn1Click(Sender: TObject);
begin

end;

procedure TFrmPedVenda.BtnEditarClick(Sender: TObject);
begin
  Grid_PesquisaDblClick(self);
end;

procedure TFrmPedVenda.BtnExcluiPesqClick(Sender: TObject);
begin
//  Carrega_Campos(JvQry_Pes);
  BtnExcluiClick(self);
  BtnAtualizaClick(self);
end;

procedure TFrmPedVenda.BtnImprime1Click(Sender: TObject);
begin

end;

procedure TFrmPedVenda.BtnImprimePedClick(Sender: TObject);
begin
   ImprimePedido;
end;

procedure TFrmPedVenda.ImprimePedido;
var vSelect{, vGrupo, vOpcao, vTipo} : String;
    //I{, vCount} : Integer;
    {vSoma,} vTotal{, vTotal_Geral} : Double;
//    JvQuery, JvQuery_Itens : TJvUIBDataSet;
begin
   if Edit_Nro_Pedido.Text = '' then exit;
   //Se nao é para imprimir cabeçalho
{   if Parametros.CAB_IMPR_PED = 1 then
      PrintFast1.PageHeader := False
   else
   begin
      PrintFast1.PageHeader := True;
      PrintFast1.HeaderData.Title1 := Parametros.RAZAO_SOCIAL;
      PrintFast1.HeaderData.Title2 := '';
      PrintFast1.HeaderData.Right3 := 'Data: ' + DateToStr(Date);
   end; }
{
   PrintFast1.HeaderData.ColHeader1 := '';
   PrintFast1.PageWidth := 96;

   PrintFast1.Windows.Font.Size := 8;
   PrintFast1.Windows.LineSpace := 25;

   vSelect :=           ' SELECT PEDIDOS.NRO_PEDIDO, PEDIDOS.TIPO, PEDIDOS.VENDEDOR, VENDEDORES.NOME VENDEDOR_NOME, ';
   vSelect := vSelect + ' PEDIDOS.CLIENTE, CLIENTES.NOME CLIENTE_NOME, CLIENTES.ENDERECO, CLIENTES.BAIRRO, CLIENTES.CIDADE, ';
   vSelect := vSelect + ' CLIENTES.UF, CLIENTES.CEP, CLIENTES.CGC, CLIENTES.INSCRICAO, CLIENTES.FONE, CLIENTES.FAX, ';
   vSelect := vSelect + ' PEDIDOS.FORMAPAGTO, FORMASPAGTO.NOME FORMASPAGTO_NOME, PEDIDOS.DATA, ';
   vSelect := vSelect + ' PEDIDOS.TRANSPORTADOR, TRANSPORTADOR.NOME TRANSPORTADOR_NOME, PEDIDOS.OBSERVACAO ';
   vSelect := vSelect + ' FROM PEDIDOS ';
   vSelect := vSelect + ' LEFT JOIN CLIENTES ON (PEDIDOS.CLIENTE = CLIENTES.CODIGO) ';
   vSelect := vSelect + ' LEFT JOIN VENDEDORES ON (PEDIDOS.VENDEDOR = VENDEDORES.CODIGO) ';
   vSelect := vSelect + ' LEFT JOIN FORMASPAGTO ON (PEDIDOS.FORMAPAGTO = FORMASPAGTO.CODIGO) ';
   vSelect := vSelect + ' LEFT JOIN TRANSPORTADOR ON (PEDIDOS.TRANSPORTADOR = TRANSPORTADOR.CODIGO) ';
   vSelect := vSelect + ' WHERE NRO_PEDIDO = ' + Edit_Nro_Pedido.Text;

   JvQuery := TJvUIBDataSet.Create(Self);
   JvQuery.Database := FrmPrincipal.base;
   JvQuery.Transaction := FrmPrincipal.Transaction;
   
   JvQuery.Close;
   JvQuery.SQL.Clear;
   JvQuery.SQL.Add(vSelect);
   JvQuery.Open;

   Case JvQuery.FieldByName('TIPO').asInteger of
      0 : PrintFast1.HeaderData.Title2 := 'Pedido';
      1 : PrintFast1.HeaderData.Title2 := 'Orçamento';
   end;
   PrintFast1.HeaderData.Title2 := PrintFast1.HeaderData.Title2 + ' Nro. ' + JvQuery.FieldByName('NRO_PEDIDO').asString;

   Configura_Impressora(Parametros.IMPR_PADRAO,PrintFast1);
   PrintFast1.IniciaImpr;
   PrintFast1.ImprComo(PElite12);

   //PrintFast1.ImprString('',PrintFast1.Repete('=',96),0,True);

   PrintFast1.ImprString('','Cliente..: '+JvQuery.FieldByName('CLIENTE_NOME').asString + '(' + JvQuery.FieldByName('CLIENTE').asString + ')',0,True);
   PrintFast1.ImprString('','Endereço.: '+JvQuery.FieldByName('ENDERECO').asString,0,True);
   PrintFast1.ImprString('','Bairro...: '+JvQuery.FieldByName('BAIRRO').asString,0,True);
   PrintFast1.ImprString('','Cidade...: '+JvQuery.FieldByName('CIDADE').asString,0,False);
   PrintFast1.ImprString('','UF.: '+JvQuery.FieldByName('UF').asString,61,False);
   PrintFast1.ImprString('','CEP.: '+JvQuery.FieldByName('CEP').asString,70,True);
   PrintFast1.ImprString('','CGC......: '+JvQuery.FieldByName('CGC').asString,0,false);
   PrintFast1.ImprString('','Insc.Estadual.: '+JvQuery.FieldByName('INSCRICAO').asString,50,True);
   PrintFast1.ImprString('','Fone.....: '+JvQuery.FieldByName('FONE').asString,0,false);
   PrintFast1.ImprString('','Fax.: '+JvQuery.FieldByName('FAX').asString,60,True);
   PrintFast1.ImprString('',PrintFast1.Repete('-',96),0,True);


   //PrintFast1.ImprString('','P R O D U T O S',47,True);
   PrintFast1.ImprString('',' Codigo        Descricao                            Und     Quant.   Vlr.Unit    %Desc.    Total',0,True);
   PrintFast1.ImprString('',PrintFast1.Repete('-',96),0,True);

   //PrintFast1.ImprString('',PrintFast1.Repete('-',96),0,True);

   JvQuery_Itens := TJvUIBDataSet.Create(Self);
   JvQuery_Itens.Database := FrmPrincipal.base;
   JvQuery_Itens.Transaction := FrmPrincipal.Transaction;

   with JvQuery_Itens do
   begin
      //vSelect :=           ' SELECT PEDITEM.*, PRODUTOS.CODIGO, PRODUTOS.CODESTRUT, PRODUTOS.NOME, PRODUTOS.UNIDADE FROM PEDITEM LEFT JOIN PRODUTOS ON (PEDITEM.COD_PRODUTO = PRODUTOS.CODIGO) '; //comentado por usar CODESTRUT (fernando)
      vSelect :=           ' SELECT PEDITEM.*, PRODUTOS.CODIGO, PRODUTOS.NOME, PRODUTOS.UNIDADE FROM PEDITEM LEFT JOIN PRODUTOS ON (PEDITEM.COD_PRODUTO = PRODUTOS.CODIGO) ';
      vSelect := vSelect + ' WHERE NRO_PEDIDO = ' + Edit_Nro_Pedido.Text + ' ORDER BY PRODUTOS.NOME ';

      JvQuery_Itens.Active := False;
      JvQuery_Itens.SQL.Clear;
      JvQuery_Itens.SQL.Add(vSelect);
      JvQuery_Itens.Active := True;

      First;
      vTotal := 0;
      while not Eof do
      begin
//         PrintFast1.ImprString('',FieldByName('CODESTRUT').AsString,1,False); (fernando)
         PrintFast1.ImprString('',Copy(FieldByName('NOME').AsString,1,35),15,False);
         PrintFast1.ImprString('',FieldByName('UNIDADE').AsString,52,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',FieldByName('QUANTIDADE').AsFloat),58,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',FieldByName('VL_UNITARIO').AsFloat),69,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('##0.00',FieldByName('PERC_DESC').AsFloat),81,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',FieldByName('TOT_PRODUTO').AsFloat),88,True);
         vTotal := vTotal + FieldByName('TOT_PRODUTO').AsFloat;
         JvQuery_Itens.Next;
      end;

      //PrintFast1.ImprString('','',5,True);
      PrintFast1.ImprString('',PrintFast1.Repete('=',96),0,True);
   end;
   JvQuery_Itens.Close;
   JvQuery_Itens.Free;
   
   //FormaPagto
   if JvQuery.FieldByName('FORMAPAGTO').asInteger > 0 then
   begin
      PrintFast1.ImprString('','Forma Pagto: ' + JvQuery.FieldByName('FORMASPAGTO_NOME').asString,0,False);
   end;
   
   //Total a Pagar
   PrintFast1.ImprString('','Valor Total',70,False);
   PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',vTotal),84,TRUE);

   //PrintFast1.ImprString('','',5,True);
   PrintFast1.ImprString('',PrintFast1.Repete('-',96),0,True);
   
   //Transportadora
   if JvQuery.FieldByName('TRANSPORTADOR').asInteger > 0 then
   begin
      PrintFast1.ImprString('','Transportador: ' + JvQuery.FieldByName('TRANSPORTADOR_NOME').asString,0,True);
   end;
   
   //Vendedor
   if JvQuery.FieldByName('VENDEDOR').asInteger > 0 then
   begin
      PrintFast1.ImprString('','Vendedor: ' + JvQuery.FieldByName('VENDEDOR_NOME').asString,0,True);
   end;
   
   //Observacao
   if JvQuery.FieldByName('OBSERVACAO').asString <> '' then
   begin
      PrintFast1.ImprString('','Observacao: ' + WrapText(JvQuery.FieldByName('OBSERVACAO').asString, #13#10, ['.',' ',#9,'-'], 100),0,True);
   end;

   PrintFast1.Ejeta;
   PrintFast1.ImprComo(TElite12);
   PrintFast1.FimImpr;

   JvQuery.Close;
   JvQuery.Free;    }
end;


procedure TFrmPedVenda.Edit_Nro_PedidoExit(Sender: TObject);
begin
   if Length(Trim(Edit_Nro_Pedido.Text)) > 0 then
   begin
      if not ValInteger(Edit_Nro_Pedido.Text) then
      begin
         MessageDlg('Número do Pedido deve ser um número inteiro válido.', mtInformation,[mbOK],0);
         Edit_Nro_Pedido.SetFocus;
         Exit;
      end;
   end;
end;

procedure TFrmPedVenda.Edit_Nro_PedidoKeyPress(Sender: TObject; var Key: char);
begin
   if (not (Key in ['0'..'9','-',#8,#13,#35,#36,#37,#39])) then Key := #0;
end;

procedure TFrmPedVenda.Edit_Nro_Pedido_ProdExit(Sender: TObject);
var oSelect : String;
//    JvQuery : TJvUIBDataset;
begin
   If (Trim(Edit_Nro_Pedido_Prod.Text) <> '') and (Trim(Edit_Nro_Pedido_Prod.Text) <> '0')  then
   begin
      oSelect := 'SELECT PEDIDOS.*, CLIENTES.NOME FROM PEDIDOS INNER JOIN CLIENTES ON (CLIENTES.CODIGO = PEDIDOS.CLIENTE) ';
      oSelect := oSelect + ' WHERE PEDIDOS.NRO_PEDIDO = '+ Trim(Edit_Nro_Pedido_Prod.Text);
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta(oSelect,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCliente_Prod.Caption := JvQuery.FieldByName('CLIENTE').asString;
            PanelClienteNome_Prod.Caption := JvQuery.FieldByName('NOME').asString;
            vPed_VlAnterior := JvQuery.FieldByName('IND_PRECO').asInteger;
            Carrega_Produtos(JvQuery.FieldByName('NRO_PEDIDO').asInteger);
         end
         else
         begin
            MessageDlg('Pedido não cadastrado.',mtInformation,[mbOK],0);
            PanelCliente_Prod.Caption := '0';
            PanelClienteNome_Prod.Caption := '';
            vPed_VlAnterior := 0;
            Carrega_Produtos(0);
            Edit_Nro_Pedido_Prod.SetFocus;
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Nro_Pedido_Prod.Text := '0';
      PanelCliente_Prod.Caption := '0';
      PanelClienteNome_Prod.Caption := '';
      vPed_VlAnterior := 0;
      Carrega_Produtos(0);
   end;
end;

procedure TFrmPedVenda.Edit_PClienteExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_PCliente.Text)) <> 0) and (Trim(Edit_PCliente.Text) <> '0') then
   begin
  {    JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from CLIENTES where Codigo='+ Edit_PCliente.Text + '',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPCliente.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            PanelPCliente.Caption := '';
            Edit_PCliente.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_PCliente.Text := '0';
      PanelPCliente.Caption := '';
   end;
end;

procedure TFrmPedVenda.Edit_PClienteKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_PClientesClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedVenda.Edit_PNro_PedidoExit(Sender: TObject);
begin

end;


procedure TFrmPedVenda.Edit_PTransportadorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_PTransportador.Text)) <> 0) and (Trim(Edit_PTransportador.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from TRANSPORTADOR where Codigo='+ Edit_PTransportador.Text + '',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPTransportador.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Transportador não cadastrado.',mtInformation,[mbOK],0);
            PanelPTransportador.Caption := '';
            Edit_PTransportador.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;}
   end
   else
   begin
      Edit_PTransportador.Text := '0';
      PanelPTransportador.Caption := '';
   end;
end;

procedure TFrmPedVenda.Edit_PTransportadorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_PTransportadorClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedVenda.Edit_PVendedorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_PVendedor.Text)) <> 0) and (Trim(Edit_PVendedor.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from VENDEDORES where Codigo='+ Edit_PVendedor.Text + '',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPVendedor.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Vendedor não cadastrado.',mtInformation,[mbOK],0);
            PanelPVendedor.Caption := '';
            Edit_PVendedor.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_PVendedor.Text := '0';
      PanelPVendedor.Caption := '';
   end;
end;

procedure TFrmPedVenda.Edit_PVendedorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_PVendedorClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedVenda.Edit_ProdutoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_ProdutoClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedVenda.Edit_Quant_ProdChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      if Trim((Sender as TEdit).Text) <> '' then
      begin
         Calcula_Total;
      end;
   end;
end;

procedure TFrmPedVenda.Edit_TransportadorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Transportador.Text)) <> 0) and (Trim(Edit_Transportador.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from TRANSPORTADOR where Codigo='+ Edit_Transportador.Text + '',JvQuery) then Exit;
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
      end;      }
   end
   else
   begin
      Edit_Transportador.Text := '0';
      PanelTransportador.Caption := '';
   end;
end;

procedure TFrmPedVenda.Edit_TransportadorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_TransportadorClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedVenda.Edit_VendedorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Vendedor.Text)) <> 0) and (Trim(Edit_Vendedor.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from VENDEDORES where Codigo='+ Edit_Vendedor.Text + '',JvQuery) then Exit;
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
      end;}
   end
   else
   begin
      Edit_Vendedor.Text := '0';
      PanelVendedor.Caption := '';
   end;
end;

procedure TFrmPedVenda.Edit_VendedorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_VendedorClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedVenda.F3_ClientesClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from CLIENTES';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
 //        Edit_Cliente.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Cliente.OnExit(Self);
         Edit_Cliente.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
      FrmPesquisa := Nil;
   end;
end;

procedure TFrmPedVenda.F3_FormaPagtoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from FormasPagto ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Formas Pagamento';
      if FrmPesquisa.ShowModal = mrOK then
      begin
   //      Edit_FormaPagto.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_FormaPagto.OnExit(Self);
         Edit_FormaPagto.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
      FrmPesquisa := Nil;
   end;
end;

procedure TFrmPedVenda.F3_PClientesClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from CLIENTES';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
     //    Edit_PCliente.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_PCliente.OnExit(Self);
         Edit_PCliente.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmPedVenda.F3_PTransportadorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from TRANSPORTADOR ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Tranportadoras';
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  Edit_PTransportador.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_PTransportador.OnExit(Self);
         Edit_PTransportador.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
      FrmPesquisa := Nil;
   end;
end;

procedure TFrmPedVenda.F3_PVendedorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from VENDEDORES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Vendedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
         //  Edit_PVendedor.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_PVendedor.OnExit(Self);
         Edit_PVendedor.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
      FrmPesquisa := Nil;
   end;
end;

procedure TFrmPedVenda.F3_TransportadorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from Transportador ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Tranportadores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Transportador.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Transportador.OnExit(Self);
         Edit_Transportador.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
      FrmPesquisa := Nil;
   end;
end;

procedure TFrmPedVenda.F3_VendedorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from VENDEDORES ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Vendedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
  //       Edit_Vendedor.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Vendedor.OnExit(Self);
         Edit_Vendedor.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
      FrmPesquisa := Nil;
   end;
end;

procedure TFrmPedVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmPedVenda.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmPedVenda.BtnIncluiClick(Sender: TObject);
begin
   Paginas.ActivePageIndex := 0;
   SetStatus('Inserção');
   Operacao := opInsert;
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(self,1);
            Edit_ClienteExit(Self);
            Edit_TransportadorExit(Self);
            Edit_VendedorExit(Self);
            Edit_FormaPagtoExit(Self);
            RG_Tipo.ItemIndex := 0;
//            if Parametros.Busca_Chave = 1 then Edit_Nro_Pedido.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_PEDIDOS'));
            Edit_Nro_Pedido.SetFocus;
         end;
      1: Begin
            FrmPrincipal.LimpaCampos(self,3);
            Edit_Nro_Pedido_ProdExit(Self);
            Edit_ProdutoExit(Self);
            //Nao carregou o nro pedido
            if Trim(Edit_Nro_Pedido_Prod.Text) = '' then
            begin
               Edit_Nro_Pedido_Prod.Text := '';
               Edit_Nro_Pedido_Prod.SetFocus;
            end
            else //Deu certo
               Edit_Produto.SetFocus;
         end;
   end;
end;

procedure TFrmPedVenda.BtnGravaClick(Sender: TObject);
var I : Integer;
begin
{    Case PageCadastro.ActivePageIndex of
      0: begin
            //Pedido
            if Length(Trim(Edit_Nro_Pedido.Text)) > 0 then
            begin
               if not ValInteger(Edit_Nro_Pedido.Text) then
               begin
                  MessageDlg('Número do pedido deve ser número inteiro válido.', mtInformation,[mbOK],0);
                  if Edit_Nro_Pedido.Enabled then Edit_Nro_Pedido.SetFocus;
                  Exit;
               end;
            end;
            //Cliente
            if (Length(Trim(Edit_Cliente.Text)) = 0) or (Trim(Edit_Cliente.Text) = '0') then
            begin
               MessageDlg('Cliente deve ser preenchido.', mtInformation,[mbOK],0);
               if Edit_Cliente.Enabled then Edit_Cliente.SetFocus;
               Exit;
            end;
            //Transportador
            if (Length(Trim(Edit_Transportador.Text)) = 0) or (Trim(Edit_Transportador.Text) = '0') then
            begin
               MessageDlg('Transportador deve ser preenchido.', mtInformation,[mbOK],0);
               if Edit_Transportador.Enabled then Edit_Transportador.SetFocus;
               Exit;
            end;
         end;
      1: begin
            //Pedido
            if Length(Trim(Edit_Nro_Pedido_Prod.Text)) > 0 then
            begin
               if not ValInteger(Edit_Nro_Pedido_Prod.Text) then
               begin
                  MessageDlg('Número Pedido deve ser número inteiro válido.', mtInformation,[mbOK],0);
                  if Edit_Nro_Pedido_Prod.Enabled then Edit_Nro_Pedido_Prod.SetFocus;
                  Exit;
               end;
            end;
            
            //Produto
            if (Length(Trim(Edit_Produto.Text)) = 0) or (Trim(Edit_Produto.Text) = '0') then
            begin
               MessageDlg('Produto deve ser preenchido.', mtInformation,[mbOK],0);
               if Edit_Produto.Enabled = True then Edit_Produto.SetFocus;
               Exit;
            end;
            
            //Quantidade
            if (Length(Trim(Edit_Quant_Prod.Text)) = 0) or (Trim(Edit_Quant_Prod.Text) = '0') then
            begin
               MessageDlg('Quantidade deve ser maior que zero.', mtInformation,[mbOK],0);
               if Edit_Quant_Prod.Enabled then Edit_Quant_Prod.SetFocus;
               Exit;
            end;
            
            //Inclui os itens se for colecao
            if Tipo_Colecao_Parcial then
            begin
               For I := Low(Colecao) to High(Colecao) do
               begin
                  Proc_Produtos.Params.ByNameAsInteger['POPER'] := opInsert;
                  Proc_Produtos.Params.ByNameAsInteger['PSEQUENCIA'] := StrToIntZero(Edit_Sequencia.Text);
                  Proc_Produtos.Params.ByNameAsString['PNRO_PEDIDO'] := Edit_Nro_Pedido_Prod.Text;
                  Proc_Produtos.Params.ByNameAsInteger['PCOD_PRODUTO'] := Colecao[I].Produto;
                  Proc_Produtos.Params.ByNameAsCurrency['PQUANTIDADE'] := (StrToFloatZero(TirarPonto(Edit_Quant_Prod.Text)) * Colecao[I].Quantidade);
                  Proc_Produtos.Params.ByNameAsCurrency['PVL_UNITARIO'] := Colecao[I].Vl_Unitario;
                  Proc_Produtos.Params.ByNameAsCurrency['PPERC_DESC'] := StrToFloatZero(TirarPonto(Edit_Perct_Desc.Text));
                  FrmPrincipal.RodaSP(Proc_Produtos);
               end;
               Operacao := opBrowse;
               Edit_Nro_Pedido_ProdExit(Self);
               BtnCancelarClick(Self);
               BtnInclui.SetFocus;
               Exit;
            end;
            
         end;
   end;
   //se grava como browse entao esta editando
   // if Operacao = opBrowse then Operacao := opEdit;
   if PageCadastro.ActivePageIndex = 0 then
   begin
      Carrega_Parametros(Proc_PedVendas);
      //Carrega_Parametros_PedVendas();
      FrmPrincipal.RodaSP(Proc_PedVendas);
   end
   else
   begin
      if PageCadastro.ActivePageIndex = 1 then
      begin
         Carrega_Parametros(Proc_Produtos);
         FrmPrincipal.RodaSP(Proc_Produtos);
      end;
    end;
   Operacao := opBrowse;
   SetStatus('Edição');
   if BtnInclui.enabled then BtnInclui.SetFocus;
   //Se esta Marcada Inclusao Persistente
   Case PageCadastro.ActivePageIndex of
      0: begin
            if NaoLimpar.Checked then
            begin
               SetStatus('Inserção');
               Operacao := opInsert;
               Edit_Nro_Pedido.Text := '';
               Edit_Nro_Pedido.SetFocus;
            end;
         end;
      1: begin
            Edit_Nro_Pedido_ProdExit(Self);
         end;
   end;}
end;
               {
procedure TFrmPedVenda.Carrega_Parametros(Proc : TJvUIBQuery);
begin
   with Proc do
   begin
      case PageCadastro.ActivePageIndex of
        0: begin
              Params.ByNameAsInteger['POPER'] := Operacao;
              Params.ByNameAsInteger['PNRO_PEDIDO'] := StrToIntZero(Edit_Nro_Pedido.Text);
              if StrToIntZero(Edit_Cliente.Text) = 0 then
                Params.ByNameIsNull['PCLIENTE'] := true
              else
                Params.ByNameAsInteger['PCLIENTE'] := StrToIntZero(Edit_Cliente.Text);

              if StrToIntZero(Edit_Vendedor.Text) = 0 then
                Params.ByNameIsNull['PVENDEDOR'] := true
              else
                Params.ByNameAsInteger['PVENDEDOR'] := StrToIntZero(Edit_Vendedor.Text);

              if StrToIntZero(Edit_FormaPagto.Text) = 0 then
                Params.ByNameIsNull['PFORMAPAGTO'] := true
              else
                Params.ByNameAsInteger['PFORMAPAGTO'] := StrToIntZero(Edit_FormaPagto.Text);

              if StrToIntZero(Edit_Transportador.Text) = 0 then
                Params.ByNameIsNull['PTRANSPORTADOR'] := true
              else
                Params.ByNameAsInteger['PTRANSPORTADOR'] := StrToIntZero(Edit_Transportador.Text);

              Params.ByNameAsInteger['PTIPO'] := RG_Tipo.ItemIndex;
              Params.ByNameAsString['PDATA'] := Msk_Data.Text;
              
              // adicionado por fernando para gravar direto na tabela sem sp auxiliar, desativadas funcionalidades
              Params.ByNameAsInteger['PSITUACAO'] := PanelSituacao.Tag;
              Params.ByNameAsString['PDT_SITUACAO'] := Msk_Data.Text;
              Params.ByNameAsString['PUSER_SITUACAO'] := PanelSituacao_Usuario.Caption;

              //Params.ByNameAsString['PIND_PRECO'] := IIF(Chk_Vl_Anterior.Checked,1,0); (zera parametro POPER, por que?)
              Params.ByNameAsString['POBSERVACAO'] := Memo_OBS.Lines.Text; //CAST ERROR
              //ParamByName('POBSERVACAO').asvalue := Memo_OBS.Lines.Text;
              //Params.isBlob['POBSERVACAO'] := Memo_OBS.Lines.Text;
              //paramssetblob('POBSERVACAO', Memo_OBS.Lines.Text);
              
              //, , , , , SITUACAO, TOT_GERAL, CONTROLE
           end;
        1: begin
              Params.ByNameAsInteger['POPER'] := Operacao;
              Params.ByNameAsInteger['PSEQUENCIA'] := StrToIntZero(Edit_Sequencia.Text);
              Params.ByNameAsString['PNRO_PEDIDO'] := Edit_Nro_Pedido_Prod.Text;
              Params.ByNameAsInteger['PCOD_PRODUTO'] := StrToIntZero(Edit_Produto.Text);
              Params.ByNameAsCurrency['PQUANTIDADE'] := StrToFloatZero(Edit_Quant_Prod.Text);
              Params.ByNameAsCurrency['PVL_UNITARIO'] := StrToFloatZero(TirarPonto(Panel_Vl_Unitario.Caption));
              Params.ByNameAsCurrency['PPERC_DESC'] := StrToFloatZero(TirarPonto(Edit_Perct_Desc.Text));
           end;
      end;
   end;
end;
              }
procedure TFrmPedVenda.Carrega_Campos(oDataSet: TDataSet);
//var I : Integer;
begin
   with oDataSet do
   begin
      case PageCadastro.ActivePageIndex of
        0: begin
              Edit_Nro_Pedido.Text := FieldByName('NRO_PEDIDO').asString;
              Edit_Controle.Text := FieldByName('CONTROLE').AsString;
              RG_Tipo.ItemIndex := FieldByName('TIPO').asInteger;;
              Edit_Cliente.Text := FieldByName('CLIENTE').asString;
              Edit_ClienteExit(self);
              Msk_DataEnter(Msk_Data);
              Msk_Data.Text := FieldByName('DATA').asString;
              Msk_DataExit(Msk_Data);
              if FieldByName('IND_PRECO').asInteger = 0 then
                 Chk_Vl_Anterior.Checked := False
              else
                 Chk_Vl_Anterior.Checked := True;
              Edit_Transportador.Text := FieldByName('TRANSPORTADOR').asString;
              Edit_TransportadorExit(self);
              Edit_Vendedor.Text := FieldByName('VENDEDOR').asString;
              Edit_VendedorExit(self);
              Edit_FormaPagto.Text := FieldByName('FORMAPAGTO').asString;
              Edit_FormaPagtoExit(self);
              Memo_OBS.Lines.Text := FieldByName('OBSERVACAO').asString;
              Panel_Tot_Geral.Caption := FormatFloat('#,###,##0.00',FieldByName('TOT_GERAL').asFloat);
              
              Case FieldByName('SITUACAO').asInteger of
                 0 : PanelSituacao.Caption := 'Em Aberto';
                 1 : PanelSituacao.Caption := 'Pendente';
                 2 : PanelSituacao.Caption := 'Confirmado';
                 3 : PanelSituacao.Caption := 'Em Nota';
              end;
              PanelSituacao_Data.Caption := FieldByName('Dt_Situacao').asString;
              PanelSituacao_Usuario.Caption := FieldByName('User_Situacao').asString;
           end;
        1: begin
              Edit_Sequencia.Text := FieldByName('SEQUENCIA').AsString;
              Edit_Produto.Text := FieldByName('COD_PRODUTO').AsString;
              Edit_ProdutoExit(Self);
              Edit_Quant_Prod.Text := FieldByName('QUANTIDADE').AsString;
              Panel_Vl_Unitario.Caption := FieldByName('VL_UNITARIO').AsString;
              Edit_Perct_Desc.Text := FieldByName('PERC_DESC').AsString;
              Calcula_Total;
           end;
      end;
   end;
end;

procedure TFrmPedVenda.Grid_PesquisaCellClick(Column: TColumn);
begin

end;


procedure TFrmPedVenda.Grid_PesquisaDblClick(Sender: TObject);
begin
{   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      PageCadastro.ActivePageIndex := 0;
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
      PageCadastroChange(Self);
   end; }
end;

procedure TFrmPedVenda.Grid_PesquisaPrepareCanvas(sender: TObject; Col, Row: Integer; aState: TGridDrawState);
begin
{   if JvQry_Pes.Active then
   begin
      Case JvQry_Pes.FieldByName('SITUACAO').AsInteger of
         0: begin
               Grid_Pesquisa.Canvas.Font.Color := clBlack;
               Grid_Pesquisa.Canvas.Brush.Color := clYellow;
            end;
         1: begin
               Grid_Pesquisa.Canvas.Font.Color := clBlack;
               Grid_Pesquisa.Canvas.Brush.Color := clRed;
            end;
         2: begin
               Grid_Pesquisa.Canvas.Font.Color := clWhite;
               Grid_Pesquisa.Canvas.Brush.Color := clGreen;
            end;
         3: begin
               Grid_Pesquisa.Canvas.Font.Color := clBlack;
               Grid_Pesquisa.Canvas.Brush.Color := clWhite;
            end;
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
   end;}
end;

procedure TFrmPedVenda.MenuItem1Click(Sender: TObject);
begin
  Troca_Situacao(StrToInt(Edit_Nro_Pedido.Text), 0, StrToInt(Edit_Controle.Text)); //efetua a troca de situaçao
end;

procedure TFrmPedVenda.MenuItem3Click(Sender: TObject);
begin
  Troca_Situacao(StrToInt(Edit_Nro_Pedido.Text), 1, StrToInt(Edit_Controle.Text)); //efetua a troca de situaçao
end;

procedure TFrmPedVenda.MenuItem5Click(Sender: TObject); //comentarios por fernando
//var I : Integer;
    //Vlr_Pago : Double;
    //JvQry_Executa : TJvUIBQuery;
begin
   {if Operacao = opInsert then
      begin
        showmessage('Primeiramente grave o pedido!');
        exit;
      end;}
   Troca_Situacao(StrToInt(Edit_Nro_Pedido.Text), 2, StrToInt(Edit_Controle.Text)); //efetua a troca de situaçao
   Edit_Nro_PedidoExit(Self);
   {  funcionalidade temporiariamente desativada (por fernando)
   if JvQry_Parcelas.RecordCount > 0 then // se jah tem parcelas
   begin
      JvQry_Parcelas.First;
      Vlr_Pago := 0;
      while not JvQry_Parcelas.Eof do // percorre as parcelas
      begin
         Vlr_Pago := Vlr_Pago + JvQry_Parcelas.FieldByName('VL_PAGTO').asFloat;
         JvQry_Parcelas.Next;
      end;
      if Vlr_Pago > 0 then // se ja foi pago alguma coisa
      begin
         MessageDlg('Parcelamento já possui valores pagos. Impossível nova geração.',mtWarning,[mbOK],0);
         Exit; // nao deixa gerar novas parcelas
      end
      else // se nao foi pago pergunta se quer gerar novas
      begin
         if MessageDlg('Esta venda já possui parcelas geradas.'+ #13 +'Deseja parcelar novamente?',mtConfirmation,[mbyes,mbno],0) = mrno then
            Exit; // se nao quiser, sai.
      end;
   end;
   
   
   FrmGeraParcelas := TFrmGeraParcelas.Create(self);
   try
      with FrmGeraParcelas do
      begin
         Compra_Venda := 'VENDA'; //seta infos do pedido
         Valor_Total := StrToFloatZero(TirarPonto(Panel_Tot_Geral.Caption));
         Emissao := Date;
         Nota := Edit_Nro_Pedido.Text;
         Edit_Forma.Text := Edit_FormaPagto.Text;
         Edit_FormaExit(Self);
         BtnCalculaClick(Self);
         if ShowModal = mrok then // se OK
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
               //cria parcelas novas
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
         //Edit_Controle_PagExit(Self);
      end;
   finally
      FrmGeraParcelas.Free;
      FrmGeraParcelas := nil;
   end;      }
end;

procedure TFrmPedVenda.MenuItem7Click(Sender: TObject);
begin
  Troca_Situacao(StrToInt(Edit_Nro_Pedido.Text), 3, StrToInt(Edit_Controle.Text)); //efetua a troca de situaçao
end;

procedure TFrmPedVenda.Msk_DataEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99/99/9999;1;_';
      if Operacao = opInsert then
      begin
         (Sender as TMaskEdit).Text := DateToStr(Date);
         (Sender as TMaskEdit).SelectAll;
      end;
   end;
end;

procedure TFrmPedVenda.Msk_DataExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '/  /' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmPedVenda.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmPedVenda.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(self,1);
            Edit_ClienteExit(Self);
            Edit_TransportadorExit(Self);
            Edit_VendedorExit(Self);
            Edit_FormaPagtoExit(Self);
         end;
      1: begin
            FrmPrincipal.LimpaCampos(self,3);
            Edit_ProdutoExit(Self);
            Carrega_Produtos(0);
            Calcula_Total;
            Edit_Nro_Pedido_ProdExit(Self);
         end;
      2: begin

         end;
   end;
   BtnInclui.SetFocus;
end;

procedure TFrmPedVenda.FormShow(Sender: TObject);
var //I:Integer;
    //Qry : TJvUIBDataset;
    vSelect : String;
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
{   
   JvTransaction.DataBase := FrmPrincipal.base;
   
   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;
   
   Proc_PedVendas.DataBase := FrmPrincipal.base;
   Proc_PedVendas.Transaction := FrmPrincipal.Transaction;
   Proc_PedVendas.BuildStoredProc('PROC_PEDIDOS');
   
   Proc_Produtos.DataBase := FrmPrincipal.base;
   Proc_Produtos.Transaction := FrmPrincipal.Transaction;
   Proc_Produtos.BuildStoredProc('PROC_PEDITEM');
   
   Proc_SituacaoPedido.DataBase := FrmPrincipal.base;
   Proc_SituacaoPedido.Transaction := JvTransaction;
   Proc_SituacaoPedido.BuildStoredProc('SITUACAO_PEDIDO');
   
   JvQry_Produtos.Database := Frmprincipal.Base;
   JvQry_Produtos.Transaction := Frmprincipal.Transaction;
   vSelect := '';    {
   vSelect := vSelect + ' SELECT * FROM PEDITEM INNER JOIN PRODUTOS ON (PEDITEM.COD_PRODUTO = PRODUTOS.CODIGO)';
   vSelect := vSelect + ' WHERE PEDITEM.NRO_PEDIDO = :PNRO_PEDIDO ';
   vSelect := vSelect + ' ORDER BY PRODUTOS.NOME ';}
   {
   vSelect := 'SELECT PEDI.SEQUENCIA, PEDI.NRO_PEDIDO, PEDI.COD_PRODUTO, PEDI.DESCRICAO, PEDI.QUANTIDADE, PEDI.VL_UNITARIO, PEDI.PERC_DESC,';
   vSelect := vSelect + 'PEDI.COMISSAO, PEDI.TOT_PRODUTO, PEDI.OPCAO, PEDI.GRUPO AS PEDIGRUPO, P.* FROM PEDITEM PEDI ';
   vSelect := vSelect + 'INNER JOIN PRODUTOS P ON (PEDITEM.COD_PRODUTO = PRODUTOS.CODIGO)';
   vSelect := vSelect + 'WHERE PEDITEM.NRO_PEDIDO = :PNRO_PEDIDO ORDER BY PRODUTOS.NOME';
   
   JvQry_Produtos.SQL.Add(vSelect);
   }
   BtnInclui.SetFocus;
   PageCadastroChange(self);
end;

procedure TFrmPedVenda.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI, aOrdem : String;
    //I: Integer;
begin
   BtnExcluiPesq.enabled := false;
   BtnEditar.enabled := false;
   vSelect := '';

   vSelect := vSelect + ' SELECT PEDIDOS.NRO_PEDIDO, PEDIDOS.TIPO, ';
   vSelect := vSelect + ' CASE PEDIDOS.TIPO ';
   vSelect := vSelect + '   WHEN 0 THEN ''PEDIDO'' ';
   vSelect := vSelect + '   WHEN 1 THEN ''ORCAMENTO'' ';
   vSelect := vSelect + ' END TIPO_PEDIDO, ';
   vSelect := vSelect + ' PEDIDOS.CLIENTE, ';
   vSelect := vSelect + ' CLIENTES.NOME, ';
   vSelect := vSelect + ' PEDIDOS.DATA, ';
   vSelect := vSelect + ' PEDIDOS.TOT_GERAL, ';
   vSelect := vSelect + ' PEDIDOS.TRANSPORTADOR,';
   vSelect := vSelect + ' PEDIDOS.VENDEDOR,';
   vSelect := vSelect + ' PEDIDOS.FORMAPAGTO,';
   vSelect := vSelect + ' PEDIDOS.IND_PRECO, ';
   vSelect := vSelect + ' PEDIDOS.OBSERVACAO, ';
   vSelect := vSelect + ' PEDIDOS.SITUACAO, ';
   vSelect := vSelect + ' PEDIDOS.DT_SITUACAO, ';
   vSelect := vSelect + ' PEDIDOS.USER_SITUACAO, ';
   vSelect := vSelect + ' PEDIDOS.CONTROLE ';
   vSelect := vSelect + ' FROM PEDIDOS ';
   vSelect := vSelect + ' INNER JOIN CLIENTES ON (PEDIDOS.CLIENTE = CLIENTES.CODIGO) ';

   CRI := '';
   //Nro Pedido
   If Length(Trim(Edit_PNro_Pedido.Text)) > 0 then
   begin
      CRI := CRI + ' and NRO_PEDIDO = '''+ Trim(Edit_PNro_Pedido.Text) +''' ';
   end;
   
   //Controle
   If Length(Trim(Edit_PControle.Text)) > 0 then
   begin
      CRI := CRI + ' and CONTROLE = '+ Trim(Edit_PControle.Text) +' ';
   end;
   
   //Data
   If Length(Trim(Msk_PData.Text)) > 0 then
   begin
      CRI := CRI + ' and DATA = '''+ FormatDateTime('mm/dd/yyyy',StrToDate(Trim(Msk_PData.Text))) +''' ';
   end;

   //Cliente
   If (Length(Trim(Edit_PCliente.Text)) > 0) and (StrToIntZero(Edit_PCliente.Text) > 0) then
   begin
      CRI := CRI + ' and CLIENTE = '+ Trim(Edit_PCliente.Text) +' ';
   end;

   //Transportador
   If (Length(Trim(Edit_PTransportador.Text)) > 0) and (StrToIntZero(Edit_PTransportador.Text) > 0) then
   begin
      CRI := CRI + ' and TRANSPORTADOR = '+ Trim(Edit_PTransportador.Text) +' ';
   end;
   
   //Vendedor
   If (Length(Trim(Edit_PVendedor.Text)) > 0) and (StrToIntZero(Edit_PVendedor.Text) > 0) then
   begin
      CRI := CRI + ' and PEDIDOS.VENDEDOR = '+ Trim(Edit_PVendedor.Text) +' ';
   end;
   
   //Tipo
   if RG_Pes_Tipo.ItemIndex <> -1 then
   begin
      CRI := CRI + ' and PEDIDOS.TIPO = '+ IntToStr(RG_Pes_Tipo.ItemIndex) +' ';
   end;

   //Situacao
   if RG_Pes_Situacao.ItemIndex <> -1 then
   begin
      CRI := CRI + ' and PEDIDOS.SITUACAO = '+ IntToStr(RG_Pes_Situacao.ItemIndex) +' ';
   end;

   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';
   //Ordem
   aOrdem := ' ORDER BY NRO_PEDIDO ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + Copy(aOrdem,1,Length(aOrdem)-1);

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
   end;        }
end;

procedure TFrmPedVenda.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin    {
   JvQuery := TJvUIBDataset.Create(Self);
   JvQuery.Database := FrmPrincipal.Base;
   JvQuery.Transaction := FrmPrincipal.Transaction;
   try
      Case PageCadastro.ActivePageIndex of
         0: begin
               //Pedido
               If Length(Trim(Edit_Nro_Pedido.Text)) <> 0 then
               begin
                  if not FrmPrincipal.RodaConsulta('Select * from PEDIDOS where Nro_Pedido = ' + Edit_Nro_Pedido.Text,JvQuery) then Exit;
                  if JvQuery.RecordCount > 0 then
                  begin
                     Operacao := opDelete;
                     Carrega_Campos(JvQuery);
                     if MessageDlg('Confirma exclusão Pedido : "'+ Edit_Nro_Pedido.Text + #13 +'Cliente: "'+ Trim(PanelClienteNome_Prod.Caption) +'" ?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                     begin
                        if PageCadastro.ActivePageIndex = 0 then
                        begin
                           Carrega_Parametros(Proc_PedVendas);
                           FrmPrincipal.RodaSP(Proc_PedVendas);
                        end
                        else
                        begin
                           if PageCadastro.ActivePageIndex = 1 then
                           begin
                              Carrega_Parametros(Proc_Produtos);
                              FrmPrincipal.RodaSP(Proc_Produtos);
                           end;
                        end;
                        FrmPrincipal.LimpaCampos(self,1);
                        Edit_ClienteExit(Self);
                        Edit_TransportadorExit(Self);
                        Edit_VendedorExit(Self);
                        Edit_FormaPagtoExit(Self);
                     end;
                     Operacao := opBrowse;
                  end
                  else
                  begin
                     MessageDlg('Pedido de Nro: "'+ Edit_Nro_Pedido.Text +'" ' + #13 +'"Cliente: "'+ Trim(PanelClienteNome_Prod.Caption) +'" não encontrado.',mtConfirmation,[mbOk],0);
                     FrmPrincipal.LimpaCampos(self,1);
                     Edit_ClienteExit(Self);
                     Edit_TransportadorExit(Self);
                     Edit_VendedorExit(Self);
                     Edit_FormaPagtoExit(Self);
                  end;
                  BtnInclui.SetFocus;
               end;
            end;
         1: begin
               //PedItem
               Edit_Nro_Pedido_ProdExit(Self);
               if (Trim(PanelCliente_Prod.Caption) <> '') and (Trim(Edit_Produto.Text) <> '0') then
               begin
                  if not FrmPrincipal.RodaConsulta('Select * from PedItem where Sequencia = '+ Edit_Sequencia.Text ,JvQuery) then Exit;
                  if JvQuery.RecordCount > 0 then
                  begin
                     Operacao := opDelete;
                     Carrega_Campos(JvQuery);
                     if MessageDlg('Confirma exclusão do produto'+ #13 + Edit_Produto.Text + ' - ' + PanelProduto.Caption + '?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                     begin
                        if PageCadastro.ActivePageIndex = 0 then
                        begin
                           Carrega_Parametros(Proc_PedVendas);
                           FrmPrincipal.RodaSP(Proc_PedVendas);
                        end
                        else
                        begin
                           if PageCadastro.ActivePageIndex = 1 then
                           begin
                              Carrega_Parametros(Proc_Produtos);
                              FrmPrincipal.RodaSP(Proc_Produtos);
                           end;
                        end;
                        BtnCancelarClick(Self);
                        SetStatus('Pesquisa');
                     end;
                     Operacao := opBrowse;
                  end
                  else
                  begin
                     MessageDlg('Produto com CODIGO "'+ Edit_Produto.Text +'" não encontrado neste pedido.',mtConfirmation,[mbOk],0);
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

procedure TFrmPedVenda.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmPedVenda.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   RG_Pes_Situacao.ItemIndex := 0;
   RG_Pes_Tipo.ItemIndex := 0;
   Edit_PClienteExit(Self);
   Edit_PTransportadorExit(Self);
   Edit_PVendedorExit(Self);
   // JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmPedVenda.PageCadastroChange(Sender: TObject);
begin
    BtnInclui.Enabled := True;
    BtnExclui.Enabled := True;
    BtnGrava.Enabled := True;
    BtnCancelar.Enabled := True;
    Case PageCadastro.ActivePageIndex of
      1: begin
            if StrToIntZero(Edit_Nro_Pedido.Text) > 0 then
            begin
               SetStatus('Pesquisa');
               BtnCancelarClick(Self);
               Edit_Nro_Pedido_Prod.Text := Edit_Nro_Pedido.Text;
               Edit_Nro_Pedido_ProdExit(Self);
            end;
         end;
      0: SetStatus('Edição');
   end;
end;

procedure TFrmPedVenda.PageCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmPedVenda.F3_ObservacaoClick(Sender: TObject);
begin

end;

procedure TFrmPedVenda.Edit_ProdutoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
//    JvQuery_Desconto : TJvUIBDataset;
var    I : Integer;
begin
//   If (Length(Trim(Edit_Produto.Text)) <> 0) and (Trim(Edit_Produto.Text) <> '0') then
//   begin
//      // JvQuery := TJvUIBDataset.Create(self);
////      try
//        //  JvQuery.Database := FrmPrincipal.Base;
//        // JvQuery.Transaction := FrmPrincipal.Transaction;
//
//         //if not FrmPrincipal.RodaConsulta('Select Codigo, CodEstrut, Nome, Preco_Vend, Desc_Compra, Ultm_Compra_Preco, Tipo From Produtos where Codigo='+ Edit_Produto.Text + ' ',JvQuery) then Exit; CODESTRUT = CODBARRA, -DESC_COMPRA
//        // if not FrmPrincipal.RodaConsulta('Select Codigo, CodBarra, Nome, Preco_Vend, Ultm_Compra_Preco, Tipo From Produtos where Codigo='+ Edit_Produto.Text + ' ',JvQuery) then Exit;
//        // if JvQuery.RecordCount > 0 then
//         begin
//            //Edit_CodBarra.Text := JvQuery.FieldByName('CODESTRUT').asString; //(fernando)
//          //  Edit_CodBarra.Text := JvQuery.FieldByName('CODBARRA').asString;
//            Edit_CodBarra.Modified := False;
//            // PanelProduto.Caption := JvQuery.FieldByName('NOME').asString;
//
//            if vPed_VlAnterior = 0 then
//            begin                                    {
//               if JvQuery.FieldByName('Preco_Vend').asFloat > 0 then
//                  Panel_Vl_Unitario.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Preco_Vend').asFloat)
//               else
//                  Panel_Vl_Unitario.Caption := '0'; }
//            end
//            else
//            begin                                    {
//               if JvQuery.FieldByName('Ultm_Compra_Preco').asFloat > 0 then
//                  Panel_Vl_Unitario.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Ultm_Compra_Preco').asFloat)
//               else
//                  Panel_Vl_Unitario.Caption := '0'; }
//            end;
//            
//            //Colecoes
////            if (Operacao = opInsert) and (JvQuery.FieldByName('Tipo').asInteger = 2) then
//            begin
//               FrmPacotes := TFrmPacotes.Create(Self);
//         //      Try
//                  FrmPacotes.PanelProduto.Caption := Edit_Produto.Text;
//                  FrmPacotes.PanelProdDescricao.Caption := PanelProduto.Caption;
//                  FrmPacotes.vPed_VlAnterior := vPed_VlAnterior;
//                  if FrmPacotes.ShowModal = mrOk then
//                  begin
//                     if FrmPacotes.RG_Colecao.ItemIndex = 1 then
//                     begin
//                        Tipo_Colecao_Parcial := True;
//                        SetLength(Colecao,0);
//                        For I := 1 to FrmPacotes.StringGrid1.RowCount-1 do
//                        begin
//                           SetLength(Colecao,Length(Colecao)+1);
//                           Colecao[High(Colecao)].Produto := StrToIntZero(FrmPacotes.StringGrid1.Cells[0,I]);
//                           Colecao[High(Colecao)].Quantidade := StrToFloatZero(FrmPacotes.StringGrid1.Cells[4,I]);
//                           Colecao[High(Colecao)].Vl_Unitario := StrToFloatZero(FrmPacotes.StringGrid1.Cells[2,I]);
//                        end;
//                        Panel_Vl_Unitario.Caption := FrmPacotes.LabelValor.Caption;
//                     end
//                     else
//                     begin
//                        Panel_Vl_Unitario.Caption := FrmPacotes.LabelValor.Caption;
//                     end;
//                  end;{
//               finally
//                  FrmPacotes.Close;
//                  FrmPacotes.Free;
//               end; }
//            end;
//
//            //Calcula o desconto
//            {JvQuery_Desconto := TJvUIBDataset.Create(self);
//            try
//               JvQuery_Desconto.Database := FrmPrincipal.Base;
//               JvQuery_Desconto.Transaction := FrmPrincipal.Transaction;
//               
//               if not FrmPrincipal.RodaConsulta('SELECT * FROM CALCULA_DESCONTOS('+ Edit_Produto.Text +','+ PanelCliente_Prod.Caption +')',JvQuery_Desconto) then Exit;
//               if JvQuery_Desconto.RecordCount > 0 then
//               begin
//                  if JvQuery_Desconto.FieldByName('PERC_DESC').asFloat > 0 then
//                     Edit_Perct_Desc.Text := FormatFloat('#,###,##0.00',JvQuery_Desconto.FieldByName('PERC_DESC').asFloat)
//                  else
//                     Edit_Perct_Desc.Text := '0,00';
//               end;
//            finally
//               JvQuery_Desconto.Close;
//               JvQuery_Desconto.Free;
//            end;   }
//
//            Calcula_Total;
//{         end
//         else }
//         begin
//            MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
//            Edit_CodBarra.Text := '';
//            PanelProduto.Caption := '';
//            Edit_Produto.SetFocus;
//         end;
//      // finally
//  //       JvQuery.close;
//    //     JvQuery.free;
//{      end;
//   end
//   else }
//   begin
//      Edit_Produto.Text := '0';
//      Edit_CodBarra.Text := '';
//      PanelProduto.Caption := '';
//   end;
end;

procedure TFrmPedVenda.Edit_CodBarraExit(Sender: TObject);
var
   // JvQuery : TJvUIBDataset;
   // JvQuery_Desconto : TJvUIBDataset;
    I : Integer;
begin
   if Edit_CodBarra.Modified = False then Exit;
   If (Length(Trim(Edit_CodBarra.Text)) <> 0) and (Trim(Edit_CodBarra.Text) <> '0') then
   begin
      // JvQuery := TJvUIBDataset.Create(self);
      try                                                  {
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction; }

//         if not FrmPrincipal.RodaConsulta('Select Codigo, CodEstrut, Nome, Preco_Vend, Desc_Compra, Ultm_Compra_Preco, Tipo From Produtos where CodEstrut = '''+ Edit_CodBarra.Text + ''' ',JvQuery) then Exit; CODESTRUT = CODBARRA, -DESC_COMPRA
         // if not FrmPrincipal.RodaConsulta('Select Codigo, CodBarra, Nome, Preco_Vend, Ultm_Compra_Preco, Tipo From Produtos where CodBarra = '''+ Edit_CodBarra.Text + ''' ',JvQuery) then Exit;
        // if JvQuery.RecordCount > 0 then
         begin                                                             {
            Edit_Produto.Text := JvQuery.FieldByName('CODIGO').AsString;
            PanelProduto.Caption := JvQuery.FieldByName('NOME').asString; }
            if vPed_VlAnterior = 0 then
            begin                                                            {
               if JvQuery.FieldByName('Preco_Vend').asFloat > 0 then
                  Panel_Vl_Unitario.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Preco_Vend').asFloat)
               else
                  Panel_Vl_Unitario.Caption := '0';                         }
            end
            else
            begin                                       {
               if JvQuery.FieldByName('Ultm_Compra_Preco').asFloat > 0 then
                  Panel_Vl_Unitario.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Ultm_Compra_Preco').asFloat)
               else
                  Panel_Vl_Unitario.Caption := '0';    }
            end;
            
            //Colecoes
            if (Operacao = opInsert) then // and (JvQuery.FieldByName('Tipo').asInteger = 2) then
            begin
               FrmPacotes := TFrmPacotes.Create(Self);
               Try
                  FrmPacotes.PanelProduto.Caption := Edit_Produto.Text;
                  FrmPacotes.PanelProdDescricao.Caption := PanelProduto.Caption;
                  FrmPacotes.vPed_VlAnterior := vPed_VlAnterior;
                  if FrmPacotes.ShowModal = mrOk then
                  begin
                     if FrmPacotes.RG_Colecao.ItemIndex = 1 then
                     begin
                        Tipo_Colecao_Parcial := True;
                        SetLength(Colecao,0);
                        For I := 1 to FrmPacotes.StringGrid1.RowCount-1 do
                        begin
                           SetLength(Colecao,Length(Colecao)+1);
                           Colecao[High(Colecao)].Produto := StrToIntZero(FrmPacotes.StringGrid1.Cells[0,I]);
                           Colecao[High(Colecao)].Quantidade := StrToFloatZero(FrmPacotes.StringGrid1.Cells[4,I]);
                           Colecao[High(Colecao)].Vl_Unitario := StrToFloatZero(FrmPacotes.StringGrid1.Cells[2,I]);
                        end;
                        Panel_Vl_Unitario.Caption := FrmPacotes.LabelValor.Caption;
                     end
                     else
                     begin
                        Panel_Vl_Unitario.Caption := FrmPacotes.LabelValor.Caption;
                     end;
                  end;
               finally
                  FrmPacotes.Close;
                  FrmPacotes.Free;
               end;
            end;

            //Calcula o desconto
            {JvQuery_Desconto := TJvUIBDataset.Create(self);
            try
               JvQuery_Desconto.Database := FrmPrincipal.Base;
               JvQuery_Desconto.Transaction := FrmPrincipal.Transaction;

               if not FrmPrincipal.RodaConsulta('SELECT * FROM CALCULA_DESCONTOS('+ Edit_Produto.Text +','+ PanelCliente_Prod.Caption +')',JvQuery_Desconto) then Exit;
               if JvQuery_Desconto.RecordCount > 0 then
               begin
                  if JvQuery_Desconto.FieldByName('PERC_DESC').asFloat > 0 then
                     Edit_Perct_Desc.Text := FormatFloat('#,###,##0.00',JvQuery_Desconto.FieldByName('PERC_DESC').asFloat)
                  else
                     Edit_Perct_Desc.Text := '0,00';
               end;
            finally
               JvQuery_Desconto.Close;
               JvQuery_Desconto.Free;
            end;}
            Calcula_Total;
         end;
         {else
         begin
            if not FrmPrincipal.RodaConsulta('Select Codigo, CodBarra, Nome, Preco_Vend, Desc_Compra, Ultm_Compra_Preco, Tipo From Produtos where ISBN = '''+ Edit_CodBarra.Text + ''' ',JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               Edit_Produto.Text := JvQuery.FieldByName('CODIGO').AsString;
               PanelProduto.Caption := JvQuery.FieldByName('NOME').asString;

               if vPed_VlAnterior = 0 then
               begin
                  if JvQuery.FieldByName('Preco_Vend').asFloat > 0 then
                     Panel_Vl_Unitario.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Preco_Vend').asFloat)
                  else
                     Panel_Vl_Unitario.Caption := '0';
               end
               else
               begin
                  if JvQuery.FieldByName('Ultm_Compra_Preco').asFloat > 0 then
                     Panel_Vl_Unitario.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Ultm_Compra_Preco').asFloat)
                  else
                     Panel_Vl_Unitario.Caption := '0';
               end;

               //Colecoes
               if (Operacao = opInsert) and (JvQuery.FieldByName('Tipo').asInteger = 2) then
               begin
                  FrmPacotes := TFrmPacotes.Create(Self);
                  Try
                     FrmPacotes.PanelProduto.Caption := Edit_Produto.Text;
                     FrmPacotes.PanelProdDescricao.Caption := PanelProduto.Caption;
                     FrmPacotes.vPed_VlAnterior := vPed_VlAnterior;
                     if FrmPacotes.ShowModal = mrOk then
                     begin
                        if FrmPacotes.RG_Colecao.ItemIndex = 1 then
                        begin
                           Tipo_Colecao_Parcial := True;
                           SetLength(Colecao,0);
                           For I := 1 to FrmPacotes.StringGrid1.RowCount-1 do
                           begin
                              SetLength(Colecao,Length(Colecao)+1);
                              Colecao[High(Colecao)].Produto := StrToIntZero(FrmPacotes.StringGrid1.Cells[0,I]);
                              Colecao[High(Colecao)].Quantidade := StrToFloatZero(FrmPacotes.StringGrid1.Cells[4,I]);
                              Colecao[High(Colecao)].Vl_Unitario := StrToFloatZero(FrmPacotes.StringGrid1.Cells[2,I]);
                           end;
                           Panel_Vl_Unitario.Caption := FrmPacotes.LabelValor.Caption;
                        end
                        else
                        begin
                           Panel_Vl_Unitario.Caption := FrmPacotes.LabelValor.Caption;
                        end;
                     end;
                  finally
                     FrmPacotes.Close;
                     FrmPacotes.Free;
                  end;
               end;

               //Calcula o desconto
               JvQuery_Desconto := TJvUIBDataset.Create(self);
               try
                  JvQuery_Desconto.Database := FrmPrincipal.Base;
                  JvQuery_Desconto.Transaction := FrmPrincipal.Transaction;

                  if not FrmPrincipal.RodaConsulta('SELECT * FROM CALCULA_DESCONTOS('+ Edit_Produto.Text +','+ PanelCliente_Prod.Caption +')',JvQuery_Desconto) then Exit;
                  if JvQuery_Desconto.RecordCount > 0 then
                  begin
                     if JvQuery_Desconto.FieldByName('PERC_DESC').asFloat > 0 then
                        Edit_Perct_Desc.Text := FormatFloat('#,###,##0.00',JvQuery_Desconto.FieldByName('PERC_DESC').asFloat)
                     else
                        Edit_Perct_Desc.Text := '0,00';
                  end;
               finally
                  JvQuery_Desconto.Close;
                  JvQuery_Desconto.Free;
               end;
               Calcula_Total;
            end
            else
            begin
               MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
               Edit_Produto.Text := '0';
               PanelProduto.Caption := '';
               Edit_CodBarra.SetFocus;
            end;
         end;}
      Finally
         // JvQuery.Close;
//         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Produto.text := '0';
      Edit_CodBarra.Text := '';
      PanelProduto.Caption := '';
   end;
end;

procedure TFrmPedVenda.Calcula_Total;
var vl_Total, vl_Desc : Double;
begin
   vl_Total := 0; vl_Desc := 0;
   vl_Total := (StrToFloatZero(Edit_Quant_Prod.Text)) * StrToFloatZero(TirarPonto(Panel_Vl_Unitario.Caption));
   vl_Desc := StrToFloatZero(TirarPonto(Edit_Perct_Desc.Text));
   vl_Total := vl_Total - (vl_Total * (vl_Desc / 100));
   PanelTotal.Caption := FormatFloat('#,###,###,##0.00',vl_Total);
end;


Procedure TFrmPedVenda.Carrega_Produtos(oNroPedido : Integer);
begin           {
   with JvQry_Produtos do
   begin
      if (oNroPedido = 0) then
      begin
         Src_Produtos.DataSet := Nil;
         DBGrid_Prod.DataSource := Nil;
         Close;
      end
      else
      begin
         Src_Produtos.DataSet := Nil;
         DBGrid_Prod.DataSource := Nil;
         Close;}
         {
         Params.ByNameAsInteger['PNRO_PEDIDO'] := oNroPedido;
         Open;
         FormatNumericFields(JvQry_Produtos);
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Produtos.DataSet := JvQry_Produtos;
            DBGrid_Prod.DataSource := Src_Produtos;
         end;   }
{      end;
   end;          }
end;

procedure TFrmPedVenda.DBGrid_ProdDblClick(Sender: TObject);
begin    {
   with JvQry_Produtos do
   begin
      if (JvQry_Produtos.Active) and (JvQry_Produtos.RecordCount > 0) then
      begin
         if Operacao = opBrowse then
         begin
            Carrega_Campos(JvQry_Produtos);
            Edit_Quant_Prod.SetFocus;
            SetStatus('Edição');
         end;
      end;
   end; }
end;

procedure TFrmPedVenda.F3_ProdutoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      //FrmPesquisa.Select := 'SELECT  CODIGO, CODESTRUT, NOME, SALDO_ATU ESTOQUE, PRECO_VEND VL_UNITARIO FROM VW_PROD_GERAL '; (fernando)
      FrmPesquisa.Select := 'SELECT  CODIGO, CODBARRA, NOME, SALDO_ATU ESTOQUE, PRECO_VEND VL_UNITARIO FROM VW_PROD_GERAL ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Produtos';
      FrmPesquisa.Width := 700;
      {SetLength(FrmPesquisa.ColumnsWidths,5); //comented by fernando
      FrmPesquisa.ColumnsWidths[0] := 65;
      FrmPesquisa.ColumnsWidths[1] := 80;
      FrmPesquisa.ColumnsWidths[2] := 350;
      FrmPesquisa.ColumnsWidths[3] := 80;
      FrmPesquisa.ColumnsWidths[4] := 85;}
      //FrmPesquisa.Abrir_Conteudo := True;
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Produto.Text := FrmPesquisa.JvQuery.FieldByName('CODIGO').asString;
         Edit_ProdutoExit(Self);
         Edit_Quant_Prod.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmPedVenda.DBGrid_ProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      DBGrid_ProdDblClick(Self);
   end;
end;

procedure TFrmPedVenda.Panel3Click(Sender: TObject);
begin

end;

procedure TFrmPedVenda.Shape1ChangeBounds(Sender: TObject);
begin

end;

procedure TFrmPedVenda.Troca_Situacao(oPedido,aSituacao,oControle : Integer);
begin
{   if JvTransaction.InTransaction then
      JvTransaction.Rollback;
   JvTransaction.StartTransaction;
   try
      Proc_SituacaoPedido.Params.ByNameAsInteger['ONRO_PEDIDO'] := oPedido;
      Proc_SituacaoPedido.Params.ByNameAsInteger['ASITUACAO'] := aSituacao;
      Proc_SituacaoPedido.Params.ByNameAsInteger['OCONTROLE'] := oControle;
      Proc_SituacaoPedido.Execute;
      JvTransaction.Commit;
      PanelSituacao_Data.Caption := FormatDateTime('d/m/y', date); //adicionado por fernando
      PanelSituacao_Usuario.Caption := FieldByName('User_Situacao').asString; //adicionado por fernando
      Case aSituacao of //adicionado por fernando
         0 : PanelSituacao.Caption := 'Em Aberto';
         1 : PanelSituacao.Caption := 'Pendente';
         2 : PanelSituacao.Caption := 'Confirmado';
         3 : PanelSituacao.Caption := 'Em Nota';
      end;
   except
      On E:Exception do
      begin
         ShowMessage(E.Message);
         JvTransaction.RollbackRetaining;
      end;
   end;                     }
   
  PanelSituacao_Data.Caption := FormatDateTime('d/m/y', date); //adicionado por fernando
 //  PanelSituacao_Usuario.Caption := JvQry_Pes.FieldByName('User_Situacao').asString;
  PanelSituacao.Tag := aSituacao;
  Case aSituacao of
     0 : PanelSituacao.Caption := 'Em Aberto';
     1 : PanelSituacao.Caption := 'Pendente';
     2 : PanelSituacao.Caption := 'Confirmado';
     3 : PanelSituacao.Caption := 'Em Nota';
  end;
end;

//PROCEDURE SITUACAO PEDIDO


initialization
   {$i upedvendas.lrs}
end.
