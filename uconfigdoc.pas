unit UConfigDoc;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, MaskEdit, Buttons,
  ComCtrls, ImgList, Db, DBCtrls, LResources, lcltype;


type

  { TFrmConfigDoc }

  TFrmConfigDoc = class(TForm)
     Chk_Impr_Fat: TCheckBox;
     Combo_ImprPadrao_Bloq: TComboBox;
     Combo_ImprPadrao_Carne: TComboBox;
     Combo_ImprPadrao_Duplicata: TComboBox;
     Combo_ImprPadrao_Etiqueta: TComboBox;
     Combo_ImprPadrao_Nota: TComboBox;
     Datasource1: TDatasource;
     Edit_Bloq_Aceite: TEdit;
     Edit_Bloq_Carteira: TEdit;
     Edit_Bloq_Especie: TEdit;
     Edit_Bloq_EspeDoc: TEdit;
     Edit_Bloq_Impres_Espaco: TEdit;
     Edit_Bloq_Impres_Fonte: TEdit;
     Edit_Bloq_Instru1: TEdit;
     Edit_Bloq_Instru2: TEdit;
     Edit_Bloq_Instru3: TEdit;
     Edit_Bloq_LocalPag: TEdit;
     Edit_Bloq_Moeda: TEdit;
     Edit_Carne_Impres_Espaco: TEdit;
     Edit_Carne_Impres_Fonte: TEdit;
     Edit_Du_Banco: TEdit;
     Edit_Du_Cond_Especiais: TEdit;
     Edit_Du_Desconto: TEdit;
     Edit_Du_Impres_Espaco: TEdit;
     Edit_Du_Impres_Fonte: TEdit;
     Edit_Du_Pagto_Ate: TEdit;
     Edit_Du_Pagto_Atrazo: TEdit;
     Edit_Etqs_Por_Coluna: TEdit;
     Edit_Etq_Impres_Espaco: TEdit;
     Edit_Etq_Impres_Fonte: TEdit;
     Edit_Etq_Linha_Ini: TEdit;
     Edit_ETQ_POSINI: TEdit;
     Edit_ETQ_QTCOL: TEdit;
     Edit_Fat_Colunas: TEdit;
     Edit_Fat_Espaco: TEdit;
     Edit_Fat_Linhas: TEdit;
     Edit_Obs_Larg: TEdit;
     Edit_Obs_Linhas: TEdit;
     Edit_Qt_LinhasProd: TEdit;
     Edit_Vl_Ext_Larg: TEdit;
     Edit_Vl_Ext_Larg_Du: TEdit;
     Edit_Vl_Ext_Linhas: TEdit;
     Edit_Vl_Ext_Linhas_Du: TEdit;
     GroupBox1: TGroupBox;
     GroupBox2: TGroupBox;
     GroupBox3: TGroupBox;
     GroupBox4: TGroupBox;
     ImageList1: TImageList;
     Grid_Pesquisa: TdbGrid;
     Edit_Linhas: TEdit;
{     JvQry_Pes: TJvUIBDataSet;
     JvQry_Itens: TJvUIBDataSet;}
     Label1: TLabel;
     Label13: TLabel;
     Label14: TLabel;
     Label15: TLabel;
     Label16: TLabel;
     Label17: TLabel;
     Label18: TLabel;
     Label19: TLabel;
     Label2: TLabel;
     Label20: TLabel;
     Label21: TLabel;
     Label22: TLabel;
     Label23: TLabel;
     Label24: TLabel;
     Label25: TLabel;
     Label26: TLabel;
     Label27: TLabel;
     Label28: TLabel;
     Label29: TLabel;
     Label3: TLabel;
     Label30: TLabel;
     Label31: TLabel;
     Label32: TLabel;
     Label33: TLabel;
     Label34: TLabel;
     Label35: TLabel;
     Label36: TLabel;
     Label37: TLabel;
     Label38: TLabel;
     Label39: TLabel;
     Label4: TLabel;
     Label40: TLabel;
     Label41: TLabel;
     Label42: TLabel;
     Label43: TLabel;
     Label44: TLabel;
     Label45: TLabel;
     Label5: TLabel;
     Label7: TLabel;
     Label8: TLabel;
     Notebook1: TNotebook;
     Page1: TPage;
     Page2: TPage;
     Page3: TPage;
     Page4: TPage;
     Page5: TPage;
    Paginas: TPageControl;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel9: TPanel;
{    Proc: TJvUIBQuery;
    Proc_Itens: TJvUIBQuery;}
    RG_Bloq_Impressao_Tipo: TRadioGroup;
    RG_Carne_Impressao_Tipo: TRadioGroup;
    RG_Du_Impressao_Tipo: TRadioGroup;
    RG_Etq_Impressao_Tipo: TRadioGroup;
    StringGrid1: TStringGrid;
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
    BtnSairPes: TBitBtn;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Tipo: TLabel;
    Combo_Tipo: TComboBox;
    Campo1: TEdit;
    Edit_Descricao: TEdit;
    Combo_LinhasPol: TComboBox;
    Combo_Compressao: TComboBox;
    Panel6: TPanel;
    Edit_PNome: TEdit;
    Label6: TLabel;
    Combo_PTipo: TComboBox;
    SB_Novo: TSpeedButton;
    SBGrava: TSpeedButton;
    Bevel1: TBevel;
    SBCancela: TSpeedButton;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure Carrega_Parametros;
    procedure Carrega_Campos(oDataSet: TDataSet);
    procedure Grid_PesquisaDblClick(Sender: TObject);
    procedure ImageList1Change(Sender: TObject);
    procedure PaginasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Campo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    Procedure Inclui_Dados(osDados : Array of String);
    Procedure CarregaGrid_Nota;
    Procedure CarregaGrid_Duplicata;
    procedure CarregaGrid_Etiqueta;
    procedure CarregaGrid_Carne;
    procedure CarregaGrid_Bloqueto;
    Procedure CarregaGrid_Itens(osDados : TDataSet);
    procedure SB_NovoClick(Sender: TObject);
    procedure SBGravaClick(Sender: TObject);
    procedure SBCancelaClick(Sender: TObject);
    procedure Combo_TipoChange(Sender: TObject);
    procedure SB_ExportaClick(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);

       procedure StringGrid1DrawCell(Sender: TObject; Col, Row: Integer; aRect: TRect; aState: TGridDrawState);
       procedure StringGrid1KeyDown(Sender: TObject;
          var Key: Word; Shift: TShiftState);

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
  FrmConfigDoc: TFrmConfigDoc;

implementation

uses UPrincipal, Global, UVariaveis;


procedure TFrmConfigDoc.SetOper(const Value: Integer);
begin
  if Value <> vOper then
  begin
    vOper := Value;
    case voper of
       opInsert : begin
                     BtnInclui.Enabled := False;
                     BtnExclui.Enabled := False;
                     BtnSair.Enabled := False;
                     Combo_Tipo.Enabled := True;
                     Campo1.Enabled := True;
                  end;
       opBrowse : begin
                     BtnInclui.Enabled := True;
                     BtnExclui.Enabled := True;
                     BtnSair.Enabled := True;
                     Combo_Tipo.Enabled := False;
                     Campo1.Enabled := False;
                  end;
    end;
  end;
end;


procedure TFrmConfigDoc.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmConfigDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmConfigDoc.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

procedure TFrmConfigDoc.BtnIncluiClick(Sender: TObject);
begin
   Operacao := opInsert;
   FrmPrincipal.LimpaCampos(self,1);
   Combo_Tipo.SetFocus;
end;

procedure TFrmConfigDoc.BtnGravaClick(Sender: TObject);
begin
   //Tipo
   if Combo_Tipo.ItemIndex = -1 then
   begin
      MessageDlg('"Tipo" deve ser preenchido.', mtInformation,[mbOK],0);
      Combo_Tipo.SetFocus;
      Exit;
   end;
   //Nome
   if Length(Trim(Campo1.Text)) = 0 then
   begin
      MessageDlg('"Nome" deve ser preenchido.', mtInformation,[mbOK],0);
      Campo1.SetFocus;
      Exit;
   end;
   //Descricao
   if Length(Trim(Edit_Descricao.Text)) = 0 then
   begin
      MessageDlg('"Descrição" deve ser preenchido.', mtInformation,[mbOK],0);
      Edit_Descricao.SetFocus;
      Exit;
   end;
   //Linhas
   if StrToIntZero(Edit_Linhas.Text) <= 0 then
   begin
      MessageDlg('"Linhas" deve ser preenchido.', mtInformation,[mbOK],0);
      Edit_Linhas.SetFocus;
      Exit;
   end;
   //Polegadas
   if Combo_LinhasPol.ItemIndex = -1 then
   begin
      MessageDlg('"Polegada" deve ser preenchido.', mtInformation,[mbOK],0);
      Combo_LinhasPol.SetFocus;
      Exit;
   end;
   //Compressao
   if Combo_Compressao.ItemIndex = -1 then
   begin
      MessageDlg('"Compressão" deve ser preenchido.', mtInformation,[mbOK],0);
      Combo_Compressao.SetFocus;
      Exit;
   end;

   //se grava como browse entao esta editando
   if Operacao = opBrowse then Operacao := opEdit;
   Carrega_Parametros;
