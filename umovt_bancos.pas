unit UMovt_Bancos;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db, ActnList,
  LResources, MaskEdit, LCLType;


type

  { TFrmMovtoBancos }

  TFrmMovtoBancos = class(TForm)
    BtnEditar: TBitBtn;
    BtnExcluiPesq: TBitBtn;
    BtnIncluiPesq: TBitBtn;
    BtnLimpa1: TBitBtn;
    BtnSairPes1: TBitBtn;
     Combo_Categoria: TComboBox;
     Combo_PCategoria: TComboBox;
     Combo_PSubCategoria: TComboBox;
     Combo_SubCategoria: TComboBox;
     Datasource1: TDatasource;
     Edit_PCta_Corr: TEdit;
     Edit_PDocumento: TEdit;
     F3_PCta_Corr: TSpeedButton;
     Grid_Pesquisa: TdbGrid;
     Edit_Quantidade: TEdit;
     Edit_Valor: TEdit;
     Edit_Cta_Corr: TEdit;
     Edit_Reg: TEdit;
//     JvQry_CatSubCat: TJvUIBDataSet;
//    JvQry_Pes: TJvUIBDataSet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Lbl_Status: TLabel;
    Msk_PDataMov_F: TMaskEdit;
    Msk_PDataMov_I: TMaskEdit;
    Msk_PData_F: TMaskEdit;
    Msk_PData_I: TMaskEdit;
    Paginas: TPageControl;
    Panel2: TPanel;
    PanelPCod_Banco: TPanel;
    PanelPCta_Corr: TPanel;
    PanelPNome_Banco: TPanel;
