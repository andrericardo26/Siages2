unit UGeraParc;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Grids, Db, LResources, DBGrids, MaskEdit,
  LCLType;

type
  TFormaPagto = Record
    Reaj_Perct   : Double;
    Reaj_Valor   : Double;
    Perct_Minimo : Double;
    Pre_Fixado   : SmallInt;
    Indice_Reaj  : Double;
  end;

  { TFrmGeraParcelas }

  TFrmGeraParcelas = class(TForm)
    BtnCancelar: TBitBtn;
    BtnCancelar1: TBitBtn;
    BtnExclui: TBitBtn;
    BtnExclui1: TBitBtn;
    BtnGrava: TBitBtn;
    BtnGrava1: TBitBtn;
    BtnInclui: TBitBtn;
    BtnInclui1: TBitBtn;
    Btn_Cancel1: TBitBtn;
    Btn_Ok: TBitBtn;
    Btn_Ok1: TBitBtn;
    Edit_Banco: TEdit;
    Edit_Banco1: TEdit;
    Edit_Cheque_Nro1: TEdit;
    Edit_Cheque_Nro: TEdit;
    Edit_Documento: TEdit;
    Edit_Documento1: TEdit;
    Edit_Emitente1: TEdit;
    Edit_Emitente: TEdit;
     Edit_Forma: TEdit;
     Edit_Valor: TEdit;
     Edit_Valor1: TEdit;
     F3_Banco1: TSpeedButton;
{     JvQuery: TJvUIBDataSet;
     JvQry_Prazos: TJvUIBDataSet;  }
     Label1: TLabel;
     Label2: TLabel;
     Label3: TLabel;
     Label4: TLabel;
     Label5: TLabel;
     Label6: TLabel;
     Label7: TLabel;
     Label8: TLabel;
     Label9: TLabel;
     LabelNominal: TLabel;
     LabelNominal1: TLabel;
     LabelValorParcelas: TLabel;
     LabelValorParcelas1: TLabel;
     LabelValorParcelas2: TLabel;
     Msk_Vencto: TMaskEdit;
     Msk_Vencto1: TMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    F3_Forma: TSpeedButton;
    PanelBanco: TPanel;
    PanelBanco1: TPanel;
    PanelForma: TPanel;
    BtnCalcula: TBitBtn;
    Shape1: TShape;
    Shape2: TShape;
    StringGrid1: TStringGrid;
    procedure BtnCalculaClick(Sender: TObject);
    procedure Edit_BancoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_FormaKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit_FormaExit(Sender: TObject);
    procedure Edit_BancoExit(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure Msk_VenctoEnter(Sender: TObject);
    procedure Msk_VenctoExit(Sender: TObject);
    Procedure Limpa_Edit;
    Function  Busca_Total_Parcelas : String;
    procedure F3_FormaClick(Sender: TObject);
    procedure F3_BancoClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_OkClick(Sender: TObject);
    procedure Btn_CancelClick(Sender: TObject);

  private
    { Private declarations }
    vOper : Integer;
    procedure SetOper(const Value: Integer);

  published
    property Operacao:Integer read vOper write SetOper;

  public
    { Public declarations }
    Compra_Venda : String;
    oTipo : Char;
    Valor_Total : Double;
    Emissao : TDateTime;
    Nota : String;
  end;

const
   opInsert = 0;
   opEdit   = 1;
   opDelete = 2;
   opBrowse = 3;

var
  FrmGeraParcelas: TFrmGeraParcelas;
  aFormaPagto : TFormaPagto;
  Compra_Venda :String;

implementation

uses UPrincipal, UConsulta, Global;



procedure TFrmGeraParcelas.SetOper(const Value: Integer);
var Sel : TGridRect;
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case voper of
       opInsert : begin
                     StringGrid1.Enabled := False;
                     Limpa_Edit;
                     StringGrid1.RowCount := StringGrid1.RowCount + 1;
                     Sel.Left := 1;
                     Sel.Right := 6;
                     Sel.Top := StringGrid1.RowCount-1;
                     Sel.Bottom := StringGrid1.RowCount-1;
                     StringGrid1.Selection := Sel;
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnGrava.Enabled := True;
                     BtnCancelar.Enabled := True;
                     //StringGrid1.Perform( M_VSCROLL,SB_BOTTOM,1);
                     //StringGrid1.Perform(WM_VSCROLL,SB_BOTTOM,0);
                     Edit_Documento.SetFocus;
                  end;
       opBrowse : begin
                     StringGrid1.Enabled := True;
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnGrava.Enabled := False;
                     BtnCancelar.Enabled := False;
                     Limpa_Edit;
                     LabelValorParcelas.Caption := Busca_Total_Parcelas;
                  end;
       opEdit   : begin
                     Limpa_Edit;
                     StringGrid1.Enabled := False;
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnGrava.Enabled := True;
                     BtnCancelar.Enabled := True;
                  end;
    end;
  end;
end;

procedure TFrmGeraParcelas.BtnCalculaClick(Sender: TObject);
var vCount : Integer;
    vNQuebrado, vNInteiro, vTotalNota, vVlr1Parc, vVlrJuros : Double;
    vDia, vMes, vAno : Word;
    vVenc : TDateTime;
    I, J : Integer;
begin          {
   if JvQry_Prazos.RecordCount = 0 then
   begin
      MessageDlg('Esta Forma de Pagamento não possui dias de prazo para geração. Verifique! (Cadastro de Formas de Pagamento)',mtWarning,[mbOK],0);
      Exit;
   end;       }
   StringGrid1.Enabled := True;
   BtnInclui.Enabled := True;
   BtnGrava.Enabled := False;
   BtnCancelar.Enabled := False;
   Limpa_Edit;
   vNQuebrado := 0;  {Total decimal das parcelas}
   vNInteiro  := 0;  {Total inteiro das parcelas}
   vTotalNota := 0;  {Total da Nota e Total da nota menos a porcentagem da 1ª parcela}
   vVlr1Parc  := 0;  {Total minimo da 1ª Parcela}
   vVlrJuros  := 0;  {Total da Comissao do juros}
   vDia       := 0;  {Dias do Intervalo}
   vMes       := 0;  {Meses do Intervalo}
   vAno       := 0;  {Anos do Intervalo}

   {Testa se Tem uma forma de pagamento}
   if (Edit_Forma.Text = '') and (StrToIntZero(Edit_Forma.Text) = 0) then
   begin
      MessageDlg('"FORMA DE PAGAMENTO" deve ser preenchida para o Cálculo', mtWarning, [mbOK], 0);
      Edit_Forma.SetFocus;
      Exit;
   end;

   {Limpa se já existem parcelas}
   with StringGrid1 do
   begin
      RowCount := 2;
      //Linhas
      For I := 1 to RowCount-1 do
         For J := 1 to 6 do
            Cells[J,I] := '';
   end;

   {Gera Novas Parcelas}
   {
   With JvQry_Prazos do
   begin
      First;
      {Se a 1º parcela tiver um percentual minimo}
      {
      if (aFormaPagto.Perct_Minimo = 0) or (aFormaPagto.Indice_Reaj > 0) then
      begin
         vCount := 0;
         //Se tiver Indice, esquece o resto
         if aFormaPagto.Indice_Reaj > 0 then
         begin
            vTotalNota := ((Valor_Total * aFormaPagto.Indice_Reaj) * JvQry_Prazos.RecordCount) + (JvQry_Prazos.RecordCount * aFormaPagto.Reaj_Valor);
            LabelNominal.Caption := FormatFloat('#,###,##0.00',vTotalNota);
            vNInteiro := (Valor_Total * aFormaPagto.Indice_Reaj) + aFormaPagto.Reaj_Valor;
            vNQuebrado := 0;
         end
         else
         begin
            vVlrJuros := 1 + (JvQry_Prazos.RecordCount * (aFormaPagto.Reaj_Perct/100));
            vTotalNota := (Valor_Total * vVlrJuros) + (JvQry_Prazos.RecordCount * aFormaPagto.Reaj_Valor);
            LabelNominal.Caption := FormatFloat('#,###,##0.00',vTotalNota);
            vNInteiro := Int(vTotalNota / JvQry_Prazos.RecordCount);
            vNQuebrado := Frac(vTotalNota / JvQry_Prazos.RecordCount) * JvQry_Prazos.RecordCount;
         end;
         while not EOF do
         begin
            {Calcula o vencimento}
            {
            DecodeDate(Emissao,vAno,vMes,vDia);

            //Se for dia Pre-Fixado
            vDia := vDia + JvQry_Prazos.FieldByName('DIAS').AsInteger;
            while vDia > 30 do
            begin
               vDia := vDia - 30;
               vMes := vMes + 1;
            end;
            if aFormaPagto.Pre_Fixado <> 0 then
            begin
               if vDia <= aFormaPagto.Pre_Fixado then
                  vMes := vMes - 1;
               vDia := aFormaPagto.Pre_Fixado;
            end;

            while vMes > 12 do
            begin
               vMes := vMes - 12;
               vAno := vAno + 1;
            end;
            if (vMes = 2) and (vDia > 28) then
            begin
               vMes := 3;
               vDia := 1;
            end;
            vVenc := EncodeDate(vAno,vMes,vDia);
            if FieldByName('Dias').asInteger = 0 then
            begin
               StringGrid1.Cells[0,StringGrid1.RowCount-1] := '  Entrada';
               StringGrid1.Cells[1,StringGrid1.RowCount-1] := Nota + '/' + FormatFloat('00',(vCount + 1));
            end
            else
            begin
               StringGrid1.Cells[0,StringGrid1.RowCount-1] := ' + ' + FloatToStr(vVenc - Date) +' dia(s)';
               StringGrid1.Cells[1,StringGrid1.RowCount-1] := Nota + '/' + FormatFloat('00',(vCount + 1));
            end;
            StringGrid1.Cells[2,StringGrid1.RowCount-1] := FormatDateTime('dd/mm/yyyy',vVenc);
            if VCount = 0 then
               StringGrid1.Cells[3,StringGrid1.RowCount-1] := AlinharStr(FormatFloat('#,###,##0.00',vNInteiro+vNQuebrado),10,'D')
            else
               StringGrid1.Cells[3,StringGrid1.RowCount-1] := AlinharStr(FormatFloat('#,###,##0.00',vNInteiro),10,'D');
            StringGrid1.Cells[4,StringGrid1.RowCount-1] := '0';
            Inc(vCount);
            StringGrid1.RowCount := StringGrid1.RowCount + 1;
            next;
         end;
      end
      else
      begin
         vCount := 0;
         vVlrJuros := 1 + (JvQry_Prazos.RecordCount * (aFormaPagto.Reaj_Perct / 100));
         LabelNominal.Caption := FormatFloat('#,###,##0.00',((Valor_Total * vVlrJuros) + (JvQry_Prazos.RecordCount * aFormaPagto.Reaj_Valor)));
         vVlr1Parc := ((Valor_Total * vVlrJuros) + (JvQry_Prazos.RecordCount * aFormaPagto.Reaj_Valor)) * (aFormaPagto.Perct_Minimo / 100);
         {Desconta o valor minimo do 1 parcela}
         {
         vTotalNota := (Valor_Total * vVlrJuros + (JvQry_Prazos.RecordCount * aFormaPagto.Reaj_Valor)) - vVlr1Parc;
         vNInteiro := Int(vTotalNota / JvQry_Prazos.RecordCount);
         vNQuebrado := Frac(vTotalNota / JvQry_Prazos.RecordCount) * JvQry_Prazos.RecordCount;
         while not EOF do
         begin
            {Calcula o vencimento}
            {
            DecodeDate(Emissao,vAno,vMes,vDia);

            //Se for dia Pre-Fixado
            vDia := vDia + JvQry_Prazos.FieldByName('DIAS').AsInteger;
            while vDia > 30 do
            begin
               vDia := vDia - 30;
               vMes := vMes + 1;
            end;
            //Se for dia Pre-Fixado
            if aFormaPagto.Pre_Fixado <> 0 then
            begin
               vDia := aFormaPagto.Pre_Fixado;
            end;

            while vMes > 12 do
            begin
               vMes := vMes - 12;
               vAno := vAno + 1;
            end;
            if (vMes = 2) and (vDia > 28) then
            begin
               vMes := 3;
               vDia := 1;
            end;
            vVenc := EncodeDate(vAno,vMes,vDia);
            {fim do calculo}
             {
            if FieldByName('Dias').asInteger = 0 then
               StringGrid1.Cells[0,StringGrid1.RowCount-1] := '  Entrada'
            else
               StringGrid1.Cells[0,StringGrid1.RowCount-1] := ' + ' + FieldByName('Dias').asString+' dias';
            StringGrid1.Cells[1,StringGrid1.RowCount-1] := Nota + '/' + FormatFloat('00',(vCount + 1));
            StringGrid1.Cells[2,StringGrid1.RowCount-1] := FormatDateTime('dd/mm/yyyy',vVenc);
            if VCount = 0 then
               StringGrid1.Cells[3,StringGrid1.RowCount-1] := AlinharStr(FormatFloat('#,###,##0.00',vNInteiro+vNQuebrado+vVlr1parc),10,'D')
            else
               StringGrid1.Cells[3,StringGrid1.RowCount-1] := AlinharStr(FormatFloat('#,###,##0.00',vNInteiro),10,'D');
            StringGrid1.Cells[4,StringGrid1.RowCount-1] := '0';
            Inc(vCount);
            StringGrid1.RowCount := StringGrid1.RowCount + 1;
            next;
         end;
      end;
      StringGrid1.RowCount := StringGrid1.RowCount - 1;
   end;  }


   LabelValorParcelas.Caption := Busca_Total_Parcelas;
   Btn_Ok.setFocus;
end;

procedure TFrmGeraParcelas.Edit_BancoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_BancoClick(Self);
end;

procedure TFrmGeraParcelas.Edit_FormaKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_FormaClick(Self);
end;

procedure TFrmGeraParcelas.FormShow(Sender: TObject);
var aFonte : TFont;
    //oFundo : TBrush;
begin
   Operacao := opBrowse;
                                                      {
   JvQry_Prazos.Database := FrmPrincipal.Base;
   JvQry_Prazos.Transaction := FrmPrincipal.Transaction;
   JvQuery.Database := FrmPrincipal.Base;
   JvQuery.Transaction := FrmPrincipal.Transaction;  }
   
   LabelNominal.Caption := FormatFloat('#,###,##0.00',Valor_Total);
   if Compra_Venda = 'COMPRA' then
   begin
      Compra_Venda := 'Forma de Pagamento';
      oTipo := '1';
   end
   else
   begin
      Compra_Venda := 'Forma de Recebimento';
      oTipo := '0';
   end;
      
   {StringGrid1.ResetAlignCol(0);
   StringGrid1.ResetAlignCol(1);
   StringGrid1.ResetAlignCol(2);
   StringGrid1.ResetAlignCol(3);
   StringGrid1.ResetAlignCol(4);
   StringGrid1.ResetAlignCol(5);
   StringGrid1.ResetAlignCol(6);
   StringGrid1.AlignCol[0] := alCenter;
   StringGrid1.AlignCol[1] := alLeft;
   StringGrid1.AlignCol[2] := alCenter;
   StringGrid1.AlignCol[3] := alRight;
   StringGrid1.AlignCol[4] := alRight;
   StringGrid1.AlignCol[5] := alLeft;
   StringGrid1.AlignCol[6] := alLeft;
   //Fixed
   StringGrid1.ResetAlignFixedCol(0);
   StringGrid1.ResetAlignFixedCol(1);
   StringGrid1.ResetAlignFixedCol(2);
   StringGrid1.ResetAlignFixedCol(3);
   StringGrid1.FixAlignCol[0] := alCenter;
   StringGrid1.FixAlignCol[1] := alLeft;
   StringGrid1.FixAlignCol[2] := alCenter;
   StringGrid1.FixAlignCol[3] := alRight;}


   aFonte := TFont.Create;
   try
      aFonte.Name := 'MS Sans Serif';
      aFonte.Color := clWhite;
      aFonte.Style := [fsBold];
      {StringGrid1.FixedRowFont[0] := aFonte;
      StringGrid1.FixedColFont[0] := aFonte;}
   finally
      aFonte.Free;
   end;

   StringGrid1.Cells[0,0] := 'Prazos';
   StringGrid1.Cells[1,0] := 'Documento';
   StringGrid1.Cells[2,0] := 'Vencimento';
   StringGrid1.Cells[3,0] := 'Valor';
   StringGrid1.Cells[4,0] := 'Banco';
   StringGrid1.Cells[5,0] := 'Nro Cheque';
   StringGrid1.Cells[6,0] := 'Emitente';
end;

procedure TFrmGeraParcelas.Edit_FormaExit(Sender: TObject);
var vSelect : string;
//     JvQuery : TJvUIBDataset;
begin
//    JvQry_Prazos.Close;
   if (Edit_Forma.Text <> '') and (StrToIntZero(Edit_Forma.Text) > 0) then
   begin   {
      vSelect := '';
      vSelect := 'SELECT FORMASPAGTO.CODIGO, FORMASPAGTO.NOME, FORMASPAGTO.PERCT_JURO, ';
      vSelect := vSelect + 'FORMASPAGTO.VLR_JURO, FORMASPAGTO.PERCT_1PARC, FORMASPAGTO.PRE_FIXADO, FORMASPAGTO.INDICE_REAJUSTE, CATEGORIAS.TIPO ';
      vSelect := vSelect + 'FROM FORMASPAGTO ';
      vSelect := vSelect + 'INNER JOIN CATEGORIAS ON (FORMASPAGTO.CATEGORIA = CATEGORIAS.NOME) ';
      vSelect := vSelect + 'WHERE FORMASPAGTO.CODIGO = '+ Trim(Edit_Forma.Text) + ' AND CATEGORIAS.TIPO = ' + oTipo;
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta(vSelect, JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin                                                                     //Entrada
            if ((Compra_Venda = 'COMPRA') and (JvQuery.FieldByName('TIPO').asInteger = 0)) or
               ((Compra_Venda = 'VENDA')  and (JvQuery.FieldByName('TIPO').asInteger = 1)) then
            begin
               MessageDlg(Compra_Venda + ' inválida nesta operação.', mtInformation,[mbOK],0);
               Edit_Forma.SetFocus;
               Exit;
            end;

            PanelForma.Caption := JvQuery.FieldByName('NOME').asString;
            aFormaPagto.Reaj_Perct := JvQuery.FieldByName('PERCT_JURO').asFloat;
            aFormaPagto.Reaj_Valor := JvQuery.FieldByName('VLR_JURO').asFloat;
            aFormaPagto.Perct_Minimo := JvQuery.FieldByName('PERCT_1PARC').asFloat;
            aFormaPagto.Pre_Fixado := JvQuery.FieldByName('PRE_FIXADO').asInteger;
            aFormaPagto.Indice_Reaj := JvQuery.FieldByName('INDICE_REAJUSTE').asFloat;
            JvQry_Prazos.Params.ByNameAsInteger['aforma'] := JvQuery.FieldByName('CODIGO').asInteger;
            JvQry_Prazos.Open;
            JvQry_Prazos.Last;
            JvQry_Prazos.First;
         end
         else
         begin
            MessageDlg(Compra_Venda + ' não cadastrada.',mtInformation,[mbOK],0);
            PanelForma.Caption := '';
            aFormaPagto.Reaj_Perct := 0;
            aFormaPagto.Reaj_Valor := 0;
            aFormaPagto.Perct_Minimo := 0;
            aFormaPagto.Pre_Fixado := 0;
            aFormaPagto.Indice_Reaj := 0;
            Edit_Forma.SetFocus;
         end;
      except
         JvQuery.Close;
         JvQuery.Free;
      end;   }
   end
   else
   begin
      Edit_Forma.Text := '0';
      PanelForma.Caption := '';
      aFormaPagto.Reaj_Perct := 0;
      aFormaPagto.Reaj_Valor := 0;
      aFormaPagto.Perct_Minimo := 0;
      aFormaPagto.Pre_Fixado := 0;
   end;
end;

procedure TFrmGeraParcelas.Edit_BancoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Banco.Text)) <> 0) and (Trim(Edit_Banco.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select Codigo, CodBanco || '' - '' || NomeBanco Nome from Bancos where Codigo='+ Edit_Banco.Text + ' ',JvQuery) then Exit;
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

procedure TFrmGeraParcelas.StringGrid1DblClick(Sender: TObject);
begin
   Operacao := opEdit;
   Edit_Documento.Text := StringGrid1.Cells[1,StringGrid1.Selection.Top];
   Msk_VenctoEnter(Msk_Vencto);
   Msk_Vencto.Text := StringGrid1.Cells[2,StringGrid1.Selection.Top];
   Msk_VenctoExit(Msk_Vencto);
   if Trim(StringGrid1.Cells[3,StringGrid1.Selection.Top]) <> '' then
      Edit_Valor.Text := TirarPonto(StringGrid1.Cells[3,StringGrid1.Selection.Top]);
   if Trim(StringGrid1.Cells[4,StringGrid1.Selection.Top]) <> '' then
   begin
      Edit_Banco.Text := StringGrid1.Cells[4,StringGrid1.Selection.Top];
      Edit_BancoExit(Self);
   end;
   Edit_Cheque_Nro.Text := StringGrid1.Cells[5,StringGrid1.Selection.Top];
   Edit_Emitente.Text := StringGrid1.Cells[6,StringGrid1.Selection.Top];
   Edit_Documento.SetFocus;
end;

procedure TFrmGeraParcelas.Msk_VenctoEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99/99/9999;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmGeraParcelas.Msk_VenctoExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '/  /' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

Procedure TFrmGeraParcelas.Limpa_Edit;
begin
   Edit_Documento.Text := '';
   Msk_VenctoEnter(Msk_Vencto);
   Msk_Vencto.Text := '';
   Msk_VenctoExit(Msk_Vencto);
   Edit_Valor.Text := '0';
   Edit_Banco.Text := '0';
   Edit_BancoExit(Self);
   Edit_Cheque_Nro.Text := '';
   Edit_Emitente.Text := '';
end;

Function TFrmGeraParcelas.Busca_Total_Parcelas : String;
var I : Integer;
    Valor : Double;
begin
   Valor := 0;
   for I := 1 to StringGrid1.RowCount-1 do
   begin
      if Trim(StringGrid1.Cells[3,I]) <> '' then
         Valor := Valor + StrToFloat(TirarPonto(StringGrid1.Cells[3,I]));
   end;
   Result := FormatFloat('#,###,##0.00',Valor);
end;

procedure TFrmGeraParcelas.F3_FormaClick(Sender: TObject);
var vSelect : String;
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      vSelect := '';
      vSelect := vSelect + ' Select  FormasPagto.CODIGO, FormasPagto.NOME,  FormasPagto.CATEGORIA, ';
      vSelect := vSelect + ' FormasPagto.SUBCATEGO, Categorias.TIPO, FormasPagto.PERCT_JURO,  FormasPagto.VLR_JURO, ';
      vSelect := vSelect + ' FormasPagto.PERCT_1PARC, FormasPagto.PRE_FIXADO, FormasPagto.INDICE_REAJUSTE ';
      vSelect := vSelect + ' from FormasPagto ';
      vSelect := vSelect + ' INNER JOIN Categorias ON (FormasPagto.CATEGORIA = Categorias.NOME) ';
      vSelect := vSelect + ' WHERE CATEGORIAS.TIPO = ' + oTipo;
      FrmPesquisa.Select := vSelect;
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Formas de Pagamento';
      if FrmPesquisa.ShowModal = mrOK then
      begin
     //    Edit_Forma.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_FormaExit(Self);
         Edit_Forma.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmGeraParcelas.F3_BancoClick(Sender: TObject);
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

procedure TFrmGeraParcelas.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   StringGrid1.Cells[4,StringGrid1.RowCount -1] := '0';
   //StringGrid1.Selection.Top := StringGrid1.RowCount -1;
end;

procedure TFrmGeraParcelas.BtnExcluiClick(Sender: TObject);
var I : Integer;
begin
   if StringGrid1.RowCount = 2 then
   begin
      for I := 0 to 6 do
         StringGrid1.Cells[I,1] := '';
   end
   else
   begin
      //StringGrid1.ExchangeRow(StringGrid1.Selection.Top,StringGrid1.RowCount-1);
      for I := 0 to 6 do
         StringGrid1.Cells[I,StringGrid1.RowCount -1] := '';
      StringGrid1.RowCount := StringGrid1.RowCount -1;
   end;
   LabelValorParcelas.Caption := Busca_Total_Parcelas;
end;

procedure TFrmGeraParcelas.BtnGravaClick(Sender: TObject);
begin
   if Edit_Documento.Text = '' then
   begin
      MessageDlg('Documento deve ser preenchido.',mtInformation,[mbOK],0);
      Edit_Documento.SetFocus;
      Exit;
   end;
   if Msk_Vencto.Text = '' then
   begin
      MessageDlg('Vencimento deve ser preenchido.',mtInformation,[mbOK],0);
      Msk_VenctoEnter(Msk_Vencto);
      Msk_Vencto.SetFocus;
      Exit;
   end;
   if StrToFloatZero(Edit_Valor.Text) = 0 then
   begin
      MessageDlg('Valor deve ser preenchido.',mtInformation,[mbOK],0);
      Edit_Valor.SetFocus;
      Exit;
   end;

   if Operacao = opInsert then
      StringGrid1.Cells[0,StringGrid1.RowCount -1] := ' + ' + FloatToStr(StrToDate(Msk_Vencto.Text) - Emissao) +' dias';
   StringGrid1.Cells[1,StringGrid1.RowCount -1] := Edit_Documento.Text;
   StringGrid1.Cells[2,StringGrid1.RowCount -1] := Msk_Vencto.Text;
   StringGrid1.Cells[3,StringGrid1.RowCount -1] := FormatFloat('#,###,##0.00',StrToFloatZero(Edit_Valor.Text));
   StringGrid1.Cells[4,StringGrid1.RowCount -1] := Trim(Edit_Banco.Text);
   StringGrid1.Cells[5,StringGrid1.RowCount -1] := Edit_Cheque_Nro.Text;
   StringGrid1.Cells[6,StringGrid1.RowCount -1] := Edit_Emitente.Text;
   Operacao := opBrowse;
end;

procedure TFrmGeraParcelas.BtnCancelarClick(Sender: TObject);
begin
   if Operacao = opInsert then
   begin
      StringGrid1.RowCount := StringGrid1.RowCount - 1;
   end;
   Operacao := opBrowse;
end;

procedure TFrmGeraParcelas.StringGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = 13 then
   begin
      StringGrid1DblClick(self);
   end;
end;

procedure TFrmGeraParcelas.Btn_OkClick(Sender: TObject);
begin
   if Edit_Forma.Text = '0' then
      MessageDlg('Campos em negrito são obrigatórios',mtInformation,[mbOK],0);
   if Operacao <> opBrowse then
   begin
      MessageDlg('Você deve gravar ou cancelar as alterações antes. OK!',mtInformation,[mbOK],0);
      Exit;
   end;
   ModalResult := mrOk;
end;

procedure TFrmGeraParcelas.Btn_CancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

initialization
   {$i ugeraparc.lrs}

end.
