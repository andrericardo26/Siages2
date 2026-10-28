unit UVendedor;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, ImgList, Db,
  LResources, MaskEdit;


type

  { TFrmVendedor }

  TFrmVendedor = class(TForm)
    BtnEditar: TBitBtn;
    BtnExcluiPesq: TBitBtn;
    BtnIncluiPesq: TBitBtn;
    BtnLimpa1: TBitBtn;
    BtnSairPes: TBitBtn;
     Campo1: TEdit;
     Edit_PCodigo: TEdit;
     Edit_PDescricao: TEdit;
     Grid_Pesquisa: TdbGrid;
     Datasource1: TDatasource;
     Edit_Comissao: TEdit;
     Edit_Maxdesc: TEdit;
//     JvQry_Pes: TJvUIBDataSet;
     Label16: TLabel;
     Label17: TLabel;
     Label7: TLabel;
     Lbl_Status: TLabel;
    Paginas: TPageControl;
    Panel2: TPanel;
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
    Panel4: TPanel;
    BtnAtualiza: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Nome: TEdit;
    NaoLimpar: TCheckBox;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    Label3: TLabel;
    Edit_Endereco: TEdit;
    Label4: TLabel;
    Edit_Bairro: TEdit;
    Label5: TLabel;
    Edit_Cidade: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Msk_Cep: TMaskEdit;
    Msk_CPF: TMaskEdit;
    Label10: TLabel;
    Msk_CGC: TMaskEdit;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Edit_Fone: TEdit;
    Edit_Fax: TEdit;
    Edit_email: TEdit;
    Edit_UF: TEdit;
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluiPesq1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure FrmVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure Msk_CepEnter(Sender: TObject);
    procedure Msk_CepExit(Sender: TObject);
    procedure Msk_CGCEnter(Sender: TObject);
    procedure Msk_CGCExit(Sender: TObject);
    procedure Msk_CPFEnter(Sender: TObject);
    procedure Msk_CPFExit(Sender: TObject);
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
  FrmVendedor: TFrmVendedor;

implementation

uses UPrincipal, Global, UVariaveis;


procedure TFrmVendedor.SetOper(const Value: Integer);
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

procedure TFrmVendedor.SetStatus(Status: String);
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

procedure TFrmVendedor.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmVendedor.BtnExcluiPesq1Click(Sender: TObject);
begin
//  Carrega_Campos(JvQry_Pes);
  BtnExcluiClick(self);
  BtnAtualizaClick(self);
end;

procedure TFrmVendedor.BtnEditarClick(Sender: TObject);
begin
  Grid_PesquisaDblClick(self);
end;

procedure TFrmVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmVendedor.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmVendedor.BtnIncluiClick(Sender: TObject);
begin
   Paginas.ActivePageIndex := 0;
   SetStatus('Inserção');
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
//   if Parametros.Busca_Chave = 1 then Campo1.Text := IntTostr(FrmPrincipal.Busca_Controle('GEN_VENDEDORES'));
   Campo1.SetFocus;
end;

