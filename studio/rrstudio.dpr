program rrstudio;



{$R 'studio.res' 'studio.rc'}

uses
  Forms,
  rrs in 'rrs.pas' {Form1},
  ZLib in '..\Zlib.pas',
  WinBinFile in '..\WinBinFile.pas',
  WinIOCTL in '..\WinIOCTL.pas',
  studio_tools in 'studio_tools.pas',
  debug in 'debug.pas',
  Native in '..\Native.pas',
  DiskIO in '..\DiskIO.pas',
  QTThunkU in '..\QTThunkU.pas',
  md5 in 'md5\md5.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
