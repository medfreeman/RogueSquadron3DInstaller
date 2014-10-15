; nsisFile - Sample script

!ifndef TARGETDIR
!define TARGETDIR "..\bin"
!endif

!addplugindir "${TARGETDIR}"

Name "Sample nsisFile"
OutFile "Sample.exe"
ShowInstDetails show	

Section "Main program"
	Delete "Temp.tmp"
	FileOpen $0 "Temp.tmp" "a"
	FileWrite $0 "Test-Atotorney"
	FileSeek $0 -4 END
	nsisFile::FileReadBytes $0 5
	Pop $1
	DetailPrint 'read: "$1" = "726E6579"'
	FileSeek $0 1
	nsisFile::FileWriteBytes $0 "6f 746F d-u-m-b"
	Pop $1
	DetailPrint 'written: $1 = 3'
	FileSeek $0 0
	nsisFile::FileFindBytes $0 "42" -1
	Pop $1
	DetailPrint 'searching "B": $1 = -1'
	FileSeek $0 0
	nsisFile::HexToBin "746f726e"
	Pop $1
	DetailPrint 'HexToBin: "$1" = "torn"'
	nsisFile::BinToHex $1
	Pop $1
	DetailPrint 'BinToHex: "$1" = "746F726E"'
	nsisFile::FileFindBytes $0 "$1" -1
	Pop $1  ; should be 1
	DetailPrint 'searching "torn": $1 = 8'
	nsisFile::FileTruncate $0
	FileClose $0
SectionEnd
