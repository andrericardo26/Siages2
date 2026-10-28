unit usplash;

{$MODE Delphi}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TFrmSplash }

  TFrmSplash = class(TForm)
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FrmSplashCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmSplash: TFrmSplash;

implementation

Uses
Uvariaveis;

{ TFrmSplash }


{ TFrmSplash }

procedure TFrmSplash.FrmSplashCreate(Sender: TObject);
begin
   Caption := Apelido;
end;

procedure TFrmSplash.FormKeyPress(Sender: TObject; var Key: char);
begin

end;

initialization
  {$i usplash.lrs}

end.

