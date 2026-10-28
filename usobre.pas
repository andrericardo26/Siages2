unit usobre;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Buttons,
  ExtCtrls, StdCtrls;

type
  TFrmSobre = class(TForm)
     Bevel1: TBevel;
     BitBtn1: TBitBtn;
     Image1: TImage;
     Image2: TImage;
     Label1: TLabel;
     Memo1: TMemo;
     Panel1: TPanel;
     StaticText1: TStaticText;
     StaticText2: TStaticText;
     StaticText3: TStaticText;
     procedure Label1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmSobre: TFrmSobre;

implementation

{ TFrmSobre }

procedure TFrmSobre.Label1Click(Sender: TObject);
begin

end;

initialization
  {$I usobre.lrs}

end.

