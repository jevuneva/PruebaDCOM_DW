program Cliente;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {FrmPrin},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TFrmPrin, FrmPrin);
  Application.Run;

end.
