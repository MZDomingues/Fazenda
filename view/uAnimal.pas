unit uAnimal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, clsAnimal, dmFazenda,
  Datasnap.DBClient, StrUtils;

type
  Tfrm_Animal = class(TFrm_Padrao)
    lbl_Fazenda: TLabel;
    edt_Nome_Fazenda: TEdit;
    edt_Id_Fazenda: TEdit;
    btn_Fazenda: TBitBtn;
    lbl_Tag: TLabel;
    edt_Tag: TEdit;
    gb_Animais: TGroupBox;
    btn_Adicionar: TBitBtn;
    dbg_Animais: TDBGrid;
    cds_Animais: TClientDataSet;
    ds_Animais: TDataSource;
    cds_AnimaisFazenda: TStringField;
    cds_AnimaisTag: TStringField;
    cds_AnimaisId_Fazenda: TIntegerField;
    cds_AnimaisId: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbg_ConsultaDblClick(Sender: TObject);
    procedure btn_FazendaClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_AdicionarClick(Sender: TObject);
    procedure dbg_AnimaisDblClick(Sender: TObject);
    procedure btn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure prc_CriarDataSet;
    procedure prc_AddDataSet;
  public
    Animal         : TAnimal;
    i_Id_Fazenda   : Integer;
    s_Nome_Fazenda : String;
    procedure prc_Salvar;
    procedure prc_Alterar;
    procedure prc_Excluir;
    procedure prc_Pesquisar;
    procedure prc_Novo;
    { Public declarations }
  end;

var
  frm_Animal: Tfrm_Animal;

implementation

{$R *.dfm}

uses uConsulta;

procedure Tfrm_Animal.btn_FazendaClick(Sender: TObject);
begin
  inherited;
  frm_Consulta := Tfrm_Consulta.Create(Application);
  try
    frm_Consulta.ShowModal;
    edt_Id_Fazenda.Text   := IntToStr(frm_Consulta.i_Id_Fazenda);
    edt_Nome_Fazenda.Text := frm_Consulta.s_Nome_Fazenda;
    edt_Tag.SetFocus;
  finally
    frm_Consulta.Free;
  end;
end;

procedure Tfrm_Animal.btn_ImprimirClick(Sender: TObject);
begin
  inherited;
  dm_Fazenda.frxDBDataset.DataSet := Animal.fnc_Imprimir;
  dm_Fazenda.frxReport.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\relatorios\relAnimal.fr3');
  dm_Fazenda.frxReport.ShowReport(True);
end;

procedure Tfrm_Animal.btn_AdicionarClick(Sender: TObject);
begin
  inherited;
  prc_AddDataSet;
  edt_Tag.Clear;
  edt_Tag.SetFocus;
end;

procedure Tfrm_Animal.btn_CancelarClick(Sender: TObject);
begin
  inherited;
  prc_Cancelar;
end;

procedure Tfrm_Animal.btn_ExcluirClick(Sender: TObject);
begin
  prc_Excluir;
  inherited;
end;

procedure Tfrm_Animal.btn_NovoClick(Sender: TObject);
begin
  inherited;
  prc_Novo;
end;

procedure Tfrm_Animal.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  prc_Pesquisar;
end;

procedure Tfrm_Animal.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  prc_Salvar;
end;

procedure Tfrm_Animal.dbg_AnimaisDblClick(Sender: TObject);
begin
  inherited;
  edt_Id_Fazenda.Text   := IntToStr(cds_AnimaisId_Fazenda.Value);
  edt_Nome_Fazenda.Text := cds_AnimaisFazenda.Value;
  edt_Tag.Text          := cds_AnimaisTag.Value;

  cds_Animais.Edit;
  edt_Tag.SetFocus;
end;

procedure Tfrm_Animal.dbg_ConsultaDblClick(Sender: TObject);
begin
  inherited;
  prc_Alterar;
end;

procedure Tfrm_Animal.FormCreate(Sender: TObject);
begin
  inherited;
  Animal := TAnimal.Create(dm_Fazenda.FDConnection);
end;

procedure Tfrm_Animal.FormDestroy(Sender: TObject);
begin
  inherited;
  Animal.Destroy;
end;

procedure Tfrm_Animal.FormShow(Sender: TObject);
begin
  inherited;
  prc_Pesquisar;
end;

