object Frm_Padrao: TFrm_Padrao
  Left = 0
  Top = 0
  ActiveControl = pc_Padrao
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'frm_Padrao'
  ClientHeight = 296
  ClientWidth = 469
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pc_Padrao: TPageControl
    Left = 0
    Top = 0
    Width = 469
    Height = 296
    ActivePage = ts_Consulta
    Align = alClient
    TabOrder = 0
    object ts_Consulta: TTabSheet
      Caption = 'Consulta'
      object pnl_Consulta: TPanel
        Left = 0
        Top = 0
        Width = 461
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 13
          Width = 46
          Height = 13
          Caption = 'Pesquisar'
        end
        object edt_Pesquisar: TEdit
          Left = 60
          Top = 10
          Width = 215
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object btn_Novo: TButton
          Left = 308
          Top = 1
          Width = 75
          Height = 41
          Align = alCustom
          Caption = '&Novo'
          TabOrder = 2
          OnClick = btn_NovoClick
        end
        object btn_Pesquisar: TBitBtn
          Left = 281
          Top = 9
          Width = 24
          Height = 24
          Hint = 'Pesquisar'
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF3F3F3FFFFFFF2F2F2FFFFFFF1F1F1FFFFFFFFFFFFF2F2F2FFFFFFF3F3F3
            FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF6F6F6F6F6F6FFFFFFF7F7
            F7FFFFFFF5F5F5FFFFFFFFFFFFF3F3F3FFFFFFFAFAFAFFFFFFF5F5F5F6F6F6FF
            FFFFF5F5F5FFFFFFF5F5F5FFFFFFF5F5F5FFFFFFF5F5F5FFFFFFF3F3F3FFFFFF
            FFFFFFF2F2F2FFFFFFF4F4F4FEFEFEFFFFFFF2F2F2FFFFFFF4F4F4FFFFFFF3F3
            F3FFFFFFFFFFFFF4F4F4FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF2
            F2F2FFFFFFF4F4F4F3F3F3FFFFFFF6F6F6FFFFFFF4F4F4FFFFFFFFFFFFF2F2F2
            FFFFFFEFEFEFFFFFFFF2F2F2F5F5F5FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF2F2
            F2FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFFFFFFFEFEFEFFFFFFFF3F3F3FFFFFFFF
            FFFFF2F2F2FFFFFFF6F6F6FFFFFFF1F1F1F8F8F8F9F9F9F6F6F6FFFFFFF2F2F2
            FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFFBFBFBF5F5F5FFFFFFF7F7
            F7FFFFFFF2F2F2FFFFFFF3F3F3FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFFFFFFFF0
            F0F0FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF7F7F7
            FFFFFFFEFEFEF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFF2F2F2FFFFFFF5F5F5FFFF
            FFF0F0F0F5F5F5FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF3F3F3FF
            FFFFE9E9E95E5C5C373535868484FFFFFFF5F5F5FFFFFFFFFFFFF3F3F3FFFFFF
            F5F5F5FFFFFFF2F2F2FFFFFFFFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF3F3F3FFFF
            FFF3F3F3FFFFFF252323403E3E5A5858161414FFFFFFF3F3F3FFFFFFF2F2F2FF
            FFFFFFFFFFF4F4F4FFFFFFF3F3F3FFFFFFF0EEEDA8A6A59C9A99807E7DFFFFFE
            F3F3F3FFFFFFF3F3F3FCFAFA484646353333888685FFFFFFFFFFFFF2F2F2FFFF
            FFF3F3F3FFFFFFFFFFFFF3F3F3FFFFFFF5F5F5FFFFFF939393FFFCF8FFFCF7FF
            FCF7FFFCF7FFFCF7B1AFAFF1F1F16D6B6A3B39396C6A6AFFFFFFFFFFFFF1F1F1
            EFEFEFFFFFFFF3F3F3FFFFFFF2F2F2FFFFFFFFFFFFF4F4F4FFFFFFFFFFFEFAF4
            E7FEF8EBFEF8EBFEF8EBFEF8EBFEF8EBFEF8EBADABABFFFFFF424242F3F3F3FF
            FFFFF3F3F3FFFFFFFFFFFFF2F2F2FFFFFFF3F3F3FFFFFFFFFFFFF3F3F3FFFFFF
            F5F5F5FFFFF7FEF5E1FEF5E1FFF5E1FFF5E1FEF5E1FEF5E1FFF5E1FEF5E1FFFE
            FFF3F3F3FFFFFFF3F3F3FFFFFFF1F1F1EFEFEFFFFFFFF3F3F3FFFFFFF2F2F2FF
            FFFFFFFFFFF4F4F4FFFEFFFFF1D4FFF2D2FFF6DEFFF5DDFFF5DDFFF5DDFFF5DD
            FFF1D4FFF1D4ACA7A8FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFFFFFFFF2F2F2FFFF
            FFF3F3F3FFFFFFFFFFFFF3F3F3FFFFFFF5F6F4FDECC5F7E8C7FFF8E4FFF8E4FF
            F8E4FFF8E4FFF8E4FFF8E4FFEDC8BCC1CAF3F3F3FFFFFFF3F3F3FFFFFFF1F1F1
            EFEFEFFFFFFFF3F3F3FFFFFFF2F2F2FFFFFFFFFFFFF4F4F4FFFFFFFEE9B6FFFF
            EDFFFAEBFFFAEBFFFAEBFFFAEBFFFAEBFFFAEBFDEABDE7E8ECFFFFFFF3F3F3FF
            FFFFF3F3F3FFFFFFFFFFFFF2F2F2FFFFFFF3F3F3FFFFFFFFFFFFF3F3F3FFFFFF
            F3F3F3B9BCC4FFE9B1FDFBF1FFFAF1FFFAF1FFFAF1FFFAF1FDFBF0FEE5ADFFFF
            FEF3F3F3FFFFFFF3F3F3FFFFFFF3F3F3EFEFEFFFFFFFF6F6F6FFFFFFF4F4F4FF
            FFFFFFFFFFF2F2F2FFFFFFF8F4F37F7E82EBDAA2FFFEFAFFFEFAFFFEFAFFFEFA
            FCE3ABFFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF7F7F7FBFBFBFFFFFFF1F1F1FFFF
            FFF3F3F3FFFFFFFFFFFFFFFFFFF3F3F3FFFFFFF2F2F2FDFFFFBFC0BEA6ABAEE8
            C58DB39461ABABABF3F3F3FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF4F4F4FDFDFD
            FFFFFFF1F1F1FFFFFFF5F5F5FFFFFFFFFFFFF2F2F2FFFFFFF0F0F0FFFFFFF1F1
            F1FFFFFFFFFFFFEEEEEEFFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF2
            F2F2FFFFFFF3F3F3F3F3F3FFFFFFF3F3F3FFFFFFF1F1F1FFFFFFFFFFFFF5F5F5
            FFFFFFF4F4F4FFFFFFF4F4F4F5F5F5FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF3F3
            F3FFFFFFF3F3F3FFFFFFF1F1F1FFFFFFFFFFFFF3F3F3FFFFFFF4F4F4FFFFFFFF
            FFFFF5F5F5FFFFFFF2F2F2FFFFFFF5F5F5FFFFFFFFFFFFF4F4F4FFFFFFF5F5F5
            FFFFFFF5F5F5FFFFFFF5F5F5FFFFFFF5F5F5FFFFFFF3F3F3F1F1F1FFFFFFF3F3
            F3FFFFFFF1F1F1FFFFFFFFFFFFF3F3F3FFFFFFF2F2F2FFFFFFEDEDEDF3F3F3FF
            FFFFF2F2F2FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF2F2F2FFFFFFF3F3F3FFFFFF
            FFFFFFF1F1F1FFFFFFF3F3F3FFFFFFFFFFFFF3F3F3FFFFFFF5F5F5FFFFFFF2F2
            F2FFFFFFFFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF3F3F3FFFFFFF3
            F3F3FFFFFFF1F1F1EFEFEFFFFFFFF3F3F3FFFFFFF2F2F2FFFFFF}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btn_PesquisarClick
        end
        object btn_Imprimir: TButton
          Left = 383
          Top = 1
          Width = 75
          Height = 41
          Align = alCustom
          Caption = '&Imprimir'
          TabOrder = 3
          OnClick = btn_ImprimirClick
        end
      end
      object dbg_Consulta: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 455
        Height = 221
        Hint = 'Duplo clique para Editar'
        Align = alClient
        DataSource = ds_Consulta
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbg_ConsultaDblClick
      end
    end
    object ts_Dados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object pnl_Botoes: TPanel
        Left = 0
        Top = 227
        Width = 461
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object btn_Salvar: TButton
          Left = 0
          Top = 0
          Width = 75
          Height = 41
          Align = alLeft
          Caption = '&Salvar'
          TabOrder = 0
        end
        object btn_Cancelar: TButton
          Left = 75
          Top = 0
          Width = 75
          Height = 41
          Align = alLeft
          Caption = 'Cancela&r'
          TabOrder = 1
          OnClick = btn_CancelarClick
        end
        object btn_Excluir: TButton
          Left = 150
          Top = 0
          Width = 75
          Height = 41
          Align = alLeft
          Caption = '&Excluir'
          TabOrder = 2
          OnClick = btn_ExcluirClick
        end
      end
    end
  end
  object ds_Consulta: TDataSource
    Left = 428
    Top = 9
  end
end
