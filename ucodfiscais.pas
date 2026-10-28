unit UCodFiscais;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db, ActnList,
  LResources, MaskEdit, LCLType;


type
  TFrmCodFiscais = class(TForm)
     Datasource1: TDatasource;
     Grid_Pesquisa: TdbGrid;
    // JvQry_Pes: TJvUIBDataSet;
    Paginas: TPageControl;
 //   Proc: TJvUIBQuery;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    TabPesquisa: TTabSheet;
    Panel1: TPanel;
    Panel4: TPanel;
    BtnImprime: TBitBtn;
    BtnLimpa: TBitBtn;
    BtnAjudaPes: TBitBtn;
    BtnAtualiza: TBitBtn;
    NaoLimpar: TCheckBox;
    BtnSairPes: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    Label3: TLabel;
    Campo1: TMaskEdit;
    Label4: TLabel;
    Edit_Descricao: TEdit;
    RG_Tipo: TRadioGroup;
    RG_Calc_Icms: TRadioGroup;
    RG_Calc_Subs: TRadioGroup;
    RG_Calc_Ipi: TRadioGroup;
    RG_Calc_Funr: TRadioGroup;
    Label1: TLabel;
    Edit_PCodigo: TMaskEdit;
    Label2: TLabel;
    Edit_PDescricao: TEdit;
    Label28: TLabel;
    Edit_SitTrib: TEdit;
    F3_Situacao: TSpeedButton;
    PanelSitTrib: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure Edit_SitTribKeyDown(Sender: TObject;
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
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Campo1Enter(Sender: TObject);
    procedure Edit_PCodigoExit(Sender: TObject);
    procedure Edit_SitTribExit(Sender: TObject);
    procedure F3_SituacaoClick(Sender: TObject);
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
  FrmCodFiscais: TFrmCodFiscais;

implementation

uses UPrincipal, Global, UConsulta;


procedure TFrmCodFiscais.SetOper(const Value: Integer);
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


procedure TFrmCodFiscais.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmCodFiscais.Edit_SitTribKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_F3 then F3_SituacaoClick(Self);
end;

procedure TFrmCodFiscais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmCodFiscais.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmCodFiscais.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
   Edit_SitTribExit(Self);
   Campo1.SetFocus;
end;

procedure TFrmCodFiscais.BtnGravaClick(Sender: TObject);
begin
   //Codigo
   if (Length(Trim(Campo1.Text)) = 0) or (Trim(Campo1.Text) = '.  .') then
   begin
      MessageDlg('Código deve ser preenchido.', mtInformation,[mbOK],0);
      Campo1.SetFocus;
      Exit;
   end;
   //Descricao
   if Length(Trim(Edit_Descricao.Text)) = 0 then
   begin
      MessageDlg('Descrição deve ser preenchida.', mtInformation,[mbOK],0);
      Edit_Descricao.SetFocus;
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
      Campo1.Text := '';
      Campo1.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmCodFiscais.Carrega_Parametros;
begin      {
   with Proc do
   begin
      Params.ByNameAsInteger['POPER'] := Operacao;
      Params.ByNameAsString['PCODIGO'] := Campo1.Text;
      Params.ByNameAsString['PDESCRICAO'] := Edit_Descricao.Text;
      Params.ByNameAsInteger['PTIPO'] := RG_Tipo.ItemIndex;
      Params.ByNameAsInteger['PCALC_ICMS'] := RG_Calc_Icms.ItemIndex;
      Params.ByNameAsInteger['PCALC_IPI'] := RG_Calc_Ipi.ItemIndex;
      Params.ByNameAsInteger['PCALC_SUBS'] := RG_Calc_Subs.ItemIndex;
      Params.ByNameAsInteger['PCALC_FUNR'] := RG_Calc_Funr.ItemIndex;
      if Trim(Edit_SitTrib.Text) = '' then
         Params.ByNameIsNull['PCOD_SITTRIB'] := True
      else
         Params.ByNameAsString['PCOD_SITTRIB'] := Edit_SitTrib.Text;
      
   end;  }
end;

procedure TFrmCodFiscais.Carrega_Campos(oDataSet: TDataSet);
begin
   //
   with oDataSet do
   begin
      Campo1.Text := FieldByName('CODIGO').asString;
      Edit_Descricao.Text := FieldByName('DESCRICAO').asString;
      RG_Tipo.ItemIndex := FieldByName('TIPO').asInteger;
      RG_Calc_Icms.ItemIndex := FieldByName('CALC_ICMS').asInteger;
      RG_Calc_Ipi.ItemIndex := FieldByName('CALC_IPI').asInteger;
      RG_Calc_Subs.ItemIndex := FieldByName('CALC_SUBS').asInteger;
      RG_Calc_Funr.ItemIndex := FieldByName('CALC_FUNR').asInteger;
      Edit_SitTrib.Text := FieldByName('COD_SITTRIB').AsString;
      Edit_SitTribExit(Self);
   end;
end;

procedure TFrmCodFiscais.Grid_PesquisaDblClick(Sender: TObject);
begin      {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
   end;  }
end;

procedure TFrmCodFiscais.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmCodFiscais.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   Edit_SitTribExit(Self);
   BtnInclui.SetFocus;
end;

procedure TFrmCodFiscais.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   if Trim(Campo1.Text) = '.  .' then
   begin
      Campo1.EditMask := '';
   end;
   If Length(Trim(Campo1.Text)) > 0 then
   begin     {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from CodFiscais where Codigo='''+ Campo1.Text +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;   }
   end
   else
   begin
      Campo1.Text := '';
   end;
end;

procedure TFrmCodFiscais.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
   Campo1.Text:= '';
   Edit_PCodigo.Text := '';    {
   Proc.database := frmprincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_CODFISCAIS');
   jvqry_pes.database := frmprincipal.base;
   jvqry_pes.transaction := frmprincipal.transaction;    }
   BtnInclui.SetFocus;
end;

procedure TFrmCodFiscais.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := 'Select * from CodFiscais ';

   CRI := '';
   If (Length(Trim(Edit_PCodigo.Text)) > 0) and (Trim(Edit_PCodigo.Text) <> '.  .') then
   begin
      CRI := CRI + ' and Codigo = '''+ Trim(Edit_PCodigo.Text) +''' ';
   end;
   If Length(Trim(Edit_PDescricao.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Descricao) like Upper(''%'+ Trim(Edit_PDescricao.Text) +'%'')';
   end;
   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by Codigo ';

   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
            {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      datasource1.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource1;
   end;       }
end;

procedure TFrmCodFiscais.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin   {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from CodFiscais where Codigo='''+ Campo1.Text +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão de '+ Edit_Descricao.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               FrmPrincipal.LimpaCampos(self,1);
               Edit_SitTribExit(Self);
            end;
            Operacao := opBrowse;
         end
         else
         begin
            MessageDlg('Codigo Fiscal com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
            Edit_SitTribExit(Self);
         end;
         BtnInclui.SetFocus;
      except
         JvQuery.Close;
         JvQuery.Free;
      end;   }
   end;
end;

procedure TFrmCodFiscais.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmCodFiscais.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
 //  JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmCodFiscais.Campo1Enter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '9.999.9;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmCodFiscais.Edit_PCodigoExit(Sender: TObject);
begin
   if Trim(Edit_PCodigo.Text) = '.   .' then
   begin
      Edit_PCodigo.EditMask := '';
   end;
end;

procedure TFrmCodFiscais.Edit_SitTribExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Edit_SitTrib.Text)) <> 0 then
   begin   {
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

procedure TFrmCodFiscais.F3_SituacaoClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := 'Select CODIGO as Codigo, NOME as Nome from SITTRIBUTARIA';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'CODIGO';
      FrmPesquisa.Caption := 'Situação Tributária';
      if FrmPesquisa.ShowModal = mrOK then
      begin
      //   Edit_SitTrib.Text := FrmPesquisa.JvQuery.FieldByName(FrmPesquisa.Campo_Retorno).asString;
         Edit_SitTribExit(Self);
         Edit_SitTrib.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;


procedure TFrmCodFiscais.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('CodFiscais',IBQry_Pes);
end;

initialization
   {$i ucodfiscais.lrs}

end.
