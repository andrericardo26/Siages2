Unit UVendas;

{$mode delphi}{$H+}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, ActnList, Grids, DBGrids, ImgList, ComCtrls,
  IniFiles, LResources, LCLType, SynEdit;

type
  TParametros = Record              
          Cliente_Padrao : Integer;
          Imp_Cliente : Boolean;
          CFOP_Padrao : String;
          FormaPagto_Padrao : Integer;
          Vendedor_Padrao : Integer;
          Imp_Vendedor : Boolean;
          Observacao : String;
          Mensagem : String;
          Imp_Mensagem : Boolean;
          Margem_Seg : Boolean;
          Vl_Margem : Double;
          Cupom_Adicional : Boolean;
          Obs_Postos : Boolean;

          //Outros
          Testa_Preco: Boolean;   //Sera utilizado quando deseja-se dar foco no campo preco antes de vende-lo
          Fecha_Rapido : Boolean; //Serao descartados os dados adicionais informados na venda e utilizados os do parametro

          //Uso da Balanca
          Usar_Balanca: Boolean;
          DigIni_Bal: Integer;
          Conteudo_Bal: Integer;
          IniCod_Bal: Integer;
          QtdCod_Bal: Integer;
          IniPreco_Bal: Integer;
          QtdPreco_Bal: Integer;
          Prod_Padrao_Bal : Integer;
          Pagamento_a_Vista : Integer;
          
          //by fernando
          Estq_negativo: Boolean;
  end;

  { TFrmVendasRap }

  TFrmVendasRap = class(TForm)
//     ACBrECF1: TACBrECF;
     Aciona_Gaveta: TAction;
     ActionList1: TActionList;
     Ajuda: TAction;
     Cancela_Cupom: TAction;
     Cancela_Item: TAction;
     Cancela_Venda: TAction;
     Combo_Motorista: TComboBox;
     Combo_Veiculo: TComboBox;
     Confirma_Venda: TAction;
     Desce_Produtos: TAction;
     EditPrecoUnit: TEdit;
     EditProduto: TEdit;
     EditQuantidade: TEdit;
     EditQuantidade2: TEdit;
    Edit_Vendedor: TEdit;
    Edit_Cliente: TEdit;
    Edit_PerctDesc: TEdit;
    Edit_VlrDesc: TEdit;
    Edit_Vlr_Pago: TEdit;
    Edit_Frota: TEdit;
    Edit_Kilometragem: TEdit;
    Edit_Mensagem: TEdit;
    Edit_Nro_Autorizacao: TEdit;
    F1: TAction;
    F10_Sair: TSpeedButton;
    F3_Cliente1: TSpeedButton;
    F3_PesqProd: TSpeedButton;
    F3_Vendedor1: TSpeedButton;
    F5_NovoCupom: TSpeedButton;
    F6_Canc_Item: TSpeedButton;
    F7_Canc_Cupom: TSpeedButton;
    F8_Fin_Cupom: TSpeedButton;
    F9_Impressao: TSpeedButton;
    Finaliza_Cupom: TAction;
    ImageProduto: TImage;
    ImprimeDocs: TAction;
{    JvProc_VendItem: TJvUIBQuery;
    JvProc_Vendas: TJvUIBQuery;
    JvProc_Venda_Vista: TJvUIBQuery;
    JvProc_Venda_Prazo: TJvUIBQuery;
    JvProc_Cancela_Nota_Cupom: TJvUIBQuery;
    JvQryProduto: TJvUIBDataSet;
    JvQry_Cancela: TJvUIBDataSet;    }
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    LabelDescricao: TLabel;
    LabelQuantidade: TLabel;
    Label9: TLabel;
    LabelData: TLabel;
    Label16: TLabel;
    LabelDesconto: TLabel;
    LabelGrupo: TLabel;
    LabelPreco: TLabel;
    LabelCodigo: TLabel;
    LabelTotal: TLabel;
    LabelTot_Compra: TLabel;
    Label18: TLabel;
    LabelUnidade: TLabel;
    LabelVlr_Pago: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    LabelTot_Pagar: TLabel;
    LabelEmpresa: TLabel;
    LabelTroco: TLabel;
    MemoProdutos: TMemo;
    Page1: TPage;
    Panel1: TPanel;
    Panel2: TPanel;
    PanelImage: TPanel;
    Shape1: TShape;
    Shape10: TShape;
    Shape13: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
//    Trans_Vendas: TJvUIBTransaction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Note_OBS: TNotebook;
    Novo_Cupom: TAction;
    Pagamento_Prazo: TAction;
    Pagamento_vista: TAction;
    Page2: TPage;
    Page3: TPage;
    Page4: TPage;
    Page5: TPage;
    Page6: TPage;
    Bevel2: TBevel;
    Paginas: TNotebook;
    PanelFechamento: TPanel;
    Panel5: TPanel;
    PanelCliente1: TPanel;
    PanelCliente2: TPanel;
    PanelCliente: TEdit;
    PanelVendedor: TPanel;
    Panel_Descr_Forma: TPanel;
    Pesq_Prod: TAction;
    Sair_Venda_vista: TAction;
    SBPrazo: TSpeedButton;
    SBVista: TSpeedButton;
    Shape11: TShape;
    Shape12: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Sobe_Produtos: TAction;
    BtnConfirma: TBitBtn;
    BtnCancela: TBitBtn;
    Bevel3: TBevel;
    LabelObservacao: TLabel;
    Shape14: TShape;
    LabelObservacaoSombra: TLabel;
    Bevel4: TBevel;
    Note_Fecha: TNotebook;
    Panel3: TPanel;
    ImageSaida: TImage;
    LabelMensagem: TLabel;
    StringGrid_Parcelas: TStringGrid;

    procedure EditPrecoUnitChange(Sender: TObject);
    procedure EditPrecoUnitEnter(Sender: TObject);
    procedure EditPrecoUnitExit(Sender: TObject);
    procedure EditPrecoUnitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditProdutoChange(Sender: TObject);
    procedure EditProdutoEnter(Sender: TObject);
    procedure EditProdutoExit(Sender: TObject);
