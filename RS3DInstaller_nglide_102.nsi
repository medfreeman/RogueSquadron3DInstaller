;Rogue Squadron 3D Installer
;Written by med_freeman
;Attribution-NonCommercial-NoDerivs 3.0 Unported (CC BY-NC-ND 3.0) license - https://creativecommons.org/licenses/by-nc-nd/3.0/
;2014-10-07 19:33

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  !include "Sections.nsh"
  !include "LogicLib.nsh"

;--------------------------------
;General

  ;The name of the installer
  !define APP_NAME "Rogue Squadron 3D"
  ;The version of nGlide
  !define NGLIDE_VERSION "102"
  ;The version of the installer
  !define APP_VERSION "0.96_nglide_${NGLIDE_VERSION}"
  ;The name of the publisher
  !define APP_PUBLISHER "LucasArts, Factor 5"
  ;Registry path
  !define PARENT_REG_PATH "Software\LucasArts Entertainment Company LLC\Rogue Squadron"
  !define REG_PATH "${PARENT_REG_PATH}\v1.0"

  ;The name of the installer
  Name "${APP_NAME}"
  
  ;The file to write
  OutFile "RS3DInstaller-${APP_VERSION}.exe"
  
  ;The icon of the installer exe
  Icon ".\assets\gfx\icon\rogue.ico"
  
  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin
  
  ;Show details
  ShowInstDetails show
  
  ;Default installation folder
  InstallDir "$PROGRAMFILES\LucasArts\ROGUE"

  ;Get installation folder from registry if available
  !define INSTDIR_REG_ROOT "HKLM"
  !define INSTDIR_REG_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
  InstallDirRegKey ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "InstallDir"
  
  ;Default Start menu folder
  !define MUI_STARTMENUPAGE_DEFAULTFOLDER "LucasArts\${APP_NAME}"
  ;Start Menu Folder Page Configuration
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "${INSTDIR_REG_ROOT}"
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "${INSTDIR_REG_KEY}"
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "StartMenu Folder"

;--------------------------------
;Interface Settings

  ;Abort Warning
  !define MUI_ABORTWARNING
  ;Show all languages, despite user's codepage
  !define MUI_LANGDLL_ALLLANGUAGES

  ;MUI Settings / Icons
  !define MUI_ICON ".\assets\gfx\icon\rogue.ico"
  !define MUI_UNICON ".\assets\gfx\icon\rogue.ico"
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP ".\assets\gfx\header\rogue.bmp"
  !define MUI_WELCOMEFINISHPAGE_BITMAP ".\assets\gfx\welcome\rogue.bmp"
  !define MUI_WELCOMEPAGE_TITLE_3LINES
  
  ;Finish Page
  !define MUI_FINISHPAGE_TEXT $(FINISH_RUN_NGLIDE_LATER)
  !define MUI_FINISHPAGE_NOAUTOCLOSE
  ;Graphics configuration
  !define MUI_FINISHPAGE_RUN "$SYSDIR\nglide_config.exe"
  !define MUI_FINISHPAGE_RUN_TEXT $(FINISH_RUN_NGLIDE)
  ;Add desktop shortcut
  !define MUI_FINISHPAGE_SHOWREADME ""
  !define MUI_FINISHPAGE_SHOWREADME_TEXT $(FINISH_ADD_SHORTCUT)
  !define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
  !define MUI_FINISHPAGE_SHOWREADME_FUNCTION FinishPageShortcut
  ;Open readme file
  !define MUI_FINISHPAGE_LINK $(FINISH_OPEN_README)
  !define MUI_FINISHPAGE_LINK_LOCATION "$INSTDIR\README.TXT"
  
;--------------------------------
;Variables

  Var RogueCDPath
  Var RogueVersion
  Var DirectXSetupError
  Var StartMenuFolder
  Var RunningOnWine
  
;--------------------------------
;Pages
  
  ;Installer
  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE ".\assets\license\LICENSE.TXT"
  !insertmacro MUI_PAGE_COMPONENTS
  !define MUI_PAGE_CUSTOMFUNCTION_PRE DirectoryPre
  !define MUI_PAGE_CUSTOMFUNCTION_SHOW DirectoryPre
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder
  !insertmacro MUI_PAGE_INSTFILES
  !define MUI_PAGE_CUSTOMFUNCTION_SHOW FinishPageHidenGlide
  !insertmacro MUI_PAGE_FINISH
  
  ;Uninstaller
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"
  !insertmacro MUI_LANGUAGE "French"

