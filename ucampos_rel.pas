unit UCampos_Rel;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, ComCtrls, Buttons, ImgList, Grids, DBGrids, ExtCtrls,
  Db, LResources;

type
  TRelColunas =  Record
    Campo       : String;
    Descricao   : String;
    Tamanho     : Integer;
    Mascara     : String;
    Alinhamento : String;
    Totaliza    : Boolean;
  end;

  TFrmSel_Campos_Rel = class(TForm)
     Edit_Tamanho: TEdit;
     Edit_LargCabecalho: TEdit;
     Edit_EspcLinhas: TEdit;
     Edit_TamFonte: TEdit;
     ListBox_Sel: TListBox;
    Label5: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    BitOK: TBitBtn;
    BitCancela: TBitBtn;
    ListBox_Disp: TListBox;
    Btn_Exclui: TBitBtn;
    Btn_Inclui: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Edit_Campo: TEdit;
    Combo_Mascara: TComboBox;
    Combo_Alinhamento: TComboBox;
    Edit_Descricao: TEdit;
    BtnGrava: TBitBtn;
    Chk_Totaliza: TCheckBox;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel2: TBevel;
    Label11: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    RB_Retrato: TRadioButton;
    RB_Paisagem: TRadioButton;
    Combo_Compressao: TComboBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    SB_Abrir: TSpeedButton;
    SB_Salvar: TSpeedButton;
    Label_Arquivo: TLabel;
    BtnAjuda: TBitBtn;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure Btn_IncluiClick(Sender: TObject);
    procedure Btn_ExcluiClick(Sender: TObject);
    procedure ListBox_DispDblClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitOKClick(Sender: TObject);
    procedure SB_AbrirClick(Sender: TObject);
    procedure SB_SalvarClick(Sender: TObject);
    procedure BtnAjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Select, Arquivo : String;
    Dados_Persistentes : Boolean;
  end;

var
  FrmSel_Campos_Rel: TFrmSel_Campos_Rel;
  RelColunas : TRelColunas;

implementation

uses Global, UPrincipal, UVariaveis;


procedure TFrmSel_Campos_Rel.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
   {if (DataSource1.State = dsBrowse) and (Pos(';',TextDataSet1LINE.AsString) > 0) then
   begin
      ListSep1.Entrada := TextDataSet1LINE.AsString;
      ListSep1.Execute;
      Edit_Campo.Text := ListSep1.Saida[0];
      Edit_Descricao.Text := ListSep1.Saida[1];
      Edit_Tamanho.Text := ListSep1.Saida[2];
      Combo_Alinhamento.ItemIndex := Procura_Item_ComboList(Combo_Alinhamento,ListSep1.Saida[3]);
      Combo_Mascara.Text := ListSep1.Saida[4];
      Chk_Totaliza.Checked := IIF(ListSep1.Saida[5] = '1',True,False);
   end;}
end;

procedure TFrmSel_Campos_Rel.FormShow(Sender: TObject);
var I : Integer;
    F: TextFile;
begin

   {try
      ConexIni := TRegIniFile.Create(Apelido+'\Relatorios');
      //Seguranca

      //Base dos Dados
      Edit_LargCabecalho.Value := ConexIni.ReadInteger(ExtractFileName(Arquivo),'LargCabecalho',0);
      if Edit_LargCabecalho.Value = 0 then  Edit_LargCabecalho.Value := 80;

      Combo_Compressao.ItemIndex := Procura_Item_ComboList(Combo_Compressao,ConexIni.ReadString(ExtractFileName(Arquivo),'Compressao','Nenhuma'));

      Edit_TamFonte.Value := ConexIni.ReadInteger(ExtractFileName(Arquivo),'TamFonte',0);
      if Edit_TamFonte.Value = 0 then Edit_TamFonte.Value := 10;

      Edit_EspcLinhas.Value := ConexIni.ReadInteger(ExtractFileName(Arquivo),'EspcLinhas',0);
      if Edit_EspcLinhas.Value = 0 then Edit_EspcLinhas.Value := 25;

      if ConexIni.ReadString(ExtractFileName(Arquivo),'Orientacao','Retrato') = 'Retrato' then
         RB_Retrato.Checked := True
      else
         RB_Paisagem.Checked := True;
      ConexIni.Free;
   except
      MessageDlg('Os dados não puderam ser carregados.',mtWarning,[mbok],0);
   end;}

   if Pos(':\',Arquivo) = 0 then
      Arquivo := ExtractFilePath(Application.ExeName) + Arquivo;

   if not Dados_Persistentes then
      DeleteFile(Arquivo);

   if not FileExists(Arquivo) then
   begin
      AssignFile(F,Arquivo);
      Rewrite(F);
      Writeln(F, '');
      CloseFile(F);
   end;

   TextDataSet1.Close;
   TextDataSet1.FileName := Arquivo;
   TextDataSet1.Open;

   IBQuery1.SQL.Clear;
   IBQuery1.SQL.Add(Select);
   if not IBQuery1.Prepared then IBQuery1.Prepare;
   //IBQuery1.Open;

   ListBox_Disp.Items.Clear;
   For I := 0 to IBQuery1.FieldDefs.Count-1 do
   begin
      ListBox_Disp.Items.Add(IBQuery1.FieldDefs[I].DisplayName);
      //ComboBox1.Items.Add(TiraAspas(IBQuery1.Fields[I].Origin));
   end;                                      fazer arquivo xml com conf. do relatorio
   Label_Arquivo.Caption := Arquivo; 
end;}

