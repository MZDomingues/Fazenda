unit dmFazenda;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Comp.UI, frxClass, frxDBSet;

type
  Tdm_Fazenda = class(TDataModule)
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    fdQuery: TFDQuery;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Fazenda: Tdm_Fazenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
