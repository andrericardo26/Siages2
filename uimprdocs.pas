unit UImprDocs;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,Db, Grids, DBGrids, ActnList, LResources;

type

  { TFrmImprDocs }

  TFrmImprDocs = class(TForm)
     DBGrid_Parcelas: TdbGrid;
    Src_Parcelas: TDatasource;
    Edit_Controle: TEdit;
//    JvQry_Parcelas: TJvUIBDataSet;
    Label54: TLabel;
    Edit_Config_Impr: TEdit;
    F3_Conf_Doc: TSpeedButton;
    Panel_Config_Desc: TPanel;
    Btn_Imprimir_Cobranca: TBitBtn;
    Label28: TLabel;
    Label29: TLabel;
    F3_Nota: TSpeedButton;
    LabelCli_Forn: TLabel;
    Label51: TLabel;
    Edit_Nro_Nota: TEdit;
    Edit_Ser_Nota: TEdit;
    PanelCod_Cli: TPanel;
    PanelNome_Cli: TPanel;
    PanelEmiss: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn2: TBitBtn;
    BtnSair: TBitBtn;
    Panel15: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_ControleExit(Sender: TObject);
    procedure Edit_Nro_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Ser_NotaExit(Sender: TObject);
    procedure Edit_Config_ImprExit(Sender: TObject);
    procedure F3_Conf_DocClick(Sender: TObject);
    procedure F3_NotaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Btn_Imprimir_CobrancaClick(Sender: TObject);
    Procedure Carrega_Parcelas(oControle: Integer);
    procedure Action1Execute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImprDocs: TFrmImprDocs;

implementation

uses UPrincipal, UConsulta, Global;


procedure TFrmImprDocs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

Procedure TFrmImprDocs.Carrega_Parcelas(oControle: Integer);
begin
{   with JvQry_Parcelas do
   begin
      if oControle = 0 then
      begin
         Src_Parcelas.DataSet := Nil;
         DBGrid_Parcelas.DataSource := Nil;
         Close;
      end
      else
      begin
         Src_Parcelas.DataSet := Nil;
         DBGrid_Parcelas.DataSource := Nil;
         Close;
         Params.ByNameAsInteger['oControle'] := oControle;
         Open;
         FormatNumericFields(JvQry_Parcelas);
         if (Active = True) and (RecordCount > 0) then
         begin
            Src_Parcelas.DataSet := JvQry_Parcelas;
            DBGrid_Parcelas.DataSource := Src_Parcelas;
         end;
      end;
   end;      }
end;

procedure TFrmImprDocs.Edit_ControleExit(Sender: TObject);
var oSelect : String;
 //   JvQuery : TJvUIBDataset;
