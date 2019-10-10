object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Clientes'
  ClientHeight = 526
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object lblNome: TLabel
    Left = 73
    Top = 51
    Width = 53
    Height = 19
    Caption = 'Nome :'
  end
  object lblIdentidade: TLabel
    Left = 40
    Top = 91
    Width = 86
    Height = 19
    Caption = 'Identidade :'
  end
  object lblCPF: TLabel
    Left = 355
    Top = 91
    Width = 33
    Height = 19
    Caption = 'CPF:'
  end
  object lblTelefone: TLabel
    Left = 54
    Top = 139
    Width = 72
    Height = 19
    Caption = 'Telefone :'
  end
  object lblEmail: TLabel
    Left = 70
    Top = 179
    Width = 56
    Height = 19
    Caption = 'E-mail :'
  end
  object Label5: TLabel
    Left = 87
    Top = 241
    Width = 39
    Height = 19
    Caption = 'CEP :'
  end
  object lblLogradouro: TLabel
    Left = 33
    Top = 275
    Width = 93
    Height = 19
    Caption = 'Logradouro :'
  end
  object lblNumero: TLabel
    Left = 58
    Top = 314
    Width = 68
    Height = 19
    Caption = 'N'#250'mero :'
  end
  object lblComplemento: TLabel
    Left = 228
    Top = 314
    Width = 110
    Height = 19
    Caption = 'Complemento :'
  end
  object lblBairro: TLabel
    Left = 73
    Top = 353
    Width = 53
    Height = 19
    Caption = 'Bairro :'
  end
  object lblCidade: TLabel
    Left = 67
    Top = 392
    Width = 59
    Height = 19
    Caption = 'Cidade :'
  end
  object lblEstado: TLabel
    Left = 68
    Top = 431
    Width = 58
    Height = 19
    Caption = 'Estado :'
  end
  object lblPais: TLabel
    Left = 207
    Top = 431
    Width = 39
    Height = 19
    Caption = 'Pais :'
  end
  object btnLocalizarEnd: TSpeedButton
    Left = 270
    Top = 234
    Width = 147
    Height = 26
    Caption = 'Localizar Endere'#231'o'
    OnClick = btnLocalizarEndClick
  end
  object btnGravar: TSpeedButton
    Left = 136
    Top = 480
    Width = 121
    Height = 33
    Caption = 'Confirma Dados'
    OnClick = btnGravarClick
  end
  object btnCancelar: TSpeedButton
    Left = 424
    Top = 480
    Width = 113
    Height = 33
    Caption = 'Cancelar'
    OnClick = btnCancelarClick
  end
  object gbEndereco: TGroupBox
    Left = 24
    Top = 209
    Width = 626
    Height = 19
    Caption = 'Endere'#231'o'
    TabOrder = 13
  end
  object edtNome: TEdit
    Left = 127
    Top = 48
    Width = 458
    Height = 27
    MaxLength = 50
    TabOrder = 0
  end
  object edtIdentidade: TEdit
    Left = 127
    Top = 90
    Width = 194
    Height = 27
    MaxLength = 13
    TabOrder = 1
  end
  object edtCPF: TEdit
    Left = 392
    Top = 90
    Width = 193
    Height = 27
    MaxLength = 14
    TabOrder = 2
    OnExit = edtCPFExit
  end
  object edtTelefone: TEdit
    Left = 127
    Top = 133
    Width = 194
    Height = 27
    MaxLength = 20
    TabOrder = 3
  end
  object edtEmail: TEdit
    Left = 127
    Top = 176
    Width = 458
    Height = 27
    MaxLength = 30
    TabOrder = 4
  end
  object edtLogradouro: TEdit
    Left = 127
    Top = 272
    Width = 473
    Height = 27
    MaxLength = 50
    TabOrder = 6
  end
  object edtNumero: TEdit
    Left = 127
    Top = 311
    Width = 91
    Height = 27
    MaxLength = 10
    TabOrder = 7
  end
  object edtComplemento: TEdit
    Left = 344
    Top = 311
    Width = 256
    Height = 27
    MaxLength = 20
    TabOrder = 8
  end
  object edtBairro: TEdit
    Left = 127
    Top = 350
    Width = 318
    Height = 27
    MaxLength = 30
    TabOrder = 9
  end
  object edtCidade: TEdit
    Left = 127
    Top = 389
    Width = 473
    Height = 27
    MaxLength = 40
    TabOrder = 10
  end
  object edtEstado: TEdit
    Left = 127
    Top = 428
    Width = 46
    Height = 27
    CharCase = ecUpperCase
    TabOrder = 11
  end
  object edtPais: TEdit
    Left = 260
    Top = 428
    Width = 340
    Height = 27
    MaxLength = 50
    TabOrder = 12
  end
  object edtcep: TMaskEdit
    Left = 126
    Top = 234
    Width = 138
    Height = 27
    EditMask = '00000\-999;1;_'
    MaxLength = 9
    TabOrder = 5
    Text = '     -   '
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 536
    Width = 697
    Height = 120
    DataSource = DataSource1
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 624
    Top = 16
    object FDMemTable1Nome: TStringField
      DisplayWidth = 50
      FieldName = 'Nome'
      Size = 50
    end
    object FDMemTable1Identidade: TStringField
      FieldName = 'Identidade'
      Size = 12
    end
    object FDMemTable1CPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object FDMemTable1Telefone: TStringField
      FieldName = 'Telefone'
    end
    object FDMemTable1emai: TStringField
      FieldName = 'Email'
      Size = 30
    end
    object FDMemTable1Cep: TStringField
      FieldName = 'Cep'
      Size = 10
    end
    object FDMemTable1Logradouro: TStringField
      FieldName = 'Logradouro'
      Size = 50
    end
    object FDMemTable1Numero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object FDMemTable1Complemento: TStringField
      FieldName = 'Complemento'
    end
    object FDMemTable1Bairro: TStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object FDMemTable1Cidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object FDMemTable1Estado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object FDMemTable1Pais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 552
    Top = 232
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'CEP'
        Options = [poAutoCreated]
        Value = '01001000'
      end>
    Resource = 'ws/{CEP}/json'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 616
    Top = 232
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 616
    Top = 280
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable2
    FieldDefs = <>
    Response = RESTResponse1
    Left = 616
    Top = 320
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 616
    Top = 376
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 600
    Top = 568
  end
  object XMLDocument1: TXMLDocument
    Left = 624
    Top = 448
  end
end
