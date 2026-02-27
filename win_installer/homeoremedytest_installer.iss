; Inno Setup Script for HomeoRemedyTest
; Creates Windows Installer (.exe) for the application

#define MyAppName "HomeoRemedyTest"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "zerocreator"
#define MyAppExeName "HomeoRemedyTest.exe"
#define MyAppURL "https://github.com/zerocreator/HomeoRemedyTest"

[Setup]
; Basic settings
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=..\LICENSE
OutputDir=Output
OutputBaseFilename=HomeoRemedyTest-Setup
SetupIconFile=..\public\static\favicon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=dialog
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

; Language detection
UsePreviousAppDir=yes
UsePreviousGroup=yes
UsePreviousTasks=yes

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 6.1; Check: not IsAdminInstallMode

[Files]
; Main executable and all dependencies from PyInstaller build
Source: "..\dist\HomeoRemedyTest\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

; Note: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
function InitializeSetup(): Boolean;
var
  ResultCode: Integer;
begin
  Result := True;
  
  // Check if Python is already installed (optional check)
  // This is not required since we're bundling everything with PyInstaller
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    // Any post-installation tasks can go here
    // For example, creating initial data files
  end;
end;

function GetCustomInstallDir: String;
begin
  Result := ExpandConstant('{app}');
end;

[UninstallDelete]
; Clean up user data on uninstall (optional - comment out if you want to preserve data)
; Type: filesandordirs; Name: "{userappdata}\HomeoRemedyTest"

[InstallDelete]
; Clean up old files before installation
Type: filesandordirs; Name: "{app}\dist"
Type: filesandordirs; Name: "{app}\build"
