unit UImpressoras;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons,
  ComCtrls, ImgList, Db, LResources;
  
type
  TFrmImpressoras = class(TForm)
     Datasource1: TDatasource;
     Grid_Pesquisa: TdbGrid;
     Edit_QtdLinhas: TEdit;
     Edit_EspacoLinhas: TEdit;
{     JvQry_Pes: TJvUIBDataSet;
     JvProc_Clona_Impressora: TJvUIBQuery;
     JvTransaction: TJvUIBTransaction;}
    Paginas: TPageControl;
 //   Proc: TJvUIBQuery;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    TabPesquisa: TTabSheet;
    Panel1: TPanel;
    Label61: TLabel;
    Panel4: TPanel;
    BtnImprime: TBitBtn;
    BtnLimpa: TBitBtn;
    BtnAjudaPes: TBitBtn;
    BtnAtualiza: TBitBtn;
    Edit_PNome: TEdit;
    NaoLimpar: TCheckBox;
    BtnSairPes: TBitBtn;
    Label6: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    TabSheet3: TTabSheet;
    Panel9: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    TabSheet4: TTabSheet;
    Panel10: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    TabSheet5: TTabSheet;
    Panel11: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    TabSheet6: TTabSheet;
    Panel3: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    TabSheet7: TTabSheet;
    Panel5: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    TabSheet8: TTabSheet;
    Panel6: TPanel;
    Label8: TLabel;
    TabSheet9: TTabSheet;
    Panel12: TPanel;
    Label9: TLabel;
    Panel8: TPanel;
    BtnInclui: TBitBtn;
    BtnExclui: TBitBtn;
    BtnAjuda: TBitBtn;
    BtnSair: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    Campo1: TEdit;
    Edit_Ativa_c175: TEdit;
    Edit_Desativa_c175: TEdit;
    Edit_Ativa_c20: TEdit;
    Edit_Desativa_c20: TEdit;
    Edit_Ativa_E12: TEdit;
    Edit_Desativa_E12: TEdit;
    Edit_Ativa_Negrito: TEdit;
    Edit_Desativa_Negrito: TEdit;
    Edit_LinPP: TEdit;
    Edit_Ejeta: TEdit;
    Edit_Ativa_8Lin: TEdit;
    Edit_Desativa_8Lin: TEdit;
    Edit_Desativa_Expandido: TEdit;
    Edit_Ativa_Expandido: TEdit;
    SB_Clone: TSpeedButton;
    Combo_Porta: TComboBox;
    Label1: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Edit_PNomeChange(Sender: TObject);
    procedure SB_CloneClick(Sender: TObject);
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
  FrmImpressoras: TFrmImpressoras;

implementation

uses UPrincipal, Global;


procedure TFrmImpressoras.SetOper(const Value: Integer);
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
                     SB_Clone.Enabled := False;
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     Campo1.Enabled := False;
                     NaoLimpar.Enabled := False;
                     SB_Clone.Enabled := True;
                  end;
    end;
  end;
end;


procedure TFrmImpressoras.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmImpressoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmImpressoras.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmImpressoras.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
   ComBo_Porta.ItemIndex := 0;
   Campo1.SetFocus;
end;

procedure TFrmImpressoras.BtnGravaClick(Sender: TObject);
begin
   //Nome
   if Length(Trim(Campo1.Text)) = 0 then
   begin
      MessageDlg('Nome deve ser preenchido.', mtInformation,[mbOK],0);
      Campo1.SetFocus;
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
   FrmPrincipal.Carrega_Impressoras;
end;

procedure TFrmImpressoras.Carrega_Parametros;
begin      {
   with Proc do
   begin
      Params.ByNameAsInteger['POPER']         := Operacao;
      Params.ByNameAsString['PNOME']          := Campo1.Text;
      Params.ByNameAsString['PPORTA']         := Combo_Porta.Text;
      Params.ByNameAsString['PPCOMPR175']     := Edit_Ativa_c175.Text;
      Params.ByNameAsString['PTCOMPR175']     := Edit_Desativa_c175.Text;
      Params.ByNameAsString['PPCOMPR20']      := Edit_Ativa_c20.Text;
      Params.ByNameAsString['PTCOMPR20']      := Edit_Desativa_c20.Text;
      Params.ByNameAsString['PPELITE12']      := Edit_Ativa_E12.Text;
      Params.ByNameAsString['PTELITE12']      := Edit_Desativa_E12.Text;
      Params.ByNameAsString['PPNEGRITO']      := Edit_Ativa_Negrito.Text;
      Params.ByNameAsString['PTNEGRITO']      := Edit_Desativa_Negrito.Text;
      Params.ByNameAsString['PPEXPAND']       := Edit_Ativa_Expandido.Text;
      Params.ByNameAsString['PTEXPAND']       := Edit_Desativa_Expandido.Text;
      Params.ByNameAsString['PP8LINPOL']      := Edit_Ativa_8Lin.Text;
      Params.ByNameAsString['PT8LINPOL']      := Edit_Desativa_8Lin.Text;
      Params.ByNameAsString['PPEJETAR']       := Edit_Ejeta.Text;
      Params.ByNameAsString['PPLINPPAG']      := Edit_LinPP.Text;
      Params.ByNameAsInteger['PQTLINHAS']     := StrToIntZero(Edit_QtdLinhas.Text);
      Params.ByNameAsInteger['PESPACOLINHAS'] := StrToIntZero(Edit_EspacoLinhas.Text);
   end;   }
