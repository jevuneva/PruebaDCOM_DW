object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Servidor DCOM Clientes'
  ClientHeight = 163
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LbEstadoConect: TLabel
    Left = 134
    Top = 57
    Width = 147
    Height = 25
    Caption = 'Desconectado'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = 6457072
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 78
    Top = 8
    Width = 258
    Height = 33
    Caption = 'Server DCOM Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object mMsmError: TMemo
    Left = 8
    Top = 88
    Width = 393
    Height = 57
    TabStop = False
    BevelInner = bvNone
    BorderStyle = bsNone
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
end
