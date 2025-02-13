inherited frm_Professor: Tfrm_Professor
  Caption = 'Cadastro de Professores'
  ClientHeight = 383
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited pc_Padrao: TPageControl
    Height = 383
    ActivePage = ts_Dados
    ExplicitHeight = 383
    inherited ts_Consulta: TTabSheet
      ExplicitHeight = 355
      inherited dbg_Consulta: TDBGrid
        Height = 308
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Professor'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Disciplina'
            Title.Caption = 'Disciplina '
            Width = 100
            Visible = True
          end>
      end
    end
    inherited ts_Dados: TTabSheet
      ExplicitHeight = 355
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
      object lbl_Cpf: TLabel [2]
        Left = 14
        Top = 73
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object lbl_Sexo: TLabel [3]
        Left = 154
        Top = 73
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object lbl_Dt_Nascimento: TLabel [4]
        Left = 271
        Top = 73
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
      end
      object lbl_Email: TLabel [5]
        Left = 5
        Top = 97
        Width = 28
        Height = 13
        Caption = 'E-Mail'
      end
      object lbl_Disciplina: TLabel [6]
        Left = 309
        Top = 97
        Width = 43
        Height = 13
        Caption = 'Disciplina'
      end
      inherited pnl_Botoes: TPanel
        Top = 314
        ExplicitTop = 314
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
      object edt_Cpf: TEdit
        Left = 39
        Top = 67
        Width = 90
        Height = 21
        MaxLength = 11
        NumbersOnly = True
        TabOrder = 3
      end
      object cb_Sexo: TComboBox
        Left = 184
        Top = 67
        Width = 73
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = 'Masculino'
        Items.Strings = (
          'Masculino'
          'Feminino')
      end
      object dtp_Dt_Nascimento: TDateTimePicker
        Left = 358
        Top = 67
        Width = 97
        Height = 21
        Date = 45024.000000000000000000
        Time = 0.011052071757148950
        TabOrder = 5
      end
      object edt_Email: TEdit
        Left = 39
        Top = 94
        Width = 218
        Height = 21
        CharCase = ecLowerCase
        MaxLength = 50
        TabOrder = 6
      end
      object edt_Disciplina: TEdit
        Left = 358
        Top = 94
        Width = 97
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 7
      end
      object btn_Notas: TBitBtn
        Left = 3
        Top = 121
        Width = 126
        Height = 41
        Caption = 'Lan'#231'ar Notas'
        TabOrder = 8
        OnClick = btn_NotasClick
      end
      object btn_Media: TBitBtn
        Left = 329
        Top = 121
        Width = 126
        Height = 41
        Caption = 'Calcular M'#233'dia'
        TabOrder = 9
        OnClick = btn_MediaClick
      end
      object mm_Media: TMemo
        Left = 0
        Top = 168
        Width = 461
        Height = 146
        Align = alBottom
        TabOrder = 10
      end
    end
  end
  object ds_Media: TDataSource
    Left = 428
    Top = 57
  end
end
