unit clsAnimal;

interface

Uses
  System.SysUtils, FireDAC.Comp.Client;

Type
  TAnimal = Class
  private
    FConexao         : TFDConnection;
    FId_Animal       : Integer;
    FId_Fazenda      : Integer;
    FTag             : Double;
    procedure SetId_Fazenda(const Value: Integer);
    procedure SetTag(const Value: Double);
  public
    property Conexao         : TFDConnection read FConexao         write FConexao;
    property Id_Animal       : Integer       read FId_Animal       write FId_Animal;
    property Id_Fazenda      : Integer       read FId_Fazenda      write SetId_Fazenda;
    property Tag             : Double        read FTag             write SetTag;

    constructor Create(Conexao : TFDConnection);
    destructor Destroy; Override;

    function Gerar_ID() : Integer;
    function fnc_Salvar(i_Operacao : Integer; out s_Erro : String) : boolean;
    function fnc_Consultar(s_Texto : String) : TFDQuery;
    function fnc_Imprimir() : TFDQuery;
    procedure prc_Deletar(i_id : Integer);
  End;

var
  fqConsultar : TFDQuery;

implementation

{ TAnimal }

uses dmFazenda;

constructor TAnimal.Create(Conexao: TFDConnection);
begin
  FConexao               := Conexao;
  fqConsultar            := TFDQuery.Create(nil);
  fqConsultar.Connection := FConexao;
end;

destructor TAnimal.Destroy;
begin
  fqConsultar.Destroy;
  inherited;
end;

function TAnimal.fnc_Consultar(s_Texto: String): TFDQuery;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    fqConsultar.Close;
    fqConsultar.sql.Clear;
    fqConsultar.sql.Add('select a.id,               ' +
                        '       a.id_fazenda,       ' +
                        '       f.nome as fazenda,  ' +
                        '       a.tag               ' +
                        ' from animal a             ' +
                        ' inner join fazenda f      ' +
                        '    on f.id = a.id_fazenda ' +
                        'where f.nome like :p_texto '
                        );
    fqConsultar.ParamByName('p_Texto').AsString := '%' + s_Texto + '%';
    fqConsultar.Open;
  finally
    Result := fqConsultar;
  end;
end;

function TAnimal.fnc_Imprimir: TFDQuery;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    fqConsultar.Close;
    fqConsultar.sql.Clear;
    fqConsultar.sql.Add('select a.id,               ' +
                        '       a.id_fazenda,       ' +
                        '       f.nome as fazenda,  ' +
                        '       a.tag               ' +
                        ' from animal a             ' +
                        ' inner join fazenda f      ' +
                        '    on f.id = a.id_fazenda ' +
                        'order by id                '
                        );
    fqConsultar.Open;
  finally
    Result := fqConsultar;
  end;
end;

function TAnimal.fnc_Salvar(i_Operacao: Integer; out s_Erro: String): boolean;
var
  fqSalvar: TFDQuery;
begin
  try
    try
      FConexao.Connected := False;
      FConexao.Connected := True;

      fqSalvar            := TFDQuery.Create(nil);
      fqSalvar.Connection := FConexao;
      fqSalvar.Close;
      fqSalvar.sql.Clear;

      if i_Operacao = 0 then begin
        fqSalvar.sql.Add('insert into animal (  ' +
                         '       id,            ' +
                         '       id_fazenda,    ' +
                         '       tag            ' +
                         ') values (            ' +
                         '       :p_id,         ' +
                         '       :p_id_fazenda, ' +
                         '       :p_tag         ' +
                         ')                     '
                        );
        fqSalvar.ParamByName('p_id').AsInteger := Gerar_ID;
      end else begin
        fqSalvar.sql.Add('update animal set                  ' +
                         '       id_fazenda = :p_id_fazenda, ' +
                         '       tag        = :p_tag         ' +
                         '       where id   = :p_id          '
                        );
        fqSalvar.ParamByName('p_id').AsInteger := FId_Animal;
      end;
      fqSalvar.ParamByName('p_id_fazenda').AsInteger := FId_Fazenda;
      fqSalvar.ParamByName('p_tag').AsFloat          := FTag;
      fqSalvar.ExecSQL;

      Result := True;
    except
      on E: Exception do
         begin
           s_Erro := E.Message;
           Result := False;
         end;
    end;
  finally
    FreeAndNil(fqSalvar);
  end;
end;

function TAnimal.Gerar_ID: Integer;
var
  fq: TFDQuery;
begin
  FConexao.Connected := False;
  FConexao.Connected := True;

  try
    fq          := TFDQuery.Create(nil);
    fq.Connection := FConexao;
    fq.Close;
    fq.sql.Clear;
    fq.sql.Add('select coalesce(max(id), 0) + 1 as id ' +
               'from animal                           '
              );
    fq.Open;

    Result := fq.FieldByName('id').AsInteger;
  finally
    FreeAndNil(fq);
  end;
end;

procedure TAnimal.prc_Deletar(i_id : Integer);
var
  fqDeletar: TFDQuery;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    fqDeletar            := TFDQuery.Create(nil);
    fqDeletar.Connection := FConexao;
    fqDeletar.Close;
    fqDeletar.sql.Clear;

    fqDeletar.sql.Add('delete from animal ' +
                      ' where id = :p_id  '
                     );
    fqDeletar.ParamByName('p_id').AsInteger := i_id;
    fqDeletar.ExecSQL;
  finally
    FreeAndNil(fqDeletar);
  end;
end;

procedure TAnimal.SetTag(const Value: Double);
begin
  if Value <= 0 then
    raise EArgumentException.Create('Informe uma tag v�lida.');

  FTag := Value;
end;

procedure TAnimal.SetId_Fazenda(const Value: Integer);
begin
  if Value <= 0 then
    raise EArgumentException.Create('Informe uma Fazenda.');

  FID_Fazenda := Value;
end;

end.
