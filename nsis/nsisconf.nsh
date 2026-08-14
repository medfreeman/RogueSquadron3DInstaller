Target x86-unicode
;Target x86-ansi
;Target amd64-unicode          ; Not available in official NSIS

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  !include "Sections.nsh"
  !include "LogicLib.nsh"

;--------------------------------
;Include Curl

  !AddPluginDir /x86-unicode     "NScurl\x86-unicode"
  !AddPluginDir /x86-ansi        "NScurl\x86-ansi"
  !AddPluginDir /amd64-unicode   "NScurl\amd64-unicode"
  
;--------------------------------
;Reserve Files
  
  ;If you are using solid compression, files that are required before
  ;the actual installation should be stored first in the data block,
  ;because this will make your installer start faster.
  
  !insertmacro MUI_RESERVEFILE_LANGDLL
