unit uConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, clsFazenda, dmFazenda;

type
  Tfrm_Consulta = class(TForm)
    pnl_Consulta: TPanel;
    lbl_Pesquisar: TLabel;
    edt_Pesquisar: TEdit;
    btn_Pesquisar: TBitBtn;
    dbg_Consulta: TDBGrid;
    ds_Consulta: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure dbg_ConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fazenda : TFazenda;
    i_Id_Fazenda   : Integer;
    s_Nome_Fazenda : String;
    procedure prc_Consultar;
  end;

var
  frm_Consulta: Tfrm_Consulta;

implementation

{$R *.dfm}

{ Tfrm_Consulta }

procedure Tfrm_Consulta.btn_PesquisarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure Tfrm_Consulta.dbg_ConsultaDblClick(Sender: TObject);
begin
  if not (dbg_Consulta.DataSource.DataSet.IsEmpty) then begin
    i_Id_Fazenda   := dbg_Consulta.DataSource.DataSet.FieldByName('id').AsInteger;
    s_Nome_Fazenda := dbg_Consulta.DataSource.DataSet.FieldByName('Nome').AsString;
    Close;
  end;
end;

procedure Tfrm_Consulta.FormCreate(Sender: TObject);
begin
  Fazenda := TFazenda.Create(dm_Fazenda.FDConnection);
end;

procedure Tfrm_Consulta.FormDestroy(Sender: TObject);
begin
  Fazenda.Destroy;
end;

procedure Tfrm_Consulta.prc_Consultar;
begin
  ds_Consulta.DataSet := Fazenda.fnc_Consultar(edt_Pesquisar.Text);
end;

end.