;--------------------------------
;Download

  !include "nsisdl.nsh"
  !define NSISDL_DOWNLOAD `!insertmacro NSISDL_DOWNLOAD`
  
;--------------------------------
;Reserve Files
  
  ;If you are using solid compression, files that are required before
  ;the actual installation should be stored first in the data block,
  ;because this will make your installer start faster.
  
  !insertmacro MUI_RESERVEFILE_LANGDLL

;--------------------------------
;Uninstall

  ;include the Uninstall log header
  !include "AdvUninstLog.nsh"
  ;Uninstall
  !insertmacro UNATTENDED_UNINSTALL

;--------------------------------
;Installer Sections
  
Section $(HEAD_SectionGameInstall) SectionGameInstall
  SectionIn RO
  AddSize 52806
  
  SetOutPath "$INSTDIR"
  !insertmacro UNINSTALL.LOG_OPEN_INSTALL
  Call RogueFilesCopy
  CreateDirectory "$INSTDIR\PlayerProfiles"
  !insertmacro UNINSTALL.LOG_CLOSE_INSTALL
  
  AccessControl::GrantOnFile "$INSTDIR\PlayerProfiles" "(BU)" "GenericRead + GenericWrite"
  
  ${If} $RunningOnWine = 0
    SetOutPath "$INSTDIR\PlayerProfiles"
    ;!insertmacro UNINSTALL.LOG_OPEN_INSTALL
    File "assets\profile\Player_03.sav"
    ;!insertmacro UNINSTALL.LOG_CLOSE_INSTALL
    AccessControl::GrantOnFile "$INSTDIR\PlayerProfiles\Player_03.sav" "(BU)" "GenericRead + GenericWrite"
  ${EndIf}
  
  Call RogueRegistrySet
  
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  SetOutPath "$SMPROGRAMS"
  !insertmacro UNINSTALL.LOG_OPEN_INSTALL

  ;Create shortcuts
  CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
  CreateShortcut  "$SMPROGRAMS\$StartMenuFolder\${APP_NAME}.lnk" "$INSTDIR\ROGUE.EXE"
  CreateShortcut  "$SMPROGRAMS\$StartMenuFolder\View Rogue Squadron Readme.lnk" "$INSTDIR\README.TXT"
  CreateShortcut  "$SMPROGRAMS\$StartMenuFolder\Uninstall Rogue Squadron.lnk" "${UNINST_EXE}"

  !insertmacro UNINSTALL.LOG_CLOSE_INSTALL
  !insertmacro MUI_STARTMENU_WRITE_END
  
  Call RogueRegistryUninstallSet
SectionEnd

Section $(HEAD_SectionUpdate) SectionUpdate
  SectionIn RO
  AddSize 2476
  DetailPrint $(UPDATE_INSTALL)
  StrCpy $2 "$TEMP\rogueupd12.exe"
  File /oname=$2 "assets\update\rogueupd12.exe"
  ;${NSISDL_DOWNLOAD} "http://media1.gamefront.com/moddb/2009/03/10/rogueupd12.exe" "$2"
  ;Pop $0 ;Get the return value
  ;StrCmp $0 "success" +3
  ;  DetailPrint $(DOWNLOAD_ERROR)
  ;  Abort
  ClearErrors
  ExecWait '"$2"'
  IfErrors 0 noError
    DetailPrint $(UPDATE_ERROR)
    Delete $2
    Abort
  noError:
  Delete $2
SectionEnd

Section $(HEAD_SectionDirectX) SectionDirectX
  SetOutPath "$TEMP"
  File "assets\directx\dxwebsetup.exe"
  DetailPrint $(DIRECTX_SETUP)
  ExecWait '"$TEMP\dxwebsetup.exe" /Q' $DirectXSetupError
  DetailPrint $(DIRECTX_SETUP_FINISHED)
  Delete "$TEMP\dxwebsetup.exe"
  SetOutPath "$INSTDIR"
SectionEnd

