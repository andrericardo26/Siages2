unit UFormPagto;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, MaskEdit, Buttons,
  ComCtrls, ImgList, Db, DBCtrls, LResources;

type
  TFrmFormPagto = class(TForm)
     Combo_Categoria: TComboBox;
     Combo_SubCategoria: TComboBox;
     Datasource1: TDatasource;
     Grid_Pesquisa: TdbGrid;
     Edit_Dias: TEdit;
     Campo1: TEdit;
     Edit_PreFixado: TEdit;
     Edit_Vlr_Juro: TEdit;
     Edit_Perct_Juro: TEdit;
     Edit_Perct_1Parc: TEdit;
     Edit_Indice_Reajuste: TEdit;
     Edit_PCodigo: TEdit;
     //JvQry_CatSubCat: TJvUIBDataSet;
//     JvQry_Pes: TJvUIBDataSet;
    Paginas: TPageControl;
  //  Proc: TJvUIBQuery;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    TabPesquisa: TTabSheet;
    Panel1: TPanel;
    Label60: TLabel;
    Label61: TLabel;
    Panel4: TPanel;
    BtnImprime: TBitBtn;
    BtnLimpa: TBitBtn;
    BtnAjudaPes: TBitBtn;
    BtnAtualiza: TBitBtn;
    Edit_PDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Nome: TEdit;
    NaoLimpar: TCheckBox;
    BtnSairPes: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    Label10: TLabel;
    ListPrazos: TListBox;
    SBGrava: TSpeedButton;
    SBCancela: TSpeedButton;
    Bevel1: TBevel;
    Label6: TLabel;
    Bevel2: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure Combo_CategoriaChange(Sender: TObject);
    procedure Combo_SubCategoriaDropDown(Sender: TObject);
    procedure Edit_PCodigoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Edit_PCodigoExit(Sender: TObject);
    procedure ListPrazosClick(Sender: TObject);
    Procedure Carrega_Categorias;
    Procedure Carrega_SubCategorias(aCategoria: String; oCombo: TComboBox);
    procedure SBGravaClick(Sender: TObject);
    procedure Carrega_Prazos;
    procedure SBCancelaClick(Sender: TObject);
    procedure Edit_DiasEnter(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);

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
  FrmFormPagto: TFrmFormPagto;

implementation

uses UPrincipal, Global, UVariaveis;


procedure TFrmFormPagto.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case voper of
       opInsert : begin
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnSair.Enabled := False;
                     Campo1.Enabled := True;
                     NaoLimpar.Enabled := True;
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     Campo1.Enabled := False;
                     NaoLimpar.Enabled := False;
                  end;
    end;
  end;
end;


procedure TFrmFormPagto.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmFormPagto.Combo_CategoriaChange(Sender: TObject);
begin
   Combo_SubCategoria.Text := '';
end;

procedure TFrmFormPagto.Combo_SubCategoriaDropDown(Sender: TObject);
begin
   if Combo_Categoria.Text <> '' then
      Carrega_SubCategorias(Combo_Categoria.Text,Combo_SubCategoria);
end;

procedure TFrmFormPagto.Edit_PCodigoClick(Sender: TObject);
begin

end;

procedure TFrmFormPagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmFormPagto.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmFormPagto.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
//   if Parametros.Busca_Chave = 1 then Campo1.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_FORMASPAGTO'));
   Campo1.SetFocus;
end;

procedure TFrmFormPagto.BtnGravaClick(Sender: TObject);
begin
   //Codigo
   if Length(Trim(Campo1.Text)) > 0 then
   begin
      if not ValNumero(Campo1.Text) then
      begin
         MessageDlg('Código deve ser número inteiro válido.', mtInformation,[mbOK],0);
         Campo1.SetFocus;
         Exit;
      end;
   end;
   //Nome
   if Length(Trim(Edit_Nome.Text)) = 0 then
   begin
      MessageDlg('Nome deve ser preenchido.', mtInformation,[mbOK],0);
      Edit_Nome.SetFocus;
      Exit;
   end;
   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   Carrega_Parametros;
//   FrmPrincipal.RodaSP(Proc);
   Operacao := opBrowse;
   if NaoLimpar.Checked then
   begin
      Operacao := opInsert;
      Campo1.Text := '0';
      Campo1.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmFormPagto.Carrega_Parametros;
begin    {
   with Proc do
   begin
      Params.ByNameAsInteger['POPER'] := Operacao;
      Params.ByNameAsInteger['PCODIGO'] := StrToInt(Campo1.Text);
      Params.ByNameAsString['PNOME'] := Edit_Nome.Text;
      Params.ByNameAsString['PCATEGORIA'] := Combo_Categoria.Items[Combo_Categoria.ItemIndex];
      Params.ByNameAsString['PSUBCATEGO'] := Combo_SubCategoria.Items[Combo_SubCategoria.ItemIndex];
      Params.ByNameAsCurrency['PPERCT_JURO'] := StrToFloatZero(Edit_Perct_Juro.Text);
      Params.ByNameAsCurrency['PVLR_JURO'] := StrToFloatZero(Edit_Vlr_Juro.Text);
      Params.ByNameAsCurrency['PPERCT_1PARC'] := StrToFloatZero(Edit_Perct_1Parc.Text);
      Params.ByNameAsInteger['PPRE_FIXADO'] := StrToIntZero(Edit_PreFixado.Text);
      Params.ByNameAsCurrency['PINDICE_REAJUSTE'] := StrToFloatZero(Edit_Indice_Reajuste.Text);
   end; }
