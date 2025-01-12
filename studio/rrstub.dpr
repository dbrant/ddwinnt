program rrstub;

{$R 'stub.res' 'stub.rc'}

uses
  Forms,
  stub in 'stub.pas' {StubForm},
  ZLib in '..\Zlib.pas',
  studio_tools in 'studio_tools.pas',
  Native in '..\Native.pas',
  WinBinFile in '..\WinBinFile.pas',
  winver in '..\winver.pas',
  DiskIO in '..\DiskIO.pas',
  QTThunkU in '..\QTThunkU.pas',
  md5 in 'md5\md5.pas',
  OpenDir in '..\OpenDir.pas',
  WinIOCTL in '..\WinIOCTL.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'RawWrite for Windows';
  Application.CreateForm(TStubForm, StubForm);
  Application.Run;
end.
