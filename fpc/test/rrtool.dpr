program rrtool;

{$IFDEF WIN32}
{$APPTYPE CONSOLE}
{$R 'studio.res' 'studio.rc'}
{$ENDIF}

{$IFDEF FPC}
{$MODE Delphi}
{$ENDIF}


uses
  SysUtils,
  debug in '..\studio\debug.pas',
  studio_tools in 'studio_tools.pas',
  md5 in 'md5\md5.pas',
  ZLib in '..\Zlib.pas';

var
   i           : Integer;
   FileName    : String;
   NewFileName : String;
   Data        : String;
   Action      : String;
   StubFile    : String;
begin
   UseWriteln;

   Log('rawwrite rrtool for windows version ' + AppVersion + '.');
   Log('Written by John Newbigin <jn@it.swin.edu.au>');
   Log('This program is covered by the GPL.  See copying.txt for details');

   Action := 'usage';

   for i := 1 to ParamCount do
   begin
      if ParamStr(i) = '--compress' then
      begin
         Action := 'compress';
      end
      else if ParamStr(i) = '--decompress' then
      begin
         Action := 'decompress';
      end
      else if ParamStr(i) = '--md5' then
      begin
         Action := 'md5';
      end
      else if ParamStr(i) = '--build' then
      begin
         Action := 'build';
      end
      else if ParamStr(i) = '--stub' then
      begin
         Action := 'stub';
      end
      else if Action = 'compress' then
      begin
         FileName := ParamStr(i);
         if FileExists(FileName) then
         begin
            NewFileName := FileName + '.rrz';

            Log('Compressing ' + FileName + ' to ' + NewFileName);
            Data := ZCompressStr(LoadDiskFile(FileName));
            SaveDiskFile(NewFileName, Data);
            Data := '';
         end
         else
         begin
            Log('File not found ' + FileName);
         end;
      end
      else if Action = 'decompress' then
      begin
         FileName := ParamStr(i);
         if FileExists(FileName) then
         begin
            if EndsWith(FileName, '.rrz', NewFileName) then
            begin
            end
            else
            begin
               NewFileName := FileName + '.rr';
            end;

            Log('Uncompressing ' + FileName + ' to ' + NewFileName);
            Data := LoadDiskFile(FileName);
            Data := ZDecompressStr(Data);
            SaveDiskFile(NewFileName, Data);
            Data := '';
         end
         else
         begin
            Log('File not found ' + FileName);
         end;
      end
      else if Action = 'md5' then
      begin
      end
      else if Action = 'build' then
      begin
         FileName := ParamStr(i);
         if FileExists(FileName) then
         begin
            Log('Building ' + FileName);
            CreateExe(ParamStr(i), StubFile);
         end
         else
         begin
            Log('File not found ' + FileName);
         end;
      end
      else if Action = 'stub' then
      begin
         FileName := ParamStr(i);
         if FileExists(FileName) then
         begin
            Log('Useing ' + FileName + ' as stub file');
            StubFile := FileName;
         end
         else
         begin
            Log('File not found ' + FileName);
         end;
      end
      else
      begin
         Log('Unknown parameter ' + ParamStr(i));
         break;
      end;

   end;

   if Action = 'usage' then
   begin
      Log('--build      build exe from config files listed');
      Log('--stub       specify stub file to use');
      Log('--compress   zlib compress files listed');
      Log('--decompress zlib decompress files listed');
      Log('--md5        print out md5 sum for files listed');
   end;

end.
