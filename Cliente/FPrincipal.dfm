object FrmPrin: TFrmPrin
  Left = 0
  Top = 0
  Caption = 'Registro de Clientes'
  ClientHeight = 570
  ClientWidth = 748
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 570
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 530
    object Label11: TLabel
      Left = 0
      Top = 0
      Width = 329
      Height = 29
      Align = alTop
      Alignment = taCenter
      Caption = 'Cliente '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 90
    end
    object Panel4: TPanel
      Left = 0
      Top = 465
      Width = 329
      Height = 107
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 423
      object btnActualizar: TButton
        Left = 128
        Top = 20
        Width = 74
        Height = 66
        Caption = '&Actualizar'
        Enabled = False
        TabOrder = 1
        OnClick = btnActualizarClick
      end
      object btnEliminar: TButton
        Left = 222
        Top = 20
        Width = 74
        Height = 66
        Caption = '&Eliminar'
        Enabled = False
        TabOrder = 2
        OnClick = btnEliminarClick
      end
      object btnGuardar: TButton
        Left = 32
        Top = 20
        Width = 74
        Height = 66
        Caption = '&Guardar'
        TabOrder = 0
        OnClick = btnGuardarClick
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 29
      Width = 329
      Height = 436
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label10: TLabel
        Left = 24
        Top = 388
        Width = 63
        Height = 13
        Caption = 'Vr Patrimonio'
      end
      object Label2: TLabel
        Left = 24
        Top = 83
        Width = 96
        Height = 13
        Caption = 'Nombres y Apellidos'
      end
      object Label3: TLabel
        Left = 24
        Top = 255
        Width = 24
        Height = 13
        Caption = 'Email'
      end
      object Label4: TLabel
        Left = 24
        Top = 125
        Width = 54
        Height = 13
        Caption = 'Documento'
      end
      object Label5: TLabel
        Left = 24
        Top = 171
        Width = 129
        Height = 13
        Caption = 'Nombre del Representante'
      end
      object Label6: TLabel
        Left = 24
        Top = 213
        Width = 42
        Height = 13
        Caption = 'Telefono'
      end
      object Label7: TLabel
        Left = 24
        Top = 297
        Width = 101
        Height = 13
        Caption = 'Persona de Contacto'
      end
      object Label8: TLabel
        Left = 24
        Top = 343
        Width = 48
        Height = 13
        Caption = 'Vr Activos'
      end
      object Label9: TLabel
        Left = 164
        Top = 343
        Width = 49
        Height = 13
        Caption = 'Vr Pasivos'
      end
      object cbTipDoc: TComboBox
        Left = 24
        Top = 142
        Width = 82
        Height = 21
        Style = csDropDownList
        ItemIndex = 2
        TabOrder = 2
        Text = 'CC'
        Items.Strings = (
          'RC'
          'TI'
          'CC'
          'CE'
          'PAS')
      end
      object edActivos: TEdit
        Left = 24
        Top = 360
        Width = 125
        Height = 21
        NumbersOnly = True
        TabOrder = 8
        TextHint = 'Vr Activos'
      end
      object edCod: TEdit
        Left = 24
        Top = 58
        Width = 82
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edContPer: TEdit
        Left = 24
        Top = 314
        Width = 265
        Height = 21
        MaxLength = 100
        TabOrder = 7
        TextHint = 'Persona  de contacto'
      end
      object edEmail: TEdit
        Left = 24
        Top = 272
        Width = 265
        Height = 21
        MaxLength = 50
        TabOrder = 6
        TextHint = 'Email'
      end
      object edNombre: TEdit
        Left = 24
        Top = 100
        Width = 265
        Height = 21
        MaxLength = 100
        TabOrder = 1
        TextHint = 'Nombres'
      end
      object edNroDoc: TEdit
        Left = 112
        Top = 142
        Width = 177
        Height = 21
        MaxLength = 20
        TabOrder = 3
        TextHint = 'Documento'
      end
      object edPasivos: TEdit
        Left = 164
        Top = 360
        Width = 125
        Height = 21
        NumbersOnly = True
        TabOrder = 9
        TextHint = 'Pasivos'
      end
      object edPatrimonio: TEdit
        Left = 24
        Top = 403
        Width = 265
        Height = 21
        TabOrder = 10
        TextHint = 'Vr Patrimonio'
      end
      object edRepre: TEdit
        Left = 24
        Top = 188
        Width = 265
        Height = 21
        MaxLength = 100
        TabOrder = 4
        TextHint = 'Representante legal'
      end
      object edTelefono: TEdit
        Left = 24
        Top = 230
        Width = 265
        Height = 21
        MaxLength = 20
        NumbersOnly = True
        TabOrder = 5
        TextHint = 'Telefono'
      end
    end
  end
  object Panel2: TPanel
    Left = 329
    Top = 0
    Width = 419
    Height = 570
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitHeight = 530
    object DBGridClient: TDBGrid
      Left = 1
      Top = 76
      Width = 417
      Height = 389
      Align = alClient
      DataSource = DSClientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGridClientCellClick
      OnTitleClick = DBGridClientTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nombre'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tip_Doc'
          Title.Caption = 'Tip Doc'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Num_Ident'
          Title.Caption = 'Identificacion'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nom_Repre'
          Title.Caption = 'Representante'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Telefono'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Email'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cont_Pers'
          Title.Caption = 'Persona Cont'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Activos'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vr Activos'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Pasivo'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vr Pasivos'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Patrimonio'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vr Patrimonio'
          Width = 70
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 465
      Width = 417
      Height = 104
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 417
      Height = 75
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 417
        Height = 29
        Align = alTop
        Alignment = taCenter
        Caption = 'Registro de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 238
      end
    end
  end
  object CDSClient: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    RemoteServer = Conect
    Left = 648
    Top = 152
    object CDSClientCod: TIntegerField
      DisplayWidth = 12
      FieldName = 'Codigo'
      Required = True
    end
    object CDSClientNom: TStringField
      DisplayWidth = 39
      FieldName = 'Nombre'
      Size = 70
    end
    object CDSClientTipDoc: TStringField
      DisplayWidth = 8
      FieldName = 'Tip_Doc'
      Size = 5
    end
    object CDSClientNumIdent: TStringField
      DisplayWidth = 18
      FieldName = 'Num_Ident'
      Size = 15
    end
    object CDSClientNomRepre: TStringField
      DisplayWidth = 84
      FieldName = 'Nom_Repre'
      Size = 70
    end
    object CDSClientTel: TStringField
      DisplayWidth = 13
      FieldName = 'Telefono'
      Size = 11
    end
    object CDSClientEmail: TStringField
      DisplayWidth = 84
      FieldName = 'Email'
      Size = 70
    end
    object CDSClientContPers: TStringField
      DisplayWidth = 84
      FieldName = 'Cont_Pers'
      Size = 70
    end
    object CDSClientVrActivo: TFMTBCDField
      DisplayWidth = 24
      FieldName = 'Activos'
      Precision = 19
      Size = 4
    end
    object CDSClientVrPasivo: TFMTBCDField
      DisplayWidth = 24
      FieldName = 'Pasivo'
      Precision = 19
      Size = 4
    end
    object CDSClientVrPatri: TFMTBCDField
      DisplayWidth = 24
      FieldName = 'Patrimonio'
      Precision = 19
      Size = 4
    end
  end
  object DSClientes: TDataSource
    DataSet = CDSClient
    Left = 616
    Top = 152
  end
  object Conect: TDCOMConnection
    ServerGUID = '{FC3B1107-07E9-40C2-94DA-8A26F8B93635}'
    ServerName = 'ServidorDCOM'
    Left = 584
    Top = 152
  end
end
