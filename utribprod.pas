unit UTribProd;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db, ActnList,
  LResources, LCLType;


type
  TFrmTribProd = class(TForm)
    BtnAjuda: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnExclui: TBitBtn;
    BtnGrava: TBitBtn;
    BtnInclui: TBitBtn;
    BtnSair: TBitBtn;
    Campo1: TEdit;
    Combo_Situa_Icm: TComboBox;
    Datasource: TDatasource;
    DBGrid_Aliquotas: TdbGrid;
//     JvQry_Aliquotas: TJvUIBDataSet;
//    Proc_TribProdUF: TJvUIBQuery;
    Src_Aliquotas: TDatasource;
    Edit_Tributacao: TEdit;
    Edit_Icm_Ecf: TEdit;
    Edit_IPI: TEdit;
    Edit_SubstTrib: TEdit;
    Edit_RedICM: TEdit;
    Edit_ICM: TEdit;
    Edit_ClassFiscal: TEdit;
    Edit_ClassIPI: TEdit;
    Edit_OBS: TEdit;
    Edit_PCodigo: TEdit;
    Edit_SitTrib: TEdit;
    Edit_UF: TEdit;
    F3_Situacao: TSpeedButton;
    F3_Tributacao: TSpeedButton;
//    JvQry_Pes: TJvUIBDataSet;
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    NaoLimpar2: TCheckBox;
    Paginas: TPageControl;
    PanelSitTrib: TPanel;
    PanelTributacao: TPanel;
//    Proc_TribProd: TJvUIBQuery;
    TabAliq: TTabSheet;
    TabCadastro: TTabSheet;
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
    BtnSairPes: TBitBtn;
    Panel7: TPanel;
    Panel8: TPanel;
    PageCadastro: TPageControl;
    TabTrib: TTabSheet;
    Label1: TLabel;
    NaoLimpar: TCheckBox;
    Label2: TLabel;
    Edit_Nome: TEdit;
    Panel5: TPanel;
    TreeView1: TTreeView;
    procedure DBGrid_AliquotasDblClick(Sender: TObject);
    procedure Edit_SitTribKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure Edit_TributacaoKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    function  GetFieldList: TStringList;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
