unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Datasnap.Win.MConnect, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TFrmPrin = class(TForm)
    DBGridClient: TDBGrid;
    CDSClient: TClientDataSet;
    DSClientes: TDataSource;
    Conect: TDCOMConnection;
    btnGuardar: TButton;
    btnActualizar: TButton;
    btnEliminar: TButton;
    CDSClientCod: TIntegerField;
    CDSClientNom: TStringField;
    CDSClientTipDoc: TStringField;
    CDSClientNumIdent: TStringField;
    CDSClientNomRepre: TStringField;
    CDSClientTel: TStringField;
    CDSClientEmail: TStringField;
    CDSClientContPers: TStringField;
    CDSClientVrActivo: TFMTBCDField;
    CDSClientVrPasivo: TFMTBCDField;
    CDSClientVrPatri: TFMTBCDField;
    edNombre: TEdit;
    edNroDoc: TEdit;
    edRepre: TEdit;
    edEmail: TEdit;
    edTelefono: TEdit;
    edContPer: TEdit;
    edActivos: TEdit;
    edPasivos: TEdit;
    edPatrimonio: TEdit;
    cbTipDoc: TComboBox;
    edCod: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label11: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Panel6: TPanel;
    procedure btnEliminarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridClientCellClick(Column: TColumn);
    procedure btnActualizarClick(Sender: TObject);
    procedure DBGridClientTitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure BuscarCliente();
  public
    { Public declarations }
  end;

var
  FrmPrin: TFrmPrin;

  function StringlistToVariant(aStrlist: TStrings): OleVariant;
  function StreamToVariant(Stream: TStream): OleVariant;
  function CamposVacios(Campos: Array Of TComponent): Boolean;
  Procedure Limpiar(Forma: TForm; ElemNoLimpiar: Array Of TComponent);
  procedure Activar(ecampos: array of TComponent; eopcion: Boolean);
  procedure ordenarDBGrid(Columna: TColumn);

implementation

{$R *.dfm}



procedure TFrmPrin.btnActualizarClick(Sender: TObject);
var
  penv: TStringList;
  env: OleVariant;
begin
  penv :=  TStringList.Create;
  try
    if not CamposVacios([edCod, edNombre, edNroDoc, edRepre, edTelefono,
      edEmail, edContPer, edActivos, edPasivos, edPatrimonio]) then
    begin

        penv.Add(edCod.Text);
        penv.Add(edNombre.Text);
        penv.Add(cbTipDoc.Items[cbTipDoc.ItemIndex]);
        penv.Add(edNroDoc.Text);
        penv.Add(edRepre.Text);
        penv.Add(edTelefono.Text);
        penv.Add(edEmail.Text);
        penv.Add(edContPer.Text);
        penv.Add(edActivos.Text);
        penv.Add(edPasivos.Text);
        penv.Add(edPatrimonio.Text);

        env := StringlistToVariant(penv);


        if Conect.AppServer.Update(env) = 200 then
        begin
          BuscarCliente;

          Limpiar(self,[]);
          Activar([btnGuardar],true);
          Activar([btnActualizar, btnEliminar],false);


          ShowMessage('Actualizacion Exitosa');
        end
        else
          ShowMessage('Error Actualizando Datos');
      end
      else
      begin
        ShowMessage('Ingrese los Datos del Registro');
      end;
  finally
    penv.Free;
  end;
end;

procedure TFrmPrin.btnEliminarClick(Sender: TObject);
begin
  if MessageDlg('¿Esta seguro de Borrar al Cliente ' + edNombre.Text + '.?',
   mtConfirmation, [mbYes,mbNo],0)= mrYes then
  begin
    if Conect.AppServer.Delete(StrToInt(edCod.Text)) = 200 then
    begin
      ShowMessage('Cliente Eliminado  ');
      BuscarCliente;
      Limpiar(self,[]);
      Activar([btnGuardar],true);
      Activar([btnActualizar, btnEliminar],false);
    end
    else
      ShowMessage('Errores al Eliminar registro');
  end;

end;

procedure TFrmPrin.btnGuardarClick(Sender: TObject);
 var
  penv: TStringList;
  env: OleVariant;
begin
  penv :=  TStringList.Create;
  try

    if not CamposVacios([edNombre, edNroDoc, edRepre, edTelefono,
      edEmail, edContPer, edActivos, edPasivos, edPatrimonio]) then
    begin

        penv.Add(edNombre.Text);
        penv.Add(cbTipDoc.Items[cbTipDoc.ItemIndex]);
        penv.Add(edNroDoc.Text);
        penv.Add(edRepre.Text);
        penv.Add(edTelefono.Text);
        penv.Add(edEmail.Text);
        penv.Add(edContPer.Text);
        penv.Add(edActivos.Text);
        penv.Add(edPasivos.Text);
        penv.Add(edPatrimonio.Text);

        env := StringlistToVariant(penv);

        if Conect.AppServer.Insert(env) = 200 then
        begin
          Limpiar(self,[]);
          BuscarCliente;
          ShowMessage('Guardado Exitoso');
        end
        else
          ShowMessage('Error Guardando Datos');

    end
    else
      ShowMessage('Ingrese los Datos del Registro');
  finally
    penv.Free;
  end;
end;

