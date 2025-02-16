unit uProfessor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Comp.Client,
  clsProfessor, clsNota, dmEscola, clsCalculo;

type
  Tfrm_Professor = class(TFrm_Padrao)
    lbl_Id: TLabel;
    edt_Id: TEdit;
    lbl_Nome: TLabel;
    edt_Nome: TEdit;
    lbl_Cpf: TLabel;
    edt_Cpf: TEdit;
    lbl_Sexo: TLabel;
    cb_Sexo: TComboBox;
    lbl_Dt_Nascimento: TLabel;
    dtp_Dt_Nascimento: TDateTimePicker;
    lbl_Email: TLabel;
    edt_Email: TEdit;
    lbl_Disciplina: TLabel;
    edt_Disciplina: TEdit;
    btn_Notas: TBitBtn;
    btn_Media: TBitBtn;
    ds_Media: TDataSource;
    mm_Media: TMemo;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure dbg_ConsultaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_NotasClick(Sender: TObject);
    procedure btn_MediaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Professor : TProfessor;
    Nota : TNota;
    Media, Maior, Menor : TCalculo;
    procedure prc_Salvar;
    procedure prc_Alterar;
    procedure prc_Excluir;
    procedure prc_Pesquisar;
    procedure prc_Novo;
    procedure prc_Lancar_Notas;
    procedure prc_Calcular_Media;
  end;

var
  frm_Professor: Tfrm_Professor;
  fqMedia      : TFDQuery;

implementation

{$R *.dfm}

uses uNota;

{ Tfrm_Professor }

procedure Tfrm_Professor.btn_NotasClick(Sender: TObject);
begin
  inherited;
  prc_Lancar_Notas;
end;

procedure Tfrm_Professor.btn_CancelarClick(Sender: TObject);
begin
  inherited;
  prc_Cancelar;
end;

procedure Tfrm_Professor.btn_ExcluirClick(Sender: TObject);
begin
  prc_Excluir;
  inherited;
end;

procedure Tfrm_Professor.btn_MediaClick(Sender: TObject);
begin
  inherited;
  prc_Calcular_Media;
end;

procedure Tfrm_Professor.btn_NovoClick(Sender: TObject);
begin
  inherited;
  prc_Novo;
  btn_Notas.Enabled := False;
  btn_Media.Enabled := False;
end;

procedure Tfrm_Professor.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  prc_Pesquisar;
end;

procedure Tfrm_Professor.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  prc_Salvar;
end;

procedure Tfrm_Professor.dbg_ConsultaDblClick(Sender: TObject);
begin
  inherited;
  prc_Alterar;
end;

procedure Tfrm_Professor.FormCreate(Sender: TObject);
begin
  inherited;
  Professor := TProfessor.Create(dm_Escola.FDConnection);
  Nota      := TNota.Create(dm_Escola.FDConnection);
  fqMedia   := TFDQuery.Create(Application);
  Media     := TCalculoMedia.Create();
  Maior     := TCalculoMaior.Create();
  Menor     := TCalculoMenor.Create();
end;

procedure Tfrm_Professor.FormDestroy(Sender: TObject);
begin
  inherited;
  Professor.Destroy;
  Nota.Destroy;
  Media.Destroy;
  Maior.Destroy;
  Menor.Destroy;
end;

procedure Tfrm_Professor.FormShow(Sender: TObject);
begin
  inherited;
  prc_Pesquisar;
end;

procedure Tfrm_Professor.prc_Alterar;
begin
  if not (dbg_Consulta.DataSource.DataSet.IsEmpty) then begin
    Professor.Id_Professor := dbg_Consulta.DataSource.DataSet.FieldByName('Id').AsInteger;

    edt_Id.Text            := IntToStr(Professor.Id_Professor);
    edt_Nome.Text          := dbg_Consulta.DataSource.DataSet.FieldByName('Nome').AsString;
    edt_Cpf.Text           := dbg_Consulta.DataSource.DataSet.FieldByName('Cpf').AsString;
    cb_Sexo.ItemIndex      := cb_Sexo.Items.IndexOf(dbg_Consulta.DataSource.DataSet.FieldByName('Sexo').AsString);
    dtp_Dt_Nascimento.Date := dbg_Consulta.DataSource.DataSet.FieldByName('Data_Nascimento').AsDateTime;
    edt_Email.Text         := dbg_Consulta.DataSource.DataSet.FieldByName('Email').AsString;
    edt_Disciplina.Text    := dbg_Consulta.DataSource.DataSet.FieldByName('Disciplina').AsString;
    btn_Notas.Enabled      := True;
    btn_Media.Enabled      := True;
  end;
end;

