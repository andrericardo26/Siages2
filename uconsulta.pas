unit UConsulta;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, Db, Menus, ImgList, LResources,
  ZDataset;

type

  { TFrmPesquisa }

  TFrmPesquisa = class(TForm)
    DataSource1: TDataSource;
    dbGrid1: TdbGrid;
    zQuery: TZQuery;
    Pop_NumReg: TPopupMenu;
    Nmeroderegistrosencontrados1: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure FrmPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure Nmeroderegistrosencontrados1Click(Sender: TObject);
    Procedure Busca_Mascaras;
    procedure IBQuery1AfterOpen(DataSet: TDataSet);
    procedure dbGrid1Exit(Sender: TObject);

  private
    { Private declarations }
    IndexINI : String;
    CampoRET : String;
    SQL : String;
    aMensagem : String;
    Exec_1 : Boolean; //Se for a primeira vez da execucao da query
    AbrirConteudo : Boolean;
  public
    { Public declarations }
  published
     property Indice_Inicial:String read IndexINI write IndexINI;
     property Campo_Retorno:String read CampoRET write CampoRET;
     property Select:String read SQL write SQL;
     property Mensagem:String read aMensagem write aMensagem;
     property Abrir_Conteudo:Boolean read AbrirConteudo write AbrirConteudo default False;
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

uses UPrincipal, Global;


procedure TFrmPesquisa.FormShow(Sender: TObject);
   Function TiraAspas(oTexto : String) : String;
   var Ret : string;
       I : Integer;
   begin
      Ret := '';
      For I := 1 to Length(oTexto)-1 do
      begin
         if oTexto[I] <> '"' then
            Ret := Ret + oTexto[I];
      end;
      if Ret[Length(Ret)] in ['1','2','3','4','5'] then
         Ret := Copy(Ret,1,Length(ret)-1);
      Result := Ret;
   end;
var I : Integer;
    oSelect, aOrdem, Condicao_zero : String;
begin
   {if Width <> 476 then
   begin
      Panel1.Align := alNone;
      Panel1.Width := 470;
      Panel1.Left := (Width-470) div 2;
   end
   else
   begin
      Panel1.Align := alBottom;
   end;
   
   if Trim(Mensagem) = '' then
   begin
      if Panel1.Align = alNone then
         Panel1.Top := Panel1.Top - PanelMensagem.Height;
      Height := Height - PanelMensagem.Height;
      PanelMensagem.Visible := False;
      LabelMensagem.Caption := '';
   end
   else
   begin
      LabelMensagem.Caption := Mensagem;
      PanelMensagem.Visible := True;
   end;         }

   Caption := 'Pesquisa ('+ Caption +')';
         {
   JvQuery.Database := FrmPrincipal.Base;
   JvQuery.Transaction := FrmPrincipal.Transaction;
   JvQuery.Close;
   JvQuery.SQL.Clear;

   //Coloca condicao para nao retornar nenhum registro

   //Olha se tem ORDER
   aOrdem := '';
   if Pos('ORDER BY', AnsiUpperCase(Select)) > 0 then
   begin
      oSelect := Copy(Select,1,Pos('ORDER BY', AnsiUpperCase(Select))-1);
      aOrdem := Copy(Select,Pos('ORDER BY', AnsiUpperCase(Select)),Length(Select));
   end
   else
   begin
      oSelect := AnsiUpperCase(Select);
      aOrdem := '';
   end;
   Condicao_zero := '';
   if not Abrir_Conteudo then
      Condicao_zero := ' AND '+ Campo_Retorno +' IS NULL ';
   if Pos('WHERE',AnsiUpperCase(oSelect)) > 0 then
   begin
      //oSelect := oSelect + CRI;
      JvQuery.SQL.Add(oSelect + Condicao_zero + aOrdem);
   end
   else
   begin
      //oSelect := oSelect + ' WHERE ' + Copy(CRI, 6, Length(CRI));
      JvQuery.SQL.Add(oSelect + ' WHERE ' + Copy(Condicao_zero, 6, Length(Condicao_zero)) + aOrdem);
   end;
   JvQuery.Open;

   Exec_1 := True; //Executa pela 1 vez

   ComboBox1.Items.Clear;
   For I := 0 to JvQuery.FieldCount-1 do
   begin
      if Trim(JvQuery.FieldDefs[I].Name) <> '' then
      begin
         ComboBox1.Items.Add(JvQuery.FieldDefs[I].Name);
         if (UpperCase(JvQuery.FieldDefs[I].Name) = UpperCase(Indice_Inicial)) or (UpperCase(TiraAspas(JvQuery.FieldDefs[I].Name)) = UpperCase(Indice_Inicial)) then
            ComboBox1.ItemIndex := I;
      end;

   end; }
   Edit1.SetFocus;
end;

procedure TFrmPesquisa.Edit1Change(Sender: TObject);
begin

end;

procedure TFrmPesquisa.BitBtn1Click(Sender: TObject);
begin

end;

procedure TFrmPesquisa.DBGrid1DblClick(Sender: TObject);
begin
   BitBtn1.Click;
end;

