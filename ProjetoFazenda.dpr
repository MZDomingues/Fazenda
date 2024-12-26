program ProjetoFazenda;

uses
  Vcl.Forms,
  dmFazenda in 'dao\dmFazenda.pas' {dm_Fazenda: TDataModule},
  uPadrao in 'view\uPadrao.pas' {Frm_Padrao},
  uMenu in 'view\uMenu.pas' {frm_Menu},
  uFazenda in 'view\uFazenda.pas' {frm_Fazenda},
  clsFazenda in 'model\clsFazenda.pas',
  uConsulta in 'view\uConsulta.pas' {frm_Consulta},
  clsAnimal in 'model\clsAnimal.pas',
  uAnimal in 'view\uAnimal.pas' {frm_Animal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Menu, frm_Menu);
  Application.CreateForm(Tdm_Fazenda, dm_Fazenda);
  Application.Run;
end.
