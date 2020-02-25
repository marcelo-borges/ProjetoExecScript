unit Classe.Funcoes;

interface

uses
  Winapi.ShellAPI, ClipBrd, System.SysUtils, System.Classes, Winapi.Windows,
  Vcl.ExtCtrls, Vcl.Forms, VCL.Graphics;

type
  TFuncoes = class
    private
      pnlMensagem: TPanel;

    public
      function ObterPathClipBoard: string;
      procedure AguardeOff;
      procedure AguardeOn(Mensagem: String; Formulario: TForm);
      procedure CentralizarPanel(ploPanel: TPanel; pliTopPanel: integer = 0);
      function iif(Condicao: Boolean; Verdadeiro,Falso:String): string; overload;
      function iif(Condicao: Boolean; Verdadeiro,Falso:Integer): integer; overload;

  end;


implementation

{ TFuncoes }

function TFuncoes.iif(Condicao: Boolean; Verdadeiro, Falso: String): string;
begin
  if Condicao then
    Result := Verdadeiro
  else
    Result := Falso;
end;

function TFuncoes.iif(Condicao: Boolean; Verdadeiro, Falso: Integer): integer;
begin
  if Condicao then
    Result := Verdadeiro
  else
    Result := Falso;
end;

function TFuncoes.ObterPathClipBoard: string;
var
  f: THandle;
  buffer: Array [0 .. MAX_PATH] of Char;
  i, numFiles: Integer;
begin
  Clipboard.Open;
  Result := '';
  try
    f := Clipboard.GetAsHandle(CF_HDROP);
    If f <> 0 Then
    begin
      numFiles := DragQueryFile(f, $FFFFFFFF, nil, 0);
      for i := 0 to numFiles - 1 do
      begin
        buffer[0] := #0;
        DragQueryFile(f, i, buffer, sizeof(buffer));
        Result := buffer;
      end;
    end;
  finally
    Clipboard.Close;
  end;

end;

procedure TFuncoes.CentralizarPanel(ploPanel: TPanel; pliTopPanel: integer = 0);
begin
  ploPanel.Left:= Trunc(TForm(ploPanel.Owner).Width / 2) - Trunc( ploPanel.Width / 2);
  ploPanel.Top:= Trunc( pliTopPanel / 2 ) + Trunc(TForm(ploPanel.Owner).Height / 2) - Trunc( ploPanel.Height / 2) ;
end;

procedure TFuncoes.AguardeOff;
begin
  If Application.FindComponent('Panel_Message') <> Nil Then
    pnlMensagem.Free;
end;

procedure TFuncoes.AguardeOn(Mensagem: String; Formulario: TForm);
begin
  if Formulario = nil then exit;
  If Application.FindComponent('Panel_Message') = Nil Then
    pnlMensagem := TPanel.Create(Application);

  pnlMensagem.Visible := False;
  pnlMensagem.BevelWidth := 1;
  pnlMensagem.BorderWidth := 5;
  pnlMensagem.Color := RGB(85,85,85);
  pnlMensagem.Name := 'Panel_Message';
  pnlMensagem.Caption := Mensagem;
  pnlMensagem.Font.Size := 14;
  pnlMensagem.Font.Color := clBlack;
  pnlMensagem.Height := 80;
  pnlMensagem.Width := 700;
  pnlMensagem.Top :=  Trunc((Formulario.Height / 2) - 40);
  pnlMensagem.Left := Trunc((Formulario.Width / 2) - 350);
  pnlMensagem.Parent := Formulario;
  pnlMensagem.Visible := True;
  pnlMensagem.BringToFront;
  Application.ProcessMessages;
end;


end.