procedure Tfrm_Professor.prc_Calcular_Media;
begin
  inherited;
  try
    fqMedia := Nota.fnc_Alunos(StrToInt(edt_Id.Text));
    fqMedia.Open;
    fqMedia.First;

    mm_Media.Clear;
    while not fqMedia.Eof do begin

      (Media as TCalculoMedia).Valor1 := fqMedia.FieldByName('nota_1').AsFloat;
      (Media as TCalculoMedia).Valor2 := fqMedia.FieldByName('nota_2').AsFloat;
      (Media as TCalculoMedia).Valor3 := fqMedia.FieldByName('nota_3').AsFloat;
      (Media as TCalculoMedia).Valor4 := fqMedia.FieldByName('nota_4').AsFloat;

      (Maior as TCalculoMaior).Valor1 := fqMedia.FieldByName('nota_1').AsFloat;
      (Maior as TCalculoMaior).Valor2 := fqMedia.FieldByName('nota_2').AsFloat;
      (Maior as TCalculoMaior).Valor3 := fqMedia.FieldByName('nota_3').AsFloat;
      (Maior as TCalculoMaior).Valor4 := fqMedia.FieldByName('nota_4').AsFloat;

      (Menor as TCalculoMenor).Valor1 := fqMedia.FieldByName('nota_1').AsFloat;
      (Menor as TCalculoMenor).Valor2 := fqMedia.FieldByName('nota_2').AsFloat;
      (Menor as TCalculoMenor).Valor3 := fqMedia.FieldByName('nota_3').AsFloat;
      (Menor as TCalculoMenor).Valor4 := fqMedia.FieldByName('nota_4').AsFloat;

      mm_Media.Lines.Add('Ano: ' + fqMedia.FieldByName('ano').AsString + ' - ' +
                         'Aluno: ' + fqMedia.FieldByName('aluno').AsString + ' - ' +
                         'M�dia: ' + FloatToStr((Media as TCalculoMedia).Calcular) + ' - ' +
                         'Maior Nota: ' + FloatToStr((Maior as TCalculoMaior).Calcular) + ' - ' +
                         'Menor Nota: ' + FloatToStr((Menor as TCalculoMenor).Calcular)
                        );
       fqMedia.Next;
     end;
  finally
    fqMedia.Close;
  end;
end;

procedure Tfrm_Professor.prc_Excluir;
begin
  if Application.MessageBox('Deseja excluir o registro?', 'Confirma��o', mb_YesNo + mb_IconInformation + mb_DefButton2) = mrYes then begin
    Professor.prc_Deletar(Professor.Id_Professor);
    Application.MessageBox('Professor exclu�do com sucesso!', 'Informa��o', MB_OK + MB_ICONINFORMATION);
    prc_Pesquisar;
    prc_Cancelar;
  end;
end;

procedure Tfrm_Professor.prc_Lancar_Notas;
begin
  frm_Nota := Tfrm_Nota.Create(Application);
  try
    frm_Nota.i_Id_Professor   := StrToInt(edt_Id.Text);
    frm_Nota.s_Nome_Professor := edt_Nome.Text;
    frm_Nota.ShowModal;
  finally
    frm_Nota.Free;
  end;
end;

procedure Tfrm_Professor.prc_Novo;
begin
  edt_Id.Clear;
  edt_Nome.Clear;
  edt_Cpf.Clear;
  cb_Sexo.ItemIndex      := 0;
  dtp_Dt_Nascimento.Date := Date;
  edt_Email.Clear;
  edt_Disciplina.Clear;
  mm_Media.Clear;
  edt_Nome.SetFocus;
end;

procedure Tfrm_Professor.prc_Pesquisar;
begin
  ds_Consulta.DataSet := Professor.fnc_Consultar(edt_Pesquisar.Text);
end;

procedure Tfrm_Professor.prc_Salvar;
var
  i_Operacao : Integer;
  s_Erro     : String;
begin
  inherited;
  try
    with Professor do begin
      Nome            := edt_Nome.Text;
      CPF             := edt_Cpf.Text;
      Sexo            := cb_Sexo.Text;
      Data_Nascimento := dtp_Dt_Nascimento.Date;
      E_mail          := edt_Email.Text;
      Disciplina      := edt_Disciplina.Text;
    end;

    case FOperacao of
      opNovo    : i_Operacao := 0;
      opAlterar : i_Operacao := 1;
    end;

    if Professor.fnc_Salvar(i_Operacao, s_Erro) then begin
       Application.MessageBox('Professor salvo com sucesso!', 'Informa��o', MB_OK + MB_ICONINFORMATION);
       prc_Cancelar;
       prc_Pesquisar;
    end else begin
       Application.MessageBox(pChar('Erro ao gravar: ' + s_Erro), 'Informa��o', MB_OK + MB_ICONERROR);
    end;
  finally
  end;
end;

end.