end;

procedure TFrmFormPagto.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataset do
   begin
      Campo1.Text := FieldByName('CODIGO').asString;
      Edit_Nome.Text := FieldByName('NOME').asString;
      Edit_Perct_Juro.Text := FieldByName('PERCT_JURO').AsString;
      Edit_Vlr_Juro.Text := FieldByName('VLR_JURO').AsString;
      Edit_Perct_1Parc.Text := FieldByName('PERCT_1PARC').AsString;
      Edit_Indice_Reajuste.Text := FieldByName('INDICE_REAJUSTE').AsString;
      Combo_Categoria.Text := FieldByName('CATEGORIA').AsString;
      Carrega_SubCategorias(Combo_Categoria.Text,Combo_SubCategoria);
      Combo_SubCategoria.Text := FieldByName('SUBCATEGO').AsString;
      Edit_PreFixado.Text := FieldByName('PRE_FIXADO').AsString;
      Carrega_Prazos;
   end;
end;

procedure TFrmFormPagto.Grid_PesquisaDblClick(Sender: TObject);
begin       {
   if JVQry_Pes.RecordCount > 0 then
   begin
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
   end;    }
end;

procedure TFrmFormPagto.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmFormPagto.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   BtnInclui.SetFocus;
end;

procedure TFrmFormPagto.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from FormasPagTo where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
            JvQuery.Close;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Campo1.Text:= '0';
   end;
end;

procedure TFrmFormPagto.FormShow(Sender: TObject);
var vSelect : String;
begin
   Operacao := opBrowse;
   
{   Proc.DataBase := FrmPrincipal.base;
   Proc.Transaction := FrmPrincipal.Transaction;
   Proc.BuildStoredProc('PROC_FORMASPAGTO');
   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;

   JvQry_CatSubCat.Database := FrmPrincipal.base;
   JvQry_CatSubCat.Transaction := FrmPrincipal.Transaction;
   vSelect := '';
   vSelect := vSelect + ' Select Categorias.Nome Cat, ';
   vSelect := vSelect + ' Categorias.Tipo, ';
   vSelect := vSelect + ' SubCategorias.Nome Subcat ';
   vSelect := vSelect + ' from Subcategorias ';
   vSelect := vSelect + ' right join Categorias on Subcategorias.categoria = Categorias.Nome ';
   vSelect := vSelect + ' order by Categorias.Nome, SubCategorias.Nome';
   FrmPrincipal.RodaConsulta(vSelect,JvQry_CatSubCat);   }

   
   Campo1.Text:= '0';
   Edit_PCodigo.Text := '0';
   BtnInclui.SetFocus;
   Carrega_Categorias;
end;

procedure TFrmFormPagto.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := 'Select * from FormasPagTo ';

   CRI := '';
   If (Length(Trim(Edit_PCodigo.Text)) > 0) and (StrToIntZero(Edit_PCodigo.Text)> 0) then
   begin
      CRI := CRI + ' and Codigo = '+ Trim(Edit_PCodigo.Text) +' ';
   end;
   If Length(Trim(Edit_PDescricao.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Nome) like Upper(''%'+ Trim(Edit_PDescricao.Text) +'%'')';
   end;
   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by Codigo ';

   Datasource1.DataSet := nil;
   Grid_Pesquisa.DataSource := nil;
            {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.Recordcount > 0) then
   begin
      Datasource1.DataSet := (JvQry_Pes as TDataSet);
      Grid_Pesquisa.DataSource := Datasource1;
   end;    }
   Grid_Pesquisa.SetFocus;
end;

procedure TFrmFormPagto.BtnExcluiClick(Sender: TObject);
//var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin   {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from FormasPagTo where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão de '+ Edit_Nome.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               FrmPrincipal.LimpaCampos(self,1);
            end;
            Operacao := opBrowse;
         end
         else
         begin
            MessageDlg('Formas de Pagamento com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
         end;
         BtnInclui.SetFocus;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end;}
   end;
end;

procedure TFrmFormPagto.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmFormPagto.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   // JvQry_Pes.active := false;
   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
   BtnAtualiza.SetFocus;
end;

procedure TFrmFormPagto.Edit_PCodigoExit(Sender: TObject);
begin
   If Length(Trim(Campo1.Text)) = 0 then
      Campo1.Text := '0';
end;

procedure TFrmFormPagto.ListPrazosClick(Sender: TObject);
begin
   if ListPrazos.ItemIndex >= 0 then
      SBCancela.Enabled := True
   else
      SBCancela.Enabled := False;