//    procedure EditQuantidade1Enter(Sender: TObject);
    procedure EditQuantidadeChange(Sender: TObject);
    procedure EditQuantidadeEnter(Sender: TObject);
    procedure EditQuantidadeExit(Sender: TObject);
    procedure Edit_ClienteChange(Sender: TObject);
    procedure Edit_ClienteExit(Sender: TObject);
    procedure Edit_Vlr_PagoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure Inclui_Produto(oDataSet: TDataSet);
    procedure F10_SairClick(Sender: TObject);
    Procedure Carrega_Logo;
    procedure MemoProdutosChange(Sender: TObject);
    procedure Sair_Venda_vistaExecute(Sender: TObject);
    procedure Novo_CupomExecute(Sender: TObject);
    procedure AjudaExecute(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
    procedure StringGrid_ParcelasClick(Sender: TObject);
    procedure TrataErroVenda;
    procedure F8_Fin_CupomClick(Sender: TObject);
    procedure Finaliza_CupomExecute(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure Edit_VendedorExit(Sender: TObject);
    procedure CalculaDesconto;
    procedure Edit_PerctDescChange(Sender: TObject);
    procedure Edit_VlrDescChange(Sender: TObject);
    procedure Edit_Vlr_PagoChange(Sender: TObject);
    procedure F3Execute(Sender: TObject);
    procedure F3_ClienteClick(Sender: TObject);
    procedure F3_VendedorClick(Sender: TObject);
    Procedure ImprFiscal_Nao_Definida;
    procedure Carrega_Aliquotas;
    procedure Carrega_FormasPagto;
    procedure Cancela_CupomExecute(Sender: TObject);
    procedure Cancela_ItemExecute(Sender: TObject);

    Function  Abre_CupomFiscal : Boolean;
    Function  Cancela_CupomFiscal : Boolean;
    Function  VendeItem(Codigo, Descricao, Unidade : String; SituacaoQtoIcm : Integer; Aliquota : Single; Casas : SmallInt; Quantidade, Vl_Unitario, Desconto: Double): Boolean;
//    Function  VendeItem(Codigo, Descricao : String; SituacaoQtoIcm : Integer; Aliquota : Single; Quantidade, Vl_Unitario, Desconto: Double): Boolean;
    Function  EfetuaPagamento_CupomFiscal : Boolean;
    Function  Retorna_NroCupom : String;
    Function  Retorna_NroCaixa : String;
    procedure Edit_Vlr_PagoEnter(Sender: TObject);
    procedure Edit_Vlr_PagoClick(Sender: TObject);
    Function  Tira_Ponto(oValor: String): String;
    procedure Confirma_VendaExecute(Sender: TObject);
    procedure Cancela_VendaExecute(Sender: TObject);
    Procedure Carrega_Parametros_Sistema_Venda;
    procedure FormActivate(Sender: TObject);
    Procedure Carrega_Atributos_Produto(oDataSet: TDataSet);
    procedure Sobe_ProdutosExecute(Sender: TObject);
    procedure Desce_ProdutosExecute(Sender: TObject);
    Procedure TrataErro_VendItem(oProduto:String);
    procedure SBPrazoClick(Sender: TObject);
    procedure SBVistaClick(Sender: TObject);
    procedure Pagamento_PrazoExecute(Sender: TObject);
    procedure Aciona_GavetaExecute(Sender: TObject);
    procedure FechaPortaSerial;
    Function  Analisa_Cliente(oCliente : Integer; oValor : Double) : Boolean;

  private
    { Private declarations }
    vOper : Integer;
    oCupom : String;
    procedure SetOper(const Value: Integer);


  published
    property Operacao:Integer read vOper write SetOper;

  public
    { Public declarations }

  end;


const
   opPadrao       = 1;
   opEmVenda      = 2;
   opEmFechamento = 3;

var
  FrmVendasRap: TFrmVendasRap;
  vControle : Integer;
  vNota     : String[6];
  vSerie    : String[3];
  vFormaPagto : Integer;
  vDesconto : Single;
  vTotal_Geral, vTotal_Pagar, vl_TotProd, vJuros, vDescontos : Double;
  Aliquotas : array[0..25] of String[7];
  FormasPagto : array[0..25] of String[30];
  UltProdCod_Vend : LongInt;
  UltProdSeq_Vend : LongInt;
  CFOP : String;
  //Tabelas de Referencia - Usado no cancelamento do Item Generico
  Prod_Seq_CF   : Array of Integer;
  Prod_Cod_Prod : Array of Integer;
  Prod_Seq_Prod : Array of Integer;
  Prod_Vlr_Prod : Array of Real;
  //Parametros da venda
  Param_Venda : TParametros;
  Urano_Porta : array[0..3] of Char;
  oItemRetorno : Integer; //Cancelamento do item generico

  
implementation

uses UPrincipal, Global, UPesqProd_Vendas, UConsulta, {UImpFisc,} UCancItem,
  UGeraParc, UVariaveis, UImprDocs;


Procedure TFrmVendasRap.Carrega_Parametros_Sistema_Venda;
Var aImpr : String;
//    JvQuery : TJvUIBDataset;
begin
{   JvQuery := TJvUIBDataset.Create(self);
   try
      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction;

      if not FrmPrincipal.RodaConsulta('Select * from Parametros',JvQuery) then Exit;
      if JvQuery.RecordCount > 0 then
      begin
         Param_Venda.Cliente_Padrao    := JvQuery.FieldByName('COD_CLIPADRAO').asInteger;
         Param_Venda.Imp_Cliente       := IIF(JvQuery.FieldByName('IMP_CLIENTE').asInteger = 1, True, False);
         Param_Venda.CFOP_Padrao       := JvQuery.FieldByName('COD_CFOPPADRAO').asString;
         Param_Venda.FormaPagto_Padrao := JvQuery.FieldByName('COD_FORMAPADRAO').asInteger;
         Param_Venda.Vendedor_Padrao   := JvQuery.FieldByName('COD_VENDPADRAO').asInteger;
         Param_Venda.Imp_Vendedor      := IIF(JvQuery.FieldByName('IMP_VENDEDOR').asInteger = 1, True, False);
         Param_Venda.Observacao        := JvQuery.FieldByName('OBSERVACAO').asString;
         Param_Venda.Mensagem          := JvQuery.FieldByName('MENSAGEM').asString;
         Param_Venda.Imp_Mensagem      := IIF(JvQuery.FieldByName('IMP_MENSAGEM').asInteger = 1, True, False);
         Param_Venda.Margem_Seg        := IIF(JvQuery.FieldByName('MARGEM_SEG').asInteger = 1, True, False);
         Param_Venda.Vl_Margem         := JvQuery.FieldByName('VL_MARGEM').asFloat;
         Param_Venda.Cupom_Adicional   := IIF(JvQuery.FieldByName('CF_ADICIONAL_PRAZO').asInteger = 1, True, False);
         Param_Venda.Obs_Postos        := IIF(JvQuery.FieldByName('OBS_POSTO_COMB').AsInteger = 1, True, False);

         //Outros
         Param_Venda.Testa_Preco       := IIF(JvQuery.FieldByName('TESTA_PRECO').asInteger = 1, True, False);
         Param_Venda.Fecha_Rapido      := IIF(JvQuery.FieldByName('FECHA_RAPIDO').asInteger = 1, True, False);

         //Utilizacao da Balanca
         Param_Venda.Usar_Balanca    := IIF(JvQuery.FieldByName('USAR_BALANCA').asInteger = 1, True, False);
         Param_Venda.DigIni_Bal      := JvQuery.FieldByName('DIGINI_BAL').asInteger;
         Param_Venda.Conteudo_Bal    := JvQuery.FieldByName('CONTEUDO_BAL').asInteger;
         Param_Venda.IniCod_Bal      := JvQuery.FieldByName('INICOD_BAL').asInteger;
         Param_Venda.QtdCod_Bal      := JvQuery.FieldByName('QTDCOD_BAL').asInteger;
         Param_Venda.IniPreco_Bal    := JvQuery.FieldByName('INIPRECO_BAL').asInteger;
         Param_Venda.QtdPreco_Bal    := JvQuery.FieldByName('QTDPRECO_BAL').asInteger;
         Param_Venda.Prod_Padrao_Bal := JvQuery.FieldByName('PROD_PADRAO_BAL').asInteger;
         Param_Venda.Pagamento_a_Vista := JvQuery.FieldByName('FORMAPAG_VISTA').asInteger;
         
         //by fernando
         Param_Venda.Estq_negativo   := IIF(JvQuery.FieldByName('ESTQ_NEGATIVO').AsInteger = 1, True, False);
      end
      else
      begin
         Param_Venda.Usar_Balanca    := False;
         Param_Venda.DigIni_Bal      := 0;
         Param_Venda.Conteudo_Bal    := 0;
         Param_Venda.IniCod_Bal      := 0;
         Param_Venda.QtdCod_Bal      := 0;
         Param_Venda.IniPreco_Bal    := 0;
         Param_Venda.QtdPreco_Bal    := 0;
         Param_Venda.Prod_Padrao_Bal := 0;
      end;
   finally
      JvQuery.Close;
      JvQuery.Free;
      JvQuery := Nil;
   end; }
end;

Function TFrmVendasRap.Tira_Ponto(oValor: String): String;
var I: Integer;
begin
   Result := '';
   For I := 1 to Length(oValor) do
   begin
      if oValor[I] <> '.' then
         Result := Result + oValor[I];
   end;
end;

Function TFrmVendasRap.Retorna_NroCupom : String;
var cNumeroCupom: String;
    iConta   : Integer;
Begin
//   Result := ACBrECF1.NumCupom;
   {if Parametros.IMPFIS_INDEX = -1 then
   begin
      ImprFiscal_Nao_Definida;
   end
   else if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then       //Bematech I e II
   begin
      For iConta := 1 To 6 Do Begin cNumeroCupom := cNumeroCupom + ' ' End;
      Bematech_Retorno := Bematech_FI_NumeroCupom( cNumeroCupom );
      FrmPrincipal.TrataErro_Bematech;
      if Bematech_Retorno = 1 then
      begin
         Result := IntToStr(StrToInt(cNumeroCupom) + 1);
      end
      else
         Result := 'Erro';
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      if Numerocupom(cNumeroCupom) then
         Result := cNumeroCupom
      else
         Result := 'Erro';
   end
   else if Parametros.IMPFIS_INDEX = 3 then  //Urano
   begin
      Urano_Retorno := Busca_Registrador('18',cNumeroCupom); //Contador de ordem de operação final
      if Urano_Retorno = 33 then
         Result := Trim(IntToStr(StrToInt(cNumeroCupom) + 1))
      else
         Result := 'Erro';
   end
   else if Parametros.IMPFIS_INDEX = 4 then //Daruma
   begin
      For iConta := 1 To 6 Do Begin cNumeroCupom := cNumeroCupom + ' ' End;
      Daruma_Retorno := Daruma_FI_NumeroCupom( cNumeroCupom );
      Daruma_Analisa_Retorno;
      if Daruma_Retorno = 1 then
      begin
         Result := IntToStr(StrToInt(cNumeroCupom)+ 1);
      end
      else
         Result := 'Erro';
   end;}
End;

procedure TFrmVendasRap.Carrega_Aliquotas;
var cAliquotas, Aux, aPorta : String;
    iConta, I : Integer;
Begin
   {if Parametros.IMPFIS_INDEX = -1 then
   begin
      ImprFiscal_Nao_Definida;
   end
   else if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then       //Bematech I e II
   begin
      For iConta := 1 To 79 Do Begin cAliquotas := cAliquotas + ' ' End;
      Bematech_Retorno := Bematech_FI_RetornoAliquotas( cAliquotas );
      FrmPrincipal.TrataErro_Bematech;
      if Bematech_Retorno = 1 then
      begin
         For iConta := 0 To 25 Do Begin Aliquotas[iConta] := ''; End;
         iConta := 0;
         while Length(cAliquotas) > 0 do
         begin
            Aliquotas[iConta] := Copy(cAliquotas,1,4);
            cAliquotas := Copy(cAliquotas,6,Length(cAliquotas));
            Inc(iConta);
         end;
      end
      else
      begin
         MessageDlg('ATENÇÃO : Alíquotas não carregadas. '+#13+'Confira o equipamento do ECF e tente novamente.',mtWarning,[mbOk],0);
      end;
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      //Abre a Porta
      aPorta := Parametros.PORTA_IMPRFISCAL;
      if aPorta = '' then aPorta := 'COM1';
      AbrePorta(aPorta);

      For iConta := 0 To 25 Do Begin Aliquotas[iConta] := ''; End;
      iConta := 1;
      InfoAliq (cAliquotas);
      For I := 0 To 25 Do
      begin
         aux := Copy(cAliquotas,iConta,7);
         if aux = '' then break;
         Aliquotas[I] := Aux;
         iConta := iConta + 7;
         If iConta >= 420 then Break;
      end;
   end
   else if Parametros.IMPFIS_INDEX = 3 then  //URANO
   begin
      //Abre a Porta
      aPorta := Parametros.PORTA_IMPRFISCAL;
      if aPorta = '' then aPorta := 'COM1';
      StrPCopy(Urano_Porta,aPorta);
      FinalizaDLL; //Nao busca retorno
      Urano_Retorno := InicializaDLL(Urano_Porta);
      TrataErro_Urano(Urano_Retorno);

      iConta := 0;
      For I := 34 to 40 do
      begin
         Urano_Retorno := Busca_Registrador(IntToStr(I),aux);
         if Urano_Retorno <> 33 then //33 = Comando OK
         begin
            MessageDlg('ATENÇÃO : Alíquotas não carregadas. '+#13+'Confira o equipamento do ECF e tente novamente.',mtWarning,[mbOk],0);
            Break;
         end;
         Aliquotas[iConta] := Trim(Aux);
         Inc(iConta);
      end;
   end
   else if Parametros.IMPFIS_INDEX = 4 then  //Daruma
   begin
      For iConta := 1 To 79 Do Begin cAliquotas := cAliquotas + ' ' End;
      Daruma_Retorno := Daruma_FI_RetornoAliquotas( cAliquotas );
      Daruma_Analisa_Retorno;
      if Daruma_Retorno = 1 then
      begin
         For iConta := 0 To 25 Do Begin Aliquotas[iConta] := ''; End;
         iConta := 0;
         while Length(cAliquotas) > 0 do
         begin
            Aliquotas[iConta] := Copy(cAliquotas,1,4);
            cAliquotas := Copy(cAliquotas,6,Length(cAliquotas));
            Inc(iConta);
         end;
      end
      else
      begin
         MessageDlg('ATENÇÃO : Alíquotas não carregadas. '+#13+'Confira o equipamento do ECF e tente novamente.',mtWarning,[mbOk],0);
      end;
   end;}
end;

procedure TFrmVendasRap.Carrega_FormasPagto;
var cFormas, Aux : String;
    iConta, I : Integer;
Begin
   {if Parametros.IMPFIS_INDEX = -1 then
   begin
      ImprFiscal_Nao_Definida;
   end
   else if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then       //Bematech I e II
   begin
      //Não necessitam serem programadas
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      InfoFPgto(cFormas);
      //Inclui Forma de Pagamento
      For iConta := 0 To 25 Do Begin FormasPagto[iConta] := ''; End;
      iConta := 0;
      while Length(cFormas) > 0 do
      begin
         FormasPagto[iConta] := Copy(cFormas,1,30);
         cFormas := Copy(cFormas,30,Length(cFormas));
         Inc(iConta);
         If Trim(Copy(cFormas,1,30)) = '' then Break;
      end;
   end
   else if Parametros.IMPFIS_INDEX = 3 then  //Urano
   begin
      iConta := 1;
      For I := 42 to 51 do
      begin
         Urano_Retorno := Busca_Registrador(IntToStr(I),aux);
         if Urano_Retorno <> 33 then //33 = Comando OK
         begin
            MessageDlg('ATENÇÃO : Formas de Pagamento não carregadas. '+#13+'Confira o equipamento do ECF e tente novamente.',mtWarning,[mbOk],0);
            Break;
         end;
         FormasPagto[iConta] := Trim(Copy(Aux,2,Length(Aux)));
         Inc(iConta);
      end;
   end
   else if Parametros.IMPFIS_INDEX = 4 then //Daruma
   begin
      //Não necessitam serem programadas
   end;}
end;

procedure TFrmVendasRap.SetOper(const Value: Integer);
// var JvQry : TJvUIBDataSet;
begin
{  if Value <> vOper then
  begin
    vOper := Value;
    try
    Screen.Cursor := crHourGlass;
    case voper of
       opPadrao :
                  begin
                     oCupom := '';
                     //F3_PesqProd.Enabled := False;
                     F5_NovoCupom.Enabled := True;
                     F6_Canc_Item.Enabled := False;
                     //F7_Canc_Cupom.Enabled := True;
                     F7_Canc_Cupom.Enabled := false;
                     F8_Fin_Cupom.Enabled := False;
                     //EditProduto.Enabled := False;
                     //EditQuantidade.Enabled := False;
                     //EditPrecoUnit.Enabled := False;
                     MemoProdutos.Lines.Clear;
                     LabelTotal.Caption := '0,00';
                     EditQuantidade.Text := '1,00';
                     // EditPrecoUnit.Lines.Text := '0,00'; *fernando
                     EditPrecoUnit.Text := '0,00';
                     LabelDescricao.Caption := '';
                     LabelUnidade.Caption := '';
                     LabelGrupo.Caption := '';
                     LabelCodigo.Caption := '';
                     LabelQuantidade.Caption := '';
                     LabelPreco.Caption := '';
                     Carrega_Logo;
                     vDesconto := 0;
                     Paginas.ActivePage := 'Vendas';
                     PanelFechamento.Enabled := False;
                     Edit_PerctDesc.Enabled := False;
                     Edit_VlrDesc.Enabled := False;
                     Edit_Vlr_Pago.Enabled := False;
                     BtnConfirma.Enabled := False;
                     BtnCancela.Enabled := False;
                //     if Trans_Vendas.InTransaction then Trans_Vendas.Rollback; //descomentado por fernando
                  end;
       opEmVenda :
                  begin
                     //F3_PesqProd.Enabled := True;
                     F5_NovoCupom.Enabled := False;
                     F6_Canc_Item.Enabled := True;
                     //F7_Canc_Cupom.Enabled := False;
                     F7_Canc_Cupom.Enabled := True;
                     F8_Fin_Cupom.Enabled := True;
                     //EditProduto.Enabled := True;
                     //EditQuantidade.Enabled := True;
                     //EditPrecoUnit.Enabled := True;
                     //EditProduto.SetFocus;
                     Paginas.ActivePage := 'Vendas';
                     vTotal_Geral := 0;
                     vTotal_Pagar := 0;
                     vl_TotProd := 0;
                  end;

       opEmFechamento :
                  begin
                     Edit_Vendedor.Text  := '0';
                     Edit_VendedorExit(Self);
                     //ListParcelas.Items.Clear;
                     LabelTot_Compra.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);
                     LabelTot_Pagar.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);
                     LabelVlr_Pago.Caption := FormatFloat('#,###,###,##0.00',0);
                     LabelTroco.Caption := FormatFloat('#,###,###,##0.00',0);
                     Edit_PerctDesc.Text := '0,00';
                     Edit_VlrDesc.Text   := '0,00';
                     Edit_Vlr_Pago.Text  := '0,00';
                     vTotal_Pagar := vTotal_Geral;
                     vJuros := 0;
                     //Bota as informacoes dos parametros
                     LabelObservacao.Caption := Param_Venda.Observacao;
                     LabelObservacaoSombra.Caption := Param_Venda.Observacao;
                     Edit_Cliente.Text := IntToStr(Param_Venda.Cliente_Padrao);
                     Edit_ClienteExit(Self);
                     //Edit_Forma.Value := Param_Venda.FormaPagto_Padrao;
                     //Edit_FormaExit(Self);
                     if Param_Venda.Obs_Postos then
                        Note_OBS.ActivePage := 'Postos'
                     else
                        Note_OBS.ActivePage := 'Comercio';
                        
                     Edit_Mensagem.Text := Param_Venda.Mensagem;
                     Edit_Kilometragem.Text := '';
                     Edit_Frota.Text := '';
                     Edit_Nro_Autorizacao.Text := '';
                     Combo_Veiculo.Items.Clear;
                     Combo_Veiculo.Text := '';
                     Combo_Motorista.Items.Clear;
                     Combo_Motorista.Text := '';
                     CFOP := Param_Venda.CFOP_Padrao;
                     Edit_Vendedor.Text := IntTostr(Param_Venda.Vendedor_Padrao);
                     Edit_VendedorExit(Self);
                     if Param_Venda.Fecha_Rapido then
                        Note_Fecha.ActivePage := 'Mensagem'
                     else
                        Note_Fecha.ActivePage := 'Informa';
                        
                     PanelFechamento.Enabled := True;
                     Edit_PerctDesc.Enabled := True;
                     Edit_VlrDesc.Enabled := True;
                     Edit_Vlr_Pago.Enabled := True;
                     BtnConfirma.Enabled := True;
                     BtnCancela.Enabled := True;

                     Paginas.ActivePage := 'Fechamento';
                     SBVista.Down := True;
                     SBVistaClick(Self);

                     if Param_Venda.Fecha_Rapido then
                        Edit_Vlr_Pago.SetFocus;
                  end;
    end;
    finally
       Screen.Cursor := crDefault;
    end;
  end;  }
end;

Procedure TFrmVendasRap.Carrega_Logo;
begin
   Try
      if Parametros.PATHLOGO <> '' then
         ImageProduto.Picture.LoadFromFile(Parametros.PATHLOGO)
      else
         ImageProduto.Picture := Nil;
   except
   end;
end;

procedure TFrmVendasRap.MemoProdutosChange(Sender: TObject);
begin
   MemoProdutos.VertScrollBar.Position := MemoProdutos.VertScrollBar.Range;
end;

procedure TFrmVendasRap.FechaPortaSerial;
begin
   //Fecha a Porta Serial
      {if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then       //Bematech I e II
      begin
         Bematech_FI_FechaPortaSerial;
      end
      else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
      begin
         FechaPortaSerial;
      end
      else if Parametros.IMPFIS_INDEX = 4 then  //Daruma
      begin
         Daruma_FI_FechaPortaSerial;
      end;}
end;

procedure TFrmVendasRap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action := CaFree;
end;

procedure TFrmVendasRap.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var Mens : String;
begin
   Mens := '';             {
   if Trans_Vendas.InTransaction then //Esta em venda
      Mens := 'Se você sair agora esta Venda e este Cupom serão cancelados. ' + #13;
   if MessageDlg(Mens +'Você tem certeza de que deseja sair ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
      if Trans_Vendas.InTransaction then Trans_Vendas.Rollback;
      Cancela_CupomFiscal;
      CanClose := true;
   end
   else
       CanClose := false; }
end;

procedure TFrmVendasRap.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {if Key = VK_F3 then
  begin
       showmessage('parabens!');
  end;}
end;

procedure TFrmVendasRap.FormKeyPress(Sender: TObject; var Key: char);
begin
end;

procedure TFrmVendasRap.EditPrecoUnitEnter(Sender: TObject);
begin
   EditPrecoUnit.Tag := 0;
   //EditPrecoUnit.SelStart := 0;
   //EditPrecoUnit.SelLength := Length(EditPrecoUnit.Text);
end;

procedure TFrmVendasRap.EditPrecoUnitChange(Sender: TObject);
begin
  LabelPreco.Caption := EditPrecoUnit.Text;
end;

procedure TFrmVendasRap.EditPrecoUnitExit(Sender: TObject);
begin
   //EditPrecoUnit.SelLength := 0;
   if not ValNumero(EditPrecoUnit.Text) then
   begin
      MessageDlg('Quantidade inválida.',mtWarning,[mbOk],0);
      Exit;
   end;
   EditPrecoUnit.Text := FormatFloat('######0.00',StrToFloatZero(EditPrecoUnit.Text));

   if (Param_Venda.Testa_Preco) and (Trim(EditProduto.Text) <> '') then
   begin
      //EditPrecoUnit.Text := FormatFloat('#,###,##0.00',EditPrecoUnit.Value);
//      Inclui_Produto(JvQryProduto);
   end;
   EditProduto.SetFocus;
end;

procedure TFrmVendasRap.EditPrecoUnitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
   begin
      EditQuantidade.Text := '1';
      EditPrecoUnit.Text := '0,00';
      EditProduto.Text := '';
      EditProdutoExit(Self);
      //Limpa o resto
      LabelGrupo.Caption := '';
      LabelDescricao.Caption := '';
      LabelUnidade.Caption := '';
      Carrega_Logo;
      EditProduto.SetFocus;
   end;
end;

procedure TFrmVendasRap.EditProdutoChange(Sender: TObject);
begin
  LabelCodigo.Caption := EditProduto.Text;
end;

procedure TFrmVendasRap.EditProdutoEnter(Sender: TObject);
begin
//showmessage('enter');
   EditProduto.Text := '';
   //produto := '';
   //EditProdutoExit(Self);
end;

procedure TFrmVendasRap.EditProdutoExit(Sender: TObject);
var mensagem, produto: String;
begin

 {  if produto <> '' then exit; // se o produto nao estiver vazio, eh pq jah estah executando essa procedure, entao nao pode entrar denovo!

   produto := EditProduto.text;
   //MemoProdutos.lines.add('\n - produto='+produto);

   If Trim(produto) <> '' then
   begin
      If ValNumero(produto) then
      begin

        //showmessage('edit=' + EditProduto.text + ' prod=' + produto);
         Novo_Cupom.Execute;
         //by fernando: teste se existe produto em estoque, ou esta no saldo minimo
         {
         //procura pelo codigo de barras
         if not FrmPrincipal.RodaConsulta('Select * from VW_Prod_ECF where CodBarra='''+  produto +'''',JvQryProduto) then Exit;
         if JvQryProduto.RecordCount > 0 then
         begin
           if JvQryProduto.FieldByName('SALDO_ATU').asInteger <= JvQryProduto.FieldByName('EST_MINIMO').asInteger then //se esta abaixo ããdo est minimo
              mensagem := 'Estoque mínimo atingido. Saldo atual: ' + JvQryProduto.FieldByName('SALDO_ATU').asString;

           if (JvQryProduto.FieldByName('SALDO_ATU').asInteger - StrToFloatZero(EditQuantidade.Text)) < 0 then //se nao eh suficiente
           begin
              mensagem := mensagem + #13 + #13 + 'E S T O Q U E  I N S U F I C I E N T E !';
              if not Param_Venda.Estq_negativo then //se nao e permitido estoque negativo nao adiciona
              begin
                 mensagem := mensagem + #13 + 'Saldo negativo não permitido! Item não adicionado.';
                 MessageDlg(mensagem,mtWarning,[mbOk],0);
                 exit;
              end;
           end;
           if mensagem <> '' then
              MessageDlg(mensagem,mtWarning,[mbOk],0); //se e permitido, mostra a mensagem e continua
         end
         else
         begin
           //procura pelo codigo
           if not FrmPrincipal.RodaConsulta('Select * from VW_Prod_ECF where Codigo='+  produto,JvQryProduto) then Exit;
           if JvQryProduto.RecordCount > 0 then //se existe
           begin
             if JvQryProduto.FieldByName('SALDO_ATU').asInteger <= JvQryProduto.FieldByName('EST_MINIMO').asInteger then //se esta abaixo ããdo est minimo
                mensagem := 'Estoque mínimo atingido. Saldo atual: ' + JvQryProduto.FieldByName('SALDO_ATU').asString;

             if (JvQryProduto.FieldByName('SALDO_ATU').asInteger - StrToFloatZero(EditQuantidade.Text)) < 0 then //se nao eh suficiente
             begin
                mensagem := mensagem + #13 + #13 + 'E S T O Q U E  I N S U F I C I E N T E !';
                if not Param_Venda.Estq_negativo then //se nao e permitido estoque negativo nao adiciona
                begin
                   mensagem := mensagem + #13 + 'Saldo negativo não permitido! Item não adicionado.';
                   MessageDlg(mensagem,mtWarning,[mbOk],0);
                   exit;
                end;
             end;
             if mensagem <> '' then
                MessageDlg(mensagem,mtWarning,[mbOk],0); //se e permitido, mostra a mensagem e continua
           end;
           
         end;
         

         //Primeiro olha se e produto da balanca
         if (Param_Venda.Usar_Balanca) and (Length(produto) = 13) and (StrToInt(Copy(produto,1,1)) = Param_Venda.DigIni_Bal) then
         begin
            //BUSCAR DA BALANCA
            if Param_Venda.Conteudo_Bal = 0 then  //PRODUTO + VALOR
            begin
               EditQuantidade.Text := '1,00';
               EditPrecoUnit.Text := FormatFloat('#,##0.00',(StrToFloat(Copy(produto,Param_Venda.IniPreco_Bal,Param_Venda.QtdPreco_Bal))/100));
               if StrToInt(Copy(produto,Param_Venda.IniCod_Bal,Param_Venda.QtdCod_Bal)) > 0 then
                  produto := IntToStr(StrToInt(Copy(produto,Param_Venda.IniCod_Bal,Param_Venda.QtdCod_Bal)))
               else
                  produto := IntToStr(Param_Venda.Prod_Padrao_Bal);
            end
            else  //PRODUTO + PESO
            begin
               EditQuantidade.Text := FormatFloat('#,##0.00',(StrToFloat(Copy(produto,Param_Venda.IniPreco_Bal,Param_Venda.QtdPreco_Bal))/1000));
               EditPrecoUnit.Text := '0';
               if StrToInt(Copy(produto,Param_Venda.IniCod_Bal,Param_Venda.QtdCod_Bal)) > 0 then
                  produto := IntToStr(StrToInt(Copy(produto,Param_Venda.IniCod_Bal,Param_Venda.QtdCod_Bal)))
               else
                  produto := IntToStr(Param_Venda.Prod_Padrao_Bal);
            end;
         end;
         if Length(produto) = 13 then
         begin
            //procura pelo codigo de barras
            if not FrmPrincipal.RodaConsulta('Select * from VW_Prod_ECF where CodBarra='''+  produto +'''',JvQryProduto) then Exit;
            if JvQryProduto.RecordCount > 0 then
            begin
               Carrega_Atributos_Produto(JvQryProduto);
               if Param_Venda.Testa_Preco then
               begin
                  EditPrecoUnit.SetFocus;
               end
               else
                  Inclui_Produto(JvQryProduto); Exit;
            end
            else
            begin
               //Procura pelo codigo simples
               if not FrmPrincipal.RodaConsulta('Select * from VW_Prod_ECF where Codigo='+  produto,JvQryProduto) then Exit;
               if JvQryProduto.RecordCount > 0  then
               begin
                  Carrega_Atributos_Produto(JvQryProduto);
                  if Param_Venda.Testa_Preco then
                     EditPrecoUnit.SetFocus
                  else
                     Inclui_Produto(JvQryProduto); Exit;
               end
               else
               begin
                  MessageDlg('Produto não cadastrado ou sem tributação definida para "'+ Parametros.UF +'"',mtWarning,[mbOK],0);
                  EditProduto.SetFocus;
               end;
            end;
         end
         else
         begin
            //Procura pelo codigo simples
            if not FrmPrincipal.RodaConsulta('Select * from VW_Prod_ECF where Codigo='+  produto,JvQryProduto) then Exit;
            if JvQryProduto.RecordCount > 0 then
            begin
               Carrega_Atributos_Produto(JvQryProduto);
               if Param_Venda.Testa_Preco then
                  EditPrecoUnit.SetFocus
               else
                  Inclui_Produto(JvQryProduto); Exit;
            end
            else
            begin
               //procura pelo codigo de barras
               produto := StrZero(StrToFloat(produto),13,0);
               if not FrmPrincipal.RodaConsulta('Select * from VW_Prod_ECF where CodBarra='''+  produto +'''',JvQryProduto) then Exit;
               if JvQryProduto.RecordCount > 0 then
               begin
                  Carrega_Atributos_Produto(JvQryProduto);
                  if Param_Venda.Testa_Preco then
                     EditPrecoUnit.SetFocus
                  else
                     Inclui_Produto(JvQryProduto); Exit;
               end
               else
               begin
                  MessageDlg('Produto não cadastrado ou sem tributação definida para "'+ Parametros.UF +'"',mtWarning,[mbOK],0);
                  EditProduto.SetFocus;
               end;
            end;
         end;
      end
      else
      begin
         MessageDlg('Codigo não é um número inteiro valido.',mtWarning,[mbOK],0);
         EditProduto.SetFocus;
      end;
   end
   else
   begin
      //EditQuantidade.SetFocus;
      //EditQuantidade.text := '10';
   end;
   //LabelDescricao.Caption := '';
   //LabelUnidade.Caption := '';
   //LabelGrupo.Caption := '';
   //Carrega_Logo;
   produto := '';}
end;
     {
procedure TFrmVendasRap.EditQuantidade1Enter(Sender: TObject);
begin

end;}

procedure TFrmVendasRap.EditQuantidadeChange(Sender: TObject);
begin
  LabelQuantidade.Caption := EditQuantidade.Text;
end;

procedure TFrmVendasRap.EditQuantidadeEnter(Sender: TObject);
begin
  //EditQuantidade.SelStart := 0;
  //EditQuantidade.SelLength := Length(EditQuantidade.Text);
end;

procedure TFrmVendasRap.EditQuantidadeExit(Sender: TObject);
begin
     //EditQuantidade.SelLength := 0;
   if not ValNumero(EditQuantidade.Text) then
   begin
      MessageDlg('Quantidade inválida.',mtWarning,[mbOk],0);
      Exit;
   end;
   EditQuantidade.Text := FormatFloat('######0.00',StrToFloatZero(EditQuantidade.Text));
   if Param_Venda.Testa_Preco then
   begin
      EditQuantidade.Text := FormatFloat('#,###,##0.00',StrToFloatZero(EditQuantidade.Text));
      EditProduto.SetFocus;
   end;
   if StrToFloatZero(EditQuantidade.Text) = 0 then EditQuantidade.text := '0,00';
end;

procedure TFrmVendasRap.Edit_ClienteChange(Sender: TObject);
begin

end;

procedure TFrmVendasRap.Edit_ClienteExit(Sender: TObject);
// var JvQuery, JvQry_Veiculos, JvQry_Motoristas : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cliente.Text)) <> 0) and (Trim(Edit_Cliente.Text) <> '0') then
   begin
   {   JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME, ENDERECO, BAIRRO, CIDADE, UF, CEP, CPF, CGC From CLIENTES where Codigo='+ Edit_Cliente.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCliente.Text := JvQuery.FieldByName('NOME').asString;
            PanelCliente1.Caption := JvQuery.FieldByName('ENDERECO').asString + ' - ' + JvQuery.FieldByName('BAIRRO').asString;
            PanelCliente2.Caption := JvQuery.FieldByName('CEP').asString + ' ' + JvQuery.FieldByName('CIDADE').asString + ' ' + JvQuery.FieldByName('UF').asString;
            if (Trim(JvQuery.FieldByName('CPF').asString) <> '') and (Trim(JvQuery.FieldByName('CPF').asString) <> '.   .   -') then
               PanelCliente2.Caption := PanelCliente2.Caption + ' CPF:' + JvQuery.FieldByName('CPF').asString
            else
               PanelCliente2.Caption := PanelCliente2.Caption + ' CNPJ:' + JvQuery.FieldByName('CGC').asString;
            //Carrega Veiculos
            JvQry_Veiculos := TJvUIBDataset.Create(self);
            try
               JvQry_Veiculos.Database := FrmPrincipal.Base;
               JvQry_Veiculos.Transaction := FrmPrincipal.Transaction;

               if not FrmPrincipal.RodaConsulta('SELECT * FROM VEICULOS WHERE CLIENTE = ' + Edit_Cliente.Text,JvQry_Veiculos) then Exit;
               JvQry_Veiculos.First;
               Combo_Veiculo.Items.Clear;
               while not JvQry_Veiculos.Eof do
               begin
                  Combo_Veiculo.Items.Add(JvQry_Veiculos.FieldByName('PLACA').asString + ' - ' + JvQry_Veiculos.FieldByName('DESCRICAO').asString);
                  JvQry_Veiculos.Next;
               end;
            finally
               JvQry_Veiculos.Close;
               JvQry_Veiculos.Free;
               JvQry_Veiculos := Nil;
            end;
            //Carrega Motoristas
            JvQry_Motoristas := TJvUIBDataset.Create(self);
            try
               JvQry_Motoristas.Database := FrmPrincipal.Base;
               JvQry_Motoristas.Transaction := FrmPrincipal.Transaction;

               if not FrmPrincipal.RodaConsulta('SELECT * FROM MOTORISTAS WHERE CLIENTE = ' + Edit_Cliente.Text,JvQry_Motoristas) then Exit;
               JvQry_Motoristas.First;
               Combo_Motorista.Items.Clear;
               while not JvQry_Motoristas.Eof do
               begin
                  Combo_Motorista.Items.Add(JvQry_Motoristas.FieldByName('NOME').asString);
                  JvQry_Motoristas.Next;
               end;
            finally
               JvQry_Motoristas.Close;
               JvQry_Motoristas.Free;
               JvQry_Motoristas := Nil;
            end;
         end
         else
         begin
            MessageDlg('Cliente não cadastrado.',mtInformation,[mbOK],0);
            PanelCliente.Text := '';
            PanelCliente1.Caption := '';
            PanelCliente2.Caption := '';
            Edit_Cliente.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
         JvQuery := Nil;
      end; }
   end
   else
   begin
      Edit_Cliente.Text := '0';
      PanelCliente.Text := '';
      PanelCliente1.Caption := '';
      PanelCliente2.Caption := '';
   end;
   if not Analisa_Cliente(StrToInt(Edit_Cliente.Text),StrToFloat(TirarPonto(LabelTot_Compra.Caption))) then BtnConfirma.Enabled := false;
end;

procedure TFrmVendasRap.Edit_Vlr_PagoExit(Sender: TObject);
begin
  LabelVlr_Pago.Caption := FormatFloat('#,###,###,##0.00',StrToFloatZero(Edit_Vlr_Pago.Text));
  LabelTroco.Caption := FormatFloat('#,###,###,##0.00', (StrToFloatZero(Edit_Vlr_Pago.Text) - (vTotal_Pagar - StrToFloatZero(Edit_VlrDesc.Text))));
end;

procedure TFrmVendasRap.FormShow(Sender: TObject);
begin
   Operacao := opPadrao;
                                         {
   Trans_Vendas.DataBase := FrmPrincipal.base;

   JvProc_Vendas.DataBase := FrmPrincipal.base;
   JvProc_Vendas.Transaction := Trans_Vendas;
   JvProc_Vendas.BuildStoredProc('PROC_VENDAS');

   JvProc_VendItem.DataBase := FrmPrincipal.base;
   JvProc_VendItem.Transaction := Trans_Vendas;
   JvProc_VendItem.BuildStoredProc('PROC_VENDITEM');

   JvProc_Venda_Prazo.DataBase := frmprincipal.base;
   JvProc_Venda_Prazo.Transaction := Trans_Vendas;
   JvProc_Venda_Prazo.BuildStoredProc('EFETUA_VENDAS_PRAZO');

   JvProc_Venda_Vista.DataBase := frmprincipal.base;
   JvProc_Venda_Vista.Transaction := Trans_Vendas;
   JvProc_Venda_Vista.BuildStoredProc('EFETUA_VENDAS_VISTA');

   //by fernando
   JvProc_Cancela_Nota_Cupom.DataBase := FrmPrincipal.base;
   JvProc_Cancela_Nota_Cupom.Transaction := Trans_Vendas;
   JvProc_Cancela_Nota_Cupom.BuildStoredProc('CANCELA_NOTA_CUPOM');

   JvQryProduto.Database := Frmprincipal.Base;
   JvQryProduto.Transaction := Frmprincipal.Transaction;  }


   Carrega_Logo;
   LabelEmpresa.Caption := Parametros.RAZAO_SOCIAL;
   Paginas.PageIndex := 0;
   LabelData.Caption := DateToStr(Date);
   Carrega_Aliquotas;
   Carrega_FormasPagto;
   oItemRetorno := 0;
   Carrega_Parametros_Sistema_Venda;
   StringGrid_Parcelas.Cells[0,0] := 'Prazos';
   StringGrid_Parcelas.Cells[1,0] := 'Documento';
   StringGrid_Parcelas.Cells[2,0] := 'Vencimento';
   StringGrid_Parcelas.Cells[3,0] := 'Valor';
   //Carrega Logo no Image de saida
   Try
      if Parametros.PATHLOGO <> '' then
         ImageSaida.Picture.LoadFromFile(Parametros.PATHLOGO)
      else
         ImageSaida.Picture := Nil;
   except
   end;
   EditQuantidade.color := $00CBF8F3;
end;

Procedure TFrmVendasrap.Carrega_Atributos_Produto(oDataSet: TDataSet);
begin
   LabelDescricao.Caption := oDataSet.FieldByName('APELIDO').asString;
   LabelUnidade.Caption := oDataSet.FieldByName('UNIDADE').asString;
   LabelGrupo.Caption := oDataSet.FieldByName('GRUPO_NOME').asString+' - '+oDataSet.FieldByName('SUBGRUPO_NOME').asString;
   //by fernando
   LabelQuantidade.Caption := EditQuantidade.Text;
   LabelPreco.Caption := EditPrecoUnit.Text;
   LabelCodigo.Caption := EditProduto.text;

   //Busca casas decimais do Valor
   {if (oDataSet.FieldByName('CASAS_DECI_VALOR').asInteger > 0) then
      EditPrecoUnit.FormatSize := '10.' + oDataSet.FieldByName('CASAS_DECI_VALOR').asString
   else
      EditPrecoUnit.FormatSize := '10.2';

   //Busca casas decimais da Quantidade
   if (oDataSet.FieldByName('CASAS_DECI_QTDE').asInteger > 0) then
      EditQuantidade.FormatSize := '10.' + oDataSet.FieldByName('CASAS_DECI_QTDE').asString
   else
      EditQuantidade.FormatSize := '10.2';
   }

   //SO ALTERA O VALOR UNITARIO SE FOR ZERO = 0
   if StrToFloatZero(EditPrecoUnit.Text) <= 0 then
   begin
      EditPrecoUnit.Text := FormatFloat('#,###,##0.00',oDataSet.FieldByName('PRECO_VEND').asFloat);
   end
   else
   begin
      //Se for Preco total ao inves de preco unitario (Posto de Combustivel)
      if (Parametros.VLR_TOTAL_POSTO = 1) and (oDataSet.FieldByName('TIPO').asInteger = 3{é combustivel}) and (StrToFloatZero(EditPrecoUnit.Text) <> oDataSet.FieldByName('PRECO_VEND').asFloat) then
      begin
         EditQuantidade.Text := FormatFloat('#,###,##0.00',(StrToFloatZero(EditPrecoUnit.Text) / oDataSet.FieldByName('PRECO_VEND').asFloat));
         EditPrecoUnit.Text := FormatFloat('#,###,##0.00',oDataSet.FieldByName('PRECO_VEND').asFloat);
      end;
   end;

   //Imagem
   if ((Trim(oDataSet.FieldByName('PATHIMAGE').asString) <> '') or
      (Trim(oDataSet.FieldByName('GRUPO_PATHIMAGEM').asString) <> '')) then
   begin
      if Trim(oDataSet.FieldByName('PATHIMAGE').asString) <> '' then
      begin
         if FileExists(oDataSet.FieldByName('PATHIMAGE').asString) then
            ImageProduto.Picture.LoadFromFile(oDataSet.FieldByName('PATHIMAGE').asString);
      end
      else
      begin
         if FileExists(oDataSet.FieldByName('GRUPO_PATHIMAGEM').asString) then
            ImageProduto.Picture.LoadFromFile(oDataSet.FieldByName('GRUPO_PATHIMAGEM').asString);
      end;
   end
   else
      Carrega_Logo;
end;

Function TFrmVendasRap.VendeItem(Codigo, Descricao, Unidade : String; SituacaoQtoIcm : Integer; Aliquota : Single; Casas : SmallInt; Quantidade, Vl_Unitario, Desconto: Double): Boolean;
var vTipo_Quant, aAliquota, aQuantidade, oValorUnit, oDesconto : String;
    vCasas : SmallInt;

   Function Retorna_Indice_Aliquota_Bematech(aAliquota : Single): String;
   var I : Integer;
   begin
      Result := '00';
      For I := Low(Aliquotas) to High(Aliquotas) do
      begin
         if FormatFloat('0000',aAliquota*100) = Aliquotas[I] then
            Result := StrZero((I+1),2,0);
      end;
   end;

   Function Retorna_Indice_Aliquota_AFRAC(aAliquota : Single): String;
   var I : Integer;
   begin
      Result := 'E00';
      For I := Low(Aliquotas) to High(Aliquotas) do
      begin
         if FormatFloat('0000',aAliquota*100) = Copy(Aliquotas[I],4,4) then
         begin
            if Aliquotas[I][1] = 'T' then
               Result := 'MT' + StrZero(I,2,0)
            else
               Result := 'MS' + StrZero(I,2,0);
         end;
      end;
   end;

   Function Retorna_Indice_Aliquota_Urano(aAliquota : Single): String;
   var I : Integer;
   begin
      Result := '00';
      For I := Low(Aliquotas) to High(Aliquotas) do
      begin
         if Trim(Aliquotas[I]) <> '' then
            if aAliquota = StrToFloat(Aliquotas[I]) then
               Result := StrZero((I+1),2,0);
      end;
   end;

   Function Retorna_Indice_Aliquota_Daruma(aAliquota : Single): String;
   var I : Integer;
   begin
      Result := '00';
      For I := Low(Aliquotas) to High(Aliquotas) do
      begin
         if FormatFloat('0000',aAliquota*100) = Aliquotas[I] then
            Result := StrZero((I+1),2,0);
      end;
   end;
begin
   Result := True;
   {//Testar se UF esta setado
   if Parametros.UF = '' then
   begin
      MessageDlg('"UF" nos Parâmetros deve ser preenchido.',mterror,[mbOk],0);
      Result := False;
      Exit;
   end;

   if Parametros.IMPFIS_INDEX = -1 then
   begin
      Result := False;
      ImprFiscal_Nao_Definida;
   end
   else if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then       //Bematech I e II
   begin
      //Aliquota
      case SituacaoQtoIcm of
         0 : //Tributado
         begin
            aAliquota := '';
            aAliquota := Retorna_Indice_Aliquota_Bematech(Aliquota);
            if aAliquota = '00' then
            begin
               MessageDlg('Alíquota '+ FloatToStr(Aliquota) +' não programada ou não carregada.',mterror,[mbOk],0);
               Result := False;
               Exit;
            end;
         end;
         1 : aAliquota := 'II'; //Isento
         2 : aAliquota := 'FF'; //Substituicao Tributaria
         3 : aAliquota := 'NN'; //Nao Incidente
         else
         begin
            MessageDlg('Situação quanto ao ICMS não programada.',mterror,[mbOk],0);
            Result := False;
            Exit;
         end;
      end;

      //Quantidade
      if Quantidade > 9999.999 then
      begin
         MessageDlg('Quantidade máxima desta impressora fiscal nas vendas de produtos é "9999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;
      aQuantidade := '';
      //Define o Tipo da Quantidade 'I' para Inteira ou 'F' para Fracionária
      if Frac(Quantidade) <> 0 then
      begin
         vTipo_Quant := 'F';
         aQuantidade := FormatFloat('0000',Int(Quantidade)) + FormatFloat('000',Frac(Quantidade)*1000);
      end
      else
      begin
         vTipo_Quant := 'I';
         aQuantidade := FormatFloat('0000',Quantidade);
      end;

      //Casas Decimais
      if Casas = 0 then
         vCasas := 2
      else
         vCasas := Casas;

      //Valor Unitário
      oValorUnit := '';
      if Vl_Unitario > 999999.99 then
      begin
         MessageDlg('Valor Unitário máximo desta impressora fiscal nas vendas de produtos é "999999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;
      if vCasas = 2 then
         oValorUnit := FormatFloat('00000000',(Vl_Unitario*100))
      else
         oValorUnit := FormatFloat('00000000',(Vl_Unitario*1000));


      //Desconto
      oDesconto := '';
      if Desconto > 999999.99 then
      begin
         MessageDlg('Desconto máximo desta impressora fiscal nas vendas de produtos é "999999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;
      oDesconto := FormatFloat('00000000',(Desconto*100));


      //iRetorno := Bematech_FI_VendeItem( Pchar('123ABC'), Pchar('Impressora Fiscal'),
      //                                   Pchar('1700'), Pchar('I'), Pchar('0001'), 2, Pchar('85000'),
      //                                  Pchar('%'), Pchar('1000') );


      Bematech_Retorno := Bematech_FI_VendeItem(
      {Codigo do Produto  13 caracteres}        //Copy(Codigo,1,13),
      {Descricao do Produto  29 caracteres}     //Copy(Descricao,1,29),
      {Alíquota 5 carac se $ e 2 carac se %}    //aAliquota,
      {Tipo de Quantidade 1 Caracter}           //vTipo_Quant,
      {Quantidade 4carac se int e 7 se frac}    //aQuantidade,
      {Casas decimais Valor Unitario Integer}   //vCasas,
      {Valor Unitario 8 caracteres}             //oValorUnit,
      {Tipo de Desconto '%' perct $' Valor}     //'$',
      {Desconto  8 carac sendo 2 casas}         //oDesconto);

      {FrmPrincipal.TrataErro_Bematech;
      if Bematech_Retorno <> 1 then
         Result := False;
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      //Aliquota
      case SituacaoQtoIcm of
         0 : //Tributado
         begin
            aAliquota := '';
            aAliquota := Retorna_Indice_Aliquota_AFRAC(Aliquota);
            if aAliquota = 'E00' then
            begin
               MessageDlg('Alíquota "'+ FloatToStr(Aliquota) +'" não programada ou não carregada.',mterror,[mbOk],0);
               Result := False;
               Exit;
            end;
         end;
         1 : aAliquota := 'MI00'; //Isento
         2 : aAliquota := 'MF00'; //Substituicao Tributaria
         3 : aAliquota := 'MN00'; //Nao Incidente
         else
         begin
            MessageDlg('Situação quanto ao ICMS não programada.',mterror,[mbOk],0);
            Result := False;
            Exit;
         end;
      end;

      //Quantidade
      if Quantidade > 9999.999 then
      begin
         MessageDlg('Quantidade máxima desta impressora fiscal nas vendas de produtos é "9999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;

      //Casas Decimais
      if Casas = 0 then
         vCasas := 2
      else
         vCasas := Casas;

      //Valor Unitário
      oValorUnit := '';
      if Vl_Unitario > 999999.99 then
      begin
         MessageDlg('Valor Unitário máximo desta impressora fiscal nas vendas de produtos é "999999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;
      {if vCasas = 2 then
         oValorUnit := FormatFloat('00000000',(Vl_Unitario*100))
      else
         oValorUnit := FormatFloat('00000000',(Vl_Unitario*1000));}


      //Desconto
      {oDesconto := '';
      if Desconto > 999999.99 then
      begin
         MessageDlg('Desconto máximo desta impressora fiscal nas vendas de produtos é "999999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;

      if not VendeItemAfrac( Copy(Codigo,1,13),
                             Copy(Descricao,1,29),
                             Unidade,
                             aAliquota,
                             Quantidade,
                             Vl_Unitario,
                             vCasas,
                             '1',
                             '1',
                             Desconto) then
         Result := False;
   end
   else if Parametros.IMPFIS_INDEX = 3 then  //Urano
   begin
      //Aliquota
      case SituacaoQtoIcm of
         0 : //Tributado
         begin
            aAliquota := '';
            aAliquota := Retorna_Indice_Aliquota_Urano(Aliquota);
            if aAliquota = '00' then
            begin
               MessageDlg('Alíquota "'+ FloatToStr(Aliquota) +'" não programada ou não carregada.',mterror,[mbOk],0);
               Result := False;
               Exit;
            end;
         end;
         1 : aAliquota := '08'; //Isento
         2 : aAliquota := '07'; //Substituicao Tributaria
         3 : aAliquota := '09'; //Nao Incidente
         else
         begin
            MessageDlg('Situação quanto ao ICMS não programada.',mterror,[mbOk],0);
            Result := False;
            Exit;
         end;
      end;

      //Quantidade
      if Quantidade > 9999.999 then
      begin
         MessageDlg('Quantidade máxima desta impressora fiscal nas vendas de produtos é "9999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;
      aQuantidade := '';
      //Define o Tipo da Quantidade 'I' para Inteira ou 'F' para Fracionária
      if Frac(Quantidade) <> 0 then
      begin
         aQuantidade := FormatFloat('0000',Int(Quantidade)) + '.' + FormatFloat('000',Frac(Quantidade)*1000);
      end
      else
      begin
         aQuantidade := FormatFloat('0000000',Quantidade);
      end;

      //Casas Decimais
      case Casas of
         0,2    : vCasas := 0; //Tipo = 0  para 2 casas decimais
         3      : vCasas := 2; //Tipo = 2  para 3 casas decimais
         else     vCasas := 2; //Tipo = 2  para 3 casas decimais
      end;

      //Valor Unitário
      oValorUnit := '';
      if Vl_Unitario > 999999.99 then
      begin
         MessageDlg('Valor Unitário máximo desta impressora fiscal nas vendas de produtos é "999999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;
      if vCasas = 0 then
         oValorUnit := FormatFloat('00000000',(Vl_Unitario*100))
      else
         oValorUnit := FormatFloat('00000000',(Vl_Unitario*1000));

      Urano_Retorno := VendaItem(
      {Codigo do Produto  13 caracteres    }    //PChar(Copy(Codigo,1,13)),
      {Descricao do Produto  66 caracteres }    //PChar(Copy(Descricao,1,66)),
      {Quantidade                          }   // PChar(aQuantidade),
      {Valor Unitario 9 caracteres         }   // PChar(oValorUnit),
      {Alíquota 2 carac                    }  ///  PChar(aAliquota),
      {Unidade 2 carac                     }   // PChar(Copy(Unidade,1,2)),
      {Casas decimais                      }   // PChar(IntToStr(vCasas)));

      {TrataErro_Urano(Urano_Retorno);
      if Urano_Retorno <> 33 then
         Result := False
      else //da desconto
      begin
         //Desconto
         if Desconto > 0 then
         begin
            oDesconto := '';
            if Desconto > 999999.99 then
            begin
               MessageDlg('Desconto não permitido nesta impressora fiscal.',mterror,[mbOk],0);
            end;
            oDesconto := FormatFloat('00000000000',(Desconto*100));

            Urano_Retorno := DescontoItem('0','Desconto',PChar(oDesconto));
            TrataErro_Urano(Urano_Retorno);
            if Urano_Retorno <> 33 then
              Result := False;
         end;
      end;
   end
   else if Parametros.IMPFIS_INDEX = 4 then //Daruma
   begin
      //Aliquota
      case SituacaoQtoIcm of
         0 : //Tributado
         begin
            aAliquota := '';
            aAliquota := Retorna_Indice_Aliquota_Daruma(Aliquota);
            if aAliquota = '00' then
            begin
               MessageDlg('Alíquota '+ FloatToStr(Aliquota) +' não programada ou não carregada.',mterror,[mbOk],0);
               Result := False;
               Exit;
            end;
         end;
         1 : aAliquota := 'II'; //Isento
         2 : aAliquota := 'FF'; //Substituicao Tributaria
         3 : aAliquota := 'NN'; //Nao Incidente
         else
         begin
            MessageDlg('Situação quanto ao ICMS não programada.',mterror,[mbOk],0);
            Result := False;
            Exit;
         end;
      end;

      //Quantidade
      if Quantidade > 9999.999 then
      begin
         MessageDlg('Quantidade máxima desta impressora fiscal nas vendas de produtos é "9999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;
      aQuantidade := '';
      //Define o Tipo da Quantidade 'I' para Inteira ou 'F' para Fracionária
      if Frac(Quantidade) <> 0 then
      begin
         vTipo_Quant := 'F';
         aQuantidade := FormatFloat('0000',Int(Quantidade)) + FormatFloat('000',Frac(Quantidade)*1000);
      end
      else
      begin
         vTipo_Quant := 'I';
         aQuantidade := FormatFloat('0000',Quantidade);
      end;

      //Casas Decimais
      if Casas = 0 then
         vCasas := 2
      else
         vCasas := Casas;

      //Valor Unitário
      oValorUnit := '';
      if Vl_Unitario > 999999.99 then
      begin
         MessageDlg('Valor Unitário máximo desta impressora fiscal nas vendas de produtos é "999999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;
      if vCasas = 2 then
         oValorUnit := FormatFloat('00000000',(Vl_Unitario*100))
      else
         oValorUnit := FormatFloat('00000000',(Vl_Unitario*1000));


      //Desconto
      oDesconto := '';
      if Desconto > 999999.99 then
      begin
         MessageDlg('Desconto máximo desta impressora fiscal nas vendas de produtos é "999999,999".',mterror,[mbOk],0);
         Result := False;
         Exit;
      end;
      oDesconto := FormatFloat('00000000',(Desconto*100));

      {
      iRetorno := Daruma_FI_VendeItem( pchar( '123' ), pchar( 'Caneta' ),
      pchar( '1200' ), pchar( 'I' ), pchar( '10' ), 2, pchar( '0,25' ),
      pchar( '%' ), pchar( '0000' ) );
      }

      //Daruma_Retorno := Daruma_FI_VendeItem(
      {Codigo do Produto  13 caracteres}        //Copy(Codigo,1,13),
      {Descricao do Produto  29 caracteres}     //Copy(Descricao,1,29),
      {Alíquota 5 carac se $ e 2 carac se %}    //aAliquota,
      {Tipo de Quantidade 1 Caracter}           //vTipo_Quant,
      {Quantidade 4carac se int e 7 se frac}    //aQuantidade,
      {Casas decimais Valor Unitario Integer}   //vCasas,
      {Valor Unitario 8 caracteres}             //oValorUnit,
      {Tipo de Desconto '%' perct $' Valor}     //'$',
      {Desconto  8 carac sendo 2 casas}         //oDesconto);

      {Daruma_Analisa_Retorno;
      if Daruma_Retorno <> 1 then
         Result := False;
   end;}
end;

Procedure TFrmVendasrap.TrataErro_VendItem(oProduto:String);
begin
   MessageDlg('Produto vendido não pode ser gravado.'+ #13 +'O último item vendido no cupom fiscal será cancelado.',mtInformation,[mbok],0);
   //Testa as Impressoras Fiscais e envia comando de cancelamento de item
   {if Parametros.IMPFIS_INDEX = -1 then
   begin
      ImprFiscal_Nao_Definida;
   end
   else if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then //Bematech I e II
   begin
      Bematech_Retorno := Bematech_FI_CancelaItemAnterior;
      FrmPrincipal.TrataErro_Bematech;
      if Bematech_Retorno = 1 then
      begin
         vTotal_Geral := vTotal_Geral - vl_TotProd;
         LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);
         MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',Prod_Seq_CF[High(Prod_Seq_CF)]),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',vl_TotProd),16,'D'));
         MemoProdutos.Lines.Add(' ');
      end;
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      if CancelaItemAfrac(0) then
      begin
         vTotal_Geral := vTotal_Geral - vl_TotProd;
         LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);
         MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',Prod_Seq_CF[High(Prod_Seq_CF)]),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',vl_TotProd),16,'D'));
         MemoProdutos.Lines.Add(' ');
      end;
   end
   else if Parametros.IMPFIS_INDEX = 3 then  //Urano
   begin
      Urano_Retorno := CancelaItem('',PChar(IntToStr(Prod_Seq_CF[High(Prod_Seq_CF)])));
      TrataErro_Urano(Urano_Retorno);
      if Urano_Retorno = 33 then //33 = OK
      begin
         vTotal_Geral := vTotal_Geral - vl_TotProd;
         LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);
         MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',Prod_Seq_CF[High(Prod_Seq_CF)]),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',vl_TotProd),16,'D'));
         MemoProdutos.Lines.Add(' ');
      end;
   end
   else if Parametros.IMPFIS_INDEX = 4 then //Daruma
   begin
      Daruma_Retorno := Daruma_FI_CancelaItemAnterior;
      Daruma_Analisa_Retorno;
      if Daruma_Retorno = 1 then
      begin
         vTotal_Geral := vTotal_Geral - vl_TotProd;
         LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);
         MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',Prod_Seq_CF[High(Prod_Seq_CF)]),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',vl_TotProd),16,'D'));
         MemoProdutos.Lines.Add(' ');
      end;
   end;}

   //Arruma tudo para o proximo produto que este deu pau
   EditQuantidade.Text := '1,00';
   EditPrecoUnit.Text := '0,00';
   vDesconto := 0;
   LabelDesconto.Caption := '';
   EditProduto.SetFocus;
end;

Procedure TFrmVendasrap.Inclui_Produto(oDataSet: TDataSet);
var aLinha: String;
    Flag_ErroVendItem : Byte;
begin
   Try
      Screen.Cursor := crHourglass;
      Try
         Flag_ErroVendItem := 0;
         //Testa o valor com a margem de segurança
         if (Param_Venda.Margem_Seg = True) and ((StrToFloatZero(EditPrecoUnit.Text) * StrToFloatZero(EditQuantidade.Text)) > Param_Venda.Vl_Margem) then
         begin
            //keybd_event(39,0,0,0);
            if MessageDlg('A venda deste produto ultrapassou a margem de segurança (R$ '+ FormatFloat('#,###,##0.00',Param_Venda.Vl_Margem) +').'+ #13 +'Tem certeza que realmente o valor confere?',mtWarning,[mbYes,mbNo],0) = mrNo then
            begin
               EditProduto.SetFocus;
               EditQuantidade.Text := '1,00';
               EditPrecoUnit.Text := '0,00';
               vDesconto := 0;
               LabelDesconto.Caption := '';
               Exit;
            end;
         end;

         //Vende na Impressora Fiscal
         if not VendeItem(EditProduto.text,
                      oDataSet.FieldByName('APELIDO').asString,
                      oDataSet.FieldByName('UNIDADE').asString,
                      oDataSet.FieldByName('SITUA_ICM').asInteger,
                      oDataSet.FieldByName('ICM_ECF').asFloat,
                      oDataSet.FieldByName('CASAS_DECI_VALOR').AsInteger,
                      StrToFloatZero(EditQuantidade.Text),
                      StrToFloatZero(EditPrecoUnit.Text),
                      (((StrToFloatZero(EditPrecoUnit.Text) * StrToFloatZero(EditQuantidade.Text)) * vDesconto)/100)) then
         begin
            //Arruma tudo para o proximo produto que este deu pau
            EditProduto.SetFocus;
            EditQuantidade.Text := '1,00';
            EditPrecoUnit.Text := '0,00';
            vDesconto :=0;
            LabelDesconto.Caption := '';
            Exit;
         end;
         Flag_ErroVendItem := 1;

         //Calcula total do produto((Quant.*preco unit.)- desconto)
         vl_TotProd := 0;
         vl_TotProd := StrToFloat(Tira_Ponto(Format('%10.2n',[(StrToFloatZero(EditPrecoUnit.Text) * StrToFloatZero(EditQuantidade.Text))])));
         //Tira o desconto
         vl_TotProd := StrToFloat(Tira_Ponto(Format('%10.2n',[(vl_TotProd - ((vl_TotProd*vDesconto)/100))])));
         //vl_TotProd := vl_TotProd - ((vl_TotProd*vDesconto)/100);

         //Inclui no memo
         MemoProdutos.Lines.Add(Copy((FormatFloat('000',Length(Prod_Seq_CF)+1)+' '+EditProduto.text + '  ' + oDataSet.FieldByName('APELIDO').asString),1,37));
         aLinha := '  ' + Trim(EditQuantidade.Text) + ' ' + LabelUnidade.Caption + '  x  R$ ' + Trim(EditPrecoUnit.Text);
         if (Length(aLinha) > 25) or (vDesconto > 0) then
         begin
            MemoProdutos.Lines.Add(Copy(aLinha,1,38));
            MemoProdutos.Lines.Add('    Desconto '+ FormatFloat('##0.00',vDesconto) +'% ' + AlinharStr('R$ '+FormatFloat('#,###,###,##0.00',vl_TotProd),17,'D'));
         end
         else
            MemoProdutos.Lines.Add(Copy(aLinha + AlinharStr('R$ '+FormatFloat('#,###,###,##0.00',StrToFloatZero(EditQuantidade.Text) * StrToFloatZero(EditPrecoUnit.Text)),37-Length(aLinha),'D'),1,38));
         MemoProdutos.Lines.Add('');

         //Incrementa o Total Geral
         vTotal_Geral := vTotal_Geral + vl_TotProd;
         LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

         //Pega ultimo produto e sequencia
         UltProdCod_Vend := oDataSet.FieldByName('CODIGO').asInteger;
//         UltProdSeq_Vend := FrmPrincipal.Busca_Controle('GEN_SEQPROD');

         //Inclui na tabela de referencia
         //Sequencia no Cupom Fiscal
         SetLength(Prod_Seq_CF, Length(Prod_Seq_CF)+1);
         Prod_Seq_CF[High(Prod_Seq_CF)] := Length(Prod_Seq_CF);
         //Codigo do Produto
         SetLength(Prod_Cod_Prod, Length(Prod_Cod_Prod)+1);
         Prod_Cod_Prod[High(Prod_Cod_Prod)] := oDataSet.FieldByName('CODIGO').asInteger;
         //Sequencia do produto
         SetLength(Prod_Seq_Prod, Length(Prod_Seq_Prod)+1);
         Prod_Seq_Prod[High(Prod_Seq_Prod)] := UltProdSeq_Vend;
         //Valor do Produto
         SetLength(Prod_Vlr_Prod, Length(Prod_Vlr_Prod)+1);
         Prod_Vlr_Prod[High(Prod_Vlr_Prod)] := vl_TotProd;

         //Grava no VendItem
{         with JvProc_VendItem do
         begin
            Params.ByNameAsInteger['POPER'] := 0;
            Params.ByNameAsInteger['PCONTROLE'] := vControle;
            Params.ByNameAsInteger['PSEQUENCIA'] := UltProdSeq_Vend;
            Params.ByNameAsInteger['PCOD_PRODUTO'] := oDataSet.FieldByName('CODIGO').asInteger;
            Params.ByNameAsCurrency['PQUANTIDADE'] := StrToFloatZero(EditQuantidade.Text);
            Params.ByNameAsCurrency['PVL_UNITARIO'] := StrToFloatZero(EditPrecoUnit.Text);
            Params.ByNameAsCurrency['PPERC_DESC'] := vDesconto;
            if oDataSet.FieldByName('TIPO').AsInteger = 1 then
               Params.ByNameAsString['PDESCR_SERVICO'] := Trim(LabelDescricao.Caption)
            else
               Params.ByNameIsNull['PDESCR_SERVICO'] := True;
            Params.ByNameIsNull['PPESO_LIQUIDO'] := True;
            Params.ByNameIsNull['POBSERVACAO'] := True;
            Execute;
         end;  }

         //Arruma tudo para o proximo produto
         //EditProduto.SetFocus;
         EditQuantidade.Text := '1,00';
         EditPrecoUnit.Text := '0,00';
         vDesconto := 0;
         LabelDesconto.Caption := '';
      except
         On E:Exception do
         begin
            FrmPrincipal.TrataErro(E);
            if Flag_ErroVendItem = 1 then
               TrataErro_VendItem(oDataSet.FieldByName('CODIGO').asString);
            MessageDlg('Ocorreu um erro inesperado. Tente novamente mais tarde.',mtError, [mbOK],0);
         end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmVendasRap.F10_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmVendasRap.Sair_Venda_vistaExecute(Sender: TObject);
begin
   if Operacao = opEmFechamento then
   begin
      SBVista.Down := True;
      SBVistaClick(self);
   end
   else
      Close;      
end;

Function TFrmVendasRap.Abre_CupomFiscal : Boolean;
begin
   Result := True;

   Cancela_CupomFiscal;

   {if Parametros.IMPFIS_INDEX = -1 then
   begin
      Result := False;
      ImprFiscal_Nao_Definida;
      Exit;
   end;
   if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then       //Bematech I e II
   begin
      Bematech_Retorno := Bematech_FI_AbreCupom('');
      FrmPrincipal.TrataErro_Bematech;
      if Bematech_Retorno <> 1 then
         Result := False;
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      if not AbreCupom then
         Result := False;
   end
   else if Parametros.IMPFIS_INDEX = 3 then  //Urano
   begin
      Urano_Retorno := ImprimeCabecalho;
      TrataErro_Urano(Urano_Retorno);
      if Urano_Retorno <> 33 then //33 = OK
         Result := False;
   end
   else if Parametros.IMPFIS_INDEX = 4 then //Daruma
   begin
      Daruma_Retorno := Daruma_FI_AbreCupom('');
      Daruma_Analisa_Retorno;
      if Daruma_Retorno <> 1 then
         Result := False;
   end;}
end;

procedure TFrmVendasRap.Novo_CupomExecute(Sender: TObject);
begin
   //if Operacao <> opPadrao then Exit;
   Try
      Screen.Cursor := crHourglass;
      Try
         //Se Ja esta aberto o Cupom
         if Operacao = opEmVenda then Exit;

         //Abre Cupom Fiscal
         oCupom := IntToStr(StrToIntZero(Trim(Retorna_NroCupom)));
         if oCupom = 'Erro' then Exit;

         if not Abre_CupomFiscal then
         begin
            Exit;
         end;

         //Inicia Transacao da Venda
{         if Trans_Vendas.InTransaction then Trans_Vendas.Rollback;
         Trans_Vendas.StartTransaction;
         //
         Operacao := opEmVenda;
         with JvProc_Vendas do
         begin
            Params.ByNameAsInteger['POPER'] := 0;
            //Busca o Controle
            Try
               vControle := 0;
               vControle := FrmPrincipal.Busca_Controle('GEN_CONTROLE');
            finally
               //IBPesquisa.Close;
            end;
            Params.ByNameAsInteger['PCONTROLE'] := vControle;
            //Valor do COO da Impressora Fiscal
            Params.ByNameAsString['PNRO_NOTA'] := StrZero(StrToInt(Trim(oCupom)),6,0);
            vNota := StrZero(StrToInt(Trim(oCupom)),6,0);
            Params.ByNameAsString['PSER_NOTA'] := 'CF';
            vSerie := 'CF';
            //Numero do caixa da Impressora Fiscal
            Params.ByNameAsString['PNUMCAIXA'] := '0001';
            Params.ByNameAsDateTime['PDT_EMISS'] := Date;
            //ParamByName('PFIL_CLIENTE').asInteger := 0;
            Params.ByNameIsNull['PCOD_CLIENTE'] := True;
            Params.ByNameIsNull['PCOD_FORNEC'] := True;
            Params.ByNameAsString['PCFOP'] := Param_Venda.CFOP_Padrao;
            //ParamByName('PFIL_TRANS').Value := Null;
            Params.ByNameIsNull['PCOD_TRANS'] := True;
            //ParamByName('PFIL_VENDEDOR').asInteger := 0;
            Params.ByNameIsNull['PCOD_VENDEDOR'] := True;
            Params.ByNameAsDateTime['PDT_SAIDA'] := Date;
            Params.ByNameAsDateTime['PHR_SAIDA'] := Time;
            Params.ByNameAsString['PCTA_FRETE'] := '';
            Params.ByNameAsCurrency['PVL_FRETE'] := 0;
            Params.ByNameAsCurrency['PICM_FRETE'] := 0;
            Params.ByNameIsNull['PCOD_OBSERV'] := True;
            Params.ByNameAsString['POBSERV2'] := '';
            Params.ByNameAsString['PPLACA'] := '';
            Params.ByNameAsCurrency['PVLR_PAGO_D'] := 0;
            Params.ByNameAsCurrency['PTROCO'] := 0;
            Params.ByNameAsCurrency['PPERC_DESC'] := 0;
            Params.ByNameAsCurrency['PVL_DESC'] := 0;
            Params.ByNameAsCurrency['PPERC_ACRE'] := 0;
            Params.ByNameAsCurrency['PVLR_ACRE'] := 0;
            Params.ByNameAsString['PCLI_FORN'] := '';
            Params.ByNameAsCurrency['PNTQUANTID'] := 0;
            Params.ByNameAsString['PNTESPECIE'] := '';
            Params.ByNameAsString['PNTMARCA'] := '';

            //Forma de Pagamento
            Params.ByNameIsNull['PCOD_FORMAPAGTO'] := True;

            //Postos de Gasolina
            Params.ByNameIsNull['PVEICULO'] := True;
            Params.ByNameIsNull['PMOTORISTA'] := True;
            Params.ByNameIsNull['PKILOMETRAGEM'] := True;
            Params.ByNameIsNull['PFROTA'] := True;
            Params.ByNameIsNull['PNRO_AUTORIZACAO'] := True;
            Execute;
         end;    }
         //Zera Total Geral
         vTotal_Geral := 0;
         //vDesconto := 0;
         //Zera Tabela de Referencia
         SetLength(Prod_Seq_CF,0);
         SetLength(Prod_Cod_Prod,0);
         SetLength(Prod_Seq_Prod,0);
         SetLength(Prod_Vlr_Prod,0);

      except
         On E:Exception do
         begin
            TrataErroVenda;
            FrmPrincipal.TrataErro(E);
            MessageDlg('Ocorreu um erro inesperado.' + #13#10 + E.Message,mtError, [mbOK],0);
         end;
         on E : EDataBaseError do
         begin
            TrataErroVenda;

         end
         else
         begin
            TrataErroVenda;

         end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmVendasRap.AjudaExecute(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmVendasRap.Shape1ChangeBounds(Sender: TObject);
begin

end;

procedure TFrmVendasRap.StringGrid_ParcelasClick(Sender: TObject);
begin

end;

procedure TFrmVendasRap.TrataErroVenda;
begin       {
   try
      if Trans_Vendas.InTransaction then Trans_Vendas.Rollback;
      Operacao := opPadrao;
   except
      On E:Exception do
      begin
         TrataErroVenda;
         FrmPrincipal.TrataErro(E);
      end;
   end;    }
end;

procedure TFrmVendasRap.F8_Fin_CupomClick(Sender: TObject);
begin
   if Operacao <> opEmVenda then Exit;
end;

procedure TFrmVendasRap.Finaliza_CupomExecute(Sender: TObject);
begin
   if Operacao <> opEmVenda then Exit;
   Operacao := opEmFechamento;
end;

procedure TFrmVendasRap.BtnCancelaClick(Sender: TObject);
begin
   if MessageDlg('Confirma o cancelamento desta Venda e Cupom Fiscal ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
      // if Trans_Vendas.InTransaction then Trans_Vendas.Rollback;
      Operacao := opPadrao;
      //Termina e Cancela o cupom
      //Inicia termino do cupom fiscal
      Cancela_CupomFiscal;
   end;
end;

Function TFrmVendasRap.EfetuaPagamento_CupomFiscal : Boolean;
var oRetorno, I : Integer;
    sComando, aPorta, aForma, aNota : String;
    Impr_Ini : TIniFile;
    aMensagem, aMensAux : String;
    vAcre, vTipo, vValor : String;
    oValor : Double;
    {
    Procedure Testa_Inclui_FormaPagto(aForma : String; Vinculado : Boolean);
    var I,Pos_Livre : Integer;
    begin
       try
          Pos_Livre := 0;
          For I := Low(FormasPagto) to High(FormasPagto) do
          begin
             //Guarda a primeira posicao livre
             if (Trim(FormasPagto[I]) = '') and (Pos_Livre = 0) then Pos_Livre := I;

             //Testa se achou
             if AnsiUppercase(Trim(FormasPagto[I])) = AnsiUppercase(Trim(aForma)) then
             begin
                //Break;
                Exit;
             end;
          end;
          //Inclui Forma de Pagamento
          ProgramaFormaPagto(FormatFloat('00',Pos_Livre), aForma,Vinculado);
          Carrega_FormasPagto;
       finally
       end;
    end;

    Function Testa_Inclui_FormaPagto_Urano(aForma : String) : String;
    var I,Pos_Livre : Integer;
    begin
       try
          Result := '00';
          Pos_Livre := 0;
          For I := Low(FormasPagto) to High(FormasPagto) do
          begin
             //Guarda a primeira posicao livre
             if (Trim(FormasPagto[I]) = '') and (Pos_Livre = 0) then Pos_Livre := I;

             //Testa se achou
             if AnsiUppercase(Trim(FormasPagto[I])) = AnsiUppercase(Trim(aForma)) then
             begin
                Result := IntToStr(I);
                Exit;
             end;
          end;
          //Inclui Forma de Pagamento
          Urano_Retorno := FormaPagamento(PChar(FormatFloat('00',Pos_Livre)), PChar(aForma));
          TrataErro_Urano(Urano_Retorno);
          Carrega_FormasPagto;
       finally
       end;
    end;}
begin
   {Result := True;
   if Parametros.IMPFIS_INDEX = -1 then
   begin
      Result := False;
      ImprFiscal_Nao_Definida;
   end;
   if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then       //Bematech I e II
   begin
      //Inicia termino do cupom fiscal

      //*****************************************************************************
      //O VALOR DE JUROS NAO PODE SER LANCADO COMO ACRESCIMO
      //*****************************************************************************
      vJuros := 0;
      //*****************************************************************************
      if Edit_VlrDesc.Value > vJuros then
      begin
         vAcre := 'D';
         vTipo := '$';
         vValor := FloatToStr((Edit_VlrDesc.Value - vJuros) * 100);
      end
      else
      begin
         vAcre := 'A';
         vTipo := '$';
         vValor := FloatToStr((vJuros - Edit_VlrDesc.Value) * 100);
      end;
      Bematech_Retorno := Bematech_FI_IniciaFechamentoCupom(vAcre, vTipo, vValor);


      FrmPrincipal.TrataErro_Bematech;
      if Bematech_Retorno <> 1 then
      begin
         Result := False;
         if Bematech_Retorno = -1 then
            Exit;
      end;
      //Efetua forma de pagamento (Descricao e Valor Pago)
      if Parametros.IMPFIS_INDEX = 0 then //Bematech I
      begin
         Bematech_Retorno := Bematech_FI_FechaPortaSerial;
         //Pega a porta
         Impr_Ini := TIniFile.Create(WinSystemDir+'\BemaFI32.INI');
         try
            aPorta := Impr_Ini.ReadString('Sistema','Porta','');
         finally
            Impr_Ini.Free;
         end;
         IniPortaStr(Pchar(aPorta));
         if SBVista.Down then
         begin
            aForma := 'Dinheiro';
            While Length(aForma) < 22 do aForma := aForma + ' ';
            sComando:=#27+'|33|'+ aForma +'|'+ FloatToStr(Edit_Vlr_Pago.Value*100) +'|'+#27;
            //sComando:=#27+'|33|a vista               |100000|'+#27;
            oRetorno := FormataTX(PChar(sComando));
            if oRetorno <> 0 then
            begin
               Result := False;
               Exit;
            end;
         end
         else
         begin
            if vTotal_Pagar > 0 then
            begin
               aForma := 'Dinheiro';
               While Length(aForma) < 22 do aForma := aForma + ' ';
               sComando:=#27+'|33|'+ aForma +'|'+ FloatToStr(Edit_Vlr_Pago.Value*100) +'|'+#27;
               //sComando:=#27+'|33|a vista               |100000|'+#27;
               oRetorno := FormataTX(PChar(sComando));
               if oRetorno <> 0 then
               begin
                  Result := False;
                  Exit;
               end;
            end;
            if ((vTotal_Geral + vJuros) - vTotal_Pagar) > 0 then
            begin
               aForma := 'A PRAZO';
               While Length(aForma) < 22 do aForma := aForma + ' ';
               //sComando:=#27+'|33|'+ aForma +'|'+ FloatToStr(((vTotal_Geral + vJuros - Edit_VlrDesc.Value) - vTotal_Pagar)*100) +'|'+#27;
               sComando:=#27+'|33|'+ aForma +'|'+ FloatToStr(((vTotal_Geral + vJuros - Edit_VlrDesc.Value) - Edit_Vlr_Pago.Value)*100) +'|'+#27;
               oRetorno := FormataTX(PChar(sComando));
               if oRetorno <> 0 then
               begin
                  Result := False;
                  Exit;
               end;
            end;
         end;
         FechaPorta();
         Bematech_Retorno := Bematech_FI_AbrePortaSerial;
         FrmPrincipal.TrataErro_Bematech;
      end
      else //Bematech II
      begin
         if SBVista.Down then
         begin
            aForma := 'Dinheiro';
            Bematech_Retorno := Bematech_FI_EfetuaFormaPagamento(pChar(aForma), pChar((FloatToStr(Edit_Vlr_Pago.Value*100))));
            FrmPrincipal.TrataErro_Bematech;
            if Bematech_Retorno <> 1 then
            begin
               Result := False;
               if Bematech_Retorno = -1 then
            //   Exit;
            end;
         end
         else
         begin
            if vTotal_Pagar > 0 then
            begin
               aForma := 'Dinheiro';
               //Bematech_Retorno := Bematech_FI_EfetuaFormaPagamento(pChar(aForma), pChar(FloatToStr(vTotal_Pagar*100)));
               Bematech_Retorno := Bematech_FI_EfetuaFormaPagamento(pChar(aForma), pChar(FloatToStr(Edit_Vlr_Pago.Value*100)));
               FrmPrincipal.TrataErro_Bematech;
               if Bematech_Retorno <> 1 then
               begin
                  Result := False;
                  if Bematech_Retorno = -1 then
               //   Exit;
               end;
            end;

            if ((vTotal_Geral + vJuros) - vTotal_Pagar) > 0 then
            begin
               aForma := 'A PRAZO';
               //Bematech_Retorno := Bematech_FI_EfetuaFormaPagamento(pChar(aForma), pChar(FloatToStr(((vTotal_Geral + vJuros - Edit_VlrDesc.Value) - vTotal_Pagar)*100)));
               Bematech_Retorno := Bematech_FI_EfetuaFormaPagamento(pChar(aForma), pChar(FloatToStr(((vTotal_Geral + vJuros - Edit_VlrDesc.Value) - Edit_Vlr_Pago.Value)*100)));
               FrmPrincipal.TrataErro_Bematech;
               if Bematech_Retorno <> 1 then
               begin
                  Result := False;

                  if Bematech_Retorno = -1 then
               //   Exit;
               end;
            end;
         end;
      end;

      //Termino do pagamento e do cupom (mensagem)
      aMensagem := '';

      //Imprime cliente
      if Param_Venda.Imp_Cliente then
      begin
         aMensagem := aMensagem + Trim(Edit_Cliente.Text)+' - '+Copy(PanelCliente.Text,1,42)+#13+#10;
         if Length(Trim(Copy(PanelCliente1.Caption,1,47))) > 2 then
            aMensagem := aMensagem + Copy(PanelCliente1.Caption,1,47)+#13+#10;
         if Length(Trim(Copy(PanelCliente2.Caption,1,47))) > 10 then
            aMensagem := aMensagem + Copy(PanelCliente2.Caption,1,47)+#13+#10;
      end;

      //Imprime Vendedor
      if Param_Venda.Imp_Vendedor then
      begin
         aMensagem := aMensagem + Copy('Vendedor(a): '+Trim(Edit_Vendedor.Text)+' - '+Trim(PanelVendedor.Caption),1,47)+#13+#10;
      end;

      //Imprime Mensagem
      if Param_Venda.Imp_Mensagem then
      begin
         aMensagem := aMensagem + Copy(Edit_Mensagem.Text,1,47)+#13+#10;
      end;

      //Imprime OBS dos Postos de Gasolina
      if Param_Venda.Obs_Postos then
      begin
         if Edit_Kilometragem.Text <> '' then
            aMensagem := aMensagem + 'KM: ' + Edit_Kilometragem.Text + ' ';
         if Edit_Frota.Text <> '' then
            aMensagem := aMensagem + 'Frota: ' + Edit_Frota.Text + ' ';
         if Edit_Nro_Autorizacao.Text <> '' then
            aMensagem := aMensagem + 'Nro Autor.: ' + Edit_Nro_Autorizacao.Text + ' ';
         aMensagem := aMensagem + #13 + #10;
         //Veiculo
         if Combo_Veiculo.Text <> '' then
            aMensagem := aMensagem + Copy('Veiculo..:' + Combo_Veiculo.Text,1,47)+#13+#10;
         //Motorista
         if Combo_Motorista.Text <> '' then
            aMensagem := aMensagem + Copy('Motorista:' + Combo_Motorista.Text,1,47)+#13+#10;
      end;

      //Se for Bematech 1
      if Parametros.IMPFIS_INDEX = 0 then
      begin
         //Parcelamento se tiver
         if (StringGrid_Parcelas.RowCount > 2) or (Trim(StringGrid_Parcelas.Cells[1,1]) <> '') then
         begin
            For I := 1 to StringGrid_Parcelas.RowCount-1 do
            begin
               if I mod 2 <> 0 then Continue;
               aMensagem := aMensagem + (Trim(StringGrid_Parcelas.Cells[1,I])+' '+Copy(Trim(StringGrid_Parcelas.Cells[2,I]),1,6)+Copy(Trim(StringGrid_Parcelas.Cells[2,I]),9,2)+' '+Trim(StringGrid_Parcelas.Cells[3,I])) + '  ' + (Trim(StringGrid_Parcelas.Cells[1,I+1])+' '+ Copy(Trim(StringGrid_Parcelas.Cells[2,I]),1,6)+Copy(Trim(StringGrid_Parcelas.Cells[2,I]),9,2) +' '+Trim(StringGrid_Parcelas.Cells[3,I+1])) + #13 + #10;
            end;
         end;
      end;

      Bematech_Retorno := Bematech_FI_TerminaFechamentoCupom(aMensagem);
      FrmPrincipal.TrataErro_Bematech;
      if Bematech_Retorno <> 1 then
      begin
         Result := False;
         Exit;
      end;

      //Comprovante Nao Fiscal Vinculado
      if SBPrazo.Down and Param_Venda.Cupom_Adicional then
      begin
         //Bematech_Retorno := Bematech_FI_AbreComprovanteNaoFiscalVinculado(pChar(aForma), pChar(FloatToStr(((vTotal_Geral + vJuros) - vTotal_Pagar)*100)),vNota);
         Bematech_Retorno := Bematech_FI_AbreComprovanteNaoFiscalVinculado(pChar(aForma),'','');
         FrmPrincipal.TrataErro_Bematech;
         if Bematech_Retorno <> 1 then
         begin
            Result := False;
            Exit;
         end;
         aMensagem := '';
         aMensagem := aMensagem + '   Confesso-me devedor deste cupom nº ' + vNota + #13 + #10;
         aMensagem := aMensagem + 'ficando ciente de que ocorrendo inadimplemento'+ #13 + #10;
         aMensagem := aMensagem + 'com prazo superior a 60(sessenta) dias ocorrera'+ #13 + #10;
         aMensagem := aMensagem + 'a inclusão automatica de meu nome no servico de'+ #13 + #10;
         aMensagem := aMensagem + 'proteção ao credito (SPC).'+ #13 + #10;
         aMensagem := aMensagem + ''+ #13 + #10;
         aMensagem := aMensagem + '____________________________________________'+ #13 + #10;
         aMensagem := aMensagem + Trim(Edit_Cliente.Text)+' - '+Copy(PanelCliente.Text,1,42);
         aMensagem := aMensagem + ''+ #13 + #10;
         aMensagem := aMensagem + AlinharStr('Parcelamento',48,'C');
         Bematech_Retorno := Bematech_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         FrmPrincipal.TrataErro_Bematech;
         if Bematech_Retorno <> 1 then
         begin
            Result := False;
            Exit;
         end;
         //Manda as Parcelas
         For I := 1 to StringGrid_Parcelas.RowCount-1 do
         begin
            aMensagem := '';
            aMensagem := (AlinharStr(StringGrid_Parcelas.Cells[0,I],15,'C')+' '+StringGrid_Parcelas.Cells[1,I]+' '+StringGrid_Parcelas.Cells[2,I]+AlinharStr(StringGrid_Parcelas.Cells[3,I],12,'D'));
            Bematech_Retorno := Bematech_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
            FrmPrincipal.TrataErro_Bematech;
            if Bematech_Retorno <> 1 then
            begin
               Result := False;
               Exit;
            end;
         end;
         //Fecha o comprovante nao Fiscal Vinculado
         Bematech_Retorno := Bematech_FI_FechaComprovanteNaoFiscalVinculado;
         FrmPrincipal.TrataErro_Bematech;
         if Bematech_Retorno <> 1 then
         begin
            Result := False;
            Exit;
         end;
      end;
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      //Inicia termino do cupom fiscal

      //*****************************************************************************
      //O VALOR DE JUROS NAO PODE SER LANCADO COMO ACRESCIMO
      //*****************************************************************************
      vJuros := 0;
      //*****************************************************************************
      
      if Edit_VlrDesc.Value > vJuros then
      begin
         vAcre := 'D';
         vTipo := '1';
         oValor := (Edit_VlrDesc.Value - vJuros);
      end
      else
      begin
         vAcre := 'A';
         vTipo := '1';
         oValor := (vJuros - Edit_VlrDesc.Value);
      end;

      if IniciaFechacupomCom(vAcre, oValor, vTipo) then
      begin
         if not FecharAcresDesc then
         begin
            Result := False;
            Exit;
         end;
      end;
      {else
      begin
         Result := False;
         Exit;
      end;}

      //Efetua forma de pagamento (Descricao e Valor Pago)
      {if SBVista.Down then
      begin
         aForma := 'Dinheiro';
         Testa_Inclui_FormaPagto(aForma, False);
         if not FormaPagtoCupom('',aForma,' ',Edit_Vlr_Pago.Value) then
         begin
            Result := False;
            Exit;
         end;
      end
      else
      begin
         if vTotal_Pagar > 0 then
         begin
            aForma := 'Dinheiro';
            Testa_Inclui_FormaPagto(aForma, False);
            if not FormaPagtoCupom('',aForma,' ',Edit_Vlr_Pago.Value) then
            begin
               Result := False;
               Exit;
            end;
         end;
         if ((vTotal_Geral + vJuros) - vTotal_Pagar) > 0 then
         begin
            aForma := 'A PRAZO';
            Testa_Inclui_FormaPagto(aForma, True);
            if not FormaPagtoCupom('',aForma,' ',((vTotal_Geral + vJuros - Edit_VlrDesc.Value) - Edit_Vlr_Pago.Value)) then
            begin
               Result := False;
               Exit;
            end;
         end;
      end;
      //Termino do pagamento e do cupom (mensagem)
      aMensagem := '';

      //Imprime cliente
      if Param_Venda.Imp_Cliente then
      begin
         MsgCupom(Trim(Edit_Cliente.Text) + ' - ' + Copy(PanelCliente.Text,1,40));
         if Length(Trim(Copy(PanelCliente1.Caption,1,40))) > 2 then
            MsgCupom(Copy(PanelCliente1.Caption,1,40));
         if Length(Trim(Copy(PanelCliente2.Caption,1,40))) > 10 then
            MsgCupom(Copy(PanelCliente2.Caption,1,40));
      end;

      //Imprime Vendedor
      if Param_Venda.Imp_Vendedor then
      begin
         MsgCupom(Copy('Vendedor(a): '+Trim(Edit_Vendedor.Text)+' - '+Trim(PanelVendedor.Caption),1,40));
      end;

      //Imprime mensagem
      if Param_Venda.Imp_Mensagem then
      begin
         MsgCupom(Copy(Edit_Mensagem.Text,1,40));
      end;

      //Imprime OBS dos Postos de Gasolina
      if Param_Venda.Obs_Postos then
      begin
         if Edit_Kilometragem.Text <> '' then
            aMensagem := aMensagem + 'KM: ' + Edit_Kilometragem.Text + ' ';
         if Edit_Frota.Text <> '' then
            aMensagem := aMensagem + 'Frota: ' + Edit_Frota.Text + ' ';
         if Edit_Nro_Autorizacao.Text <> '' then
            aMensagem := aMensagem + 'Nro Autor.: ' + Edit_Nro_Autorizacao.Text + ' ';
         MsgCupom(aMensagem);
         //Veiculo
         if Combo_Veiculo.Text <> '' then
            MsgCupom(Copy('Veiculo..:' + Combo_Veiculo.Text,1,40));
         //Motorista
         if Combo_Motorista.Text <> '' then
            MsgCupom(Copy('Motorista:' + Combo_Motorista.Text,1,40));
      end;

      if SBVista.Down then
      begin
         if not FechaCupom_Afrac(False) then
         begin
            Result := False;
            Exit;
         end;
      end
      else
      begin
         if Param_Venda.Cupom_Adicional then
         begin
            if not FechaCupom_Afrac(True) then
            //if not FechaCupom(False) then
            begin
               Result := False;
               Exit;
            end;

            //Comprovante Nao Fiscal Vinculado
            //if not AbreNaoFiscalVinculado(vNota, aForma, ((vTotal_Geral + vJuros) - vTotal_Pagar)) then

            if not AbreNaoFiscalVinculado(vNota, '05', (vTotal_Geral + vJuros)) then
            begin
               Result := False;
               Exit;
            end;

            if not RelatorioNaoFiscalVinculado('   Confesso-me devedor deste cupom nro ') then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado(vNota + ' ficando ciente de que ocorrendo ') then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado('inadimplemento com prazo superior a ') then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado('60(sessenta) dias ocorrera a inclusao ') then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado('automatica de meu nome no servico de  ') then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado('protecao ao credito (SPC).') then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado('') then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado('________________________________________') then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado(Trim(Edit_Cliente.Text)+' - '+Copy(PanelCliente.Text,1,42)) then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado('') then begin  Result := False;  Exit;  end;
            if not RelatorioNaoFiscalVinculado(AlinharStr('Parcelamento',40,'C')) then begin  Result := False;  Exit;  end;

            //Manda as Parcelas
            For I := 1 to StringGrid_Parcelas.RowCount-1 do
            begin
               aMensagem := '';
               aMensagem := ' ' + (StringGrid_Parcelas.Cells[1,I]+' '+StringGrid_Parcelas.Cells[2,I]+AlinharStr(StringGrid_Parcelas.Cells[3,I],12,'D'));
               if not RelatorioNaoFiscalVinculado(aMensagem) then
               begin
                  Result := False;
                  Exit;
               end;
            end;

            //Fecha o comprovante nao Fiscal Vinculado
            if not FimRelatorioNaoFiscalVinculado then
            begin
               Result := False;
               Exit;
            end;
         end;
      end;
   end
      else if Parametros.IMPFIS_INDEX = 3 then       //Urano
   begin
      //Inicia termino do cupom fiscal

      //*****************************************************************************
      //O VALOR DE JUROS NAO PODE SER LANCADO COMO ACRESCIMO
      //*****************************************************************************
      vJuros := 0;
      //vDescontos := 0;
      //*****************************************************************************
      if (vDescontos + Edit_VlrDesc.Value) > vJuros then
      begin
         vValor := FloatToStr((vDescontos + Edit_VlrDesc.Value - vJuros) * 100);
         if (vDescontos + Edit_VlrDesc.Value - vJuros) > 0 then
         begin
            Urano_Retorno := DescontoSubtotal('0','Desconto',PChar(vValor));
            TrataErro_Urano(Urano_Retorno);
         end;
      end
      else
      begin
         vValor := FloatToStr((vJuros - Edit_VlrDesc.Value - vDescontos) * 100);
         if (vJuros - Edit_VlrDesc.Value - vDescontos) > 0 then
         begin
            Urano_Retorno := AcrescimoSubtotal('0','Acrescimo',PChar(vValor));
            TrataErro_Urano(Urano_Retorno);
         end;
      end;

      if Urano_Retorno <> 33 then
      begin
         Result := False;
         //if Bematech_Retorno = -1 then
         Exit;
      end;
      //Efetua forma de pagamento (Descricao e Valor Pago)
      if SBVista.Down then
      begin
         aForma := 'Dinheiro';
         aForma := Testa_Inclui_FormaPagto_Urano(aForma);
         Urano_Retorno := Pagamento(PChar(aForma),'',PChar(FloatToStr(Edit_Vlr_Pago.Value*100)),'0');
         TrataErro_Urano(Urano_Retorno);
         if Urano_Retorno <> 33 then // 33 = OK
         begin
            Result := False;
            Exit;
         end;
      end
      else
      begin
         if vTotal_Pagar > 0 then
         begin
            aForma := 'Dinheiro';
            aForma := Testa_Inclui_FormaPagto_Urano(aForma);
            Urano_Retorno := Pagamento(PChar(aForma),'',PChar(FloatToStr(Edit_Vlr_Pago.Value*100)),'0');
            TrataErro_Urano(Urano_Retorno);
            if Urano_Retorno <> 33 then // 33 = OK
            begin
               Result := False;
               Exit;
            end;
         end;

         if ((vTotal_Geral + vJuros - vDescontos) - vTotal_Pagar) > 0 then
         begin
            aForma := 'A PRAZO';
            aForma := Testa_Inclui_FormaPagto_Urano(aForma);
            //Olha se precisa acumular para impressao de cupom nao fiscal
            if SBPrazo.Down and Param_Venda.Cupom_Adicional and (Trim(StringGrid_Parcelas.Cells[2,1]) <> '') then
               Urano_Retorno := Pagamento(PChar(aForma),'',pChar(FloatToStr(((vTotal_Geral + vJuros - (Edit_VlrDesc.Value + vDescontos)) - Edit_Vlr_Pago.Value)*100)),'1')
            else
               Urano_Retorno := Pagamento(PChar(aForma),'',pChar(FloatToStr(((vTotal_Geral + vJuros - (Edit_VlrDesc.Value + vDescontos)) - Edit_Vlr_Pago.Value)*100)),'0');
            TrataErro_Urano(Urano_Retorno);
            if Urano_Retorno <> 33 then // 33 = OK
            begin
               Result := False;
               Exit;
            end;
         end;
      end;

      //Imprime cliente
      if Param_Venda.Imp_Cliente then
      begin
         Urano_Retorno := IdComprador(PChar(Trim(Edit_Cliente.Text)+' - '+Copy(PanelCliente.Text,1,42)),'0',PChar(Copy(PanelCliente2.Caption,Pos(':',PanelCliente2.Caption)+ 1,47)),PChar(Copy(PanelCliente1.Caption,1,47)),PChar(Copy(PanelCliente2.Caption,1,47)));
         TrataErro_Urano(Urano_Retorno);
         if Urano_Retorno <> 33 then
         begin
            Result := False;
            Exit;
         end;
      end;

      //Termino do pagamento e do cupom (mensagem)
      aMensagem := '';
      aMensAux := '';

      //Imprime OBS dos Postos de Gasolina
      if Param_Venda.Obs_Postos then
      begin
         aMensAux := '';
         if Edit_Kilometragem.Text <> '' then
            aMensAux := aMensAux + 'KM: ' + Edit_Kilometragem.Text + ' ';
         if Edit_Frota.Text <> '' then
            aMensAux := aMensAux + 'Frota: ' + Edit_Frota.Text + ' ';
         if Edit_Nro_Autorizacao.Text <> '' then
            aMensAux := aMensAux + 'Nro Autor.: ' + Edit_Nro_Autorizacao.Text + ' ';
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + Copy(aMensAux,1,48);
         //Veiculo
         aMensAux := '';
         if Combo_Veiculo.Text <> '' then
         begin
            aMensAux := Copy('Veiculo..:' + Combo_Veiculo.Text,1,47);
            while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
            aMensagem := aMensagem + Copy(aMensAux,1,48);
         end;
         //Motorista
         aMensAux := '';
         if Combo_Motorista.Text <> '' then
         begin
            aMensAux := Copy('Motorista:' + Combo_Motorista.Text,1,47);
            while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
            aMensagem := aMensagem + Copy(aMensAux,1,48);
         end;
      end;

      //Imprime Vendedor
      if Param_Venda.Imp_Vendedor then
      begin
         aMensAux := '';
         aMensAux := Copy('Vendedor(a): '+Trim(Edit_Vendedor.Text)+' - '+Trim(PanelVendedor.Caption),1,47);
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + Copy(aMensAux,1,48);
      end;

      //Imprime Mensagem
      if Param_Venda.Imp_Mensagem then
      begin
         aMensAux := '';
         aMensAux := Copy(Edit_Mensagem.Text,1,47);
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + Copy(aMensAux,1,48);
      end;

      Urano_Retorno := Propaganda('0',PChar(aMensagem));
      TrataErro_Urano(Urano_Retorno);
      if Urano_Retorno <> 33 then
      begin
         Result := False;
         Exit;
      end;

      Urano_Retorno := FechaCupom('');;
      TrataErro_Urano(Urano_Retorno);
      if Urano_Retorno = 33 then
      begin
         Urano_Retorno := AvancaLinhas('6');
         TrataErro_Urano(Urano_Retorno);
      end
      else
      begin
         Result := False;
         Exit;
      end;

      //Comprovante Nao Fiscal Vinculado
      //Olha se é a prazo, se é para imp. cupom adicional e se tem parcelas , senao nao imprime a confissão
      if SBPrazo.Down and Param_Venda.Cupom_Adicional and (Trim(StringGrid_Parcelas.Cells[2,1]) <> '') then
      begin
         //Bematech_Retorno := Bematech_FI_AbreComprovanteNaoFiscalVinculado(pChar(aForma), pChar(FloatToStr(((vTotal_Geral + vJuros) - vTotal_Pagar)*100)),vNota);
         aNota := vNota;
         Urano_Retorno := EmiteVinculado(PChar(aNota),'1');
         TrataErro_Urano(Urano_Retorno);
         if Urano_Retorno <> 33 then
         begin
            Result := False;
            Exit;
         end;
         aMensagem := '';
         aMensAux := '';
         if Edit_Kilometragem.Text <> '' then
         begin
            //aMensagem := aMensagem + 'KM: ' + Edit_Kilometragem.Text + ' ';
            aMensAux := 'KM: ' + Edit_Kilometragem.Text + ' ';
            while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
            aMensagem := aMensagem + aMensAux;
         end;
         if Edit_Frota.Text <> '' then
         begin
            //aMensagem := aMensagem + 'Frota: ' + Edit_Frota.Text + ' ';
            aMensAux := 'Frota: ' + Edit_Frota.Text + ' ';
            while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
            aMensagem := aMensagem + aMensAux;
         end;
         if Edit_Nro_Autorizacao.Text <> '' then
         begin
            //aMensagem := aMensagem + 'Nro Autor.: ' + Edit_Nro_Autorizacao.Text + ' ';
            aMensAux := 'Nro Autor.: ' + Edit_Nro_Autorizacao.Text + ' ';
            while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
            aMensagem := aMensagem + aMensAux;
         end;
         //Veiculo
         if Combo_Veiculo.Text <> '' then
         begin
            aMensagem := aMensagem + Copy('Veiculo..:' + Combo_Veiculo.Text,1,47);
            aMensAux := Copy('Veiculo..:' + Combo_Veiculo.Text,1,47);
            while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
            aMensagem := aMensagem + aMensAux;
         end;
         //Motorista
         if Combo_Motorista.Text <> '' then
         begin
            aMensagem := aMensagem + Copy('Motorista:' + Combo_Motorista.Text,1,47)+#13+#10;
            aMensAux := Copy('Motorista:' + Combo_Motorista.Text,1,47);
            while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
            aMensagem := aMensagem + aMensAux;
         end;

         Urano_Retorno := LinhasLivres(pChar(aMensagem));
         TrataErro_Urano(Urano_Retorno);
         if Urano_Retorno <> 33 then
         begin
            Result := False;
            Exit;
         end;

         aMensagem := '';
         aMensAux := '';
         aMensAux := '   Confesso-me devedor deste cupom nº ' + vNota;
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         aMensAux := 'ficando ciente de que ocorrendo inadimplemento  ';
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         aMensAux := 'com prazo superior a 60(sessenta) dias ocorrera ';
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         aMensAux := 'a inclusao automatica de meu nome no servico de ';
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         aMensAux := 'protecao ao credito (SPC).';
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         aMensAux := '.';
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         aMensAux := '  ___________________________________________   ';
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         aMensAux := Trim(Edit_Cliente.Text)+' - '+Copy(PanelCliente.Text,1,42);
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         aMensAux := '.';
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         Urano_Retorno := LinhasLivres(pChar(aMensagem));
         TrataErro_Urano(Urano_Retorno);
         if Urano_Retorno <> 33 then
         begin
            Result := False;
            Exit;
         end;

         aMensagem := '';
         aMensAux := '';

         aMensAux := AlinharStr('Parcelamento',48,'C');
         while Length(aMensAux) < 48 do aMensAux := aMensAux + ' ';
         aMensagem := aMensagem + aMensAux;

         Urano_Retorno := LinhasLivres(pChar(aMensagem));
         TrataErro_Urano(Urano_Retorno);
         if Urano_Retorno <> 33 then
         begin
            Result := False;
            Exit;
         end;

         //Manda as Parcelas
         For I := 1 to StringGrid_Parcelas.RowCount-1 do
         begin
            aMensagem := '';
            aMensagem := (AlinharStr(StringGrid_Parcelas.Cells[0,I],15,'C')+' '+StringGrid_Parcelas.Cells[1,I]+' '+StringGrid_Parcelas.Cells[2,I]+AlinharStr(StringGrid_Parcelas.Cells[3,I],12,'D'));
            while Length(aMensagem) < 48 do aMensagem := aMensagem + ' ';
            Urano_Retorno := LinhasLivres(pChar(aMensagem));
            TrataErro_Urano(Urano_Retorno);
            if Urano_Retorno <> 33 then
            begin
               Result := False;
               Exit;
            end;
         end;
         //Fecha o comprovante nao Fiscal Vinculado
         Urano_Retorno := FechaCupom('');;
         TrataErro_Urano(Urano_Retorno);
         if Urano_Retorno = 33 then
         begin
            Urano_Retorno := AvancaLinhas('6');
            TrataErro_Urano(Urano_Retorno);
         end
         else
         begin
            Result := False;
            Exit;
         end;
      end;
   end
   else if Parametros.IMPFIS_INDEX = 4 then //Daruma
   begin
      //Inicia termino do cupom fiscal

      //*****************************************************************************
      //O VALOR DE JUROS NAO PODE SER LANCADO COMO ACRESCIMO
      //*****************************************************************************
      vJuros := 0;
      //vDescontos := 0;
      //*****************************************************************************
      if (vDescontos + Edit_VlrDesc.Value) > vJuros then
      begin
         vAcre := 'D';
         vTipo := '$';
         vValor := FloatToStr((vDescontos + Edit_VlrDesc.Value - vJuros) * 100);
      end
      else
      begin
         vAcre := 'A';
         vTipo := '$';
         vValor := FloatToStr((vJuros - Edit_VlrDesc.Value - vDescontos) * 100);
      end;
      Daruma_Retorno := Daruma_FI_IniciaFechamentoCupom(vAcre, vTipo, vValor);
      Daruma_Analisa_Retorno;
      if Daruma_Retorno <> 1 then
      begin
         Result := False;
         if Daruma_Retorno = -1 then
            Exit;
      end;
      //Efetua forma de pagamento (Descricao e Valor Pago)
      if SBVista.Down then
      begin
         aForma := 'Dinheiro';
         Daruma_Retorno := Daruma_FI_EfetuaFormaPagamento(pChar(aForma), pChar((FloatToStr(Edit_Vlr_Pago.Value*100))));
         Daruma_Analisa_Retorno;
         if Daruma_Retorno <> 1 then
         begin
            Result := False;
         end;
      end
      else
      begin
         if vTotal_Pagar > 0 then
         begin
            aForma := 'Dinheiro';
            //Bematech_Retorno := Bematech_FI_EfetuaFormaPagamento(pChar(aForma), pChar(FloatToStr(vTotal_Pagar*100)));
            Daruma_Retorno := Daruma_FI_EfetuaFormaPagamento(pChar(aForma), pChar(FloatToStr(Edit_Vlr_Pago.Value*100)));
            Daruma_Analisa_Retorno;
            if Daruma_Retorno <> 1 then
            begin
               Result := False;
            end;
         end;
         if ((vTotal_Geral + vJuros - vDescontos) - vTotal_Pagar) > 0 then
         begin
            aForma := 'A PRAZO';
            //Bematech_Retorno := Bematech_FI_EfetuaFormaPagamento(pChar(aForma), pChar(FloatToStr(((vTotal_Geral + vJuros - Edit_VlrDesc.Value) - vTotal_Pagar)*100)));
            Daruma_Retorno := Daruma_FI_EfetuaFormaPagamento(pChar(aForma), pChar(FloatToStr(((vTotal_Geral + vJuros - (Edit_VlrDesc.Value + vDescontos)) - Edit_Vlr_Pago.Value)*100)));
            Daruma_Analisa_Retorno;
            if Daruma_Retorno <> 1 then
            begin
               Result := False;
            end;
         end;
      end;

      //Termino do pagamento e do cupom (mensagem)
      aMensagem := '';

      //Imprime cliente
      if Param_Venda.Imp_Cliente then
      begin
         aMensagem := aMensagem + Trim(Edit_Cliente.Text)+' - '+Copy(PanelCliente.Text,1,42)+#13+#10;
         if Length(Trim(Copy(PanelCliente1.Caption,1,47))) > 2 then
            aMensagem := aMensagem + Copy(PanelCliente1.Caption,1,47)+#13+#10;
         if Length(Trim(Copy(PanelCliente2.Caption,1,47))) > 10 then
            aMensagem := aMensagem + Copy(PanelCliente2.Caption,1,47)+#13+#10;
      end;

      //Imprime Vendedor
      if Param_Venda.Imp_Vendedor then
      begin
         aMensagem := aMensagem + Copy('Vendedor(a): '+Trim(Edit_Vendedor.Text)+' - '+Trim(PanelVendedor.Caption),1,47)+#13+#10;
      end;

      //Imprime Mensagem
      if Param_Venda.Imp_Mensagem then
      begin
         aMensagem := aMensagem + Copy(Edit_Mensagem.Text,1,47)+#13+#10;
      end;

      //Imprime OBS dos Postos de Gasolina
      if Param_Venda.Obs_Postos then
      begin
         if Edit_Kilometragem.Text <> '' then
            aMensagem := aMensagem + 'KM: ' + Edit_Kilometragem.Text + ' ';
         if Edit_Frota.Text <> '' then
            aMensagem := aMensagem + 'Frota: ' + Edit_Frota.Text + ' ';
         if Edit_Nro_Autorizacao.Text <> '' then
            aMensagem := aMensagem + 'Nro Autor.: ' + Edit_Nro_Autorizacao.Text + ' ';
         aMensagem := aMensagem + #13 + #10;
         //Veiculo
         if Combo_Veiculo.Text <> '' then
            aMensagem := aMensagem + Copy('Veiculo..:' + Combo_Veiculo.Text,1,47)+#13+#10;
         //Motorista
         if Combo_Motorista.Text <> '' then
            aMensagem := aMensagem + Copy('Motorista:' + Combo_Motorista.Text,1,47)+#13+#10;
      end;

      //Se for Bematech 1
      if Parametros.IMPFIS_INDEX = 0 then
      begin
         //Parcelamento se tiver
         if (StringGrid_Parcelas.RowCount > 2) or (Trim(StringGrid_Parcelas.Cells[1,1]) <> '') then
         begin
            For I := 1 to StringGrid_Parcelas.RowCount-1 do
            begin
               if I mod 2 <> 0 then Continue;
               aMensagem := aMensagem + (Trim(StringGrid_Parcelas.Cells[1,I])+' '+Copy(Trim(StringGrid_Parcelas.Cells[2,I]),1,6)+Copy(Trim(StringGrid_Parcelas.Cells[2,I]),9,2)+' '+Trim(StringGrid_Parcelas.Cells[3,I])) + '  ' + (Trim(StringGrid_Parcelas.Cells[1,I+1])+' '+ Copy(Trim(StringGrid_Parcelas.Cells[2,I]),1,6)+Copy(Trim(StringGrid_Parcelas.Cells[2,I]),9,2) +' '+Trim(StringGrid_Parcelas.Cells[3,I+1])) + #13 + #10;
            end;
         end;
      end;

      Daruma_Retorno := Daruma_FI_TerminaFechamentoCupom(aMensagem);
      Daruma_Analisa_Retorno;
      if Daruma_Retorno <> 1 then
      begin
         Result := False;
         Exit;
      end;

      //Comprovante Nao Fiscal Vinculado
      //Olha se é a prazo, se é para imp. cupom adicional e se tem parcelas , senao nao imprime a confissão
      if SBPrazo.Down and Param_Venda.Cupom_Adicional and (Trim(StringGrid_Parcelas.Cells[2,1]) <> '') then
      begin
         //Bematech_Retorno := Bematech_FI_AbreComprovanteNaoFiscalVinculado(pChar(aForma), pChar(FloatToStr(((vTotal_Geral + vJuros) - vTotal_Pagar)*100)),vNota);
         Daruma_Retorno := Daruma_FI_AbreComprovanteNaoFiscalVinculado(pChar(aForma),'','');
         Daruma_Analisa_Retorno;
         if Daruma_Retorno <> 1 then
         begin
            Result := False;
            Exit;
         end;

         {aMensagem := '';
         aMensagem := aMensagem + '   Confesso-me devedor deste cupom nº ' + vNota + #13 + #10;
         aMensagem := aMensagem + 'ficando ciente de que ocorrendo inadimplemento'+ #13 + #10;
         aMensagem := aMensagem + 'com prazo superior a 60(sessenta) dias ocorrera'+ #13 + #10;
         aMensagem := aMensagem + 'a inclusão automatica de meu nome no servico de'+ #13 + #10;
         aMensagem := aMensagem + 'proteção ao credito (SPC).'+ #13 + #10;
         aMensagem := aMensagem + ''+ #13 + #10;
         aMensagem := aMensagem + '____________________________________________'+ #13 + #10;
         aMensagem := aMensagem + Trim(Edit_Cliente.Text)+' - '+Copy(PanelCliente.Text,1,42);
         aMensagem := aMensagem + ''+ #13 + #10;
         aMensagem := aMensagem + AlinharStr('Parcelamento',48,'C');
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;
         if Daruma_Retorno <> 1 then
         begin
            Result := False;
            Exit;
         end;
         //Manda as Parcelas
         For I := 1 to StringGrid_Parcelas.RowCount-1 do
         begin
            aMensagem := '';
            aMensagem := (AlinharStr(StringGrid_Parcelas.Cells[0,I],15,'C')+' '+StringGrid_Parcelas.Cells[1,I]+' '+StringGrid_Parcelas.Cells[2,I]+AlinharStr(StringGrid_Parcelas.Cells[3,I],12,'D'));
            Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
            Daruma_Analisa_Retorno;
            if Daruma_Retorno <> 1 then
            begin
               Result := False;
               Exit;
            end;
         end;
         //Fecha o comprovante nao Fiscal Vinculado
         Daruma_Retorno := Daruma_FI_FechaComprovanteNaoFiscalVinculado;
         Daruma_Analisa_Retorno;
         if Daruma_Retorno <> 1 then
         begin
            Result := False;
            Exit;
         end;}

         {aMensagem := '';
         aMensagem := aMensagem + '   Confesso-me devedor deste cupom nº ' + vNota;
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;

         aMensagem := '';
         aMensagem := aMensagem + 'ficando ciente de que ocorrendo inadimplemento';
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;

         aMensagem := '';
         aMensagem := aMensagem + 'com prazo superior a 60(sessenta) dias ocorrera';
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;

         aMensagem := '';
         aMensagem := aMensagem + 'a inclusão automatica de meu nome no servico de';
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;

         aMensagem := '';
         aMensagem := aMensagem + 'proteção ao credito (SPC).';
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;

         aMensagem := '';
         aMensagem := aMensagem + ' ';
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;

         aMensagem := '';
         aMensagem := aMensagem + '____________________________________________';
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;

         aMensagem := '';
         aMensagem := aMensagem + Trim(Edit_Cliente.Text)+' - '+Copy(PanelCliente.Text,1,42);
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;

         aMensagem := '';
         aMensagem := aMensagem + '';
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;

         aMensagem := '';
         aMensagem := aMensagem + AlinharStr('Parcelamento',48,'C');
         Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
         Daruma_Analisa_Retorno;
         if Daruma_Retorno <> 1 then
         begin
            Result := False;
            Exit;
         end;
         //Manda as Parcelas
         For I := 1 to StringGrid_Parcelas.RowCount-1 do
         begin
            aMensagem := '';
            aMensagem := (AlinharStr(StringGrid_Parcelas.Cells[0,I],15,'C')+' '+StringGrid_Parcelas.Cells[1,I]+' '+StringGrid_Parcelas.Cells[2,I]+AlinharStr(StringGrid_Parcelas.Cells[3,I],12,'D'));
            Daruma_Retorno := Daruma_FI_UsaComprovanteNaoFiscalVinculado(pChar(aMensagem));
            Daruma_Analisa_Retorno;
            if Daruma_Retorno <> 1 then
            begin
               Result := False;
               Exit;
            end;
         end;
         //Fecha o comprovante nao Fiscal Vinculado
         Daruma_Retorno := Daruma_FI_FechaComprovanteNaoFiscalVinculado;
         Daruma_Analisa_Retorno;
         if Daruma_Retorno <> 1 then
         begin
            Result := False;
            Exit;
         end;
      end;
   end;}
end;

procedure TFrmVendasRap.BtnConfirmaClick(Sender: TObject);
var I : Integer;
begin                              {
   try
      Screen.Cursor := crHourGlass;
      // se o valor e menor que total a pagar
      if (SBVista.Down) and (StrToFloat(Tira_Ponto(Edit_Vlr_Pago.Text)) < StrToFloat(Tira_Ponto(LabelTot_Pagar.Caption))) then
      begin
         MessageDlg('"Valor Pago" não pode ser menor que o "Total a Pagar".',mtInformation,[mbOk],0);
         Edit_Vlr_Pago.SetFocus;
         Exit;
      end;
      //Cliente
      if StrToIntZero(Edit_Cliente.Text) = 0 then
      begin
         if Note_Fecha.ActivePage = 'Informa' then
         begin
            MessageDlg('"Cliente" deve ser preenchido.',mtInformation,[mbOk],0);
            Edit_Cliente.SetFocus;
         end
         else
            MessageDlg('"Cliente" deve ser preenchido nos Parâmetros.',mtInformation,[mbOk],0);
         Exit;
      end;
      //Vendedor
      if StrToIntZero(Edit_Vendedor.Text) = 0 then
      begin
         if Note_Fecha.ActivePage = 'Informa' then
         begin
            MessageDlg('"Vendedor" deve ser preenchido.',mtInformation,[mbOk],0);
            Edit_Vendedor.SetFocus;
         end
         else
            MessageDlg('"Vendedor" deve ser preenchido nos Parâmetros.',mtInformation,[mbOk],0);

         Exit;
      end;

      //Analisa credito do cliente
      if not Analisa_Credito_Cliente(StrToInt(Edit_Cliente.Text),SBVista.Down,StrToFloat(TirarPonto(LabelTot_Compra.Caption))) then
      begin
         Exit;
      end;


      LabelTroco.Caption := FormatFloat('#,###,###,##0.00', (StrToFloatZero(Edit_Vlr_Pago.Text) - (vTotal_Pagar - StrToFloatZero(Edit_VlrDesc.Text))));

      //Aciona a Gaveta do dinheiro
      Aciona_GavetaExecute(self);

      //Faz pagamento na impressora
      if not EfetuaPagamento_CupomFiscal then
      begin
         //RollBack
         if Trans_Vendas.InTransaction then
            Trans_Vendas.Rollback;
         Operacao := opPadrao;
         Exit;
      end;

      with JvProc_Vendas do
      begin
         //Busca o Controle
         Try
            Params.ByNameAsInteger['POPER'] := 1; //Edita
            Params.ByNameAsInteger['PCONTROLE'] := vControle;
            //Valor do COO da Impressora Fiscal
            Params.ByNameAsString['PNRO_NOTA'] := vNota;
            Params.ByNameAsString['PSER_NOTA'] := 'CF';
            //Numero do caixa da Impressora Fiscal
            Params.ByNameAsString['PNUMCAIXA'] := Retorna_NroCaixa;
            Params.ByNameAsDateTime['PDT_EMISS'] := Date;
            Params.ByNameAsInteger['PCOD_CLIENTE'] := StrToIntZero(Edit_Cliente.Text);
            Params.ByNameIsNull['PCOD_FORNEC'] := True;
            if Trim(CFOP) <> '' then
               Params.ByNameAsString['PCFOP'] := CFOP
            else
               Params.ByNameIsNull['PCFOP'] := True;
            Params.ByNameIsNull['PCOD_TRANS'] := True;

            Params.ByNameIsNull['PCOD_VENDEDOR'] := True;
            Params.ByNameAsDateTime['PDT_SAIDA'] := Date;
            Params.ByNameAsDateTime['PHR_SAIDA'] := Time;
            Params.ByNameAsString['PCTA_FRETE'] := '';
            Params.ByNameAsCurrency['PVL_FRETE'] := 0;
            Params.ByNameAsCurrency['PICM_FRETE'] := 0;
            Params.ByNameIsNull['PCOD_OBSERV'] := True;
            Params.ByNameAsString['POBSERV2'] := '';
            Params.ByNameAsString['PPLACA'] := '';
            Params.ByNameAsCurrency['PVLR_PAGO_D'] := 0;
            Params.ByNameAsCurrency['PTROCO'] := 0;
            Params.ByNameAsCurrency['PPERC_DESC'] := 0;
            Params.ByNameAsCurrency['PVL_DESC'] := 0;
            Params.ByNameAsCurrency['PPERC_ACRE'] := 0;
            Params.ByNameAsCurrency['PVLR_ACRE'] := 0;
            Params.ByNameAsString['PCLI_FORN'] := '';
            Params.ByNameAsCurrency['PNTQUANTID'] := 0;
            Params.ByNameAsString['PNTESPECIE'] := '';
            Params.ByNameAsString['PNTMARCA'] := '';

            //Forma de Pagamento
            Params.ByNameIsNull['PCOD_FORMAPAGTO'] := True;

            //Postos de Gasolina
            Params.ByNameIsNull['PVEICULO'] := True;
            Params.ByNameIsNull['PMOTORISTA'] := True;
            Params.ByNameIsNull['PKILOMETRAGEM'] := True;
            Params.ByNameIsNull['PFROTA'] := True;
            Params.ByNameIsNull['PNRO_AUTORIZACAO'] := True;

            
            

            Params.ByNameAsInteger['PCOD_VENDEDOR'] := StrToInt(Edit_Vendedor.Text);
            Params.ByNameAsDateTime['PDT_SAIDA'] := Date;
            Params.ByNameAsDateTime['PHR_SAIDA'] := Time;
            Params.ByNameAsString['PCTA_FRETE'] := '';
            Params.ByNameAsCurrency['PVL_FRETE'] := 0;
            Params.ByNameAsCurrency['PICM_FRETE'] := 0;
            Params.ByNameIsNull['PCOD_OBSERV'] := True;
            Params.ByNameAsString['POBSERV2'] := Edit_Mensagem.Text;
            Params.ByNameAsString['PPLACA'] := '';
            Params.ByNameAsCurrency['PVLR_PAGO_D'] := StrToFloatZero(Edit_Vlr_Pago.Text);
            Params.ByNameAsCurrency['PTROCO'] := (StrToFloatZero(Edit_Vlr_Pago.Text) - (vTotal_Pagar - StrToFloatZero(Edit_VlrDesc.Text)));
            Params.ByNameAsCurrency['PPERC_DESC'] := StrToFloatZero(Edit_PerctDesc.Text);
            Params.ByNameAsCurrency['PVL_DESC'] := StrToFloatZero(Edit_VlrDesc.Text);
            Params.ByNameAsCurrency['PPERC_ACRE'] := 0;
            Params.ByNameAsCurrency['PVLR_ACRE'] := 0;
            Params.ByNameAsString['PCLI_FORN'] := 'Cliente';
            Params.ByNameAsCurrency['PNTQUANTID'] := 0;
            Params.ByNameAsString['PNTESPECIE'] := '';
            Params.ByNameAsString['PNTMARCA'] := '';
            Params.ByNameIsNull['PCOD_FORMAPAGTO'] := True;
            //POSTOS DE GASOLINA
            Params.ByNameAsString['PVEICULO'] := Combo_Veiculo.Text;
            Params.ByNameAsString['PMOTORISTA'] := Combo_Motorista.Text;
            Params.ByNameAsString['PKILOMETRAGEM'] := Edit_Kilometragem.Text;
            Params.ByNameAsString['PFROTA'] := Edit_Frota.Text;
            Params.ByNameAsString['PNRO_AUTORIZACAO'] := Edit_Nro_Autorizacao.Text;
            
            //by fernando (so sei que ativa as movimentacoes de estoque)
            Params.ByNameAsInteger['PIND_VENDA_RAP'] := 1;


            Execute;

            //Faz o pagamento
            if SBVista.Down then
            begin
               JvProc_Venda_Vista.Params.ByNameAsInteger['OCONTROLE'] := vControle;
               JvProc_Venda_Vista.Execute;
            end
            else
            begin
               For I := 1 to StringGrid_Parcelas.RowCount-1 do
               begin
                  JvProc_Venda_Prazo.Params.ByNameAsInteger['OCONTROLE'] := vControle;
                  if SBVista.Down then
                     JvProc_Venda_Prazo.Params.ByNameAsInteger['AFORMAPAGTO'] := Param_Venda.Pagamento_a_Vista
                  else
                     JvProc_Venda_Prazo.Params.ByNameAsInteger['AFORMAPAGTO'] := vFormaPagto;
                  JvProc_Venda_Prazo.Params.ByNameAsString['ODOCUMENTO'] := StringGrid_Parcelas.Cells[1,I];
                  JvProc_Venda_Prazo.Params.ByNameAsDateTime['OVENCIMENTO'] := StrToDate(StringGrid_Parcelas.Cells[2,I]);
                  JvProc_Venda_Prazo.Params.ByNameAsCurrency['OVALOR'] := StrToFloat(TirarPonto(StringGrid_Parcelas.Cells[3,I]));
                  if (Trim(StringGrid_Parcelas.Cells[4,I]) = '') or (StrToInt(StringGrid_Parcelas.Cells[4,I]) = 0) then
                     JvProc_Venda_Prazo.Params.ByNameIsNull['OBANCO'] := True
                  else
                     JvProc_Venda_Prazo.Params.ByNameAsInteger['OBANCO'] := StrToInt(StringGrid_Parcelas.Cells[4,I]);
                  JvProc_Venda_Prazo.Params.ByNameAsString['ONRO_CHEQUE'] := Trim(StringGrid_Parcelas.Cells[5,I]);
                  JvProc_Venda_Prazo.Params.ByNameAsString['OEMITENTE'] := Trim(StringGrid_Parcelas.Cells[6,I]);
                  JvProc_Venda_Prazo.Execute;
               end;
            end;

            //Da o C O M M I T
            Trans_Vendas.Commit ;
            Operacao := opPadrao;
         except
            On E:Exception do
            begin
               TrataErroVenda;
               FrmPrincipal.TrataErro(E);
               MessageDlg('Ocorreu um erro inesperado.' + #13#10 + E.Message,mtError, [mbOK],0);
            end;
         end;
      end;
   finally
      Screen.Cursor := crDefault;
   end; }
end;

procedure TFrmVendasRap.Edit_VendedorExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Vendedor.Text)) <> 0) and (Trim(Edit_Vendedor.Text) <> '0') then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select CODIGO, NOME From VENDEDORES where Codigo='+ Edit_Vendedor.Text,JvQuery) then Exit;
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
      end; }
   end
   else
   begin
      Edit_Vendedor.Text := '0';
      PanelVendedor.Caption := '';
   end;
end;

Procedure TFrmVendasRap.CalculaDesconto;
begin
   //if SBVista.Down then
//   begin
      //aqui
      if (vTotal_Pagar > 0) and (SBPrazo.Down) then
         LabelTot_Pagar.Caption := FormatFloat('#,###,###,##0.00',(vTotal_Pagar))
      else
         LabelTot_Pagar.Caption := FormatFloat('#,###,###,##0.00',(vTotal_Geral + vJuros - StrToFloatZero(Edit_VlrDesc.Text)));
      LabelVlr_Pago.Caption := FormatFloat('#,###,###,##0.00',StrToFloatZero(Edit_Vlr_Pago.Text));
      if StrToFloatZero(Edit_Vlr_Pago.Text) > 0 then
         LabelTroco.Caption := FormatFloat('#,###,###,##0.00',(StrToFloatZero(Edit_Vlr_Pago.Text) - (vTotal_Pagar - StrToFloatZero(Edit_VlrDesc.Text))))
      else
         LabelTroco.Caption := FormatFloat('#,###,###,##0.00',0);
   //end;
end;

procedure TFrmVendasRap.Edit_PerctDescChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      if Trim((Sender as TEdit).Text) <> '' then
      begin
         Edit_VlrDesc.Text := FormatFloat('#,###,##0.00',((vTotal_Geral + vJuros) * (StrToFloatZero(Edit_PerctDesc.Text) / 100)));
         if SBVista.Down then
            Edit_Vlr_Pago.Text := FormatFloat('#,###,##0.00',(vTotal_Geral - StrToFloatZero(Edit_VlrDesc.Text)))
         else
            if vTotal_Pagar > 0 then
               Edit_Vlr_Pago.Text := FormatFloat('#,###,##0.00',(vTotal_Pagar - StrToFloatZero(Edit_VlrDesc.Text)));
         CalculaDesconto;
      end;
   end;
end;

procedure TFrmVendasRap.Edit_VlrDescChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      if Trim((Sender as TEdit).Text) <> '' then
      begin
         Edit_PerctDesc.Text := '0';
         if SBVista.Down then
            Edit_Vlr_Pago.Text := FormatFloat('#,###,##0.00',(vTotal_Geral - StrToFloatZero(Edit_VlrDesc.Text)))
         else
            if vTotal_Pagar > 0 then
               Edit_Vlr_Pago.Text := FormatFloat('#,###,##0.00',(vTotal_Pagar - StrToFloatZero(Edit_VlrDesc.Text)));
         CalculaDesconto;
      end;
   end;
end;

procedure TFrmVendasRap.Edit_Vlr_PagoChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      if Trim((Sender as TEdit).Text) <> '' then
      begin
         CalculaDesconto;
      end;
   end;
end;

procedure TFrmVendasRap.F3Execute(Sender: TObject);
begin
   //if (Operacao <> opEmVenda) and (Operacao <> opEmFechamento) then Exit;
 if Paginas.PageIndex = 0 then
   begin
      //if Operacao <> opEmVenda then Exit;
      FrmPesqProd := TFrmPesqProd.Create(self);
      try
       {  FrmPesqProd.JvQry.SQL.Clear;
         FrmPesqProd.JvQry.SQL.add('Select * from VW_PROD_ECF');
         FrmPesqProd.JvQry.Open;
         FormatNumericFields(FrmPesqProd.JvQry);
         if FrmPesqProd.ShowModal = mrOK then
         begin
            if Trim(FrmPesqProd.JvQry.FieldByName('CODBARRA').asString) <> '' then
               EditProduto.Text := FrmPesqProd.JvQry.FieldByName('CODBARRA').asString
            else
               EditProduto.Text := FrmPesqProd.JvQry.FieldByName('CODIGO').asString;
            LabelDescricao.Caption := FrmPesqProd.JvQry.FieldByName('APELIDO').asString;
            LabelUnidade.Caption := FrmPesqProd.JvQry.FieldByName('UNIDADE').asString;
            LabelGrupo.Caption := FrmPesqProd.JvQry.FieldByName('GRUPO_NOME').asString+' - '+FrmPesqProd.JvQry.FieldByName('SUBGRUPO_NOME').asString;
            //Imagem
            if ((Trim(FrmPesqProd.JvQry.FieldByName('PATHIMAGE').asString) <> '') or
                (Trim(FrmPesqProd.JvQry.FieldByName('GRUPO_PATHIMAGEM').asString) <> '')) then
            begin
               if Trim(FrmPesqProd.JvQry.FieldByName('PATHIMAGE').asString) <> '' then
               begin
                  if FileExists(FrmPesqProd.JvQry.FieldByName('PATHIMAGE').asString) then
                     ImageProduto.Picture.LoadFromFile(FrmPesqProd.JvQry.FieldByName('PATHIMAGE').asString);
               end
               else
               begin
                  if FileExists(FrmPesqProd.JvQry.FieldByName('GRUPO_PATHIMAGEM').asString) then
                     ImageProduto.Picture.LoadFromFile(FrmPesqProd.JvQry.FieldByName('GRUPO_PATHIMAGEM').asString);
               end;
            end
            else
               Carrega_Logo;
            EditQuantidade.Text := FrmPesqProd.Edit_Quantidade.Text;
            //EditPrecoUnit.FormatSize := FrmPesqProd.Edit_Vl_Unitario.FormatSize;
            EditPrecoUnit.Text := FrmPesqProd.Edit_Vl_Unitario.Text;
            if StrToFloatZero(FrmPesqProd.Edit_Perc_Desc.Text) > 0 then
            begin
               vDesconto := StrToFloatZero(FrmPesqProd.Edit_Perc_Desc.Text);
               LabelDesconto.Caption := 'Desc. ' + Trim(FrmPesqProd.Edit_Perc_Desc.Text) + '%';
            end
            else
            begin
               vDesconto := 0;
               LabelDesconto.Caption := '';
            end;
            EditProdutoExit(Self);
         end; }
      finally
          FrmPesqProd.Free;
          FrmPesqProd := Nil;
      end;
   end
   else
   begin
      if Edit_Cliente.Focused then
         F3_ClienteClick(Self)
      else if Edit_Vendedor.Focused then
         F3_VendedorClick(Self);
   end;
end;

procedure TFrmVendasRap.F3_ClienteClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select * from Clientes';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Clientes';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Cliente.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         //Edit_ClienteExit(Self);
         //Edit_Cliente.SetFocus;
         if not Analisa_Cliente(StrToInt(Edit_Cliente.Text),StrToFloat(TirarPonto(LabelTot_Compra.Caption))) then BtnConfirma.Enabled := false;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmVendasRap.F3_VendedorClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from VENDEDORES ';
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

Procedure TFrmVendasRap.ImprFiscal_Nao_Definida;
begin
   //Aborta venda
//   if Trans_Vendas.InTransaction then Trans_Vendas.Rollback;
   Operacao := opPadrao;
   MessageDlg('Impressora Fiscal não definida corretamente.',mtError,[mbOk],0);
   {FrmImpFisc := TFrmImpFisc.Create(self);
   FrmImpFisc.ShowModal;
   FrmImpFisc.Free;}
end;

procedure TFrmVendasRap.Cancela_CupomExecute(Sender: TObject);
var NroCupom  : String;
    oControle : Integer;
begin
  Operacao := opPadrao;
  { if Operacao <> opPadrao then Exit;
   if MessageDlg('Confirma cancelamento do último Cupom Fiscal ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
      //Testa as Impressoras Fiscais e envia comando de Cancelamento de Cupom
      if Parametros.IMPFIS_INDEX = -1 then
      begin
         ImprFiscal_Nao_Definida;
      end
      else if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then //Bematech I e II
      begin
         //Pega antes porque enquanto esta cancelando, nao posso pegar
         NroCupom := Retorna_NroCupom;
         if NroCupom <> 'Erro' then
         begin
            NroCupom := FormatFloat('000000',StrToInt(Retorna_NroCupom)-1); //Tira um para cancelar o anterior
         end;

         Bematech_Retorno := Bematech_FI_CancelaCupom;
         FrmPrincipal.TrataErro_Bematech;

         //Cancela na base de dados
         if Bematech_Retorno = 1 then
         begin
            if NroCupom = 'Erro' then
            begin
               MessageDlg('Não foi possível cancelar esta venda automaticamente. Você deverá cancela-la manualmente.',mtInformation,[mbOk],0);
               Exit;
            end;
            if not FrmPrincipal.RodaConsulta('SELECT MAX(CONTROLE) FROM VENDAS WHERE NRO_NOTA = '''+ NroCupom +''' AND SER_NOTA = ''CF''',JvQry_Cancela) then
               oControle := 0
            else
               oControle := JvQry_Cancela.FieldByName('MAX').asInteger;
            if oControle = 0 then
            begin
               MessageDlg('Não foi possível cancelar esta venda automaticamente. Você deverá cancela-la manualmente.',mtInformation,[mbOk],0);
               Exit;
            end;
            JvProc_Cancela_Nota_Cupom.Params.ByNameAsInteger['PCONTROLE'] := oControle;
            FrmPrincipal.RodaSP(JvProc_Cancela_Nota_Cupom);
         end;
      end
      else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
      begin
         //Pega antes porque enquanto esta cancelando, nao posso pegar
         NroCupom := Retorna_NroCupom;
         if NroCupom <> 'Erro' then
         begin
            NroCupom := FormatFloat('000000',StrToInt(Retorna_NroCupom)-1); //Tira um para cancelar o anterior
         end;

         if CancelaCupomAfrac then
         begin
            if NroCupom = 'Erro' then
            begin
               MessageDlg('Não foi possível cancelar esta venda automaticamente. Você deverá cancela-la manualmente.',mtInformation,[mbOk],0);
               Exit;
            end;
            //Cancela na base de dados
            if not FrmPrincipal.RodaConsulta('SELECT MAX(CONTROLE) FROM VENDAS WHERE NRO_NOTA = '''+ NroCupom +''' AND SER_NOTA = ''CF''',IBQuery1) then
               oControle := 0
            else
               oControle := IBQuery1.FieldByName('MAX').asInteger;
            if oControle = 0 then
            begin
               MessageDlg('Não foi possível cancelar esta venda automaticamente. Você deverá cancela-la manualmente.',mtInformation,[mbOk],0);
               Exit;
            end;
            IBProc_Cancela_Nota_Cupom.ParamByName('PCONTROLE').AsInteger := oControle;
            FrmPrincipal.RodaSP(IBProc_Cancela_Nota_Cupom);
         end;
      end
      else if Parametros.IMPFIS_INDEX = 3 then  //Urano
      begin
         //Pega antes porque enquanto esta cancelando, nao posso pegar
         NroCupom := Retorna_NroCupom;
         if NroCupom <> 'Erro' then
         begin
            NroCupom := FormatFloat('000000',StrToInt(Retorna_NroCupom)-1); //Tira um para cancelar o anterior
         end;

         Urano_Retorno := CancelaVenda('');

         if Urano_Retorno <> 33 then // 33 = OK
         begin
            Urano_Retorno := CancelaCupom('');
            TrataErro_Urano(Urano_Retorno);
         end;

         //Cancela na base de dados
         if Urano_Retorno = 33 then // 33 = OK
         begin
            Urano_Retorno := AvancaLinhas('6');
            TrataErro_Urano(Urano_Retorno);

            if NroCupom = 'Erro' then
            begin
               MessageDlg('Não foi possível cancelar esta venda automaticamente. Você deverá cancela-la manualmente.',mtInformation,[mbOk],0);
               Exit;
            end;
            if not FrmPrincipal.RodaConsulta('SELECT MAX(CONTROLE) FROM VENDAS WHERE NRO_NOTA = '''+ NroCupom +''' AND SER_NOTA = ''CF''',IBQuery1) then
               oControle := 0
            else
               oControle := IBQuery1.FieldByName('MAX').asInteger;
            if oControle = 0 then
            begin
               MessageDlg('Não foi possível cancelar esta venda automaticamente. Você deverá cancela-la manualmente.',mtInformation,[mbOk],0);
               Exit;
            end;
            IBProc_Cancela_Nota_Cupom.ParamByName('PCONTROLE').AsInteger := oControle;
            FrmPrincipal.RodaSP(IBProc_Cancela_Nota_Cupom);
         end;
      end
      else if Parametros.IMPFIS_INDEX = 4 then //Daruma
      begin
         //Pega antes porque enquanto esta cancelando, nao posso pegar
         NroCupom := Retorna_NroCupom;
         if NroCupom <> 'Erro' then
         begin
            NroCupom := FormatFloat('000000',StrToInt(Retorna_NroCupom)-1); //Tira um para cancelar o anterior
         end;

         Daruma_Retorno := Daruma_FI_CancelaCupom;
         Daruma_Analisa_Retorno;

         //Cancela na base de dados
         if Daruma_Retorno = 1 then
         begin
            if NroCupom = 'Erro' then
            begin
               MessageDlg('Não foi possível cancelar esta venda automaticamente. Você deverá cancela-la manualmente.',mtInformation,[mbOk],0);
               Exit;
            end;
            if not FrmPrincipal.RodaConsulta('SELECT MAX(CONTROLE) FROM VENDAS WHERE NRO_NOTA = '''+ NroCupom +''' AND SER_NOTA = ''CF''',IBQuery1) then
               oControle := 0
            else
               oControle := IBQuery1.FieldByName('MAX').asInteger;
            if oControle = 0 then
            begin
               MessageDlg('Não foi possível cancelar esta venda automaticamente. Você deverá cancela-la manualmente.',mtInformation,[mbOk],0);
               Exit;
            end;
            IBProc_Cancela_Nota_Cupom.ParamByName('PCONTROLE').AsInteger := oControle;
            FrmPrincipal.RodaSP(IBProc_Cancela_Nota_Cupom);
         end;
      end;
   end;}
end;

procedure TFrmVendasRap.Cancela_ItemExecute(Sender: TObject);
begin
   if Operacao <> opEmVenda then Exit;
   FrmCancItem := TFrmCancItem.Create(Self);
   if FrmCancItem.ShowModal = mrCancel then
      Exit;

   //Testa as Impressoras Fiscais e envia comando de cacelamento de item
   {if Parametros.IMPFIS_INDEX = -1 then
   begin
      ImprFiscal_Nao_Definida;
   end
   else if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then //Bematech I e II
   begin                        }
      if oItemRetorno = 0 then
      begin                      {
         Bematech_Retorno := Bematech_FI_CancelaItemAnterior;
         FrmPrincipal.TrataErro_Bematech;
         //Inclui mensagem no memo de cancelamento
         if Bematech_Retorno = 1 then
         begin                           }
            //Desconta do total
            vTotal_Geral := vTotal_Geral - vl_TotProd;
            LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

            //Tira no memo
{            //Cancela no VendItem
            with JvProc_VendItem do
            begin
               //if not Prepared then Prepare;
               Params.ByNameasInteger['POPER'] := 2;
               Params.ByNameasInteger['PCONTROLE'] := vControle;
               Params.ByNameasInteger['PSEQUENCIA'] := UltProdSeq_Vend;
               Params.ByNameasInteger['PCOD_PRODUTO'] := UltProdCod_Vend;
               Params.ByNameAsCurrency['PQUANTIDADE'] := 0;
               Params.ByNameAsCurrency['PVL_UNITARIO'] := 0;
               Params.ByNameAsCurrency['PPERC_DESC'] := 0;
               Params.ByNameisnull['PDESCR_SERVICO'] := true;
               Params.ByNameisnull['PPESO_LIQUIDO'] := true;
               Params.ByNameisnull['POBSERVACAO'] := true;
               //if not Prepared then Prepare;
               Execute;
            end; }
         //end;
      end
      else // se o retorno nao eh 0
      begin
         //Bematech_Retorno := Bematech_FI_CancelaItemGenerico(FormatFloat('000',oItemRetorno));
         //FrmPrincipal.TrataErro_Bematech;
         //Inclui mensagem no memo de cancelamento
         //if Bematech_Retorno = 1 then
         //begin
            //Desconta do total
            vTotal_Geral := vTotal_Geral - Prod_Vlr_Prod[oItemRetorno-1]; //vl_TotProd;
            LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

            //Tira no memo
            MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',oItemRetorno),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',Prod_Vlr_Prod[oItemRetorno-1]),16,'D'));
            MemoProdutos.Lines.Add('');

            //Apaga na base de dados
            //Cancela no VendItem
{            with JvProc_VendItem do
            begin
               //if not Prepared then Prepare;
               Params.ByNameasInteger['POPER'] := 2;
               Params.ByNameasInteger['PCONTROLE'] := vControle;
               Params.ByNameasInteger['PSEQUENCIA'] := Prod_Seq_Prod[oItemRetorno-1];
               Params.ByNameasInteger['PCOD_PRODUTO'] := Prod_Cod_Prod[oItemRetorno -1];
               Params.ByNameAsCurrency['PQUANTIDADE'] := 0;
               Params.ByNameAsCurrency['PVL_UNITARIO'] := 0;
               Params.ByNameAsCurrency['PPERC_DESC'] := 0;
               Params.ByNameIsNull['PDESCR_SERVICO'] := true;
               Params.ByNameIsNull['PPESO_LIQUIDO'] := true;
               Params.ByNameIsNull['POBSERVACAO'] := true;
              //if not Prepared then Prepare;
               //ExecProc;
               Execute;
            end;  }
         //end;
      end;
      oItemRetorno := 0; {
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      if oItemRetorno = 0 then
      begin
         if CancelaItemAfrac(0) then
         begin
            //Desconta do total
            vTotal_Geral := vTotal_Geral - vl_TotProd;
            LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

            //Tira no memo
            MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',Prod_Seq_CF[High(Prod_Seq_CF)]),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',vl_TotProd),16,'D'));
            MemoProdutos.Lines.Add('');

            //Apaga na base de dados
            //Cancela no VendItem
            with IBProc_VendItem do
            begin
               if not Prepared then Prepare;
               ParamByName('POPER').asInteger := 2;
               ParamByName('PCONTROLE').asInteger := vControle;
               ParamByName('PSEQUENCIA').asInteger := UltProdSeq_Vend;
               ParamByName('PCOD_PRODUTO').asInteger := UltProdCod_Vend;
               ParamByName('PQUANTIDADE').asFloat := 0;
               ParamByName('PVL_UNITARIO').asFloat := 0;
               ParamByName('PPERC_DESC').asFloat := 0;
               ParamByName('PDESCR_SERVICO').Value := NULL;
               ParamByName('PPESO_LIQUIDO').Value := NULL;
               ParamByName('POBSERVACAO').Value := NULL;
               if not Prepared then Prepare;
               ExecProc;
            end;
         end;
      end
      else
      begin
         if CancelaItemGenerico(oItemRetorno) then
         begin
            //Desconta do total
            vTotal_Geral := vTotal_Geral - Prod_Vlr_Prod[oItemRetorno-1]; //vl_TotProd;
            LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

            //Tira no memo
            MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',oItemRetorno),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',Prod_Vlr_Prod[oItemRetorno-1]),16,'D'));
            MemoProdutos.Lines.Add('');

            //Apaga na base de dados
            //Cancela no VendItem
            with IBProc_VendItem do
            begin
               if not Prepared then Prepare;
               ParamByName('POPER').asInteger := 2;
               ParamByName('PCONTROLE').asInteger := vControle;
               ParamByName('PSEQUENCIA').asInteger := Prod_Seq_Prod[oItemRetorno-1];
               ParamByName('PCOD_PRODUTO').asInteger := Prod_Cod_Prod[oItemRetorno -1];
               ParamByName('PQUANTIDADE').asFloat := 0;
               ParamByName('PVL_UNITARIO').asFloat := 0;
               ParamByName('PPERC_DESC').asFloat := 0;
               ParamByName('PDESCR_SERVICO').Value := NULL;
               ParamByName('PPESO_LIQUIDO').Value := NULL;
               ParamByName('POBSERVACAO').Value := NULL;
              if not Prepared then Prepare;
               ExecProc;
            end;
         end;
      end;
      oItemRetorno := 0;
   end
   else if Parametros.IMPFIS_INDEX = 3 then //Urano
   begin
      if oItemRetorno = 0 then
      begin
         Urano_Retorno := CancelaItem('',PChar(IntToStr(Prod_Seq_CF[High(Prod_Seq_CF)])));
         TrataErro_Urano(Urano_Retorno);
         //Inclui mensagem no memo de cancelamento
         if Urano_Retorno = 33 then // 33 = OK
         begin
            //Desconta do total
            vTotal_Geral := vTotal_Geral - vl_TotProd;
            LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

            //Tira no memo
            MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',Prod_Seq_CF[High(Prod_Seq_CF)]),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',vl_TotProd),16,'D'));
            MemoProdutos.Lines.Add('');

            //Apaga na base de dados
            //Cancela no VendItem
            with IBProc_VendItem do
            begin
               if not Prepared then Prepare;
               ParamByName('POPER').asInteger := 2;
               ParamByName('PCONTROLE').asInteger := vControle;
               ParamByName('PSEQUENCIA').asInteger := UltProdSeq_Vend;
               ParamByName('PCOD_PRODUTO').asInteger := UltProdCod_Vend;
               ParamByName('PQUANTIDADE').asFloat := 0;
               ParamByName('PVL_UNITARIO').asFloat := 0;
               ParamByName('PPERC_DESC').asFloat := 0;
               ParamByName('PDESCR_SERVICO').Value := NULL;
               ParamByName('PPESO_LIQUIDO').Value := NULL;
               ParamByName('POBSERVACAO').Value := NULL;
               if not Prepared then Prepare;
               ExecProc;
            end;
         end;
      end
      else
      begin
         Urano_Retorno := CancelaItem('',PChar(IntToStr(oItemRetorno)));
         TrataErro_Urano(Urano_Retorno);
         //Inclui mensagem no memo de cancelamento
         if Urano_Retorno = 33 then
         begin
            //Desconta do total
            vTotal_Geral := vTotal_Geral - Prod_Vlr_Prod[oItemRetorno-1]; //vl_TotProd;
            LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

            //Tira no memo
            MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',oItemRetorno),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',Prod_Vlr_Prod[oItemRetorno-1]),16,'D'));
            MemoProdutos.Lines.Add('');

            //Apaga na base de dados
            //Cancela no VendItem
            with IBProc_VendItem do
            begin
               if not Prepared then Prepare;
               ParamByName('POPER').asInteger := 2;
               ParamByName('PCONTROLE').asInteger := vControle;
               ParamByName('PSEQUENCIA').asInteger := Prod_Seq_Prod[oItemRetorno-1];
               ParamByName('PCOD_PRODUTO').asInteger := Prod_Cod_Prod[oItemRetorno -1];
               ParamByName('PQUANTIDADE').asFloat := 0;
               ParamByName('PVL_UNITARIO').asFloat := 0;
               ParamByName('PPERC_DESC').asFloat := 0;
               ParamByName('PDESCR_SERVICO').Value := NULL;
               ParamByName('PPESO_LIQUIDO').Value := NULL;
               ParamByName('POBSERVACAO').Value := NULL;
              if not Prepared then Prepare;
               ExecProc;
            end;
         end;
      end;
      oItemRetorno := 0;
   end
   else if Parametros.IMPFIS_INDEX = 4 then //Daruma
   begin
      if oItemRetorno = 0 then
      begin
         Daruma_Retorno := Daruma_FI_CancelaItemAnterior;
         Daruma_Analisa_Retorno;
         //Inclui mensagem no memo de cancelamento
         if Daruma_Retorno = 1 then
         begin
            //Desconta do total
            vTotal_Geral := vTotal_Geral - vl_TotProd;
            LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

            //Tira no memo
            MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',Prod_Seq_CF[High(Prod_Seq_CF)]),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',vl_TotProd),16,'D'));
            MemoProdutos.Lines.Add('');

            //Apaga na base de dados
            //Cancela no VendItem
            with IBProc_VendItem do
            begin
               if not Prepared then Prepare;
               ParamByName('POPER').asInteger := 2;
               ParamByName('PCONTROLE').asInteger := vControle;
               ParamByName('PSEQUENCIA').asInteger := UltProdSeq_Vend;
               ParamByName('PCOD_PRODUTO').asInteger := UltProdCod_Vend;
               ParamByName('PQUANTIDADE').asFloat := 0;
               ParamByName('PVL_UNITARIO').asFloat := 0;
               ParamByName('PPERC_DESC').asFloat := 0;
               ParamByName('PDESCR_SERVICO').Value := NULL;
               ParamByName('PPESO_LIQUIDO').Value := NULL;
               ParamByName('POBSERVACAO').Value := NULL;
               if not Prepared then Prepare;
               ExecProc;
            end;
         end;
      end
      else
      begin
         Daruma_Retorno := Daruma_FI_CancelaItemGenerico(FormatFloat('000',oItemRetorno));
         Daruma_Analisa_Retorno;
         //Inclui mensagem no memo de cancelamento
         if Daruma_Retorno = 1 then
         begin
            //Desconta do total
            vTotal_Geral := vTotal_Geral - Prod_Vlr_Prod[oItemRetorno-1]; //vl_TotProd;
            LabelTotal.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

            //Tira no memo
            MemoProdutos.Lines.Add(' CANCELADO ITEM : ' + AlinharStr(FormatFloat('000',oItemRetorno),5,'E')+ AlinharStr('R$ ' + FormatFloat('#,###,##0.00',Prod_Vlr_Prod[oItemRetorno-1]),16,'D'));
            MemoProdutos.Lines.Add('');

            //Apaga na base de dados
            //Cancela no VendItem
            with IBProc_VendItem do
            begin
               if not Prepared then Prepare;
               ParamByName('POPER').asInteger := 2;
               ParamByName('PCONTROLE').asInteger := vControle;
               ParamByName('PSEQUENCIA').asInteger := Prod_Seq_Prod[oItemRetorno-1];
               ParamByName('PCOD_PRODUTO').asInteger := Prod_Cod_Prod[oItemRetorno -1];
               ParamByName('PQUANTIDADE').asFloat := 0;
               ParamByName('PVL_UNITARIO').asFloat := 0;
               ParamByName('PPERC_DESC').asFloat := 0;
               ParamByName('PDESCR_SERVICO').Value := NULL;
               ParamByName('PPESO_LIQUIDO').Value := NULL;
               ParamByName('POBSERVACAO').Value := NULL;
              if not Prepared then Prepare;
               ExecProc;
            end;
         end;
      end;
      oItemRetorno := 0;
   end;               }