//   FrmPrincipal.RodaSP(Proc);
   Operacao := opBrowse;
   BtnInclui.SetFocus;
end;

procedure TFrmConfigDoc.Carrega_Parametros;
begin
{   with Proc do
   begin
      Params.ByNameAsInteger['POPER'] := Operacao;
      Params.ByNameAsString['PNOME'] := Campo1.Text;
      Params.ByNameAsInteger['PTIPO'] := Combo_Tipo.ItemIndex;
      Params.ByNameAsString['PDESCRICAO'] := Edit_Descricao.Text;
      Params.ByNameAsInteger['PLINHAS'] := StrToIntZero(Trim(Edit_Linhas.Text));
      Params.ByNameAsInteger['PLINHASPOL'] := StrToIntZero(Combo_LinhasPol.Items[Combo_LinhasPol.ItemIndex]);
      Params.ByNameAsString['PCOMPRESSAO'] := Combo_Compressao.Items[Combo_Compressao.ItemIndex];

      //************************************************************************

      if Notebook1.PageIndex = 0 then //Nota
      begin
         if not Chk_Impr_Fat.Checked then
            Params.ByNameAsInteger['PIMPR_FAT'] := 0
         else
            Params.ByNameAsInteger['PIMPR_FAT'] := 1;
         Params.ByNameAsInteger['PFAT_LINHAS'] := StrToIntZero(Trim(Edit_Fat_Linhas.Text));
         Params.ByNameAsInteger['PFAT_COLUNAS'] := StrToIntZero(Trim(Edit_Fat_Colunas.Text));
         Params.ByNameAsInteger['PFAT_ESPACO'] := StrToIntZero(Trim(Edit_Fat_Espaco.Text));
         Params.ByNameAsString['PIMPRPADRAO'] := Combo_ImprPadrao_Nota.Text;
         Params.ByNameAsInteger['PQT_LINHASPROD'] := StrToIntZero(Trim(Edit_Qt_LinhasProd.Text));
         Params.ByNameAsInteger['PVL_EXT_LINHAS'] := StrToIntZero(Trim(Edit_Vl_Ext_Linhas.Text));
         Params.ByNameAsInteger['PVL_EXT_LARG'] := StrToIntZero(Trim(Edit_Vl_Ext_Larg.Text));
         Params.ByNameAsInteger['POBS_LINHAS'] := StrToIntZero(Trim(Edit_Obs_Linhas.Text));
         Params.ByNameAsInteger['POBS_LARG'] := StrToIntZero(Trim(Edit_Obs_Larg.Text));
         //parametros nulos
         Params.ByNameIsNull['PDU_DESCONTO'] := True;
         Params.ByNameIsNull['PDU_PAGTO_ATE'] := True;
         Params.ByNameIsNull['PDU_PAGTO_ATRAZO'] := True;
         Params.ByNameIsNull['PDU_COND_ESPECIAIS'] := True;
         Params.ByNameIsNull['PDU_BANCO'] := True;
         Params.ByNameIsNull['PIMPRESSAO_TIPO'] := True;
         Params.ByNameIsNull['PIMPRES_WIN_FONTE'] := True;
         Params.ByNameIsNull['PIMPRES_WIN_ESPACO'] := True;
         Params.ByNameIsNull['PETQ_QTCOL'] := True;
         Params.ByNameIsNull['PETQ_POSINI'] := True;
         Params.ByNameIsNull['PETQ_LINHA_INI'] := True;
         Params.ByNameIsNull['PETQ_NRO_ETQS_COLUNA'] := True;
         Params.ByNameIsNull['PBLOQ_ESPEDOC'] := True;
         Params.ByNameIsNull['PBLOQ_ACEITE'] := True;
         Params.ByNameIsNull['PBLOQ_CARTEIRA'] := True;
         Params.ByNameIsNull['PBLOQ_ESPECIE'] := True;
         Params.ByNameIsNull['PBLOQ_MOEDA'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU1'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU2'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU3'] := True;
         Params.ByNameIsNull['PBLOQ_LOCALPAG'] := True;
      end else
      if Notebook1.PageIndex = 1 then //Duplicatas e Faturas
      begin
         Params.ByNameAsString['PDU_DESCONTO'] := Edit_Du_Desconto.Text;
         Params.ByNameAsString['PDU_PAGTO_ATE'] := Edit_Du_Pagto_Ate.Text;
         Params.ByNameAsString['PDU_PAGTO_ATRAZO'] := Edit_Du_Pagto_Atrazo.Text;
         Params.ByNameAsString['PDU_COND_ESPECIAIS'] := Edit_Du_Cond_Especiais.Text;
         Params.ByNameAsString['PDU_BANCO'] := Edit_Du_Banco.Text;
         Params.ByNameAsInteger['PIMPRESSAO_TIPO'] := RG_Du_Impressao_Tipo.ItemIndex;
         Params.ByNameAsInteger['PIMPRES_WIN_FONTE'] := StrToIntZero(Edit_Du_Impres_Fonte.Text);
         Params.ByNameAsInteger['PIMPRES_WIN_ESPACO'] := StrToIntZero(Edit_du_Impres_Espaco.Text);
         Params.ByNameAsString['PIMPRPADRAO'] := Combo_ImprPadrao_Duplicata.Text;
         Params.ByNameAsInteger['PVL_EXT_LINHAS'] := StrToIntZero(Trim(Edit_Vl_Ext_Linhas_Du.Text));
         Params.ByNameAsInteger['PVL_EXT_LARG'] := StrToIntZero(Trim(Edit_Vl_Ext_Larg_Du.Text));
         //parametros nulos
         Params.ByNameIsNull['PIMPR_FAT'] := True;
         Params.ByNameIsNull['PFAT_LINHAS'] := True;
         Params.ByNameIsNull['PFAT_COLUNAS'] := True;
         Params.ByNameIsNull['PFAT_ESPACO'] := True;
         Params.ByNameAsInteger['PQT_LINHASPROD'] := 0;
         //Params.ByNameIsNull['PSERV_LINHAS'] := True;
         //Params.ByNameIsNull['PSERV_LARG'] := True;
         Params.ByNameIsNull['POBS_LINHAS'] := True;
         Params.ByNameIsNull['POBS_LARG'] := True;
         Params.ByNameIsNull['PETQ_QTCOL'] := True;
         Params.ByNameIsNull['PETQ_POSINI'] := True;
         Params.ByNameIsNull['PETQ_LINHA_INI'] := True;
         Params.ByNameIsNull['PETQ_NRO_ETQS_COLUNA'] := True;
         Params.ByNameIsNull['PBLOQ_ESPEDOC'] := True;
         Params.ByNameIsNull['PBLOQ_ACEITE'] := True;
         Params.ByNameIsNull['PBLOQ_CARTEIRA'] := True;
         Params.ByNameIsNull['PBLOQ_ESPECIE'] := True;
         Params.ByNameIsNull['PBLOQ_MOEDA'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU1'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU2'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU3'] := True;
         Params.ByNameIsNull['PBLOQ_LOCALPAG'] := True;
      end else
      if Notebook1.PageIndex = 2 then //Etiquetas
      begin
         Params.ByNameAsInteger['PETQ_NRO_ETQS_COLUNA'] := StrToIntZero(Edit_Etqs_Por_Coluna.Text);
         Params.ByNameAsInteger['PETQ_LINHA_INI'] := StrToIntZero(Edit_Etq_Linha_Ini.Text);
         Params.ByNameAsInteger['PETQ_QTCOL'] := StrToIntZero(Edit_ETQ_QTCOL.Text);
         Params.ByNameAsString['PETQ_POSINI'] := Edit_ETQ_POSINI.Text;
         Params.ByNameAsString['PIMPRPADRAO'] := Combo_ImprPadrao_Etiqueta.Text;
         Params.ByNameAsInteger['PIMPRESSAO_TIPO'] := RG_Etq_Impressao_Tipo.ItemIndex;
         Params.ByNameAsInteger['PIMPRES_WIN_FONTE'] := StrToIntZero(Edit_Etq_Impres_Fonte.Text);
         Params.ByNameAsInteger['PIMPRES_WIN_ESPACO'] := StrToIntZero(Edit_Etq_Impres_Espaco.Text);
         //parametros nulos
         Params.ByNameIsNull['PIMPR_FAT'] := True;
         Params.ByNameIsNull['PFAT_LINHAS'] := True;
         Params.ByNameIsNull['PFAT_COLUNAS'] := True;
         Params.ByNameIsNull['PFAT_ESPACO'] := True;
         Params.ByNameAsInteger['PQT_LINHASPROD'] := 0;
         //Params.ByNameIsNull['PSERV_LINHAS'] := True;
         //Params.ByNameIsNull['PSERV_LARG'] := True;
         Params.ByNameIsNull['POBS_LINHAS'] := True;
         Params.ByNameIsNull['POBS_LARG'] := True;
         Params.ByNameIsNull['PDU_DESCONTO'] := True;
         Params.ByNameIsNull['PDU_PAGTO_ATE'] := True;
         Params.ByNameIsNull['PDU_PAGTO_ATRAZO'] := True;
         Params.ByNameIsNull['PDU_COND_ESPECIAIS'] := True;
         Params.ByNameIsNull['PDU_BANCO'] := True;
         Params.ByNameIsNull['PVL_EXT_LINHAS'] := True;
         Params.ByNameIsNull['PVL_EXT_LARG'] := True;
         Params.ByNameIsNull['PBLOQ_ESPEDOC'] := True;
         Params.ByNameIsNull['PBLOQ_ACEITE'] := True;
         Params.ByNameIsNull['PBLOQ_CARTEIRA'] := True;
         Params.ByNameIsNull['PBLOQ_ESPECIE'] := True;
         Params.ByNameIsNull['PBLOQ_MOEDA'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU1'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU2'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU3'] := True;
         Params.ByNameIsNull['PBLOQ_LOCALPAG'] := True;
      end else
      if Notebook1.PageIndex = 3 then //Carnes
      begin
         Params.ByNameIsNull['PETQ_NRO_ETQS_COLUNA'] := True;
         Params.ByNameIsNull['PETQ_LINHA_INI'] := True;
         Params.ByNameIsNull['PETQ_QTCOL'] := True;
         Params.ByNameIsNull['PETQ_POSINI'] := True;
         Params.ByNameAsString['PIMPRPADRAO'] := Combo_ImprPadrao_Carne.Items[Combo_ImprPadrao_Carne.ItemIndex];
         Params.ByNameAsInteger['PIMPRESSAO_TIPO'] := RG_Carne_Impressao_Tipo.ItemIndex;
         Params.ByNameAsInteger['PIMPRES_WIN_FONTE'] := StrToIntZero(Edit_Carne_Impres_Fonte.Text);
         Params.ByNameAsInteger['PIMPRES_WIN_ESPACO'] := StrToIntZero(Edit_Carne_Impres_Espaco.Text);
         Params.ByNameIsNull['PIMPR_FAT'] := True;
         Params.ByNameIsNull['PFAT_LINHAS'] := True;
         Params.ByNameIsNull['PFAT_COLUNAS'] := True;
         Params.ByNameIsNull['PFAT_ESPACO'] := True;
         Params.ByNameAsInteger['PQT_LINHASPROD'] := 0;
         //Params.ByNameIsNull['PSERV_LINHAS'] := True;
         //Params.ByNameIsNull['PSERV_LARG'] := True;
         Params.ByNameIsNull['POBS_LINHAS'] := True;
         Params.ByNameIsNull['POBS_LARG'] := True;
         Params.ByNameIsNull['PDU_DESCONTO'] := True;
         Params.ByNameIsNull['PDU_PAGTO_ATE'] := True;
         Params.ByNameIsNull['PDU_PAGTO_ATRAZO'] := True;
         Params.ByNameIsNull['PDU_COND_ESPECIAIS'] := True;
         Params.ByNameIsNull['PDU_BANCO'] := True;
         Params.ByNameIsNull['PVL_EXT_LINHAS'] := True;
         Params.ByNameIsNull['PVL_EXT_LARG'] := True;
         Params.ByNameIsNull['PBLOQ_ESPEDOC'] := True;
         Params.ByNameIsNull['PBLOQ_ACEITE'] := True;
         Params.ByNameIsNull['PBLOQ_CARTEIRA'] := True;
         Params.ByNameIsNull['PBLOQ_ESPECIE'] := True;
         Params.ByNameIsNull['PBLOQ_MOEDA'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU1'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU2'] := True;
         Params.ByNameIsNull['PBLOQ_INSTRU3'] := True;
         Params.ByNameIsNull['PBLOQ_LOCALPAG'] := True;
      end else
      if Notebook1.PageIndex = 4 then //Bloquetos
      begin
         Params.ByNameAsString['PBLOQ_ESPEDOC'] := Edit_Bloq_EspeDoc.Text;
         Params.ByNameAsString['PBLOQ_ACEITE'] := Edit_Bloq_Aceite.Text;
         Params.ByNameAsString['PBLOQ_CARTEIRA'] := Edit_Bloq_Carteira.Text;
         Params.ByNameAsString['PBLOQ_ESPECIE'] := Edit_Bloq_Especie.Text;
         Params.ByNameAsString['PBLOQ_MOEDA'] := Edit_Bloq_Moeda.Text;
         Params.ByNameAsString['PBLOQ_INSTRU1'] := Edit_Bloq_Instru1.Text;
         Params.ByNameAsString['PBLOQ_INSTRU2'] := Edit_Bloq_Instru2.Text;
         Params.ByNameAsString['PBLOQ_INSTRU3'] := Edit_Bloq_Instru3.Text;
         Params.ByNameAsString['PBLOQ_LOCALPAG'] := Edit_Bloq_LocalPag.Text;
         Params.ByNameAsString['PIMPRPADRAO'] := Combo_ImprPadrao_Bloq.Items[Combo_ImprPadrao_Bloq.ItemIndex];
         Params.ByNameAsInteger['PIMPRESSAO_TIPO'] := RG_Bloq_Impressao_Tipo.ItemIndex;
         Params.ByNameAsInteger['PIMPRES_WIN_FONTE'] := StrToIntZero(Edit_Bloq_Impres_Fonte.Text);
         Params.ByNameAsInteger['PIMPRES_WIN_ESPACO'] := StrToIntZero(Edit_Bloq_Impres_Espaco.Text);
         Params.ByNameIsNull['PETQ_NRO_ETQS_COLUNA'] := True;
         Params.ByNameIsNull['PETQ_LINHA_INI'] := True;
         Params.ByNameIsNull['PETQ_QTCOL'] := True;
         Params.ByNameIsNull['PETQ_POSINI'] := True;
         Params.ByNameIsNull['PIMPR_FAT'] := True;
         Params.ByNameIsNull['PFAT_LINHAS'] := True;
         Params.ByNameIsNull['PFAT_COLUNAS'] := True;
         Params.ByNameIsNull['PFAT_ESPACO'] := True;
         Params.ByNameAsInteger['PQT_LINHASPROD'] := 0;
         //Params.ByNameIsNull['PSERV_LINHAS'] := True;
         //Params.ByNameIsNull['PSERV_LARG'] := True;
         Params.ByNameIsNull['POBS_LINHAS'] := True;
         Params.ByNameIsNull['POBS_LARG'] := True;
         Params.ByNameIsNull['PDU_DESCONTO'] := True;
         Params.ByNameIsNull['PDU_PAGTO_ATE'] := True;
         Params.ByNameIsNull['PDU_PAGTO_ATRAZO'] := True;
         Params.ByNameIsNull['PDU_COND_ESPECIAIS'] := True;
         Params.ByNameIsNull['PDU_BANCO'] := True;
         Params.ByNameIsNull['PVL_EXT_LINHAS'] := True;
         Params.ByNameIsNull['PVL_EXT_LARG'] := True;
      end;
   end; }
end;

procedure TFrmConfigDoc.Carrega_Campos(oDataSet: TDataSet);
var I : Integer;
begin
   with oDataset do
   begin
      Combo_Tipo.ItemIndex := FieldByName('TIPO').AsInteger;
      Combo_TipoChange(self);
      Campo1.Text := FieldByName('NOME').asString;
      Edit_Descricao.Text := FieldByName('DESCRICAO').asString;
      Edit_Linhas.Text := FieldByName('LINHAS').AsString;
      //polegadas
      For I := 0 to Combo_LinhasPol.Items.Count-1 do
      begin
         if Combo_LinhasPol.Items[I] = FieldByName('LINHASPOL').asString then
            Combo_LinhasPol.ItemIndex := I;
      end;
      //Compressao
      For I := 0 to Combo_Compressao.Items.Count-1 do
      begin
         if Combo_Compressao.Items[I] = FieldByName('COMPRESSAO').asString then
            Combo_Compressao.ItemIndex := I;
      end;

      //************************************************************************
      if Notebook1.PageIndex = 0 then //Nota
      begin
         if FieldByName('IMPR_FAT').asInteger = 0 then
            Chk_Impr_Fat.Checked := False
         else
            Chk_Impr_Fat.Checked := True;
         Edit_Fat_Linhas.Text := FieldByName('FAT_LINHAS').AsString;
         Edit_Fat_Colunas.Text := FieldByName('FAT_COLUNAS').AsString;
         Edit_Fat_Espaco.Text := FieldByName('FAT_ESPACO').AsString;
         For I := 0 to Combo_ImprPadrao_Nota.Items.Count-1 do
         begin
            if Combo_ImprPadrao_Nota.Items[I] = FieldByName('IMPRPADRAO').asString then
               Combo_ImprPadrao_Nota.ItemIndex := I;
         end;
         Edit_Qt_LinhasProd.Text := FieldByName('QT_LINHASPROD').AsString;
         Edit_Vl_Ext_Linhas.Text := FieldByName('VL_EXT_LINHAS').AsString;
         Edit_Vl_Ext_Larg.Text := FieldByName('VL_EXT_LARG').AsString;
         Edit_Obs_Linhas.text := FieldByName('OBS_LINHAS').AsString;
         Edit_Obs_Larg.Text := FieldByName('OBS_LARG').AsString;
      end else
      if Notebook1.PageIndex = 1 then //Duplicatas e Faturas
      begin
         Edit_Du_Desconto.Text := FieldByName('DU_DESCONTO').AsString;
         Edit_Du_Pagto_Ate.Text := FieldByName('DU_PAGTO_ATE').AsString;
         Edit_Du_Pagto_Atrazo.Text := FieldByName('DU_PAGTO_ATRAZO').AsString;
         Edit_Du_Cond_Especiais.Text := FieldByName('DU_COND_ESPECIAIS').AsString;
         Edit_Vl_Ext_Linhas_Du.Text := FieldByName('VL_EXT_LINHAS').AsString;
         Edit_Vl_Ext_Larg_Du.Text := FieldByName('VL_EXT_LARG').AsString;
         Edit_Du_Banco.Text := FieldByName('DU_BANCO').AsString;
         For I := 0 to Combo_ImprPadrao_Duplicata.Items.Count-1 do
         begin
            if Combo_ImprPadrao_Duplicata.Items[I] = FieldByName('IMPRPADRAO').asString then
               Combo_ImprPadrao_Duplicata.ItemIndex := I;
         end;
         RG_Du_Impressao_Tipo.ItemIndex := FieldByName('IMPRESSAO_TIPO').AsInteger;
         Edit_Du_Impres_Fonte.Text := FieldByName('IMPRES_WIN_FONTE').AsString;
         Edit_Du_Impres_Espaco.Text := FieldByName('IMPRES_WIN_ESPACO').AsString;
      end else
      if Notebook1.PageIndex = 2 then //Etiquetas
      begin
         Edit_Etqs_Por_Coluna.Text := FieldByName('ETQ_NRO_ETQS_COLUNA').AsString;
         Edit_Etq_Linha_Ini.Text := FieldByName('ETQ_LINHA_INI').AsString;
         Edit_ETQ_QTCOL.Text := FieldByName('ETQ_QTCOL').AsString;
         Edit_ETQ_POSINI.Text := FieldByName('ETQ_POSINI').AsString;
         For I := 0 to Combo_ImprPadrao_Etiqueta.Items.Count-1 do
         begin
            if Combo_ImprPadrao_Etiqueta.Items[I] = FieldByName('IMPRPADRAO').asString then
               Combo_ImprPadrao_Etiqueta.ItemIndex := I;
         end;
         RG_Etq_Impressao_Tipo.ItemIndex := FieldByName('IMPRESSAO_TIPO').AsInteger;
         Edit_Etq_Impres_Fonte.Text := FieldByName('IMPRES_WIN_FONTE').AsString;
         Edit_Etq_Impres_Espaco.Text := FieldByName('IMPRES_WIN_ESPACO').AsString;
      end else
      if Notebook1.PageIndex = 3 then //Carnes
      begin
         For I := 0 to Combo_ImprPadrao_Carne.Items.Count-1 do
         begin
            if Combo_ImprPadrao_Carne.Items[I] = FieldByName('IMPRPADRAO').asString then
               Combo_ImprPadrao_Carne.ItemIndex := I;
         end;
         RG_Carne_Impressao_Tipo.ItemIndex := FieldByName('IMPRESSAO_TIPO').AsInteger;
         Edit_Carne_Impres_Fonte.Text := FieldByName('IMPRES_WIN_FONTE').AsString;
         Edit_Carne_Impres_Espaco.Text := FieldByName('IMPRES_WIN_ESPACO').AsString;
      end else
      if Notebook1.PageIndex = 4 then //Bloquetos
      begin
         Edit_Bloq_EspeDoc.Text := FieldByName('BLOQ_ESPEDOC').asString;
         Edit_Bloq_Aceite.Text := FieldByName('BLOQ_ACEITE').asString;
         Edit_Bloq_Carteira.Text := FieldByName('BLOQ_CARTEIRA').asString;
         Edit_Bloq_Especie.Text := FieldByName('BLOQ_ESPECIE').asString;
         Edit_Bloq_Moeda.Text := FieldByName('BLOQ_MOEDA').asString;
         Edit_Bloq_Instru1.Text := FieldByName('BLOQ_INSTRU1').asString;
         Edit_Bloq_Instru2.Text := FieldByName('BLOQ_INSTRU2').asString;
         Edit_Bloq_Instru3.Text := FieldByName('BLOQ_INSTRU3').asString;
         Edit_Bloq_LocalPag.Text := FieldByName('BLOQ_LOCALPAG').asString;
         For I := 0 to Combo_ImprPadrao_Bloq.Items.Count-1 do
         begin
            if Combo_ImprPadrao_Bloq.Items[I] = FieldByName('IMPRPADRAO').asString then
               Combo_ImprPadrao_Bloq.ItemIndex := I;
         end;
         RG_Bloq_Impressao_Tipo.ItemIndex := FieldByName('IMPRESSAO_TIPO').AsInteger;
         Edit_Bloq_Impres_Fonte.Text := FieldByName('IMPRES_WIN_FONTE').AsString;
         Edit_Bloq_Impres_Espaco.Text := FieldByName('IMPRES_WIN_ESPACO').AsString;
      end;                            {
      JvQry_Itens.Close;
      JvQry_Itens.Params.ByNameAsString['Doc'] := FieldByName('NOME').asString;
      JvQry_Itens.Open;
      CarregaGrid_Itens(JvQry_Itens);}
   end;
end;

Procedure TFrmConfigDoc.CarregaGrid_Itens(osDados : TDataset);
var i, j : integer;
begin
   for i := 1 to StringGrid1.RowCount-1 do
      for j := 0 to StringGrid1.ColCount-1 do
         StringGrid1.Cells[j,i] := '';
   StringGrid1.RowCount := 2;
   
   if osDados = nil then Exit;
   
   osDados.Last;
   osDados.First;
   StringGrid1.RowCount := osDados.RecordCount + 2;
   for i := 0 to  osDados.RecordCount do
   begin
      //Imprimir
      StringGrid1.Cells[0,i+1] := osDados.FieldByName('IMPRIMIR').asString;
      //Descricao
      StringGrid1.Cells[1,i+1] := osDados.FieldByName('DESCRICAO').asString;
      //Tamanho
      StringGrid1.Cells[2,i+1] := osDados.FieldByName('TAMANHO').asString;
      //Linha
      StringGrid1.Cells[3,i+1] := osDados.FieldByName('LINHA').asString;
      //Coluna
      StringGrid1.Cells[4,i+1] := osDados.FieldByName('COLUNA').asString;
      //Mascara
      StringGrid1.Cells[5,i+1] := osDados.FieldByName('MASKVLR').asString;;
      //Tabela
      StringGrid1.Cells[6,i+1] := osDados.FieldByName('TABELA').asString;
      //Campo
      StringGrid1.Cells[7,i+1] := osDados.FieldByName('CAMPO').asString;
      osDados.Next;
   end;
end;

procedure TFrmConfigDoc.Grid_PesquisaDblClick(Sender: TObject);
begin               {
   if (JvQry_Pes.Active) and (JvQry_Pes.Recordcount > 0) then
   begin
      Paginas.ActivePageIndex := 0;
      Carrega_Campos(JvQry_Pes);
   end;            }
end;

procedure TFrmConfigDoc.ImageList1Change(Sender: TObject);
begin

end;

procedure TFrmConfigDoc.PaginasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if Operacao <> opBrowse then  AllowChange := False;
end;

procedure TFrmConfigDoc.BtnCancelarClick(Sender: TObject);
begin
   Operacao := opBrowse;
   FrmPrincipal.LimpaCampos(self,1);
   CarregaGrid_Itens(nil);
   BtnInclui.SetFocus;
end;

procedure TFrmConfigDoc.Campo1Exit(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from DOCSCAPA where NOME='''+ Campo1.Text +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opBrowse;
            Carrega_Campos(JvQuery);
         end;
      finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
   end
   else
   begin
      Campo1.Text := '';
   end;
end;

procedure TFrmConfigDoc.FormShow(Sender: TObject);
begin {
   Proc.DataBase := FrmPrincipal.base;
   Proc.Transaction := FrmPrincipal.Transaction;
   Proc.BuildStoredProc('PROC_DOCSCAPA');
   
   Proc_Itens.DataBase := FrmPrincipal.base;
   Proc_Itens.Transaction := FrmPrincipal.Transaction;
   Proc_Itens.BuildStoredProc('PROC_DOCSITEM');
   
   JvQry_Pes.Database := FrmPrincipal.base;
   JvQry_Pes.Transaction := FrmPrincipal.Transaction;
   
   JvQry_Itens.Database := FrmPrincipal.base;
   JvQry_Itens.Transaction := FrmPrincipal.Transaction; }
   
   Carrega_ComboImpressoras(Combo_ImprPadrao_Nota);
   Combo_ImprPadrao_Nota.ItemIndex := Parametros.IMPR_PADRAO;
   Carrega_ComboImpressoras(Combo_ImprPadrao_Duplicata);
   Combo_ImprPadrao_Duplicata.ItemIndex := Parametros.IMPR_PADRAO;
   Carrega_ComboImpressoras(Combo_ImprPadrao_Etiqueta);
   Combo_ImprPadrao_Etiqueta.ItemIndex := Parametros.IMPR_PADRAO;
   Carrega_ComboImpressoras(Combo_ImprPadrao_Carne);
   Combo_ImprPadrao_Carne.ItemIndex := Parametros.IMPR_PADRAO;
   Carrega_ComboImpressoras(Combo_ImprPadrao_Bloq);
   Combo_ImprPadrao_Bloq.ItemIndex := Parametros.IMPR_PADRAO;
   Operacao := opBrowse;
   Campo1.Text := '';
   Edit_PNome.Text := '';
   BtnInclui.SetFocus;
end;

procedure TFrmConfigDoc.BtnAtualizaClick(Sender: TObject);
Var vSelect, CRI : String;
begin
   vSelect := '';
   vSelect := 'Select * from DocsCapa ';

   CRI := '';
   If Length(Trim(Edit_PNome.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Nome) like Upper(''%'+ Trim(Edit_PNome.Text) +'%'')';
   end;
   If Length(Trim(Edit_PDescricao.Text)) > 0 then
   begin
      CRI := CRI + ' and Upper(Descricao) like Upper(''%'+ Trim(Edit_PDescricao.Text) +'%'')';
   end;
   If Combo_PTipo.ItemIndex <> -1 then
   begin
      CRI := CRI + ' and Tipo = '+ IntToStr(Combo_PTipo.ItemIndex);
   end;
   if Length(Trim(CRI)) > 0 then
      vSelect := vSelect + ' where ';

   vSelect := vSelect  + Copy(CRI, 6, Length(CRI)) + ' order by Nome ';

   Datasource1.DataSet := nil;
   Grid_Pesquisa.DataSource := nil;
         {
   if (FrmPrincipal.RodaConsulta(vSelect,JvQry_Pes)) and (JvQry_Pes.RecordCount > 0) then
   begin
      Datasource1.DataSet := JvQry_Pes;
      Grid_Pesquisa.DataSource := Datasource1;
   end; }
end;

procedure TFrmConfigDoc.BtnExcluiClick(Sender: TObject);
// var JvQuery : TJvUIBDataset;
begin
   If Length(Trim(Campo1.Text)) <> 0 then
   begin {
      JvQuery := TJvUIBDataset.Create(self);
      try
         JvQuery.Database := FrmPrincipal.Base;
         JvQuery.Transaction := FrmPrincipal.Transaction;

         if not FrmPrincipal.RodaConsulta('Select * from DOCSCAPA where Nome = '''+ Campo1.Text +'''',JvQuery) then Exit;
         if JvQuery.RecordCount > 0 then
         begin
            Operacao := opDelete;
            Carrega_Campos(JvQuery);
            if MessageDlg('Confirma exclusão de '+ Campo1.Text +'?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
            begin
               Carrega_Parametros;
               FrmPrincipal.RodaSP(Proc);
               FrmPrincipal.LimpaCampos(Self,1);
            end;
            Operacao := opBrowse;
         end
         else
         begin
            MessageDlg('Documento com Nome "'+ Campo1.Text +'" não encontrado.',mtConfirmation,[mbOk],0);
            FrmPrincipal.LimpaCampos(Self,1);
         end;
      Finally
         JvQuery.Close;
         JvQuery.Free;
      end; }
      BtnInclui.SetFocus;
   end;
end;

procedure TFrmConfigDoc.PaginasChange(Sender: TObject);
begin
   if Paginas.ActivePageIndex = 0 then
      Grid_PesquisaDblClick(self);
end;

procedure TFrmConfigDoc.BtnLimpaClick(Sender: TObject);
begin
   FrmPrincipal.LimpaCampos(self,2);
//   JvQry_Pes.Close;
   BtnAtualiza.SetFocus;
end;

Procedure TFrmConfigDoc.Inclui_Dados(osDados : Array of String);
var I : Integer;
   aLinha : String;
   //vImprimir, vDescricao, vTabela, vCampo, vLinha, vColuna : string;
begin
   StringGrid1.RowCount := High(osDados) + 2;

   For I := Low(osDados) to High(osDados) do
   begin
      aLinha := osDados[I];
      //Carrega_Campos(IBQuery1);
      if Campo1.Text = '' then
      begin
         MessageDlg('Documento não cadastrado corretamente.',mtWarning,[mbOk],0);
         Exit;
      end;
      
      //NOME_DOC
      //IBDataSet1.FieldByName('NOME_DOC').asString := Campo1.Text;
      //Imprimir
      StringGrid1.Cells[0,i+1] := Copy(aLinha,1,Pos('|',aLinha)-1);
      aLinha := Copy(aLinha,Pos('|',aLinha)+1,Length(aLinha));
      //Descricao
      StringGrid1.Cells[1,i+1] := Copy(aLinha,1,Pos('|',aLinha)-1);
      aLinha := Copy(aLinha,Pos('|',aLinha)+1,Length(aLinha));
      //Tamanho da Descricao
      StringGrid1.Cells[2,i+1] := '0';
      //Tabela
      StringGrid1.Cells[6,i+1] := Copy(aLinha,1,Pos('|',aLinha)-1);
      aLinha := Copy(aLinha,Pos('|',aLinha)+1,Length(aLinha));
      //Campo
      StringGrid1.Cells[7,i+1] := Copy(aLinha,1,Pos('|',aLinha)-1);
      aLinha := Copy(aLinha,Pos('|',aLinha)+1,Length(aLinha));
      //Linha
      StringGrid1.Cells[3,i+1] := Copy(aLinha,1,Pos('|',aLinha)-1);
      aLinha := Copy(aLinha,Pos('|',aLinha)+1,Length(aLinha));
      //Coluna
      StringGrid1.Cells[4,i+1] := Copy(aLinha,1,Pos('|',aLinha)-1);
      //aLinha := Copy(aLinha,Pos('|',aLinha)-1,Length(aLinha));
      //Mascara
      StringGrid1.Cells[5,i+1] := '';
      //IBDataSet1.Post;
   end;
end;

Procedure TFrmConfigDoc.CarregaGrid_Nota;
var aDados : Array[0..83] of string;
begin
   //       Imprimir   Descricao   tabela  campo  linha  coluna
   aDados[0]  :='Não|Marcação Nota Saída||X|4|82|';
   aDados[1]  :='Não|Marcação Nota Entrada||X|4|101|';
   aDados[2]  :='Não|Natureza da Operação|CODFISCAIS|DESCRICAO|12|2|';
   aDados[3]  :='Não|Código Fiscal|VENDAS|CFOP|12|38|';
   aDados[4]  :='Não|Nome Cliente/R.Social|VW_CLIENTES|NOME|16|2|';
   aDados[5]  :='Não|Código do Cliente|VW_CLIENTES|CODIGO|16|70|';
   aDados[6]  :='Não|CGC/CPF do Cliente|VW_CLIENTES|CGC_CPF|16|95|';
   aDados[7]  :='Não|Data de Emissão|VENDAS|DT_EMISS|16|140|';
   aDados[8]  :='Não|Endereço do Cliente|VW_CLIENTES|ENDERECO|18|2|';
   aDados[9]  :='Não|Bairro do Cliente|VW_CLIENTES|BAIRRO|18|52|';
   aDados[10] :='Não|CEP do Cliente|VW_CLIENTES|CEP|18|95|';
   aDados[11] :='Não|Data Saída/Entrada|VENDAS|DT_SAIDA|18|140|';
   aDados[12] :='Não|Cidade do Cliente|VW_CLIENTES|CIDADE|21|2|';
   aDados[13] :='Não|Fone/Fax do Cliente|VW_CLIENTES|FONE|21|38|';
   aDados[14] :='Não|UF do Cliente|VW_CLIENTES|UF|21|74|';
   aDados[15] :='Não|Insc.Estadual Cliente|VW_CLIENTES|INSCRICAO|21|95|';
   aDados[16] :='Não|Hora da Saída|VENDAS|HR_SAIDA|21|140|';
   aDados[17] :='Não|Faturamento-Documento|CTASRECEBER|DOCUMENTO|24|2|';
   aDados[18] :='Não|Faturamento-Vencimento|CTASRECEBER|VENCTO|24|14|';
   aDados[19] :='Não|Faturamento-Valor|CTASRECEBER|VALOR|24|27|';
   aDados[20] :='Não|Código do Produto|VENDITEM|COD_PRODUTO|31|2|';
   aDados[21] :='Não|Descrição do Produto|PRODUTOS|NOME|31|11|';
   aDados[22] :='Não|Unidade do Produto|PRODUTOS|UNIDADE|31|86|';
   aDados[23] :='Não|Quantidade do Produto|VENDITEM|QUANTIDADE|31|90|';
   aDados[24] :='Não|Vlr.Unitário Produto|VENDITEM|VL_UNITARIO|31|108|';
   aDados[25] :='Não|Vlr.Total Produto(Itens)|VENDITEM|TOT_PRODUTO|31|130|';
   aDados[26] :='Não|Alíquota de ICMS|VW_VENDITEM|PERC_ICM|31|151|';
   aDados[27] :='Não|Complemento da descr. produtos|VENDITEM|OBSERVACAO|32|5|';
   aDados[28] :='Não|Descrição do Serviço|SERVIÇOS|DESCR_SERVICO|50|2|';
   aDados[29] :='Não|Quantidade de Serviço|SERVIÇOS|QUANTIDADE|50|76|';
   aDados[30] :='Não|Vlr.Unitário Serviço|SERVIÇOS|VL_UNITARIO|50|89|';
   aDados[31] :='Não|Vlr.Total Serviço(Itens)|SERVIÇOS|TOT_PRODUTO|50|104|';
   aDados[32] :='Não|Complemento da descr. serviços|SERVIÇOS|OBSERVACAO|51|5|';
   aDados[33] :='Não|Alíquota ISSQN (Nota)|PARAMETROS|ALIQ_ISS|51|138|';
   aDados[34] :='Não|Valor do ISSQN (Nota)|VENDAS|TOT_ISS|55|130|';
   aDados[35] :='Não|Valor do Serviço(Nota)|VENDAS|TOT_SERV|58|130|';
   aDados[36] :='Não|Base de Cálculo ICMS|VENDAS|BASE_ICMS|62|12|';
   aDados[37] :='Não|Valor do ICMS|VENDAS|VL_ICMS|62|45|';
   aDados[38] :='Não|Vl.Total Produtos(Nota)|VENDAS|TOT_PROD|62|130|';
   aDados[39] :='Não|Valor do Frete|VENDAS|VL_FRETE|65|12|';
   aDados[40] :='Não|Valor Total da Nota|VENDAS|TOT_NOTA|65|130|';
   aDados[41] :='Não|R.Social Transportador|TRANSPORTADOR|NOME|69|2|';
   aDados[42] :='Não|Frete por Conta de ...|VENDAS|CTA_FRETE|69|73|';
   aDados[43] :='Não|Placa do Veículo|VENDAS|PLACA|69|83|';
   aDados[44] :='Não|UF do Transportador 1|TRANSPORTADOR|UF|69|108|';
   aDados[45] :='Não|CGC/CPF do Transportador|TRANSPORTADOR|CGC|69|120|';
   aDados[46] :='Não|Endereço Transportador|TRANSPORTADOR|ENDERECO|71|2|';
   aDados[47] :='Não|Cidade Transportador|TRANSPORTADOR|CIDADE|71|68|';
   aDados[48] :='Não|UF do Transportador 2|TRANSPORTADOR|UF|71|108|';
   aDados[49] :='Não|Inscr.do Transportador|TRANSPORTADOR|INSCRICAO|71|120|';
   aDados[50] :='Não|Observação da Nota 1|OBSERVACOES|DESCRICAO|77|2|';
   aDados[51] :='Não|Observação da Nota 2|VENDAS|OBSERV2|78|2|';
   aDados[52] :='Não|Ref.do Vendedor||Vendedor:|100|2|';
   aDados[53] :='Não|Código do Vendedor|VENDAS|COD_VENDEDOR|100|14|';
   aDados[54] :='Não|Nome do Vendedor|VENDEDORES|NOME|100|21|';
   aDados[55] :='Não|Referência do Produto|PRODUTOS|REFERENCIA|100|47|';
   aDados[56] :='Não|Classificação Fiscal|VW_VENDITEM|CLAS_FISC|100|58|';
   aDados[57] :='Não|Situação Tributária|VW_VENDITEM|COD_STRIB|100|62|';
   aDados[58] :='Não|CGC da Empresa|PARAMETROS|CGC|100|80|';
   aDados[59] :='Não|Valor Total do IPI|VENDAS|VL_IPI|100|95|';
   aDados[60] :='Não|Número da Nota 1|VENDAS|NRO_NOTA|100|115|';
   aDados[61] :='Não|Alíquota de IPI|VW_VENDITEM|PERC_IPI|100|117|';
   aDados[62] :='Não|Número da Nota 2|VENDAS|NRO_NOTA|100|120|';
   aDados[63] :='Não|Valor do IPI|VW_VENDITEM|VL_IPI|100|121|';
   aDados[64] :='Não|Insc.Estadual da Empresa|PARAMETROS|INSCRICAO|101|80|';
   aDados[65] :='Não|Código Serviço|SERVIÇOS|COD_PRODUTO|102|1|';
   aDados[66] :='Não|Ref.do Desconto||Descontos|102|3|';
   aDados[67] :='Não|Quantidade de Volumes|VENDAS|NTQUANTID|102|5|';
   aDados[68] :='Não|Espécie dos Volumes|VENDAS|NTESPECIE|102|13|';
   aDados[69] :='Não|Marca dos Volumes|VENDAS|NTMARCA|102|40|';
   aDados[70] :='Não|Total Peso Bruto|VENDAS|TT_PBRUTO|102|95|';
   aDados[71] :='Não|Valor dos Descontos|VENDAS|VL_DESC|102|100|';
   aDados[72] :='Não|Total Peso Líquido|VENDAS|TT_PLIQUI|102|116|';
   aDados[73] :='Não|Vlr.ISS do Serviço|VENDAS|TOT_ISS|102|127|';
   aDados[74] :='Não|Insc.Municipal da Empresa|PARAMETROS|INSC_MUNICIPAL|103|80|';
   aDados[75] :='Não|Endereço da Empresa|PARAMETROS|ENDERECO|103|81|';
   aDados[76] :='Não|Cidade da Empresa|PARAMETROS|CIDADE|103|82|';
   aDados[77] :='Não|UF da Empresa|PARAMETROS|UF|103|83|';
   aDados[78] :='Não|CEP da Empresa|PARAMETROS|CEP|103|84|';
   aDados[79] :='Não|Fone da Empresa|PARAMETROS|FONE|103|85|';
   aDados[80] :='Não|Vlr.Total por Extenso|EXTENSO|TOT_NOTA|104|2|';
   aDados[81] :='Não|Valor do FunRural (Descontado)|VENDAS|TOT_FUNR|105|2|';
   aDados[82] :='Não|Valor do IR (Descontado)|VENDAS|TOT_IR|105|10|';
   aDados[83] :='Não|Peso Líquido do Produto|VENDITEM|PESO_LIQUIDO|31|95|';
   Inclui_Dados(aDados);
end;

Procedure TFrmConfigDoc.CarregaGrid_Duplicata;
var aDados : Array[0..32] of string;
begin
   //       Imprimir   Descricao   tabela  campo  linha  coluna
   aDados[00] := 'Sim|Data Emissao N.F.|VENDAS|DT_EMISS|6|92|';
   aDados[01] := 'Sim|Valor da Fatura|VENDAS|TOT_NOTA|10|26|';
   aDados[02] := 'Sim|Número da Fatura|CTASRECEBER|NRO_NOTA|10|46|';
   aDados[03] := 'Sim|Valor da Duplicata|CTASRECEBER|VALOR|10|66|';
   aDados[04] := 'Sim|Nro.Documento|CTASRECEBER|DOCUMENTO|10|86|';
   aDados[05] := 'Sim|Data do Vencimento|CTASRECEBER|VENCTO|10|103|';
   aDados[06] := 'Sim|Texto Desconto de ...|DOCSCAPA|DU_DESCONTO|11|30|';
   aDados[07] := 'Sim|Texto p/Pagto.até ...|DOCSCAPA|DU_PAGTO_ATE|11|90|';
   aDados[08] := 'Sim|Texto Pgto.atraso cobrar.|DOCSCAPA|DU_PAGTO_ATRAZO|12|40|';
   aDados[09] := 'Sim|Texto Banco Atraso...|DOCSCAPA|DU_BANCO|12|90|';
   aDados[10] := 'Sim|Texto Condições Especiais|DOCSCAPA|DU_COND_ESPECIAIS|13|40|';
   aDados[11] := 'Sim|Nome do Sacado|CLIENTES|NOME|16|36|';
   aDados[12] := 'Sim|Codigo do Sacado|CTASRECEBER|COD_CLIENTE|16|113|';
   aDados[13] := 'Sim|Endereço do Sacado|CLIENTES|ENDERECO|17|36|';
   aDados[14] := 'Sim|CEP do Sacado|CLIENTES|CEP|17|113|';
   aDados[15] := 'Sim|Cidade do Sacado|CLIENTES|CIDADE|18|36|';
   aDados[16] := 'Não|UF do Sacado|CLIENTES|UF|18|113|';
   aDados[17] := 'Não|Faturamento-Documentos|CTASRECEBER|DOCUMENTO|19|2|';
   aDados[18] := 'Não|Faturamento-Vencimento|CTASRECEBER|VENCTO|19|14|';
   aDados[19] := 'Não|Faturamento-Valor|CTASRECEBER|VALOR|19|29|';
   aDados[20] := 'Não|Praca de Pagamento|CLIENTES|CIDADE|19|47|';
   aDados[21] := 'Não|CGC do Sacado|CLIENTES|CGC|20|36|';
   aDados[22] := 'Não|Inscr.Estadual do Sacado|CLIENTES|INSCRICAO|20|113|';
   aDados[23] := 'Não|Razao Social do Usuario|PARAMETROS|RAZAO_SOCIAL|23|20|';
   aDados[24] := 'Não|Valor por Extenso|EXTENSO|VALOR|23|36|';
   aDados[25] := 'Não|Endereço do Usuário|PARAMETROS|ENDERECO|24|20|';
   aDados[26] := 'Não|Bairro do Usuário|PARAMETROS|BAIRRO|25|20|';
   aDados[27] := 'Não|Cidade do Usuário|PARAMETROS|CIDADE|25|50|';
   aDados[28] := 'Não|UF do Usuário|PARAMETROS|UF|25|60|';
   aDados[29] := 'Não|CEP do Usuário|PARAMETROS|CEP|26|20|';
   aDados[30] := 'Não|Fone do Usuário|PARAMETROS|FONE|26|35|';
   aDados[31] := 'Não|CGC do Usuario|PARAMETROS|CGC|27|20|';
   aDados[32] := 'Não|Insc.Estadual do Usuario|PARAMETROS|INSCRICAO|27|50|';
   Inclui_Dados(aDados);
end;

procedure TFrmConfigDoc.CarregaGrid_Etiqueta;
var aDados : Array[0..6] of string;
begin
   //       Imprimir   Descricao   tabela  campo  linha  coluna
   aDados[0] := 'Sim|Codigo do Cliente   |VW_CLIENTES|CODIGO|0|1|';
   aDados[1] := 'Sim|Nome do Cliente     |VW_CLIENTES|NOME|1|1|';
   aDados[2] := 'Sim|Endereço            |VW_CLIENTES|ENDERECO|2|1|';
   aDados[3] := 'Sim|Bairro              |VW_CLIENTES|BAIRRO|3|1|';
   aDados[4] := 'Sim|Cidade              |VW_CLIENTES|CIDADE|4|1|';
   aDados[5] := 'Sim|UF                  |VW_CLIENTES|UF|4|22|';
   aDados[6] := 'Sim|CEP                 |VW_CLIENTES|CEP|4|25|';
   Inclui_Dados(aDados);
end;

procedure TFrmConfigDoc.CarregaGrid_Carne;
var aDados : Array[0..11] of string;
begin
   //        Imprimir Descricao            tabela      campo linha coluna
   aDados[00] := 'Sim|Data da Compra 1     |CTASRECEBER|DATA|0|1|';
   aDados[01] := 'Sim|Data da Compra 2     |CTASRECEBER|DATA|0|50|';
   aDados[02] := 'Sim|Data do Vencimento 1 |CTASRECEBER|VENCTO|1|1|';
   aDados[03] := 'Sim|Data do Vencimento 2 |CTASRECEBER|VENCTO|1|50|';
   aDados[04] := 'Sim|Codigo do Cliente 1  |CTASRECEBER|COD_CLIENTE|2|1|';
   aDados[05] := 'Sim|Codigo do Cliente 2  |CTASRECEBER|COD_CLIENTE|2|50|';
   aDados[06] := 'Sim|Nome do Cliente 1    |VW_CLIENTES|NOME|3|1|';
   aDados[07] := 'Sim|Nome do Cliente 2    |VW_CLIENTES|NOME|3|50|';
   aDados[08] := 'Sim|Documento 1          |CTASRECEBER|DOCUMENTO|4|1|';
   aDados[09] := 'Sim|Documento 2          |CTASRECEBER|DOCUMENTO|4|50|';
   aDados[10] := 'Sim|Valor da Parcela 1   |CTASRECEBER|VALOR|5|1|';
   aDados[11] := 'Sim|Valor da Parcela 2   |CTASRECEBER|VALOR|5|50|';
   Inclui_Dados(aDados);
end;

procedure TFrmConfigDoc.CarregaGrid_Bloqueto;
var aDados : Array[0..18] of string;
begin
   //       Imprimir   Descricao   tabela  campo  linha  coluna
   aDados[00] := '|Vencimento                   |CTASRECEBER|VENCTO|4|96|';
   aDados[01] := 'Sim|Data do Documento            |CTASRECEBER|DATA|8|5|';
   aDados[02] := 'Sim|Número do Documento          |CTASRECEBER|DOCUMENTO|8|30|';
   aDados[03] := 'Sim|Espécie do Documento         |DOCSCAPA|BLOQ_ESPEDOC|8|52|';
   aDados[04] := 'Sim|Aceite                       |DOCSCAPA|BLOQ_ACEITE|8|64|';
   aDados[05] := 'Sim|Carteira                     |DOCSCAPA|BLOQ_CARTEIRA|10|25|';
   aDados[06] := 'Sim|Espécie                      |DOCSCAPA|BLOQ_ESPECIE|10|35|';
   aDados[07] := 'Sim|Valor do Documento           |CTASRECEBER|VALOR|10|80|';
   aDados[08] := 'Sim|Instruções 1                 |DOCSCAPA|BLOQ_INSTRU1|12|5|';
   aDados[09] := 'Sim|Instruções 2                 |DOCSCAPA|BLOQ_INSTRU2|13|5|';
   aDados[10] := 'Sim|Instruções 3                 |DOCSCAPA|BLOQ_INSTRU3|14|5|';
   aDados[11] := 'Sim|Código do Cliente            |CTASRECEBER|COD_CLIENTE|21|10|';
   aDados[12] := 'Sim|Nome do Cliente              |VW_CLIENTES|NOME|21|17|';
   aDados[13] := 'Sim|CGC/CPF do Cliente           |VW_CLIENTES|CGC|21|90|';
   aDados[14] := 'Sim|Endereço do Cliente/Cobrança |VW_CLIENTES|ENDERECO|22|5|';
   aDados[15] := 'Sim|Cidade do Cliente/Cobrança   |VW_CLIENTES|CIDADE|22|60|';
   aDados[16] := 'Sim|UF do Cliente/Cobrança       |VW_CLIENTES|UF|22|92|';
   aDados[17] := 'Sim|Cep do Cliente/Cobrança      |VW_CLIENTES|CEP|22|95|';
   aDados[18] := 'Sim|Local de Pagamento           |DOCSCAPA|BLOQ_LOCALPAG|23|20|';
   Inclui_Dados(aDados);
end;

procedure TFrmConfigDoc.SB_NovoClick(Sender: TObject);
begin
   if MessageDlg('Confirma exclusão da configuração atual dos itens para impressão e inclusão da configuração padrão?',mtConfirmation,[mbNo, mbYes],0) = mrYes then
   begin
      if Campo1.Text <> '' then
      begin
         FrmPrincipal.RodaComando('Delete from DocsItem where Nome_Doc = '''+ Campo1.Text +''';');
         case Notebook1.PageIndex of
            0 : CarregaGrid_Nota;       //Nota
            1 : CarregaGrid_Duplicata;  //Duplicatas / Faturas
            2 : CarregaGrid_Etiqueta;   //Etiquetas
            3 : CarregaGrid_Carne;      //Carnes
            4 : CarregaGrid_Bloqueto;   //Bloquetos
         end;
      end;
   end;
end;

procedure TFrmConfigDoc.SBGravaClick(Sender: TObject);
var i : Integer;
begin
   if Campo1.Text = '' then
   begin
      MessageDlg('"Nome" deve ser preenchido.', mtInformation,[mbOK],0);
      Campo1.SetFocus;
      Exit;
   end;
            {
   FrmPrincipal.RodaComando('DELETE FROM DOCSITEM WHERE NOME_DOC = '''+ Trim(Campo1.Text) +''';');

   For I := 1 to StringGrid1.RowCount - 2 do
   begin
      with Proc_Itens do
      begin
         Params.ByNameAsInteger['POPER'] := 0;
         Params.ByNameAsString['PNOME_DOC'] := Trim(Campo1.Text);
         Params.ByNameAsInteger['PLINHA'] := StrToIntZero(StringGrid1.Cells[3,I]);
         Params.ByNameAsInteger['PCOLUNA'] := StrToIntZero(StringGrid1.Cells[4,I]);
         Params.ByNameAsString['PDESCRICAO'] := StringGrid1.Cells[1,I];
         Params.ByNameAsString['PIMPRIMIR'] := StringGrid1.Cells[0,I];
         Params.ByNameAsInteger['PTAMANHO'] := StrToIntZero(StringGrid1.Cells[2,I]);
         Params.ByNameAsString['PTABELA'] := StringGrid1.Cells[6,I];
         Params.ByNameAsString['PCAMPO'] := StringGrid1.Cells[7,I];
         Params.ByNameAsString['PMASKVLR'] := StringGrid1.Cells[5,I];
         Execute;
         //FrmPrincipal.RodaSP(Proc_Itens);
      end;
      Proc_Itens.Close(etmCommit);
   end;    }
end;

procedure TFrmConfigDoc.SBCancelaClick(Sender: TObject);
begin                              {
   JvQry_Itens.Close;
   JvQry_Itens.Params.ByNameAsString['Doc'] := Campo1.Text;
   JvQry_Itens.Open;
   CarregaGrid_Itens(JvQry_Itens);}
end;

procedure TFrmConfigDoc.Combo_TipoChange(Sender: TObject);
begin
   Notebook1.PageIndex := Combo_Tipo.ItemIndex;
   {case Combo_Tipo.ItemIndex of
      0 : begin
             DBGrid1.Columns[6].PickList.Clear;
             DBGrid1.Columns[6].PickList.Add(' ');
             DBGrid1.Columns[6].PickList.Add('CLIENTES');
             DBGrid1.Columns[6].PickList.Add('CODFISCAIS');
             DBGrid1.Columns[6].PickList.Add('CTASRECEBER');
             DBGrid1.Columns[6].PickList.Add('OBSERVACOES');
             DBGrid1.Columns[6].PickList.Add('PARAMETROS');
             DBGrid1.Columns[6].PickList.Add('PRODUTOS');
             DBGrid1.Columns[6].PickList.Add('SERVIÇOS');
             DBGrid1.Columns[6].PickList.Add('TRANSPORTADOR');
             DBGrid1.Columns[6].PickList.Add('VENDAS');
             DBGrid1.Columns[6].PickList.Add('VENDEDORES');
             DBGrid1.Columns[6].PickList.Add('VENDITEM');
             DBGrid1.Columns[6].PickList.Add('VW_VENDITEM');
          end;
      1 : begin
             DBGrid1.Columns[6].PickList.Clear;
             DBGrid1.Columns[6].PickList.Add(' ');
             DBGrid1.Columns[6].PickList.Add('CLIENTES');
             DBGrid1.Columns[6].PickList.Add('CTASRECEBER');
             DBGrid1.Columns[6].PickList.Add('PARAMETROS');
             DBGrid1.Columns[6].PickList.Add('VENDAS');
          end;
      2 : begin
             DBGrid1.Columns[6].PickList.Clear;
             DBGrid1.Columns[6].PickList.Add(' ');
             DBGrid1.Columns[6].PickList.Add('VW_CLIENTES');
          end;
      3 : begin //Carnes
             DBGrid1.Columns[6].PickList.Clear;
             DBGrid1.Columns[6].PickList.Add(' ');
             DBGrid1.Columns[6].PickList.Add('CTASRECEBER');
             DBGrid1.Columns[6].PickList.Add('VW_CLIENTES');
             DBGrid1.Columns[6].PickList.Add('PARAMETROS');
          end;
      4 : begin //Bloquetos
             DBGrid1.Columns[6].PickList.Clear;
             DBGrid1.Columns[6].PickList.Add(' ');
             DBGrid1.Columns[6].PickList.Add('CTASRECEBER');
             DBGrid1.Columns[6].PickList.Add('VW_CLIENTES');
             DBGrid1.Columns[6].PickList.Add('DOCSCAPA');
             DBGrid1.Columns[6].PickList.Add('PARAMETROS');
          end;
   end;}
end;

procedure TFrmConfigDoc.SB_ExportaClick(Sender: TObject);
begin
   if SBGrava.Enabled then
   begin
      if MessageDlg('Foram feitas alterações nos "Itens para Impressão". Deseja salvá-las antes de exportar ?', mtWarning, [mbYes, mbNO],0) = mrYes then
         SBGravaClick(self)
      else
         SBCancelaClick(self);
   end;

end;

procedure TFrmConfigDoc.BtnImprimeClick(Sender: TObject);
begin
   //Imprime_Pesquisa('ConfigDocumentos',IBQry_Pes);
end;

procedure TFrmConfigDoc.StringGrid1DblClick(Sender: TObject);
begin
   if StringGrid1.Cells[0,StringGrid1.Row] = 'Não' then
   begin
      StringGrid1.Cells[0,StringGrid1.Row] := 'Sim';
   end
   else
      StringGrid1.Cells[0,StringGrid1.Row] := 'Não';
end;

procedure TFrmConfigDoc.StringGrid1DrawCell(Sender: TObject; Col, Row: Integer; aRect: TRect; aState: TGridDrawState);
var index : integer;
begin
  if (Col in [0,1]) and (Row > 0) then
  begin
     StringGrid1.Canvas.Brush.Color := $00C7C7C7;
     StringGrid1.Canvas.FillRect(aRect);
  end;

  if (Col = 0) and (Row > 0) and (StringGrid1.Cells[0,Row] <> '') then
  begin
     //index := aRow * StringGrid1.ColCount + aCol;
     if StringGrid1.Cells[0,Row] ='Sim' then
        index := 0
     else //if StringGrid1.Cells[0,Row] ='Não' then
        index := 1;
     with Sender as TStringGrid do
     begin
        //Canvas.Brush.Color := clBackGround;
        Canvas.FillRect(aRect);
        ImageList1.Draw(Canvas,aRect.Left,aRect.Top,index);
        //if gdFocused in State then
        //Canvas.DrawFocusRect(Rect);
     end;
  end;
end;

procedure TFrmConfigDoc.StringGrid1KeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   if key = VK_INSERT then
   begin
      StringGrid1.RowCount := StringGrid1.RowCount + 1;
   end;
end;

initialization
   {$i uconfigdoc.lrs}

end.