procedure Tfrm_Animal.prc_AddDataSet;
begin
  if not (cds_Animais.State = dsEdit) then
    cds_Animais.Append;
  cds_Animais.FieldByName('Id').AsInteger         := Animal.Id_Animal;
  cds_Animais.FieldByName('Id_Fazenda').AsInteger := StrToInt(edt_Id_Fazenda.Text);
  cds_Animais.FieldByName('Fazenda').AsString     := edt_Nome_Fazenda.Text;
  cds_Animais.FieldByName('Tag').AsString         := edt_Tag.Text;
  cds_Animais.Post;
end;

procedure Tfrm_Animal.prc_Alterar;
begin
  if not (dbg_Consulta.DataSource.DataSet.IsEmpty) then
  begin
    Animal.Id_Animal      := dbg_Consulta.DataSource.DataSet.FieldByName('Id').AsInteger;
    edt_Id_Fazenda.Text   := IntToStr(dbg_Consulta.DataSource.DataSet.FieldByName('Id_Fazenda').AsInteger);
    edt_Nome_Fazenda.Text := dbg_Consulta.DataSource.DataSet.FieldByName('Fazenda').AsString;
    edt_Tag.Text          := FloatToStr(dbg_Consulta.DataSource.DataSet.FieldByName('Tag').AsFloat);

    prc_CriarDataSet;
    prc_AddDataSet;

    cds_Animais.Edit;
  end;
end;

procedure Tfrm_Animal.prc_CriarDataSet;
begin
  cds_Animais.Close;
  cds_Animais.CreateDataSet;
  cds_Animais.Open;
end;

procedure Tfrm_Animal.prc_Excluir;
begin
  if Application.MessageBox('Deseja excluir o registro?', 'Confirma��o', mb_YesNo + mb_IconInformation + mb_DefButton2) = mrYes then begin
    Animal.prc_Deletar(Animal.Id_Animal);
    Application.MessageBox('Animal exclu�do com sucesso!', 'Informa��o', MB_OK + MB_ICONINFORMATION);
    prc_Pesquisar;
    prc_Cancelar;
  end;
end;

procedure Tfrm_Animal.prc_Novo;
begin
  edt_Id_Fazenda.Text   := IntToStr(i_Id_Fazenda);
  edt_Nome_Fazenda.Text := s_Nome_Fazenda;
  edt_Tag.Clear;
  btn_Fazenda.SetFocus;
  prc_CriarDataSet;
end;

procedure Tfrm_Animal.prc_Pesquisar;
begin
  ds_Consulta.DataSet := Animal.fnc_Consultar(edt_Pesquisar.Text);
end;

procedure Tfrm_Animal.prc_Salvar;
var
  i_Operacao : Integer;
  s_Erro     : String;
begin
  inherited;
  try
    cds_Animais.DisableControls;
    cds_Animais.First;
    while not cds_Animais.Eof do
    begin
      if cds_AnimaisId_Fazenda.Value = 0 then
        s_Erro := 'Um ou mais Animais n�o possuem Fazenda informada.'
      else if StrToFloatDef(cds_AnimaisTag.Value, 0) = 0 then
        s_Erro := 'Um ou mais Animais n�o possuem Tag informada.';

      if not s_Erro.IsEmpty then
        Abort;

      cds_Animais.Next;
    end;

    cds_Animais.First;
    while not cds_Animais.Eof do
    begin
      with Animal do
      begin
        Id_Animal    := cds_AnimaisId.Value;
        Id_Fazenda   := cds_AnimaisId_Fazenda.Value;
        Tag          := StrToFloatDef(cds_AnimaisTag.Value, 0);
      end;

      case FOperacao of
        opNovo    : i_Operacao := 0;
        opAlterar : i_Operacao := 1;
      end;

      if Animal.fnc_Salvar(i_Operacao, s_Erro) then
        cds_Animais.Next
      else
        Abort;
    end;
  finally
    cds_Animais.EnableControls;

    if s_Erro.IsEmpty then
    begin
      Application.MessageBox('Animal salvo com sucesso!', 'Informa��o', MB_OK + MB_ICONINFORMATION);
      prc_Cancelar;
      prc_Pesquisar;
    end else
    begin
      Application.MessageBox(pChar('Erro ao gravar: ' + s_Erro), 'Informa��o', MB_OK + MB_ICONERROR);
    end;
  end;
end;

end.