begin
   if (Length(Trim(Edit_Controle.Text)) > 0) and (StrToIntZero(Edit_Controle.Text) > 0) then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;
         
         oSelect := '';
         oSelect := 'SELECT VENDAS.CONTROLE, VENDAS.NRO_NOTA, VENDAS.SER_NOTA, VENDAS.CLI_FORN, VENDAS.COD_CLIENTE, VENDAS.COD_FORNEC, CLIENTES.NOME NOME_CLIENTE, FORNECEDORES.NOME NOME_FORNEC, VENDAS.DT_EMISS, VENDAS.CANCELADO FROM VENDAS ';
         oSelect := oSelect + 'LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) WHERE CONTROLE = ';

         if not FrmPrincipal.RodaConsulta(oSelect + Trim(Edit_Controle.Text),JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Edit_Nro_Nota.Text := JvQuery.FieldByName('Nro_Nota').asString;
            Edit_Ser_Nota.Text := JvQuery.FieldByName('Ser_Nota').asString;
            PanelEmiss.Caption := JvQuery.FieldByName('Dt_Emiss').asString;
            if Trim(UpperCase(JvQuery.FieldByName('CLI_FORN').asString)) = 'CLIENTE' then
            begin
               LabelCli_Forn.Caption := 'Cliente';
               PanelCod_Cli.Caption := JvQuery.FieldByName('Cod_Cliente').asString;
               PanelNome_Cli.Caption := JvQuery.FieldByName('Nome_Cliente').asString;
            end
            else
            begin
               LabelCli_Forn.Caption := 'Fornecedor';
               PanelCod_Cli.Caption := JvQuery.FieldByName('Cod_Fornec').asString;
               PanelNome_Cli.Caption := JvQuery.FieldByName('Nome_Fornec').asString;
            end;
         end
         else
         begin
            MessageDlg('Nota Fiscal não cadastrada.',mtInformation,[mbOK],0);
            Edit_Controle.Text := '0';
            Edit_Nro_Nota.Text := '';
            Edit_Ser_Nota.Text := '';
            PanelEmiss.Caption := '';
            PanelCod_Cli.Caption := '';
            PanelNome_Cli.Caption := '';
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Controle.Text := '0';
      Edit_Nro_Nota.Text := '';
      Edit_Ser_Nota.Text := '';
      PanelEmiss.Caption := '';
      PanelCod_Cli.Caption := '';
      PanelNome_Cli.Caption := '';
   end;
   Carrega_Parcelas(StrToInt(Edit_Controle.Text));
end;

procedure TFrmImprDocs.Edit_Nro_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (not (Key in ['0'..'9','-',#8,#13,#35,#36,#37,#39])) then Key := #15;
end;

procedure TFrmImprDocs.Edit_Ser_NotaExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
{   if Trim(Edit_Nro_Nota.Text) <> '' then
   begin
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select Controle from Vendas where Nro_Nota='''+ Trim(Edit_Nro_Nota.Text)+''' and Ser_Nota='''+ Trim(Edit_Ser_Nota.Text),JvQuery) then Exit;
         if JvQuery.Recordcount > 0 then
         begin
            MessageDlg('Nota Fiscal não cadastrada.',mtInformation,[mbOK],0);
            Edit_Controle.Text := '0';
            Edit_Nro_Nota.SetFocus;
         end;
         JvQuery.Last;
         if JvQuery.RecordCount > 1 then
         begin
            FrmPesquisa := TFrmPesquisa.Create(self);
            try
               FrmPesquisa.Select := ' SELECT VENDAS.CONTROLE, VENDAS.DT_EMISS EMISSAO, VENDAS.COD_CLIENTE, CLIENTES.NOME NOME_CLIENTE, VENDAS.COD_FORNEC, FORNECEDORES.NOME NOME_FORNECEDOR ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' FROM VENDAS LEFT JOIN FORNECEDORES ON (VENDAS.COD_FORNEC = FORNECEDORES.CODIGO) LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
               FrmPesquisa.Select := FrmPesquisa.Select + ' WHERE NRO_NOTA = '''+ Trim(Edit_Nro_Nota.Text)+''' AND SER_NOTA='''+ Trim(Edit_Ser_Nota.Text)+'''';
               FrmPesquisa.Indice_Inicial := 'CONTROLE';
               FrmPesquisa.Campo_Retorno := 'CONTROLE';
               FrmPesquisa.Caption := 'Notas Fiscais com Nro: ' + Edit_Nro_Nota.Text + ' e Série: ' + Edit_Ser_Nota.Text;
               FrmPesquisa.Mensagem := 'Foram encontradas '+ FormatFloat('000',JvQuery.RecordCount) +' ocorrência(s) para NF/CF '''+ Edit_Nro_Nota.Text +''' Série '''+ Edit_Ser_Nota.Text +'''';
               FrmPesquisa.Abrir_Conteudo := True;
               if FrmPesquisa.ShowModal = mrOK then
               begin
                  Edit_Controle.Text := FrmPesquisa.JvQuery.FieldByName('Controle').AsString;
                  Edit_ControleExit(self);
               end;
            finally
               FrmPesquisa.Free;
            end;
         end
         else
         begin
            Edit_Controle.Text := JvQuery.FieldByName('Controle').AsString;
            Edit_ControleExit(self);
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end;
   end;   }
end;

procedure TFrmImprDocs.Edit_Config_ImprExit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Trim(Edit_Config_Impr.Text) <> '' then
   begin
{      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select DESCRICAO from DOCSCAPA where Nome=''' + Copy(Edit_Config_Impr.Text,1,Pos('-',Edit_Config_Impr.Text)-1) + '''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Panel_Config_Desc.Caption := JvQuery.FieldByName('DESCRICAO').asString;
         end
         else
         begin
            MessageDlg('Configuração não cadastrada.',mtInformation,[mbOK],0);
            Panel_Config_Desc.Caption := '';
            Edit_Config_Impr.SetFocus;
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Edit_Config_Impr.Text := '';
      Panel_Config_Desc.Caption := '';
   end;
end;

procedure TFrmImprDocs.F3_Conf_DocClick(Sender: TObject);
var vTipo : String;
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT NOME, DESCRICAO, TIPO FROM DOCSCAPA WHERE TIPO IN (1,3,4)';
      FrmPesquisa.Indice_Inicial := 'NOME';
      FrmPesquisa.Campo_Retorno := 'NOME';
      FrmPesquisa.Caption := 'Configuração de documentos';
{      if FrmPesquisa.ShowModal = mrOK then
      begin
         Case FrmPesquisa.JvQuery.FieldByName('TIPO').asInteger of
            1 : vTipo := ' - Fat./Duplic';
            3 : vTipo := ' - Carnê';
            4 : vTipo := ' - Bloqueto';
         end;
         Edit_Config_Impr.Text := FrmPesquisa.JvQuery.FieldByName('NOME').asString + vTipo;
         Edit_Config_ImprExit(Self);
         Edit_Config_Impr.SetFocus;
      end;       }
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmImprDocs.F3_NotaClick(Sender: TObject);
begin
   FrmPesquisa := TFrmPesquisa.Create(self);
   try
      FrmPesquisa.Select := ' SELECT VENDAS.CONTROLE,VENDAS.NRO_NOTA,VENDAS.SER_NOTA,VENDAS.DT_EMISS,VENDAS.COD_CLIENTE,CLIENTES.NOME,VENDAS.TOT_NOTA ';
      FrmPesquisa.Select := FrmPesquisa.Select + ' FROM VENDAS ';
      FrmPesquisa.Select := FrmPesquisa.Select + ' LEFT JOIN CLIENTES ON (VENDAS.COD_CLIENTE = CLIENTES.CODIGO) ';
      FrmPesquisa.Select := FrmPesquisa.Select + ' ORDER BY VENDAS.DT_EMISS DESC,VENDAS.NRO_NOTA DESC ';
      FrmPesquisa.Indice_Inicial := 'NRO_NOTA';
      FrmPesquisa.Campo_Retorno := 'CONTROLE';
      FrmPesquisa.Caption := 'Notas Fiscais';
      if FrmPesquisa.ShowModal = mrOK then
      begin
        // Edit_Controle.Text := FrmPesquisa.JvQuery.FieldByName('CONTROLE').asString;
         Edit_ControleExit(Self);
         Edit_Controle.SetFocus;
      end;
   finally
      FrmPesquisa.Free;
   end;
end;

procedure TFrmImprDocs.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmImprDocs.BitBtn2Click(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmImprDocs.Btn_Imprimir_CobrancaClick(Sender: TObject);
begin
   if StrToIntZero(Edit_Controle.Text) <= 0 then
   begin
      MessageDlg('Nota/Cupom inválido.',mtWarning,[mbOK],0);
      Edit_Controle.SetFocus;
      Exit;
   end;

   if Edit_Config_Impr.Text = '' then
   begin
      MessageDlg('Configuração inválida.',mtWarning,[mbOK],0);
      Edit_Config_Impr.SetFocus;
      Exit;
   end;

   if Pos('Fat./Duplic',Edit_Config_Impr.Text) > 0 then
   begin
      //Imprime_Duplicata(Copy(Edit_Config_Impr.Text,1,Pos('-',Edit_Config_Impr.Text)-1),Edit_Controle.Text);
   end else
   if Pos('Carnê',Edit_Config_Impr.Text) > 0 then
   begin
      //Imprime_Carne(Copy(Edit_Config_Impr.Text,1,Pos('-',Edit_Config_Impr.Text)-1),Edit_Controle.Text);
   end else
   if Pos('Bloqueto',Edit_Config_Impr.Text) > 0 then
   begin
      //Imprime_Bloqueto(Copy(Edit_Config_Impr.Text,1,Pos('-',Edit_Config_Impr.Text)-1),Edit_Controle.Text);
   end;
end;

procedure TFrmImprDocs.Action1Execute(Sender: TObject);
begin
   if (Edit_Nro_Nota.Focused) or (Edit_Ser_Nota.Focused) then
      F3_NotaClick(Self)
   else if Edit_Config_Impr.Focused then
      F3_Conf_DocClick(Self);
end;

initialization
//   {$i uimprdocs.lrs}

end.