procedure TFrmVendedor.BtnGravaClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
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
   //CGC
   if Length(Trim(Msk_CGC.Text)) <> 0 then
   begin
      if not ValidaCgc(Trim(Msk_CGC.Text)) then
      begin
         MessageDlg('CGC inválido.', mtInformation,[mbOK],0);
         Msk_CGC.SetFocus;
         Exit;
      end
      else {
      begin
         //Procura para ver se esse CGC ja foi cadastrado
         JvQuery := TJvUIBDataset.Create(self);
         try
            JvQuery.Database := FrmPrincipal.Base;
            JvQuery.Transaction := FrmPrincipal.Transaction;

            if not FrmPrincipal.RodaConsulta('Select * from VENDEDORES where CGC='''+ Msk_CGC.Text +''''+' and Codigo <> ' + Campo1.Text,JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               //keybd_event(39,0,0,0);
               if MessageDlg('O CGC "'+ Msk_CGC.Text +'" já está cadastrado no sistema para '+ #13 +
                          JvQuery.FieldByName('Codigo').asString + ' - ' +  JvQuery.FieldByName('Nome').asString + #13 +
                          'Deseja localizar e carregar o vendedor "'+ JvQuery.FieldByName('Nome').asString +'" ?',
                          mtWarning,[mbYes, mbNo],0) = mrYes then
               begin
                  Operacao := opBrowse;
                  Carrega_Campos(JvQuery);
               end
               else
                  Msk_CGC.SetFocus;
            end;
         finally
            JvQuery.Close;
            JvQuery.Free;
         end;
      end; }
   end;
   //CPF
   if Length(Trim(Msk_CPF.Text)) <> 0 then
   begin
      if not ValidaCPF(Trim(Msk_CPF.Text)) then
      begin
         MessageDlg('CPF inválido.', mtInformation,[mbOK],0);
         Msk_CPF.SetFocus;
         Exit;
      end
      else
      begin {
         //Procura para ver se esse CGC ja foi cadastrado
         JvQuery := TJvUIBDataset.Create(self);
         try
            JvQuery.Database := FrmPrincipal.Base;
            JvQuery.Transaction := FrmPrincipal.Transaction;
            
            if not FrmPrincipal.RodaConsulta('Select * from VENDEDORES where CPF='''+ Msk_CPF.Text +''''+' and Codigo <> ' + Campo1.Text,JvQuery) then Exit;
            if JvQuery.RecordCount > 0 then
            begin
               //keybd_event(39,0,0,0);
               if MessageDlg('O CPF "'+ Msk_CPF.Text +'" já está cadastrado no sistema para '+ #13 +
                          JvQuery.FieldByName('Codigo').asString + ' - ' +  JvQuery.FieldByName('Nome').asString + #13 +
                          'Deseja localizar e carregar o vendedor "'+ JvQuery.FieldByName('Nome').asString +'" ?',
                          mtWarning,[mbYes, mbNo],0) = mrYes then
               begin
                  Operacao := opBrowse;
                  Carrega_Campos(JvQuery);
               end
               else
                  Msk_CPF.SetFocus;
            end;
         finally
            JvQuery.Close;
            JvQuery.Free;
         end; }
      end;
   end;

   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   Carrega_Parametros;
//    FrmPrincipal.RodaSP(Proc);
   SetStatus('Edição');
   Operacao := opBrowse;
   if NaoLimpar.Checked then
   begin
      Operacao := opInsert;
      SetStatus('Inserção');
      Campo1.SetFocus;
   end
   else
   begin
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmVendedor.Carrega_Parametros;
begin     {
   with Proc do
   begin
      Params.ByNameasInteger['POPER'] := Operacao;
      //ParamByName('PFILIAL').asInteger := aFilial;
      Params.ByNameasInteger['PCODIGO'] := StrToInt(Campo1.Text);
      Params.ByNameasString['PNOME'] := Edit_Nome.Text;
      Params.ByNameasString['PENDERECO'] := Edit_Endereco.Text;
      Params.ByNameasString['PBAIRRO'] := Edit_Bairro.Text;
      Params.ByNameasString['PCIDADE'] := Edit_Cidade.Text;
      Params.ByNameasString['PUF'] := Edit_UF.Text;
      Params.ByNameasString['PCEP'] := Msk_Cep.Text;
      Params.ByNameasString['PCGC'] := Msk_CGC.Text;
      Params.ByNameasString['PCPF'] := Msk_CPF.Text;
      Params.ByNameasString['PFONE'] := Edit_Fone.Text;
      Params.ByNameasString['PFAX'] := Edit_Fax.Text;
      Params.ByNameasString['PEMAIL'] := Edit_Email.Text;
      Params.ByNameAsCurrency['PCOMISSAO'] := StrToFloatZero(Edit_Comissao.Text);
      Params.ByNameAsCurrency['PMAXDESC'] := StrToFloatZero(Edit_Maxdesc.Text);
   end;  }
end;

procedure TFrmVendedor.Carrega_Campos(oDataSet: TDataSet);
begin
   //
   with oDataset do
   begin
      Campo1.Text := FieldByName('CODIGO').asString;
      Edit_Nome.Text := FieldByName('NOME').asString;
      Edit_Endereco.Text := FieldByName('ENDERECO').asString;
      Edit_Bairro.Text := FieldByName('BAIRRO').asString;
      Edit_Cidade.Text := FieldByName('CIDADE').asString;
      Edit_UF.Text := FieldByName('UF').asString;
      Msk_Cep.Text := FieldByName('CEP').asString;
      Msk_CGC.Text := FieldByName('CGC').asString;
      Msk_CPF.Text := FieldByName('CPF').asString;
      Edit_Fone.Text := FieldByName('FONE').asString;
      Edit_Fax.Text := FieldByName('FAX').asString;
      Edit_Email.Text := FieldByName('EMAIL').asString;
      Edit_Comissao.Text := FieldByName('COMISSAO').AsString;
      //Edit_Comissao.Text := FloatToStr(FieldByName('COMISSAO').AsFloat);
      Edit_Maxdesc.Text := FieldByName('MAXDESC').AsString;
      //Edit_Maxdesc.Text := FloatToStr(FieldByName('MAXDESC').AsFloat);
   end;
end;

procedure TFrmVendedor.FrmVendedorKeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TFrmVendedor.Grid_PesquisaDblClick(Sender: TObject);
begin           {
   if (JvQry_Pes.Active) and (JvQry_Pes.RecordCount > 0) then
   begin
      Carrega_Campos(JvQry_Pes);
      SetStatus('Edição');
      Paginas.ActivePageIndex := 0;
   end;         }
end;

procedure TFrmVendedor.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmVendedor.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   FrmPrincipal.LimpaCampos(self,1);
   BtnInclui.SetFocus;
end;

procedure TFrmVendedor.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin     {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from Vendedores where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
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

procedure TFrmVendedor.FormShow(Sender: TObject);
begin
   Operacao := opBrowse;
   SetStatus('Pesquisa');
   Campo1.Text:= '0';
   Edit_PCodigo.Text := '0'; {
   Proc.database := frmprincipal.base;
   Proc.transaction := frmprincipal.transaction;
   Proc.BuildStoredProc('PROC_VENDEDORES');
   jvqry_pes.database := frmprincipal.base;
   jvqry_pes.transaction := frmprincipal.transaction; }
   BtnInclui.SetFocus;
end;

procedure TFrmVendedor.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   BtnExcluiPesq.enabled := false;
   BtnEditar.enabled := false;
   vSelect := '';
   vSelect := 'Select * from Vendedores ';

   CRI := '';
   If (Length(Trim(Edit_PCodigo.Text)) > 0) and (StrToint(Edit_PCodigo.Text) > 0) then
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

   //datasource1.dataset := nil;
   //Grid_Pesquisa.DataSource := nil;
           {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      BtnExcluiPesq.enabled := true;
      BtnEditar.enabled := true;
      datasource1.dataset := (jvqry_pes as Tdataset); //descomentado por fernando
      Grid_Pesquisa.DataSource := Datasource1; //descomentado por fernando
   end;   }
end;

procedure TFrmVendedor.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin    {
   If Length(Trim(Campo1.Text)) <> 0 then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         if not FrmPrincipal.RodaConsulta('Select * from Vendedores where Codigo='+ Campo1.Text +'',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão de '+ Edit_Nome.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               FrmPrincipal.LimpaCampos(self,1);
               SetStatus('Pesquisa');
            end;
            Operacao := opBrowse;
         end
         else
         begin
            MessageDlg('Vendedor com CODIGO "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(self,1);
         end;
         BtnInclui.SetFocus;
      except
         JvQuery.Close;
         JvQuery.Free;
      end;
   end; }
end;

procedure TFrmVendedor.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmVendedor.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
//   JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

procedure TFrmVendedor.Msk_CepEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99999-999;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmVendedor.Msk_CepExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '-' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmVendedor.Msk_CGCEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '99.999.999/9999-99;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmVendedor.Msk_CGCExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '.   .   /    -' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmVendedor.Msk_CPFEnter(Sender: TObject);
begin
   if Length(Trim((Sender as TMaskEdit).Text)) = 0 then
   begin
      (Sender as TMaskEdit).EditMask := '999.999.999-99;1;_';
      (Sender as TMaskEdit).SelStart := 0;
   end;
end;

procedure TFrmVendedor.Msk_CPFExit(Sender: TObject);
begin
   if Trim((Sender as TMaskEdit).Text) = '.   .   -' then
   begin
      (Sender as TMaskEdit).EditMask := '';
   end;
end;

procedure TFrmVendedor.BtnImprimeClick(Sender: TObject);
begin
    //Imprime_Pesquisa('Vendedor',IBQry_Pes);
end;

initialization
   {$i uvendedor.lrs}

end.
