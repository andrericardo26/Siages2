unit uSobre3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls{, Panel};

type

  { TFrmSobre3 }

  TFrmSobre3 = class(TForm)
    logosolis: TImage;
    logolazarus: TImage;
    logofirebird: TImage;
    logosiages: TImage;
    logogpl: TImage;
    Label1: TLabel;
    sombrafirebird: TShape;
    sombragpl: TShape;
    sombralazarus: TShape;
    versao2: TLabel;
    versao1: TLabel;
    sitesolis: TLabel;
    sitesiages: TLabel;
    Panel1: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure logofirebirdMouseEnter(Sender: TObject);
    procedure logofirebirdMouseLeave(Sender: TObject);
    procedure logogplMouseEnter(Sender: TObject);
    procedure logogplMouseLeave(Sender: TObject);
    procedure logolazarusMouseEnter(Sender: TObject);
    procedure logolazarusMouseLeave(Sender: TObject);
    procedure logosiagesClick(Sender: TObject);
    procedure logosiagesMouseLeave(Sender: TObject);
    procedure logosolisMouseLeave(Sender: TObject);
    procedure sitesiagesMouseEnter(Sender: TObject);
    procedure sitesiagesMouseLeave(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmSobre3: TFrmSobre3;

implementation

{ TFrmSobre3 }

procedure TFrmSobre3.Image1Click(Sender: TObject);
begin
  //close;
end;

procedure TFrmSobre3.Image1MouseEnter(Sender: TObject);
begin
  //Screen.Cursor := crHandPoint;
  //Parent.Cursor := crHandPoint;
  //sitesolis.Font.Style := [fsUnderline];
end;

procedure TFrmSobre3.Image4MouseEnter(Sender: TObject);
begin
  //Screen.Cursor := crHandPoint;
  //Parent.Cursor := crHandPoint;
  //sitesiages.Font.Style := [fsUnderline];
end;

procedure TFrmSobre3.logofirebirdMouseEnter(Sender: TObject);
begin
  //sombrafirebird.Visible := true;
end;

procedure TFrmSobre3.logofirebirdMouseLeave(Sender: TObject);
begin
  //sombrafirebird.Visible := false;
end;

procedure TFrmSobre3.logogplMouseEnter(Sender: TObject);
begin
  //sombragpl.Visible := true;
end;

procedure TFrmSobre3.logogplMouseLeave(Sender: TObject);
begin
  //sombragpl.Visible := false;
end;

procedure TFrmSobre3.logolazarusMouseEnter(Sender: TObject);
begin
  //sombralazarus.Visible := true;
end;

procedure TFrmSobre3.logolazarusMouseLeave(Sender: TObject);
begin
  //sombralazarus.Visible := false;
end;

procedure TFrmSobre3.logosiagesClick(Sender: TObject);
begin
  //;
end;

procedure TFrmSobre3.logosiagesMouseLeave(Sender: TObject);
begin
  //sitesiages.Font.Style := [];
end;

procedure TFrmSobre3.logosolisMouseLeave(Sender: TObject);
begin
  //Screen.Cursor := crDefault;
  //Parent.Cursor := crHandPoint;
  //sitesolis.Font.Style := [];
end;

procedure TFrmSobre3.sitesiagesMouseEnter(Sender: TObject);
begin
  //Screen.Cursor := crHandPoint;
  //Parent.Cursor := crHandPoint;
  //sitesiages.Font.Style := [fsUnderline];
end;

procedure TFrmSobre3.sitesiagesMouseLeave(Sender: TObject);
begin
  //sitesiages.Font.Style := [];
end;

procedure TFrmSobre3.FormKeyPress(Sender: TObject; var Key: char);
begin
  close;
end;

initialization
//  {$I usobre3.lrs}

end.

