program ServidorDatos;

uses
  MidasLib,
  Vcl.Forms,
  USever in 'USever.pas' {FrmPrincipal},
  UServidorDCOM in 'UServidorDCOM.pas' {ServidorDCOM: TRemoteDataModule} {ServidorDCOM: CoClass};

{$R *.TLB}
{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;

end.
