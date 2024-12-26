inherited frm_Fazenda: Tfrm_Fazenda
  ActiveControl = nil
  Caption = 'Cadastro de Fazendas'
  ClientHeight = 274
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitHeight = 313
  PixelsPerInch = 96
  TextHeight = 13
  inherited pc_Padrao: TPageControl
    Height = 274
    ActivePage = ts_Consulta
    ExplicitHeight = 274
    inherited ts_Consulta: TTabSheet
      ExplicitHeight = 246
      inherited dbg_Consulta: TDBGrid
        Height = 199
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'ID'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 200
            Visible = True
          end>
      end
    end
    inherited ts_Dados: TTabSheet
      ExplicitHeight = 246
      object lbl_Id: TLabel [0]
        Left = 22
        Top = 16
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object lbl_Nome: TLabel [1]
        Left = 6
        Top = 43
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      inherited pnl_Botoes: TPanel
        Top = 205
        ExplicitTop = 205
        inherited btn_Salvar: TButton
          OnClick = btn_SalvarClick
        end
      end
      object edt_Id: TEdit
        Left = 39
        Top = 13
        Width = 42
        Height = 21
        Enabled = False
        NumbersOnly = True
        TabOrder = 1
      end
      object edt_Nome: TEdit
        Left = 39
        Top = 40
        Width = 416
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 2
      end
    end
  end
end
