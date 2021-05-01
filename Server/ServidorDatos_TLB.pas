unit ServidorDatos_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 01/05/2021 11:32:14 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\DIGITAL_WHARE\Prueba Delphi\3-Prueba\3- Solucion Codigo\Crud_delphi\Server\ServidorDatos (1)
// LIBID: {56FB42EC-F4C3-4FF4-9A8E-B4FC7FD31CB0}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (midas.dll)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, Midas, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ServidorDatosMajorVersion = 1;
  ServidorDatosMinorVersion = 0;

  LIBID_ServidorDatos: TGUID = '{56FB42EC-F4C3-4FF4-9A8E-B4FC7FD31CB0}';

  IID_IServidorDCOM: TGUID = '{2EFC7C65-E782-4781-BEE7-B37CBA52F772}';
  CLASS_ServidorDCOM: TGUID = '{FC3B1107-07E9-40C2-94DA-8A26F8B93635}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IServidorDCOM = interface;
  IServidorDCOMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  ServidorDCOM = IServidorDCOM;


// *********************************************************************//
// Interface: IServidorDCOM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2EFC7C65-E782-4781-BEE7-B37CBA52F772}
// *********************************************************************//
  IServidorDCOM = interface(IAppServer)
    ['{2EFC7C65-E782-4781-BEE7-B37CBA52F772}']
    function Delete(Cod: SYSINT): SYSINT; stdcall;
    function Insert(InDatos: OleVariant): SYSINT; stdcall;
    function Update(InDatos: OleVariant): SYSINT; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IServidorDCOMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2EFC7C65-E782-4781-BEE7-B37CBA52F772}
// *********************************************************************//
  IServidorDCOMDisp = dispinterface
    ['{2EFC7C65-E782-4781-BEE7-B37CBA52F772}']
    function Delete(Cod: SYSINT): SYSINT; dispid 302;
    function Insert(InDatos: OleVariant): SYSINT; dispid 303;
    function Update(InDatos: OleVariant): SYSINT; dispid 305;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer;
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer;
                           Options: Integer; const CommandText: WideString; var Params: OleVariant;
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer;
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoServidorDCOM provides a Create and CreateRemote method to
// create instances of the default interface IServidorDCOM exposed by
// the CoClass ServidorDCOM. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoServidorDCOM = class
    class function Create: IServidorDCOM;
    class function CreateRemote(const MachineName: string): IServidorDCOM;
  end;

implementation

uses System.Win.ComObj;

class function CoServidorDCOM.Create: IServidorDCOM;
begin
  Result := CreateComObject(CLASS_ServidorDCOM) as IServidorDCOM;
end;

class function CoServidorDCOM.CreateRemote(const MachineName: string): IServidorDCOM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServidorDCOM) as IServidorDCOM;
end;

end.

