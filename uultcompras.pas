unit UultCompras;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, LResources, LCLType;

type
  TFrmUltCompras = class(TForm)
    dbGrid2: TdbGrid;
//    JvQry_Compras: TJvUIBDataSet;
    Src_Compras: TDataSource;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FrmUltComprasCreate(Sender: TObject);
    procedure FrmUltComprasShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUltCompras: TFrmUltCompras;

implementation

uses UReajuste, UPrincipal;


procedure TFrmUltCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   FrmUltCompras.Release;
   FrmUltCompras := nil;
end;

procedure TFrmUltCompras.DBGrid1CellClick(Column: TColumn);
begin

end;

procedure TFrmUltCompras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_Escape then
      Close;
end;

procedure TFrmUltCompras.FrmUltComprasCreate(Sender: TObject);
begin
{    JvQry_Compras.database := frmprincipal.base;
   JvQry_Compras.transaction := frmprincipal.transaction; }
end;

procedure TFrmUltCompras.FrmUltComprasShow(Sender: TObject);
begin
   Left := 163; Top := 400;
end;

initialization
   {$i uultcompras.lrs}

end.
