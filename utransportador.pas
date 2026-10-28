unit UTransportador;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db,
  LResources, MaskEdit;


type
  TFrmTransportador = class(TForm)
     Campo1: TEdit;
     Datasource1: TDatasource;
     Grid_Pesquisa: TdbGrid;
     Edit_PCodigo: TEdit;
//     JvQry_Pes: TJvUIBDataSet;
    Paginas: TPageControl;
//    Proc: TJvUIBQuery;
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
    Label5: TLabel;
    Edit_Endereco: TEdit;
    Label6: TLabel;
    Edit_Bairro: TEdit;
    Label7: TLabel;
    Edit_Cidade: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Edit_Cep: TMaskEdit;
    Edit_CGC: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit_Inscricao: TEdit;
    Label12: TLabel;
    Edit_Fone: TEdit;
    Edit_Fax: TEdit;
    Edit_Email: TEdit;
    Label14: TLabel;
    Edit_Uf: TEdit;
    procedure BtnSairClick(Sender: TObject);
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
    procedure Edit_CGCEnter(Sender: TObject);
    procedure Edit_CGCExit(Sender: TObject);
    procedure Edit_CepEnter(Sender: TObject);
    procedure Edit_CepExit(Sender: TObject);
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
  FrmTransportador: TFrmTransportador;

implementation

uses UPrincipal, Global, UVariaveis;


procedure TFrmTransportador.SetOper(const Value: Integer);
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


procedure TFrmTransportador.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmTransportador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmTransportador.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmTransportador.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
//   if Parametros.Busca_Chave = 1 then Campo1.Text := IntToStr(FrmPrincipal.Busca_Controle('GEN_TRANSPORTADOR'));
   Campo1.SetFocus;
end;

procedure TFrmTransportador.BtnGravaClick(Sender: TObject);
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

procedure TFrmTransportador.Carrega_Parametros;
begin   {
   with Proc do
   begin
      Params.ByNameAsInteger['POPER'] := Operacao;
      //ParamByName('PFILIAL').asInteger := aFilial;
      Params.ByNameAsInteger['PCODIGO'] := StrToInt(Campo1.Text);
      Params.ByNameAsString['PNOME'] := Edit_Nome.Text;
      Params.ByNameAsString['PENDERECO'] := Edit_Endereco.Text;
      Params.ByNameAsString['PBAIRRO'] := Edit_Bairro.Text;
      Params.ByNameAsString['PCIDADE'] := Edit_Cidade.Text;
      Params.ByNameAsString['PUF'] := Edit_Uf.Text;
      Params.ByNameAsString['PCEP'] := Edit_Cep.Text;
      Params.ByNameAsString['PCGC'] := Edit_CGC.Text;
      Params.ByNameAsString['PINSCRICAO'] := Edit_Inscricao.Text;
      Params.ByNameAsString['PFONE'] := Edit_Fone.Text;
      Params.ByNameAsString['PFAX'] := Edit_Fax.Text;
      Params.ByNameAsString['PEMAIL'] := Edit_Email.Text;
   end;   }
end;

procedure TFrmTransportador.Carrega_Campos(oDataSet: TDataSet);
begin
   with oDataSet do
   begin
      Campo1.Text := FieldByName('CODIGO').asString;
      Edit_Nome.Text := FieldByName('NOME').asString;
      Edit_Endereco.Text := FieldByName('ENDERECO').asString;
      Edit_Bairro.Text := FieldByName('BAIRRO').asString;
      Edit_Cidade.Text := FieldByName('CIDADE').asString;
      Edit_Uf.Text := FieldByName('UF').asString;
      Edit_Cep.Text := FieldByName('CEP').asString;
      Edit_CGC.Text := FieldByName('CGC').asString;
      Edit_Inscricao.Text := FieldByName('INSCRICAO').asString;
      Edit_Fone.Text := FieldByName('FONE').asString;
      Edit_Fax.Text := FieldByName('FAX').asString;
      Edit_Email.Text := FieldByName('EMAIL').asString;
   end;
end;

procedure TFrmTransportador.Grid_PesquisaDblClick(Sender: TObject);
begin       {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      Carrega_Campos(JvQry_Pes);
      Paginas.ActivePageIndex := 0;
   end;    }
end;

procedure TFrmTransportador.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmTransportador.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   BtnInclui.SetFocus;
end;

procedure TFrmTransportador.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin   {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from Transportador where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end;  }
   end
   else
   begin
      Campo1.Text := '0';
   end;
end;

procedure TFrmTransportador.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
   Campo1.Text:= '0';
   Edit_PCodigo.Text := '0';{
   Proc.database := frmprincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_TRANSPORTADOR');
   jvqry_pes.database := frmprincipal.base;
   jvqry_pes.transaction := frmprincipal.transaction;  }
   BtnInclui.SetFocus;
end;

procedure TFrmTransportador.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := 'Select * from Transportador ';

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

   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
          {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      datasource1.dataset := (jvqry_pes as Tdataset);
      Grid_Pesquisa.DataSource := Datasource1;
   end;  }
end;

procedure TFrmTransportador.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin     {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from Transportador where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
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
            MessageDlg('Transportador com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
         end;
         BtnInclui.SetFocus;
      except
         JvQuery.Close;
         JvQuery.Free;
      end;   }
   end;
end;

procedure TFrmTransportador.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmTransportador.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
   datasource1.dataset := nil;
   Grid_Pesquisa.DataSource := nil;
  // JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmTransportador.Edit_CGCEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99.999.999/9999-99;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmTransportador.Edit_CGCExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '.   .   /    -' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmTransportador.Edit_CepEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99999-999;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmTransportador.Edit_CepExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '-' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmTransportador.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('Trans',IBQry_Pes);
end;

initialization
   {$i utransportador.lrs}

end.