end;

Function TFrmVendasRap.Cancela_CupomFiscal : Boolean;
var v1,v2,v3,v4,v5,v6 : PChar;
    Flag_Retorno : Integer;
begin
   Operacao := opPadrao;
   Result := True;
   {if Parametros.IMPFIS_INDEX = -1 then
   begin
      Result := False;
      ImprFiscal_Nao_Definida;
   end;
   if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then       //Bematech I e II
   begin
      Flag_Retorno := 0;
      Bematech_Retorno := Bematech_FI_FlagsFiscais(Flag_Retorno);
      FrmPrincipal.TrataErro_Bematech;
      if Parametros.IMPFIS_INDEX = 0 then
         Flag_Retorno := Flag_Retorno - 64;  //nao sei porque , na velha ja comeca com 64
      if Bematech_Retorno = 1 Then
      begin
         if Flag_Retorno >= 128 Then Flag_Retorno := Flag_Retorno - 128;
         if Flag_Retorno >= 32  Then Flag_Retorno := Flag_Retorno - 32;
         if Flag_Retorno >= 8   Then Flag_Retorno := Flag_Retorno - 8;
         if Flag_Retorno >= 4   Then Flag_Retorno := Flag_Retorno - 4;
         if Flag_Retorno >= 2   Then Flag_Retorno := Flag_Retorno - 2;//
         if Flag_Retorno >= 1   Then //Cupom Fiscal Aberto
         begin
            //Inclui um produto, senao nao da pra cancelar o cupom
            if Parametros.IMPFIS_INDEX = 1 then
            begin
               v1 := 'Cancelamento';  v2 := 'II';  v3 := '1'; v4 := '%'; v5 := '100'; v6 := 'I';
               Bematech_FI_VendeItem(v3,v1,v2,v6,v3,2,v5,v4,v5);
               FrmPrincipal.TrataErro_Bematech;
            end;
            v1 := 'A';  v2 := '%';  v3 := '0000';
            Bematech_Retorno := Bematech_FI_IniciaFechamentoCupom(v1,v2,v3);
            FrmPrincipal.TrataErro_Bematech;
            if Bematech_Retorno <> 1 then
            begin
               MessageDlg('Problemas com o fechamento do cupom fiscal. Verifique!',mtInformation,[mbOk],0);
            end;
            //Termino do pagamento e do cupom (mensagem)
            Bematech_Retorno := Bematech_FI_TerminaFechamentoCupom('');
            FrmPrincipal.TrataErro_Bematech;
            if Bematech_Retorno <> 1 then
            begin
               MessageDlg('Problemas com o fechamento do cupom fiscal. Verifique!',mtInformation,[mbOk],0);
            end;
            Bematech_Retorno := Bematech_FI_CancelaCupom;
            FrmPrincipal.TrataErro_Bematech;
            if Bematech_Retorno <> 1 then
            begin
               MessageDlg('Problemas com o cancelamento do cupom fiscal. Verifique!',mtInformation,[mbOk],0);
            end;
         end;
      end;
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      if Operacao = opEmVenda then
         if not CancelaCupomAfrac then
         begin
            MessageDlg('Problemas com o cancelamento do cupom fiscal. Verifique!',mtInformation,[mbOk],0);
         end;
   end
   else if Parametros.IMPFIS_INDEX = 3 then  //Urano
   begin
      if Operacao in [opEmVenda,opEmFechamento] then
      begin
         Urano_Retorno := CancelaVenda('');
         TrataErro_Urano(Urano_Retorno);

         if Urano_Retorno = 33 then
         begin
            Urano_Retorno := AvancaLinhas('6');
            TrataErro_Urano(Urano_Retorno);
         end
         else
            MessageDlg('Problemas com o cancelamento do cupom fiscal. Verifique!',mtInformation,[mbOk],0);

      end;
   end
   else if Parametros.IMPFIS_INDEX = 4 then //Daruma
   begin
      Flag_Retorno := 0;
      Daruma_Retorno := Daruma_FI_FlagsFiscais(Flag_Retorno);
      Daruma_Analisa_Retorno;
      if Daruma_Retorno = 1 Then
      begin
         if Flag_Retorno >= 128 Then Flag_Retorno := Flag_Retorno - 128;
         if Flag_Retorno >= 32  Then Flag_Retorno := Flag_Retorno - 32;
         if Flag_Retorno >= 8   Then Flag_Retorno := Flag_Retorno - 8;
         if Flag_Retorno >= 4   Then Flag_Retorno := Flag_Retorno - 4;
         if Flag_Retorno >= 2   Then Flag_Retorno := Flag_Retorno - 2;//
         if Flag_Retorno >= 1   Then //Cupom Fiscal Aberto
         begin
            //Inclui um produto, senao nao da pra cancelar o cupom
            {if Parametros.IMPFIS_INDEX = 1 then
            begin
               v1 := 'Cancelamento';  v2 := 'II';  v3 := '1'; v4 := '%'; v5 := '001'; v6 := 'I';
               Bematech_FI_VendeItem(v3,v1,v2,v6,v3,2,v5,v4,v5);
               FrmPrincipal.TrataErro_Bematech;
            end;}
 {           v1 := 'A';  v2 := '%';  v3 := '0000';
            Daruma_Retorno := Daruma_FI_IniciaFechamentoCupom(v1,v2,v3);
            Daruma_Analisa_Retorno;
            if Daruma_Retorno <> 1 then
            begin
               MessageDlg('Problemas com o fechamento do cupom fiscal. Verifique!',mtInformation,[mbOk],0);
            end;
            //Termino do pagamento e do cupom (mensagem)
            Daruma_Retorno := Daruma_FI_TerminaFechamentoCupom('');
            Daruma_Analisa_Retorno;
            if Daruma_Retorno <> 1 then
            begin
               MessageDlg('Problemas com o fechamento do cupom fiscal. Verifique!',mtInformation,[mbOk],0);
            end;
            Daruma_Retorno := Daruma_FI_CancelaCupom;
            Daruma_Analisa_Retorno;
            if Daruma_Retorno <> 1 then
            begin
               MessageDlg('Problemas com o cancelamento do cupom fiscal. Verifique!',mtInformation,[mbOk],0);
            end;
         end;
      end;
   end;}
end;

Function TFrmVendasRap.Retorna_NroCaixa : String;
var Ret : String;
begin
   Result := '0000';
   {if Parametros.IMPFIS_INDEX = -1 then
   begin
      ImprFiscal_Nao_Definida;
   end;
   if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then       //Bematech I e II
   begin
      Ret := ' '; Ret := Ret + ' '; Ret := Ret + ' '; Ret := Ret + ' ';
      Bematech_Retorno := Bematech_FI_NumeroCaixa(Ret);
      FrmPrincipal.TrataErro_Bematech;
      if Bematech_Retorno = 1 then
         Result := Ret
      else
         Result := '0000';
   end
   else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
   begin
      if InfoECf(Ret, '015', 'Número do Caixa', False) then
         Result := Ret
      else
         Result := '0000';
   end
   else if Parametros.IMPFIS_INDEX = 3 then  //Urano
   begin
      Result := Busca_Registrador('26');
   end
   else if Parametros.IMPFIS_INDEX = 4 then   //Daruma
   begin
      Ret := ' '; Ret := Ret + ' '; Ret := Ret + ' '; Ret := Ret + ' ';
      Daruma_Retorno := Daruma_FI_NumeroCaixa(Ret);
      Daruma_Analisa_Retorno;
      if Daruma_Retorno = 1 then
         Result := Ret
      else
         Result := '0000';
   end;}
end;

procedure TFrmVendasRap.Edit_Vlr_PagoEnter(Sender: TObject);
begin
  if StrToFloatZero(Edit_Vlr_Pago.Text) = 0 then
   begin
      Edit_Vlr_Pago.Text := Tira_Ponto(LabelTot_Pagar.Caption);
      Edit_Vlr_Pago.Modified := True;
   end;
   Edit_Vlr_Pago.SelectAll;
   Edit_Vlr_PagoChange(Edit_Vlr_Pago);
end;

procedure TFrmVendasRap.Edit_Vlr_PagoClick(Sender: TObject);
begin
   Edit_Vlr_Pago.SelectAll;
end;

procedure TFrmVendasRap.Confirma_VendaExecute(Sender: TObject);
begin
    if Operacao <> opEmFechamento then Exit;
    BtnConfirmaClick(Self);
end;

procedure TFrmVendasRap.Cancela_VendaExecute(Sender: TObject);
begin
   if Operacao <> opEmFechamento then
   begin
      FrmImprDocs := TFrmImprDocs.Create(Self);
      FrmImprDocs.ShowModal;
      FrmImprDocs.Release;
      FrmImprDocs := nil;
   end
   else
      BtnCancelaClick(Self);
end;

procedure TFrmVendasRap.FormActivate(Sender: TObject);
begin
   Carrega_Parametros_Sistema_Venda;
end;

procedure TFrmVendasRap.Sobe_ProdutosExecute(Sender: TObject);
begin
   if Operacao <> opEmVenda then Exit;
   MemoProdutos.Perform(WM_VSCROLL,SB_PAGEUP,0);
end;

procedure TFrmVendasRap.Desce_ProdutosExecute(Sender: TObject);
begin
   if Operacao <> opEmVenda then Exit;
   MemoProdutos.Perform(WM_VSCROLL,SB_PAGEDOWN,0);
end;

procedure TFrmVendasRap.SBPrazoClick(Sender: TObject);
var I : Integer;
   Function Busca_Total : Double;
   var I : Integer;
       Valor : Double;
   begin
      Valor := 0;
      for I := 1 to StringGrid_Parcelas.RowCount-1 do
      begin
         if Trim(StringGrid_Parcelas.Cells[3,I]) <> '' then
            Valor := Valor + StrToFloat(TirarPonto(StringGrid_Parcelas.Cells[3,I]));
      end;
      Result := Valor;
   end;
begin
   StringGrid_Parcelas.TabStop := True;
   FrmGeraParcelas := TFrmGeraParcelas.Create(self);
   with FrmGeraParcelas do
   begin
      Valor_Total := StrToFloat(TirarPonto(LabelTot_Compra.Caption));
      Emissao := Date;
      Nota := vNota;
      if ShowModal = mrok then
      begin
         StringGrid_Parcelas.RowCount := StringGrid1.RowCount;
         Panel_Descr_Forma.Caption := 'P A G A M E N T O - ' + PanelForma.Caption ;
         vFormaPagto := StrToInt(Edit_Forma.Text);
         For I := 1 to StringGrid1.RowCount-1 do
         begin
            StringGrid_Parcelas.Cells[0,I] := StringGrid1.Cells[0,I];
            StringGrid_Parcelas.Cells[1,I] := StringGrid1.Cells[1,I];
            StringGrid_Parcelas.Cells[2,I] := StringGrid1.Cells[2,I];
            StringGrid_Parcelas.Cells[3,I] := StringGrid1.Cells[3,I];
            StringGrid_Parcelas.Cells[4,I] := StringGrid1.Cells[4,I];
            StringGrid_Parcelas.Cells[5,I] := StringGrid1.Cells[5,I];
            StringGrid_Parcelas.Cells[6,I] := StringGrid1.Cells[6,I];
         end;

         //Desabilita os componentes
         Edit_PerctDesc.Text := '0';
         Edit_PerctDescChange(Edit_PerctDesc);
         //Edit_PerctDesc.Enabled := False;
         //Edit_VlrDesc.Enabled := False;
         Edit_Vlr_Pago.Text := '0';
         Edit_Vlr_Pago.Enabled := False;

         vJuros := 0;
         vJuros := Busca_Total;
         vJuros := StrToFloat(FloatToStr(vJuros)) - StrToFloat(FloatToStr(vTotal_Geral));
         LabelTot_Compra.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral + vJuros);

         vTotal_Pagar := 0;
         For I := 1 to StringGrid1.RowCount-1 do
         begin
            if AnsiUpperCase(Trim(StringGrid_Parcelas.Cells[0,I])) = 'ENTRADA' then
               vTotal_Pagar := StrToFloat(Tira_Ponto(StringGrid_Parcelas.Cells[3,I]));
         end;
         Edit_Vlr_Pago.Text := FormatFloat('#,###,##0.00',vTotal_Pagar);
         CalculaDesconto;
      end;
   end;
   FrmGeraParcelas.Free;
   if Note_Fecha.ActivePage = 'Informa' then
   begin
      if Note_OBS.ActivePage = 'Comercio' then
         Edit_Mensagem.SetFocus
      else
         Edit_Kilometragem.SetFocus;
   end;