procedure TFrmSel_Campos_Rel.Btn_IncluiClick(Sender: TObject);
var aLinha : String;
begin
   if ListBox_Disp.ItemIndex >= 0 then
   begin
      aLinha := '';
      //Campo
      aLinha := aLinha + IBQuery1.FieldDefs[ListBox_Disp.ItemIndex].DisplayName;
      While Length(aLinha) < 25 do
         aLinha := aLinha + ' ';
      aLinha := aLinha + ';';

      //Descricao
      aLinha := aLinha + IBQuery1.FieldDefs[ListBox_Disp.ItemIndex].DisplayName + ';';
      //Tamanho
      //aLinha := aLinha + IntToStr(IBQuery1.FieldDefs[ListBox_Disp.ItemIndex].Size) + ';';
      Case IBQuery1.FieldDefs[ListBox_Disp.ItemIndex].DataType of
          ftInteger, ftSmallint      : aLinha := aLinha + ' 6' + ';';
          ftFloat, ftBCD             : aLinha := aLinha + '14' + ';';
          ftDate, ftTime             : aLinha := aLinha + '10' + ';';
          ftDateTime                 : aLinha := aLinha + '18' + ';';
          else aLinha := aLinha + IntToStr(IBQuery1.FieldDefs[ListBox_Disp.ItemIndex].Size) + ';';
      end;
      //Alinhamento
      Case IBQuery1.FieldDefs[ListBox_Disp.ItemIndex].DataType of
          ftInteger, ftSmallint, ftFloat, ftBCD  : aLinha := aLinha + 'Direita;';
          ftDate, ftTime, ftDateTime             : aLinha := aLinha + 'Centro;';
          else                                     aLinha := aLinha + 'Esquerda;';
      end;
      //Mascara
      aLinha := aLinha + '' + ';';
      //Totaliza
      aLinha := aLinha + '0' + ';';

      TextDataSet1.InsertRecord([aLinha]);
   end;
   TextDataSet1.Next;
end;

procedure TFrmSel_Campos_Rel.Btn_ExcluiClick(Sender: TObject);
begin
   TextDataSet1.Delete;
   TextDataSet1.Refresh;
   DBGrid1.Repaint;
end;

procedure TFrmSel_Campos_Rel.ListBox_DispDblClick(Sender: TObject);
begin
   Btn_Inclui.Click;
end;

procedure TFrmSel_Campos_Rel.BtnGravaClick(Sender: TObject);
var aLinha : String;
begin
   TextDataSet1.Edit;
   //Campo
   aLinha := aLinha + Edit_Campo.Text + ';';
   //Descricao
   aLinha := aLinha + Edit_Descricao.Text + ';';
   //Tamanho
   //aLinha := aLinha + IntToStr(IBQuery1.FieldDefs[ListBox_Disp.ItemIndex].Size) + ';';
   aLinha := aLinha + Trim(Edit_Tamanho.Text) + ';';
   //Alinhamento
   Case Combo_Alinhamento.ItemIndex of
       0 : aLinha := aLinha + 'Esquerda;';
       1 : aLinha := aLinha + 'Centro;';
       2 : aLinha := aLinha + 'Direita;';
   end;
   //Mascara
   aLinha := aLinha + Combo_Mascara.Text + ';';
   //Totaliza
   if Chk_Totaliza.Checked then
      aLinha := aLinha + '1' + ';'
   else
      aLinha := aLinha + '0' + ';';

   TextDataSet1Line.Value := aLinha ;
   TextDataSet1.Post;
   TextDataSet1.Refresh;
   TextDataSet1.Close;
   TextDataSet1.Open;
