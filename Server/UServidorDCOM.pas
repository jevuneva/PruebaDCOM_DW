unit UServidorDCOM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServidorDatos_TLB, StdVcl, Data.DB, Bde.DBTables, Data.DBXMSSQL,
  Data.SqlExpr, Data.FMTBcd, Datasnap.Provider, Data.DBXCommon, USever,
  System.Variants;

type
  TServidorDCOM = class(TRemoteDataModule, IServidorDCOM)
    Conect: TSQLConnection;
    Query: TSQLQuery;
    DSP: TDataSetProvider;
    QueryCons: TSQLQuery;
    procedure RemoteDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  var
    Trans: TDBXTransaction;
  protected
    class procedure UpdateRegistry(Register: Boolean;
      const ClassID, ProgID: string); override;

    function Insert(InDatos: OleVariant): integer; stdcall;
    function Update(InDatos: OleVariant): integer; stdcall;
    function Delete(Cod: integer): integer; stdcall;


  public
    { Public declarations }
  end;

var
  DM: TServidorDCOM;

procedure VariantToStringlist(const Data: OleVariant; aStrlist: TStrings);
procedure VariantToStream(const Data: OleVariant; Stream: TStream);

ResourceString
  strConexionSQL =
    'SchemaOverride=sa.dbo,DriverName=MSSQL,HostName=,DataBase=,User_Name=,' +
    'Password=,BlobSize=-1,ErrorResourceFile=,LocaleCode=0000,IsolationLevel=ReadCommitted,'
    + 'OS Authentication=False,Prepare SQL=False,ConnectTimeout=60,Mars_Connection=False';

implementation

{$R *.DFM}

class procedure TServidorDCOM.UpdateRegistry(Register: Boolean;
  const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end
  else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TServidorDCOM.RemoteDataModuleCreate(Sender: TObject);
begin
  try
    with Conect do
    begin
      Params.Clear;
      Params.CommaText := strConexionSQL;
      Params.Values['HostName'] := FrmPrincipal.vServer;
      Params.Values['DataBase'] := FrmPrincipal.vDB;
      Params.Values['User_Name'] := FrmPrincipal.vUser;
      Params.Values['Password'] := FrmPrincipal.vPass;
      LibraryName := FrmPrincipal.vLib;
      Connected := true;
      FrmPrincipal.Conectado(true);
    end;

  except
    on E: exception do
    begin
      FrmPrincipal.Conectado(false);
      FrmPrincipal.mMsmError.Text := 'ERROR: ' + E.Message;
    end;
  end;
end;

function TServidorDCOM.Insert(InDatos: OleVariant): integer;
var
  Qsql: string;
  ADatos: TStringList;
begin
  try

    ADatos := TStringList.Create;
    try
      Qsql := 'exec INSECLIENTE :Nom, :TipDoc, :NumIdent, :NomRepre, ' +
        ':Tel, :Email, :ContacPer, :Acti, :Pasiv, :Patri';

      VariantToStringlist(InDatos, ADatos);

      Trans := Conect.BeginTransaction;

      with Query do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Qsql);

        ParamByName('Nom').AsString := ADatos[0];
        ParamByName('TipDoc').AsAnsiString := ADatos[1];
        ParamByName('NumIdent').AsString := ADatos[2];
        ParamByName('NomRepre').AsString := ADatos[3];
        ParamByName('Tel').AsString := ADatos[4];
        ParamByName('Email').AsString := ADatos[5];
        ParamByName('ContacPer').AsString := ADatos[6];
        ParamByName('Acti').AsCurrency := StrToCurr(ADatos[7]);
        ParamByName('Pasiv').AsCurrency := StrToCurr(ADatos[8]);
        ParamByName('Patri').AsCurrency := StrToCurr(ADatos[9]);
        ExecSQL();
      end;
      Conect.CommitFreeAndNil(Trans);
      Result := 200;
    finally
      ADatos.Free;
    end;

  except
    on E: exception do
    begin
      Result := 404;
      Conect.RollbackFreeAndNil(Trans);
    end;
  end;

end;

function TServidorDCOM.Update(InDatos: OleVariant): integer;
var
  Qsql: string;
  ADatos: TStringList;
begin

  try

    ADatos := TStringList.Create;
    try
      Qsql := ' exec ACTCLIENTE :cod, :Nom, :TipDoc, :NumIdent, :NomRepre, ' +
        ':Tel, :Email, :ContacPer, :Acti, :Pasiv, :Patri';

      VariantToStringlist(InDatos, ADatos);

      Trans := Conect.BeginTransaction;

      with Query do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Qsql);
        ParamByName('cod').AsString := ADatos[0];
        ParamByName('Nom').AsString := ADatos[1];
        ParamByName('TipDoc').AsAnsiString := ADatos[2];
        ParamByName('NumIdent').AsString := ADatos[3];
        ParamByName('NomRepre').AsString := ADatos[4];
        ParamByName('Tel').AsString := ADatos[5];
        ParamByName('Email').AsString := ADatos[6];
        ParamByName('ContacPer').AsString := ADatos[7];
        ParamByName('Acti').AsCurrency := StrToCurr(ADatos[8]);
        ParamByName('Pasiv').AsCurrency := StrToCurr(ADatos[9]);
        ParamByName('Patri').AsCurrency := StrToCurr(ADatos[10]);
        ExecSQL();
        Result := 200;
      end;
      Conect.CommitFreeAndNil(Trans);
    finally
      ADatos.Free;
    end;

  except
    on E: exception do
    begin
      Result := 404;
      Conect.RollbackFreeAndNil(Trans);
    end;
  end;
end;

function TServidorDCOM.Delete(Cod: integer): integer;
var
  Qsql: string;
begin

  Qsql := 'delete from cliente where codigo = :cod';
  try
    Trans := Conect.BeginTransaction;

    with Query do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Qsql);
      ParamByName('cod').Asinteger := Cod;
      ExecSQL();
      Result := 200;
    end;
    Conect.CommitFreeAndNil(Trans);

  except
    on E: exception do
    begin
      Result := 404;
      Conect.RollbackFreeAndNil(Trans);
    end;
  end;

end;

procedure VariantToStringlist(const Data: OleVariant; aStrlist: TStrings);
var
  hStream: TStream;
begin
  hStream := TMemoryStream.Create;
  try
    VariantToStream(Data, hStream);
    hStream.Seek(0, soFromBeginning);
    aStrlist.LoadFromStream(hStream);
  finally
    hStream.Free;
  end;
end;

procedure VariantToStream(const Data: OleVariant; Stream: TStream);
var
  p: Pointer;
begin
  p := VarArrayLock(Data);
  try
    Stream.Write(p^, VarArrayHighBound(Data, 1) + 1); // assuming low bound = 0
  finally
    VarArrayUnlock(Data);
  end;
end;

initialization

TComponentFactory.Create(ComServer, TServidorDCOM, Class_ServidorDCOM,
  ciMultiInstance, tmApartment);

end.