end;

procedure TFrmVendasRap.SBVistaClick(Sender: TObject);
var I, J : Integer;
begin
   StringGrid_Parcelas.TabStop := False;
   vTotal_Pagar := vTotal_Geral;
   Panel_Descr_Forma.Caption := 'P A G A M E N T O - A vista';

   LabelTot_Compra.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);
   LabelTot_Pagar.Caption := FormatFloat('#,###,###,##0.00',vTotal_Geral);

   {Limpa se já existem parcelas}
   with StringGrid_Parcelas do
   begin
      RowCount := 2;
      //Linhas
      For I := 1 to RowCount-1 do
         For J := 0 to ColCount-1 do
            Cells[J,I] := '';
   end;

   //Desabilita os componentes
   Edit_PerctDesc.Text := '0';
   Edit_PerctDescChange(Edit_PerctDesc);
   //Edit_PerctDesc.Enabled := True;
   //Edit_VlrDesc.Enabled := True;
   Edit_Vlr_Pago.Text := FormatFloat('#,###,##0.00',vTotal_Geral);
   Edit_Vlr_Pago.Enabled := True;
end;

procedure TFrmVendasRap.Pagamento_PrazoExecute(Sender: TObject);
begin
   if Operacao <> opEmFechamento then Exit;
   SBPrazo.Down := True;
   SBPrazoClick(self);
