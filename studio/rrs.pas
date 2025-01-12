unit rrs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, winbinfile,
  StdCtrls, ComCtrls, Menus;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DiskIDEdit: TEdit;
    Button5: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DiskBuffer : String;
    ZDiskBuffer : String;

    procedure Debug(s : String);
  end;

var
  Form1: TForm1;

implementation

uses zlib, studio_tools, debug;

procedure TForm1.Debug(s : String);
begin
   Memo1.Lines.Add(s);
end;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
   BinFile : TBinaryFile;
begin
   BinFile := TBinaryFile.Create;
   try
      BinFile.Assign(Edit1.Text);
      BinFile.Open(OPEN_READ_ONLY);

      Debug(IntToStr(BinFile.FileSize));

      SetLength(DiskBuffer, BinFile.FileSize);
      BinFile.BlockRead2(PChar(DiskBuffer), BinFile.FileSize);
   finally
      BinFile.Free;
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   Data2 : String;
begin
   ZDiskBuffer := ZCompressStr(DiskBuffer, zcMax);
   Debug(IntToStr(Length(ZDiskBuffer)));

   Data2 := ZDecompressStr(ZDiskBuffer);
   Debug(IntToStr(Length(Data2)));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
   Res : String;
   ID : String;
begin
   ID := 'DISK' + DiskIDEdit.Text;
   Res := LoadDiskResource(ID);
   Debug(IntToStr(Length(Res)));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
//   SaveDiskResource('foot.exe', 'DISK2', ZDiskBuffer);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
   Config : TStringList;
   Chopper : TStringList;
   i : Integer;
   Target : String;
   DiskName : String;
   Line : String;
   ZData : String;

   NameList : TStringList;
   DataList : TStringList;
begin
   CreateExe(Edit1.Text, '');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   SetDebug(Debug);
end;

end.