//    procedure Carrega_Parametros(Proc : TJvUIBQuery);
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Edit_PCodigoExit(Sender: TObject);
    procedure Edit_UFExit(Sender: TObject);
    procedure Edit_SitTribExit(Sender: TObject);
    procedure Edit_TributacaoExit(Sender: TObject);
    procedure PageCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure F3_TributacaoClick(Sender: TObject);
    procedure F3_SituacaoClick(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    Procedure Carrega_Aliquotas(aTributacao: Integer);
    
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
  FrmTribProd: TFrmTribProd;
  FieldList: TStringList;

implementation

uses TreeFunc,UPrincipal, Global, UConsulta, UVariaveis;


procedure TFrmTribProd.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case voper of
       opInsert : begin
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnSair.Enabled := False;
                     if PageCadastro.ActivePageIndex = 0 then
                     begin
                        Campo1.Enabled := True;
                        NaoLimpar.Enabled := True;
                     end
                     else
                     begin
                        Edit_Tributacao.Enabled := True;
                        F3_Tributacao.Enabled := True;
                        Edit_UF.Enabled := True;
                        NaoLimpar2.Enabled := True;
                     end;
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     if PageCadastro.ActivePageIndex = 0 then
                     begin
                        Campo1.Enabled := False;
                        NaoLimpar.Enabled := False;
                     end
                     else
                     begin
                        Edit_Tributacao.Enabled := False;
                        F3_Tributacao.Enabled := False;
                        Edit_UF.Enabled := False;
                        NaoLimpar2.Enabled := False;
                     end;
                  end;
    end;
  end;
end;

function TFrmTribProd.GetFieldList: TStringList;
begin                        {
     FieldList.Clear;
     FieldList.add(JvQry_Pes.FieldByName('Codigo').asString + ' - ' + JvQry_Pes.FieldByName('NOME').asString);
     if Trim(JvQry_Pes.FieldByName('UF').asString) <> '' then
        FieldList.add(JvQry_Pes.FieldByName('UF').asString);
     Result := FieldList;   }
end;

procedure TFrmTribProd.DBGrid_AliquotasDblClick(Sender: TObject);
begin     {
   if (JvQry_Aliquotas.Active) and (JvQry_Aliquotas.Recordcount > 0) then
   begin
      PageCadastro.ActivePageIndex := 1;
      Carrega_Campos(JvQry_Aliquotas);
   end;  }
end;

procedure TFrmTribProd.Edit_SitTribKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then F3_SituacaoClick(Self);
end;

procedure TFrmTribProd.Edit_TributacaoKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F3 then F3_TributacaoClick(Self);
end;

procedure TFrmTribProd.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmTribProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   JvQry_Pes.close;
  // JvQry_Aliquotas.close;;
   Action := caFree;
end;

procedure TFrmTribProd.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmTribProd.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   if PageCadastro.ActivePageIndex = 0 then
   begin
//      JvQry_Aliquotas.Close;
      FrmPrincipal.LimpaCampos(self,1);
//      if Parametros.Busca_Chave = 1 then Campo1.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_TRIBPRODUTOS'));
      if Campo1.Enabled then Campo1.SetFocus;
   end
   else
   begin
      FrmPrincipal.LimpaCampos(self,3);
      Edit_RedICM.Text := '100';
      Edit_TributacaoExit(self);
      Edit_SitTribExit(self);
      Edit_Tributacao.SetFocus;
   end;
end;

procedure TFrmTribProd.BtnGravaClick(Sender: TObject);
begin
   if PageCadastro.ActivePageIndex = 0 then
   begin
      //Codigo
      if Length(Trim(Campo1.Text)) > 0 then
      begin
         if not ValNumero(Campo1.Text) then
         begin
            MessageDlg('Código deve ser número inteiro válido.', mtInformation,[mbOK],0);
            if Campo1.Enabled then Campo1.SetFocus;
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
   end
   else
   begin
      //Trib
      if (Length(Trim(Edit_Tributacao.Text)) = 0) or (Trim(Edit_Tributacao.Text) = '0') then
      begin
         MessageDlg('Tributação deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_Tributacao.SetFocus;
         Exit;
      end;
      //Uf
      if Length(Trim(Edit_UF.Text)) = 0 then
      begin
         MessageDlg('UF deve ser preenchido.', mtInformation,[mbOK],0);
         Edit_UF.SetFocus;
         Exit;
      end;
      //base de Cálculo (Reduzido uo integral)
      if (StrToFloatZero(Edit_RedICM.Text) <= 0) or (StrToFloatZero(Edit_RedICM.Text) > 100) then
      begin
         MessageDlg('Base de Cálculo deve ser entre 1% e 100%.', mtInformation,[mbOK],0);
         Edit_RedICM.SetFocus;
         Exit;
      end;
      //Situacao
      if Combo_Situa_Icm.ItemIndex = -1 then
      begin
         MessageDlg('Situação Qto. ICMS deve ser preenchida.', mtInformation,[mbOK],0);
         Combo_Situa_Icm.SetFocus;
         Combo_Situa_Icm.DroppedDown := True;
         Exit;
      end;
      //se situacao <> tributado nao pode ter nada no icm_ecf
      if (Combo_Situa_Icm.ItemIndex <> 0) and (StrToFloatZero(Edit_Icm_Ecf.Text) > 0) then
      begin
         MessageDlg('Se Situação Qto. ICMS for "'+ Combo_Situa_Icm.Items[Combo_Situa_Icm.ItemIndex] +'" então o ICMS para ECF deve ser 0 (Zero).', mtInformation,[mbOK],0);
         Edit_Icm_Ecf.SetFocus;
         Exit;
      end;
   end;
   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   if PageCadastro.ActivePageIndex = 0 then
   begin                                   {
      Carrega_Parametros(Proc_TribProd);
      FrmPrincipal.RodaSP(Proc_TribProd); }
   end
   else
   begin                                     {
      Carrega_Parametros(Proc_TribProdUF);
      FrmPrincipal.RodaSP(Proc_TribProdUF); }
   end;
   Operacao := opBrowse;
   if (NaoLimpar.Checked) or (NaoLimpar2.Checked) then
   begin
      Operacao := opInsert;
      if PageCadastro.ActivePageIndex = 0 Then
      begin
         Campo1.Text := '0';
         if Campo1.Enabled then Campo1.SetFocus;
      end
      else
      begin
         Edit_UF.Text := '';
         Edit_UF.SetFocus;
      end;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;
{
procedure TFrmTribProd.Carrega_Parametros(Proc : TJvUIBQuery);
begin
   with Proc do
   begin
      if PageCadastro.ActivePageIndex = 0 then
      begin
         Params.ByNameAsInteger['POPER'] := Operacao;
         Params.ByNameasInteger['PCODIGO'] := StrToIntZero(Campo1.Text);
         Params.ByNameasString['PNOME'] := Edit_Nome.Text;
      end
      else
      begin
         Params.ByNameasInteger['POPER'] := Operacao;
         Params.ByNameasInteger['PTRIBPROD'] := StrToIntZero(Edit_Tributacao.Text);
         Params.ByNameasString['PUF'] := Edit_UF.Text;
         Params.ByNameAsCurrency['PPERC_ICM'] := StrToFloatZero(Edit_ICM.Text);
         Params.ByNameAsCurrency['PREDU_ICM'] := StrToFloatZero(Edit_RedICM.Text);
         Params.ByNameasString['PCLAS_FISC'] := Edit_ClassFiscal.Text;
         Params.ByNameasString['PCOD_STRIB'] := Edit_SitTrib.Text;
         Params.ByNameAsCurrency['PPERC_IPI'] := StrToFloatZero(Edit_IPI.Text);
         Params.ByNameasString['PCLASS_IPI'] := Edit_ClassIPI.Text;
         Params.ByNameAsCurrency['PPERC_SUBS'] := StrToFloatZero(Edit_SubstTrib.Text);
         Params.ByNameAsCurrency['PICM_ECF'] := StrToFloatZero(Edit_Icm_Ecf.Text);
         Params.ByNameAsCurrency['PSITUA_ICM'] := Combo_Situa_Icm.ItemIndex;
         Params.ByNameasString['POBSERVAC'] := Edit_OBS.Text;
      end;
   end;
end; }

procedure TFrmTribProd.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataSet do
   begin
      if PageCadastro.ActivePageIndex = 0 then
      begin
         Campo1.Text := FieldByName('CODIGO').asString;
         Edit_Nome.Text := FieldByName('NOME').asString;
         //Aliquotas
         Carrega_Aliquotas(StrToIntZero(Trim(Campo1.Text)));
      end
      else
      begin
         Edit_Tributacao.Text := FieldByName('TRIBPROD').asString;
         Edit_TributacaoExit(Self);
         Edit_UF.Text := FieldByName('UF').asString;
         Edit_ICM.Text := FieldByName('PERC_ICM').asString;
         Edit_RedICM.Text := FieldByName('REDU_ICM').asString;
         Edit_ClassFiscal.Text := FieldByName('CLAS_FISC').asString;
         Edit_SitTrib.Text := FieldByName('COD_STRIB').asString;
         Edit_SitTribExit(Self);
         Edit_IPI.Text := FieldByName('PERC_IPI').AsString;
         Edit_ClassIPI.Text := FieldByName('CLASS_IPI').asString;
         Edit_SubstTrib.Text := FieldByName('PERC_SUBS').asString;
         Edit_Icm_Ecf.Text := FieldByName('ICM_ECF').asString;
         Combo_Situa_Icm.ItemIndex := FieldByName('SITUA_ICM').asInteger;
         Edit_OBS.Text := FieldByName('OBSERVAC').asString;
      end;
   end;
end;

procedure TFrmTribProd.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmTribProd.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   if PageCadastro.ActivePageIndex = 0 then
   begin
//      JvQry_Aliquotas.Close;
      FrmPrincipal.LimpaCampos(self,1);
   end
   else
   begin
      FrmPrincipal.LimpaCampos(self,3);
      Edit_TributacaoExit(self);
      Edit_SitTribExit(self);
   end;
   BtnInclui.SetFocus;
end;

procedure TFrmTribProd.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin  {
   JvQry_Aliquotas.Close;
   If Length(Trim(Campo1.Text)) <> 0 then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from TRIBPRODUTOS where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
            //Aliquotas
            Carrega_Aliquotas(StrToIntZero(Trim(Campo1.Text)));
         end;
      except
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Campo1.text := '0';
   end; }
end;

procedure TFrmTribProd.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
   FieldList := TStringList.Create;
   Campo1.Text:= '0';
   Edit_PCodigo.Text := '0';
{   
   Proc_TribProd.DataBase := FrmPrincipal.base;
   Proc_TribProd.Transaction := FrmPrincipal.transaction;
   Proc_TribProd.BuildStoredProc('PROC_TRIBPRODUTOS');

   Proc_TribProdUF.DataBase := FrmPrincipal.base;
   Proc_TribProdUF.Transaction := FrmPrincipal.Transaction;
   Proc_TribProdUF.BuildStoredProc('PROC_TRIBPRODUF');

   //PageCadastro.ActivePageIndex := 0;
   //Proc.BuildStoredProc('PROC_TRIBPRODUTOS');
   jvqry_pes.database := frmprincipal.base;
   jvqry_pes.transaction := frmprincipal.transaction;

   JvQry_Aliquotas.Database := frmprincipal.base;
   JvQry_Aliquotas.Transaction := frmprincipal.transaction;
   JvQry_Aliquotas.SQL.Add('Select * from TribProdUF where TribProd = :Tributacao'); }
   BtnInclui.SetFocus;             
end;

procedure TFrmTribProd.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
    I : Integer;
begin
   vSelect := '';
   vSelect := vSelect + ' Select * ';
   vSelect := vSelect + ' from TribProdUF ';
   vSelect := vSelect + ' right join TribProdutos on TribProdUF.TribProd = TribProdutos.Codigo ';
   
   CRI := '';
   If (Length(Trim(Edit_PCodigo.Text)) > 0) and (Trim(Edit_PCodigo.Text) <> '0') then
   begin
      CRI := CRI + ' and Codigo = '+ Trim(Edit_PCodigo.Text) +' ';
   end;
   If Length(Trim(Edit_PDescricao.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Nome) like Upper(''%'+ Trim(Edit_PDescricao.Text) +'%'')';
   end;
   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by nome, uf ';
   
   datasource.dataset := nil;
   //Grid_Pesquisa.DataSource := nil;
              {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      datasource.dataset := (jvqry_pes as Tdataset);
      //Grid_Pesquisa.DataSource := Datasource1;
      TreeView1.Items.BeginUpdate;
      TreeView1.Items.Clear;
      JvQry_Pes.Last;
      JvQry_Pes.First;
      while not JvQry_Pes.Eof do
      //for I := 0 to JvQry_Pes.RecordCount do
      begin
         TreeAddItem(TreeView1, GetFieldList, Nil, False);
         JvQry_Pes.Next;
      end;
      FieldList.Clear;
      //TreeView1.Alphasort;
      TreeView1.Items.EndUpdate;
      TreeView1.Items[0].Selected := True;
   end;      }
end;

procedure TFrmTribProd.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin {
   JvQuery := TJvUIBDataset.Create(Self);
   JvQuery.Database := FrmPrincipal.Base;
   JvQuery.Transaction := FrmPrincipal.Transaction;
   try
      if PageCadastro.ActivePageIndex = 0 then
      begin
         If Length(Trim(Campo1.Text)) <> 0 then
         begin
            if not FrmPrincipal.RodaConsulta('Select * from TRIBPRODUTOS where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               Operacao := opDelete;
               Carrega_Campos(JvQuery);
               if MessageDlg('Confirma exclusão de '+ Edit_Nome.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
               begin
                  if PageCadastro.ActivePageIndex = 0 then
                  begin
                     Carrega_Parametros(Proc_TribProd);
                     FrmPrincipal.RodaSP(Proc_TribProd);
                  end
                  else
                  begin
                     Carrega_Parametros(Proc_TribProdUF);
                     FrmPrincipal.RodaSP(Proc_TribProdUF);
                  end;
                  JvQry_Aliquotas.Close;
                  FrmPrincipal.LimpaCampos(self,1);
               end;
               Operacao := opBrowse;
            end
            else
            begin
               MessageDlg('Tributação com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
               JvQry_Aliquotas.Close;
               FrmPrincipal.LimpaCampos(Self,1);
            end;
            BtnInclui.SetFocus;
         end;
      end
      else
      begin
         If (Length(Trim(Edit_Tributacao.Text)) <> 0) and (Length(Trim(Edit_UF.Text)) <> 0) then
         begin
            if not FrmPrincipal.RodaConsulta('Select * from TRIBPRODUF where TRIBPROD='+ Edit_Tributacao.Text +' and UF='''+ Edit_UF.Text +'''',JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               Operacao := opDelete;
               Carrega_Campos(JvQuery);
               if MessageDlg('Confirma exclusão da Tributação: '+ PanelTributacao.Caption + ' - UF: '+ Edit_UF.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
               begin
                  if PageCadastro.ActivePageIndex = 0 then
                  begin
                     Carrega_Parametros(Proc_TribProd);
                     FrmPrincipal.RodaSP(Proc_TribProd);
                  end
                  else
                  begin
                     Carrega_Parametros(Proc_TribProdUF);
                     FrmPrincipal.RodaSP(Proc_TribProdUF);
                  end;
                  JvQry_Aliquotas.Close;
                  FrmPrincipal.LimpaCampos(Self,3);
                  Edit_TributacaoExit(self);
                  Edit_SitTribExit(self);
               end;
               Operacao := opBrowse;
            end
            else
            begin
               MessageDlg('Alíquota "'+ Edit_UF.Text +'" da Tributação "'+ PanelTributacao.Caption +'" não encontrada.',mtConfirmation,[mbOk],0);
               JvQry_Aliquotas.Close;
               FrmPrincipal.LimpaCampos(Self,3);
               Edit_TributacaoExit(self);
               Edit_SitTribExit(self);
            end;
            BtnInclui.SetFocus;
         end;
      end;
   finally
      JvQuery.Close;
      JvQuery.Free;
   end;      }
end;

procedure TFrmTribProd.PaginasChange(Sender: TObject);
   Procedure Localiza_Reg(Codigo,UF : String);
   var I : Integer;
   begin     {
      JvQry_Pes.First;
      For I := 1 to JvQry_Pes.RecordCount do
      begin
         if (JvQry_Pes.FieldByName('CODIGO').AsString = Codigo) and
            (JvQry_Pes.FieldByName('UF').AsString = UF) then
         begin
            Exit;
         end;
         JvQry_Pes.Next;
      end;  }
   end;
begin
   if Paginas.ActivePageIndex = 0 then
   begin
      if TreeView1.Items.Count = 0 then exit;
      PageCadastro.ActivePageIndex := TreeView1.Selected.Level;
      if TreeView1.Selected.Level = 0 then
      begin
         Campo1.Text := Trim(Copy(TreeView1.Selected.Text,1,Pos('-',TreeView1.Selected.Text)-1));
         Campo1Exit(self);
      end
      else
      begin
         Localiza_Reg(Trim(Copy(TreeView1.Selected.Parent.Text,1,Pos('-',TreeView1.Selected.Parent.Text)-1)),TreeView1.Selected.Text);
//         Carrega_Campos(JvQry_Pes);
      end;
   end;
end;

procedure TFrmTribProd.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(Self,2);
  // JvQry_Pes.Close;
   datasource.dataset := nil;
   TreeView1.Items.Clear;
   BtnAtualiza.SetFocus;
end;

procedure TFrmTribProd.Edit_PCodigoExit(Sender: TObject);
begin
   If Length(Trim(Campo1.Text)) = 0 then
      Campo1.Text := '0';
end;

procedure TFrmTribProd.Edit_UFExit(Sender: TObject);
// var JvPesquisa : TJvUIBDataSet;
begin    {
   If Length(Trim(Edit_UF.Text)) <> 0 then
   begin
      JvPesquisa := TJvUIBDataSet.Create(Self);
      JvPesquisa.Database := FrmPrincipal.Base;
      JvPesquisa.Transaction := FrmPrincipal.Transaction;
      try
         if not FrmPrincipal.RodaConsulta('Select * from TRIBPRODUF where TribProd='+ Edit_Tributacao.Text +' and UF='''+ Edit_UF.Text +'''',JvPesquisa) then Exit;
         if JvPesquisa.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvPesquisa);
         end;
      finally
         JvPesquisa.Close;
         JvPesquisa.Free;
      end;
   end; }
end;

procedure TFrmTribProd.Edit_SitTribExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Edit_SitTrib.Text)) <> 0 then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from SITTRIBUTARIA where Codigo='''+ Trim(Edit_SitTrib.Text) +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelSitTrib.Caption := JvQuery.FieldByName('Nome').asString;
         end
         else
         begin
            MessageDlg('Situação não cadastrada.',mtInformation,[mbOK],0);
            PanelSitTrib.Caption := '';
            Edit_SitTrib.SetFocus;
         end;
      except
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_SitTrib.Text:= '';
      PanelSitTrib.Caption := '';
   end;
end;

procedure TFrmTribProd.Edit_TributacaoExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If (Length(Trim(Edit_Tributacao.Text)) > 0) and (Trim(Edit_Tributacao.Text) <> '0') then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Codigo, Nome from TRIBPRODUTOS where Codigo='+ Trim(Edit_Tributacao.Text)+'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            PanelTributacao.Caption := JvQuery.FieldByName('Nome').asString;
         end
         else
         begin
            MessageDlg('Tributação não cadastrada.',mtInformation,[mbOK],0);
            PanelTributacao.Caption := '';
            Edit_Tributacao.SetFocus;
         end;
      except
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Tributacao.Text:= '0';
      PanelTributacao.Caption := '';
   end;
end;

procedure TFrmTribProd.PageCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmTribProd.F3_TributacaoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from TRIBPRODUTOS';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Tributação';
      if FrmPesquisa.ShowModal = mrOK then
      begin
//         Edit_Tributacao.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_TributacaoExit(Self);
         Edit_Tributacao.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmTribProd.F3_SituacaoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from SITTRIBUTARIA';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Situação Tributária';
      if FrmPesquisa.ShowModal = mrOK then
      begin
  //       Edit_SitTrib.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_SitTribExit(Self);
         Edit_SitTrib.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmTribProd.TreeView1DblClick(Sender: TObject);
begin
   if TreeView1.Selected.Level = 1 then
   begin
      Paginas.ActivePageIndex := 0;
      PaginasChange(self);
   end;    
end;

Procedure TFrmTribProd.Carrega_Aliquotas(aTributacao: Integer);
begin    {
   with JvQry_Aliquotas do
   begin
      if aTributacao = 0 then
      begin
         Src_Aliquotas.DataSet := Nil;
         DBGrid_Aliquotas.DataSource := Nil;
         Close;
      end
      else
      begin
         Src_Aliquotas.DataSet := Nil;
         DBGrid_Aliquotas.DataSource := Nil;
         Close;
         Params.ByNameAsInteger['Tributacao'] := aTributacao;
         Open;
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Aliquotas.DataSet := JvQry_Aliquotas;
            DBGrid_Aliquotas.DataSource := Src_Aliquotas;
         end;
      end;
   end; }
end;

initialization
  {$i utribprod.lrs}

end.
