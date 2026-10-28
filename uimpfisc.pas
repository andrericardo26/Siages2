unit UImpFisc;

{$MODE Delphi}

interface

uses
  {ACBrECF, ACBrBase, ACBrECFClass, ACBrECFBematech, }
  Classes, LCLIntf, Messages, SysUtils, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, IniFiles, CheckLst, Registry,
  LResources, MaskEdit, ACBrECF, StrUtils, typinfo;

type

  { TFrmImpFisc }

  TFrmImpFisc = class(TForm)
     ACBrECF1: TACBrECF;
     Bevel5: TBevel;
     BtnAjuda: TBitBtn;
     BtnCancela: TBitBtn;
     BtnGrava: TBitBtn;
     Btn_Incluir_Aliquota: TBitBtn;
     Btn_Incluir_FormaPagto: TBitBtn;
     BtnSair: TBitBtn;
     Btn_Incluir_Comprovantes: TBitBtn;
     Chk_Vinculado: TCheckBox;
     ComboImpressoras: TComboBox;
     EditDescricaoFormaPagto: TEdit;
     Edit_Indice_Comprovante: TEdit;
     Edit_Tipo_Comprovante: TEdit;
     Label22: TLabel;
     Label4: TLabel;
     Label7: TLabel;
     Label8: TLabel;
     ListFormasPagto: TCheckListBox;
     MskAliquota: TMaskEdit;
     MskPosicao: TMaskEdit;
     MskPosicao_FormaPagto: TMaskEdit;
     Page1: TPage;
     Page10: TPage;
     Page11: TPage;
     Page2: TPage;
     Page3: TPage;
     Page4: TPage;
     Page5: TPage;
     Page6: TPage;
     Page7: TPage;
     Page8: TPage;
     Page9: TPage;
    Panel1: TPanel;
    Label1: TLabel;
    ImageList1: TImageList;
    NoteImpr: TNotebook;
    NoteImprFiscal: TNotebook;
    Label_Impressora: TLabel;
    Label3: TLabel;
    Panel14: TPanel;
    Panel16: TPanel;
    Panel23: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    LabelData: TLabel;
    LabelHora: TLabel;
    LabelCaixa: TLabel;
    Label15: TLabel;
    LabelStatus: TLabel;
    Panel6: TPanel;
    Panel2: TPanel;
    Label10: TLabel;
    Panel4: TPanel;
    RG_Com: TRadioGroup;
    Panel7: TPanel;
    Label11: TLabel;
    SBAltera_Horario: TSpeedButton;
    Panel9: TPanel;
    Panel8: TPanel;
    Label12: TLabel;
    SBCarrega_FormasPagto: TSpeedButton;
    SBTrunca: TSpeedButton;
    SBArredonda: TSpeedButton;
    Panel10: TPanel;
    Panel11: TPanel;
    Label13: TLabel;
    Panel12: TPanel;
    RGTipoImposto: TRadioGroup;
    Panel13: TPanel;
    Label14: TLabel;
    Label16: TLabel;
    Bevel1: TBevel;
    SBCarrega_Aliquotas: TSpeedButton;
    Panel15: TPanel;
    Label17: TLabel;
    Bevel3: TBevel;
    BtnCarregaComprovantes: TSpeedButton;
    Panel19: TPanel;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Edit_Nome_Comprovante: TEdit;
    MemoComprovantes: TMemo;
    Panel17: TPanel;
    Label25: TLabel;
    Panel18: TPanel;
    RG_Intervalo: TRadioGroup;
    Bevel2: TBevel;
    MskI: TMaskEdit;
    MskF: TMaskEdit;
    Label20: TLabel;
    Label21: TLabel;
    SB_Arquivo: TSpeedButton;
    SB_Impressora: TSpeedButton;
    BitBtn1: TBitBtn;
    Panel20: TPanel;
    Label26: TLabel;
    Panel21: TPanel;
    Btn_LeitX: TBitBtn;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Btn_RedZ: TBitBtn;
    Bevel4: TBevel;
    Label30: TLabel;
    ListAliquotas: TCheckListBox;
    Label2: TLabel;
    Panel22: TPanel;
    Btn_ConfigLinhas: TBitBtn;
    BitBtn2: TBitBtn;
    TreeView1: TTreeView;
    procedure BtnInlcuir_AliquotaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Btn_Incluir_ComprovantesClick(Sender: TObject);
    procedure Btn_Incluir_FormaPagtoClick(Sender: TObject);
    procedure FrmImpFiscCreate(Sender: TObject);
    procedure ImageList1Change(Sender: TObject);
    procedure SBAltera_HorarioClick(Sender: TObject);
    procedure SBArredondaClick(Sender: TObject);
    procedure SBCarrega_Aliquotas1Click(Sender: TObject);
    procedure SBCarrega_FormasPagtoClick(Sender: TObject);
    procedure SBTruncaClick(Sender: TObject);
    procedure SB_ArquivoClick(Sender: TObject);
    procedure SB_ImpressoraClick(Sender: TObject);
    procedure TreeView1Changing(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure NoteBematechPageChanged(Sender: TObject);
    procedure SBHora_VeraoClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure MskAliquotaChange(Sender: TObject);
    procedure EditMoedaChange(Sender: TObject);
    procedure SBCarrega_AliquotasClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RG_IntervaloClick(Sender: TObject);
    procedure RG_ComClick(Sender: TObject);
    procedure ComboImpressorasChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Btn_LeitXClick(Sender: TObject);
    procedure Btn_RedZClick(Sender: TObject);
    procedure SBVinculaIssClick(Sender: TObject);
    procedure BtnAjudaClick(Sender: TObject);
    procedure Btn_ConfigLinhasClick(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure BitBtn2Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
var
  FrmImpFisc: TFrmImpFisc;

implementation

uses UPrincipal, Global, UVariaveis;


procedure TFrmImpFisc.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmImpFisc.Btn_Incluir_ComprovantesClick(Sender: TObject);
var Comprovante : string;
begin
   Comprovante := Edit_Nome_Comprovante.Text;
   ACBrECF1.ProgramaComprovanteNaoFiscal(Comprovante,Edit_Tipo_Comprovante.Text,Edit_Indice_Comprovante.Text);
end;

procedure TFrmImpFisc.Btn_Incluir_FormaPagtoClick(Sender: TObject);
var FormaPagto : string;
begin
   FormaPagto := EditDescricaoFormaPagto.Text;
   ACBrECF1.ProgramaFormaPagamento(FormaPagto,Chk_Vinculado.Checked,MskPosicao.Text);
end;

procedure TFrmImpFisc.FrmImpFiscCreate(Sender: TObject);
begin
   TreeView1.Items.AddChild(Nil,'Impressora Fiscal');
   TreeView1.Items.AddChild(Nil,'Porta Comunicação');
   TreeView1.Items.AddChild(Nil,'Horário Verão');
   TreeView1.Items.AddChild(Nil,'Trunca - Arredonda');
   TreeView1.Items.AddChild(Nil,'Alíquotas');
   TreeView1.Items.AddChild(Nil,'Formas de Pagamento');
   TreeView1.Items.AddChild(Nil,'Comprovantes Não Fiscais');
   TreeView1.Items.AddChild(Nil,'Memória Fiscal');
   TreeView1.Items.AddChild(Nil,'Relatórios');
   TreeView1.Items.AddChild(Nil,'Outros');
end;

procedure TFrmImpFisc.BtnInlcuir_AliquotaClick(Sender: TObject);
begin
   if MessageDlg('Tem certeza que deseja incluir alíquota "'+ MskAliquota.Text +'" - ' + RGTipoImposto.Items[RGTipoImposto.ItemIndex] + ' ?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
      ACBrECF1.ProgramaAliquota((StrToFloat(TrocaVirgula_Ponto(MskAliquota.Text))),'S',MskPosicao.Text);
   end;
end;

procedure TFrmImpFisc.ImageList1Change(Sender: TObject);
begin

end;

procedure TFrmImpFisc.SBAltera_HorarioClick(Sender: TObject);
begin
   ACBrECF1.MudaHorarioVerao;
end;

procedure TFrmImpFisc.SBArredondaClick(Sender: TObject);
begin
   ACBrECF1.MudaArredondamento(True);
end;

procedure TFrmImpFisc.SBCarrega_Aliquotas1Click(Sender: TObject);
var cAliquotas, Aux : String;
    I : Integer;
Begin
   ACBrECF1.CarregaAliquotas;
   ListAliquotas.Items.Clear;
   ListAliquotas.Items.BeginUpdate;
   for I := 0 to ACBrECF1.Aliquotas.Count -1 do
   begin
      ListAliquotas.Items.Add('Aliquota: '+ACBrECF1.Aliquotas[I].Indice +' -> '+ FloatToStr(ACBrECF1.Aliquotas[I].Aliquota));
   end;
   ListAliquotas.Items.EndUpdate;
end;

procedure TFrmImpFisc.SBCarrega_FormasPagtoClick(Sender: TObject);
var I : Integer;
Begin
   ACBrECF1.CarregaFormasPagamento;
   ListFormasPagto.Items.Clear;
   ListFormasPagto.Items.BeginUpdate;
   for I := 0 to ACBrECF1.FormasPagamento.Count -1 do
   begin
      ListFormasPagto.Items.Add(' '+ACBrECF1.FormasPagamento[I].Indice +' -> '+ ACBrECF1.FormasPagamento[I].Descricao + IIF(ACBrECF1.FormasPagamento[I].PermiteVinculado,'VINC',''));
   end;
   ListFormasPagto.Items.EndUpdate;
end;

procedure TFrmImpFisc.SBTruncaClick(Sender: TObject);
begin
   ACBrECF1.MudaArredondamento(False);
end;

procedure TFrmImpFisc.SB_ArquivoClick(Sender: TObject);
begin

end;

procedure TFrmImpFisc.SB_ImpressoraClick(Sender: TObject);
begin

end;

procedure TFrmImpFisc.TreeView1Changing(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
begin
   //if BtnGrava.Enabled = True then AllowChange := False;
end;

procedure TFrmImpFisc.FormShow(Sender: TObject);
var I : Integer;
begin
   Screen.Cursor := crHourGlass;
   try
      with ComboImpressoras do
      begin
         Items.BeginUpdate;
         Items.Clear;
         ItemIndex := -1;
         for I := Integer(Low(TACBrECFModelo)) to Integer(High(TACBrECFModelo)) do
            Items.Add(GetEnumName(TypeInfo(TACBrECFModelo),I));

         ItemIndex := Parametros.IMPR_FISCAL;
         Items.EndUpdate;
         ComboImpressorasChange(Self);
      end;

//      LabelStatus.Caption := Copy((GetEnumName(TypeInfo(TACBrECFEstado),Integer(ACBrECF1.Estado))),4,length((GetEnumName(TypeInfo(TACBrECFEstado),Integer(ACBrECF1.Estado)))));
      LabelData.Caption := FormatDateTime('dd/mm/yyyy',ACBrECF1.DataHora);
      LabelHora.Caption := FormatDateTime('hh:nn',ACBrECF1.DataHora);
      LabelCaixa.Caption := ACBrECF1.NumECF;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmImpFisc.NoteBematechPageChanged(Sender: TObject);
var Nro_Verao : Integer;
    Trunc_Arred: String;
begin
   Screen.Cursor := crHourGlass;
   try
      if NoteImprFiscal.PageIndex = 0 then
      begin
         FormShow(Self);
      end
      else
      if NoteImprFiscal.PageIndex = 1 then
      begin
         RG_Com.ItemIndex := StrToInt(Parametros.PORTA[4])-1;
      end
      else
      if NoteImprFiscal.PageIndex = 2 then
      begin
         //Implementar
      end
      else
      If NoteImprFiscal.PageIndex = 3 then//Trunca - Arredonda
      begin
         if ACBrECF1.Arredonda then
            SBArredonda.Down := True
         else
            SBArredonda.Down := False;
      end
      else
      If NoteImprFiscal.PageIndex = 4 then//Cadastro Aliquotas
      begin
         //Implementar
      end
      else
      If NoteImprFiscal.PageIndex = 5 then//Cadastro Moeda
      begin
         //Implementar
      end;
   Finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmImpFisc.SBHora_VeraoClick(Sender: TObject);
begin

end;

procedure TFrmImpFisc.BtnGravaClick(Sender: TObject);
var Mens, sComando: String;
    Impr_Ini:  TIniFile;
    oRetorno : Integer;
    LeIni : TIniFile;
begin
   Screen.Cursor := crHourGlass;
   Try
      //combo
      if ComboImpressoras.ItemIndex <> Parametros.IMPR_FISCAL then
      begin
         LeIni := TIniFile.Create(ExtractFileDir(Application.ExeName) + '/' + Apelido + '.ini');
         //Impressora Fiscal
         LeIni.WriteInteger('Parametros','ImprFiscal',ComboImpressoras.ItemIndex);
         LeIni.Free;

         ComboImpressorasChange(Self);
         FrmPrincipal.Carrega_Parametros;
         NoteBematechPageChanged(Self);
      end
      else if NoteImprFiscal.PageIndex = 1 then
      begin
         if MessageDlg('Tem certeza que deseja configurar a Impressora Fiscal para a porta '+ RG_Com.Items[RG_Com.ItemIndex] +' ?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
         begin
            LeIni := TIniFile.Create(ExtractFileDir(Application.ExeName) + '/' + Apelido + '.ini');
            //Porta da Impressora Fiscal
            LeIni.WriteString('Parametros','Porta',RG_Com.Items[RG_Com.ItemIndex]);
            LeIni.Free;
            
            MessageDlg('Para que esta configuração tenha efeito, você deve sair antes do programa.', mtWarning,[mbOK],0);
         end;
      end
      else if NoteImprFiscal.PageIndex = 2 then
      begin
         if MessageDlg('Deseja alterar o Horário da impressora ?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
         begin
            ACBrECF1.MudaHorarioVerao;
         end
         else
            Exit;
      end
      else if NoteImprFiscal.PageIndex = 3 then
      begin
         //Implementar
      end
      else if NoteImprFiscal.PageIndex = 4 then  //Cadastro de aliquotas
      begin
         oRetorno := 0;
         if ComboImpressoras.ItemIndex = 1 then
            Mens := 'tipo '+ RGTipoImposto.Items[RGTipoImposto.ItemIndex];
         if MessageDlg('Tem certeza que deseja incluir alíquota "'+ MskAliquota.Text +'" ' + Mens + ' ?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
         begin
            //Implementar
         end;
      end
      else if NoteImprFiscal.PageIndex = 5 then  //Cadastro de Formas de Pagamento
      begin
         //if MessageDlg('Tem certeza que deseja alterar o símbolo da moeda para '+ Trim(EditMoeda.Text) +'$ ?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
         //begin
            //Implementar
         //end;
      end
      else if NoteImprFiscal.PageIndex = 6 then  //Cadastro Totalizadores
      begin
         {if MessageDlg('Tem certeza que deseja incluir totalizador "'+ Edit_Nome.Text +'" ?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
         begin
            //Implementar
         end; }
      end;
      BtnGrava.Enabled := False;
      BtnCancela.Enabled := False;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmImpFisc.BtnCancelaClick(Sender: TObject);
begin
   //combo
   if ComboImpressoras.ItemIndex <> Parametros.IMPR_FISCAL then
   begin
      ComboImpressoras.ItemIndex := Parametros.IMPR_FISCAL;
      ComboImpressorasChange(Self);
   end;

   if NoteImprFiscal.PageIndex = 1 then
   begin
      RG_Com.ItemIndex := StrToInt(Parametros.PORTA[4])-1;
   end
   else if NoteImprFiscal.PageIndex = 2 then
   begin

   end
   else if NoteImprFiscal.PageIndex = 3 then
   begin
      //if oModo = 0 then
      //   SBArredonda.Down := True
      //else
      //   SBTrunca.Down := True;
   end
   else if NoteImprFiscal.PageIndex = 4 then  //Cadastro Aliquota
   begin
      MskAliquota.Text := '';
      RGTipoImposto.ItemIndex := 0;
   end
   else if NoteImprFiscal.PageIndex = 5 then  //Cadastro Moeda
   begin
      //EditMoeda.Text := aMoeda;
   end
   else if NoteImprFiscal.PageIndex = 6 then  //Cadastro Totalizadores
   begin
      Edit_Indice_Comprovante.Text := '0';
   end;
   BtnGrava.Enabled := False;
   BtnCancela.Enabled := False;
end;

procedure TFrmImpFisc.MskAliquotaChange(Sender: TObject);
begin
   if Trim(MskAliquota.Text) <> ',' then
   begin
      BtnGrava.Enabled := True;
      BtnCancela.Enabled := True;
   end
   else
   begin
      BtnGrava.Enabled := False;
      BtnCancela.Enabled := False;
   end;
end;

procedure TFrmImpFisc.EditMoedaChange(Sender: TObject);
begin
   BtnGrava.Enabled := True;
   BtnCancela.Enabled := True;
end;

procedure TFrmImpFisc.SBCarrega_AliquotasClick(Sender: TObject);
var I : Integer;
Begin
   ACBrECF1.CarregaAliquotas;
   ListAliquotas.Items.Clear;
   ListAliquotas.Items.BeginUpdate;
   for I := 0 to ACBrECF1.Aliquotas.Count -1 do
   begin
      ListAliquotas.Items.Add('Aliquota: '+ACBrECF1.Aliquotas[I].Indice +' -> '+ FloatToStr(ACBrECF1.Aliquotas[I].Aliquota));
   end;
   ListAliquotas.Items.EndUpdate;
end;

procedure TFrmImpFisc.SpeedButton3Click(Sender: TObject);
var I : Integer;
Begin
   ACBrECF1.CarregaComprovantesNaoFiscais;
   MemoComprovantes.Lines.Clear;
   MemoComprovantes.Lines.BeginUpdate;
   for I := 0 to ACBrECF1.ComprovantesNaoFiscais.Count -1 do
   begin
      MemoComprovantes.Lines.Add(' '+ACBrECF1.ComprovantesNaoFiscais[I].Indice +' -> '+ ACBrECF1.ComprovantesNaoFiscais[I].Descricao + IIF(ACBrECF1.ComprovantesNaoFiscais[I].PermiteVinculado,'VINC',''));
   end;
   MemoComprovantes.Lines.EndUpdate;
end;

procedure TFrmImpFisc.RG_IntervaloClick(Sender: TObject);
begin
   MskI.Text := '';
   MskF.Text := '';
   if RG_Intervalo.ItemIndex = 0 then
   begin
      MskI.EditMask := '99/99/9999;1;_';
      MskF.EditMask := '99/99/9999;1;_';
   end
   else
   begin
      MskI.EditMask := '9999;1;_';
      MskF.EditMask := '9999;1;_';
   end;
end;

procedure TFrmImpFisc.RG_ComClick(Sender: TObject);
begin
   if RG_Com.ItemIndex <> (StrToInt(Parametros.PORTA[4])-1) then
   begin
      BtnGrava.Enabled := True;
      BtnCancela.Enabled := True;
   end;
end;

procedure TFrmImpFisc.ComboImpressorasChange(Sender: TObject);
begin
   if ComboImpressoras.ItemIndex <> Parametros.IMPR_FISCAL then
   begin
      BtnGrava.Enabled := True;
      BtnCancela.Enabled := True;
   end;
   NoteImpr.Visible := True;
   case ComboImpressoras.ItemIndex of
      -1  : NoteImpr.Visible := False;
      0,1,2 : NoteImpr.PageIndex := 0;
      //2   : NoteImpr.PageIndex := 1;
   end;
end;

procedure TFrmImpFisc.BitBtn1Click(Sender: TObject);
var Arquivo : TStringList;
begin
   if RG_Intervalo.ItemIndex = 0 then
   begin
      if not (ValiData(MskI.Text) or ValiData(MskF.Text)) then
      begin
         MessageDlg('Data Inicial ou Final inválida.',mtInformation,[mbOK],0);
         MskI.SetFocus; Exit;
      end;
      if StrToDate(MskF.Text) < StrToDate(MskI.Text) then
      begin
         MessageDlg('Data Final não pode ser menor que a Inicial.',mtInformation,[mbOK],0);
         MskI.SetFocus; Exit;
      end;

      if SB_Arquivo.Down then
      begin
         Arquivo := TStringList.Create;
         try

            //ACBrECF1.LeituraMemoriaFiscal();
            //Bematech_Retorno := Bematech_FI_LeituraMemoriaFiscalSerialData(FormatDateTime('dd/mm/yy',StrToDate(MskI.Text)),FormatDateTime('dd/mm/yy',StrToDate(MskF.Text)))
         except
            Arquivo.Free;
            Arquivo := Nil;
         end;
      end
      else
         //Bematech_Retorno := Bematech_FI_LeituraMemoriaFiscalData(FormatDateTime('dd/mm/yy',StrToDate(MskI.Text)),FormatDateTime('dd/mm/yy',StrToDate(MskF.Text)));
   end
   else
   begin
      if not (ValInteger(Trim(MskI.Text)) or ValInteger(Trim(MskF.Text))) then
      begin
         MessageDlg('Redução Inicial ou Final inválida.',mtInformation,[mbOK],0);
         MskI.SetFocus; Exit;
      end;
      if StrToInt(Trim(MskF.Text)) < StrToInt(Trim(MskI.Text)) then
      begin
         MessageDlg('Redução Final não pode ser menor que a Inicial.',mtInformation,[mbOK],0);
         MskI.SetFocus; Exit;
      end;

      if SB_Arquivo.Down then
      begin
         //Bematech_Retorno := Bematech_FI_LeituraMemoriaFiscalSerialReducao(Trim(MskI.Text), Trim(MskF.Text));
      end
      else
         //Bematech_Retorno := Bematech_FI_LeituraMemoriaFiscalReducao(Trim(MskI.Text), Trim(MskF.Text));
   end;
end;

procedure TFrmImpFisc.Btn_LeitXClick(Sender: TObject);
begin
   if MessageDlg('Tem certeza que deseja realizar uma Leitura X ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      ACBrECF1.LeituraX;
   end;
end;

procedure TFrmImpFisc.Btn_RedZClick(Sender: TObject);
var oRetorno : Integer;
    aData : string;
begin
   if MessageDlg('A Redução Z impossibilitará novas impressões'+#13
                    +'de Cupons Fiscais neste dia!'+#13+#13+'Tem certeza que deseja continuar ?', mtConfirmation,
                    [mbYes, mbNo], 0) = mrYes then
   begin
      ACBrECF1.ReducaoZ(Now);
   end;
end;

procedure TFrmImpFisc.SBVinculaIssClick(Sender: TObject);
var I, oRetorno : Integer;
    Aliquotas, sComando : String;
begin

end;

procedure TFrmImpFisc.BtnAjudaClick(Sender: TObject);
begin
   Chama_Ajuda('Paginas/bemvindo.htm');
end;

procedure TFrmImpFisc.Btn_ConfigLinhasClick(Sender: TObject);
var NroLinhas : String;
begin
   NroLinhas := InputBox('Linhas entre Cupons','Informe o número de linhas ', '');
   if NroLinhas <> '' then
   begin

   end;
end;

procedure TFrmImpFisc.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
   NoteImprFiscal.PageIndex := Node.AbsoluteIndex;
end;

procedure TFrmImpFisc.BitBtn2Click(Sender: TObject);
var cFormas, aForma, Aux : String;
    iConta, I : Integer;
begin
   aForma := InputBox('Cadastro de Formas de Pagamento','Informe o nome da Forma de Pagamento ', '');
   if aForma <> '' then
   begin

   end;
end;

procedure TFrmImpFisc.TreeView1Click(Sender: TObject);
begin

end;

initialization
   {$i uimpfisc.lrs}

end.

