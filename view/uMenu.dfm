object frm_Menu: Tfrm_Menu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = m_Menu
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object m_Menu: TMainMenu
    Left = 16
    Top = 8
    object Cadastro: TMenuItem
      Caption = 'Cadastro'
      object Fazenda: TMenuItem
        Action = acl_Fazenda
      end
      object Animal: TMenuItem
        Action = acl_Animal
      end
    end
  end
  object acl_Menu: TActionList
    Left = 16
    Top = 56
    object acl_Fazenda: TAction
      Caption = 'Fazenda'
      OnExecute = acl_FazendaExecute
    end
    object acl_Animal: TAction
      Caption = 'Animal'
      OnExecute = acl_AnimalExecute
    end
  end
end
