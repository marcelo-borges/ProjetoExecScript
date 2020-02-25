program ProjetoExecScript;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {ViewPrincipal},
  Classe.Funcoes in 'Classe.Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
