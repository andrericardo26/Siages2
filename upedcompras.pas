unit upedcompras;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db, LCLType,
  LResources, MaskEdit;


type

  { TFrmPedCompras }

  TFrmPedCompras = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
     BtnAjuda: TBitBtn;
     BtnAtualiza: TBitBtn;
     BtnCancelar: TBitBtn;
     BtnEditar: TBitBtn;
     BtnExclui: TBitBtn;
     BtnExcluiPesq: TBitBtn;
     BtnGrava: TBitBtn;
     BtnInclui: TBitBtn;
     BtnIncluiPesq: TBitBtn;
     BtnLimpa1: TBitBtn;
     BtnSair: TBitBtn;
     BtnSairPes: TBitBtn;
     Chk_Vl_Anterior: TCheckBox;
     Datasource1: TDatasource;
     DBGrid_Prod: TdbGrid;
     Edit_CodBarra: TEdit;
     Edit_Fornecedor: TEdit;
     Edit_Nro_Pedido_Prod: TEdit;
     Edit_PFornecedor: TEdit;
     Edit_PNro_Pedido: TEdit;
     Edit_Produto: TEdit;
     Edit_PTransportador: TEdit;
     Edit_Controle: TEdit;
     Edit_Nro_Pedido: TEdit;
     Edit_Quant_Prod: TEdit;
     Edit_Sequencia: TEdit;
     Edit_Transportador: TEdit;
     F3_Fornecedores: TSpeedButton;
     F3_Pedido: TSpeedButton;
     F3_PFornecedores: TSpeedButton;
     F3_Produto: TSpeedButton;
     F3_PTransportador: TSpeedButton;
     F3_Transportador: TSpeedButton;
     Grid_Pesquisa: TdbGrid;
{     JvQry_Pes: TJvUIBDataSet;
     JvQry_Produtos: TJvUIBDataSet;
     JvTransaction: TJvUIBTransaction; }
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
     Label3: TLabel;
     Label4: TLabel;
     Label49: TLabel;
     Label5: TLabel;
     Label6: TLabel;
     Label7: TLabel;
     Label8: TLabel;
     Label9: TLabel;
     Lbl_Status: TLabel;
     Memo_OBS: TMemo;
     Msk_Data: TMaskEdit;
     Msk_Dt_Entrega: TMaskEdit;
     Msk_PData: TMaskEdit;
     Msk_PDt_Entrega: TMaskEdit;
     NaoLimpar: TCheckBox;
     PageCadastro: TPageControl;
     Paginas: TPageControl;
     Panel1: TPanel;
     Panel2: TPanel;
     Panel3: TPanel;
     Panel4: TPanel;
     Panel5: TPanel;
     Panel6: TPanel;
     Panel7: TPanel;
     Panel8: TPanel;
     PanelForn: TPanel;
     PanelFornecNome_Prod: TPanel;
     PanelFornec_Prod: TPanel;
     PanelPForn: TPanel;
     PanelProduto: TPanel;
     PanelPTransportador: TPanel;
     PanelTotal: TPanel;
     PanelTransportador: TPanel;
     Panel_Tot_Geral: TPanel;
     Panel_Vl_Desc: TPanel;
     Panel_Vl_Unitario: TPanel;
{    Proc_PedCompras: TJvUIBQuery;
    Proc_Produtos: TJvUIBQuery; }
    RG_Tipo: TRadioGroup;
    Src_Produtos: TDatasource;
    TabCadastro: TTabSheet;
    TabCompra: TTabSheet;
    TabPesquisa: TTabSheet;
    TabProdutos: TTabSheet;
    procedure BtnEditar1Click(Sender: TObject);
    procedure BtnExcluiPesq1Click(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Edit_FornecedorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Nro_PedidoExit(Sender: TObject);
    procedure Edit_Nro_PedidoKeyPress(Sender: TObject; var Key: char);
    procedure Edit_Nro_Pedido_ProdExit(Sender: TObject);
    procedure Edit_PFornecedorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_PNro_PedidoExit(Sender: TObject);
    procedure Edit_PTransportadorExit(Sender: TObject);
    procedure Edit_PTransportadorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_ProdutoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_Quant_ProdChange(Sender: TObject);
    procedure Edit_TransportadorExit(Sender: TObject);
    procedure Edit_TransportadorKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure F3_PTransportadorClick(Sender: TObject);
    procedure F3_TransportadorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
//    procedure Carrega_Parametros(Proc : TJvUIBQuery);
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaDblClick(Sender: TObject);
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
    procedure Edit_FornecedorExit(Sender: TObject);
    procedure F3_FornecedoresClick(Sender: TObject);
    procedure F3_ObservacaoClick(Sender: TObject);
    procedure Edit_ProdutoExit(Sender: TObject);
    procedure Edit_CodBarraExit(Sender: TObject);
    procedure Calcula_Total;
    Procedure Carrega_Produtos(oNroPedido : Integer);
    procedure DBGrid_ProdDblClick(Sender: TObject);
    procedure F3_ProdutoClick(Sender: TObject);
    procedure DBGrid_ProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure F3_PFornecedoresClick(Sender: TObject);
    procedure Edit_PFornecedorExit(Sender: TObject);
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
  FrmPedCompras: TFrmPedCompras;
  vPedCompra_VlAnterior : SmallInt;

implementation

uses UPrincipal, Global, UConsulta, UGeraParc, UVariaveis;


procedure TFrmPedCompras.SetOper(const Value: Integer);
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

procedure TFrmPedCompras.SetStatus(Status: String);
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

procedure TFrmPedCompras.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmPedCompras.BtnImprimeClick(Sender: TObject);
begin

end;

procedure TFrmPedCompras.BtnEditar1Click(Sender: TObject);
begin
  Grid_PesquisaDblClick(self);
end;

procedure TFrmPedCompras.BtnExcluiPesq1Click(Sender: TObject);
begin
//  Carrega_Campos(JvQry_Pes);
  BtnExcluiClick(self);
  BtnAtualizaClick(self);
end;

procedure TFrmPedCompras.Edit_FornecedorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_FornecedoresClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedCompras.Edit_Nro_PedidoExit(Sender: TObject);
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

procedure TFrmPedCompras.Edit_Nro_PedidoKeyPress(Sender: TObject; var Key: char);
begin
   if (not (Key in ['0'..'9','-',#8,#13,#35,#36,#37,#39])) then Key := #0;
end;

procedure TFrmPedCompras.Edit_Nro_Pedido_ProdExit(Sender: TObject);
var oSelect : String;
//    JvQuery : TJvUIBDataset;
begin
   If Trim(Edit_Nro_Pedido_Prod.Text) <> '' then
   begin
      oSelect := 'SELECT PEDCOMPRAS.*, FORNECEDORES.NOME FROM PEDCOMPRAS INNER JOIN FORNECEDORES ON (FORNECEDORES.CODIGO = PEDCOMPRAS.COD_FORNEC) ';
      oSelect := oSelect + ' WHERE PEDCOMPRAS.NRO_PEDIDO = '+ Trim(Edit_Nro_Pedido_Prod.Text);
  //    JvQuery := TJvUIBDataset.Create(self);
    {  try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta(oSelect,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelFornec_Prod.Caption := JvQuery.FieldByName('COD_FORNEC').asString;
            PanelFornecNome_Prod.Caption := JvQuery.FieldByName('NOME').asString;
            vPedCompra_VlAnterior := JvQuery.FieldByName('IND_PRECO').asInteger;
            Carrega_Produtos(JvQuery.FieldByName('NRO_PEDIDO').asInteger);
         end
         else
         begin
            MessageDlg('Pedido de Compra não cadastrado.',mtInformation,[mbOK],0);
            PanelFornec_Prod.Caption := '0';
            PanelFornecNome_Prod.Caption := '';
            vPedCompra_VlAnterior := 0;
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
      PanelFornec_Prod.Caption := '';
      vPedCompra_VlAnterior := 0;
      Carrega_Produtos(0);
   end;
end;

procedure TFrmPedCompras.Edit_PFornecedorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_PFornecedoresClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedCompras.Edit_PNro_PedidoExit(Sender: TObject);
begin

end;

procedure TFrmPedCompras.Edit_PTransportadorExit(Sender: TObject);
//var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_PTransportador.Text)) <> 0) and (Trim(Edit_PTransportador.Text) <> '0') then
   begin
     { JvQuery := TJvUIBDataset.Create(self);
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
      end; }
   end
   else
   begin
      Edit_PTransportador.Text := '0';
      PanelPTransportador.Caption := '';
   end;
end;

procedure TFrmPedCompras.Edit_PTransportadorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin

end;

procedure TFrmPedCompras.Edit_ProdutoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_ProdutoClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedCompras.Edit_Quant_ProdChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      if Trim((Sender as TEdit).Text) <> '' then
      begin
         Calcula_Total;
      end;
   end;
end;

procedure TFrmPedCompras.Edit_TransportadorExit(Sender: TObject);
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
      end;          }
   end
   else
   begin
      Edit_Transportador.Text := '0';
      PanelTransportador.Caption := '';
   end;
end;

procedure TFrmPedCompras.Edit_TransportadorKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then
   begin
      F3_TransportadorClick(Self);
      key := VK_UNKNOWN;
   end;
end;

procedure TFrmPedCompras.F3_PTransportadorClick(Sender: TObject);
begin

end;

procedure TFrmPedCompras.F3_TransportadorClick(Sender: TObject);
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

procedure TFrmPedCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmPedCompras.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmPedCompras.BtnIncluiClick(Sender: TObject);
begin
   Paginas.ActivePageIndex := 0;
   SetStatus('Inserção');
   Operacao := opInsert;
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(self,1);
            Edit_FornecedorExit(Self);
            Edit_TransportadorExit(Self);
            RG_Tipo.ItemIndex := 0;
//            if Parametros.Busca_Chave = 1 then Edit_Nro_Pedido.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_PEDCOMPRAS'));
            Edit_Nro_Pedido.SetFocus;
         end;
      1: Begin
            FrmPrincipal.LimpaCampos(self,3);
            Edit_Nro_Pedido_ProdExit(Self);
            Edit_ProdutoExit(Self);
            //Nao carregou o nro pedido de compra
            if Trim(Edit_Nro_Pedido_Prod.Text) = '' then
            begin
               Edit_Nro_Pedido_Prod.Text := '';
               Edit_Nro_Pedido_Prod.SetFocus;
            end
            else //Deu certo
               Edit_Produto.SetFocus;
         end;
      2: begin

         end;
   end;
end;

procedure TFrmPedCompras.BtnGravaClick(Sender: TObject);
begin
    Case PageCadastro.ActivePageIndex of
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
            //Fonecedor
            if (Length(Trim(Edit_Fornecedor.Text)) = 0) or (Trim(Edit_Fornecedor.Text) = '0') then
            begin
               MessageDlg('Fornecedor deve ser preenchido.', mtInformation,[mbOK],0);
               if Edit_Fornecedor.Enabled then Edit_Fornecedor.SetFocus;
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
                  Edit_Nro_Pedido_Prod.SetFocus;
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
         end;
      2: begin
            //Parcelamento
         end;
   end;
   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   if PageCadastro.ActivePageIndex = 0 then
   begin
//      Carrega_Parametros(Proc_PedCompras);
//      FrmPrincipal.RodaSP(Proc_PedCompras);
   end
   else
   begin
      if PageCadastro.ActivePageIndex = 1 then
      begin
//         Carrega_Parametros(Proc_Produtos);
//         FrmPrincipal.RodaSP(Proc_Produtos);
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
               SetStatus('Inserção');
               Operacao := opInsert;
               Edit_Nro_Pedido.Text := '';
               Edit_Nro_Pedido.SetFocus;
            end;
         end;
      1: begin
            Edit_Nro_Pedido_ProdExit(Self);
         end;
   end;
end;
      {
procedure TFrmPedCompras.Carrega_Parametros(Proc : TJvUIBQuery);
begin
   with Proc do
   begin
      case PageCadastro.ActivePageIndex of
        0: begin
              Params.ByNameAsInteger['POPER'] := Operacao;
              Params.ByNameAsInteger['PNRO_PEDIDO'] := StrToIntZero(Edit_Nro_Pedido.Text);
              Params.ByNameAsInteger['PCOD_FORNEC'] := StrToIntZero(Edit_Fornecedor.Text);
              Params.ByNameAsInteger['PTIPO'] := RG_Tipo.ItemIndex;
              Params.ByNameAsString['PDATA'] := Msk_Data.Text;
              Params.ByNameAsString['PDT_ENTREGA'] := Msk_Dt_Entrega.Text;
              Params.ByNameAsString['PIND_PRECO'] := IIF(Chk_Vl_Anterior.Checked,1,0);
              Params.ByNameAsInteger['PCOD_TRANS'] := StrToIntZero(Edit_Transportador.Text);
              Params.ByNameAsString['POBSERVACAO'] := Memo_OBS.Lines.Text;
              
              //, , , , , SITUACAO, TOT_GERAL, CONTROLE
           end;
        1: begin
              Params.ByNameAsInteger['POPER'] := Operacao;
              Params.ByNameAsInteger['PSEQUENCIA'] := StrToIntZero(Edit_Sequencia.Text);
              Params.ByNameAsString['PNRO_PEDIDO'] := Edit_Nro_Pedido_Prod.Text;
              Params.ByNameAsInteger['PCOD_PRODUTO'] := StrToIntZero(Edit_Produto.Text);
              Params.ByNameAsCurrency['PQUANTIDADE'] := StrToFloatZero(Edit_Quant_Prod.Text);
              Params.ByNameAsCurrency['PVL_UNITARIO'] := StrToFloatZero(TirarPonto(Panel_Vl_Unitario.Caption));
              Params.ByNameAsCurrency['PPERC_DESC'] := StrToFloatZero(TirarPonto(Panel_Vl_Desc.Caption));
           end;
      end;
   end;
end; }

procedure TFrmPedCompras.Carrega_Campos(oDataSet: TDataSet);
//var I : Integer;
begin
   with oDataSet do
   begin
      case PageCadastro.ActivePageIndex of
        0: begin
              Edit_Nro_Pedido.Text := FieldByName('NRO_PEDIDO').asString;
              
              RG_Tipo.ItemIndex := FieldByName('TIPO').asInteger;;

              Edit_Fornecedor.Text := FieldByName('COD_FORNEC').asString;
              Edit_FornecedorExit(self);

              Edit_Controle.Text := FieldByName('CONTROLE').AsString;

              Msk_DataEnter(Msk_Data);
              Msk_Data.Text := FieldByName('DATA').asString;
              Msk_DataExit(Msk_Data);

              Msk_DataEnter(Msk_Dt_Entrega);
              Msk_Dt_Entrega.Text := FieldByName('DT_ENTREGA').asString;
              Msk_DataExit(Msk_Dt_Entrega);


              if FieldByName('IND_PRECO').asInteger = 0 then
                 Chk_Vl_Anterior.Checked := False
              else
                 Chk_Vl_Anterior.Checked := True;


              Edit_Transportador.Text := FieldByName('COD_TRANS').asString;
              Edit_TransportadorExit(self);
              
              Memo_OBS.Lines.Text := FieldByName('OBSERVACAO').asString;
              
              Panel_Tot_Geral.Caption := FormatFloat('#,###,##0.00',FieldByName('TOT_GERAL').asFloat);
           end;
        1: begin
              Edit_Sequencia.Text := FieldByName('SEQUENCIA').AsString;
              Edit_Produto.Text := FieldByName('COD_PRODUTO').AsString;
              Edit_ProdutoExit(Self);
              Edit_Quant_Prod.Text := FieldByName('QUANTIDADE').AsString;
              Panel_Vl_Unitario.Caption := FieldByName('VL_UNITARIO').AsString;
              Panel_Vl_Desc.Caption := FieldByName('PERC_DESC').AsString;
              Calcula_Total;
           end;
      end;
   end;
end;


procedure TFrmPedCompras.Grid_PesquisaDblClick(Sender: TObject);
begin        {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      PageCadastro.ActivePageIndex := 0;
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
      PageCadastroChange(Self);
   end;     }
end;

procedure TFrmPedCompras.Msk_DataEnter(Sender: TObject);
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

procedure TFrmPedCompras.Msk_DataExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '/  /' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmPedCompras.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmPedCompras.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   Case PageCadastro.ActivePageIndex of
      0: begin
            FrmPrincipal.LimpaCampos(self,1);
            Edit_FornecedorExit(Self);
            Edit_TransportadorExit(Self);
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

procedure TFrmPedCompras.FormShow(Sender: TObject);
var //I:Integer;
    //Qry : TJvUIBDataset;
    vSelect : String;
begin
   SetStatus('Pesquisa');
   Operacao := opBrowse;
{   
   JvTransaction.DataBase := FrmPrincipal.base;
   
   Proc_PedCompras.DataBase := FrmPrincipal.base;
   Proc_PedCompras.Transaction := FrmPrincipal.Transaction;
   Proc_PedCompras.BuildStoredProc('PROC_PEDCOMPRAS');
   
   Proc_Produtos.DataBase := FrmPrincipal.base;
   Proc_Produtos.Transaction := FrmPrincipal.Transaction;
   Proc_Produtos.BuildStoredProc('PROC_PEDCOMPRASITEM');
   
   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;
   
   JvQry_Produtos.Database := Frmprincipal.Base;
   JvQry_Produtos.Transaction := Frmprincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' SELECT * FROM PEDCOMPRAITEM INNER JOIN PRODUTOS ON (PEDCOMPRAITEM.COD_PRODUTO = ';
   vSelect := vSelect + ' PRODUTOS.CODIGO) WHERE PEDCOMPRAITEM.NRO_PEDIDO = :PNRO_PEDIDO ';
   vSelect := vSelect + ' ORDER BY PRODUTOS.NOME ';
   JvQry_Produtos.SQL.Add(vSelect);  }

   BtnInclui.SetFocus;
   PageCadastroChange(self);
end;

procedure TFrmPedCompras.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI, aOrdem : String;
    //I: Integer;
begin
   BtnExcluiPesq.enabled := false;
   BtnEditar.enabled := false;
   vSelect := '';
   
   vSelect := vSelect + ' SELECT PEDCOMPRAS.NRO_PEDIDO, PEDCOMPRAS.TIPO, ';
   vSelect := vSelect + ' CASE PEDCOMPRAS.TIPO ';
   vSelect := vSelect + '   WHEN 0 THEN ''COMPRA'' ';
   vSelect := vSelect + '   WHEN 1 THEN ''CONSIGNAÇÃO'' ';
   vSelect := vSelect + ' END TIPO_COMPRA, ';
   vSelect := vSelect + ' PEDCOMPRAS.COD_FORNEC, ';
   vSelect := vSelect + ' FORNECEDORES.NOME, ';
   vSelect := vSelect + ' PEDCOMPRAS.DATA, ';
   vSelect := vSelect + ' PEDCOMPRAS.TOT_GERAL, ';
   vSelect := vSelect + ' PEDCOMPRAS.DT_ENTREGA,';
   vSelect := vSelect + ' PEDCOMPRAS.COD_TRANS,';
   vSelect := vSelect + ' PEDCOMPRAS.IND_PRECO, ';
   vSelect := vSelect + ' PEDCOMPRAS.OBSERVACAO, ';
   vSelect := vSelect + ' PEDCOMPRAS.SITUACAO, ';
   vSelect := vSelect + ' PEDCOMPRAS.CONTROLE ';
   vSelect := vSelect + ' FROM PEDCOMPRAS ';
   vSelect := vSelect + ' INNER JOIN FORNECEDORES ON (PEDCOMPRAS.COD_FORNEC = FORNECEDORES.CODIGO) ';

   CRI := '';
   //Nro Pedido
   If Length(Trim(Edit_PNro_Pedido.Text)) > 0 then
   begin
      CRI := CRI + ' and NRO_PEDIDO = '''+ Trim(Edit_PNro_Pedido.Text) +''' ';
   end;

   //Fornecedor
   If (Length(Trim(Edit_PFornecedor.Text)) > 0) and (StrToIntZero(Edit_PFornecedor.Text) > 0) then
   begin
      CRI := CRI + ' and COD_FORNEC = '+ Trim(Edit_PFornecedor.Text) +' ';
   end;

   //Transportador
   If (Length(Trim(Edit_PTransportador.Text)) > 0) and (StrToIntZero(Edit_PTransportador.Text) > 0) then
   begin
      CRI := CRI + ' and COD_TRANS = '+ Trim(Edit_PTransportador.Text) +' ';
   end;

   //Data
   If Length(Trim(Msk_PData.Text)) > 0 then
   begin
      CRI := CRI + ' and DATA = '''+ FormatDateTime('mm/dd/yyyy',StrToDate(Trim(Msk_PData.Text))) +''' ';
   end;

   //Entrega
   If Length(Trim(Msk_PDt_Entrega.Text)) > 0 then
   begin
      CRI := CRI + ' and DT_ENTREGA = '''+ FormatDateTime('mm/dd/yyyy',StrToDate(Trim(Msk_PDt_Entrega.Text))) +''' ';
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
   end;               }
end;

procedure TFrmPedCompras.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
{   JvQuery := TJvUIBDataset.Create(Self);
   JvQuery.Database := FrmPrincipal.Base;
   JvQuery.Transaction := FrmPrincipal.Transaction;
   try
      Case PageCadastro.ActivePageIndex of
         0: begin
               //Pedido Compra
               If Length(Trim(Edit_Nro_Pedido.Text)) <> 0 then
               begin
                  if not FrmPrincipal.RodaConsulta('Select * from PedCompras where Nro_Pedido = ' + Edit_Nro_Pedido.Text,JvQuery) then Exit;
                  if JvQuery.RecordCount > 0 then
                  begin
                     Operacao := opDelete;
                     Carrega_Campos(JvQuery);
                     if MessageDlg('Confirma exclusão Pedido de Compra: "'+ Edit_Nro_Pedido.Text + #13 +'Fornecedor: "'+ Trim(PanelForn.Caption) +'" ?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                     begin
                        if PageCadastro.ActivePageIndex = 0 then
                        begin
                         //  Carrega_Parametros(Proc_PedCompras);
                           FrmPrincipal.RodaSP(Proc_PedCompras);
                        end
                        else
                        begin
                           if PageCadastro.ActivePageIndex = 1 then
                           begin
                         //     Carrega_Parametros(Proc_Produtos);
                              FrmPrincipal.RodaSP(Proc_Produtos);
                           end;
                        end;
                        FrmPrincipal.LimpaCampos(self,1);
                        Edit_FornecedorExit(Self);
                        Edit_TransportadorExit(Self);
                     end;
                     SetStatus('Pesquisa');
                     Operacao := opBrowse;
                  end
                  else
                  begin
                     MessageDlg('Pedido de Compra com Nro: "'+ Edit_Nro_Pedido.Text +'" ' + #13 +'"Fornecedor: "'+ Trim(PanelForn.Caption) +'" não encontrado.',mtConfirmation,[mbOk],0);
                     FrmPrincipal.LimpaCampos(self,1);
                     Edit_FornecedorExit(Self);
                     Edit_TransportadorExit(Self);
                  end;
                  BtnInclui.SetFocus;
               end;
            end;
         1: begin
               //PedComprasItem
               Edit_Nro_Pedido_ProdExit(Self);
               if Trim(PanelFornec_Prod.Caption) <> '' then
               begin
                  if not FrmPrincipal.RodaConsulta('Select * from PedCompraItem where Sequencia = '+ Edit_Sequencia.Text ,JvQuery) then Exit;
                  if JvQuery.RecordCount > 0 then
                  begin
                     Operacao := opDelete;
                     Carrega_Campos(JvQuery);
                     if MessageDlg('Confirma exclusão do produto'+ #13 + Edit_Produto.Text + ' - ' + PanelProduto.Caption + '?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                     begin
                        if PageCadastro.ActivePageIndex = 0 then
                        begin
                          // Carrega_Parametros(Proc_PedCompras);
                           FrmPrincipal.RodaSP(Proc_PedCompras);
                        end
                        else
                        begin
                           if PageCadastro.ActivePageIndex = 1 then
                           begin
                           //   Carrega_Parametros(Proc_Produtos);
                              FrmPrincipal.RodaSP(Proc_Produtos);
                           end;
                        end;
                        BtnCancelarClick(Self);
                     end;
                     SetStatus('Pesquisa');
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

procedure TFrmPedCompras.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmPedCompras.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   Edit_PFornecedorExit(Self);
   Edit_PTransportadorExit(Self);
   //JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmPedCompras.PageCadastroChange(Sender: TObject);
begin
    BtnInclui.Enabled := True;
    BtnExclui.Enabled := True;
    BtnGrava.Enabled := True;
    BtnCancelar.Enabled := True;
    Case PageCadastro.ActivePageIndex of
      //0: IBProc.StoredProcName := 'PROC_COMPRAS';
      1: begin
            //IBProc.StoredProcName := 'PROC_COMPITEM';
            if StrToIntZero(Edit_Nro_Pedido.Text) > 0 then
            begin
               BtnCancelarClick(Self);
               Edit_Nro_Pedido_Prod.Text := Edit_Nro_Pedido.Text;
               Edit_Nro_Pedido_ProdExit(Self);
            end;
         end;
      2: SetStatus('Edição');
   end;
end;

procedure TFrmPedCompras.PageCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmPedCompras.Edit_FornecedorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
{   If (Length(Trim(Edit_Fornecedor.Text)) <> 0) and (Trim(Edit_Fornecedor.Text) <> '0') then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from FORNECEDORES where Codigo='+ Edit_Fornecedor.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelForn.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Fornecedor não cadastrado.',mtInformation,[mbOK],0);
            PanelForn.Caption := '';
            Edit_Fornecedor.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Fornecedor.Text := '0';
      PanelForn.Caption := '';
   end; }
end;

procedure TFrmPedCompras.F3_FornecedoresClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from Fornecedores';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Fornecedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
 //        Edit_Fornecedor.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Fornecedor.OnExit(Self);
         Edit_Fornecedor.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
      FrmPesquisa := Nil;
   end;
end;

procedure TFrmPedCompras.F3_ObservacaoClick(Sender: TObject);
begin

end;

procedure TFrmPedCompras.Edit_ProdutoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Produto.Text)) <> 0) and (Trim(Edit_Produto.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, CodBarra, Nome, Preco_Vend, Desc_Compra, Ultm_Compra_Preco from Produtos where Codigo='+ Edit_Produto.Text + ' ',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_CodBarra.Text := JvQuery.FieldByName('CODBARRA').asString;
            Edit_CodBarra.Modified := False;
            PanelProduto.Caption := JvQuery.FieldByName('NOME').asString;
            if vPedCompra_VlAnterior = 0 then
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

            if JvQuery.FieldByName('Desc_Compra').asFloat > 0 then
               Panel_Vl_Desc.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Desc_Compra').asFloat)
            else
               Panel_Vl_Desc.Caption := '0';
            Calcula_Total;
         end
         else
         begin
            MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
            Edit_CodBarra.Text := '';
            PanelProduto.Caption := '';
            Edit_Produto.SetFocus;
         end;
      finally
         JvQuery.close;
         JvQuery.free;
      end; }
   end
   else
   begin
      Edit_Produto.Text := '0';
      Edit_CodBarra.Text := '';
      PanelProduto.Caption := '';
   end;
end;

procedure TFrmPedCompras.Edit_CodBarraExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
{   if Edit_CodBarra.Modified = False then Exit;
   If (Length(Trim(Edit_CodBarra.Text)) <> 0) and (Trim(Edit_CodBarra.Text) <> '0') then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome, Preco_Vend, Desc_Compra from Produtos where CodBarra = '''+ Edit_CodBarra.Text + ''' ',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_Produto.Text := JvQuery.FieldByName('CODIGO').AsString;
            PanelProduto.Caption := JvQuery.FieldByName('NOME').asString;
            if vPedCompra_VlAnterior = 0 then
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

            if JvQuery.FieldByName('Desc_Compra').asFloat > 0 then
               Panel_Vl_Desc.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Desc_Compra').asFloat)
            else
               Panel_Vl_Desc.Caption := '0';
            Calcula_Total;
         end
         else
         begin
            if not FrmPrincipal.RodaConsulta('Select Codigo, Nome, Preco_Vend, Desc_Compra from Produtos where ISBN = '''+ Edit_CodBarra.Text + ''' ',JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               Edit_Produto.Text := JvQuery.FieldByName('CODIGO').AsString;
               PanelProduto.Caption := JvQuery.FieldByName('NOME').asString;
               Panel_Vl_Unitario.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Preco_Vend').asFloat);
               Panel_Vl_Desc.Caption := FormatFloat('#,###,##0.00',JvQuery.FieldByName('Desc_Compra').asFloat);
               Calcula_Total;
            end
            else
            begin
               MessageDlg('Produto não cadastrado.',mtInformation,[mbOK],0);
               Edit_Produto.Text := '0';
               PanelProduto.Caption := '';
               Edit_CodBarra.SetFocus;
            end;
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Produto.text := '0';
      Edit_CodBarra.Text := '';
      PanelProduto.Caption := '';
   end; }
end;

procedure TFrmPedCompras.Calcula_Total;
var vl_Total, vl_Desc : Double;
begin
   vl_Total := 0; vl_Desc := 0;
   vl_Total := (StrToFloatZero(Edit_Quant_Prod.Text)) * StrToFloatZero(TirarPonto(Panel_Vl_Unitario.Caption));
   vl_Desc := StrToFloatZero(TirarPonto(Panel_Vl_Desc.Caption));
   vl_Total := vl_Total - (vl_Total * (vl_Desc / 100));
   PanelTotal.Caption := FormatFloat('#,###,###,##0.00',vl_Total);
end;


Procedure TFrmPedCompras.Carrega_Produtos(oNroPedido : Integer);
begin
{   with JvQry_Produtos do
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
         Close;
         Params.ByNameAsInteger['PNRO_PEDIDO'] := oNroPedido;
         Open;
         FormatNumericFields(JvQry_Produtos);
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Produtos.DataSet := JvQry_Produtos;
            DBGrid_Prod.DataSource := Src_Produtos;
         end;
      end;
   end;       }
end;

procedure TFrmPedCompras.DBGrid_ProdDblClick(Sender: TObject);
begin
{   with JvQry_Produtos do
   begin
      if (JvQry_Produtos.Active) and (JvQry_Produtos.RecordCount > 0) then
      begin
         if Operacao = opBrowse then
         begin
            Carrega_Campos(JvQry_Produtos);
            Edit_Quant_Prod.SetFocus;
         end;
      end;
   end; }
end;

procedure TFrmPedCompras.F3_ProdutoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'SELECT  CODIGO Codigo, CODBARRA Codigo_Barra, NOME Nome, SALDO_ATU Quantidade, PRECO_VEND VL_UNITARIO FROM VW_PROD_GERAL ';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Produtos';
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

procedure TFrmPedCompras.DBGrid_ProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      DBGrid_ProdDblClick(Self);
   end;
end;

procedure TFrmPedCompras.F3_PFornecedoresClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from Fornecedores';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Fornecedores';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_PFornecedor.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_PFornecedor.OnExit(Self);
         Edit_PFornecedor.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmPedCompras.Edit_PFornecedorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
{   If (Length(Trim(Edit_PFornecedor.Text)) <> 0) and (Trim(Edit_PFornecedor.Text) <> '0') then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from FORNECEDORES where Codigo='+ Edit_PFornecedor.Text + '',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPForn.Caption := JvQuery.FieldByName('NOME').asString;
         end
         else
         begin
            MessageDlg('Fornecedor não cadastrado.',mtInformation,[mbOK],0);
            PanelPForn.Caption := '';
            Edit_PFornecedor.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_PFornecedor.Text := '0';
      PanelPForn.Caption := '';
   end; }
end;


//No relatorio do pedido de compra fazer a impressao dos itens como nos pedidos de venda


initialization
   {$i upedcompras.lrs}

end.