Section $(HEAD_SectionNGlide) SectionNGlide
  AddSize 2562
  DetailPrint $(NGLIDE_DOWNLOAD)
  StrCpy $2 "$TEMP\nGlide${NGLIDE_VERSION}_setup.exe"
  ${NSISDL_DOWNLOAD} "http://www.zeus-software.com/files/nglide/nGlide${NGLIDE_VERSION}_setup.exe" "$2"
  Pop $0 ;Get the return value
  StrCmp $0 "success" +3
    DetailPrint $(DOWNLOAD_ERROR)
    Abort
  ClearErrors
  ExecWait '"$2"'
  IfErrors 0 noError
    DetailPrint $(NGLIDE_ERROR)
    Delete $2
    Abort
  noError:
  Delete $2
  ;Select Glide renderer
  WriteRegStr HKLM "${REG_PATH}" "3DSetup" "TRUE"
  WriteRegStr HKLM "${REG_PATH}" "VDEVICE" "Voodoo (Glide)"
  ;Select nGlide default settings
  Call SetnGlideDefaults
SectionEnd

!include "FileFunc.nsh"

Section $(HEAD_SectionMissionCrashFix) SectionMissionCrashFix
  SectionIn RO
  FileOpen $0 "$INSTDIR\Rogue Squadron.EXE" "a"
  FileSeek $0 1554569
  nsisFile::FileReadBytes $0 7
  Pop $1
  DetailPrint $(MCRASH_SEARCH)
  ${If} $1 == "0FBF050CA57300"
    FileSeek $0 1554569
    nsisFile::FileWriteBytes $0 "B8000000009090"
    DetailPrint $(MCRASH_APPLIED)
  ${Else}
    DetailPrint $(MCRASH_ERROR)
  ${Endif}
  FileClose $0
  
  ;Mission crash fix offset reference
  ;17B889h 15 (0Fh) to 184 (B8h)
  ;17B88Ah 191 (BFh) to 0 (00h)
  ;17B88Bh 5 (05h) to 0 (00h)
  ;17B88Ch 12 (0Ch) to 0 (00h)
  ;17B88Dh 165 (A5h) to 0 (00h)
  ;17B88Eh 115 (73h) to 144 (90h)
  ;17B88Fh 0 (00h) to 144 (90h)
SectionEnd
  
;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;uninstall from path, must be repeated for every install logged path individual
  !insertmacro UNINSTALL.LOG_UNINSTALL "$INSTDIR"
  ;uninstall from path, must be repeated for every install logged path individual
  !insertmacro UNINSTALL.LOG_UNINSTALL "$SMPROGRAMS"
  !insertmacro UNINSTALL.LOG_UNINSTALL "$DESKTOP"
  ;end uninstall, after uninstall from all logged paths has been performed
  !insertmacro UNINSTALL.LOG_END_UNINSTALL
  !insertmacro UNINSTALL.LOG_END_UNINSTALL
  
  Delete "$DESKTOP\${APP_NAME}.lnk"
  
  DeleteRegKey HKLM "${PARENT_REG_PATH}"
  
  Call un.RogueRegistryUninstallDelete

SectionEnd
  
;--------------------------------
;Macros

; Macros (UnselectSection GetParams FileCopy TrailingSlashHit)
!include ".\includes\macros.nsi"

;--------------------------------
;Installer Functions

;Resources (Game files and reg keys)
!include ".\resources\resources.nsi"
;Utils (DirectX detection - 64bit registry - Wine detection)
!include ".\includes\utils.nsi"

;Initialization

Function .onInit
  Call UninstallIfAlreadyInstalled

  Call RogueCDRom
  
  Call RunningOnWine
  Pop $RunningOnWine
  Call GetDXVersion
  Pop $R0
  ${If} $RunningOnWine = 1
  ${OrIf} $R0 >= 900
    ${UnselectSection} ${SectionDirectX}
  ${EndIf}
  
  Call RogueGetVersion
  Pop $R0
  ${If} $R0 >= 121
    ${UnselectSection} ${SectionUpdate}
  ${EndIf}
  
  Call GetnGlideVersion
  Pop $R0
  ${If} $R0 >= ${NGLIDE_VERSION}
    ${UnselectSection} ${SectionNGlide}
  ${EndIf}
  
  ;Splash
  splash::show 2000 "$RogueCDPath\INSTALL\SETUP"
  Pop $0
  
  ;Language Selection
  !insertmacro MUI_LANGDLL_DISPLAY
  
  ;prepare log always within .onInit function
  !insertmacro UNINSTALL.LOG_PREPARE_INSTALL
FunctionEnd

Function .onInstSuccess
  ;create/update log always within .onInstSuccess function
  !insertmacro UNINSTALL.LOG_UPDATE_INSTALL
