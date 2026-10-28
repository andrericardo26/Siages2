unit upacotes;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Grids, Buttons, StdCtrls;

type

  { TFrmPacotes }

  TFrmPacotes = class(TForm)
     Btn_Cancel1: TBitBtn;
     Btn_Ok1: TBitBtn;
     Label2: TLabel;
     Label3: TLabel;
     LabelQuantidade: TLabel;
     LabelValor: TLabel;
//     Query: TJvUIBDataSet;
     Label1: TLabel;
     PanelProdDescricao: TPanel;
     PanelProduto: TPanel;
     RG_Colecao: TRadioGroup;
     StringGrid1: TStringGrid;
     procedure Btn_Ok1Click(Sender: TObject);
     procedure FrmPacotesShow(Sender: TObject);
     procedure RG_ColecaoClick(Sender: TObject);
     procedure StringGrid1Click(Sender: TObject);
     procedure StringGrid1DblClick(Sender: TObject);
     procedure StringGrid1PrepareCanvas(sender: TObject; Col, Row: Integer; aState: TGridDrawState);
     procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
        const Value: string);
     procedure CalculaTotais;
  private
    { private declarations }
  public
    { public declarations }
    vPed_VlAnterior : Smallint;
  end; 

var
  FrmPacotes: TFrmPacotes;

implementation

Uses UPrincipal, Global;

{ TFrmPacotes }

procedure TFrmPacotes.StringGrid1Click(Sender: TObject);
begin

end;

procedure TFrmPacotes.StringGrid1DblClick(Sender: TObject);
begin
   StringGrid1.Cells[4,StringGrid1.Selection.Top] := '0';
   CalculaTotais;
end;

procedure TFrmPacotes.StringGrid1PrepareCanvas(sender: TObject; Col, Row: Integer; aState: TGridDrawState);
begin
   If (Row <> 0) and (Col = 4) and (StringGrid1.Cells[4,Row] = '0') then
   begin
      StringGrid1.Canvas.Brush.Color := clRed;
      StringGrid1.Canvas.Font.Color := clBlack;
   end;
end;

procedure TFrmPacotes.StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
   const Value: string);
begin
   CalculaTotais;
end;

procedure TFrmPacotes.FrmPacotesShow(Sender: TObject);
var vTot_Quantidade, vTot_Valor, vPreco : Double;
    Ind_Col_Total : Boolean;
begin
   StringGrid1.Cells[0,0] := 'Codigo';
   StringGrid1.Cells[1,0] := 'Nome';
   StringGrid1.Cells[2,0] := 'Valor';
   StringGrid1.Cells[3,0] := 'Reservado';
   StringGrid1.Cells[4,0] := 'Quantidade';
                {
   Query.Database := FrmPrincipal.base;
   Query.Transaction := FrmPrincipal.Transaction;
   Query.SQL.Clear;
   if vPed_VlAnterior = 0 then
      Query.SQL.Add(' Select Pacotes.*, Produtos.Nome, Produtos.Saldo_Reserv, UDF_NVL(Produtos.Preco_Vend) as Preco_Vend From Pacotes Inner Join Produtos on ')
   else
      Query.SQL.Add(' Select Pacotes.*, Produtos.Nome, Produtos.Saldo_Reserv, UDF_NVL(Produtos.Ultm_Compra_Preco) as Preco_Vend From Pacotes Inner Join Produtos on ');

   Query.SQL.Add(' (Pacotes.Produto = Produtos.Codigo) where Pacotes.Codigo = ' + Trim(PanelProduto.Caption));
   Query.Open;
   Query.First;}
   
   vTot_Quantidade := 0;
   vTot_Valor := 0;
   Ind_Col_Total := True;
{   vPreco := Query.FieldByName('Preco_Vend').asFloat;
   While not Query.EOF do
   begin
      //Testa se pode ser colecao total(regra = todos livros possuam o mesmo preco)
      if Ind_Col_Total = True then
      begin
         if vPreco <> Query.FieldByName('Preco_Vend').asFloat then
            Ind_Col_Total := False;
      end;
      vPreco := Query.FieldByName('Preco_Vend').asFloat;
      
      StringGrid1.Cells[0,StringGrid1.RowCount - 1] := Query.FieldByName('Produto').AsString;
      StringGrid1.Cells[1,StringGrid1.RowCount - 1] := Query.FieldByName('Nome').asString;
      StringGrid1.Cells[2,StringGrid1.RowCount - 1] := FormatFloat('##0.00',Query.FieldByName('Preco_Vend').asFloat);
      StringGrid1.Cells[3,StringGrid1.RowCount - 1] := Query.FieldByName('Saldo_Reserv').asString;
      StringGrid1.Cells[4,StringGrid1.RowCount - 1] := FormatFloat('#####',Query.FieldByName('Quantidade').asFloat);

      vTot_Quantidade := vTot_Quantidade + Query.FieldByName('Quantidade').asInteger;
      vTot_Valor  := vTot_Valor + (Query.FieldByName('Quantidade').asInteger * Query.FieldByName('Preco_Vend').AsFloat);
      
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
      Query.Next;
   end;
   StringGrid1.RowCount := StringGrid1.RowCount - 1;      }
   
   if Ind_Col_Total = False then
   begin
      RG_Colecao.ItemIndex := 1;
      RG_ColecaoClick(self);
      RG_Colecao.Enabled := False;
   end;
   
   LabelQuantidade.Caption := FormatFloat('#,###,##0.00',vTot_Quantidade);
   LabelValor.Caption := FormatFloat('#,###,##0.00',vTot_Valor);
end;

procedure TFrmPacotes.Btn_Ok1Click(Sender: TObject);
begin

end;

procedure TFrmPacotes.RG_ColecaoClick(Sender: TObject);
begin
   if RG_Colecao.ItemIndex = 0 then
      StringGrid1.Enabled := False
   else
      StringGrid1.Enabled := True;
end;

procedure TFrmPacotes.CalculaTotais;
var vTot_Valor, vTot_Qtd : Double;
    I : Integer;
begin
   vTot_Valor := 0;
   vTot_Qtd := 0;
   For I := 1 to StringGrid1.RowCount - 1 do
   begin
      vTot_Valor := vTot_Valor + (StrToFloat(TrocaVirgula_Ponto(StringGrid1.Cells[2,i])) * StrToIntZero(TrocaVirgula_Ponto(StringGrid1.Cells[4,i])));
      vTot_Qtd  := vTot_Qtd + StrToIntZero(TrocaVirgula_Ponto(StringGrid1.Cells[4,i]));
   end;
   LabelQuantidade.Caption := FormatFloat('#,###,##0.00',vTot_Qtd);
   LabelValor.Caption := FormatFloat('#,###,##0.00',vTot_Valor);
end;

initialization
  {$I upacotes.lrs}

end.

