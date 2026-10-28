unit ucalc_retencao;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type

  { TFrmCalcRetencao }

  TFrmCalcRetencao = class(TForm)
     Bevel1: TBevel;
     Bevel2: TBevel;
     Btn_Cancel: TBitBtn;
     Btn_Ok: TBitBtn;
     Edit_Pertc_PisCofins: TEdit;
     Edit_Pertc_CSLL: TEdit;
     Edit_Pertc_IRRF: TEdit;
     Edit_Vlr_PisCofins: TEdit;
     Edit_Vlr_CSLL: TEdit;
     Edit_Vlr_IRRF: TEdit;
     Label1: TLabel;
     Label10: TLabel;
     Label11: TLabel;
     Label2: TLabel;
     Label3: TLabel;
     Label4: TLabel;
     Label5: TLabel;
     Label6: TLabel;
     Label7: TLabel;
     Label8: TLabel;
     Label9: TLabel;
     PanelTot_Nota: TPanel;
     PanelTot_Nota_Novo: TPanel;
     procedure Btn_Cancel1Click(Sender: TObject);
     Procedure Calcula_Descontos;
     procedure Edit_Pertc_CSLLExit(Sender: TObject);
     procedure Edit_Pertc_IRRFExit(Sender: TObject);
     procedure Edit_Pertc_PisCofinsEnter(Sender: TObject);
     procedure Edit_Pertc_PisCofinsExit(Sender: TObject);
     procedure Edit_Vlr_CSLLExit(Sender: TObject);
     procedure Edit_Vlr_IRRFExit(Sender: TObject);
     procedure Edit_Vlr_PisCofinsChange(Sender: TObject);
     procedure Edit_Vlr_PisCofinsExit(Sender: TObject);
     procedure FrmCalcRetencaoShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    Valor_NF : Double;
  end; 

var
  FrmCalcRetencao: TFrmCalcRetencao;

implementation

Uses Global, UVariaveis;

{ TFrmCalcRetencao }

procedure TFrmCalcRetencao.Calcula_Descontos;
begin
   PanelTot_Nota_Novo.Caption := FormatFloat('#,###,##0.00',
   ( StrToFloat(TirarPonto(PanelTot_Nota.Caption))
   - (StrToFloat(Edit_Vlr_PisCofins.Text))
   - (StrToFloat(Edit_Vlr_CSLL.Text))
   - (StrToFloat(Edit_Vlr_IRRF.Text))  )
   );
end;

procedure TFrmCalcRetencao.Btn_Cancel1Click(Sender: TObject);
begin

end;

procedure TFrmCalcRetencao.Edit_Pertc_CSLLExit(Sender: TObject);
begin
   Edit_Vlr_CSLL.Text := FormatFloat('#,###,##0.00',( StrToFloat(TirarPonto(PanelTot_Nota.Caption)) * (StrToFloat(Edit_Pertc_CSLL.Text) / 100) ) );
   Calcula_Descontos;
end;

procedure TFrmCalcRetencao.Edit_Pertc_IRRFExit(Sender: TObject);
begin
   Edit_Vlr_IRRF.Text := FormatFloat('#,###,##0.00',( StrToFloat(TirarPonto(PanelTot_Nota.Caption)) * (StrToFloat(Edit_Pertc_IRRF.Text) / 100) ) );
   Calcula_Descontos;
end;

procedure TFrmCalcRetencao.Edit_Pertc_PisCofinsEnter(Sender: TObject);
begin
   (Sender as TEdit).SelectAll;
end;

procedure TFrmCalcRetencao.Edit_Pertc_PisCofinsExit(Sender: TObject);
begin
   Edit_Vlr_PisCofins.Text := FormatFloat('#,###,##0.00',( StrToFloat(TirarPonto(PanelTot_Nota.Caption)) * (StrToFloat(Edit_Pertc_PisCofins.Text) / 100) ) );
   Calcula_Descontos;
end;

procedure TFrmCalcRetencao.Edit_Vlr_CSLLExit(Sender: TObject);
begin
   Calcula_Descontos;
end;

procedure TFrmCalcRetencao.Edit_Vlr_IRRFExit(Sender: TObject);
begin
   Calcula_Descontos;
end;

procedure TFrmCalcRetencao.Edit_Vlr_PisCofinsChange(Sender: TObject);
begin

end;

procedure TFrmCalcRetencao.Edit_Vlr_PisCofinsExit(Sender: TObject);
begin
   Calcula_Descontos;
end;

procedure TFrmCalcRetencao.FrmCalcRetencaoShow(Sender: TObject);
begin
   PanelTot_Nota.Caption := FormatFloat('#,###,##0.00',Valor_NF);
   Calcula_Descontos;
   if Parametros.RETEN_PISCOFINS = 0 then
   begin
      Edit_Pertc_PisCofins.Enabled := False;
      Edit_Vlr_PisCofins.Enabled := False;
   end;
   if Parametros.RETEN_CSLL = 0 then
   begin
      Edit_Pertc_CSLL.Enabled := False;
      Edit_Vlr_CSLL.Enabled := False;
   end;
   if Parametros.RETEN_IRRF = 0 then
   begin
      Edit_Pertc_IRRF.Enabled := False;
      Edit_Vlr_IRRF.Enabled := False;
   end;

   if (StrToFloatZero(TirarPonto(Edit_Vlr_PisCofins.Text)) > 0) or
      (StrToFloatZero(TirarPonto(Edit_Vlr_CSLL.Text)) > 0) or
      (StrToFloatZero(TirarPonto(Edit_Vlr_IRRF.Text)) > 0) then
   begin
      Btn_Cancel.SetFocus;
   end;
end;


initialization
  {$I ucalc_retencao.lrs}

end.

