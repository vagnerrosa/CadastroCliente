program Cadastro;

uses
  Vcl.Forms,
  uCadastro in 'uCadastro.pas' {frmCadastro},
  ucep in 'ucep.pas',
  UEnviaEmail in 'UEnviaEmail.pas' {frmEnviaEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.Run;
end.