//    Proc: TJvUIBQuery;
    RG_Ordem: TRadioGroup;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel8: TPanel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    Edit_Historic: TEdit;
    NaoLimpar: TCheckBox;
    Msk_DataMov: TMaskEdit;
    Edit_Documento: TEdit;
    Msk_Data: TMaskEdit;
    Edit_Especie: TEdit;
    TabPesquisa: TTabSheet;
    Panel1: TPanel;
    Panel4: TPanel;
    BtnAtualiza: TBitBtn;
    Label28: TLabel;
    PanelCod_Banco: TPanel;
    PanelNome_Banco: TPanel;
    Label29: TLabel;
    F3_Cta_Corr: TSpeedButton;
    PanelCta_Corr: TPanel;
    procedure BtnEditar1Click(Sender: TObject);
    procedure BtnExcluiPesq1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Combo_CategoriaDropDown(Sender: TObject);
    procedure Combo_SubCategoriaEnter(Sender: TObject);
    procedure Edit_Cta_CorrKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_PCta_CorrKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Edit_RegExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Combo_CategoriaChange(Sender: TObject);
    Procedure Carrega_Categorias;
    Procedure Carrega_SubCategorias(aCategoria: String; oCombo: TComboBox);
    procedure FormActivate(Sender: TObject);
    procedure Combo_SubCategoriaDropDown(Sender: TObject);
    procedure Msk_DataMovEnter(Sender: TObject);
    procedure Msk_DataMovExit(Sender: TObject);
    procedure Combo_PCategoriaChange(Sender: TObject);
    procedure Combo_PSubCategoriaDropDown(Sender: TObject);
    procedure Edit_Cta_CorrExit(Sender: TObject);
    procedure F3_Cta_CorrClick(Sender: TObject);
    procedure F3_PCta_CorrClick(Sender: TObject);
    procedure Edit_PCta_CorrExit(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
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
  FrmMovtoBancos: TFrmMovtoBancos;

implementation

uses UPrincipal, Global, UConsulta;


procedure TFrmMovtoBancos.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case vOper of
       opInsert : begin
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnSair.Enabled := False;
                     Msk_DataMov.Enabled := True;
                     Edit_Reg.Enabled := True;
                     NaoLimpar.Enabled := True;
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     Msk_DataMov.Enabled := False;
                     Edit_Reg.Enabled := False;
                     NaoLimpar.Enabled := False;
                  end;
    end;
  end;
end;

procedure TFrmMovtoBancos.SetStatus(Status: String);
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

procedure TFrmMovtoBancos.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmMovtoBancos.BtnExcluiPesq1Click(Sender: TObject);
begin
//  Carrega_Campos(JvQry_Pes);
  BtnExcluiClick(self);
  BtnAtualizaClick(self);
end;

procedure TFrmMovtoBancos.BtnEditar1Click(Sender: TObject);
begin
  Grid_PesquisaDblClick(self);
end;

procedure TFrmMovtoBancos.Combo_CategoriaDropDown(Sender: TObject);
begin
   if (Sender as TComboBox).Text = '' then
   begin
      (Sender as TComboBox).ItemIndex := 0;
   end;
end;

procedure TFrmMovtoBancos.Combo_SubCategoriaEnter(Sender: TObject);
begin

end;

procedure TFrmMovtoBancos.Edit_Cta_CorrKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_Cta_CorrClick(Self);
end;

procedure TFrmMovtoBancos.Edit_PCta_CorrKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then F3_PCta_CorrClick(Self);
end;

procedure TFrmMovtoBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmMovtoBancos.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmMovtoBancos.BtnIncluiClick(Sender: TObject);
begin
   Paginas.ActivePageIndex := 0;
   SetStatus('Inserção');
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
   Edit_Cta_CorrExit(Self);
   Msk_DataMov.SetFocus;
end;

procedure TFrmMovtoBancos.BtnGravaClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
var vSelect : String;
begin
   //DataMov
   if not ValiData(Msk_DataMov.Text) then
   begin
      MessageDlg('Data Movimento deve ser uma data válida.', mtInformation,[mbOK],0);
      Msk_DataMov.SetFocus;
      Exit;
   end;
   //Reg

   //Documento
   if Length(Trim(Edit_Documento.Text)) > 0 then
   begin
         //Procura para ver se esse DOCUMENTO ja foi cadastrado
{         JvQuery := TJvUIBDataset.Create(self);
         try
            JvQuery.Database := FrmPrincipal.Base;
            JvQuery.Transaction := FrmPrincipal.Transaction;
            vSelect := '';
            vSelect := 'Select * from MOVTOBANCOS where DOCUMENTO='''+ Edit_Documento.Text +''' and (Datamov <> '''+ FormatDateTime('mm/dd/yyyy', StrToDate(Msk_DataMov.Text)) +''' or Reg <> '+ Trim(IntTostr(StrToIntZero(Edit_Reg.Text))) +') ';
            if not FrmPrincipal.RodaConsulta(vSelect,JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               //keybd_event(39,0,0,0);
               if MessageDlg('O DOCUMENTO "'+ Edit_Documento.Text +'" já está cadastrado no Mov. Bancário no dia '+ #13 +
                          JvQuery.FieldByName('DATAMOV').asString + ' Registro ' +  JvQuery.FieldByName('REG').asString + #13 +
                          'Deseja localizar e carregar o documento "'+ JvQuery.FieldByName('DOCUMENTO').asString +'" já cadastrado ?',
                          mtWarning,[mbYes, mbNo],0) = mrYes then
               begin
                  Operacao := opBrowse;
                  Carrega_Campos(JvQuery);
               end;
            end;
         finally
            JvQuery.Close;
            JvQuery.Free;
         end; }
   end;
   
   //Data Doc
   if not ValiData(Msk_Data.Text) then
   begin
      MessageDlg('Data Documento deve ser uma data válida.', mtInformation,[mbOK],0);
      Msk_Data.SetFocus;
      Exit;
   end;


   //Categoria
   if Length(Trim(Combo_Categoria.Text)) = 0 then
   begin
      MessageDlg('Categoria deve ser preenchida.', mtInformation,[mbOK],0);
      Combo_Categoria.SetFocus;
      Exit;
   end;

   //SubCategoria
   if Length(Trim(Combo_SubCategoria.Text)) = 0 then
   begin
      MessageDlg('SubCategoria deve ser preenchida.', mtInformation,[mbOK],0);
      Combo_SubCategoria.SetFocus;
      Exit;
   end;

   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   Carrega_Parametros;
 //  FrmPrincipal.RodaSP(Proc);
   Operacao := opBrowse;
   SetStatus('Edição');
   if NaoLimpar.Checked then
   begin
      Operacao := opInsert;
      SetStatus('Inserção');
      Msk_DataMov.Text := '';
      Edit_Reg.Text := '0';
      Msk_DataMov.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmMovtoBancos.Carrega_Parametros;
begin   {
   with Proc do
   begin
      Params.ByNameAsInteger['POPER'] := Operacao;
      Params.ByNameAsString['PDATAMOV'] := Msk_DataMov.Text;
      Params.ByNameAsInteger['PREG'] := StrToIntZero(Edit_Reg.Text);
      Params.ByNameAsString['PDOCUMENTO'] := Edit_Documento.Text;
      Params.ByNameAsString['PDATA'] := Msk_Data.Text;
      Params.ByNameAsInteger['PCTA_CORR'] := StrToIntZero(Edit_Cta_Corr.Text);
      Params.ByNameAsString['PCATEGORIA'] := Combo_Categoria.Text;
      Params.ByNameAsString['PSUBCATEGO'] := Combo_SubCategoria.Text;
      Params.ByNameAsString['PHISTORIC'] := Edit_Historic.Text;
      Params.ByNameAsCurrency['PQUANTIDADE'] := StrToFloatZero(Edit_Quantidade.Text);
      Params.ByNameAsString['PESPECIE'] := Edit_Especie.Text;
      Params.ByNameAsCurrency['PVALOR'] := StrToFloatZero(Edit_Valor.Text);
      Params.ByNameAsInteger['PCTRL_LCTS'] := -1;
   end;}
end;

procedure TFrmMovtoBancos.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataSet do
   begin
      //Campo1.Text := FieldByName('CODIGO').asString;
      //Edit_Nome.Text := FieldByName('NOME').asString;
      Msk_DataMovEnter(Msk_DataMov);
      Msk_DataMov.Text := FieldByName('DATAMOV').asString;
      Msk_DataMovExit(Msk_DataMov);
      Edit_Reg.text := FieldByName('REG').AsString;
      Edit_Documento.Text := FieldByName('DOCUMENTO').asString;
      Msk_DataMovEnter(Msk_Data);
      Msk_Data.Text := FieldByName('DATA').asString;
      Msk_DataMovExit(Msk_Data);
      Edit_Cta_Corr.Text := FieldByName('CTA_CORR').AsString;
      Edit_Cta_CorrExit(Self);
      Combo_Categoria.Text := FieldByName('CATEGORIA').AsString;
      Carrega_SubCategorias(Combo_Categoria.Text,Combo_SubCategoria);
      Combo_SubCategoria.Text := FieldByName('SUBCATEGO').AsString;
      Edit_Historic.Text := FieldByName('HISTORIC').AsString;
      Edit_Quantidade.Text := FieldByName('QUANTIDADE').AsString;
      Edit_Especie.Text := FieldByName('ESPECIE').AsString;
      Edit_Valor.Text := FieldByName('VALOR').AsString;
  end;
end;

procedure TFrmMovtoBancos.Grid_PesquisaDblClick(Sender: TObject);
begin            {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      Carrega_Campos(JvQry_Pes);
      SetStatus('Edição');
      Paginas.ActivePageIndex := 0;
   end;         }
end;

procedure TFrmMovtoBancos.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmMovtoBancos.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   FrmPrincipal.LimpaCampos(self,1);
   Edit_Cta_CorrExit(Self);
   BtnInclui.SetFocus;
end;

procedure TFrmMovtoBancos.Edit_RegExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Msk_DataMov.Text)) > 0) and (Length(Trim(Edit_Reg.Text)) > 0) then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         if not FrmPrincipal.RodaConsulta('Select * from MovtoBancos where DATAMOV='''+ FormatDateTime('mm/dd/yyyy',StrToDate(Msk_DataMov.Text)) +''' and REG = '+ Edit_Reg.Text,JvQuery) then Exit;
         if JvQry_Pes.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQry_Pes);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmMovtoBancos.FormShow(Sender: TObject);
var vSelect : String;
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
{
   Proc.DataBase := FrmPrincipal.base;
   Proc.Transaction := FrmPrincipal.Transaction;
   Proc.BuildStoredProc('PROC_MOVTOBANCOS');
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
   //JvQry_CatSubCat.SQL.Add(vSelect);
   //JvQry_CatSubCat.Open;
   FrmPrincipal.RodaConsulta(vSelect,JvQry_CatSubCat); }

   Msk_DataMov.Text := '';
   Edit_Reg.Text := '0';
   BtnInclui.SetFocus;
   Carrega_Categorias;
end;

procedure TFrmMovtoBancos.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI, vOrdem : String;
begin
   BtnExcluiPesq.enabled := false;
   BtnEditar.enabled := false;
   vSelect := '';
   vSelect := ' SELECT MOVTOBANCOS.CTA_CORR || '' - ''|| CTACORRENTE.CTA_CORR CONTA_CORR, ';
   vSelect := vSelect + ' MOVTOBANCOS.DATAMOV, ';
   vSelect := vSelect + ' MOVTOBANCOS.REG, ';
   vSelect := vSelect + ' MOVTOBANCOS.DOCUMENTO, ';
   vSelect := vSelect + ' MOVTOBANCOS.DATA, ';
   vSelect := vSelect + ' MOVTOBANCOS.CTA_CORR, ';
   vSelect := vSelect + ' MOVTOBANCOS.HISTORIC, ';
   vSelect := vSelect + ' MOVTOBANCOS.VALOR, ';
   vSelect := vSelect + ' MOVTOBANCOS.CATEGORIA, ';
   vSelect := vSelect + ' MOVTOBANCOS.SUBCATEGO, ';
   vSelect := vSelect + ' MOVTOBANCOS.CTRL_LCTS, ';
   vSelect := vSelect + ' MOVTOBANCOS.QUANTIDADE, ';
   vSelect := vSelect + ' MOVTOBANCOS.ESPECIE ';
   vSelect := vSelect + ' FROM MOVTOBANCOS ';
   vSelect := vSelect + ' INNER JOIN CTACORRENTE ON (MOVTOBANCOS.CTA_CORR = CTACORRENTE.CODIGO) ';

   CRI := '';

   //Data Movimento
   if (Trim(Msk_PDataMov_I.Text) <> '') and (Trim(Msk_PDataMov_F.Text) <> '') then
   begin
      if (ValiData(Msk_PDataMov_I.Text)) and (ValiData(Msk_PDataMov_F.Text)) then
      begin
         CRI := CRI + ' and DataMov >= '''+ FormatDateTime('mm/dd/yyyy',StrToDate(Msk_PDataMov_I.Text)) +''' and DataMov <= '''+ FormatDateTime('mm/dd/yyyy',StrToDate(Msk_PDataMov_F.Text)) +'''';
      end
      else
      begin
         MessageDlg('Data movimento inicial ou final inválida.',mtWarning,[mbOK],0);
         Msk_PDataMov_I.SetFocus;
      end;
   end;

   //Data Documento
   if (Trim(Msk_PData_I.Text) <> '') and (Trim(Msk_PData_F.Text) <> '') then
   begin
      if (ValiData(Msk_PData_I.Text)) and (ValiData(Msk_PData_F.Text)) then
      begin
         CRI := CRI + ' and Data >= '''+ FormatDateTime('mm/dd/yyyy',StrToDate(Msk_PData_I.Text)) +''' and Data <= '''+ FormatDateTime('mm/dd/yyyy',StrToDate(Msk_PData_F.Text)) +'''';
      end
      else
      begin
         MessageDlg('Data documento inicial ou final inválida.',mtWarning,[mbOK],0);
         Msk_PDataMov_I.SetFocus;
      end;
   end;

   //Documento
   If Length(Trim(Edit_PDocumento.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(DOCUMENTO) like Upper(''%'+ Trim(Edit_PDocumento.Text) +'%'')';
   end;

   //Categoria
   If Length(Trim(Combo_PCategoria.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(CATEGORIA) = Upper('''+ Combo_PCategoria.Text +''')';
   end;

   //SubCategoria
   If Length(Trim(Combo_PSubCategoria.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(SUBCATEGO) = Upper('''+ Combo_PSubCategoria.Text +''')';
   end;

   //Conta Corrente
   If StrToIntZero(Edit_PCta_Corr.Text) > 0 then
   begin
      CRI := CRI + ' and MOVTOBANCOS.CTA_CORR = ' + Trim(Edit_PCta_Corr.Text) + ' ';
   end;

   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vOrdem := ' order by  ';
   case RG_Ordem.ItemIndex of
      0 : vOrdem := vOrdem + ' DataMov, Reg ';
      1 : vOrdem := vOrdem + ' Data ';
      2 : vOrdem := vOrdem + ' Documento ';
   end;
   
   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + vOrdem;

   Datasource1.DataSet := nil;
   Grid_Pesquisa.DataSource := nil;
   //Grid_Pesquisa.ColWidths[1] := 120;
   //Grid_Pesquisa.ColWidthsChanged;
          {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      BtnExcluiPesq.enabled := true;
      BtnEditar.enabled := true;
      datasource1.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource1;
   end;  }
end;

procedure TFrmMovtoBancos.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Msk_DataMov.Text)) <> 0) and (StrToIntZero(Edit_Reg.Text) > 0) then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from MovtoBancos where DataMov='''+ FormatDateTime('mm/dd/yyyy',StrTodate(Msk_DataMov.Text)) +''' and Reg='+ Trim(Edit_Reg.Text),JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão do movimento ?'+ #13 + 'Data Mov. : ' + Msk_DataMov.Text +'   Registro : '+ Trim(Edit_Reg.Text)+ #13 +'Documento : ' + Edit_Documento.Text, mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               FrmPrincipal.LimpaCampos(self,1);
               Edit_Cta_CorrExit(Self);
            end;
            Operacao := opBrowse;
            SetStatus('Pesquisa');
         end
         else
         begin
            MessageDlg('Movimento com Data "'+ Msk_DataMov.Text +'" e Registro "'+ Trim(Edit_Reg.Text) +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
            Edit_Cta_CorrExit(Self);
         end;
         BtnInclui.SetFocus;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmMovtoBancos.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmMovtoBancos.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   Edit_PCta_CorrExit(self);
   Datasource1.DataSet := nil;
   Grid_Pesquisa.DataSource := nil;
//   JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmMovtoBancos.Combo_CategoriaChange(Sender: TObject);
begin
   Combo_SubCategoria.Text := '';
end;

Procedure TFrmMovtoBancos.Carrega_Categorias;
var aCategoria : String;
    I : Integer;
begin    {
   JvQry_CatSubCat.First;
   Combo_Categoria.Items.Clear;
   Combo_PCategoria.Items.Clear;
   aCategoria := '';
   aCategoria := JvQry_CatSubCat.FieldByName('CAT').asString;
   Combo_Categoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);
   Combo_PCategoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);
   For I := 1 to JvQry_CatSubCat.RecordCount do
   begin
      if JvQry_CatSubCat.FieldByName('CAT').asString <> aCategoria then
      begin
         Combo_Categoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);
         Combo_PCategoria.Items.Add(JvQry_CatSubCat.FieldByName('CAT').asString);
         aCategoria := JvQry_CatSubCat.FieldByName('CAT').asString;
      end;
      JvQry_CatSubCat.Next;
   end; }
   Combo_Categoria.Text := '';
   Combo_PCategoria.Text := '';
end;

Procedure TFrmMovtoBancos.Carrega_SubCategorias(aCategoria: String; oCombo: TComboBox);
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

procedure TFrmMovtoBancos.FormActivate(Sender: TObject);
begin
   //IBQry_CatSubCat.Close;
   //IBQry_CatSubCat.Open;
   //Carrega_Categorias;
end;

procedure TFrmMovtoBancos.Combo_SubCategoriaDropDown(Sender: TObject);
begin
   if Combo_Categoria.Text <> '' then
      Carrega_SubCategorias(Combo_Categoria.Text,Combo_SubCategoria);
   if Combo_SubCategoria.Text = '' then
      Combo_SubCategoria.ItemIndex := -1;
end;

procedure TFrmMovtoBancos.Msk_DataMovEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99/99/9999;1;_';
      (Sender as TMaskEdit).SelStart := 0;
      if (Operacao = opInsert) and ((Sender as TMaskEdit) = Msk_DataMov) then
         (Sender as TMaskEdit).Text := DateToStr(Date);
      (Sender as TMaskEdit).SelectAll;
   end;
end;

procedure TFrmMovtoBancos.Msk_DataMovExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '/  /' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmMovtoBancos.Combo_PCategoriaChange(Sender: TObject);
begin
   Combo_PSubCategoria.Text := '';
end;

procedure TFrmMovtoBancos.Combo_PSubCategoriaDropDown(Sender: TObject);
begin
   if Combo_PCategoria.Text <> '' then
      Carrega_SubCategorias(Combo_PCategoria.Items[Combo_PCategoria.ItemIndex],Combo_PSubCategoria);
   if Combo_PSubCategoria.Text = '' then
      Combo_PSubCategoria.ItemIndex := -1;
end;

procedure TFrmMovtoBancos.Edit_Cta_CorrExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Cta_Corr.Text)) <> 0) and (Trim(Edit_Cta_Corr.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('SELECT BANCOS.CODBANCO, BANCOS.NOMEBANCO, BANCOS.CODAGENCIA, BANCOS.NOMEAGENCIA, CTACORRENTE.CODIGO, CTACORRENTE.CTA_CORR FROM CTACORRENTE INNER JOIN BANCOS ON (CTACORRENTE.BANCO = BANCOS.CODIGO) where CTACORRENTE.Codigo='+ Edit_Cta_Corr.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelCta_Corr.Caption := JvQuery.FieldByName('CTA_CORR').asString;
            PanelCod_Banco.Caption := JvQuery.FieldByName('CODIGO').asString;
            PanelNome_Banco.Caption := JvQuery.FieldByName('CODBANCO').asString+ ' - ' +JvQuery.FieldByName('NOMEBANCO').asString;
         end
         else
         begin
            MessageDlg('Conta Corrente não cadastrada.',mtInformation,[mbOK],0);
            PanelCta_Corr.Caption := '';
            PanelCod_Banco.Caption := '';
            PanelNome_Banco.Caption := '';
            Edit_Cta_Corr.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Cta_Corr.Text := '0';
      PanelCta_Corr.Caption := '';
      PanelCod_Banco.Caption := '';
      PanelNome_Banco.Caption := '';
   end;
end;

procedure TFrmMovtoBancos.F3_Cta_CorrClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT * from CTACORRENTE';
      FrmPesquisa.Indice_Inicial := 'CTA_CORR';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Contas Corrente';
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  Edit_Cta_Corr.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_Cta_CorrExit(Self);
         Edit_Cta_Corr.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmMovtoBancos.F3_PCta_CorrClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT * from CTACORRENTE';
      FrmPesquisa.Indice_Inicial := 'CTA_CORR';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Contas Corrente';
      if FrmPesquisa.ShowModal = mrOK then
      begin
       //  Edit_PCta_Corr.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_PCta_CorrExit(Self);
         Edit_PCta_Corr.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmMovtoBancos.Edit_PCta_CorrExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_PCta_Corr.Text)) <> 0) and (Trim(Edit_PCta_Corr.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('SELECT BANCOS.CODBANCO, BANCOS.NOMEBANCO, BANCOS.CODAGENCIA, BANCOS.NOMEAGENCIA, CTACORRENTE.CODIGO, CTACORRENTE.CTA_CORR FROM CTACORRENTE INNER JOIN BANCOS ON (CTACORRENTE.BANCO = BANCOS.CODIGO) where CTACORRENTE.Codigo='+ Edit_PCta_Corr.Text,JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelPCta_Corr.Caption := JvQuery.FieldByName('CTA_CORR').asString;
            PanelPCod_Banco.Caption := JvQuery.FieldByName('CODIGO').asString;
            PanelPNome_Banco.Caption := JvQuery.FieldByName('CODBANCO').asString + ' - ' + JvQuery.FieldByName('NOMEBANCO').asString;
         end
         else
         begin
            MessageDlg('Conta Corrente não cadastrada.',mtInformation,[mbOK],0);
            PanelPCta_Corr.Caption := '';
            PanelPCod_Banco.Caption := '';
            PanelPNome_Banco.Caption := '';
            Edit_PCta_Corr.SetFocus;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_PCta_Corr.Text := '0';
      PanelPCta_Corr.Caption := '';
      PanelPCod_Banco.Caption := '';
      PanelPNome_Banco.Caption := '';
   end;
end;

procedure TFrmMovtoBancos.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('MovtoBanco',IBQry_Pes);
end;

initialization
   {$i umovt_bancos.lrs}

end.
