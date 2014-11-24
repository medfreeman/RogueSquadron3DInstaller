!include "LogicLib.nsh"

Function RunningOnWine
  Push $R0
  Push $R1
  ClearErrors
  EnumRegKey $R1 HKCU "Software\Wine" 0
  ${If} ${Errors} ;key does not exist
    StrCpy $R0 0
  ${Else}
    StrCpy $R0 1
  ${EndIf}
  Pop $R1
  Exch $R0
FunctionEnd

Function GetnGlideVersion
  Push $R0
  Push $R1
  ClearErrors
  EnumRegKey $R1 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\nGlide" 0
  ${If} ${Errors} ;key does not exist
    StrCpy $R0 0
  ${Else}
    ReadRegStr $R1 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\nGlide" "DisplayVersion"
    ${If} ${Errors}
      StrCpy $R0 0
    ${Else}
      StrCpy $R0 $R1 1    ; get the major version
      StrCpy $R1 $R1 2 2    ; get the minor version
      IntOp $R0 $R0 * 100
      IntOp $R0 $R0 + $R1
    ${EndIf}
  ${EndIf}
  Pop $R1
  Exch $R0
FunctionEnd

Function SetnGlideDefaults
  Push $R0
  Call 64bitRegistrySet
  ClearErrors
  WriteRegStr HKCU "Software\Zeus Software\nGlide" "Aspect" "0"
  WriteRegStr HKCU "Software\Zeus Software\nGlide" "Gamma" "5"
  WriteRegStr HKCU "Software\Zeus Software\nGlide" "Refresh" "0"
  WriteRegStr HKCU "Software\Zeus Software\nGlide" "Resolution" "1"
  WriteRegStr HKCU "Software\Zeus Software\nGlide" "Splash" "0"
  WriteRegStr HKCU "Software\Zeus Software\nGlide" "Vsync" "1"
  Call 64bitRegistryUnset
  Pop $R0
FunctionEnd

Function GetDXVersion
  Call 64bitRegistrySet
  
  Push $0
  Push $1
  
  ClearErrors
  ReadRegStr $0 HKLM "Software\Microsoft\DirectX" "Version"
  IfErrors noDirectX
  
  StrCpy $1 $0 2 5    ; get the minor version
  StrCpy $0 $0 2 2    ; get the major version
  IntOp $0 $0 * 100   ; $0 = major * 100 + minor
  IntOp $0 $0 + $1
  Goto done
  
  noDirectX:
    StrCpy $0 0
  
  done:
    Pop $1
    Exch $0

  Call 64bitRegistryUnset
FunctionEnd

; Create the shared function.
!macro 64BITREGISTRY un
  Function ${un}64bitRegistrySet
    !include "x64.nsh"
    ;64bit registry
    ${If} ${RunningX64}
      SetRegView 64 
    ${EndIf}
  FunctionEnd
  
  Function ${un}64bitRegistryUnset
    !include "x64.nsh"
    ${If} ${RunningX64}
      SetRegView 32 
    ${EndIf}
  FunctionEnd
!macroend

; Insert function as an installer and uninstaller function.
!insertmacro 64BITREGISTRY ""
!insertmacro 64BITREGISTRY "un."