end;

procedure TFrmImpressoras.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataSet do
   begin
      Campo1.Text := FieldByName('NOME').asString;
      Combo_Porta.Text := FieldByName('PORTA').asString;
      Edit_Ativa_c175.Text := FieldByName('PCOMPR175').asString;
      Edit_Desativa_c175.Text := FieldByName('TCOMPR175').asString;
      Edit_Ativa_c20.Text := FieldByName('PCOMPR20').asString;
      Edit_Desativa_c20.Text := FieldByName('TCOMPR20').asString;
      Edit_Ativa_E12.Text := FieldByName('PELITE12').asString;
      Edit_Desativa_E12.Text := FieldByName('TELITE12').asString;
      Edit_Ativa_Negrito.Text := FieldByName('PNEGRITO').asString;
      Edit_Desativa_Negrito.Text := FieldByName('TNEGRITO').asString;
      Edit_Ativa_Expandido.Text := FieldByName('PEXPAND').asString;
      Edit_Desativa_Expandido.Text := FieldByName('TEXPAND').asString;
      Edit_Ativa_8Lin.Text := FieldByName('P8LINPOL').asString;
      Edit_Desativa_8Lin.Text := FieldByName('T8LINPOL').asString;
      Edit_Ejeta.Text := FieldByName('PEJETAR').asString;
      Edit_LinPP.Text := FieldByName('PLINPPAG').asString;
      Edit_QtdLinhas.Text := FieldByName('QTLINHAS').AsString;
      Edit_EspacoLinhas.Text := FieldByName('ESPACOLINHAS').AsString;
   end;
end;

procedure TFrmImpressoras.Grid_PesquisaDblClick(Sender: TObject);
begin
{   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
   end;  }
end;

procedure TFrmImpressoras.PageControl1Change(Sender: TObject);
begin

end;

procedure TFrmImpressoras.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmImpressoras.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   BtnInclui.SetFocus;
end;

procedure TFrmImpressoras.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
{
   Proc.DataBase := FrmPrincipal.base;
   Proc.Transaction := FrmPrincipal.Transaction;
   Proc.BuildStoredProc('PROC_IMPRESSORAS');
   JvQry_Pes.database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;
   
   JvTransaction.DataBase := FrmPrincipal.base;
   JvProc_Clona_Impressora.DataBase := frmprincipal.base;
   JvProc_Clona_Impressora.Transaction := frmprincipal.transaction;
   JvProc_Clona_Impressora.BuildStoredProc('PROC_CLONAR_IMPRESSORA');}
   
   Campo1.Text:= '';
   BtnInclui.SetFocus;
end;

procedure TFrmImpressoras.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := 'Select * from Impressoras ';

   CRI := '';
   If Length(Trim(Edit_PNome.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Nome) like Upper(''%'+ Trim(Edit_PNome.Text) +'%'')';
   end;
   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by Nome ';

   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
         {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      datasource1.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource1;
   end; }
end;

procedure TFrmImpressoras.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) > 0 then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from Impressoras where Nome = '''+ Campo1.Text +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão de '+ Campo1.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               FrmPrincipal.LimpaCampos(self,1);
            end;
            Operacao := opBrowse;
         end
         else
         begin
            MessageDlg('Impressora com Nome "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
         end;
         BtnInclui.SetFocus;
      except
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end;
end;

procedure TFrmImpressoras.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmImpressoras.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
//    JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmImpressoras.Edit_PNomeChange(Sender: TObject);
begin

end;

procedure TFrmImpressoras.SB_CloneClick(Sender: TObject);
var Impressora_Nova : string;
begin
   if Campo1.Text = '' then
   begin
      MessageDlg('Impressora Inválida. Você deve primeiro carregar uma impressora.', mtWarning, [mbOK],0);
      Exit;
   end;

   Impressora_Nova := InputBox('Impressoras', 'Digite o Nome da nova Impressora', 'Impr_Usuario');
   if Trim(Impressora_Nova) <> ''then
   begin           {
      if JvTransaction.InTransaction then
         JvTransaction.Rollback;
      JvTransaction.StartTransaction;
      try
         JvProc_Clona_Impressora.Params.ByNameAsString['IMPRESSORA'] := Campo1.Text;
         JvProc_Clona_Impressora.Params.ByNameAsString['NOME_IMPRNOVA'] := Impressora_Nova;
         JvProc_Clona_Impressora.Execute;
         JvTransaction.Commit;
      except
         On E:Exception do
         begin
            FrmPrincipal.TrataErro(E);
            JvTransaction.RollbackRetaining;
         end;
      end;        }
      MessageDlg('Impressora "'+ Campo1.Text +'" clonada para "'+ Impressora_Nova +'" com sucesso!',mtInformation,[mbOK],0);
   end;
end;

procedure TFrmImpressoras.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Impressoras',IBQry_Pes);
end;

initialization
   {$i uimpressoras.lrs}

end.
