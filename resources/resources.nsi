!include "nsArray.nsh"

Function FileListSource
  nsArray::Set FileSourceArray "INSTALL\DSETUP.DLL"
  nsArray::Set FileSourceArray "INSTALL\DSETUP16.DLL"
  nsArray::Set FileSourceArray "INSTALL\DSETUP32.DLL"
  nsArray::Set FileSourceArray "INSTALL\INSTDX50.EXE"
  nsArray::Set FileSourceArray "INSTALL\LICENSE.TXT"
  nsArray::Set FileSourceArray "INSTALL\readme.txt"
  nsArray::Set FileSourceArray "INSTALL\REGISTER.EXE"
  nsArray::Set FileSourceArray "INSTALL\WEBSITE.EXE"
  nsArray::Set FileSourceArray "ROGUE.EXE"
  nsArray::Set FileSourceArray "ROGUE\BUNDLE.000"
  nsArray::Set FileSourceArray "ROGUE\BUNDLE.001"
  nsArray::Set FileSourceArray "ROGUE\BUNDLE.002"
  nsArray::Set FileSourceArray "ROGUE\BUNDLE.003"
  nsArray::Set FileSourceArray "ROGUE\IFORCE2.DLL"
  nsArray::Set FileSourceArray "ROGUE\ROGUE SQUADRON.EXE"
  nsArray::Set FileSourceArray "ROGUE\DATA\OUT\DATA.DAT"
  nsArray::Set FileSourceArray "ROGUE\DATA\OUT\DATA.HDR"
FunctionEnd

Function FileListDest
  nsArray::Set FileDestArray "dsetup.dll"
  nsArray::Set FileDestArray "dsetup16.dll"
  nsArray::Set FileDestArray "dsetup32.dll"
  nsArray::Set FileDestArray "instdx50.exe"
  nsArray::Set FileDestArray "License.txt"
  nsArray::Set FileDestArray "README.TXT"
  nsArray::Set FileDestArray "register.exe"
  nsArray::Set FileDestArray "Website.exe"
  nsArray::Set FileDestArray "ROGUE.EXE"
  nsArray::Set FileDestArray "BUNDLE.000"
  nsArray::Set FileDestArray "BUNDLE.001"
  nsArray::Set FileDestArray "BUNDLE.002"
  nsArray::Set FileDestArray "BUNDLE.003"
  nsArray::Set FileDestArray "IFORCE2.DLL"
  nsArray::Set FileDestArray "Rogue Squadron.EXE"
  nsArray::Set FileDestArray "DATA\OUT\DATA.DAT"
  nsArray::Set FileDestArray "DATA\OUT\DATA.HDR"
FunctionEnd

Function RegistryListKeys
  nsArray::Set RegistryKeys /key=s1  "3DSetup"
  nsArray::Set RegistryKeys /key=s2  "Analyze Path"
  nsArray::Set RegistryKeys /key=s3  "CD Path"
  nsArray::Set RegistryKeys /key=s4  "Executable"
  nsArray::Set RegistryKeys /key=s5  "Install Path"
  nsArray::Set RegistryKeys /key=d1  "InstallType"
  nsArray::Set RegistryKeys /key=s6  "JoystickID"
  nsArray::Set RegistryKeys /key=s7  "SoundCard"
  nsArray::Set RegistryKeys /key=s8  "Source Dir"
  nsArray::Set RegistryKeys /key=s9  "Source Path"
  nsArray::Set RegistryKeys /key=s10 "VDEVICE"
FunctionEnd

Function RegistryListValues
  nsArray::Set RegistryValues /key=s1  "FALSE"
  nsArray::Set RegistryValues /key=s2  "$RogueCDPath\install\SysCheck.exe"
  nsArray::Set RegistryValues /key=s3  "$RogueCDPath"
  nsArray::Set RegistryValues /key=s4  "$INSTDIR\Rogue Squadron.EXE"
  nsArray::Set RegistryValues /key=s5  "$INSTDIR"
  nsArray::Set RegistryValues /key=d1  0x00000009
  nsArray::Set RegistryValues /key=s6  "1"
  nsArray::Set RegistryValues /key=s7  "TRUE"
  nsArray::Set RegistryValues /key=s8  "$RogueCDPath\"
  nsArray::Set RegistryValues /key=s9  "$RogueCDPath"
  nsArray::Set RegistryValues /key=s10 ""
FunctionEnd