end;

Procedure TFrmFormPagto.Carrega_Categorias;
var aCategoria : String;
    I : Integer;
begin     {
   JvQry_CatSubCat.First;
   Combo_Categoria.Items.Clear;
   aCategoria := '';
   aCategoria := JvQry_CatSubCat.FieldByName('CAT').asString;
   Combo_Categoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);
   For I := 1 to JvQry_CatSubCat.RecordCount do
   begin
      if JvQry_CatSubCat.FieldByName('CAT').asString <> aCategoria then
      begin
         Combo_Categoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);
         aCategoria := JvQry_CatSubCat.FieldByName('CAT').asString;
      end;
      JvQry_CatSubCat.Next;
   end;  }
   Combo_Categoria.Text := '';
end;

Procedure TFrmFormPagto.Carrega_SubCategorias(aCategoria: String; oCombo: TComboBox);
var I : Integer;
begin      {
   JvQry_CatSubCat.First;
   oCombo.Items.Clear;
   if Trim(aCategoria) = '' then Exit;
   For I := 1 to JvQry_CatSubCat.RecordCount do
   begin
      if JvQry_CatSubCat.FieldByName('CAT').asString = aCategoria then
      begin
         oCombo.Items.Add(JvQry_CatSubCat.FieldByName('SUBCAT').asString);
      end;
      JvQry_CatSubCat.Next;
   end;   }
   oCombo.Text := '';
end;

procedure TFrmFormPagto.SBGravaClick(Sender: TObject);
var osDias : Integer;
begin
   if not ValNumero(Edit_Dias.Text) then
   begin
      MessageDlg('O prazo "'+ Trim(Edit_Dias.Text) +'" não pode ser incluído.',mtWarning,[mbOk],0);
      Edit_Dias.SetFocus;
      Exit;
   end;

   if Length(Trim(Campo1.Text)) > 0 then
   begin
      osDias := StrToInt(Trim(Edit_Dias.Text));
      Campo1Exit(Self);
      if not FrmPrincipal.RodaComando(' INSERT INTO PRAZOSPAGTO (Cod_Forma,Dias) VALUES ('+ Trim(Campo1.Text) +','+ IntToStr(osDias) +');') then
         MessageDlg('O prazo "'+ Trim(Edit_Dias.Text) +'" não pode ser incluído.',mtWarning,[mbOk],0);
   end;
   Carrega_Prazos;
   ListPrazosClick(Self);
   Edit_Dias.Text := '0';
   Edit_Dias.SetFocus;
   Edit_Dias.SelectAll;
end;

procedure TFrmFormPagto.Carrega_Prazos;
// var JvQuery : TJvUIBDataset;
begin
   ListPrazos.Items.Clear;
{   JvQuery := TJvUIBDataset.Create(self);
   try
      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction;

      if not FrmPrincipal.RodaConsulta('Select * from PRAZOSPAGTO where COD_FORMA='+ Campo1.Text +' Order by Dias',JvQuery) then Exit;
      
      if JvQuery.RecordCount > 0 then
      begin
         ListPrazos.Items.BeginUpdate;
         ListPrazos.Items.Clear;
         JvQuery.First;
         While not JvQuery.Eof do
         begin
            ListPrazos.Items.Add(' ' + JvQuery.FieldByName('DIAS').asString + ' dias');
            JvQuery.Next;
         end;
         ListPrazos.Items.EndUpdate;
         if ListPrazos.Items.Count > 0 then
            ListPrazos.ItemIndex := 0;
         ListPrazosClick(Self);
         Edit_Dias.Text := '0';
      end;
   Finally
      JvQuery.Close;
      JvQuery.Free;
   end; }
end;

procedure TFrmFormPagto.SBCancelaClick(Sender: TObject);
begin
   if MessageDlg('Confirma exclusão do PRAZO "'+ ListPrazos.Items[ListPrazos.ItemIndex]+'" forma de pagamento "'+Edit_Nome.Text+'"', mtConfirmation,[mbYes, mbNo],0) = mrYes then
   begin
      if not FrmPrincipal.RodaComando('DELETE FROM PRAZOSPAGTO WHERE Cod_Forma='+ Campo1.Text +' and Dias='+ Copy(ListPrazos.Items[ListPrazos.ItemIndex],0,Pos(' ',Trim(ListPrazos.Items[ListPrazos.ItemIndex])) )+ ';') then
         MessageDlg('O prazo "'+ Trim(ListPrazos.Items[ListPrazos.ItemIndex]) +'" não pode ser excluído.',mtWarning,[mbOk],0);
   end;
   Edit_Dias.Text := '0';
   Carrega_Prazos;
   ListPrazos.SetFocus;
end;

procedure TFrmFormPagto.Edit_DiasEnter(Sender: TObject);
begin
   Edit_Dias.SelectAll;
end;

procedure TFrmFormPagto.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('FormPagto',IBQry_Pes);
end;

initialization
   {$i uformpagto.lrs}

end.

