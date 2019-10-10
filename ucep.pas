unit Ucep;

interface

uses Generics.Collections, Rest.Json;

type

TUcep = class
private
  FBairro: String;
  FCep: String;
  FComplemento: String;
  FGia: String;
  FIbge: String;
  FLocalidade: String;
  FLogradouro: String;
  FUf: String;
  FUnidade: String;
public
  property bairro: String read FBairro write FBairro;
  property cep: String read FCep write FCep;
  property complemento: String read FComplemento write FComplemento;
  property gia: String read FGia write FGia;
  property ibge: String read FIbge write FIbge;
  property localidade: String read FLocalidade write FLocalidade;
  property logradouro: String read FLogradouro write FLogradouro;
  property uf: String read FUf write FUf;
  property unidade: String read FUnidade write FUnidade;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TUcep;
end;

implementation

{TUcep}


function TUcep.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TUcep.FromJsonString(AJsonString: string): TUcep;
begin
  result := TJson.JsonToObject<TUcep>(AJsonString)
end;

end.
