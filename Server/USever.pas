unit USever;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, ServidorDatos_TLB, System.IniFiles;

type
  TFrmPrincipal = class(TForm)
    LbEstadoConect: TLabel;
    Label2: TLabel;
    mMsmError: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vServer, vUser, vPass, vDB, vLib :String;
    procedure Conectado(est: boolean);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UServidorDCOM;

{$R *.dfm}

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
  ArchIni : TIniFile;
  RutaArch: String;
begin
  ArchIni := Nil;

  TRY
    RutaArch := ExtractFilePath(Application.ExeName) + 'Config.ini';

    if FileExists ( RutaArch ) then
    begin
      try
        ArchIni := TIniFile.Create( RutaArch );

        with ArchIni do
        begin
          vServer := ReadString('Conection', 'SERVER', '');
          vDB     := ReadString('Conection', 'DB', '');
          vUser   := ReadString('Conection', 'USER', '');
          vPass   := ReadString('Conection', 'PASS', '');
          vLib    := ReadString('Conection', 'LIB', '');
        end;
      finally
        ArchIni.Free;
      end;
    end else
      ShowMessage('Archivo Configuracion no Encontrado');
  EXCEPT
    on e:exception do
    begin
      ShowMessage('Error Configuracion ' + #13 + #10 + e.Message);
      raise;
    end;
  END;

end;

procedure TFrmPrincipal.Conectado(est: boolean);
begin
    if est then
    begin
      LbEstadoConect.Caption := 'Conectado';
      LbEstadoConect.Font.Color := $0015B51E;
    end else
    begin
      LbEstadoConect.Caption := 'Desconectado';
      LbEstadoConect.Font.Color := $006286F0;
    end;
end;

end.
