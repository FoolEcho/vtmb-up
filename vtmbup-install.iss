; -- vtmbupinstaller.iss --

[Setup]
AppName=Vampire: The Masquerade - Bloodlines unofficial patch 10.4 fr
AppVerName=Vampire: The Masquerade - Bloodlines unofficial patch 10.4 fr
VersionInfoDescription=Vampire: The Masquerade - Bloodlines unofficial patch avec sous-titrage français
VersionInfoVersion=10.4
AppPublisher=Werner Spahl
DefaultDirName={reg:HKLM\Software\Activision\Vampire - Bloodlines,InstallPath|{pf}\Steam\steamapps\common\vampire the masquerade - bloodlines}
AppendDefaultDirName=no
DirExistsWarning=no
EnableDirDoesntExistWarning=yes
OutputBaseFilename=VTMBup104fr
Uninstallable=no
InfoBeforeFile=vtmbup-readme.txt
InfoAfterFile=vtmbup-after.txt
Compression=lzma2/ultra64
SolidCompression=true
InternalCompressLevel=normal
TimeStampsInUTC=yes
DisableProgramGroupPage=yes
WizardSmallImageFile=vtmbup-small.bmp
WizardImageFile=vtmbup-large.bmp
WizardImageBackColor=clBlack
WizardImageStretch=no

[Types]
Name: "basic"; Description: "Patch non officiel"; Flags: iscustom

[Components]
Name: "basic"; Description: "Patch de base"; Types: basic; Flags: fixed checkablealone
Name: "readme"; Description: "Lisez-moi"; Types: basic; Flags: fixed checkablealone
Name: "plus"; Description: "Patch Plus (restaurations et ajustements)"; Flags: checkablealone
Name: "extras"; Description: "Différents Extras (Walkthrough, Shaders, SDK et plus)"; Flags: checkablealone

[Code]
function retail: Boolean; 
var 
  string: String; 
begin 
  result := False; 
  if RegQueryStringValue(HKLM, 'SOFTWARE\Activision\Vampire - Bloodlines','Version',string) then 
  result := True;
end;

[Files]
Source: "{app}\Unofficial_Patch\save\*"; DestDir: "{app}\Unofficial_Patch_fr\save\old"; Components: basic; Flags: external skipifsourcedoesntexist
Source: "{app}\Unofficial_Patch\save\auto*"; DestDir: "{app}\Unofficial_Patch_fr\save"; Components: basic; Flags: external deleteafterinstall skipifsourcedoesntexist
Source: "{app}\Unofficial_Patch\save\quick*"; DestDir: "{app}\Unofficial_Patch_fr\save"; Components: basic; Flags: external deleteafterinstall skipifsourcedoesntexist
Source: "{app}\Unofficial_Patch\save\Vampire-0*"; DestDir: "{app}\Unofficial_Patch_fr\save"; Components: basic; Flags: external deleteafterinstall skipifsourcedoesntexist
Source: "vtmbup-readme.txt"; DestDir: "{app}"; Components: readme; Flags: isreadme overwritereadonly
Source: "Official_Patch\*"; DestDir: "{app}"; Components: basic; Flags: recursesubdirs ignoreversion overwritereadonly
Source: "Basic_Patch\dlls\*"; DestDir: "{app}\vampire\dlls"; Components: basic; Flags: recursesubdirs ignoreversion overwritereadonly
Source: "Basic_Patch\cl_dlls\*"; DestDir: "{app}\vampire\cl_dlls"; Components: basic; Flags: recursesubdirs ignoreversion overwritereadonly
Source: "Basic_Patch\*"; DestDir: "{app}\Unofficial_Patch_fr"; Components: basic; Flags: recursesubdirs ignoreversion overwritereadonly
Source: "Basic_Local\*"; DestDir: "{app}\Unofficial_Patch_fr"; Components: basic; Flags: recursesubdirs ignoreversion overwritereadonly
Source: "Plus_Patch\*"; DestDir: "{app}\Unofficial_Patch_fr"; Components: plus; Flags: recursesubdirs ignoreversion overwritereadonly
Source: "Plus_Local\*"; DestDir: "{app}\Unofficial_Patch_fr"; Components: plus; Flags: recursesubdirs ignoreversion overwritereadonly
Source: "Patch_Extras\*"; DestDir: "{app}\Patch_Extras"; Components: extras; Flags: recursesubdirs ignoreversion overwritereadonly
Source: "Patch_Extras\Developer Tools\Game Mod Loader\*"; DestDir: "{app}"; Components: basic; Flags: recursesubdirs ignoreversion; Excludes: "Vampire_4GB_fixed.exe"
Source: "Patch_Extras\Developer Tools\Game Mod Loader\Vampire_4GB_fixed.exe"; DestDir: "{app}"; DestName: "Vampire.exe"; Flags: ignoreversion overwritereadonly; Check: IsWin64
Source: "{app}\Bin\*"; DestDir: "{app}"; Components: basic; Flags: external skipifsourcedoesntexist overwritereadonly
Source: "{app}\*.exe";                          Flags: external dontcopy skipifsourcedoesntexist; Attribs: readonly
Source: "{app}\*.dll";                          Flags: external dontcopy skipifsourcedoesntexist; Attribs: readonly
Source: "{app}\Bin\*.dll";                      Flags: external dontcopy skipifsourcedoesntexist; Attribs: readonly
Source: "{app}\Unofficial_Patch_fr\cl_dlls\*.dll"; Flags: external dontcopy skipifsourcedoesntexist; Attribs: readonly
Source: "{app}\Unofficial_Patch_fr\dlls\*.dll";    Flags: external dontcopy skipifsourcedoesntexist; Attribs: readonly
Source: "{app}\Vampire\cl_dlls\*.dll";          Flags: external dontcopy skipifsourcedoesntexist; Attribs: readonly
Source: "{app}\Vampire\dlls\*.dll";             Flags: external dontcopy skipifsourcedoesntexist; Attribs: readonly

[InstallDelete]
Type: filesandordirs; Name: "{app}\vampire.dat"
Type: filesandordirs; Name: "{app}\noseqence.txt"
Type: filesandordirs; Name: "{app}\dbghelp.dll.12"
Type: filesandordirs; Name: "{app}\a_basetexture.tth"
Type: filesandordirs; Name: "{app}\Vampire\hl2.tmp"
Type: filesandordirs; Name: "{app}\Vampire\stats.txt"
Type: filesandordirs; Name: "{app}\Vampire\vidcfg.bin"
Type: filesandordirs; Name: "{app}\Vampire\voice_ban.dt"
Type: filesandordirs; Name: "{app}\Unofficial_Patch_fr\hl2.tmp"
Type: filesandordirs; Name: "{app}\Unofficial_Patch_fr\stats.txt"
Type: filesandordirs; Name: "{app}\Unofficial_Patch_fr\vidcfg.bin"
Type: filesandordirs; Name: "{app}\Unofficial_Patch_fr\voice_ban.dt"

[Icons]
Name: "{userdesktop}\VTM Bloodlines Unofficial Patch (fr)"; Filename: {app}\vampire.exe; Parameters: "-game Unofficial_Patch_fr"
Name: "{userprograms}\VTM Bloodlines Unofficial Patch (fr)"; Filename: {app}\vampire.exe; Parameters: "-game Unofficial_Patch_fr"

[Run]
Filename: {app}\vampire.exe; Parameters: "-game Unofficial_Patch_fr"; Description: Démarrer Bloodlines avec le Patch non officiel; Flags: postinstall runascurrentuser nowait skipifsilent

[Languages]
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"


