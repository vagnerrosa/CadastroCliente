unit uCadastro;
{
10/10/2019
Vagner de Souza Rosa
vagnero@gmail.com
(11) 98278-9522
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Types, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Buttons, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

type
  TfrmCadastro = class(TForm)
    FDMemTable1: TFDMemTable;
    lblNome: TLabel;
    edtNome: TEdit;
    lblIdentidade: TLabel;
    edtIdentidade: TEdit;
    lblCPF: TLabel;
    edtCPF: TEdit;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    lblEmail: TLabel;
    edtEmail: TEdit;
    Label5: TLabel;
    lblLogradouro: TLabel;
    edtLogradouro: TEdit;
    lblNumero: TLabel;
    edtNumero: TEdit;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    lblBairro: TLabel;
    edtBairro: TEdit;
    lblCidade: TLabel;
    edtCidade: TEdit;
    lblEstado: TLabel;
    edtEstado: TEdit;
    lblPais: TLabel;
    edtPais: TEdit;
    gbEndereco: TGroupBox;
    btnLocalizarEnd: TSpeedButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable2: TFDMemTable;
    edtcep: TMaskEdit;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    FDMemTable1Nome: TStringField;
    FDMemTable1Identidade: TStringField;
    FDMemTable1CPF: TStringField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDMemTable1Telefone: TStringField;
    FDMemTable1emai: TStringField;
    FDMemTable1Cep: TStringField;
    FDMemTable1Logradouro: TStringField;
    FDMemTable1Numero: TStringField;
    FDMemTable1Complemento: TStringField;
    FDMemTable1Bairro: TStringField;
    FDMemTable1Cidade: TStringField;
    FDMemTable1Estado: TStringField;
    FDMemTable1Pais: TStringField;
    XMLDocument1: TXMLDocument;
    procedure btnLocalizarEndClick(Sender: TObject);
    function Validate(const ACep: string): Boolean;
    procedure LimpaDados;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function isCPF(CPF: string): boolean;
    function imprimeCPF(CPF: string): string;
    procedure edtCPFExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

uses ucep, UEnviaEmail;

procedure TfrmCadastro.btnCancelarClick(Sender: TObject);
begin
  LimpaDados;
end;

procedure TfrmCadastro.btnGravarClick(Sender: TObject);
Var
  Cliente : IXMLNode;
  frmEnviaEmail : TfrmEnviaEmail;
begin
  FDMemTable1.Append;
  FDMemTable1Nome.AsString := edtNome.Text;
  FDMemTable1Identidade.AsString := edtIdentidade.Text;
  FDMemTable1CPF.AsString := edtCPF.Text;
  FDMemTable1Telefone.AsString :=  edtTelefone.Text;
  FDMemTable1emai.AsString := edtEmail.Text;
  FDMemTable1Cep.AsString := edtLogradouro.Text;
  FDMemTable1Logradouro.AsString := edtLogradouro.Text;
  FDMemTable1Numero.AsString := edtNumero.Text;
  FDMemTable1Complemento.Text := edtComplemento.Text;
  FDMemTable1Bairro.Text := edtBairro.Text;
  FDMemTable1Cidade.Text := edtCidade.Text;
  FDMemTable1Estado.Text := edtEstado.Text;
  FDMemTable1Pais.Text := edtPais.Text;
  FDMemTable1.Post;

  XMLDocument1.Active := True;
  XMLDocument1.Version := '1.0';
  XMLDocument1.Encoding := 'UTF-8';
  Cliente := XMLDocument1.AddChild('Cliente');
  Cliente.AddChild('Nome').Text := FDMemTable1Nome.AsString;
  Cliente.AddChild('Identidade').Text := FDMemTable1Identidade.AsString;
  Cliente.AddChild('CPF').Text := FDMemTable1CPF.AsString;
  Cliente.AddChild('Telefone').Text := FDMemTable1Telefone.AsString;
  Cliente.AddChild('Email').Text := FDMemTable1emai.AsString;
  Cliente.AddChild('CEP').Text := FDMemTable1Cep.AsString;
  Cliente.AddChild('Logradouro').Text := FDMemTable1Logradouro.AsString;
  Cliente.AddChild('Numero').Text := FDMemTable1Numero.AsString;
  Cliente.AddChild('Complemento').Text := FDMemTable1Complemento.Text;
  Cliente.AddChild('Bairro').Text := FDMemTable1Bairro.Text;
  Cliente.AddChild('Cidade').Text := FDMemTable1Cidade.Text;
  Cliente.AddChild('Estado').Text := FDMemTable1Estado.Text;
  Cliente.AddChild('Pais').Text := FDMemTable1Pais.Text;

  If not DirectoryExists(ExtractFilePath(Application.ExeName)+'XML') then
     CreateDir(ExtractFilePath(Application.ExeName)+'XML');

  XMLDocument1.SaveToFile(ExtractFilePath(Application.ExeName)+'XML'+'\Cadastro.xml');

  try
    frmEnviaEmail  := TfrmEnviaEmail.Create(self);
    frmEnviaEmail.edtAnexo.Text := ExtractFilePath(Application.ExeName)+'XML'+'\Cadastro.xml';
    frmEnviaEmail.ShowModal;
  finally
    LimpaDados;
    frmEnviaEmail.free;
  end;


end;

procedure TfrmCadastro.btnLocalizarEndClick(Sender: TObject);
var
 cep: TUcep;
begin
  if Validate(edtCep.Text) then
  begin
    Application.MessageBox('CEP Inválido','Aviso ao usuário',MB_OK+MB_ICONERROR);
    edtcep.SetFocus;
    exit;
  end;

  RESTRequest1.Params.ParameterByName('CEP').Value := edtCEP.Text;
  RESTRequest1.Execute;

  cep := TUcep.FromJsonString(RESTResponse1.Content.Trim);

  if cep.logradouro.IsEmpty then
  begin
    Application.MessageBox('CEP não encontrado','Aviso ao usuário',MB_OK+MB_ICONERROR);
    edtcep.SetFocus;
    exit;
  end;


  try
    edtLogradouro.Text := cep.logradouro;
    edtNumero.Text     := '';
    edtComplemento.Text:= cep.complemento;
    edtBairro.Text     := cep.bairro;
    edtCidade.Text     := cep.localidade;
    edtEstado.Text     := cep.uf;
    edtPais.Text       := 'Brasil';
  finally
    cep.Free;
  end;
end;



procedure TfrmCadastro.edtCPFExit(Sender: TObject);
begin
  if isCPF(edtCPF.Text) then
    edtCPF.Text := imprimeCPF(edtCPF.Text)
  else
  begin
    ShowMessage('Erro: CPF inválido !!!');
    edtCPF.SetFocus;
  end;
end;

function TfrmCadastro.Validate(const ACep: string): Boolean;
const
  INVALID_CHARACTER = -1;
begin
  Result := True;
  if ACep.Trim.Length <> 8 then
    Exit(False);
  if StrToIntDef(ACep, INVALID_CHARACTER) = INVALID_CHARACTER then
    Exit(False);
end;

procedure TfrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDMemTable1.close;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  LimpaDados;
  FDMemTable1.Open;
end;

procedure TfrmCadastro.LimpaDados();
begin
  edtNome.Clear;
  edtIdentidade.Clear;
  edtCPF.Clear;
  edtTelefone.Clear;
  edtEmail.Clear;
  edtCep.Clear;
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtComplemento.Clear;
  edtBairro.Clear;
  edtCidade.Clear;
  edtEstado.Clear;
  edtPais.Clear;
  FDMemTable1.Close;
  FDMemTable1.Open;
end;

function TfrmCadastro.isCPF(CPF: string): boolean;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
// length - retorna o tamanho da string (CPF é um número formado por 11 dígitos)
  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11))
     then begin
              isCPF := false;
              exit;
            end;

// try - protege o código para eventuais erros de conversão de tipo na função StrToInt
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
// StrToInt converte o i-ésimo caractere do CPF em um número
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = CPF[10]) and (dig11 = CPF[11]))
       then isCPF := true
    else isCPF := false;
  except
    isCPF := false
  end;
end;

function TfrmCadastro.imprimeCPF(CPF: string): string;
begin
  imprimeCPF := copy(CPF, 1, 3) + '.' + copy(CPF, 4, 3) + '.' +
    copy(CPF, 7, 3) + '-' + copy(CPF, 10, 2);
end;
end.