end;

procedure TFrmVendasRap.Aciona_GavetaExecute(Sender: TObject);
begin
   //Testa se nos parametros esta habilitado a utilizacao da gaveta
   if Parametros.GAVETA_DINHEIRO = 1 then
   begin
      //Testa as Impressoras Fiscais e envia comando de abertura de gaveta
      {if Parametros.IMPFIS_INDEX = -1 then
      begin
         ImprFiscal_Nao_Definida;
      end
      else if (Parametros.IMPFIS_INDEX = 0) or (Parametros.IMPFIS_INDEX = 1) then //Bematech I e II
      begin
         Bematech_Retorno := Bematech_FI_AcionaGaveta;
         FrmPrincipal.TrataErro_Bematech;
      end
      else if Parametros.IMPFIS_INDEX = 2 then  //AFRAC
      begin
         AbreGaveta;
      end
      else if Parametros.IMPFIS_INDEX = 3 then  //Urano
      begin
         Urano_Retorno := AbreGaveta;
         TrataErro_Urano(Urano_Retorno);
      end
      else if Parametros.IMPFIS_INDEX = 4 then //Daruma
      begin
         Daruma_Retorno := Daruma_FI_AcionaGaveta;
         Daruma_Analisa_Retorno;
      end;}
   end;
end;

