object frmEnviaEmail: TfrmEnviaEmail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Envia E-mail'
  ClientHeight = 192
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 46
    Height = 13
    Caption = 'Assunto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 62
    Height = 13
    Caption = 'Mensagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 13
    Width = 26
    Height = 13
    Caption = 'Para'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 130
    Width = 36
    Height = 13
    Caption = 'Anexo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnEnviar: TButton
    Left = 207
    Top = 159
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 0
    OnClick = btnEnviarClick
  end
  object edtAssunto: TEdit
    Left = 85
    Top = 37
    Width = 420
    Height = 21
    TabOrder = 1
    Text = 'XML Cliente'
  end
  object memCorpo: TMemo
    Left = 85
    Top = 64
    Width = 420
    Height = 57
    Lines.Strings = (
      'Segue anexo o XML do Cliente')
    TabOrder = 2
  end
  object edtPara: TEdit
    Left = 85
    Top = 10
    Width = 420
    Height = 21
    TabOrder = 3
  end
  object edtAnexo: TEdit
    Left = 85
    Top = 127
    Width = 339
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
end
