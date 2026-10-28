unit UPesqProd_Vendas;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, LResources,
  LCLType;

type

  { TFrmPesqProd }

  TFrmPesqProd = class(TForm)
    Bevel3: TBevel;
    Bevel4: TBevel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
     Datasource1: TDatasource;
     dbGrid1: TdbGrid;
     Edit1: TEdit;
     Edit2: TEdit;
     Edit_Perc_Desc1: TEdit;
     Edit_Quantidade: TEdit;
     Edit_Vl_Unitario: TEdit;
     Edit_Perc_Desc: TEdit;
//     JvQry: TJvUIBDataSet;
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
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Panel2: TPanel;
    PanelCodBarra1: TPanel;
    PanelCodigo1: TPanel;
    PanelNome: TPanel;
    PanelCodigo: TPanel;
    Label3: TLabel;
    PanelCodBarra: TPanel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PanelNome1: TPanel;
    PanelTotal: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PanelTotal1: TPanel;
    Panel_VLDesc: TPanel;
    Label12: TLabel;
    Bevel2: TBevel;
    Panel_VLDesc1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Edit_Perc_DescExit(Sender: TObject);
    procedure Edit_QuantidadeChange(Sender: TObject);
    procedure Edit_QuantidadeExit(Sender: TObject);
    procedure Edit_Vl_UnitarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Calcula_Total;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    Procedure Busca_Mascaras;
    procedure FrmPesqProdCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqProd: TFrmPesqProd;

implementation

uses Global, UPrincipal;


procedure TFrmPesqProd.Calcula_Total;
var vl_Total, vl_Desc : Double;
begin
   vl_Total := 0; vl_Desc := 0;
   vl_Total := (StrToFloatZero(Edit_Quantidade.Text) * StrToFloatZero(Edit_Vl_Unitario.Text));
   //if Trim(Edit_Perc_Desc.Text) <> '' then
      vl_Desc := (vl_Total*(StrToFloatZero(Edit_Perc_Desc.Text) / 100));
   Panel_VLDesc.Caption := FormatFloat('#,###,###,##0.00',vl_Desc);
   vl_Total := vl_Total - vl_Desc;
   PanelTotal.Caption := FormatFloat('#,###,###,##0.00',vl_Total);
end;

procedure TFrmPesqProd.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  { PanelCodigo.Caption := JvQry.FieldByName('CODIGO').asString;
   PanelCodBarra.Caption := JvQry.FieldByName('CODBARRA').asString;
   PanelNome.Caption := JvQry.FieldByName('NOME').asString;    }

   //Busca casas decimais do Valor
   {if (JvQry.FieldByName('CASAS_DECI_VALOR').asInteger > 0) then
      Edit_Vl_Unitario.FormatSize := '10.' + JvQry.FieldByName('CASAS_DECI_VALOR').asString
   else
      Edit_Vl_Unitario.FormatSize := '10.2';

   //Busca casas decimais da Quantidade
   if (JvQry.FieldByName('CASAS_DECI_QTDE').asInteger > 0) then
      Edit_Quantidade.FormatSize := '10.' + JvQry.FieldByName('CASAS_DECI_QTDE').asString
   else
      Edit_Quantidade.FormatSize := '10.2';
   }
   Edit_Quantidade.Text := Edit_Quantidade.Text;
//   Edit_Vl_Unitario.Text := JvQry.FieldByName('PRECO_VEND').AsString;
   Calcula_Total;
end;

procedure TFrmPesqProd.Edit_Perc_DescExit(Sender: TObject);
begin
  Calcula_Total;
end;

procedure TFrmPesqProd.Edit_QuantidadeChange(Sender: TObject);
begin
   If (Sender as TEdit).Modified then
   begin
      if Trim((Sender as TEdit).Text) <> '' then
         Calcula_Total;
   end;
end;

procedure TFrmPesqProd.Edit_QuantidadeExit(Sender: TObject);
begin
  Calcula_Total;
end;

procedure TFrmPesqProd.Edit_Vl_UnitarioExit(Sender: TObject);
begin
  Calcula_Total;
end;

procedure TFrmPesqProd.BitBtn1Click(Sender: TObject);
begin

end;