procedure TFrmPrin.BuscarCliente;
begin

    try
      CDSClient.Active := false;
      CDSClient.Active := true;
    except
      on e: Exception do
      begin
        ShowMessage('Error Buscando Datos ' + #13 + #10 + e.Message);
      end;
    end;

    if edNombre.CanFocus then
     edNombre.SetFocus;

end;

procedure TFrmPrin.DBGridClientCellClick(Column: TColumn);
begin
    edCod.Text:= CDSClientCod.AsString;
    edNombre.Text := CDSClientNom.AsString;
    cbTipDoc.ItemIndex := cbTipDoc.Items.IndexOf(CDSClientTipDoc.AsString);
    edNroDoc.Text := CDSClientNumIdent.AsString;
    edRepre.Text := CDSClientNomRepre.AsString;
    edTelefono.Text := CDSClientTel.AsString;
    edEmail.Text := CDSClientEmail.AsString;
    edContPer.Text := CDSClientContPers.AsString;
    edActivos.Text := CDSClientVrActivo.AsString;
    edPasivos.Text := CDSClientVrPasivo.AsString;
    edPatrimonio.Text := CDSClientVrPatri.AsString;

    Activar([btnGuardar],false);
    Activar([btnActualizar, btnEliminar],true);

end;



procedure TFrmPrin.DBGridClientTitleClick(Column: TColumn);
begin
  ordenarDBGrid(Column);
end;

procedure TFrmPrin.FormShow(Sender: TObject);
begin

  Activar([btnGuardar],true);
  Activar([btnActualizar, btnEliminar],false);

  if edNombre.CanFocus then
     edNombre.SetFocus;

  try
    Conect.Connected := true;
  except
    on e: exception do
    begin
      ShowMessage('Error Conexion Server ' + #13 + #10 + e.Message);
    end;
  end;

  BuscarCliente;

end;

Procedure Limpiar(Forma: TForm; ElemNoLimpiar: Array Of TComponent);
var
  I: Integer;
  Lista: TStrings;
begin
  // Forma:=nil;
  Lista := TStringList.Create;
  try
    for I := 0 to high(ElemNoLimpiar) do
    begin
      if Lista.IndexOf(ElemNoLimpiar[I].Name) = -1 then
        Lista.Add(ElemNoLimpiar[I].Name);
    end;

    for I := 0 to Forma.ComponentCount - 1 do
    begin
      if Lista.IndexOf(Forma.Components[I].Name) = -1 then
      begin

        If (Forma.Components[I] Is TEdit) Then
          TEdit(Forma.Components[I]).Clear;

        If (Forma.Components[I] Is TComboBox) Then
          TComboBox(Forma.Components[I]).Text := '';
      end;
    end;
  finally
    Lista.Free;
  end;
end;

Function CamposVacios(Campos: Array Of TComponent): Boolean;
var
  I: Byte;
begin
  CamposVacios := False;
  try
    for I := 0 to high(Campos) Do
    begin
      if (Campos[I] Is TEdit) Then
      begin

        if Trim(TEdit(Campos[I]).Text) = '' then
        begin
          CamposVacios := True;

          if TEdit(Campos[I]).CanFocus then
            TEdit(Campos[I]).SetFocus;
          Break;
        end;

      end;

      if (Campos[I] Is TComboBox) Then
      begin
        if Trim(TComboBox(Campos[I]).Text) = '' then
        begin
          CamposVacios := True;
          if TComboBox(Campos[I]).CanFocus then
            TComboBox(Campos[I]).SetFocus;
          Break;
        end;
      end;

    end; // fin del for
  except
    CamposVacios := True;
  end;
end;

procedure Activar(ecampos: array of TComponent; eopcion: Boolean);
var
  i: Byte;
begin
  for I := 0 to high(ecampos) Do
  Begin
    if (ecampos[I] Is TBitBtn) Then
      TBitBtn(ecampos[I]).Enabled := eopcion;
    if (ecampos[I] Is TButton) Then
      TButton(ecampos[I]).Enabled := eopcion;

  end;
end;

function StringlistToVariant(aStrlist: TStrings): OleVariant;
var
  hStream: TStream;
begin
  hStream := TMemoryStream.Create;
  try
    aStrList.SaveToStream(hStream);
    hStream.Seek(0,soFromBeginning);
    Result := StreamToVariant(hStream);
  finally
    hStream.Free;
  end;
end;

function StreamToVariant(Stream: TStream): OleVariant;
var
  p: Pointer;
begin
  Result := VarArrayCreate([0, Stream.Size - 1], varByte);
  p := VarArrayLock(Result);
  try
    Stream.Position := 0;
    Stream.Read(p^, Stream.Size);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure ordenarDBGrid(Columna: TColumn);
begin

  if Columna.Grid.DataSource.DataSet.Active then
  begin
    if not Columna.Grid.DataSource.DataSet.IsEmpty then
    begin
      if not (Columna.Field.FieldKind in [fkCalculated, fkLookup,fkAggregate]) then
      begin
        if not (Columna.Field.DataType in [ftBlob, ftMemo]) then
        begin
          TClientDataSet(Columna.Grid.DataSource.DataSet).IndexFieldNames := Columna.FieldName;
        end;
      end;
    end;
  end;
end;

end.
