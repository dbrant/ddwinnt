object Form1: TForm1
  Left = 369
  Top = 191
  Width = 783
  Height = 609
  Caption = 'RawWrite Studio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 56
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'centos.txt'
  end
  object Button1: TButton
    Left = 200
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 144
    Width = 697
    Height = 361
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button2: TButton
    Left = 200
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Compress'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 360
    Top = 48
    Width = 145
    Height = 25
    Caption = 'Load DISK resource'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 360
    Top = 80
    Width = 145
    Height = 25
    Caption = 'Button4'
    TabOrder = 5
    OnClick = Button4Click
  end
  object DiskIDEdit: TEdit
    Left = 320
    Top = 48
    Width = 33
    Height = 21
    TabOrder = 6
    Text = '1'
  end
  object Button5: TButton
    Left = 56
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Create'
    TabOrder = 7
    OnClick = Button5Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 544
    Width = 775
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 600
    Top = 16
    object File1: TMenuItem
      Caption = '&File'
      object Exit1: TMenuItem
        Caption = 'E&xit'
      end
    end
  end
end