procedure TFrmPesquisa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      BitBtn1.SetFocus;
   end;
   //if Key = vk_Escape then
   //begin
   //   BitBtn2.Click;
   //end;
end;

procedure TFrmPesquisa.Edit1Exit(Sender: TObject);
var CRI, oSelect, aOrdem : String;
    I : Integer;
begin
   datasource1.dataset := nil;
   dbGrid1.DataSource := nil;
          {
   if Length(Trim(Edit1.Text)) = 0 then
   begin
      if Exec_1 = True then
      begin
         JvQuery.Close;
         JvQuery.SQL.Clear;
         JvQuery.SQL.Add(Select);
         JvQuery.Open;
         if JvQuery.RecordCount > 0 then
         begin
            datasource1.dataset := (JvQuery as Tdataset);
            dbGrid1.DataSource := Datasource1;
            dbGrid1.SetFocus;
         end;
         Exec_1 := False; //Executa mais vezes
      end;
      Exit;
   end;

   case JvQuery.FieldDefs[ComboBox1.ItemIndex].DataType of
      ftString :  begin
                     //ListSep1.Entrada  := Edit1.Text;
                     //ListSep1.Execute;
                     CRI := '';
                     //For I := 0 to ListSep1.Saida.Count -1 do
                     //begin
                     //   CRI := CRI + ' AND Upper('+ ComboBox1.Items[ComboBox1.ItemIndex] +') like ''%'+ AnsiUpperCase(ListSep1.Saida[I]) + '%'' ';
                     //end;
                     CRI := CRI + ' AND Upper('+ ComboBox1.Items[ComboBox1.ItemIndex] +') like ''%'+ AnsiUpperCase(Edit1.Text) + '%'' ';
                  end;
      ftDate    : begin
                     if Not ValiData(Trim(Edit1.Text)) then
                     begin
                        MessageDlg('Data Inválida. Verifique!', mtWarning,[mbOK],0);
                        Edit1.SetFocus;
                        Exit;
                     end;
                     CRI := ' AND '+ComboBox1.Items[ComboBox1.ItemIndex]+' = ''' + FormatDateTime('mm/dd/yyyy',StrToDate(Trim(Edit1.Text))) +'''';
                  end;
      ftInteger : begin
                     if Not ValInteger(Trim(Edit1.Text)) then
                     begin
                        MessageDlg('Número Inteiro Inválido. Verifique!', mtWarning,[mbOK],0);
                        Edit1.SetFocus;
                        Exit;
                     end;
                     CRI := ' AND '+ComboBox1.Items[ComboBox1.ItemIndex]+' = ' + Trim(Edit1.Text);
                  end;
      else   CRI := ' AND '+ComboBox1.Items[ComboBox1.ItemIndex]+' = ' + Trim(Edit1.Text);
   end;
   oSelect := '';

   //Olha se tem ORDER
   aOrdem := '';
   if Pos('ORDER BY', AnsiUpperCase(Select)) > 0 then
   begin
      oSelect := Copy(Select,1,Pos('ORDER BY', AnsiUpperCase(Select))-1);
      aOrdem := Copy(Select,Pos('ORDER BY', AnsiUpperCase(Select)),Length(Select));
   end
   else
   begin
      oSelect := AnsiUpperCase(Select);
      aOrdem := '';
   end;

   if Pos('WHERE',AnsiUpperCase(oSelect)) > 0 then
   begin
      oSelect := oSelect + CRI;
   end
   else
   begin
      oSelect := oSelect + ' WHERE ' + Copy(CRI, 6, Length(CRI));
   end;
   JvQuery.Close;
   JvQuery.SQL.Clear;
   JvQuery.SQL.Add(oSelect + ' ' + aOrdem);
   JvQuery.Open;
   
   if JvQuery.RecordCount > 0 then
   begin
      datasource1.dataset := (JvQuery as Tdataset);
      dbGrid1.DataSource := Datasource1;
      dbGrid1.SetFocus;
      //dbGrid1.Columns[1].Width := 200;
      //dbGrid1.Refresh;
      //dbGrid1.Repaint;
   end
   else
   begin
      //Edit1.SetFocus;
      //Edit1.SelectAll;
   end;  }
end;

procedure TFrmPesquisa.FrmPesquisaKeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TFrmPesquisa.Nmeroderegistrosencontrados1Click(Sender: TObject);
begin
   //NumeroRegistros(IBQuery1.SQL.Text);
end;

Procedure TFrmPesquisa.Busca_Mascaras;
var I : Integer;
begin        {
   For I := 0 to JvQuery.Fields.Count-1 do
   begin
      case JvQuery.FieldDefs[I].DataType of
      ftBCD : TBCDField(JvQuery.Fields[I]).DisplayFormat := '#,###,##0.00';
      ftDate  : TDateField(JvQuery.Fields[I]).DisplayFormat := 'dd/mm/yyyy';
      end;
   end;     }
end;

procedure TFrmPesquisa.IBQuery1AfterOpen(DataSet: TDataSet);
begin
   Busca_Mascaras;
end;

procedure TFrmPesquisa.dbGrid1Exit(Sender: TObject);
begin

end;

initialization
  {$i uconsulta.lrs}

end.
