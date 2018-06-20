; -- vtmbupinstaller.iss --

[Setup]
AppName=Vampire: The Masquerade - Bloodlines unofficial patch 10.0 fr
AppVerName=Vampire: The Masquerade - Bloodlines unofficial patch 10.0 fr
VersionInfoDescription=Vampire: The Masquerade - Bloodlines unofficial patch avec sous-titrage français
VersionInfoVersion=10.0
AppPublisher=Werner Spahl
DefaultDirName={reg:HKLM\Software\Activision\Vampire - Bloodlines,InstallPath|{pf}\Steam\steamapps\common\vampire the masquerade - bloodlines}
AppendDefaultDirName=no
DirExistsWarning=no
EnableDirDoesntExistWarning=yes
OutputBaseFilename=VTMBup10fr
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
Name: "plus\audio"; Description: "Pas de modifications audios (morceaux de musiques et sons aléatoires)"; Flags: dontinheritcheck
Name: "plus\particles"; Description: "Pas de modifications des particules (pluie améliorée et effets de lancement de sort)"; Flags: dontinheritcheck
Name: "plus\graphics"; Description: "Pas de changements des graphismes (forme guerrière lupine, yeux améliorés)"; Flags: dontinheritcheck
Name: "plus\disciplines"; Description: "Pas de modifications des Disciplines (animations de lancement de sort et niveaux modifiés)"; Flags: dontinheritcheck
Name: "extras"; Description: "Différents Extras (Walkthrough, Transcriptions...)"; Flags: checkablealone
Name: "extras\play"; Description: "Mods de joueur (Shader suites et plus)"; Flags: dontinheritcheck
Name: "extras\edit"; Description: "Outils de développeur (SDK officieux et plus)"; Flags: dontinheritcheck

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
Source: "vtmbup-readme.txt"; DestDir: "{app}"; Components: readme; Flags: isreadme
Source: "Official_Patch\*"; DestDir: "{app}"; Components: basic; Flags: recursesubdirs ignoreversion
Source: "Basic_Patch\cl_dlls\*"; DestDir: "{app}\vampire\cl_dlls"; Components: basic; Flags: recursesubdirs ignoreversion
Source: "Basic_Patch\dlls\*"; DestDir: "{app}\vampire\dlls"; Components: basic; Flags: recursesubdirs ignoreversion
Source: "Basic_Patch\*"; DestDir: "{app}\Unofficial_Patch_fr"; Components: basic; Flags: recursesubdirs ignoreversion
Source: "Basic_Local\*"; DestDir: "{app}\Unofficial_Patch_fr"; Components: basic; Flags: recursesubdirs ignoreversion
Source: "Plus_Patch\*"; DestDir: "{app}\Unofficial_Patch_fr"; Components: plus; Flags: recursesubdirs ignoreversion
Source: "Plus_Local\*"; DestDir: "{app}\Unofficial_Patch_fr"; Components: plus; Flags: recursesubdirs ignoreversion
Source: "Basic_Patch\sound\schemes\*"; DestDir: "{app}\Unofficial_Patch_fr\sound\schemes"; Components: plus\audio; Flags: ignoreversion
Source: "Basic_Patch\particles\*"; DestDir: "{app}\Unofficial_Patch_fr\particles"; Components: plus\particles; Flags: ignoreversion
Source: "Basic_Patch\materials\models\character\eyes\*"; DestDir: "{app}\Unofficial_Patch_fr\materials\models\character\eyes"; Components: plus\graphics; Flags: ignoreversion
Source: "Basic_Patch\models\character\monster\animalism_beastform\animalism_beastform.mdl"; DestDir: "{app}\Unofficial_Patch_fr\models\character\monster\animalism_beastform"; Components: plus\graphics; Flags: ignoreversion
Source: "Basic_Local\vdata\signs\tutorial_popup_d*"; DestDir: "{app}\Unofficial_Patch_fr\vdata\signs"; Components: plus\disciplines; Flags: ignoreversion
Source: "Basic_Local\vdata\signs\tutorial_popup_f*"; DestDir: "{app}\Unofficial_Patch_fr\vdata\signs"; Components: plus\disciplines; Flags: ignoreversion
Source: "Basic_Local\vdata\system\disciplinetgt*"; DestDir: "{app}\Unofficial_Patch_fr\vdata\system"; Components: plus\disciplines; Flags: ignoreversion
Source: "Basic_Local\vdata\system\stats.txt"; DestDir: "{app}\Unofficial_Patch_fr\vdata\system"; Components: plus\disciplines; Flags: ignoreversion
Source: "Patch_Extras\Developer Tools\Game Mod Loader\*"; DestDir: "{app}"; Components: basic; Flags: recursesubdirs ignoreversion
Source: "Patch_Extras\*"; DestDir: "{app}\Patch_Extras"; Components: extras; Flags: ignoreversion
Source: "Patch_Extras\Developer Tools\*"; DestDir: "{app}\Patch_Extras\Developer Tools"; Components: extras\edit; Flags: recursesubdirs ignoreversion
Source: "Patch_Extras\Player Mods\*"; DestDir: "{app}\Patch_Extras\Player Mods"; Components: extras\play; Flags: recursesubdirs ignoreversion
Source: "ChangeLog"; DestDir: "{app}"; Components: readme

[InstallDelete]
Type: filesandordirs; Name: "{app}\*.log"
Type: filesandordirs; Name: "{app}\vampire.dat"
Type: filesandordirs; Name: "{app}\noseqence.txt"
Type: filesandordirs; Name: "{app}\a_basetexture.tth"
Type: filesandordirs; Name: "{app}\Vampire\hl2.tmp"
Type: filesandordirs; Name: "{app}\Vampire\vidcfg.bin"
Type: filesandordirs; Name: "{app}\Vampire\voice_ban.dt"
Type: filesandordirs; Name: "{app}\Vampire\stats.txt"
Type: filesandordirs; Name: "{app}\Unofficial_Patch\hl2.tmp"
Type: filesandordirs; Name: "{app}\Unofficial_Patch\vidcfg.bin"
Type: filesandordirs; Name: "{app}\Unofficial_Patch\voice_ban.dt"
Type: filesandordirs; Name: "{app}\Unofficial_Patch\stats.txt"


[Icons]
Name: "{userdesktop}\VTM Bloodlines Unofficial Patch (fr)"; Filename: {app}\vampire.exe; Parameters: "-game Unofficial_Patch_fr"
Name: "{userprograms}\VTM Bloodlines Unofficial Patch (fr)"; Filename: {app}\vampire.exe; Parameters: "-game Unofficial_Patch_fr"

[Run]
Filename: {app}\vampire.exe; Parameters: "-game Unofficial_Patch_fr"; Description: Démarrer Bloodlines avec le Patch non officiel; Flags: postinstall runascurrentuser nowait skipifsilent

[Languages]
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"


