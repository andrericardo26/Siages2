unit USituTrib;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db, LResources;


type
  TFrmSituTrib = class(TForm)
    Datasource: TDatasource;
    Grid_Pesquisa: TdbGrid;
//    JvQry_Pes: TJvUIBDataSet;
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
    Panel4: TPanel;
    BtnImprime: TBitBtn;
    BtnLimpa: TBitBtn;
    BtnAjudaPes: TBitBtn;
    BtnAtualiza: TBitBtn;
    Edit_PNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Nome: TEdit;
    NaoLimpar: TCheckBox;
    BtnSairPes: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    Label3: TLabel;
    Campo1: TEdit;
    Edit_PCodigo: TEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure FrmSituTribKeyPress(Sender: TObject; var Key: Char);
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
  FrmSituTrib: TFrmSituTrib;

implementation

uses UPrincipal, Global;


procedure TFrmSituTrib.SetOper(const Value: Integer);
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


procedure TFrmSituTrib.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmSituTrib.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   JvQry_Pes.close;
   Action := caFree;
end;

procedure TFrmSituTrib.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmSituTrib.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
   if Campo1.Enabled then Campo1.SetFocus;
end;

procedure TFrmSituTrib.BtnGravaClick(Sender: TObject);
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
      MessageDlg('Descrição deve ser preenchido.', mtInformation,[mbOK],0);
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
      Campo1.Text := '';
      if Campo1.Enabled then Campo1.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmSituTrib.Carrega_Parametros;
begin      {
   with Proc do
   begin
      Params.ByNameasInteger['POPER'] := Operacao;
      Params.ByNameasString['PCODIGO'] := Trim(Campo1.Text);
      Params.ByNameasString['PNOME'] := Edit_Nome.Text;
   end;   }
end;

procedure TFrmSituTrib.Carrega_Campos(oDataSet: TDataSet);
begin
   //
   Campo1.Text := oDataSet.FieldByName('CODIGO').asString;
   Edit_Nome.Text := oDataSet.FieldByName('NOME').asString;
end;

procedure TFrmSituTrib.FrmSituTribKeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TFrmSituTrib.Grid_PesquisaDblClick(Sender: TObject);
begin            {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
   end;         }
end;

procedure TFrmSituTrib.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmSituTrib.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   BtnInclui.SetFocus;
end;

procedure TFrmSituTrib.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin      {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from SitTributaria where Codigo='''+ Campo1.Text +'''',JvQuery) then Exit;
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

procedure TFrmSituTrib.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
   Campo1.Text:= '';
   Edit_PCodigo.Text := ''; {
   Proc.database := frmprincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_SITTRIBUTARIA');
   jvqry_pes.database := frmprincipal.base;
   jvqry_pes.transaction := frmprincipal.transaction; }
   BtnInclui.SetFocus;
end;

procedure TFrmSituTrib.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := 'Select * from SitTributaria ';

   CRI := '';
   If Length(Trim(Edit_PCodigo.Text)) > 0 then
   begin
      CRI := CRI + ' and Codigo = '''+ Trim(Edit_PCodigo.Text) +'''';
   end;
   If Length(Trim(Edit_PNome.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Nome) like Upper(''%'+ Trim(Edit_PNome.Text) +'%'')';
   end;
   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by Codigo ';

   datasource.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
              {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      datasource.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource;
   end;      }
end;

procedure TFrmSituTrib.BtnExcluiClick(Sender: TObject);
//var JvQuery : TJvUIBDataset;
begin                 {
   If Length(Trim(Campo1.Text)) <> 0 then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from SitTributaria where Codigo='''+ Campo1.Text +'''',JvQuery) then Exit;
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
            MessageDlg('Situação com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
         end;
         BtnInclui.SetFocus;
      except
         JvQuery.Close;
         JvQuery.Free;
      end;
   end;                }
end;

procedure TFrmSituTrib.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmSituTrib.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   datasource.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
   // JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmSituTrib.Edit_PCodigoExit(Sender: TObject);
begin
   If Length(Trim(Campo1.Text)) = 0 then
      Campo1.Text := '';
end;

procedure TFrmSituTrib.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('SitTribut',IBQry_Pes);
end;

initialization
  {$i usitutrib.lrs}

end.
