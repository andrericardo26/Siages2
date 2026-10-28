unit UGrupo;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons,
  ComCtrls, ImgList, Db, ExtDlgs, ActnList, LResources;


type
  TFrmGrupos = class(TForm)
     BtnAjuda: TBitBtn;
     BtnAjudaPes: TBitBtn;
     BtnAtualiza: TBitBtn;
     BtnCancelar: TBitBtn;
     BtnExclui: TBitBtn;
     BtnGrava: TBitBtn;
     BtnImprime: TBitBtn;
     BtnInclui: TBitBtn;
     BtnLimpa: TBitBtn;
     BtnSair: TBitBtn;
     BtnSairPes: TBitBtn;
    Datasource: TDatasource;
    Grid_Pesquisa: TdbGrid;
    Edit_PCodigo: TEdit;
    Campo1: TEdit;
//     JvQry_Pes: TJvUIBDataSet;
    OpenPictureDialog1: TOpenPictureDialog;
    Paginas: TPageControl;
 //   Proc: TJvUIBQuery;
    TabCadastro: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    TabPesquisa: TTabSheet;
    Panel1: TPanel;
    Label60: TLabel;
    Label61: TLabel;
    Panel4: TPanel;
    Edit_PDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Nome: TEdit;
    NaoLimpar: TCheckBox;
    Label3: TLabel;
    Edit_Imagem: TEdit;
    Image1: TImage;
    Bevel1: TBevel;
    F3_imagem: TSpeedButton;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure FrmGruposKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Edit_PDescricaoChange(Sender: TObject);
    procedure Edit_PCodigoChange(Sender: TObject);
    procedure Edit_PCodigoExit(Sender: TObject);
    procedure F3_ImagemClick(Sender: TObject);
    procedure Edit_ImagemExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
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
  FrmGrupos: TFrmGrupos;

implementation

uses UPrincipal, Global, UVariaveis;


procedure TFrmGrupos.SetOper(const Value: Integer);
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


procedure TFrmGrupos.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   JvQry_Pes.close;
   Action := caFree;
end;

procedure TFrmGrupos.BtnAjudaClick(Sender: TObject);
begin
   //Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmGrupos.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(Self,1);
//   if Parametros.Busca_Chave = 1 then Campo1.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_GRUPOS'));
   if Campo1.Enabled then Campo1.SetFocus;
   Campo1.SelectAll;
end;

procedure TFrmGrupos.BtnGravaClick(Sender: TObject);
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

procedure TFrmGrupos.Carrega_Parametros;
begin    {
   with Proc do
   begin
      Params.ByNameAsInteger['POPER'] := Operacao;
      Params.ByNameAsInteger['PCODIGO'] := StrToInt(Campo1.Text);
      Params.ByNameAsString['PNOME'] := Edit_Nome.Text;
      //Imagem
      Params.ByNameAsString['PPATHIMAGEM'] := Edit_Imagem.Text;
   end; }
end;

procedure TFrmGrupos.Carrega_Campos(oDataSet: TDataSet);
begin
   //
   Campo1.Text := oDataSet.FieldByName('CODIGO').asString;
   Edit_Nome.Text := oDataSet.FieldByName('NOME').asString;
   //Imagem
   Edit_Imagem.Text := oDataSet.FieldByName('PATHIMAGEM').asString;
   Image1.Picture := nil;
   if Trim(Edit_Imagem.Text) <> '' then
   begin
      if FileExists(Edit_Imagem.Text) then
         Image1.Picture.LoadFromFile(Edit_Imagem.Text)
      else
         MessageDlg('O arquivo "'+ Edit_Imagem.Text +'" não existe. Imagem não pode ser carregada.',mtWarning,[mbOK],0);
   end;
end;

procedure TFrmGrupos.FrmGruposKeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TFrmGrupos.Grid_PesquisaDblClick(Sender: TObject);
begin            {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
   end;         }
end;

procedure TFrmGrupos.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmGrupos.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   BtnInclui.SetFocus;
end;

procedure TFrmGrupos.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin    {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from Grupos where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
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
      Campo1.Text := '0';
   end;
end;

procedure TFrmGrupos.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
   Campo1.Text:= '0';
   Edit_PCodigo.Text := '0';             {
   Proc.database := frmprincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_GRUPOS'); }

//   jvqry_pes.database := frmprincipal.base;
//   jvqry_pes.transaction := frmprincipal.transaction;
   BtnInclui.SetFocus;
end;

procedure TFrmGrupos.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := 'Select * from Grupos ';

   CRI := '';
   If (Length(Trim(Edit_PCodigo.Text)) > 0) and (StrToInt(Edit_PCodigo.Text) > 0) then
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

   datasource.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
                                                   {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      datasource.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource;
   end;                                           }
end;

procedure TFrmGrupos.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin     {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from Grupos where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
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
            MessageDlg('Grupo com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
         end;
         BtnInclui.SetFocus;
      except
         JvQuery.Close;
         JvQuery.Free;
      end;  }
   end;
end;

procedure TFrmGrupos.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmGrupos.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   datasource.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
//   JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmGrupos.Edit_PDescricaoChange(Sender: TObject);
begin

end;

procedure TFrmGrupos.Edit_PCodigoChange(Sender: TObject);
begin

end;

procedure TFrmGrupos.Edit_PCodigoExit(Sender: TObject);
begin
   If Length(Trim(Campo1.Text)) = 0 then
      Campo1.Text := '0';
end;

procedure TFrmGrupos.F3_ImagemClick(Sender: TObject);
begin
   if OpenPictureDialog1.Execute then
   begin
      Edit_Imagem.Text := OpenPictureDialog1.FileName;
      Edit_ImagemExit(self);
      Edit_Imagem.SetFocus;
   end;
end;

procedure TFrmGrupos.Edit_ImagemExit(Sender: TObject);
begin
   if Trim(Edit_Imagem.Text) <> '' then
   begin
      if FileExists(Edit_Imagem.Text) then
         Image1.Picture.LoadFromFile(Edit_Imagem.Text)
      else
      begin
         MessageDlg('O arquivo inválido.'+ #13 +'"'+ Edit_Imagem.Text +'"',mtWarning,[mbOK],0);
         Edit_Imagem.SetFocus;
      end;
   end
   else
      Image1.Picture := nil;
end;

procedure TFrmGrupos.Action1Execute(Sender: TObject);
begin
   if Edit_Imagem.Focused then
      F3_ImagemClick(self);
end;

procedure TFrmGrupos.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Grupos',IBQry_Pes);
end;

initialization
  {$i ugrupo.lrs}

end.
