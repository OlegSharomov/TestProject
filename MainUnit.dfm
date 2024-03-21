object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1052#1086#1103' '#1092#1086#1088#1084#1072
  ClientHeight = 442
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnResize = FormResize
  TextHeight = 15
  object BigInputMemo: TMemo
    Left = 0
    Top = 0
    Width = 625
    Height = 273
    TabOrder = 0
  end
  object OutputEdit: TEdit
    Left = 8
    Top = 288
    Width = 553
    Height = 23
    TabOrder = 1
  end
  object LineChoiceComboBox: TComboBox
    Left = 16
    Top = 328
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      #1055#1077#1088#1074#1072#1103
      #1042#1090#1086#1088#1072#1103
      #1058#1088#1077#1090#1100#1103)
  end
  object ChoiceButton: TButton
    Left = 240
    Top = 328
    Width = 75
    Height = 25
    Caption = #1074#1099#1073#1088#1072#1090#1100
    TabOrder = 3
    OnClick = ChoiceButtonClick
  end
  object СalculateCountOfLettersButton: TButton
    Left = 240
    Top = 369
    Width = 129
    Height = 25
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1091#1082#1074' '#1041
    TabOrder = 4
    OnClick = СalculateCountOfLettersButtonClick
  end
end
