Name "CDRomTest"
OutFile "CDRomTest.exe"

Section
	# Enumerate CD-ROMs
	loop:
	cdrom::FindNext /NOUNLOAD .r0
	MessageBox MB_YESNO "cdrom::FindNext$\n$\n\
			Errorlevel: [$0]$\n$\n\
			Choose this CD drive for test?" IDNO loop
	cdrom::FindClose

	#Open CD-ROM door
	cdrom::Open "$0" .R0
	MessageBox MB_OK "cdrom::OpenCD$\n$\n\
			Errorlevel: [$R0]"

	# Close CD-ROM door
	cdrom::Close "$0" .R0
	MessageBox MB_OK "cdrom::CloseCD$\n$\n\
			Errorlevel: [$R0]"

	# Get CD-ROM status
	cdrom::Status "$0" .R0
	MessageBox MB_OK "cdrom::StatusCD$\n$\n\
			Errorlevel: [$R0]"

	# Get CD-ROM volume name
	cdrom::VolumeName "$0" .R0
	MessageBox MB_OK "cdrom::VolumeName$\n$\n\
			Errorlevel: [$R0]"

	# Get CD-ROM volume serial number
	cdrom::VolumeSerialNumber "$0" .R0
	MessageBox MB_OK "cdrom::VolumeSerialNumber$\n$\n\
			Errorlevel: [$R0]"
SectionEnd