procedure TFrmPesqProd.FormShow(Sender: TObject);
var I : Integer;
//    JvQuery : TJvUIBDataSet;
begin
  //  JvQuery := TJvUIBDataSet.Create(Self);
   Try
{      JvQuery.Database := FrmPrincipal.base;
      JvQuery.Transaction := FrmPrincipal.Transaction;
      JvQuery.SQL.Add(' Select * from VW_Prod_ECF ');
      JvQuery.Open;
      FormatNumericFields(JvQuery);

      ComboBox1.Items.Clear;
      For I := 0 to JvQuery.FieldDefs.Count-1 do
      begin
         ComboBox1.Items.Add(JvQuery.FieldDefs[I].Name);
      end; }
   finally
{      JvQuery.Close;
      JvQuery.Free;
      JvQuery := Nil; }
   end;
   ComboBox1.ItemIndex := Procura_Item_ComboList(ComboBox1,'NOME');
   Edit1.SetFocus;
end;

procedure TFrmPesqProd.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      if PanelNome.Enabled = True then
         PanelNome.SetFocus
      else
         Edit_Quantidade.SetFocus;
   end;
end;

procedure TFrmPesqProd.DBGrid1DblClick(Sender: TObject);
begin
   BitBtn1.Click;
end;

procedure TFrmPesqProd.Edit1Exit(Sender: TObject);
var CRI, oSelect, aOrdem : String;
    I : Integer;
begin
{   if Trim(Edit1.Text) <> ''then
   begin
      case JvQry.FieldDefs[ComboBox1.ItemIndex].DataType of
         ftString : begin
                       //ListSep1.Entrada  := Edit1.Text;
                       //ListSep1.Execute;
                       //CRI := '';
                       //For I := 0 to ListSep1.Saida.Count -1 do
                       //begin
                          //CRI := CRI + ' AND Upper('+ ComboBox1.Items[ComboBox1.ItemIndex] +') like ''%'+ AnsiUpperCase(ListSep1.Saida[I]) + '%'' ';
                       //end;
                       CRI := CRI + ' AND Upper('+ ComboBox1.Text +') like ''%'+ AnsiUppercase(Edit1.Text) + '%'' ';
                    end;
         ftDate   : begin
                       if Not ValiData(Trim(Edit1.Text)) then
                       begin
                          MessageDlg('Data Inválida. Verifique!', mtWarning,[mbOK],0);
                          Edit1.SetFocus;
                          Exit;
                       end;
                       CRI := ' AND '+ComboBox1.Items[ComboBox1.ItemIndex]+' = ''' + FormatDateTime('mm/dd/yyyy',StrToDate(Trim(Edit1.Text))) +'''';
                    end;
         else   CRI := ' AND '+ComboBox1.Items[ComboBox1.ItemIndex]+' = ' + Trim(Edit1.Text);
      end;
   end;
   oSelect := 'Select * from VW_PROD_ECF ';
   aOrdem := ' order by Codigo ';

   if CRI <> '' then
   begin
      if Pos('WHERE',AnsiUpperCase(oSelect)) > 0 then
      begin
         oSelect := oSelect + CRI;
      end
      else
      begin
         oSelect := oSelect + ' WHERE ' + Copy(CRI, 6, Length(CRI));
      end;
   end;
   JvQry.Close;
   JvQry.SQL.Clear;
   JvQry.SQL.Add(oSelect + ' ' + aOrdem);
   JvQry.Open;
   
   if JvQry.RecordCount <> 0 then
   begin
      Edit1.SetFocus;
      Edit1.SelectAll;
   end
   else
   begin
      DBGrid1.SetFocus;
   end;   }
end;

Procedure TFrmPesqProd.Busca_Mascaras;
var I : Integer;
begin
   {For I := 0 to IBQuery1.Fields.Count-1 do
   begin
      case IBQuery1.FieldDefs[I].DataType of
      ftBCD : TBCDField(IBQuery1.Fields[I]).DisplayFormat := '#,###,##0.00';
      ftDate  : TDateField(IBQuery1.Fields[I]).DisplayFormat := 'dd/mm/yyyy';
      end;
   end;}
end;

procedure TFrmPesqProd.FrmPesqProdCreate(Sender: TObject);
begin
   // JvQry.Database := FrmPrincipal.base;
//   JvQry.Transaction := FrmPrincipal.Transaction;
end;

procedure TFrmPesqProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_Escape then
      BitBtn2.Click;
end;

initialization
   {$i upesqprod_vendas.lrs}

end.
