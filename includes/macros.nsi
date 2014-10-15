; Useful macros
; UnselectSection GetParams FileCopy TrailingSlashHit
!define UnselectSection `!insertmacro UnselectSection`

; GetParams
 ; input, none
 ; output, top of stack (replaces, with e.g. whatever)
 ; modifies no other variables.
 
!macro GetParams
  Push $R0
  Push $R1
  Push $R2
  Push $R3
 
  StrCpy $R2 1
  StrLen $R3 $CMDLINE
 
  ;Check for quote or space
  StrCpy $R0 $CMDLINE $R2
  StrCmp $R0 '"' 0 +3
    StrCpy $R1 '"'
    Goto loop
  StrCpy $R1 " "
 
  loop:
    IntOp $R2 $R2 + 1
    StrCpy $R0 $CMDLINE 1 $R2
    StrCmp $R0 $R1 get
    StrCmp $R2 $R3 get
    Goto loop
 
  get:
    IntOp $R2 $R2 + 1
    StrCpy $R0 $CMDLINE 1 $R2
    StrCmp $R0 " " get
    StrCpy $R0 $CMDLINE "" $R2
 
  Pop $R3
  Pop $R2
  Pop $R1
  Exch $R0
!macroend
!define GetParams `!insertmacro GetParams`

;FileCopy (with renaming and directory creation)
 ; input, sourcefile destfile norename
 ; output, none
 ; modifies no other variables.
!macro FileCopy FilePath DestinationFilePath NoRename
  Push $R0
  Push $R1
  ${GetParent} `${DestinationFilePath}` $R0
  IfFileExists `$R0\*.*` +2 ;Directory exists already
  CreateDirectory `$R0`
  CopyFiles `${FilePath}` `$R0`
  IntCmp ${NoRename} 1 skiprename ; check if rename mode is enabled
    ${GetFileName} `${FilePath}` $R1
    rename `$R0\$R1` `${DestinationFilePath}`
  skiprename:
  Pop $R1
  Pop $R0
!macroend
!define FileCopy `!insertmacro FileCopy`

;TrailingSlashHit
 ; input, path
 ; output, top of stack
 ; modifies no other variables.
!macro TrailingSlashHit Path
  Push $R0
  Push $R1
  StrCpy $R1 `${Path}` `` -1 ; this gets the last char
  StrCmp $R1 `\` 0 +2 ; check if last char is '\'
    StrCpy $R0 `${Path}` -1 ; last char was '\', remove it
  Pop $R1
  Exch $R0
!macroend
!define TrailingSlashHit `!insertmacro TrailingSlashHit`
