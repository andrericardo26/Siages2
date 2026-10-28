unit global;

{$MODE Delphi}

interface

{ force ansistrings }
{$H+}

uses
     Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     Menus, StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, FileCtrl,
     Db, Printers, ZDataset;

   Procedure RecebeFoco(Obj: TEdit);
   Procedure Sair_Programa(ComPergunta : Boolean);
   Procedure Calculadora;
   Procedure Chama_Ajuda(URL: String);
   Function  IIF(Condicao:Boolean; retornaTrue, retornaFalse:Variant):Variant;
   Function  Formatar_Data(FData: String): String;
   Function  CriaForm(Nome_form: TFormClass): TForm;
   Function  TirarPonto(Texto: String): String;
   Function  TrocaVirgula_Ponto(Texto: String): String;
   Function  Retorna_Mes(Mes: integer): string;
   Function  ValiData(Data: String):Boolean;
   Function  ValMoeda(Moeda: String): Boolean;
   Function  ValNumero(Numero: String): Boolean;
   Function  ValInteger(Numero: String): Boolean;
   Function  ValidaCPF(xCPF:String):Boolean;
   Function  ValidaCGC(xCGC:String):Boolean;
   Function  AlinharStr(Pe_Str:string; Pe_QtdPos:Byte; EDC :Char):string;
   Function  Procura_Item_ComboList(var oCombo : TComboBox; oItemTexto: String):Integer;
   Function  StrZero(Num : Real ; Zeros,Deci: integer): string;
   Procedure NumeroRegistros(SQL: String);
   Function  Extenso_Valor (Valor: Real): string;
   //De Impressoras
//   Procedure Configura_Impressora(aImpressora : Integer; oPFast : TPrintFast);
   Procedure Carrega_ComboImpressoras(var oCombo : TComboBox);
   //function PF_Alignment(const Text: string;
   //   const Alignment: TPFAlignment;const Width:byte):string;
   //procedure Imprime_Pesquisa(Titulo : String; Base : TDataSet);
   Procedure Imprime_Duplicata(Conf_Duplic, oControle: String);
   //Procedure Imprime_Carne(Conf_Carne, oControle: String);
   //Procedure Imprime_Bloqueto(Conf_Bloq, oControle: String);
   //function MyMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons:
   //     TMsgDlgButtons; Captions: array of string): Integer;
   //procedure Imprime_Ped_80(oPedido : Integer; oPreview : Boolean);
   //procedure Imprime_Ped_40(oPedido : Integer; oPreview : Boolean);
   Function  Analisa_Credito_cliente(oCliente : Integer; aVista : Boolean; oValor : Double) : Boolean;
   Function  StrToIntZero(str : String) : Integer;
   Function  StrToFloatZero(str : String) : Double;
   function  WrapText(const Line, BreakStr: string; const BreakChars: TSysCharSet;  MaxCol: Integer): string; Overload;
   function  WrapText(const Line: string; MaxCol: Integer): string; Overload;
   procedure FormatNumericFields(Ds: TDataSet);

implementation

uses UPrincipal, UVariaveis;


Function iif(Condicao:Boolean; retornaTrue, retornaFalse:Variant):Variant;
begin
   if Condicao = True then
      Result := RetornaTrue
   else
      Result := RetornaFalse;
end;

Procedure RecebeFoco(Obj: TEdit);
begin
   Obj.SelStart := 0;
   Obj.SelLength := Length(obj.text);
end;

Function TrocaVirgula_Ponto(Texto: String): String;
var x: integer;
    total : string;
begin
   Total := '';
   for x := 1 to length(trim(Texto)) do
   begin
      if copy(texto, x, 1) <> ',' then
         Total := total + copy(texto, x, 1)
      else
         Total :=  total + '.';
   end;
   Result := total
end;

Function TirarPonto(Texto: String): String;
var x: integer;
    Total : string;
begin
   Total := '';
   Texto := Trim(Texto);
   for x := 1 to length(trim(Texto)) do
   begin
      if Copy(texto, x, 1) <> '.' then
      begin
          total := total + copy(texto, x, 1);
      end;
   end;
   Result := total
end;

Procedure Sair_Programa(ComPergunta : Boolean);
begin
   if ComPergunta = True then
      if MessageDlg('Deseja realmente sair ?',mtInformation,[mbYes,mbNo], 0 ) = mrNo then
         Application.Run;
   Try
      FrmPrincipal.Free;
      FrmPrincipal := Nil;
      Application.Terminate;
   except
      //showmessage('Existiam Transaçoes ativas!');
   end;
end;



Function Formatar_Data(FData: String): String;
var aux: string;
begin
   if fdata <> '' then
   begin
   if strtoint(copy(fdata,1,2)) > 0  then
       begin
        if copy(fdata, 3,1) = '/'then
        aux := fdata
        else
        aux := copy (fdata,1,2) + '/' + copy(fdata,4,2) + '/' + copy(fdata,7,4);
       end
   else
       begin
            aux:= ''
       end;
   Result := FormatDateTime('dd/mm/yyyy' , StrToDateTime(aux));
   end;
end;

Function  CriaForm(Nome_form: TFormClass): tform;
var I: Integer;
    Fo : TForm;
begin
   Screen.cursor := crHourGlass;
   try
      Result := nil;
      Fo := Nil;
      {Faz um loop inverso de (Nº de forms na tela (Screen.FormCount) até o form 0}
      for i := 0 to Screen.FormCount -1 do
      begin
         {Testa se já existe um form com o nome do mesmo}
         if Screen.Forms[i] is Nome_Form then
         begin
            Result := Screen.Forms[I];
         end;
       end;
       {Se o result for igual nada então ele cria e se ele conter o nome do form ele
       chama, traz para frente e dá foco.}
       if Result = nil then
       begin
          try
              //LockWindowUpdate(FrmPrincipal.Handle);
              Fo := Nome_form.Create(Application);
              //LockWindowUpdate(0);
          Except
              MessageDlg('Houve problemas ao criar formulário. Feche o programa e tente novamente.',mtWarning,[mbOk],0);
              //LockWindowUpdate(0);
          end;
       end
       else
       begin
         Result.BringToFront;
         Result.SetFocus;
       end;
   finally
      Screen.cursor := crdefault;
   end;
end;

Function Retorna_Mes(Mes: integer): string;
begin
   Case Mes of
      01: Result := 'JANEIRO';
      02: Result := 'FEVEREIRO';
      03: Result := 'MARÇO';
      04: Result := 'ABRIL';
      05: Result := 'MAIO';
      06: Result := 'JUNHO';
      07: Result := 'JULHO';
      08: Result := 'AGOSTO';
      09: Result := 'SETEMBRO';
      10: Result := 'OUTUBRO';
      11: Result := 'NOVEMBRO';
      12: Result := 'DEZEMBRO';
   else
      Result := 'Mês Inválido';
   end;
end;

procedure Calculadora;
begin
     if DirectoryExists('c:\windows')= true then
        //shell('\')
     else if DirectoryExists('c:\WinNT\System') = true then
         //WinExec('c:\WinNT\System\calc.exe',SW_RESTORE);
end;

Function ValiData(Data: String):Boolean;
{Testa se uma data é válida ou não}
var
     TesteData: TDateTime;
begin
     Result := True;
     try
     TesteData := StrToDate(Data);
     except
     Result := False;
     end;
end;


Function ValMoeda(Moeda: String): Boolean;
var
TesteMoeda : Currency;
begin
   Result := True;
   try
      TesteMoeda := StrToCurr(TirarPonto(Moeda));
   except
      Result := False;
   end;
end;


Function ValNumero(Numero: String): Boolean;
var
TesteNumero : Double;
begin
   Result := True;
   try
     TesteNumero :=StrToFloatZero(Numero);
   except
     Result := False;
   end;
end;

Function ValInteger(Numero: String): Boolean;
var
TesteNumero : Integer;
begin
   Result := True;
   try
     TesteNumero :=StrToInt(Numero);
   except
     Result := False;
   end;
end;


Function ValidaCpf( xCPF:String ):Boolean;
{Testa se o CPF é válido ou não}
Var
d1,d4,xx,nCount,resto,digito1,digito2 : Integer;
Check : String;
Begin
try
   d1 := 0; d4 := 0; xx := 1;
   for nCount := 1 to Length( xCPF )-2 do
       begin
       if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
          begin
             d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
             d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
           xx := xx+1;
          end;
       end;
   resto := (d1 mod 11);
   if resto < 2 then
      begin
      digito1 := 0;
      end
   else
      begin
      digito1 := 11 - resto;
      end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
      digito2 := 0;
      end
   else
      begin
      digito2 := 11 - resto;
      end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCPF,succ(length(xCPF)-2),2) then
      begin
      Result := False;
      end
   else
      begin
      Result := True;
      end;
except
   Result := false;
end;
end;

Function ValidaCGC( xCGC:String ):Boolean;
{Testa se o CGC é válido ou não}
Var
d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
Check : String;
begin
try
   d1 := 0;
   d4 := 0;
   xx := 1;
   for nCount := 1 to Length( xCGC )-2 do
       begin
       if Pos( Copy( xCGC, nCount, 1 ), '/-.' ) = 0 then
          begin
          if xx < 5 then
             begin
             fator := 6 - xx;
             end
          else
             begin
             fator := 14 - xx;
             end;
          d1 := d1 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
          if xx < 6 then
             begin
             fator := 7 - xx;
             end
          else
             begin
             fator := 15 - xx;
             end;
          d4 := d4 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
          xx := xx+1;
          end;
       end;
       resto := (d1 mod 11);
       if resto < 2 then
          begin
          digito1 := 0;
          end
      else
          begin
          digito1 := 11 - resto;
          end;
      d4 := d4 + 2 * digito1;
      resto := (d4 mod 11);
      if resto < 2 then
         begin
         digito2 := 0;
         end
      else
         begin
         digito2 := 11 - resto;
         end;
      Check := IntToStr(Digito1) + IntToStr(Digito2);
      if Check <> copy(xCGC,succ(length(xCGC)-2),2) then
         begin
         Result := False;
         end
      else
         begin
         Result := True;
         end;
except
   Result := False;
end;
end;

function AlinharStr(Pe_Str:string; Pe_QtdPos:Byte; EDC :Char):string;
//
// Alinha uma string em um determinado espaço
//
// EDC:  C = Centralizado
//       D = Direita
//       E = Esquerda
//
var
L, N, R, I :integer;
S, St, CH :string;
begin
i := Pe_qtdPos;
St := copy(Pe_Str,1,Pe_QtdPos);
if EDC = 'D' then
  begin
  Insert('aLeX',St,i);
  L := Pos('aLeX',St);
  if L <= i then
     begin
     for n := L to i do
         begin
         Insert(' ', St, 1);
         end;
     end;
  St := Copy(St,1,i);
  R := i;
  Ch := Copy(St,i,1);
  while (Ch = ' ') and (R <> 0) do
        begin
        if ch = ' ' then
           begin
           Insert(' ', St, 1);
           end;
        St := Copy(St, 1, i);
        R := R - 1;
        Ch := Copy(St, i, 1);
        end;
  end;
if EDC = 'E' then
   begin
   Ch := Copy(St,1,1);
   while Ch = ' ' do
     begin
     Delete(St,1,1);
     Ch := Copy(St,1,1);
     end;
   St := Copy(St,1,i);
   end;
if EDC = 'C' then
  begin
  S := AlinharStr(Pe_Str,Pe_QtdPos,'D');
  Ch := Copy(S,1,1);
  R := 1;
  N := 1;
  while Ch = ' ' do
    begin
    R := R + 1;
    Ch := Copy(S,R,1);
    end;
  R := Round( R / 2 );
  while n < R do
    begin
    Delete(S,1,1);
    N := N + 1;
    end;
  St := Copy(S,1,i);
  end;
AlinharStr := St;
end;

Procedure Chama_Ajuda(URL: String);
var
   Arq_Help : String;
   Dialog : TOpenDialog;
