unit uprincipal; 

{$MODE Delphi}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, Menus, StdCtrls, MaskEdit, CheckLst,
  ComCtrls, Inifiles, LCLType, ZConnection, ZDataset;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
     ApplicationProperties1: TApplicationProperties;
     ApplicationProperties2: TApplicationProperties;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Image1: TImage;
    ImageList1: TImageList;
    MenuItem1: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem75: TMenuItem;
    MenuItem76: TMenuItem;
    MenuItem77: TMenuItem;
    MenuItem78: TMenuItem;
    MenuItem79: TMenuItem;
    MenuItem80: TMenuItem;
    MenuItem81: TMenuItem;
    MenuItem82: TMenuItem;
    MenuItem83: TMenuItem;
    MenuItem84: TMenuItem;
    MenuItem85: TMenuItem;
    MenuItem86: TMenuItem;
    MenuItem87: TMenuItem;
    MenuItem88: TMenuItem;
    MenuItem89: TMenuItem;
    MenuItem90: TMenuItem;
    MenuItem91: TMenuItem;
    MenuItem_Cadastro_Prod: TMenuItem;
    MenuItem_Consulta_Precos: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    MenuItem62: TMenuItem;
    MenuItem63: TMenuItem;
    MenuItem64: TMenuItem;
    MenuItem65: TMenuItem;
    MenuItem66: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem68: TMenuItem;
    MenuItem69: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem70: TMenuItem;
    MenuItem71: TMenuItem;
    MenuItem72: TMenuItem;
    MenuItem73: TMenuItem;
    MenuItem74: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    PopupMenu1: TPopupMenu;
    SB_Clientes: TSpeedButton;
    SB_Complementares: TSpeedButton;
    SB_Vendedores: TSpeedButton;
    SB_VendasBalcao: TSpeedButton;
    SB_CtasReceber: TSpeedButton;
    SB_CtasPagar: TSpeedButton;
    SB_MovCaixa: TSpeedButton;
    SB_MovBancario: TSpeedButton;
    SB_Sair: TSpeedButton;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    MenuItemCadastros: TMenuItem;
    Panel1: TPanel;
    SB_Produtos: TSpeedButton;
    Conexao: TZConnection;
    ZQuery1: TZQuery;
    procedure ApplicationProperties1ShowHint(var HintStr: string;
       var CanShow: Boolean; var HintInfo: THintInfo);
    procedure FrmPrincipalClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FrmPrincipalCreate(Sender: TObject);
    procedure FrmPrincipalResize(Sender: TObject);
    procedure FrmPrincipalShow(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure LimpaCampos(oform : TForm;CompTag: Integer);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem62Click(Sender: TObject);
    procedure MenuItem64Click(Sender: TObject);
    procedure MenuItem69Click(Sender: TObject);
    procedure MenuItem70Click(Sender: TObject);
    procedure MenuItem71Click(Sender: TObject);
    procedure MenuItem74Click(Sender: TObject);
    procedure MenuItem77Click(Sender: TObject);
    procedure MenuItem79Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem81Click(Sender: TObject);
    procedure MenuItem84Click(Sender: TObject);
    procedure MenuItem86Click(Sender: TObject);
    procedure MenuItem88Click(Sender: TObject);
    procedure MenuItem89Click(Sender: TObject);
    procedure MenuItem90Click(Sender: TObject);
    procedure MenuItem_Cadastro_ProdClick(Sender: TObject);
    procedure MenuItem_Consulta_PrecosClick(Sender: TObject);
    procedure MenuItem91Click(Sender: TObject);
    procedure RodaSP(Proc:TZQuery);
    Function RodaConsulta(oSelect: String; var aQry: TZQuery): Boolean;
    Function RodaComando(oComando:string):boolean;
    Function Configura_Base : Boolean;
    Procedure Carrega_Impressoras;
    Procedure Carrega_Parametros;
    function Busca_Controle(oGenerator: String) : Integer;
    procedure SB_ClientesClick(Sender: TObject);
    procedure SB_ComplementaresClick(Sender: TObject);
    procedure SB_CtasPagarClick(Sender: TObject);
    procedure SB_CtasReceberClick(Sender: TObject);
    procedure SB_MovBancarioClick(Sender: TObject);
    procedure SB_MovCaixaClick(Sender: TObject);
    procedure SB_ProdutosClick(Sender: TObject);
    procedure SB_SairClick(Sender: TObject);
    procedure SB_VendasBalcaoClick(Sender: TObject);
    procedure SB_VendedoresClick(Sender: TObject);
    procedure AppKEYDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TrataErro(E:Exception);
    
  private
    { private declarations }

  public
    SenhaModalResult: boolean;
    { public declarations }
  end; 

var
  FrmPrincipal: TFrmPrincipal;


implementation

{ TFrmPrincipal }

uses umarca, usplash, global, usenha, uvariaveis, uconfbase, ugrupo, usubgrupo,
     usitutrib, utribprod, uproduto, uvendedor, ufornec, upraca,
     usituacaoclientes, uclassclientes, uatividade, uclientes, utransportador,
     uobserv, ucodfiscais, uvendaslen, uimpressoras, uparametros, ucatsubcat,
     uctareceber, umovt_caixa, ubancos, uctacorrente, umovt_bancos, uctapagar,
     urel_movcaixabanco, urel_ctas_receber, urel_ctas_pagar, uformpagto,
     uconfigdoc, uconsulta_precos, uajuste, ureajuste, usobre, uvendas,
     uimpfisc, upedcompras, upedvendas, usobre3;

function TFrmPrincipal.Busca_Controle(oGenerator: String) : Integer;
var zQuery : TZQuery;
begin
   zQuery := TZQuery.Create(self);
   try
      // JvQuery.Database := FrmPrincipal.Base;
      zQuery.Connection := FrmPrincipal.Conexao;
      //  JvQuery.Transaction := FrmPrincipal.Transaction;

      if not RodaConsulta('Select Gen_ID('+ oGenerator +',1) as CONTROLE from RDB$DATABASE' ,zQuery) then
      begin
         Raise Exception.Create('Controle não pode ser carregado. Feche a aplicação e tente novamente.');
      end
      else
      begin
         Result := zQuery.FieldByName('CONTROLE').asInteger;
      end;
   except
      zQuery.Close;
      zQuery.Free;
   end;
end;

procedure TFrmPrincipal.TrataErro(E:Exception);
begin
{   if (E is EUIBError)  then
   begin
      case (E as EUIBError).SQLCode of
      //   -913: begin //DEADLOCK a transação não pode continuar por que esta bloqueada por outra na rede
      //            MessageDlg('Transação será revertida. Registro em Uso na Rede',mtError,[mbOK],0);
      //         end;
         -530: begin
                 MessageDlg('Violação de Integridade Referencial - '+Copy(E.message,38,Pos('on table',E.Message)-40)+ '.' + #13 +
                            'Na tabela '+ Copy(E.message,Pos('on table',E.Message)+8,Length(E.Message)-2)+ '.',mtError,[mbOK],0);
               end;

         // O usuario não possui senha no interbase ou vc não disponibilizou acesso a certas tabelas
         -902: MessageDlg('Usuário ou senha inválida. Você não tem Acesso ao Banco de Dados.'+ #13 +' Contate o Administrador.'+ #13 +E.Message,mtError,[mbOK],0);

         -625: MessageDlg('Campo '+Copy(E.message,29,Pos(',',E.Message)-29)+' não pode ser Nulo ou Valor Inválido.',mtWarning,[mbOK],0);

         //QUANDO E QUEBRADA UMA CHECK()
         -297: MessageDlg('Check '+Copy(E.message,36,Pos(' on ',E.Message)-35)+' violado na tabela '+ Copy(E.message,Pos('table ',E.Message) + 5,Length(E.message)) +'.'+ #13 + 'Operação cancelada.',mtWarning,[mbOK],0);

         -551: MessageDlg('Você não tem permissão para esta Operação. Contate o Administrador.',mtError,[mbOK],0);

         -832: MessageDlg('Este registro não pode ser excluído porque' + #10 +
                           'existem outros que dependem dele e que não foram excluídos',mtError,[mbOK],0);

         12203: MessageDlg('Base de Dados está fora do ar. Favor entrar'
                            + #10 + 'em contato com o responsável  pela rede na '
                            + #10 + 'localidade selecionada  ou tente mais tarde.',mtError,[mbOK],0);

         -803: MessageDlg('Chave Primária já existente. Registro não pode ser duplicado.',mtError,[mbOK],0);



         -10256 : MessageDlg('Erro desconhecido do SGDB. Contate o Administrator.',mtError,[mbOK],0);

         //O Código abaixo é para as Exception criadas por nós
         -836 :  MessageDlg(Copy(E.message,Pos('|',E.message)+1,Length(E.message)),mtError,[mbOK],0);

         else
            MessageDlg('Tipo: EUIBError  Código:'+IntToStr((E as EUIBError).SQlCode)+#13+E.message,mtError,[mbOK],0);
      end;
   end
   else
      MessageDlg(E.message,mtError,[mbOK],0);  }
end;

procedure TFrmPrincipal.SB_ClientesClick(Sender: TObject);
begin
   CriaForm(TFrmClientes);
end;

procedure TFrmPrincipal.SB_ComplementaresClick(Sender: TObject);
begin
   PopupMenu1.PopUp(Left + SB_Complementares.Left,Top + SB_Complementares.Top + SB_Complementares.Height + 48);
end;

procedure TFrmPrincipal.SB_CtasPagarClick(Sender: TObject);
begin
   CriaForm(TFrmCtaPagar);
end;

procedure TFrmPrincipal.SB_CtasReceberClick(Sender: TObject);
begin
   CriaForm(TFrmCtaReceber);
end;

procedure TFrmPrincipal.SB_MovBancarioClick(Sender: TObject);
begin
   CriaForm(TFrmMovtoBancos);
end;

procedure TFrmPrincipal.SB_MovCaixaClick(Sender: TObject);
begin
   CriaForm(TFrmMovtoCaixa);
end;

procedure TFrmPrincipal.SB_ProdutosClick(Sender: TObject);
begin
   PopupMenu2.PopUp(Left + SB_Produtos.Left,Top + SB_Produtos.Top + SB_Produtos.Height + 48);
end;

procedure TFrmPrincipal.SB_SairClick(Sender: TObject);
begin
   // Close;
   // Application.Terminate;
   Sair_Programa(true);
end;

procedure TFrmPrincipal.SB_VendasBalcaoClick(Sender: TObject);
begin
   CriaForm(TFrmVendasRap);
end;

procedure TFrmPrincipal.SB_VendedoresClick(Sender: TObject);
begin
   CriaForm(TFrmVendedor);
end;

procedure TFrmPrincipal.AppKEYDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if not((Screen.ActiveCustomForm.ActiveControl is TButton) or (Screen.ActiveCustomForm.ActiveControl is TBitBtn)) then
   begin
      if Key = VK_RETURN then
      begin
         Key := VK_UNKNOWN;
         //Screen.ActiveCustomForm.PerformTab(True);
         if (Screen.ActiveCustomForm.ActiveControl is TEdit) then
         begin
            if ((Screen.ActiveCustomForm.ActiveControl as TEdit).Tag = 10) and ((Screen.ActiveCustomForm.ActiveControl as TEdit).Text <> '') then
            begin
               Screen.ActiveCustomForm.PerformTab(True);
               Screen.ActiveCustomForm.PerformTab(False);
            end
            else
               Screen.ActiveCustomForm.PerformTab(True);
         end
         else
            Screen.ActiveCustomForm.PerformTab(True);
      end;
   end;
end;

procedure TFrmPrincipal.FrmPrincipalCreate(Sender: TObject);
begin
   {$ifdef unix}
   //  gtk_rc_parse(pChar(ParamStr(1)));
   {$endif}

//   Conexao.Connected:= True;

   ShortDateFormat := 'dd/mm/yyyy';
   DateSeparator := '/';
   DecimalSeparator := ',';
   ThousandSeparator := '.';

   Application.Navigation := [anoTabToSelectNext, anoReturnForDefaultControl, anoEscapeForCancelControl];
   Application.AddOnKeyDownHandler(AppKEYDown,True);

   if not Configura_Base then
   begin
      Sair_Programa(False);
      Exit;
   end;

   //Critério da Senha
//   Try
      FrmSenha := TFrmSenha.Create(Application);
//      while Base.Connected = False do
//      begin
         SenhaModalResult := false;
         FrmSenha.Showmodal;
         if (SenhaModalResult) and
            (Trim(FrmSenha.Edit_Usuario.Text) <> '') and
            (Trim(FrmSenha.Edit_Senha.Text) <> '')  then
         begin
            SenhaModalResult := false;
            Usuario.Nome  := Trim(FrmSenha.Edit_Usuario.Text);
            Usuario.Senha := Trim(FrmSenha.Edit_Senha.Text);
            Usuario.Grupo := Trim(FrmSenha.Edit_Grupo.Text);
                       {
            Base.Connected := False;
            Base.Params.Add('USER_NAME=' + Usuario.Nome);
            Base.Params.Add('PASSWORD=' + Usuario.Senha);
            Base.Params.Add('lc_ctype=WIN1252');
            Base.Params.Add('sql_role_name=' + Usuario.Grupo);
            Try
               Base.Connected := True;
               if Base.Connected = True then
               begin
                  Carrega_Impressoras;
                  Carrega_Parametros;
               end;
            except
               On E:Exception do
               begin
                  TrataErro(E);
               end;
            end;      }
         end
         else
         begin
            Sair_Programa(False);
         //   break;
         end;
  //    end;
{   finally
      FrmSenha.Release;
      FrmSenha := nil;
   end;}

   //StatusBar
   StatusBar1.Panels[0].Width := 550;//Round(Width * StrToFloat('0.8')); //80 %
   StatusBar1.Panels[1].Width := 200;
   StatusBar1.Panels[1].Text := 'Usuário: ' + Usuario.Nome;
end;

procedure TFrmPrincipal.FrmPrincipalResize(Sender: TObject);
begin
   Image1.Left := (ClientWidth - Image1.ClientWidth);
   Image1.Top := (ClientHeight - (Image1.ClientHeight + StatusBar1.Height + 5));
end;

procedure TFrmPrincipal.FrmPrincipalShow(Sender: TObject);
begin
   Caption := Caption + '  -  ' + Parametros.RAZAO_SOCIAL;
   Left := 0; Top := 0;
   Width := Screen.Width;
   Height := Screen.Height -30;
end;

Procedure TFrmPrincipal.Carrega_Parametros;
var I : Integer;
    LeIni : TIniFile;
   zQuery : TZQuery;
begin
  zQuery := TZQuery.Create(self);
   try
      zQuery.Connection := Conexao;
    //  zQuery.Transaction := Transaction;

      RodaConsulta('Select * from Parametros',zQuery);

      Parametros.RAZAO_SOCIAL := zQuery.FieldByName('RAZAO_SOCIAL').asString;
      Parametros.ENDERECO     := zQuery.FieldByName('ENDERECO').asString;
      Parametros.BAIRRO       := zQuery.FieldByName('BAIRRO').asString;
      Parametros.CIDADE       := zQuery.FieldByName('CIDADE').asString;
      Parametros.CEP          := zQuery.FieldByName('CEP').asString;
      Parametros.FONE         := zQuery.FieldByName('FONE').asString;
      Parametros.FAX          := zQuery.FieldByName('FAX').asString;
      Parametros.IE           := zQuery.FieldByName('INSCRICAO').asString;
      Parametros.CGC          := zQuery.FieldByName('CGC').asString;
      Parametros.UF           := zQuery.FieldByName('UF').asString;
      Parametros.PATHLOGO     := zQuery.FieldByName('PATHLOGO').asString;

{      JvQuery.Database := FrmPrincipal.Base;
//      JvQuery.Transaction := FrmPrincipal.Transaction;
//      RodaConsulta('Select * from Parametros',JvQuery);
      Parametros.RAZAO_SOCIAL := JvQuery.FieldByName('RAZAO_SOCIAL').asString;
      Parametros.ENDERECO     := JvQuery.FieldByName('ENDERECO').asString;
      Parametros.BAIRRO       := JvQuery.FieldByName('BAIRRO').asString;
      Parametros.CIDADE       := JvQuery.FieldByName('CIDADE').asString;
      Parametros.CEP          := JvQuery.FieldByName('CEP').asString;
      Parametros.FONE         := JvQuery.FieldByName('FONE').asString;
      Parametros.FAX          := JvQuery.FieldByName('FAX').asString;
      Parametros.IE           := JvQuery.FieldByName('INSCRICAO').asString;
      Parametros.CGC          := JvQuery.FieldByName('CGC').asString;
      Parametros.UF           := JvQuery.FieldByName('UF').asString;
      Parametros.PATHLOGO     := JvQuery.FieldByName('PATHLOGO').asString;
      }
      LeIni := TIniFile.Create(ExtractFileDir(Application.ExeName) + '/' + Apelido + '.ini');
      //ConexIni.ReadIniFile;
{      Parametros.IMPR_FISCAL := LeIni.ReadInteger('Parametros','ImprFiscal',0);
      Parametros.PORTA := LeIni.ReadString('Parametros','Porta','');
      if Parametros.PORTA = '' then
         Parametros.PORTA := 'COM1'; }
      LeIni.Free;
      {
      Parametros.IMPR_PADRAO := -1;
      For I := Low(Impressoras) to High(Impressoras) do
         if Impressoras[I].Nome = JvQuery.FieldByName('IMPR_PADRAO').asString then
            Parametros.IMPR_PADRAO  := I;
      Parametros.VENDA_PESO_LIQ  := JvQuery.FieldByName('VENDA_PESO_LIQ').asInteger;
      Parametros.VERSAO_OFICIAL  := JvQuery.FieldByName('VERSAO_OF').asInteger;
      Parametros.JUROS_DIARIO    := JvQuery.FieldByName('JUROS_DIARIO').asFloat;
      Parametros.GAVETA_DINHEIRO := JvQuery.FieldByName('GAVETA_DINHEIRO').AsInteger;
      Parametros.VLR_TOTAL_POSTO := JvQuery.FieldByName('VLR_TOTAL_POSTO').AsInteger;
      Parametros.ALTERA_NOME_PROD:= JvQuery.FieldByName('DESCR_PRODUTO_NOTA').AsInteger;
      Parametros.CAD_VEIC_MOTO   := JvQuery.FieldByName('CAD_VEICULOS_MOTORISTAS').AsInteger;
      Parametros.COMPLE_PROD_NT  := JvQuery.FieldByName('COMPLE_PROD_NOTA').AsInteger;

      Parametros.Mascara_Valor   := JvQuery.FieldByName('MASK_VALOR').asString;
      Parametros.Mascara_Qtde    := JvQuery.FieldByName('MASK_QTDE').asString;
      Parametros.Busca_Chave     := JvQuery.FieldByName('BUSCA_CHAVE').asInteger;

      Parametros.COL_IMPR_PED    := JvQuery.FieldByName('COL_IMPR_PED').asInteger;
      Parametros.CAB_IMPR_PED    := JvQuery.FieldByName('CAB_IMPR_PED').asInteger;
      Parametros.ESP_IMPR_PED    := JvQuery.FieldByName('ESP_IMPR_PED').asInteger;

      Parametros.TOT_ORC_IMPR_PED:= JvQuery.FieldByName('TOT_ORC_IMPR_PED').asInteger;
      Parametros.IMPR_PED_BALCAO := JvQuery.FieldByName('IMPR_PED_BALCAO').asInteger;

      Parametros.ALT_ESTQ_DIRETO := JvQuery.FieldByName('ALTERA_ESTQ_DIRETO').asInteger;
      
      Parametros.RETEN_PISCOFINS := JvQuery.FieldByName('IND_PISCOFINS').asInteger;
      Parametros.RETEN_CSLL      := JvQuery.FieldByName('IND_CSLL').asInteger;
      Parametros.RETEN_IRRF      := JvQuery.FieldByName('IND_IRRF').asInteger;}
      
   except
{      JvQuery.Close;
      JvQuery.Free; }
   end;
end;

Procedure TFrmPrincipal.Carrega_Impressoras;
// var JvQuery : TJvUIBDataset;
begin    {
   SetLength(Impressoras,0);
   JvQuery := TJvUIBDataset.Create(self);
   try
      JvQuery.Database := FrmPrincipal.Base;
      JvQuery.Transaction := FrmPrincipal.Transaction;

      RodaConsulta('Select * from Impressoras',JvQuery);
      JvQuery.Last;
      JvQuery.First;
   
      while not JvQuery.Eof do
      begin
         SetLength(Impressoras,High(Impressoras) + 2);
         Impressoras[High(Impressoras)].NOME := JvQuery.FieldByName('NOME').asString;
         Impressoras[High(Impressoras)].PORTA := JvQuery.FieldByName('PORTA').asString;
         Impressoras[High(Impressoras)].QTDLINHAS := JvQuery.FieldByName('QTLINHAS').AsInteger;
         //Impressoras[High(Impressoras)].LINESPACE := Query.FieldByName('ESPACOLINHAS').AsInteger;  //Duda  19/01/2003
         Impressoras[High(Impressoras)].PCOMPR175 := JvQuery.FieldByName('PCOMPR175').asString;
         Impressoras[High(Impressoras)].TCOMPR175 := JvQuery.FieldByName('TCOMPR175').asString;
         Impressoras[High(Impressoras)].PCOMPR20 := JvQuery.FieldByName('PCOMPR20').asString;
         Impressoras[High(Impressoras)].TCOMPR20 := JvQuery.FieldByName('TCOMPR20').asString;
         Impressoras[High(Impressoras)].PELITE12 := JvQuery.FieldByName('PELITE12').asString;
         Impressoras[High(Impressoras)].TELITE12 := JvQuery.FieldByName('TELITE12').asString;
         Impressoras[High(Impressoras)].PNEGRITO := JvQuery.FieldByName('PNEGRITO').asString;
         Impressoras[High(Impressoras)].TNEGRITO := JvQuery.FieldByName('TNEGRITO').asString;
         Impressoras[High(Impressoras)].PEXPAND := JvQuery.FieldByName('PEXPAND').asString;
         Impressoras[High(Impressoras)].TEXPAND := JvQuery.FieldByName('TEXPAND').asString;
         Impressoras[High(Impressoras)].P8LINPOL := JvQuery.FieldByName('P8LINPOL').asString;
         Impressoras[High(Impressoras)].T8LINPOL := JvQuery.FieldByName('T8LINPOL').asString;
         Impressoras[High(Impressoras)].PEJETAR := JvQuery.FieldByName('PEJETAR').asString;
         Impressoras[High(Impressoras)].PLINPPAG := JvQuery.FieldByName('PLINPPAG').asString;
         JvQuery.Next;
      end;
   except
      JvQuery.Close;
      JvQuery.Free;
   end; }
end;

procedure TFrmPrincipal.FrmPrincipalClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
//    if Transaction.InTransaction then Transaction.Rollback; //by fernando
   Sair_Programa(true);
   CloseAction:= caFree;
end;

procedure TFrmPrincipal.ApplicationProperties1ShowHint(var HintStr: string;
   var CanShow: Boolean; var HintInfo: THintInfo);
begin
   StatusBar1.Panels[0].Text := HintStr;
end;

procedure TFrmPrincipal.MenuItem10Click(Sender: TObject);
begin
   CriaForm(TFrmMarcas);
end;

procedure TFrmPrincipal.MenuItem11Click(Sender: TObject);
begin
   CriaForm(TFrmGrupos);
end;

procedure TFrmPrincipal.LimpaCampos(oform : TForm;CompTag: Integer);
var I, J : LongInt;
begin
   with oform do
   begin
      for I := 0 to ComponentCount-1 do
      begin
         if Components[I].Tag = CompTag then
         begin
            if Components[i] is TEdit then
               (Components[i] as TEdit).Text := '';
            {if Components[i] is TRealEdit then
            begin
               (Components[i] as TRealEdit).Value := 0;
               if (Components[i] as TRealEdit).FormatReal = fFixed then
                  (Components[i] as TRealEdit).Text := '0';
            end;}
            if Components[i] is TMaskEdit then
            begin
               (Components[i] as TMaskEdit).EditMask := '';
               (Components[i] as TMaskEdit).Text := '';
            end;
            if Components[i] is TImage then
               (Components[i] as TImage).Picture := nil;
            if Components[i] is TCheckBox then
               (Components[i] as TCheckBox).Checked := false;
            if Components[i] is TMemo then
               (Components[i] as TMemo).Lines.Clear;
            if Components[i] is TComboBox then
            begin
               (Components[i] as TComboBox).ItemIndex := -1;
               (Components[i] as TComboBox).Text := '';
            end;
            if Components[i] is TRadioGroup then
               (Components[i] as TRadioGroup).ItemIndex := 0;
            if Components[i] is TListBox then
               (Components[i] as TListBox).Items.Clear;
            if Components[i] is TCheckListBox then
               For J := 0 to (Components[i] as TCheckListBox).Items.Count-1 do
                  (Components[i] as TCheckListBox).Checked[J] := False;
            if Components[i] is TPanel then
               if (Components[i] as TPanel).Alignment = tacenter then //Valor
                  (Components[i] as TPanel).Caption := '0,00'
               else
                  (Components[i] as TPanel).Caption := '';
         end;
      end;
   end;
end;

procedure TFrmPrincipal.MenuItem12Click(Sender: TObject);
begin
   CriaForm(TFrmSubGrupos);
end;

procedure TFrmPrincipal.MenuItem13Click(Sender: TObject);
begin
    CriaForm(TFrmTribProd);
end;

procedure TFrmPrincipal.MenuItem14Click(Sender: TObject);
begin
    CriaForm(TFrmSituTrib);
end;

procedure TFrmPrincipal.MenuItem15Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmPrincipal.MenuItem16Click(Sender: TObject);
begin
   CriaForm(TFrmPraca);
end;

procedure TFrmPrincipal.MenuItem18Click(Sender: TObject);
begin
   CriaForm(TFrmSituacaoClientes);
end;

procedure TFrmPrincipal.MenuItem19Click(Sender: TObject);
begin
   CriaForm(TFrmClassClientes);
end;

procedure TFrmPrincipal.MenuItem1Click(Sender: TObject);
begin

end;

procedure TFrmPrincipal.MenuItem20Click(Sender: TObject);
begin
   CriaForm(TFrmAtividade);
end;

procedure TFrmPrincipal.MenuItem22Click(Sender: TObject);
begin
   CriaForm(TFrmTransportador);
end;

procedure TFrmPrincipal.MenuItem23Click(Sender: TObject);
begin
   CriaForm(TFrmObserv);
end;

procedure TFrmPrincipal.MenuItem24Click(Sender: TObject);
begin
   CriaForm(TFrmCodFiscais);
end;

procedure TFrmPrincipal.MenuItem25Click(Sender: TObject);
begin
   CriaForm(TFrmVendasLen);
end;

procedure TFrmPrincipal.MenuItem27Click(Sender: TObject);
begin
   CriaForm(TFrmImpressoras);
end;

procedure TFrmPrincipal.MenuItem28Click(Sender: TObject);
begin
   FrmParametros := TFrmParametros.Create(self);
   FrmParametros.ShowModal;
   FrmParametros.Release;
   try
      FrmParametros := Nil;
   except
   end;
end;

procedure TFrmPrincipal.MenuItem30Click(Sender: TObject);
begin
   CriaForm(TFrmCatSubCat);
end;

procedure TFrmPrincipal.MenuItem34Click(Sender: TObject);
begin
   CriaForm(TFrmBancos);
end;

procedure TFrmPrincipal.MenuItem35Click(Sender: TObject);
begin
   CriaForm(TFrmCtaCorrente);
end;

procedure TFrmPrincipal.MenuItem62Click(Sender: TObject);
begin

end;

procedure TFrmPrincipal.MenuItem64Click(Sender: TObject);
begin
   FrmRel_CtasReceber := TFrmRel_CtasReceber.Create(self);
   FrmRel_CtasReceber.ShowModal;
   FrmRel_CtasReceber.Release;
   FrmRel_CtasReceber := Nil;
end;

procedure TFrmPrincipal.MenuItem69Click(Sender: TObject);
begin
   CriaForm(TFrmFormPagto);
end;

procedure TFrmPrincipal.MenuItem70Click(Sender: TObject);
begin
   FrmRel_CtasPagar := TFrmRel_CtasPagar.Create(self);
   FrmRel_CtasPagar.ShowModal;
   FrmRel_CtasPagar.Release;
   FrmRel_CtasPagar := Nil;
end;

procedure TFrmPrincipal.MenuItem71Click(Sender: TObject);
begin
   FrmRel_MovCaixaBancos := TFrmRel_MovCaixaBancos.Create(self);
   FrmRel_MovCaixaBancos.ShowModal;
   FrmRel_MovCaixaBancos.Release;
   FrmRel_MovCaixaBancos := Nil;
end;

procedure TFrmPrincipal.MenuItem74Click(Sender: TObject);
begin
   CriaForm(TFrmConfigDoc);
end;

procedure TFrmPrincipal.MenuItem77Click(Sender: TObject);
begin
   CriaForm(TFrmAjuste);
end;

procedure TFrmPrincipal.MenuItem79Click(Sender: TObject);
begin
   CriaForm(TFrmReajuste);
end;

procedure TFrmPrincipal.MenuItem7Click(Sender: TObject);
begin
   CriaForm(TFrmFornecedores);
end;

procedure TFrmPrincipal.MenuItem81Click(Sender: TObject);
begin
//   CriaForm(TFrmCompras2);
end;

procedure TFrmPrincipal.MenuItem84Click(Sender: TObject);
begin
{   FrmSobre := TFrmSobre.Create(self);
   FrmSobre.ShowModal;
   FrmSobre.Release;
   FrmSobre := Nil;}
   
   {FrmNewSobre := TFrmNewSobre.Create(self);
   FrmNewSobre.ShowModal;
   FrmNewSobre.Release;
   FrmNewSobre := Nil;   }
   
   FrmSobre3 := TFrmSobre3.Create(self);
   FrmSobre3.ShowModal;
   FrmSobre3.Release;
   FrmSobre3 := Nil;
end;

procedure TFrmPrincipal.MenuItem86Click(Sender: TObject);
begin
   FrmConfBase := TFrmConfBase.Create(self);
   FrmConfBase.ShowModal;
   FrmConfBase.Release;
   FrmConfBase := Nil;
end;

procedure TFrmPrincipal.MenuItem88Click(Sender: TObject);
begin
   FrmImpFisc := TFrmImpFisc.Create(self);
   FrmImpFisc.ShowModal;
   FrmImpFisc.Release;
   FrmImpFisc := Nil;
end;

procedure TFrmPrincipal.MenuItem89Click(Sender: TObject);
begin
  CriaForm(TFrmPedCompras);
end;

procedure TFrmPrincipal.MenuItem90Click(Sender: TObject);
begin
  CriaForm(TFrmPedVenda);
end;

procedure TFrmPrincipal.MenuItem_Cadastro_ProdClick(Sender: TObject);
begin
   CriaForm(TFrmProdutos);
end;

procedure TFrmPrincipal.MenuItem_Consulta_PrecosClick(Sender: TObject);
begin
   CriaForm(TFrmConsulta_Precos);
end;

procedure TFrmPrincipal.MenuItem91Click(Sender: TObject);
begin
  // Vendas Rápidas
  criaform(tFrmVendasRap);
end;

procedure TFrmPrincipal.RodaSP(Proc:TZQuery);
begin
   try
     Proc.Post;

   except
      On E:Exception do
      begin  {
         TrataErro(E);
         aSP.Transaction.RollbackRetaining;}
      end;
   end;
end;

Function TFrmPrincipal.RodaConsulta(oSelect: String; var aQry: TZQuery): Boolean;
begin
   Screen.Cursor := crHourglass;
   try
      Result := True;
      try
       //  if not Transaction. then Transaction.StartTransaction;
         aQry.SQL.Clear;
         aQry.SQL.Add(oSelect);
         aQry.Open;
         FormatNumericFields(aQry);
         aQry.Last;
         aQry.First;

         //Transaction.;
      except
         On E:Exception do
         begin
            showmessage(E.message + 'query= ' + oSelect);
            TrataErro(E);
       //     Transaction.RollbackRetaining;
         end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

Function TFrmPrincipal.RodaComando(oComando:string):boolean;
begin
{   Screen.Cursor := crHourglass;
   try
      try
         if not Jv_Script.Transaction.InTransaction then Jv_Script.Transaction.StartTransaction;
         Result := True;
         if oComando <> '' then
         begin
            Jv_Script.Script.Clear;
            Jv_Script.Script.Add(oComando);
         end;
         Jv_Script.ExecuteScript;
         Jv_Script.Transaction.CommitRetaining;
      except
         On E:Exception do
         begin
            Result := False;
            TrataErro(E);
            Transaction.RollbackRetaining;
         end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;   }
end;

Function TFrmPrincipal.Configura_Base : Boolean;
var ConexIni : TIniFile;
    oCaminho, oServidor:String;
    Procedure Pega_do_Registro(var Caminho, Servidor : String);
    begin
       ConexIni := TIniFile.Create(ExtractFileDir(Application.ExeName) + '/' + Apelido + '.ini');
       Caminho := ConexIni.ReadString('Banco de Dados','Caminho','');
       Servidor := ConexIni.ReadString('Banco de Dados','Servidor','');
       ConexIni.Free;
    end;
begin
   // Base.Connected := False;
{   Pega_do_Registro(oCaminho,oServidor);
   //Possui Registro ?
   while Trim(oCaminho) = '' do
   begin
      if MessageDlg('Banco de Dados não registrado.'+#13+'Você deseja registrá-lo agora ?',mtInformation,[mbYes,mbNo],0) = mrYes then
      begin
         Try
            FrmConfBase := TFrmConfBase.Create(Self);
            FrmConfBase.ShowModal;
         finally
            FrmConfBase.Release;
            FrmConfBase := nil;
            Pega_do_Registro(oCaminho,oServidor);
         end;
      end
      else
      begin
         Result := False;
         Exit;
      end;
   end;
   if Trim(oServidor) = '' then
      Base.DatabaseName := oCaminho
   else
      Base.DatabaseName := oServidor + ':' + oCaminho;  }

   //Base.DatabaseName := '/home/andre/dados/siages.fdb';
   Result := True;
end;



initialization
  {$i uprincipal.lrs}

end.

