unit UMarca;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db,
  LResources, Process, DBCtrls;


type
  TFrmMarcas = class(TForm)
     BtnAjuda: TBitBtn;
     BtnCancelar: TBitBtn;
     BtnExclui: TBitBtn;
     BtnGrava: TBitBtn;
     BtnInclui: TBitBtn;
     BtnSair: TBitBtn;
    Campo1: TEdit;
    Datasource1: TDatasource;
    Grid_Pesquisa: TdbGrid;
    Edit_PCodigo: TEdit;
//    JvQry_Pes: TJvUIBDataSet;
//    Proc: TJvUIBQuery;
    Paginas: TPageControl;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
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
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure FrmMarcasClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FrmMarcasKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
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
  FrmMarcas: TFrmMarcas;

implementation

uses uprincipal, uvariaveis;


procedure TFrmMarcas.SetOper(const Value: Integer);
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

procedure TFrmMarcas.BtnAjudaClick(Sender: TObject);
begin
   //Chama_Ajuda('Paginas/cadGerais.htmc);
end;

procedure TFrmMarcas.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
//   if Parametros.Busca_Chave = 1 then Campo1.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_MARCAS'));
   if Campo1.Enabled then Campo1.SetFocus;
   Campo1.SelectAll;
end;

procedure TFrmMarcas.BtnGravaClick(Sender: TObject);
begin
   //Codigo
   if Length(Trim(Campo1.Text)) = 0 then
   begin
      MessageDlg('Código deve ser número inteiro válido.', mtInformation,[mbOK],0);
      if Campo1.Enabled then Campo1.SetFocus;
      Exit;
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
      if Campo1.Enabled then Campo1.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmMarcas.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmMarcas.Carrega_Parametros;
begin      {
   with Proc do
   begin
      Params.ByNameAsInteger['POPER'] := Operacao;
      Params.ByNameAsInteger['PCODIGO'] := StrToInt(Campo1.Text);
      Params.ByNameAsString['PNOME'] := Edit_Nome.Text;
   end;   }
end;

procedure TFrmMarcas.Carrega_Campos(oDataSet: TDataSet);
begin
   //
   Campo1.Text := oDataSet.FieldByName('CODIGO').asString;
   Edit_Nome.Text := oDataSet.FieldByName('NOME').asString;
end;

procedure TFrmMarcas.FrmMarcasClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
//   JvQry_Pes.close;
   Closeaction := caFree;
end;

procedure TFrmMarcas.FrmMarcasKeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TFrmMarcas.Grid_PesquisaDblClick(Sender: TObject);
begin            {
   if (JvQry_Pes.Active) and (JvQry_Pes.Recordcount > 0) then
   begin
      Carrega_Campos(JvQry_Pes as Tdataset);
      Paginas.ActivePageIndex := 0;
   end;         }
end;

procedure TFrmMarcas.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmMarcas.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmMarcas.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   BtnInclui.SetFocus;
end;

procedure TFrmMarcas.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin     {
   If Length(Trim(Campo1.Text)) <> 0 then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from Marcas where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
            JvQuery.Close;
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end
   else
   begin
      Campo1.Text:= '0';
   end;  }
end;

procedure TFrmMarcas.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
   Campo1.Text:= '0';
   Edit_PCodigo.Text := '0';
{   Proc.DataBase := FrmPrincipal.base;
   Proc.Transaction := FrmPrincipal.Transaction;
   Proc.BuildStoredProc('PROC_MARCAS');  }
//   JvQry_Pes.Database := FrmPrincipal.base;
 //  JvQry_Pes.Transaction := FrmPrincipal.Transaction;
   BtnInclui.SetFocus;
end;

procedure TFrmMarcas.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
    Cols : Array [0..9] of integer;
begin
   vSelect := '';
   vSelect := 'Select * from Marcas ';

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

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by Codigo ';

   Datasource1.DataSet := nil;
   Grid_Pesquisa.DataSource := nil;
         {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      datasource1.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource1;
   end; }
end;

procedure TFrmMarcas.BtnExcluiClick(Sender: TObject);
//var JvQuery : TJvUIBDataset;
begin    {
   If Length(Trim(Campo1.Text)) <> 0 then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from Marcas where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
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
            MessageDlg('Marca com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
         end;
         BtnInclui.SetFocus;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end; }
end;

procedure TFrmMarcas.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
//   JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmMarcas.Edit_PCodigoExit(Sender: TObject);
begin
   If Length(Trim(Campo1.Text)) = 0 then
      Campo1.text := '0';
end;

procedure TFrmMarcas.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Marcas',JvQry_Pes);
end;



initialization
  {$i umarca.lrs}

end.