begin
  Arq_Help := ExtractFilePath(Application.ExeName) + 'SiacomHelp.chm';
  //Arquivo nao existe
  if not FileExists(Arq_Help) then
  begin
     if MessageDlg('Não pode ser encontrado o Arquivo de Ajuda "SiacomHelp.chm".'+#13+'Você deseja tentar encontra-lo?',mtWarning,[mbYes,mbNo],0) = mrYes then
     begin
        Dialog := TOpenDialog.Create(Dialog);
        try
           Dialog.InitialDir := ExtractFilePath(Application.ExeName);
           Dialog.Title := 'Localizar...';
           Dialog.Filter := '*.chm|*.CHM|*.*';
           Dialog.FilterIndex := 0;
           Dialog.DefaultExt := '*.CHM';
           Dialog.FileName := 'MDHelp.CHM';
           if Dialog.Execute then
              If FileExists(Dialog.FileName) then
                 Arq_Help := Dialog.FileName
              else
                 Exit;
        finally
           Dialog.Free;
        end;
     end
     else
        exit;
  end;
  //HH(Application.MainForm.Handle, pChar(Arq_Help), HH_Display_Topic, Longint(PChar(URL)));
end;

Function Procura_Item_ComboList(var oCombo : TComboBox; oItemTexto: String):Integer;
Var I : Integer;
begin
   For I := 0 to oCombo.Items.Count -1 do
   begin
      if oCombo.Items[I] = oItemTexto then
      begin
         Result := I;
         exit;
      end;
   end;
   Result := -1;
end;

function StrZero(Num : Real ; Zeros,Deci: integer): string;
var tam,z : integer;
    res,zer : string;
begin
   Str(Num:Zeros:Deci, res);
   res := Trim(res);
   tam := length(res);
   zer := '';
   for z := 1 to (Zeros-tam) do zer := zer + '0';
   Result := zer+res;
end;

Procedure NumeroRegistros(SQL: String);
// var Qry: TJvUIBDataSet;
begin    {
   Qry := TJvUIBDataSet.Create(Qry);
   Screen.Cursor := crHourglass;
   try
      Qry.Database := FrmPrincipal.Base;
      Qry.Transaction := FrmPrincipal.Transaction;
      Qry.SQL.Clear;
      Qry.SQL.Add('Select Count(*) as NumReg ' + Copy(SQL, Pos('FROM',UpperCase(SQL))-1, Length(SQL)));
      Qry.Open;
      MessageDlg('Foram encontrados ' + qry.FieldByName('NumReg').asString +' registros',mtInformation,[mbOK],0);
   finally
      Qry.Close;
      Qry.Free;
      Screen.Cursor := crDefault;
   end; }
end;

Function Extenso_Valor (Valor: Real): string;
var
 Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
 Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco',
                                    'Seis', 'Sete', 'Oito', 'Nove');
 Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze',
                               'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
 Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta',
                                   'Cinquenta', 'Sessenta', 'Setenta',
                                   'Oitenta', 'Noventa');
 Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos',
                                    'Quatrocentos', 'Quinhentos', 'Seiscentos',
                                    'Setecentos', 'Oitocentos', 'Novecentos');

   function IFS(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
   begin
      if Expressao then
         Result:=CasoVerdadeiro
      else
         Result:=CasoFalso;
   end;

   function MiniExtenso (trio: string): string;
   var
      Unidade, Dezena, Centena: string;
   begin
      Unidade:='';
      Dezena:='';
      Centena:='';
      if (trio[2]='1') and (trio[3]<>'0') then
      begin
         Unidade:=Dez[strtoint(trio[3])];
         Dezena:='';
      end
      else
      begin
         if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
         if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
      end;
      if (trio[1]='1') and (Unidade='') and (Dezena='') then
         Centena:='cem'
      else
      if trio[1]<>'0' then
         Centena:=Centenas[strtoint(trio[1])]
      else
         Centena:='';
      Result:= Centena + IFs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
               + Dezena + IFs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
   end;

begin
   if (valor>999999.99) or (valor<0) then
   begin
      msg:='Valor Inválido! '+ #13 + ' O valor está fora do intervalo permitido.';
      msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
      MessageDlg(msg,mtWarning,[mbOK],0);
      Result:='';
      exit;
   end;
   if valor=0 then
   begin
      Result:='';
      Exit;
   end;
   Texto:=formatfloat('000000.00',valor);
   Milhar:=MiniExtenso(Copy(Texto,1,3));
   Centena:=MiniExtenso(Copy(Texto,4,3));
   Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
   Result:=Milhar;
   if Milhar<>'' then
      if copy(texto,4,3)='000' then
         Result:=Result+' Mil Reais'
      else
         Result:=Result+' Mil, ';
   if (((copy(texto,4,2)='00') and (Milhar<>'') and (copy(texto,6,1)<>'0')) or (centavos='')) and (Centena<>'') then
      Result:=Result+' e ';

   if (Milhar+Centena <>'') then
      Result:=Result+Centena;

   if (Milhar='') and (copy(texto,4,3)='001') then
      Result:=Result+' Real'
   else
      if (copy(texto,4,3)<>'000') then
         Result:=Result+' Reais';
   if Centavos='' then
   begin
      Result:=Result+'.';
      Exit;
   end
   else
   begin
      if Milhar+Centena='' then
         Result:=Centavos
      else
         Result:=Result+' e '+Centavos;
      if (copy(texto,8,2)='01') and (Centavos<>'') then
         Result:=Result+' Centavo.'
      else
         Result:=Result+' Centavos.';
   end;
end;
{
Procedure Configura_Impressora(aImpressora : Integer; oPFast : TPrintFast);
begin
   if aImpressora = -1 then //nao esta config. nos parametros
   begin
      MessageDlg('Impressora Padrão não configurada nos Parâmetros do Sistema.',mtWarning,[mbOK],0);
      Exit;
   end;
   oPFast.PrinterPort := Impressoras[aImpressora].PORTA;
   oPFast.QtLines     := Impressoras[aImpressora].QTDLINHAS;
   pCompr175          := Impressoras[aImpressora].PCOMPR175;
   tCompr175          := Impressoras[aImpressora].TCOMPR175;
   pCompr20           := Impressoras[aImpressora].PCOMPR20;
   tCompr20           := Impressoras[aImpressora].TCOMPR20;
   pElite12           := Impressoras[aImpressora].PELITE12;
   tElite12           := Impressoras[aImpressora].TELITE12;
   pNegrito           := Impressoras[aImpressora].PNEGRITO;
   tNegrito           := Impressoras[aImpressora].TNEGRITO;
   pExpand            := Impressoras[aImpressora].PEXPAND;
   tExpand            := Impressoras[aImpressora].TEXPAND;
   p8LinPol           := Impressoras[aImpressora].P8LINPOL;
   t8LinPol           := Impressoras[aImpressora].T8LINPOL;
   pEjetar            := Impressoras[aImpressora].PEjetar;
   pLinPPage          := Impressoras[aImpressora].PLINPPAG;
   Linespace_Impr     := Impressoras[aImpressora].LINESPACE; //Duda  19/01/2003
end;           }

Procedure Carrega_ComboImpressoras(var oCombo : TComboBox);
var I : Integer;
begin
   oCombo.Items.Clear;
   For I := Low(Impressoras) to High(Impressoras) do
   begin
      oCombo.Items.Add(Impressoras[I].Nome);
   end;
end;

{function PF_Alignment(const Text: string;
                      const Alignment: TPFAlignment;const Width:byte):string;
var
  nI:smallint;
  cSpace:string;
begin
  Result:=Text;
  cSpace:='';
  for nI:=1 to (Width-Length(Trim(Text))) do
    cSpace:=cSpace+' ';
  if Alignment = pfLeftJustify then
    Result:=Trim(Text)+cSpace
  else
  if Alignment = pfRightJustify then
    Result:=cSpace+Trim(Text)
  else
    Result:=Copy(cSpace,1,((Width-Length(Trim(Text))) div 2))+Trim(Text)+Copy(cSpace,1,Width-Length(Trim(Text))-((Width-Length(Trim(Text))) div 2));
end;}

{procedure Imprime_Pesquisa(Titulo : String; Base : TDataSet);
var PF : TPrintFast;
    PFReport : TPFReport;
    PFBand : TPFBand;
    vSelect : String;
    Colunas : Array of TPFColumn;
    //Quebras : Array of TPFBand;
    I, nCol : Integer;
    Compressao : TPFHowPrint;
begin
   // 1 - Criar PrintFast, PFReport, PFBand
   //PrintFast
   PF := TPrintFast.Create(Application);
   PF.Preview := True;
   PF.PageHeader := True;
   Configura_Impressora(Parametros.IMPR_PADRAO,PF);

   //PFReport
   PFReport := TPFReport.Create(Application);
   PFReport.DataSet := Base;
   PFReport.PrintFast := PF;
   //PFReport.ShowProgress := False;

   //PFBand
   PFBand := TPFBand.Create(Application);
   PFBand.BandType := pfDetail;

  if (Base.Active = False) or (Base.Eof and Base.Bof) then
  begin
     MessageDlg('Não existe registros a imprimir.',mtWarning,[mbOK],0);
     Exit;
  end;

  FrmSel_Campos_Rel := TFrmSel_Campos_Rel.Create(Application);
  FrmSel_Campos_Rel.Select := (Base as TIBQuery).SQL.Text;
  FrmSel_Campos_Rel.Arquivo := 'Conf_Rel_Frm' + Titulo;
  FrmSel_Campos_Rel.Dados_Persistentes := True;
  if FrmSel_Campos_Rel.ShowModal = mrOK then
  begin
     FrmSel_Campos_Rel.TextDataSet1.First;
     while not FrmSel_Campos_Rel.TextDataSet1.Eof do
     begin
        FrmSel_Campos_Rel.ListSep1.Entrada := FrmSel_Campos_Rel.TextDataSet1.FieldByName('LINE').asString;
        FrmSel_Campos_Rel.ListSep1.Execute;
        SetLength(Colunas,High(Colunas) + 2);
        Colunas[High(Colunas)] := TPFColumn.Create(Application);
        Colunas[High(Colunas)].Expression := Trim(FrmSel_Campos_Rel.ListSep1.Saida[0]);
        Colunas[High(Colunas)].ColHeader := FrmSel_Campos_Rel.ListSep1.Saida[1];
        Colunas[High(Colunas)].ColWidth := StrToInt(FrmSel_Campos_Rel.ListSep1.Saida[2]);
        if FrmSel_Campos_Rel.ListSep1.Saida[3] = 'Esquerda' then
           Colunas[High(Colunas)].Alignment := taLeftJustify
        else if FrmSel_Campos_Rel.ListSep1.Saida[3] = 'Centro' then
           Colunas[High(Colunas)].Alignment := taCenter
        else
           Colunas[High(Colunas)].Alignment := taRightJustify;
        Colunas[High(Colunas)].Mask := FrmSel_Campos_Rel.ListSep1.Saida[4];

        FrmSel_Campos_Rel.TextDataSet1.Next;
     end;
  end
  else
     Exit;
  Screen.ActiveForm.Refresh;

  PF.PageWidth := StrToInt(FrmSel_Campos_Rel.Edit_LargCabecalho.Text);
  PF.HeaderData.Title1 := Parametros.RAZAO_SOCIAL;
  PF.HeaderData.Title2 := Titulo;

  if FrmSel_Campos_Rel.RB_Retrato.Checked then
     PF.Windows.Orientation := poPortrait
  else
     PF.Windows.Orientation := poLandscape;
  PF.Windows.Font.Size := StrToInt(FrmSel_Campos_Rel.Edit_TamFonte.Text);
  PF.Windows.LineSpace := StrToInt(FrmSel_Campos_Rel.Edit_EspcLinhas.Text);

  Compressao := pfNoEfect;
  case FrmSel_Campos_Rel.Combo_Compressao.ItemIndex of
     1: Compressao := pfCompr175;
     2: Compressao := pfCompr20;
     3: Compressao := pfElite12;
  end;
  FrmSel_Campos_Rel.Release;
  FrmSel_Campos_Rel := Nil; //destroi o form dos campos

  nCol := 0;
  PF.HeaderData.ColHeader1 := '';
  //Forma o ColHeader
  for I := Low(Colunas) to High(Colunas) do
  begin
     if Colunas[I].ColHeader <> '' then
     begin
        PF.HeaderData.ColHeader1 := PF.HeaderData.ColHeader1 + PF_Alignment(Colunas[I].ColHeader,Colunas[I].Alignment,Colunas[I].ColWidth)+',' + IntToStr(nCol) + ';';//duda
     end;
     nCol := nCol + Colunas[I].ColWidth + 1;
  end;
  PF.HeaderData.ColHeader1 := Copy(PF.HeaderData.ColHeader1,1,Length(PF.HeaderData.ColHeader1)-1); //duda

  //Define as Colunas no Relatorio
  For I := Low(Colunas) to High(Colunas) do
  begin
     PFBand.Column[I] := Colunas[I];
  end;

  PFBand.LeftMargin := 0;
  PFReport.Detail[0]:=PFBand;

  Base.Last;
  Base.First;
  Base.DisableControls;
  Screen.Cursor := crHourGlass;
  try
     //MyProgressBar.Visible := True;
     PFReport.HowPrint := Compressao;
     PFReport.Execute;
     PFReport.HowPrint := pfNoEfect;
  finally
     Base.EnableControls;
     Screen.Cursor := crDefault;
  end;

end;}

Procedure Imprime_Duplicata(Conf_Duplic, oControle: String);
var vCompr, osCampos, vCod_SitTrib_Padrao, Extenso : String;
    I,J, Rec,vLinha,vColuna, CountLinha, CountColuna, LinhasProd : Integer;
    OBSLinhas : TStringList;             {
    PrintFast1 : TPrintFast;
    JvQry_Cabec, JvQry_Corpo, JvQry_Parcelas, JvQry_Dados : TJvUIBDataset;
    Proc_Impressao: TJvUIBQuery;
    JvTransaction: TJvUIBTransaction;   }
begin
   if (Trim(oControle) = '0') or (Trim(oControle) = '') then
   begin
      MessageDlg('Nota Inválida!',mtWarning,[mbOk],0);
      exit;
   end;                            {
   
   JvTransaction := TJvUIBTransaction.Create(nil);

   JvTransaction.DataBase := FrmPrincipal.base;
   JvTransaction.DefaultAction := etmCommitRetaining;
   JvTransaction.Options := [tpNowait, tpReadCommitted, tpNoRecVersion];
   JvTransaction.AutoRetain = True;
   
   Proc_Impressao := TJvUIBQuery.Create(Nil);
   Proc_Impressao.DataBase := FrmPrincipal.base;
   Proc_Impressao.Transaction := JvTransaction;
   Proc_Impressao.BuildStoredProc('PROC_IMPRESSAO');
   
   JvQry_Cabec := TJvUIBDataset.Create(Nil);
   JvQry_Cabec.Database := FrmPrincipal.Base;
   JvQry_Cabec.Transaction := JvTransaction;
   JvQry_Cabec.SQL.Clear;
   JvQry_Cabec.SQL.Add('Select * from DOCSCAPA where Nome = '''+ Conf_Duplic +'''');
   JvQry_Cabec.Open;

   if JvQry_Cabec.RecordCount <= 0 then
   begin
      MessageDlg('Configuração de Documento Inválida!',mtWarning,[mbOk],0);
      exit;
   end;
   
   //Cria a Query Corpo
   JvQry_Corpo := TJvUIBDataset.Create(Nil);
   JvQry_Corpo.Database := FrmPrincipal.Base;
   JvQry_Corpo.Transaction := JvTransaction;
   JvQry_Corpo.SQL.Clear;

   //Cria a Query dos Dados
   JvQry_Dados := TJvUIBDataset.Create(Nil);
   JvQry_Dados.Database := FrmPrincipal.Base;
   JvQry_Dados.Transaction := JvTransaction;
   JvQry_Dados.SQL.Clear;

   //Cria o PrintFast
   PrintFast1 := TPrintFast.Create(Nil);
   PrintFast1.Windows.PrintForWindows := False;
   PrintFast1.Preview := True;    }
   {
   Try

   //********************************Começa o Laco das parcelas ************************************
   JvQry_Parcelas := TJvUIBDataset.Create(Nil);
   JvQry_Parcelas.Database := FrmPrincipal.Base;
   JvQry_Parcelas.Transaction := JvTransaction;
   JvQry_Parcelas.SQL.Clear;
   JvQry_Parcelas.SQL.Add('Select * from CTASRECEBER where CONTROLE = ' + oControle );
   JvQry_Parcelas.Open;

   JvQry_Parcelas.First;
   //while not JvQry_Parcelas.Eof do
   For Rec := 1 to JvQry_Parcelas.RecordCount do
   begin
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle+';');
      {JvDataSet1.Active := False;
      JvDataSet1.Params[0].AsInteger := StrToInt(oControle);
      JvDataSet1.Active := True;

      //************************************  Valor em Extenso ******************************************
      JvQry_Corpo.SQL.Clear;
      JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Duplic +''' and UPPER(Tabela) = ''EXTENSO'' and UPPER(Imprimir) = ''SIM''');
      JvQry_Corpo.Open;
      JvQry_Corpo.First;
      if JvQry_Corpo.RecordCount > 0 then
      begin
         OBSLinhas := TStringList.Create;
         Try
            //MemoImpressao.Width := (IBQry_Cabec.FieldByName('VL_EXT_LARG').asInteger * 9);//para transformar pixels em caracteres
            //MemoImpressao.Lines.Clear;
            //MemoImpressao.Lines.Text := Extenso1.Extenso;
            //Extenso1.Numero := IBQry_Parcelas.FieldByName('VALOR').asString;
            //WrapText e uma funcao para formatar a string em linhas
            Extenso := Extenso_Valor(JvQry_Parcelas.FieldByName('VALOR').asFloat);
            OBSLinhas.Text := WrapText(Extenso, #13#10, ['.',' ',#9,'-'], 42);
            try
               For I := 0 to OBSLinhas.Count-1 do
               begin
                  if (I+1) > JvQry_Cabec.FieldByName('VL_EXT_LINHAS').asInteger Then Break;
                  with Proc_Impressao do
                  begin
                     Params.ByNameAsInteger['POPER'] := 0;
                     Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                     Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger + I;
                     Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                     Params.ByNameAsString['PCONTEUDO'] := OBSLinhas[I];
                     Params.ByNameAsString['PMASCARA'] := '';
                     Execute;
                  end;
               end;
               JvTransaction.CommitRetaining;
            except
               JvTransaction.RollbackRetaining;
            end;
         finally
            OBSLinhas.Free;
         end;
      end;

      //**********************  Primeiro Coloca os campos que NAO vem de tabelas   ******************
      JvQry_Corpo.SQL.Clear;
      JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Duplic +''' and Tabela is NULL and UPPER(Imprimir) = ''SIM''');
      JvQry_Corpo.Open;
      JvQry_Corpo.First;
      try
         while not JvQry_Corpo.Eof do
         begin
            with Proc_Impressao do
            begin
               Params.ByNameAsInteger['POPER'] := 0;
               Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
               Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger;
               Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
               Params.ByNameAsString['PCONTEUDO'] := JvQry_Corpo.FieldByName('CAMPO').asString;
               Params.ByNameAsString['PMASCARA'] := JvQry_Corpo.FieldByName('MASKVLR').asString;;
               Execute;
            end;
            JvQry_Corpo.Next;
         end;
         JvTransaction.CommitRetaining;
      except
         JvTransaction.RollbackRetaining;
      end;
      //**********************  Campos que vem do DOCSCAPA   ******************
      JvQry_Corpo.SQL.Clear;
      JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Duplic +''' and UPPER(Tabela) = ''DOCSCAPA'' and UPPER(Imprimir) = ''SIM''');
      JvQry_Corpo.Open;
      JvQry_Corpo.First;
      try
         while not JvQry_Corpo.Eof do
         begin
            with Proc_Impressao do
            begin
               Params.ByNameAsInteger['POPER'] := 0;
               Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
               Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger;
               Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
               Params.ByNameAsString['PCONTEUDO'] := JvQry_Cabec.FieldByName(JvQry_Corpo.FieldByName('CAMPO').asString).asString;
               Params.ByNameAsString['PMASCARA'] := JvQry_Corpo.FieldByName('MASKVLR').asString;;
               Execute;
            end;
            JvQry_Corpo.Next;
         end;
         JvTransaction.CommitRetaining;
      except
         JvTransaction.RollbackRetaining;
      end;

      //************************************** Vem de varias tabelas **************************************************************
      //Busca os CAMPOS das Tabelas:  CTASRECEBER, PARAMETROS, VENDAS, CLIENTES
      JvQry_Corpo.SQL.Clear;
      JvQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Duplic +''' and UPPER(Tabela) IN (''CTASRECEBER'',''PARAMETROS'',''VENDAS'',''CLIENTES'') and UPPER(Imprimir) = ''SIM''');
      JvQry_Corpo.Open;
      JvQry_Corpo.First;
      osCampos := '';
      while not JvQry_Corpo.Eof do
      begin
         osCampos := osCampos + JvQry_Corpo.FieldByName('TABELA').asString+'.'+JvQry_Corpo.FieldByName('CAMPO').asString+' as '+JvQry_Corpo.FieldByName('TABELA').asString+'_'+JvQry_Corpo.FieldByName('CAMPO').asString+', ';
         JvQry_Corpo.Next;
      end;
      osCampos := Copy(osCampos,1,Length(osCampos)-2);
      if osCampos <> '' then
      begin
         //Busca os DADOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
         JvQry_Dados.SQL.Clear;
         //Alem dos campos do DocsItem busca tambem a Situação Tributaria do CFOP se Tiver, Sera usado nos produtos
         JvQry_Dados.SQL.Add(' SELECT '+ osCampos +' FROM PARAMETROS, CTASRECEBER ');
         JvQry_Dados.SQL.Add(' LEFT OUTER JOIN VENDAS ON (CTASRECEBER.CONTROLE = VENDAS.CONTROLE) ');
         JvQry_Dados.SQL.Add(' LEFT OUTER JOIN CLIENTES ON (CTASRECEBER.COD_CLIENTE = CLIENTES.CODIGO) ');
         JvQry_Dados.SQL.Add(' WHERE CTASRECEBER.CONTROLE=' + oControle + ' AND CTASRECEBER.DOCUMENTO=''' + JvQry_Parcelas.FieldByName('DOCUMENTO').asString+'''');
         JvQry_Dados.Open;

         //Faz um LOOP com os campos e dados
         JvQry_Corpo.First;
         try
            while not JvQry_Corpo.Eof do
            begin
               with Proc_Impressao do
               begin
                  Params.ByNameAsInteger['POPER'] := 0;
                  Params.ByNameAsInteger['PCONTROLE'] := StrToInt(oControle);
                  Params.ByNameAsInteger['PLINHA'] := JvQry_Corpo.FieldByName('LINHA').asInteger;
                  Params.ByNameAsInteger['PCOLUNA'] := JvQry_Corpo.FieldByName('COLUNA').asInteger;
                  Params.ByNameAsString['PCONTEUDO'] := JvQry_Cabec.FieldByName(JvQry_Corpo.FieldByName('CAMPO').asString).asString;
                  Params.ByNameAsString['PMASCARA'] := JvQry_Corpo.FieldByName('MASKVLR').asString;;
                  //Ajusta o TAMANHO, se Tiver
                  if JvQry_Corpo.FieldByName('TAMANHO').asInteger <> 0 then
                     Params.ByNameAsString['PCONTEUDO'] := AlinharStr(Params.ByNameAsString['PCONTEUDO'],JvQry_Corpo.FieldByName('TAMANHO').asInteger,'E');
                  Execute;
               end;
               JvQry_Corpo.Next;
            end;
            JvTransaction.CommitRetaining;
         except
            JvTransaction.RollBackRetaining;
         end;
      end;

      if JvQry_Cabec.FieldByName('IMPRESSAO_TIPO').asInteger = 1 then
         PrintFast1.Windows.PrintForWindows := True
      else
         PrintFast1.Windows.PrintForWindows := False;
      //PrintFast1.Windows.Orientation := poPortrait;
      PrintFast1.Windows.Font.Size := JvQry_Cabec.FieldByName('IMPRES_WIN_FONTE').asInteger;
      PrintFast1.Windows.LineSpace := JvQry_Cabec.FieldByName('IMPRES_WIN_ESPACO').asInteger;

      PrintFast1.PageHeader := False;
      PrintFast1.IniciaImpr;
      //ConfImpr(Tabelas.T_ParametrosIMPRPADRAO.value,Tabelas.T_Impressoras,PrintFast1);

      if JvQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(JvQry_Cabec.FieldByName('LINHAS').asInteger));

      if JvQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(p8LinPol);

      // aqui coloca a compressao escolhida no cadastro da nota
      vCompr := JvQry_Cabec.FieldByName('COMPRESSAO').asString;
      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(pElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(pCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(pCompr20);

      JvQry_Dados.SQL.Clear;
      JvQry_Dados.SQL.Add('Select * from IMPRESSAO where Controle = '+oControle+' order by Linha, Coluna');
      JvQry_Dados.Open;
      JvQry_Dados.First;
      while not JvQry_Dados.Eof do
      begin
         if JvQry_Dados.FieldByName('MASCARA').asString <> '' then
            PrintFast1.Say(JvQry_Dados.FieldByName('Linha').asInteger, JvQry_Dados.FieldByName('Coluna').asInteger,PrintFast1.MascaraVlr(JvQry_Dados.FieldByName('MASCARA').asString,StrToFloat(JvQry_Dados.FieldByName('Conteudo').asString)))
         else
            PrintFast1.Say(JvQry_Dados.FieldByName('Linha').asInteger, JvQry_Dados.FieldByName('Coluna').asInteger,JvQry_Dados.FieldByName('Conteudo').asString);
         JvQry_Dados.Next;
      end;

      PrintFast1.ImprString('',' ',0,true);
      PrintFast1.Ejeta;

      if JvQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(t8LinPol);
      if JvQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(66));

      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(tElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(tCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(tCompr20);
      PrintFast1.FimImpr;

      // Deleta os Dados
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle+';');

      //Incrementa uma parcela
      JvQry_Parcelas.Next;
   end;
   Finally
      Proc_Impressao.Free;
      JvQry_Corpo.Free;
      JvQry_Cabec.Free;
      JvQry_Dados.Free;
      JvQry_Parcelas.Free;
      JvTransaction.Free;
   end;     }
end;

{Procedure Imprime_Carne(Conf_Carne, oControle: String);
var vCompr, osCampos, vCod_SitTrib_Padrao : String;
    I,J,vLinha,vColuna, CountLinha, CountColuna, LinhasProd : Integer;
    PrintFast1 : TPrintFast;
    JvQry_Cabec, JvQry_Corpo, JvQry_Parcelas, JvQry_Dados : TJvUIBDataset;
begin
   if (Trim(oControle) = '0') or (Trim(oControle) = '') then
   begin
      MessageDlg('Nota Inválida!',mtWarning,[mbOk],0);
      exit;
   end;

   IBQry_Cabec := TIBQuery.Create(Nil);
   IBQry_Cabec.Database := FrmPrincipal.IBDatabase1;
   IBQry_Cabec.SQL.Clear;
   IBQry_Cabec.SQL.Add('Select * from DOCSCAPA where Nome = '''+ Conf_Carne +'''');
   if not IBQry_Cabec.Prepared then IBQry_Cabec.Prepare;
   IBQry_Cabec.Open;

   if (IBQry_Cabec.EOF) and (IBQry_Cabec.BOF) then
   begin
      MessageDlg('Configuração de Documento Inválida!',mtWarning,[mbOk],0);
      exit;
   end;

   //Cria a Query Corpo
   IBQry_Corpo := TIBQuery.Create(Nil);
   IBQry_Corpo.Database := FrmPrincipal.IBDatabase1;
   IBQry_Corpo.SQL.Clear;

   //Cria o DataSet de Inclusao
   IBDataSet1 := TIBDataSet.Create(Nil);
   IBDataSet1.Database := FrmPrincipal.IBDatabase1;
   IBDataSet1.SelectSQL.Text := 'Select CONTROLE, LINHA, COLUNA, CONTEUDO, MASCARA from IMPRESSAO where CONTROLE = :CONTROLE order by CONTROLE, LINHA, COLUNA ';
   IBDataSet1.InsertSQL.Text := 'Insert Into IMPRESSAO (CONTROLE, LINHA, COLUNA, CONTEUDO, MASCARA) values (:CONTROLE, :LINHA, :COLUNA, :CONTEUDO, :MASCARA)';
   IBDataSet1.ModifySQL.Text := 'Update IMPRESSAO set CONTROLE = :CONTROLE, LINHA = :LINHA, COLUNA = :COLUNA, CONTEUDO = :CONTEUDO, MASCARA = :MASCARA where CONTROLE = :OLD_CONTROLE and LINHA = :OLD_LINHA and COLUNA = :OLD_COLUNA';
   IBDataSet1.DeleteSQL.Text := 'Delete from IMPRESSAO where CONTROLE = :OLD_CONTROLE and LINHA = :OLD_LINHA and COLUNA = :OLD_COLUNA ';


   //Cria a Query dos Dados
   IBQry_Dados := TIBQuery.Create(Nil);
   IBQry_Dados.Database := FrmPrincipal.IBDatabase1;
   IBQry_Dados.SQL.Clear;

   //Cria o PrintFast
   PrintFast1 := TPrintFast.Create(Nil);
   PrintFast1.Windows.PrintForWindows := False;

   Try

//********************************Começa o Laco das parcelas ************************************
   IBQry_Parcelas := TIBQuery.Create(Nil);
   IBQry_Parcelas.Database := FrmPrincipal.IBDatabase1;
   IBQry_Parcelas.SQL.Clear;
   IBQry_Parcelas.SQL.Add('Select * from CTASRECEBER where CONTROLE = ' + oControle );
   if not IBQry_Parcelas.Prepared then IBQry_Parcelas.Prepare;
   IBQry_Parcelas.Open;

   IBQry_Parcelas.First;
   while not IBQry_Parcelas.Eof do
   begin
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle+';');
      IBDataSet1.Active := False;
      IBDataSet1.Params[0].AsInteger := StrToInt(oControle);
      IBDataSet1.Active := True;

      //**********************  Primeiro Coloca os campos que NAO vem de tabelas   ******************
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Carne +''' and Tabela is NULL and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      try
         while not IBQry_Corpo.Eof do
         begin
            IBDataSet1.Append;
            IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
            IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
            IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
            IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Corpo.FieldByName('CAMPO').asString;
            IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
            IBDataSet1.Post;
            IBQry_Corpo.Next;
         end;
         IBDataSet1.Transaction.CommitRetaining;
      except
         IBDataSet1.Close;
         IBDataSet1.Transaction.RollbackRetaining;
      end;

      //**********************  Campos que vem do DOCSCAPA   ******************
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Carne +''' and UPPER(Tabela) = ''DOCSCAPA'' and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      try
         while not IBQry_Corpo.Eof do
         begin
            IBDataSet1.Append;
            IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
            IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
            IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
            IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Cabec.FieldByName(IBQry_Corpo.FieldByName('CAMPO').asString).asString;
            IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
            IBDataSet1.Post;
            IBQry_Corpo.Next;
         end;
         IBDataSet1.Transaction.CommitRetaining;
      except
         IBDataSet1.Close;
         IBDataSet1.Transaction.RollbackRetaining;
      end;

      //************************************** Vem de varias tabelas **************************************************************
      //Busca os CAMPOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Carne +''' and UPPER(Tabela) IN (''CTASRECEBER'',''PARAMETROS'',''VW_CLIENTES'') and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      osCampos := '';
      while not IBQry_Corpo.Eof do
      begin
         osCampos := osCampos + IBQry_Corpo.FieldByName('TABELA').asString+'.'+IBQry_Corpo.FieldByName('CAMPO').asString+' as '+IBQry_Corpo.FieldByName('TABELA').asString+'_'+IBQry_Corpo.FieldByName('CAMPO').asString+', ';
         IBQry_Corpo.Next;
      end;
      osCampos := Copy(osCampos,1,Length(osCampos)-2);
      if osCampos <> '' then
      begin
         //Busca os DADOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
         IBQry_Dados.SQL.Clear;
         //Alem dos campos do DocsItem busca tambem a Situação Tributaria do CFOP se Tiver, Sera usado nos produtos
         IBQry_Dados.SQL.Add(' SELECT '+ osCampos +' FROM PARAMETROS, CTASRECEBER ');
         //IBQry_Dados.SQL.Add(' LEFT OUTER JOIN VENDAS ON (CTASRECEBER.CONTROLE = VENDAS.CONTROLE) ');
         IBQry_Dados.SQL.Add(' LEFT OUTER JOIN VW_CLIENTES ON (CTASRECEBER.COD_CLIENTE = VW_CLIENTES.CODIGO) ');
         IBQry_Dados.SQL.Add(' WHERE CTASRECEBER.CONTROLE=' + oControle + ' AND CTASRECEBER.DOCUMENTO=''' + IBQry_Parcelas.FieldByName('DOCUMENTO').asString+'''');
         if not IBQry_Dados.Prepared then IBQry_Dados.Prepare;
         IBQry_Dados.Open;

         //Faz um LOOP com os campos e dados
         IBQry_Corpo.First;
         try
            while not IBQry_Corpo.Eof do
            begin
               IBDataSet1.Append;
               IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
               IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
               IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
               IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Dados.FieldByName(IBQry_Corpo.FieldByName('TABELA').asString+'_'+IBQry_Corpo.FieldByName('CAMPO').asString).asString;
               IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
               //Ajusta o TAMANHO, se Tiver
               if IBQry_Corpo.FieldByName('TAMANHO').asInteger <> 0 then
                  IBDataSet1.FieldByName('CONTEUDO').AsString := AlinharStr(IBDataSet1.FieldByName('CONTEUDO').AsString,IBQry_Corpo.FieldByName('TAMANHO').asInteger,'E');
               IBDataSet1.Post;
               IBQry_Corpo.Next;
            end;
            IBDataSet1.Transaction.CommitRetaining;
         except
            IBDataSet1.Close;
            IBDataSet1.Transaction.RollbackRetaining;
         end;
      end;

      if IBQry_Cabec.FieldByName('IMPRESSAO_TIPO').asInteger = 1 then
         PrintFast1.Windows.PrintForWindows := True
      else
         PrintFast1.Windows.PrintForWindows := False;
      PrintFast1.Windows.Orientation := poPortrait;
      PrintFast1.Windows.Font.Size := IBQry_Cabec.FieldByName('IMPRES_WIN_FONTE').asInteger;
      PrintFast1.Windows.LineSpace := IBQry_Cabec.FieldByName('IMPRES_WIN_ESPACO').asInteger;

      PrintFast1.PageHeader := False;
      PrintFast1.IniciaImpr;
      //ConfImpr(Tabelas.T_ParametrosIMPRPADRAO.value,Tabelas.T_Impressoras,PrintFast1);

      if IBQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(IBQry_Cabec.FieldByName('LINHAS').asInteger));

      if IBQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(p8LinPol);

      // aqui coloca a compressao escolhida no cadastro da nota
      vCompr := IBQry_Cabec.FieldByName('COMPRESSAO').asString;
      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(pElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(pCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(pCompr20);

      IBQry_Dados.SQL.Clear;
      IBQry_Dados.SQL.Add('Select * from IMPRESSAO where Controle = '+oControle+' order by Linha, Coluna');
      if not IBQry_Dados.Prepared then IBQry_Dados.Prepare;
      IBQry_Dados.Open;
      IBQry_Dados.First;
      while not IBQry_Dados.Eof do
      begin
         if IBQry_Dados.FieldByName('MASCARA').asString <> '' then
            PrintFast1.Say(IBQry_Dados.FieldByName('Linha').asInteger, IBQry_Dados.FieldByName('Coluna').asInteger,PrintFast1.MascaraVlr(IBQry_Dados.FieldByName('MASCARA').asString,StrToFloat(IBQry_Dados.FieldByName('Conteudo').asString)))
         else
            PrintFast1.Say(IBQry_Dados.FieldByName('Linha').asInteger, IBQry_Dados.FieldByName('Coluna').asInteger,IBQry_Dados.FieldByName('Conteudo').asString);
         IBQry_Dados.Next;
      end;

      PrintFast1.ImprString('',' ',0,True);
      if IBQry_Cabec.FieldByName('IMPRESSAO_TIPO').asInteger = 0 then //Se impressao para windows nao ejeta
         PrintFast1.Ejeta;

      if IBQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(t8LinPol);
      if IBQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(66));

      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(tElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(tCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(tCompr20);
      PrintFast1.FimImpr;

      // Deleta os Dados
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle+';');

      //Incrementa uma parcela
      IBQry_Parcelas.Next;
   end;
   Finally
      IBQry_Corpo.Free;
      IBQry_Cabec.Free;
      IBDataSet1.Free;
      IBQry_Dados.Free;
      IBQry_Parcelas.Free;
   end;
end;

Procedure Imprime_Bloqueto(Conf_Bloq, oControle: String);
var vCompr, osCampos, vCod_SitTrib_Padrao : String;
    I,J,vLinha,vColuna, CountLinha, CountColuna, LinhasProd : Integer;
    OBSLinhas : TStringList;
    Extenso1 : TExtenso;
    PrintFast1 : TPrintFast;
    IBQry_Cabec, IBQry_Corpo, IBQry_Parcelas, IBQry_Dados : TIBQuery;
    IBDataSet1 : TIBDataSet;
begin
   if (Trim(oControle) = '0') or (Trim(oControle) = '') then
   begin
      MessageDlg('Nota Inválida!',mtWarning,[mbOk],0);
      exit;
   end;
   IBQry_Cabec := TIBQuery.Create(Nil);
   IBQry_Cabec.Database := FrmPrincipal.IBDatabase1;
   IBQry_Cabec.SQL.Clear;
   IBQry_Cabec.SQL.Add('Select * from DOCSCAPA where Nome = '''+ Conf_Bloq +'''');
   if not IBQry_Cabec.Prepared then IBQry_Cabec.Prepare;
   IBQry_Cabec.Open;

   if (IBQry_Cabec.EOF) and (IBQry_Cabec.BOF) then
   begin
      MessageDlg('Configuração de Documento Inválida!',mtWarning,[mbOk],0);
      exit;
   end;

   //Cria a Query Corpo
   IBQry_Corpo := TIBQuery.Create(Nil);
   IBQry_Corpo.Database := FrmPrincipal.IBDatabase1;
   IBQry_Corpo.SQL.Clear;

   //Cria o DataSet de Inclusao
   IBDataSet1 := TIBDataSet.Create(Nil);
   IBDataSet1.Database := FrmPrincipal.IBDatabase1;
   IBDataSet1.SelectSQL.Text := 'Select CONTROLE, LINHA, COLUNA, CONTEUDO, MASCARA from IMPRESSAO where CONTROLE = :CONTROLE order by CONTROLE, LINHA, COLUNA ';
   IBDataSet1.InsertSQL.Text := 'Insert Into IMPRESSAO (CONTROLE, LINHA, COLUNA, CONTEUDO, MASCARA) values (:CONTROLE, :LINHA, :COLUNA, :CONTEUDO, :MASCARA)';
   IBDataSet1.ModifySQL.Text := 'Update IMPRESSAO set CONTROLE = :CONTROLE, LINHA = :LINHA, COLUNA = :COLUNA, CONTEUDO = :CONTEUDO, MASCARA = :MASCARA where CONTROLE = :OLD_CONTROLE and LINHA = :OLD_LINHA and COLUNA = :OLD_COLUNA';
   IBDataSet1.DeleteSQL.Text := 'Delete from IMPRESSAO where CONTROLE = :OLD_CONTROLE and LINHA = :OLD_LINHA and COLUNA = :OLD_COLUNA ';


   //Cria a Query dos Dados
   IBQry_Dados := TIBQuery.Create(Nil);
   IBQry_Dados.Database := FrmPrincipal.IBDatabase1;
   IBQry_Dados.SQL.Clear;

   //Cria o PrintFast
   PrintFast1 := TPrintFast.Create(Nil);
   PrintFast1.Windows.PrintForWindows := False;

   Try

   //********************************Começa o Laco das parcelas ************************************
   IBQry_Parcelas := TIBQuery.Create(Nil);
   IBQry_Parcelas.Database := FrmPrincipal.IBDatabase1;
   IBQry_Parcelas.SQL.Clear;
   IBQry_Parcelas.SQL.Add('Select * from CTASRECEBER where CONTROLE = ' + oControle );
   if not IBQry_Parcelas.Prepared then IBQry_Parcelas.Prepare;
   IBQry_Parcelas.Open;

   IBQry_Parcelas.First;
   while not IBQry_Parcelas.Eof do
   begin
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle+';');
      IBDataSet1.Active := False;
      IBDataSet1.Params[0].AsInteger := StrToInt(oControle);
      IBDataSet1.Active := True;

      //**********************  Primeiro Coloca os campos que NAO vem de tabelas   ******************
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Bloq +''' and Tabela is NULL and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      try
         while not IBQry_Corpo.Eof do
         begin
            IBDataSet1.Append;
            IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
            IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
            IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
            IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Corpo.FieldByName('CAMPO').asString;
            IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
            IBDataSet1.Post;
            IBQry_Corpo.Next;
         end;
         IBDataSet1.Transaction.CommitRetaining;
      except
         IBDataSet1.Close;
         IBDataSet1.Transaction.RollbackRetaining;
      end;

      //**********************  Campos que vem do DOCSCAPA   ******************
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Bloq +''' and UPPER(Tabela) = ''DOCSCAPA'' and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      try
         while not IBQry_Corpo.Eof do
         begin
            IBDataSet1.Append;
            IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
            IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
            IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
            IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Cabec.FieldByName(IBQry_Corpo.FieldByName('CAMPO').asString).asString;
            IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
            IBDataSet1.Post;
            IBQry_Corpo.Next;
         end;
         IBDataSet1.Transaction.CommitRetaining;
      except
         IBDataSet1.Close;
         IBDataSet1.Transaction.RollbackRetaining;
      end;

      //************************************** Vem de varias tabelas **************************************************************
      //Busca os CAMPOS das Tabelas:  CTASRECEBER, PARAMETROS, VENDAS, CLIENTES
      IBQry_Corpo.SQL.Clear;
      IBQry_Corpo.SQL.Add('Select * from DocsItem where NOME_DOC = '''+ Conf_Bloq +''' and UPPER(Tabela) IN (''CTASRECEBER'',''PARAMETROS'',''VW_CLIENTES'') and UPPER(Imprimir) = ''SIM''');
      if not IBQry_Corpo.Prepared then IBQry_Corpo.Prepare;
      IBQry_Corpo.Open;
      IBQry_Corpo.First;
      osCampos := '';
      while not IBQry_Corpo.Eof do
      begin
         osCampos := osCampos + IBQry_Corpo.FieldByName('TABELA').asString+'.'+IBQry_Corpo.FieldByName('CAMPO').asString+' as '+IBQry_Corpo.FieldByName('TABELA').asString+'_'+IBQry_Corpo.FieldByName('CAMPO').asString+', ';
         IBQry_Corpo.Next;
      end;
      osCampos := Copy(osCampos,1,Length(osCampos)-2);
      if osCampos <> '' then
      begin
         //Busca os DADOS das Tabelas: * Parametros, Vendas, Transportador, CodFiscais, Clientes, Obsewrvações, Vendas, Vendedores
         IBQry_Dados.SQL.Clear;
         //Alem dos campos do DocsItem busca tambem a Situação Tributaria do CFOP se Tiver, Sera usado nos produtos
         IBQry_Dados.SQL.Add(' SELECT '+ osCampos +' FROM PARAMETROS, CTASRECEBER ');
         IBQry_Dados.SQL.Add(' LEFT OUTER JOIN VW_CLIENTES ON (CTASRECEBER.COD_CLIENTE = VW_CLIENTES.CODIGO) ');
         IBQry_Dados.SQL.Add(' WHERE CTASRECEBER.CONTROLE=' + oControle + ' AND CTASRECEBER.DOCUMENTO=''' + IBQry_Parcelas.FieldByName('DOCUMENTO').asString+'''');
         if not IBQry_Dados.Prepared then IBQry_Dados.Prepare;
         IBQry_Dados.Open;

         //Faz um LOOP com os campos e dados
         IBQry_Corpo.First;
         try
            while not IBQry_Corpo.Eof do
            begin
               IBDataSet1.Append;
               IBDataSet1.FieldByName('CONTROLE').asInteger := StrToInt(oControle);
               IBDataSet1.FieldByName('LINHA').asInteger := IBQry_Corpo.FieldByName('LINHA').asInteger;
               IBDataSet1.FieldByName('COLUNA').asInteger := IBQry_Corpo.FieldByName('COLUNA').asInteger;
               IBDataSet1.FieldByName('CONTEUDO').AsString := IBQry_Dados.FieldByName(IBQry_Corpo.FieldByName('TABELA').asString+'_'+IBQry_Corpo.FieldByName('CAMPO').asString).asString;
               IBDataSet1.FieldByName('MASCARA').AsString := IBQry_Corpo.FieldByName('MASKVLR').asString;
               //Ajusta o TAMANHO, se Tiver
               if IBQry_Corpo.FieldByName('TAMANHO').asInteger <> 0 then
                  IBDataSet1.FieldByName('CONTEUDO').AsString := AlinharStr(IBDataSet1.FieldByName('CONTEUDO').AsString,IBQry_Corpo.FieldByName('TAMANHO').asInteger,'E');
               IBDataSet1.Post;
               IBQry_Corpo.Next;
            end;
            IBDataSet1.Transaction.CommitRetaining;
         except
            IBDataSet1.Close;
            IBDataSet1.Transaction.RollbackRetaining;
         end;
      end;

      if IBQry_Cabec.FieldByName('IMPRESSAO_TIPO').asInteger = 1 then
         PrintFast1.Windows.PrintForWindows := True
      else
         PrintFast1.Windows.PrintForWindows := False;
      PrintFast1.Windows.Orientation := poPortrait;
      PrintFast1.Windows.Font.Size := IBQry_Cabec.FieldByName('IMPRES_WIN_FONTE').asInteger;
      PrintFast1.Windows.LineSpace := IBQry_Cabec.FieldByName('IMPRES_WIN_ESPACO').asInteger;

      PrintFast1.PageHeader := False;
      PrintFast1.IniciaImpr;
      //ConfImpr(Tabelas.T_ParametrosIMPRPADRAO.value,Tabelas.T_Impressoras,PrintFast1);

      if IBQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(IBQry_Cabec.FieldByName('LINHAS').asInteger));

      if IBQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(p8LinPol);

      // aqui coloca a compressao escolhida no cadastro da nota
      vCompr := IBQry_Cabec.FieldByName('COMPRESSAO').asString;
      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(pElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(pCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(pCompr20);

      IBQry_Dados.SQL.Clear;
      IBQry_Dados.SQL.Add('Select * from IMPRESSAO where Controle = '+oControle+' order by Linha, Coluna');
      if not IBQry_Dados.Prepared then IBQry_Dados.Prepare;
      IBQry_Dados.Open;
      IBQry_Dados.First;
      while not IBQry_Dados.Eof do
      begin
         if IBQry_Dados.FieldByName('MASCARA').asString <> '' then
            PrintFast1.Say(IBQry_Dados.FieldByName('Linha').asInteger, IBQry_Dados.FieldByName('Coluna').asInteger,PrintFast1.MascaraVlr(IBQry_Dados.FieldByName('MASCARA').asString,StrToFloat(IBQry_Dados.FieldByName('Conteudo').asString)))
         else
            PrintFast1.Say(IBQry_Dados.FieldByName('Linha').asInteger, IBQry_Dados.FieldByName('Coluna').asInteger,IBQry_Dados.FieldByName('Conteudo').asString);
         IBQry_Dados.Next;
      end;

      PrintFast1.ImprString('',' ',0,true);
      PrintFast1.Ejeta;

      if IBQry_Cabec.FieldByName('LINHASPOL').asString = '8' then
         PrintFast1.ImprComo(t8LinPol);
      if IBQry_Cabec.FieldByName('LINHAS').asInteger <> 66 then
         PrintFast1.ImprComo(pLinPPage+CHR(66));

      if vCompr = 'Elite 12'  then PrintFast1.ImprComo(tElite12);
      if vCompr = 'Cond.17.5' then PrintFast1.ImprComo(tCompr175);
      if vCompr = 'Cond. 20'  then PrintFast1.ImprComo(tCompr20);
      PrintFast1.FimImpr;

      // Deleta os Dados
      FrmPrincipal.RodaComando('Delete from Impressao where Controle = ' + oControle+';');

      //Incrementa uma parcela
      IBQry_Parcelas.Next;
   end;
   Finally
      IBQry_Corpo.Free;
      IBQry_Cabec.Free;
      IBDataSet1.Free;
      IBQry_Dados.Free;
      IBQry_Parcelas.Free;
   end;
end;

{function MyMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons:
TMsgDlgButtons; Captions: array of string): Integer;
var aMsgDlg: TForm;
    i: Integer;
    dlgButton: TButton;
    CaptionIndex: Integer;
begin
   //Create the Dialog
   aMsgDlg := CreateMessageDialog(Msg, DlgType, Buttons);
   captionIndex := 0;

   //Loop through Objects in Dialog
   for i := 0 to aMsgDlg.ComponentCount - 1 do
   begin
      //If the object is of type TButton, then
      if (aMsgDlg.Components[i] is TButton) then
      begin
         dlgButton := TButton(aMsgDlg.Components[i]);
         if CaptionIndex > High(Captions) then Break;

         //Give a new caption from our Captions array
         dlgButton.Caption := Captions[CaptionIndex];
         Inc(CaptionIndex);
      end;
   end;
   Result := aMsgDlg.ShowModal;

   //Exemplo :   MyMessageDlg('Tipo de Cartão ?',mtConfirmation,[mbOK, mbCancel],['Débito','Crédito']);
end;

procedure Imprime_Ped_80(oPedido : Integer; oPreview : Boolean);
var vSelect, vGrupo, vOpcao, vTipo : String;
    I, vCount : Integer;
    vSoma, vTotal, vTotal_Geral : Double;
    PrintFast1 : TPrintFast;
    IBQuery1, IBQry_Itens : TIBQuery;
begin
   //Cria o PrintFast
   PrintFast1 := TPrintFast.Create(Nil);
   PrintFast1.Windows.PrintForWindows := False;
   PrintFast1.Preview := oPreview;


   //Cria a Query Capa
   IBQuery1 := TIBQuery.Create(Nil);
   IBQuery1.Database := FrmPrincipal.IBDatabase1;
   IBQuery1.SQL.Clear;

   //Cria a Query Itens
   IBQry_Itens := TIBQuery.Create(Nil);
   IBQry_Itens.Database := FrmPrincipal.IBDatabase1;
   IBQry_Itens.SQL.Clear;

   Try

   //Se nao é para imprimir cabeçalho
   if Parametros.CAB_IMPR_PED = 1 then
      PrintFast1.PageHeader := False
   else
   begin
      PrintFast1.PageHeader := True;
      PrintFast1.HeaderData.Title1 := Parametros.RAZAO_SOCIAL;
      PrintFast1.HeaderData.Title2 := '';
      PrintFast1.HeaderData.Left3  := 'Data: ' + DateToStr(Date);
   end;

   PrintFast1.HeaderData.ColHeader1 := '';
   PrintFast1.PageWidth := 110;

   PrintFast1.Windows.Orientation := poPortrait;
   PrintFast1.Windows.Font.Size := 8;
   PrintFast1.Windows.LineSpace := 25;

   vSelect :=           ' SELECT PEDIDOS.NRO_PEDIDO, PEDIDOS.TIPO, PEDIDOS.VENDEDOR, VENDEDORES.NOME VENDEDOR_NOME, ';
   vSelect := vSelect + ' PEDIDOS.CLIENTE, CLIENTES.NOME CLIENTE_NOME, CLIENTES.ENDERECO, CLIENTES.BAIRRO, CLIENTES.CIDADE, ';
   vSelect := vSelect + ' CLIENTES.UF, CLIENTES.CEP, CLIENTES.CGC, CLIENTES.INSCRICAO, CLIENTES.FONE, CLIENTES.FAX, ';
   vSelect := vSelect + ' PEDIDOS.FORMAPAGTO, FORMASPAGTO.NOME FORMASPAGTO_NOME, PEDIDOS.DATA, ';
   vSelect := vSelect + ' PEDIDOS.PRAZO_ENTREGA, PEDIDOS.DT_ENTREGA, PEDIDOS.VALIDADE, PEDIDOS.DT_VALIDADE, ';
   vSelect := vSelect + ' PEDIDOS.SERVICO_SOLICITADO, PEDIDOS.OBSERVACAO, PEDIDOS.VL_DESC ';
   vSelect := vSelect + ' FROM PEDIDOS ';
   vSelect := vSelect + ' LEFT JOIN CLIENTES ON (PEDIDOS.CLIENTE = CLIENTES.CODIGO) ';
   vSelect := vSelect + ' LEFT JOIN VENDEDORES ON (PEDIDOS.VENDEDOR = VENDEDORES.CODIGO) ';
   vSelect := vSelect + ' LEFT JOIN FORMASPAGTO ON (PEDIDOS.FORMAPAGTO = FORMASPAGTO.CODIGO) ';
   vSelect := vSelect + ' WHERE NRO_PEDIDO = ' + IntToStr(oPedido);

   IBQuery1.Active := False;
   IBQuery1.SQL.Clear;
   IBQuery1.SQL.Add(vSelect);
   IBQuery1.Active := True;

   Case IBQuery1.FieldByName('TIPO').asInteger of
      0 : PrintFast1.HeaderData.Title2 := 'Pedido';
      1 : PrintFast1.HeaderData.Title2 := 'Orçamento';
      2 : PrintFast1.HeaderData.Title2 := 'Ordem de Serviço';
   end;
   PrintFast1.HeaderData.Title2 := PrintFast1.HeaderData.Title2 + ' Nro. ' + IBQuery1.FieldByName('NRO_PEDIDO').asString;

   PrintFast1.IniciaImpr;
   PrintFast1.ImprComo(pCompr175);
   //PrintFast1.ImprComo(PElite12);

   //Espaco inicial
   if Parametros.ESP_IMPR_PED > 0 then
   begin
      For I := 0 to Parametros.ESP_IMPR_PED do
      begin
         PrintFast1.ImprString('','',0,True);
      end;
   end;
   //Se nao é para imprimir cabeçalho
   if Parametros.CAB_IMPR_PED = 1 then
      PrintFast1.ImprString('',PrintFast1.Repete('=',110),0,True);

   PrintFast1.ImprString('','Cliente..: '+IBQuery1.FieldByName('CLIENTE_NOME').asString + '  (' + IBQuery1.FieldByName('CLIENTE').asString + ')',0,True);
   PrintFast1.ImprString('','Endereço.: '+IBQuery1.FieldByName('ENDERECO').asString,0,True);
   PrintFast1.ImprString('','Bairro...: '+IBQuery1.FieldByName('BAIRRO').asString,0,True);
   PrintFast1.ImprString('','Cidade...: '+IBQuery1.FieldByName('CIDADE').asString,0,False);
   PrintFast1.ImprString('','UF.: '+IBQuery1.FieldByName('UF').asString,61,False);
   PrintFast1.ImprString('','CEP.: '+IBQuery1.FieldByName('CEP').asString,70,True);
   PrintFast1.ImprString('','CGC......: '+IBQuery1.FieldByName('CGC').asString,0,false);
   PrintFast1.ImprString('','Insc.Estadual.: '+IBQuery1.FieldByName('INSCRICAO').asString,50,True);
   PrintFast1.ImprString('','Fone.....: '+IBQuery1.FieldByName('FONE').asString,0,false);
   PrintFast1.ImprString('','Fax.: '+IBQuery1.FieldByName('FAX').asString,60,True);
   PrintFast1.ImprString('',PrintFast1.Repete('-',110),0,True);

   //Olha se tem servico solicitado
   if Trim(IBQuery1.FieldByName('SERVICO_SOLICITADO').asString) <> '' then
   begin
      PrintFast1.ImprString('','S E R V I C O   S O L I C I T A D O',38,True);
      PrintFast1.ImprString('',PrintFast1.Repete('-',110),0,True);

      PrintFast1.ImprString('',WrapText(IBQuery1.FieldByName('SERVICO_SOLICITADO').asString, #13#10, ['.',' ',#9,'-'], 105),0,True);

      //Memo1.Width := 60 * 9;  //para transformar pixels em caracteres
      //Memo1.Lines.Clear;
      //Memo1.Lines.Text := IBQuery1.FieldByName('SERVICO_SOLICITADO').asString;
      //For I := 0 to Memo1.Lines.Count-1 do
      //begin
      //   PrintFast1.ImprString('',Memo1.Lines[I],0,True);
      //end;
      PrintFast1.ImprString('',PrintFast1.Repete('-',110),0,True);
   end;

   //PrintFast1.ImprString('','P R O D U T O S',47,True);
   PrintFast1.ImprString('','     Codigo    Descricao                                      Und   Quantidade    Vlr.Unit    %Desc.     Total',0,True);
   PrintFast1.ImprString('',PrintFast1.Repete('-',110),0,True);

   //PrintFast1.ImprString('',PrintFast1.Repete('-',110),0,True);

   with IBQry_Itens do
   begin
      vSelect :=           ' SELECT PEDITEM.*, PRODUTOS.UNIDADE FROM PEDITEM LEFT JOIN PRODUTOS ON (PEDITEM.COD_PRODUTO = PRODUTOS.CODIGO) ';
      vSelect := vSelect + ' WHERE NRO_PEDIDO = ' + IntToStr(oPedido) + ' ORDER BY PEDITEM.GRUPO, PEDITEM.OPCAO, PEDITEM.SEQUENCIA ';

      IBQry_Itens.Active := False;
      IBQry_Itens.SQL.Clear;
      IBQry_Itens.SQL.Add(vSelect);
      IBQry_Itens.Active := True;

      First;
      vTotal_Geral := 0;
      while not eof do
      begin
         vGrupo := FieldByName('GRUPO').AsString;
         if Trim(vGrupo) <> '' then
            PrintFast1.ImprString('',FieldByName('GRUPO').AsString,0,True);
         vTotal := 0;       vCount := 0;
         while (not eof) and (vGrupo = FieldByName('GRUPO').AsString) do
         begin
            vOpcao := FieldByName('OPCAO').AsString;
            if Trim(vOpcao) <> '' then
            begin
               PrintFast1.ImprString('',FieldByName('OPCAO').AsString,3,True);
               Inc(vCount); //Para saber se tem que imprimir total do grupo, somente quando for orcaemnto
            end;
            vSoma := 0;
            while (not eof) and (vGrupo = FieldByName('GRUPO').AsString)
                            and (vOpcao = FieldByName('OPCAO').AsString) do
            begin
               PrintFast1.ImprString('',FieldByName('COD_PRODUTO').AsString,5,False);
               PrintFast1.ImprString('',FieldByName('DESCRICAO').AsString,15,False);
               PrintFast1.ImprString('',FieldByName('UNIDADE').AsString,62,False);
               PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',FieldByName('QUANTIDADE').AsFloat),70,False);
               PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',FieldByName('VL_UNITARIO').AsFloat),82,False);
               PrintFast1.ImprString('',PrintFast1.MascaraVlr('##0.00',FieldByName('PERC_DESC').AsFloat),94,False);
               PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',FieldByName('TOT_PRODUTO').AsFloat),102,True);
               vSoma := vSoma + FieldByName('TOT_PRODUTO').AsFloat;
               IBQry_Itens.Next;
            end;
            if Trim(vOpcao) <> '' then
            begin
               PrintFast1.ImprString('','Sub-Total' + PrintFast1.Repete('.',88),3,False);
               PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',vSoma),102,True);
               PrintFast1.ImprString('','',0,True);
            end;
            vTotal := vTotal + vSoma;
         end;
         if Trim(vGrupo) <> '' then
         begin
            if (IBQuery1.FieldByName('TIPO').asInteger <> 1) or ((IBQuery1.FieldByName('TIPO').asInteger = 1) and (Parametros.TOT_ORC_IMPR_PED = 0) and (vCount = 1)) then
            begin
               PrintFast1.ImprString('','Sub-Total' + PrintFast1.Repete('.',91),0,False);
               PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',vTotal),102,True);
               PrintFast1.ImprString('','',0,True);
            end;
         end;
         vTotal_Geral := vTotal_Geral + vTotal;
      end;
      PrintFast1.ImprString('','',5,True);
      PrintFast1.ImprString('',PrintFast1.Repete('=',110),0,True);

      //Condicoes de Pagamento
      if IBQuery1.FieldByName('FORMAPAGTO').asInteger > 0 then
      begin
         PrintFast1.ImprString('','Forma de Pagamento: ' + IBQuery1.FieldByName('FORMASPAGTO_NOME').asString,0,False);
      end;

      //Total
      //Testa se for orcamento e se imprime totais
      if (IBQuery1.FieldByName('TIPO').asInteger <> 1) or ((IBQuery1.FieldByName('TIPO').asInteger = 1) and (Parametros.TOT_ORC_IMPR_PED = 0)) then
      begin
         PrintFast1.ImprString('','Valor Total',82,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',vTotal_Geral),98,TRUE);
      end
      else
         PrintFast1.ImprString('','',100,True);

      //Validade
      if IBQuery1.FieldByName('VALIDADE').asInteger > 0 then
      begin
         Case IBQuery1.FieldByName('TIPO').asInteger of
            0 : vTipo := 'Pedido ';
            1 : vTipo := 'Orçamento ';
            2 : vTipo := 'Ordem de Serviço ';
         end;
         PrintFast1.ImprString('',vTipo + 'válido até ' +IBQuery1.FieldByName('DT_VALIDADE').asString,0,False);
      end;

      //Desconto
      //Testa se for orcamento e se imprime totais
      if (IBQuery1.FieldByName('TIPO').asInteger <> 1) or ((IBQuery1.FieldByName('TIPO').asInteger = 1) and (Parametros.TOT_ORC_IMPR_PED = 0)) then
      begin
         PrintFast1.ImprString('','Desconto',85,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',IBQuery1.FieldByName('VL_DESC').asFloat),98,TRUE);
      end
      else
         PrintFast1.ImprString('','',100,True);

      //Prazo de Entrega
      if IBQuery1.FieldByName('PRAZO_ENTREGA').asInteger > 0 then
      begin
         PrintFast1.ImprString('','Prazo de Entrega: ' + IBQuery1.FieldByName('PRAZO_ENTREGA').asString + ' dia(s).',0,False);
      end;

      //Total a Pagar
      //Testa se for orcamento e se imprime totais
      if (IBQuery1.FieldByName('TIPO').asInteger <> 1) or ((IBQuery1.FieldByName('TIPO').asInteger = 1) and (Parametros.TOT_ORC_IMPR_PED = 0)) then
      begin
         PrintFast1.ImprString('','Valor Total a Pagar',74,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',vTotal_Geral - IBQuery1.FieldByName('VL_DESC').asFloat),98,TRUE);
      end
      else
         PrintFast1.ImprString('','',100,True);

      //Observacoes
      if Trim(IBQuery1.FieldByName('OBSERVACAO').asString) <> '' then
      begin
         PrintFast1.ImprString('',PrintFast1.Repete('-',110),0,True);

         PrintFast1.ImprString('',WrapText(IBQuery1.FieldByName('OBSERVACAO').asString, #13#10, ['.',' ',#9,'-'], 105),0,True);

         //Memo1.Width := 60 * 9;  //para transformar pixels em caracteres
         //Memo1.Lines.Clear;
         //Memo1.Lines.Text := IBQuery1.FieldByName('OBSERVACAO').asString;
         //For I := 0 to Memo1.Lines.Count-1 do
         //begin
         //   PrintFast1.ImprString('',Memo1.Lines[I],0,True);
         //end;
         PrintFast1.ImprString('',PrintFast1.Repete('-',110),0,True);
      end;

      PrintFast1.Ejeta;
      PrintFast1.ImprComo(tCompr175);
      //PrintFast1.ImprComo(TElite12);
      PrintFast1.FimImpr;
   end;
   Finally
      IBQuery1.Free;
      IBQry_Itens.Free;
   end;
end;

procedure Imprime_Ped_40(oPedido : Integer; oPreview : Boolean);
var vSelect, vGrupo, vOpcao, vTipo : String;
    I, vCount : Integer;
    vTotal_Geral : Double;
    PrintFast1 : TPrintFast;
    IBQuery1, IBQry_Itens : TIBQuery;
begin
   //Cria o PrintFast
   PrintFast1 := TPrintFast.Create(Nil);
   PrintFast1.Windows.PrintForWindows := False;
   PrintFast1.Preview := oPreview;

   //Cria a Query Capa
   IBQuery1 := TIBQuery.Create(Nil);
   IBQuery1.Database := FrmPrincipal.IBDatabase1;
   IBQuery1.SQL.Clear;

   //Cria a Query Itens
   IBQry_Itens := TIBQuery.Create(Nil);
   IBQry_Itens.Database := FrmPrincipal.IBDatabase1;
   IBQry_Itens.SQL.Clear;

   Try

   PrintFast1.PageHeader := False;
   PrintFast1.PageWidth := 80;
   PrintFast1.Windows.Orientation := poPortrait;
   PrintFast1.Windows.Font.Size := 8;
   PrintFast1.Windows.LineSpace := 25;

   PrintFast1.IniciaImpr;

   PrintFast1.ImprComo(Pcompr175);

   PrintFast1.ImprString('',AnsiUpperCase(Parametros.RAZAO_SOCIAL),0,True);
   PrintFast1.ImprString('',AnsiUpperCase(Parametros.ENDERECO) + '  ' + AnsiUpperCase(Parametros.BAIRRO),0,TRUE);
   PrintFast1.ImprString('',AnsiUpperCase(Parametros.CIDADE) + '  ' + Parametros.UF + '  ' + Parametros.CEP,0,TRUE);
   PrintFast1.ImprString('','FONE/FAX: ' + Parametros.FONE + '  ' + Parametros.FAX,0,TRUE);
   PrintFast1.ImprString('','CNPJ: ' + Parametros.CGC + '         IE: ' + Parametros.IE,0,TRUE);
   PrintFast1.ImprString('',PrintFast1.Repete('-',48),0,TRUE);

   vSelect :=           ' SELECT PEDIDOS.NRO_PEDIDO, PEDIDOS.TIPO, PEDIDOS.VENDEDOR, VENDEDORES.NOME VENDEDOR_NOME, ';
   vSelect := vSelect + ' PEDIDOS.CLIENTE, CLIENTES.NOME CLIENTE_NOME, CLIENTES.ENDERECO, CLIENTES.BAIRRO, CLIENTES.CIDADE, ';
   vSelect := vSelect + ' CLIENTES.UF, CLIENTES.CEP, CLIENTES.CGC, CLIENTES.INSCRICAO, CLIENTES.FONE, CLIENTES.FAX, ';
   vSelect := vSelect + ' PEDIDOS.FORMAPAGTO, FORMASPAGTO.NOME FORMASPAGTO_NOME, PEDIDOS.DATA, ';
   vSelect := vSelect + ' PEDIDOS.PRAZO_ENTREGA, PEDIDOS.DT_ENTREGA, PEDIDOS.VALIDADE, PEDIDOS.DT_VALIDADE, ';
   vSelect := vSelect + ' PEDIDOS.SERVICO_SOLICITADO, PEDIDOS.OBSERVACAO, PEDIDOS.VL_DESC ';
   vSelect := vSelect + ' FROM PEDIDOS ';
   vSelect := vSelect + ' LEFT JOIN CLIENTES ON (PEDIDOS.CLIENTE = CLIENTES.CODIGO) ';
   vSelect := vSelect + ' LEFT JOIN VENDEDORES ON (PEDIDOS.VENDEDOR = VENDEDORES.CODIGO) ';
   vSelect := vSelect + ' LEFT JOIN FORMASPAGTO ON (PEDIDOS.FORMAPAGTO = FORMASPAGTO.CODIGO) ';
   vSelect := vSelect + ' WHERE NRO_PEDIDO = ' + IntToStr(oPedido);

   IBQuery1.Active := False;
   IBQuery1.SQL.Clear;
   IBQuery1.SQL.Add(vSelect);
   IBQuery1.Active := True;

   Case IBQuery1.FieldByName('TIPO').asInteger of
      0 : PrintFast1.ImprString('','Pedido (Nro. ' + IBQuery1.FieldByName('NRO_PEDIDO').asString+')',0,False);
      1 : PrintFast1.ImprString('','Orçamento (Nro. ' + IBQuery1.FieldByName('NRO_PEDIDO').asString+')',0,False);
      2 : PrintFast1.ImprString('','Ordem de Serviço (Nro. ' + IBQuery1.FieldByName('NRO_PEDIDO').asString+')',0,False);
   end;
   PrintFast1.ImprString('',FormatDateTime('dd/mm/yyyy  hh:nn',Now),31,True);
   
   PrintFast1.ImprString('',PrintFast1.Repete('-',48),0,TRUE);

   PrintFast1.ImprString('','Cliente..: '+ '(' + IBQuery1.FieldByName('CLIENTE').asString + ')',0,True);
   PrintFast1.ImprString('',Copy(IBQuery1.FieldByName('CLIENTE_NOME').asString,1,48),0,True);
   PrintFast1.ImprString('','Endereço.: '+Copy(IBQuery1.FieldByName('ENDERECO').asString,1,36),0,True);
   PrintFast1.ImprString('','Bairro...: '+Copy(IBQuery1.FieldByName('BAIRRO').asString,1,36),0,True);
   PrintFast1.ImprString('','Cidade...: '+Copy(IBQuery1.FieldByName('CIDADE').asString,1,25),0,False);
   PrintFast1.ImprString('','UF.: '+IBQuery1.FieldByName('UF').asString,37,True);
   PrintFast1.ImprString('','CEP......: '+Copy(IBQuery1.FieldByName('CEP').asString,1,25),0,True);
   PrintFast1.ImprString('','CGC......: '+IBQuery1.FieldByName('CGC').asString,0,True);
   PrintFast1.ImprString('','Insc.Est.: '+IBQuery1.FieldByName('INSCRICAO').asString,0,True);
   PrintFast1.ImprString('','Fone.....: '+IBQuery1.FieldByName('FONE').asString,0,True);
   PrintFast1.ImprString('','Fax......: '+IBQuery1.FieldByName('FAX').asString,0,True);
   PrintFast1.ImprString('',PrintFast1.Repete('=',48),0,True);

   //Olha se tem servico solicitado
   if Trim(IBQuery1.FieldByName('SERVICO_SOLICITADO').asString) <> '' then
   begin
      PrintFast1.ImprString('','S E R V I C O   S O L I C I T A D O',7,True);
      PrintFast1.ImprString('',PrintFast1.Repete('-',48),0,True);

      PrintFast1.ImprString('',WrapText(IBQuery1.FieldByName('SERVICO_SOLICITADO').asString, #13#10, ['.',' ',#9,'-'], 45),0,True);

      //Memo1.Width := 23 * 9;  //para transformar pixels em caracteres
      //Memo1.Lines.Clear;
      //Memo1.Lines.Text := IBQuery1.FieldByName('SERVICO_SOLICITADO').asString;
      //For I := 0 to Memo1.Lines.Count-1 do
      //begin
      //   PrintFast1.ImprString('',Memo1.Lines[I],0,True);
      //end;
      PrintFast1.ImprString('','',0,True);
      PrintFast1.ImprString('',PrintFast1.Repete('-',48),0,True);
   end;

   //PrintFast1.ImprString('',PrintFast1.Repete('-',48),2,TRUE);
   PrintFast1.ImprString('','CODIGO  DESCRICAO                            UN',0,TRUE);
   PrintFast1.ImprString('','     QTD X UNITARIO      %DESC   VALOR TOTAL(R$)',0,TRUE);
   PrintFast1.ImprString('',PrintFast1.Repete('-',48),0,TRUE);

   with IBQry_Itens do
   begin
      vSelect :=           ' SELECT PEDITEM.*, PRODUTOS.APELIDO, PRODUTOS.UNIDADE FROM PEDITEM LEFT JOIN PRODUTOS ON (PEDITEM.COD_PRODUTO = PRODUTOS.CODIGO) ';
      vSelect := vSelect + ' WHERE NRO_PEDIDO = ' + IntToStr(oPedido) + ' ORDER BY PEDITEM.GRUPO, PEDITEM.OPCAO, PEDITEM.SEQUENCIA';

      IBQry_Itens.Active := False;
      IBQry_Itens.SQL.Clear;
      IBQry_Itens.SQL.Add(vSelect);
      IBQry_Itens.Active := True;

      First;
      vTotal_Geral := 0;
      while not eof do
      begin
         PrintFast1.ImprString('',FieldByName('COD_PRODUTO').AsString,0,False);
         PrintFast1.ImprString('',Copy(FieldByName('DESCRICAO').AsString,1,35),8,False);
         PrintFast1.ImprString('',FieldByName('UNIDADE').AsString,45,True);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',FieldByName('QUANTIDADE').AsFloat),0,False);
         PrintFast1.ImprString('','X',9,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',FieldByName('VL_UNITARIO').AsFloat),11,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('##0.00',FieldByName('PERC_DESC').AsFloat),24,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',FieldByName('TOT_PRODUTO').AsFloat),40,True);
         vTotal_Geral := vTotal_Geral + FieldByName('TOT_PRODUTO').AsFloat;
         IBQry_Itens.Next;
      end;
      PrintFast1.ImprString('','',5,True);
      PrintFast1.ImprString('',PrintFast1.Repete('=',48),0,True);

      //Total
      //Testa se for orcamento e se imprime totais
      PrintFast1.ImprString('','T O T A L ',0,False);
      PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',vTotal_Geral),40,TRUE);

      //Desconto
      if IBQuery1.FieldByName('VL_DESC').asFloat > 0 then
      begin
         PrintFast1.ImprString('','Desconto',0,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',IBQuery1.FieldByName('VL_DESC').asFloat),40,TRUE);
         //Total a Pagar
         PrintFast1.ImprString('','Valor Total a Pagar',0,False);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,##0.00',vTotal_Geral - IBQuery1.FieldByName('VL_DESC').asFloat),40,TRUE);
      end;
      PrintFast1.ImprString('',PrintFast1.Repete('-',48),0,True);

      //Vendedor
      if IBQuery1.FieldByName('VENDEDOR').asInteger > 0 then
      begin
         PrintFast1.ImprString('','Vendedor: ' + IBQuery1.FieldByName('VENDEDOR_NOME').asString + ' ('+ IBQuery1.FieldByName('VENDEDOR').asString +')',0,True);
      end;

      //Condicoes de Pagamento
      if IBQuery1.FieldByName('FORMAPAGTO').asInteger > 0 then
      begin
         PrintFast1.ImprString('','Forma de Pagamento: ' + IBQuery1.FieldByName('FORMASPAGTO_NOME').asString,0,True);
      end;

      //Validade
      if IBQuery1.FieldByName('VALIDADE').asInteger > 0 then
      begin
         Case IBQuery1.FieldByName('TIPO').asInteger of
            0 : vTipo := 'Pedido ';
            1 : vTipo := 'Orçamento ';
            2 : vTipo := 'Ordem de Serviço ';
         end;
         PrintFast1.ImprString('',vTipo + 'válido até ' +IBQuery1.FieldByName('DT_VALIDADE').asString,0,True);
      end;

      //Prazo de Entrega
      if IBQuery1.FieldByName('PRAZO_ENTREGA').asInteger > 0 then
      begin
         PrintFast1.ImprString('','Prazo de Entrega: ' + IBQuery1.FieldByName('PRAZO_ENTREGA').asString + ' dia(s).',0,True);
      end;


      //Observacoes
      if Trim(IBQuery1.FieldByName('OBSERVACAO').asString) <> '' then
      begin
         PrintFast1.ImprString('',PrintFast1.Repete('-',48),0,True);

         PrintFast1.ImprString('',WrapText(IBQuery1.FieldByName('OBSERVACAO').asString, #13#10, ['.',' ',#9,'-'], 45),0,True);

         //Memo1.Width := 23 * 9;  //para transformar pixels em caracteres
         //Memo1.Lines.Clear;
         //Memo1.Lines.Text := IBQuery1.FieldByName('OBSERVACAO').asString;
         //For I := 0 to Memo1.Lines.Count-1 do
         //begin
         //   PrintFast1.ImprString('',Memo1.Lines[I],0,True);
         //end;
      end;
   end;

   PrintFast1.ImprString('',PrintFast1.Repete('=',48),0,TRUE);

   PrintFast1.ImprString('','',0,TRUE);
   PrintFast1.ImprString('','',0,TRUE);
   PrintFast1.ImprString('','',0,TRUE);

   PrintFast1.ImprString('',PrintFast1.Repete('-',43),2,TRUE);
   PrintFast1.ImprString('',' C L I E N T E ',16,TRUE);

   PrintFast1.ImprComo(TCompr175);

   For I := 1 to 18 do PrintFast1.ImprString('','',0,TRUE);
   //PrintFast1.Ejeta;

   PrintFast1.FimImpr;
   IBQuery1.Close;

   Finally
      IBQuery1.Free;
      IBQry_Itens.Free;
   end;
end;}

Function  Analisa_Credito_Cliente(oCliente : Integer; aVista : Boolean; oValor : Double) : Boolean;
var aMensagem, vSelect : String;
// var JvQuery, JvQry_Mov_Aberto : TJvUIBDataSet;
begin
   Result := True; {
   //Cria a Query
   JvQuery := TJvUIBDataSet.Create(Nil);
   JvQuery.Database := FrmPrincipal.Base;
   JvQuery.Transaction := FrmPrincipal.Transaction;
   JvQuery.SQL.Clear;
   JvQuery.SQL.Add(' SELECT CLIENTES.CODIGO, CLIENTES.CONS_SPC, CLIENTES.OBS_SPC, SITUACOES.SIT_CLIENTE, SITUACOES.SIT_VENDAS, ');
   JvQuery.SQL.Add(' SITUACOES.MENSAGEM, SITUACOES.LIMITE_CRED, SITUACOES.IND_CTAS_ATRA, ');
   JvQuery.SQL.Add(' SITUACOES.IND_REG_SPC_MENS FROM CLIENTES ');
   JvQuery.SQL.Add(' LEFT JOIN SITUACOES ON (CLIENTES.SITUACAO = SITUACOES.CODIGO) ');
   JvQuery.SQL.Add(' WHERE CLIENTES.CODIGO = '+ IntToStr(oCliente));
   JvQuery.Open;

   aMensagem := '';

   {mensagens
        -monitorado ou bloqueado
        -limite de credito
        -vendas a prazo ou a vista  nao autorizada
        -contas atrazadas
        -spc}

        {
   if JvQuery.FieldByName('SIT_CLIENTE').asInteger = 1 then //Cliente Monitorado
   begin
      Result := True;
      aMensagem := aMensagem + 'C L I E N T E   M O N I T O R A D O' + #10#13;
      aMensagem := aMensagem + JvQuery.FieldByName('MENSAGEM').asString + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
   end else if JvQuery.FieldByName('SIT_CLIENTE').asInteger = 2 then //Cliente Bloqueado
   begin
      Result := False;
      aMensagem := aMensagem + 'C L I E N T E   B L O Q U E A D O' + #10#13;
      aMensagem := aMensagem + JvQuery.FieldByName('MENSAGEM').asString + #10#13;
      aMensagem := aMensagem + 'Venda não é possivel.' + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
      //Adicionar dados do SPC
      if JvQuery.FieldByName('IND_REG_SPC_MENS').asInteger = 1 then
      begin
         aMensagem := aMensagem + 'Registrado no SPC : ' + JvQuery.FieldByName('CONS_SPC').asString + #10#13;
         aMensagem := aMensagem + JvQuery.FieldByName('OBS_SPC').asString + #10#13;
         aMensagem := aMensagem + ' ' + #10#13;
      end;
   end;

   //Limite de Credito
   If (JvQuery.FieldByName('LIMITE_CRED').asFloat > 0) and (oValor > JvQuery.FieldByName('LIMITE_CRED').asFloat) then
   begin
      Result := False;
      aMensagem := aMensagem + 'L I M I T E   C R É D I T O' + #10#13;
      aMensagem := aMensagem + 'Limite de crédito ultrapassado(Limite R$ '+ FormatFloat('#,###,##0.00',JvQuery.FieldByName('LIMITE_CRED').asFloat) +').' + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
   end;
   //Vendas
   if aVista and (JvQuery.FieldByName('SIT_VENDAS').asInteger in [0,2]) then
   begin
      Result := False;
      aMensagem := aMensagem + 'V E N D A   A   V I S T A' + #10#13;
      aMensagem := aMensagem + 'Vendas a Vista não permitidas para este cliente.' + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
   end
   else if not aVista and (JvQuery.FieldByName('SIT_VENDAS').asInteger in [0,1]) then
   begin
      Result := False;
      aMensagem := aMensagem + 'V E N D A   A   P R A Z O' + #10#13;
      aMensagem := aMensagem + 'Vendas a Prazo não permitidas para este cliente.' + #10#13;
      aMensagem := aMensagem + ' ' + #10#13;
   end;

   //Ctas em aberto
   if JvQuery.FieldByName('IND_CTAS_ATRA').asInteger = 1 then
   begin
      vSelect :=           ' SELECT  ';
      vSelect := vSelect + ' SUM((SELECT OSALDO_JUROS FROM CALCULA_JUROS(CTASRECEBER.CONTROLE,CTASRECEBER.DOCUMENTO,CURRENT_DATE))) SLD_TOTAL ';
      vSelect := vSelect + ' FROM CTASRECEBER WHERE VL_SALDO > 0 AND VENCTO < CURRENT_DATE ';
      vSelect := vSelect + ' AND COD_CLIENTE = ' + IntToStr(oCliente) + ' ';

      JvQry_Mov_Aberto := TJvUIBDataSet.Create(Nil);
      JvQry_Mov_Aberto.Database := FrmPrincipal.Base;
      JvQry_Mov_Aberto.Transaction := FrmPrincipal.Transaction;
      JvQry_Mov_Aberto.SQL.Clear;
      JvQry_Mov_Aberto.SQL.Add(vSelect);
      JvQry_Mov_Aberto.Open;

      if JvQry_Mov_Aberto.FieldByName('SLD_TOTAL').asFloat > 0 then
      begin
         aMensagem := aMensagem + 'C O N T A S   A T R A S A D A S' + #10#13;
         aMensagem := aMensagem + 'Este cliente possui contas atrasadas.' + #10#13;
         aMensagem := aMensagem + 'Saldo em Atraso :  R$ '+ FormatFloat('#,###,##0.00',JvQry_Mov_Aberto.FieldByName('SLD_TOTAL').asFloat) + #10#13;
         aMensagem := aMensagem + ' ' + #10#13;
      end;
   end; }
   if Trim(aMensagem) <> '' then
      MessageDlg(aMensagem,mtWarning,[mbOK],0);
end;

Function StrToIntZero(str : String) : Integer;
begin
   if Trim(str) = '' then
      Result := 0
   else
      Result := StrToInt(str);
end;

Function StrToFloatZero(str : String) : Double;
begin
   if Trim(str) = '' then
      Result := 0
   else
      Result := StrToFloat(TirarPonto(Str));
end;

function WrapText(const Line, BreakStr: string; const BreakChars: TSysCharSet;  MaxCol: Integer): string; Overload;

const
  Quotes = ['''', '"'];

Var
  L : String;
  C,LQ,BC : Char;
  P,BLen,Len : Integer;
  HB,IBC : Boolean;

begin
  Result:='';
  L:=Line;
  Blen:=Length(BreakStr);
  If (BLen>0) then
    BC:=BreakStr[1]
  else
    BC:=#0;
  Len:=Length(L);
  While (Len>0) do
    begin
    P:=1;
    LQ:=#0;
    HB:=False;
    IBC:=False;
    While ((P<=Len) and ((P<=MaxCol) or not IBC)) and ((LQ<>#0) or Not HB) do
      begin
      C:=L[P];
      If (C=LQ) then
        LQ:=#0
      else If (C in Quotes) then
        LQ:=C;
      If (LQ<>#0) then
        Inc(P)
      else
        begin
        HB:=((C=BC) and (BreakStr=Copy(L,P,BLen)));
        If HB then
          Inc(P,Blen)
        else
          begin
          If (P>MaxCol) then
            IBC:=C in BreakChars;
          Inc(P);
          end;
        end;
//      Writeln('"',C,'" : IBC : ',IBC,' HB  : ',HB,' LQ  : ',LQ,' P>MaxCol : ',P>MaxCol);
      end;
    Result:=Result+Copy(L,1,P-1);
    If Not HB then
      Result:=Result+BreakStr;
    Delete(L,1,P-1);
    Len:=Length(L);
    end;
end;

function WrapText(const Line: string; MaxCol: Integer): string; Overload;
begin
  Result := WrapText(Line,sLineBreak, [' ', '-', #9], MaxCol);
end;

procedure FormatNumericFields(Ds: TDataSet);
var i: Integer;
    F: TField;
begin
   if (Ds=nil) or not ds.Active then exit;
   for i:=0 to ds.FieldCount-1 do
   begin
      if ds.Fields[i] is TNumericField then
      begin
         if ds.Fields[i] is TLongintField then continue;
            TNumericField(ds.Fields[i]).DisplayFormat := '#,##0.00';
      end;
   end;
end;

end.