FunctionEnd

Function un.onInit
  ;begin uninstall, could be added on top of uninstall section instead
  !insertmacro UNINSTALL.LOG_BEGIN_UNINSTALL
FunctionEnd

;Installation

Function DirectoryPre
  ${If} $RunningOnWine = 1
    FindWindow $R1 "#32770" "" $HWNDPARENT
    GetDlgItem $R2 $R1 1019
    EnableWindow $R2 0
    GetDlgItem $R2 $R1 1001
    EnableWindow $R2 0
  ${EndIf}
FunctionEnd

Function FinishPageHidenGlide
  SectionGetFlags ${SectionNGlide} $R0 
  IntOp $R0 $R0 & ${SF_SELECTED} 
  ${IfNot} $R0 = ${SF_SELECTED}
    SendMessage $mui.FinishPage.Text ${WM_SETTEXT} 0 ""
    SendMessage $mui.FinishPage.Run ${BM_SETCHECK} ${BST_UNCHECKED} 0
    ShowWindow $mui.FinishPage.Run 0
  ${EndIf}
FunctionEnd

Function FinishPageShortcut
  CreateShortcut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\ROGUE.EXE"
FunctionEnd

!insertmacro GetDrives

Function RogueCDRom
  ${GetParams}
  Pop $R5
  StrCmp $R5 "/nocdprompt" +2
  MessageBox MB_OK $(ROGUECDROM_PLS_INSERT)
  ${GetDrives} "CDROM" "FindRogueCDRom"
  ${If} $RogueCDPath == ""
    MessageBox MB_OK $(ROGUECDROM_NOT_FOUND_DETAIL)
    Quit
  ${EndIf}
  StrCmp $R5 "/nocdprompt" +2
  MessageBox MB_OK $(ROGUECDROM_FOUND)
FunctionEnd
 
Function FindRogueCDRom ;Uses cdrom plugin
  ;Get CD-ROM status
  cdrom::Status "$9" .R0
  
  ;Get CD-ROM volume name
  cdrom::VolumeName "$9" .R1
  
  ;If CD-ROM is ready
  ${If} $R0 == 1
  ;And has correct volume name
  ${AndIf} $R1 == "ROGUE_1_000"
  ${AndIf} ${FileExists} "$9ROGUE\ROGUE SQUADRON.EXE"
  ${AndIf} ${FileExists} "$9ROGUE\DATA\BUNDLE.000"
    ${TrailingSlashHit} "$9"
    Pop $RogueCDPath
  ${EndIf}
  
  ;Next Drive
  Push $0
FunctionEnd

;Array support
!include "nsArray.nsh"

Function RogueFilesCopy
  ;Populating FileSourceArray
  Call FileListSource
  ;Populating FileDestArray
  Call FileListDest
  ;Getting Length of FileSourceArray
  nsArray::Length FileSourceArray
  Pop $R0
  ;Getting Length of FileDestArray
  nsArray::Length FileDestArray
  Pop $R1
  ;Comparing the two, if size mismatch exit
  ${If} $R0 != $R1
    Quit
  ${EndIf}
  
  ;Preparing files iteration
  ClearErrors
  ${Do}
    nsArray::Iterate FileSourceArray
    Pop $R0
    Pop $R1 ;Original file relative path
	${IfNot} ${FileExists} "$RogueCDPath\$R1" ;Skip files that don't exist for older cdrom versions
	  ${Continue}
	${EndIf}
    nsArray::Get FileDestArray $R0
    Pop $R2 ;Destination file relative path
    ${FileCopy} "$RogueCDPath\$R1" "$INSTDIR\$R2" $RunningOnWine
    ${If} $RunningOnWine = 1
      AccessControl::GrantOnFile "$INSTDIR\$R2" "(BU)" "GenericRead + GenericWrite"
    ${EndIf}
  ${LoopUntil} ${Errors} ;Loop until array completely iterated
FunctionEnd

