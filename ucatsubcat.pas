unit UCatSubcat;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, ComCtrls, Grids, DBGrids, ExtCtrls, LCLType,
  DBCtrls, ImgList, Buttons, CheckLst, ActnList, LResources;


type
  TFrmCatSubCat = class(TForm)
     Datasource1: TDatasource;
     dbGrid1: TdbGrid;          {
     JvQry_Pes: TJvUIBDataSet;
     JvQry_SubCateg: TJvUIBDataSet;
     Proc_Cat: TJvUIBQuery;
     Proc_SubCat: TJvUIBQuery; }
    Paginas: TPageControl;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    TabPesquisa: TTabSheet;
    Panel2: TPanel;
    Label61: TLabel;
    Panel4: TPanel;
    BtnImprime: TBitBtn;
    BtnLimpa: TBitBtn;
    BtnAjudaPes: TBitBtn;
    BtnAtualiza: TBitBtn;
    BtnSairPes: TBitBtn;
    Edit_PCategoria: TEdit;
    PageCadastro: TPageControl;
    TabCategoria: TTabSheet;
    TabSubCateg: TTabSheet;
    TreeView1: TTreeView;
    Label1: TLabel;
    Edit_PSubCategoria: TEdit;
    ChkList_Tipo: TCheckListBox;
    Panel6: TPanel;
    Src_SubCateg: TDataSource;
    Panel3: TPanel;
    Label2: TLabel;
    RG_Tipo: TRadioGroup;
    Campo1: TEdit;
    Panel5: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    F3_Categorias: TSpeedButton;
    Label4: TLabel;
    Edit_SubCategoria: TEdit;
    Edit_Categoria: TEdit;
    procedure Edit_CategoriaKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure FrmCatSubCatShow(Sender: TObject);
    function  GetFieldList: TStringList;
    procedure FormCreate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure PageCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure PageCadastroChange(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
//    procedure Carrega_Parametros(Proc : TJvUIBQuery);
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure F3_CategoriasClick(Sender: TObject);
    procedure Edit_CategoriaExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure BtnAjudaClick(Sender: TObject);

  private
    { Private }
    vOper : Integer;
    procedure SetOper(const Value: Integer);
    
  published
    property Operacao:Integer read vOper write SetOper;

  public

  end;

const
   opInsert = 0;
   opEdit   = 1;
   opDelete = 2;
   opBrowse = 3;

var
  FrmCatSubCat: TFrmCatSubCat;
  FieldList: TStringList;

implementation

uses TreeFunc, UPrincipal, UConsulta, Global;

procedure TFrmCatSubCat.SetOper(const Value: Integer);
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
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     Campo1.Enabled := False;
                  end;
    end;
  end;
end;
      {
procedure TFrmCatSubCat.Carrega_Parametros(Proc : TJvUIBQuery);
begin
   with Proc do
   begin
      if PageCadastro.ActivePageIndex = 0 then
      begin
         Params.ByNameAsInteger['POPER'] := Operacao;
         Params.ByNameAsString['PNOME'] := Campo1.Text;
         Params.ByNameAsInteger['PTIPO'] := RG_Tipo.ItemIndex;
      end
      else
      begin
         Params.ByNameAsInteger['POPER'] := Operacao;
         Params.ByNameAsString['PCATEGORIA'] := Edit_Categoria.Text;
         Params.ByNameAsString['PNOME'] := Edit_SubCategoria.Text;
      end;
   end;
end; }

procedure TFrmCatSubCat.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataSet do
   begin
      if PageCadastro.ActivePageIndex = 0 then
      begin
         Campo1.Text := FieldByName('NOME').asString;
         RG_Tipo.ItemIndex := FieldByName('TIPO').asInteger;
         //SubCateg
{         JvQry_SubCateg.Close;
         JvQry_SubCateg.Params.ByNameAsString['aCategoria'] := Campo1.Text;
         JvQry_SubCateg.Open;  }
         
      end
      else
      begin
         oDataSet.next;
         Edit_Categoria.Text := FieldByName('CATEGORIA').asString;
         Edit_SubCategoria.Text := FieldByName('NOME').asString;
      end;
   end;
end;

function TFrmCatSubCat.GetFieldList: TStringList;
begin                       {
    FieldList.clear;
    if JvQry_Pes.FieldByName('TIPO').asInteger = 0 then
       FieldList.add(JvQry_Pes.FieldByName('CATEGORIA').AsString + ' ( + )')
    else
       FieldList.add(JvQry_Pes.FieldByName('CATEGORIA').AsString + ' ( - )');

    if Trim(JvQry_Pes.FieldByName('NOME').asString) <> '' then
      FieldList.add(JvQry_Pes.FieldByName('NOME').asstring);
    Result := FieldList;   }
end;

procedure TFrmCatSubCat.FrmCatSubCatShow(Sender: TObject);
begin {
   Proc_Cat.DataBase := FrmPrincipal.base;
   Proc_Cat.Transaction := FrmPrincipal.Transaction;
   Proc_Cat.BuildStoredProc('PROC_CATEGORIAS');

   Proc_SubCat.DataBase := FrmPrincipal.base;
   Proc_SubCat.Transaction := FrmPrincipal.Transaction;
   Proc_SubCat.BuildStoredProc('PROC_SUBCATEGORIAS');

   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;

   JvQry_SubCateg.Database := FrmPrincipal.base;
   JvQry_SubCateg.Transaction := FrmPrincipal.Transaction;
   JvQry_SubCateg.SQL.Clear;
   JvQry_SubCateg.SQL.Add('SELECT * FROM SUBCATEGORIAS WHERE CATEGORIA = :aCategoria'); }
end;

procedure TFrmCatSubCat.Edit_CategoriaKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_CategoriasClick(Self);
end;

procedure TFrmCatSubCat.FormCreate(Sender: TObject);
begin
   FieldList := TStringList.Create;
   Operacao := opBrowse;
end;

{procedure TFrmCatSubCat.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
   if (Node.data <> nil) and (JvQry_Pes.Active = True) and (JvQry_Pes.RecordCount >0 ) then
      JvQry_Pes.GotoBookmark(Node.Data);
end;}

procedure TFrmCatSubCat.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmCatSubCat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmCatSubCat.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := ' Select Categorias.Nome Categoria, Categorias.Tipo, SubCategorias.Nome ';
   vSelect := vSelect + ' from Subcategorias ';
   vSelect := vSelect + ' right join Categorias on Subcategorias.categoria = Categorias.nome ';

   CRI := '';
   If Length(Trim(Edit_PCategoria.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(CATEGORIAS.NOME) like Upper(''%'+ Trim(Edit_PCategoria.Text) +'%'')';
   end;
   If Length(Trim(Edit_PSubCategoria.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(SUBCATEGORIAS.NOME) like Upper(''%'+ Trim(Edit_PSubCategoria.Text) +'%'')';
   end;
   //Tipo
   if (ChkList_Tipo.Checked[0]) or (ChkList_Tipo.Checked[1]) then
   begin
      if not ((ChkList_Tipo.Checked[0]) and (ChkList_Tipo.Checked[1])) then
      begin
         if ChkList_Tipo.Checked[0] then
            CRI := CRI + ' and Tipo = 0 '
         else
            CRI := CRI + ' and Tipo = 1 ';
      end;
   end;

   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by Categoria, SubCategorias.Nome ';


   Datasource1.DataSet := nil;
         {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes))  then
   begin
      Datasource1.DataSet := (JvQry_Pes as TDataset);
      TreeView1.Items.BeginUpdate;
      TreeView1.Items.Clear;
      JvQry_Pes.First;
      while not JvQry_Pes.Eof do
      begin
         TreeAddItem(TreeView1, GetFieldList, JvQry_Pes.GetBookmark, False);
         JvQry_Pes.Next;
      end;
      FieldList.Clear;
      //TreeView1.Alphasort;
      TreeView1.Items.EndUpdate;
      if TreeView1.Items.Count > 0 then
         TreeView1.Items[0].Selected := True;
   end; }
end;

procedure TFrmCatSubCat.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   TreeView1.Items.Clear;
//    JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmCatSubCat.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   if PageCadastro.ActivePageIndex = 0 then
   begin
//      JvQry_SubCateg.Close;
      FrmPrincipal.LimpaCampos(self,1);
      Campo1.SetFocus;
   end
   else
   begin
      FrmPrincipal.LimpaCampos(self,3);
      Edit_Categoria.SetFocus;
   end;
end;

procedure TFrmCatSubCat.PageCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmCatSubCat.PageCadastroChange(Sender: TObject);
begin
   if PageCadastro.ActivePageIndex = 0 then
      //Proc.BuildStoredProc('PROC_CATEGORIAS')
   else
      //Proc.BuildStoredProc('PROC_SUBCATEGORIAS');
end;

procedure TFrmCatSubCat.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin       {
   if PageCadastro.ActivePageIndex = 0 then
   begin
      If Length(Trim(Campo1.Text)) <> 0 then
      begin
         JvQuery := TJvUIBDataset.Create(self);
         try
            JvQuery.Database := FrmPrincipal.Base;
            JvQuery.Transaction := FrmPrincipal.Transaction;
            
            if not FrmPrincipal.RodaConsulta('Select * from CATEGORIAS where NOME='''+ Campo1.Text +'''',JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               Operacao := opDelete;
               Carrega_Campos(JvQuery);
               if MessageDlg('Confirma exclusão de '+ Campo1.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
               begin
                  if PageCadastro.ActivePageIndex = 0 then
                  begin
                     Carrega_Parametros(Proc_Cat);
                     FrmPrincipal.RodaSP(Proc_Cat);
                  end
                  else
                  begin
                     Carrega_Parametros(Proc_SubCat);
                     FrmPrincipal.RodaSP(Proc_SubCat);
                  end;

                  JvQry_SubCateg.Close;
                  FrmPrincipal.LimpaCampos(self,1);
               end;
               Operacao := opBrowse;
            end
            else
            begin
               MessageDlg('Categoria "'+ Campo1.Text +'" não encontrada.',mtConfirmation,[mbOk],0);
               JvQry_SubCateg.Close;
               FrmPrincipal.LimpaCampos(self,1);
            end;
            BtnInclui.SetFocus;
         Finally
            JvQuery.Close;
            JvQuery.Free;
         end;
      end
   end
   else
   begin
      If (Length(Trim(Edit_Categoria.Text)) <> 0) and (Length(Trim(Edit_SubCategoria.Text)) <> 0) then
      begin
         JvQuery := TJvUIBDataset.Create(self);
         try
            JvQuery.Database := FrmPrincipal.Base;
            JvQuery.Transaction := FrmPrincipal.Transaction;

            if not FrmPrincipal.RodaConsulta('Select * from SUBCATEGORIAS where CATEGORIA='''+ Edit_Categoria.Text +''' and NOME='''+ Edit_SubCategoria.Text +'''',JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               Operacao := opDelete;
               Carrega_Campos(JvQuery);
               if MessageDlg('Confirma exclusão da SubCategoria '+ Edit_SubCategoria.Text + ' - Categoria  '+ Edit_Categoria.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
                begin
                  if PageCadastro.ActivePageIndex = 0 then
                  begin
                     Carrega_Parametros(Proc_Cat);
                     FrmPrincipal.RodaSP(Proc_Cat);
                  end
                  else
                  begin
                     Carrega_Parametros(Proc_SubCat);
                     FrmPrincipal.RodaSP(Proc_SubCat);
                  end;

                  JvQry_SubCateg.Close;
                  FrmPrincipal.LimpaCampos(self,3);
               end;
               Operacao := opBrowse;
            end
            else
            begin
               MessageDlg('SubCategoria "'+ Edit_SubCategoria.Text +'" da Categoria "'+ Edit_Categoria.Text +'" não encontrada.',mtConfirmation,[mbOk],0);
               JvQry_SubCateg.Close;
               FrmPrincipal.LimpaCampos(self,3);
            end;
            BtnInclui.SetFocus;
         Finally
            JvQuery.Close;
            JvQuery.Free;
         end;
      end;
   end; }
end;

procedure TFrmCatSubCat.BtnGravaClick(Sender: TObject);
begin
   if PageCadastro.ActivePageIndex = 0 then
   begin
      //Categoria
      if Length(Trim(Campo1.Text)) = 0 then
      begin
         MessageDlg('Nome deve ser preenchido.', mtInformation,[mbOK],0);
         if Campo1.Enabled = True then Campo1.SetFocus;
         Exit;
      end;
   end
   else
   begin
      //Categoria
      if Length(Trim(Edit_Categoria.Text)) = 0 then
      begin
         MessageDlg('Categoria deve ser preenchida.', mtInformation,[mbOK],0);
         if Edit_Categoria.Enabled = True then Edit_Categoria.SetFocus;
         Exit;
      end;
      //SubCategoria
      if Length(Trim(Edit_SubCategoria.Text)) = 0 then
      begin
         MessageDlg('SubCategoria deve ser preenchida.', mtInformation,[mbOK],0);
         if Edit_SubCategoria.Enabled = True then Edit_SubCategoria.SetFocus;
         Exit;
      end;
   end;
   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
{   if PageCadastro.ActivePageIndex = 0 then
   begin
      Carrega_Parametros(Proc_Cat);
      FrmPrincipal.RodaSP(Proc_Cat);
   end
   else
   begin
      Carrega_Parametros(Proc_SubCat);
      FrmPrincipal.RodaSP(Proc_SubCat);
   end;
              }
   //Carrega_Parametros;
   //FrmPrincipal.RodaSP(Proc);
   Operacao := opBrowse;
   BtnInclui.SetFocus;
end;

procedure TFrmCatSubCat.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   if PageCadastro.ActivePageIndex = 0 then
   begin
      // JvQry_SubCateg.Close;
      FrmPrincipal.LimpaCampos(self,1);
   end
   else
   begin
      FrmPrincipal.LimpaCampos(self,3);
   end;
   BtnInclui.SetFocus;
end;

procedure TFrmCatSubCat.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
//   JvQry_SubCateg.Close;
   If Length(Trim(Campo1.Text)) <> 0 then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from CATEGORIAS where UPPER(NOME)='''+ UpperCase(Campo1.Text) +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
            BtnInclui.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Campo1.Text := '';;
   end;
end;

procedure TFrmCatSubCat.F3_CategoriasClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select Tipo, Nome from Categorias';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'NOME';
      FrmPesquisa.Caption := 'Categorias';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Categoria.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_CategoriaExit(Self);
         Edit_Categoria.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmCatSubCat.Edit_CategoriaExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   {If Length(Trim(Edit_Categoria.Text)) <> 0 then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from CATEGORIAS where Upper(Nome)='''+ UpperCase(Edit_Categoria.Text) +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            MessageDlg('Categoria não cadastrada.',mtInformation,[mbOK],0);
            Edit_Categoria.SetFocus;
         end
         else
            Edit_Categoria.Text := JvQuery.FieldByName('NOME').asString;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Edit_Categoria.Text := '';
   end;}
end;

procedure TFrmCatSubCat.DBGrid1DblClick(Sender: TObject);
begin    {
   if JvQry_Pes.RecordCount > 0 then
   begin
      PageCadastro.ActivePageIndex := 1;
      PageCadastroChange(Self);
      Carrega_Campos(JvQry_SubCateg);
   end; }
end;

procedure TFrmCatSubCat.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
   begin
      if TreeView1.Items.Count = 0 then exit;
      PageCadastro.ActivePageIndex := TreeView1.Selected.Level;
      PageCadastroChange(Self);
      if TreeView1.Selected.Level = 0 then
      begin
         Campo1.Text := Trim(Copy(TreeView1.Selected.Text,1,Length(TreeView1.Selected.Text)-6));
         Campo1Exit(self);
      end
      else
      begin
         Edit_Categoria.Text := Trim(Copy(TreeView1.Selected.Parent.Text,1,Length(TreeView1.Selected.Parent.Text)-6));
         Edit_SubCategoria.Text := TreeView1.Selected.Text;
      end;
   end;
end;

procedure TFrmCatSubCat.TreeView1DblClick(Sender: TObject);
begin
   //if TreeView1.Selected.Level = 1 then
   //begin
      Paginas.ActivePageIndex := 0;
      PaginasChange(self);
   //end;
end;

procedure TFrmCatSubCat.Action1Execute(Sender: TObject);
begin
   if Edit_Categoria.Focused then
      F3_CategoriasClick(self);
end;

procedure TFrmCatSubCat.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('CatSubcat',IBQry_Pes);
end;

procedure TFrmCatSubCat.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

initialization
   {$i ucatsubcat.lrs}

end.