Function  TFrmVendasRap.Analisa_Cliente(oCliente : Integer; oValor : Double) : Boolean;
var aMensagem, vSelect : String;
// JvQuery, JvQry_Mov_Aberto : TJvUIBDataSet;
begin
   Result := True;
   //Cria a Query
{   JvQuery := TJvUIBDataSet.Create(Nil);
   JvQuery.Database := FrmPrincipal.Base;
   JvQuery.Transaction := FrmPrincipal.Transaction;
   JvQuery.SQL.Clear;
   JvQuery.SQL.Add(' SELECT CLIENTES.CODIGO, CLIENTES.CONS_SPC, CLIENTES.OBS_SPC, SITUACOES.SIT_CLIENTE, SITUACOES.SIT_VENDAS, ');
   JvQuery.SQL.Add(' SITUACOES.MENSAGEM, SITUACOES.LIMITE_CRED, SITUACOES.IND_CTAS_ATRA, ');
   JvQuery.SQL.Add(' SITUACOES.IND_REG_SPC_MENS FROM CLIENTES ');
   JvQuery.SQL.Add(' LEFT JOIN SITUACOES ON (CLIENTES.SITUACAO = SITUACOES.CODIGO) ');
   JvQuery.SQL.Add(' WHERE CLIENTES.CODIGO = '+ IntToStr(oCliente));
   JvQuery.Open;                            }

   aMensagem := '';
   SBVista.Enabled := true;
   SBPrazo.Enabled := true;

   {mensagens
        -monitorado ou bloqueado
        -limite de credito
        -vendas a prazo ou a vista  nao autorizada
        -contas atrazadas
        -spc}
 {  if JvQuery.FieldByName('SIT_CLIENTE').asInteger = 1 then //Cliente Monitorado
   begin
      Result := True;
      aMensagem := aMensagem + 'C L I E N T E   M O N I T O R A D O' + #10#13;
      aMensagem := aMensagem + JvQuery.FieldByName('MENSAGEM').asString + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
   end else if JvQuery.FieldByName('SIT_CLIENTE').asInteger = 2 then //Cliente Bloqueado
   begin
      Result := False;
      aMensagem := aMensagem + 'C L I E N T E   B L O Q U E A D O' + #10#13;
      aMensagem := aMensagem + JvQuery.FieldByName('MENSAGEM').asString + #10#13;
      aMensagem := aMensagem + 'Venda não é possivel.' + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
      //Adicionar dados do SPC
      if JvQuery.FieldByName('IND_REG_SPC_MENS').asInteger = 1 then
      begin
         aMensagem := aMensagem + 'Registrado no SPC : ' + JvQuery.FieldByName('CONS_SPC').asString + #10#13;
         aMensagem := aMensagem + JvQuery.FieldByName('OBS_SPC').asString + #10#13;
         aMensagem := aMensagem + ' ' + #10#13;
      end;
   end;

   //Limite de Credito
   If (JvQuery.FieldByName('LIMITE_CRED').asFloat > 0) and (oValor > JvQuery.FieldByName('LIMITE_CRED').asFloat) then
   begin
      Result := False;
      aMensagem := aMensagem + 'L I M I T E   C R É D I T O' + #10#13;
      aMensagem := aMensagem + 'Limite de crédito ultrapassado(Limite R$ '+ FormatFloat('#,###,##0.00',JvQuery.FieldByName('LIMITE_CRED').asFloat) +').' + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
   end;
   //Vendas
   if (JvQuery.FieldByName('SIT_VENDAS').asInteger in [0,2]) then
   begin
      //Result := False;
      //SBVista.Down := false;
      //SBPrazo.Down := true;
      SBVista.Enabled := false;
      aMensagem := aMensagem + 'V E N D A   A   V I S T A' + #10#13;
      aMensagem := aMensagem + 'Vendas a Vista não permitidas para este cliente.' + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
   end
   else if (JvQuery.FieldByName('SIT_VENDAS').asInteger in [0,1]) then
   begin
      //SBPrazo.Down := false;
      //SBVista.Down := true;
      SBPrazo.Enabled := false;
      //Result := False;
      aMensagem := aMensagem + 'V E N D A   A   P R A Z O' + #10#13;
      aMensagem := aMensagem + 'Vendas a Prazo não permitidas para este cliente.' + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
      SBVista.Click;
      SBVista.Down := True;
   end;

   //Ctas em aberto
   if JvQuery.FieldByName('IND_CTAS_ATRA').asInteger = 1 then
   begin
      vSelect :=           ' SELECT  ';
      vSelect := vSelect + ' SUM((SELECT OSALDO_JUROS FROM CALCULA_JUROS(CTASRECEBER.CONTROLE,CTASRECEBER.DOCUMENTO,CURRENT_DATE))) SLD_TOTAL ';
      vSelect := vSelect + ' FROM CTASRECEBER WHERE VL_SALDO > 0 AND VENCTO < CURRENT_DATE ';
      vSelect := vSelect + ' AND COD_CLIENTE = ' + IntToStr(oCliente) + ' ';

      JvQry_Mov_Aberto := TJvUIBDataSet.Create(Nil);
      JvQry_Mov_Aberto.Database := FrmPrincipal.Base;
      JvQry_Mov_Aberto.Transaction := FrmPrincipal.Transaction;
      JvQry_Mov_Aberto.SQL.Clear;
      JvQry_Mov_Aberto.SQL.Add(vSelect);
      JvQry_Mov_Aberto.Open;

      if JvQry_Mov_Aberto.FieldByName('SLD_TOTAL').asFloat > 0 then
      begin
         aMensagem := aMensagem + 'C O N T A S   A T R A S A D A S' + #10#13;
         aMensagem := aMensagem + 'Este cliente possui contas atrasadas.' + #10#13;
         aMensagem := aMensagem + 'Saldo em Atraso :  R$ '+ FormatFloat('#,###,##0.00',JvQry_Mov_Aberto.FieldByName('SLD_TOTAL').asFloat) + #10#13;
         aMensagem := aMensagem + ' ' + #10#13;
      end;
   end; }
   if Trim(aMensagem) <> '' then
      MessageDlg(aMensagem,mtWarning,[mbOK],0);
end;

initialization
  {$I uvendas.lrs}

end.