end;

procedure TFrmSel_Campos_Rel.DBGrid1DblClick(Sender: TObject);
begin
   Btn_Exclui.Click;
end;

procedure TFrmSel_Campos_Rel.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var ConexIni : TRegIniFile;
begin
   try
      ConexIni := TRegIniFile.Create(Apelido+'\Relatorios');
      ConexIni.WriteInteger(ExtractFileName(Arquivo),'LargCabecalho',StrToInt(Edit_LargCabecalho.Text));
      ConexIni.WriteString(ExtractFileName(Arquivo),'Compressao',Combo_Compressao.Text);
      ConexIni.WriteInteger(ExtractFileName(Arquivo),'TamFonte',StrToInt(Edit_TamFonte.Text));
      ConexIni.WriteInteger(ExtractFileName(Arquivo),'EspcLinhas',StrToInt(Edit_EspcLinhas.Text));
      if RB_Retrato.Checked then
         ConexIni.WriteString(ExtractFileName(Arquivo),'Orientacao','Retrato')
      else
         ConexIni.WriteString(ExtractFileName(Arquivo),'Orientacao','Paisagem');
      ConexIni.Free;
   except
      MessageDlg('Os dados não puderam ser gravados.',mtWarning,[mbok],0);
   end;
end;

procedure TFrmSel_Campos_Rel.BitOKClick(Sender: TObject);
begin
   if (TextDataSet1.Eof and TextDataSet1.Bof) then
   begin
      MessageDlg('Você precisa selecionar os campos para impressão.', mtInformation, [mbOK],0);
      Exit;
   end;
   TextDataSet1.First;
   While not TextDataSet1.EOF do
   begin
      if TextDataSet1Line.AsString = '' then
      begin
         TextDataSet1.Delete;
         TextDataSet1.First;
      end;
      TextDataSet1.Next;
   end;
end;

procedure TFrmSel_Campos_Rel.SB_AbrirClick(Sender: TObject);
begin
   if OpenDialog1.Execute then
   begin
      Arquivo := OpenDialog1.FileName;
      FormShow(self);
      with TextDataSet1 do
      begin
         DisableControls;
         try
            First;
            while not Eof do
            begin
               if (Trim(TextDataSet1Line.AsString) <> '') and (ListBox_Disp.Items.IndexOf(Trim(Copy(TextDataset1.FieldByName('CAMPO').asString,1,Pos(';',TextDataset1.FieldByName('CAMPO').asString)-1))) = -1) then
               begin
                  MessageDlg('Configuração inválida para este relatório.',mtWarning,[mbOK],0);
                  Close;
                  Exit;
               end;
               Next;
            end;
         finally
            EnableControls;
         end;
         First;
      end;
   end;
end;

procedure TFrmSel_Campos_Rel.SB_SalvarClick(Sender: TObject);
var F : TextFile;
    ConexIni : TRegIniFile;
begin
   if SaveDialog1.Execute then
   begin
      try
         AssignFile(F,SaveDialog1.FileName);
         Rewrite(F);
         TextDataSet1.First;
         While not TextDataSet1.Eof do
         begin
            Writeln(F, TextDataSet1LINE.AsString);
            TextDataSet1.Next;
         end;
         CloseFile(F);

         Arquivo := SaveDialog1.FileName;

         ConexIni := TRegIniFile.Create(Apelido+'\Relatorios');
         ConexIni.WriteInteger(ExtractFileName(Arquivo),'LargCabecalho',StrToInt(Edit_LargCabecalho.Text));
         ConexIni.WriteString(ExtractFileName(Arquivo),'Compressao',Combo_Compressao.Text);
         ConexIni.WriteInteger(ExtractFileName(Arquivo),'TamFonte',StrToInt(Edit_TamFonte.Text));
         ConexIni.WriteInteger(ExtractFileName(Arquivo),'EspcLinhas',StrToInt(Edit_EspcLinhas.Text));
         if RB_Retrato.Checked then
            ConexIni.WriteString(ExtractFileName(Arquivo),'Orientacao','Retrato')
         else
            ConexIni.WriteString(ExtractFileName(Arquivo),'Orientacao','Paisagem');
         ConexIni.Free;
      except
         MessageDlg('Os dados não foram gravados corretamente.',mtWarning,[mbok],0);
      end;
      FormShow(Self);
   end;
end;

procedure TFrmSel_Campos_Rel.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/cadGerais.htm');
end;

initialization
   {$i ucampos_rel.lrs}

end.