Function RogueRegistrySet
  ;Populating RegistryKeys
  Call RegistryListKeys
  ;Populating RegistryValues
  Call RegistryListValues
  ;Getting Length of RegistryKeys
  nsArray::Length RegistryKeys
  Pop $R0
  ;Getting Length of RegistryValues
  nsArray::Length RegistryValues
  Pop $R1
  ;Comparing the two, if size mismatch exit
  ${If} $R0 != $R1
    Quit
  ${EndIf}
  
  ;Preparing files iterations
  ClearErrors
  ${Do}
    nsArray::Iterate RegistryKeys
    Pop $R0 ;Registry key type + index
    StrCpy $R3 "$R0" 1 ;type of key (s=string, d=dword)
       Pop $R1 ;Registry key
    nsArray::Get RegistryValues $R0
    Pop $R2 ;Registry value
    ${If} $R3 == "s"
      WriteRegStr HKLM "${REG_PATH}" "$R1" "$R2"
    ${ElseIf} $R3 == "d"
      WriteRegDWORD HKLM "${REG_PATH}" "$R1" $R2
    ${EndIf}
  ${LoopUntil} ${Errors} ;Loop until array completely iterated
  
  ;Magic key to recognize versions
  ${If} $RogueVersion == "1.2"
    WriteRegDWORD HKLM "${REG_PATH}" "Magic" 0x000927d8 ;1.21
  ${ElseIf} $RogueVersion == "1.3"
    WriteRegDWORD HKLM "${REG_PATH}" "Magic" 0x0009283c ;1.3
  ${EndIf}
FunctionEnd

Function RogueRegistryUninstallSet
  Call 64bitRegistrySet
  WriteRegStr ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "InstallDir" "$INSTDIR"
  WriteRegStr ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "DisplayName" "${APP_NAME}"
  ;Same as create shortcut you need to use ${UNINST_EXE} instead of anything else.
  WriteRegStr ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "UninstallString" "${UNINST_EXE}"
  WriteRegStr ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "Publisher" "${APP_PUBLISHER}"
  WriteRegStr ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "DisplayIcon" "$INSTDIR\Uninstall.exe,0"
  WriteRegStr ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "Readme" "$INSTDIR\README.TXT"
  ${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2
  IntFmt $0 "0x%08X" $0
  WriteRegDWORD ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "EstimatedSize" "$0"
  WriteRegStr ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "DisplayVersion" "$RogueVersion"
  Call 64bitRegistryUnset
FunctionEnd

Function un.RogueRegistryUninstallDelete
  Call un.64bitRegistrySet
  DeleteRegKey ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}"
  Call un.64bitRegistryUnset
FunctionEnd

!include "StrFunc.nsh"
${StrTrimNewLines}
${StrStrAdv}
${StrTok}

Function RogueGetVersion
  Push $R0
  Push $R1
  Push $R2
  FileOpen $R0 "$RogueCDPath\INSTALL\Readme.txt" r
  FileRead $R0 $R1 ; we read until the end of line (including carriage return and new line) and save it to $R1
  FileRead $R0 $R2
  FileClose $R0 ; and close the file
  
  ${StrTrimNewLines} $R1 "$R1"
  StrCpy $R1 "$R1 $R2"
  ${StrTrimNewLines} $R1 "$R1"
  ${StrStrAdv} $R1 "$R1" "Version " ">" ">" "0" "0" "0"
  ${StrTok} $R1 "$R1" " " "0" "1"
  StrCpy $RogueVersion $R1
  StrCpy $R0 $R1 1   ; get the major version
  StrCpy $R2 $R1 1 3 ; get the lower minor version
  StrCpy $R1 $R1 1 2 ; get the upper minor version
  IntOp $R0 $R0 * 100
  IntOp $R1 $R1 * 10
  IntOp $R0 $R0 + $R1
  IntOp $R0 $R0 + $R2
  Pop $R2
  Pop $R1
  Exch $R0
FunctionEnd

Function UninstallIfAlreadyInstalled
  Call 64bitRegistrySet
  ClearErrors
  ReadRegStr $0 ${INSTDIR_REG_ROOT} "${INSTDIR_REG_KEY}" "UninstallString"
  ${IfNot} ${Errors} ;key does exist
    ${If} ${Cmd} 'MessageBox MB_YESNO $(ALREADY_INSTALLED) IDYES' ;notice the quotes here
	  ExecWait '"$0" _?=$INSTDIR' $1
	  ${IfNot} $1 = 0
        Abort
	  ${EndIf}	  
	${Else}
	  Abort
	${EndIf}
  ${EndIf}
  Call 64bitRegistryUnset
FunctionEnd

;--------------------------------
;Descriptions

  ;Language strings
  !include ".\resources\translations_common.nsi"
  !include ".\resources\translations_${NGLIDE_VERSION}.nsi"
