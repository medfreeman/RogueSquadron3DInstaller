RogueSquadron3DInstaller
========================

**Star Wars : Rogue Squadron 3D** unofficial installer

Game published in 1998 by [LucasArts](http://www.starwars.com/games-apps), developed by [Factor 5](http://www.factor5.de/)

*for Windows (All 32 and 64 bit versions from XP) and Wine*

*tested on Windows 7 Ultimate x64, Ubuntu 14.04 Trusty x64, Debian Wheezy 7.6 x64 on Wine 1.7.26 and 1.7.27, with Intel graphics HD4000, Nvidia Geforce 620m, and Geforce GTX 660Ti*

**This software is freeware. It is neither supported nor endorsed by LucasArts. Use at your own risk! Original CD required.**

Made with [nsis](http://nsis.sourceforge.net) 3.0b0

## Changelog

See [changelog.txt](changelog.txt)

## Goal

The goal is to make a 'definitive' version of the game, to allow playing without hassles on recent computers.

Since the original installer is a 16bit executable, it won't run on 64bit Windows, and Wine on recent linux kernels (>= 3.14) by default.

It has also known issues with recent graphic cards.

Since it needs a few compatibility fixes and additions, i feel it is simpler to bundle all the requirements into one package.

## Features

- Independent installer : needs the original cd, but can be run from anywhere, no need to burn a modified cdrom
- Contains update 1.21
- Detects game version to avoid unecessary updates
- Installs DirectX 9.0c
- Installs [nGlide](http://www.zeus-software.com/downloads/nglide) glide wrapper, allowing to play the game in 3dfx mode, up to 7860x4320 (although i have tested only up to 1920x1080). Automatically sets the renderer to glide.
- Patches the game to fix the Direct3D mission crash bug. The game is known to crash at the end of missions in D3D mode (albeit of limited use since the game doesn't work with a lot of cards in D3D mode)
- Sets needed compatibility flags on the executable for newer Windows (Win98 compatibility for joysticks, Administrator mode although i'm not sure last one is really needed, need testing)
- Detects Wine (to disable directx installation and unsupported file copying method, and later automatically set needed wine settings)
- Asks to run graphic settings at the end of setup
- '/nocdprompt' command line switch to avoid asking two times for the cdrom when already asked before (i.e in [PlayOnLinux](http://www.playonlinux.com/) or [Lutris](https://lutris.net/))

## Plans / Issues

- Make an 1.3 update. It was only distributed in newer rogue squadron cds, never been packaged separatly. It was made to support more graphics cards and fix a few bugs. But i don't really know the real differences between 1.21 and 1.3
- Test with older versions, I'll need to find older cds since i have only 1.2 and 1.3 cds for now
- Improve version detection. Not reliable for now. Useful for patches and fixes. For now it is made by parsing the readme file in the cd, and i already saw the formatting is not the same in the french 1.2 version cdrom. The game exe doesn't seem to have the correct version set in its headers, so i can't use this method. Perhaps a CRC on the executable / resources.
- Test with non-english versions
- Wait for the next nGlide update. The game runs perfect with latest version (1.03), but has a [mission crash bug of its own](http://www.zeus-software.com/forum/viewtopic.php?f=10&t=729), so you need to relaunch the game after each mission. Penultimate (1.02) has no bug, but the game feels laggy in every resolution. For now i'll provide two versions of the installer, one for each nGlide version. Up for you to choose. Thanks to them for their amazing work !
- Perhaps add single core affinity fix to the game exe, known to avoid a camera bug, although seems to affect only D3D mode
- Integrate Wine settings directly inside the installer, hassle free configuration on linux ! -- Managed windows Off, Decorated windows Off, Grab mouse cursor on (not sure this one is really needed), Strict draw ordering enabled (needed to avoid menu graphic scrambling), Win98 compatibility mode (for joystick support)
- Correct a bug with Wine where the installer doesn't read properly hexadecimal values from the game executable, to be able to fix the mission crash correctly (although of limited use since useful only in D3D mode)
- Minor issue : Video in menu doesn't play, i don't know if anything can be made on this one
- Optionally integrate [SweetFX](http://forums.guru3d.com/showthread.php?t=381912), to allow for shiny new (or rusty) graphics for those who want it ! It is known to work with nGlide.
- Who knows ? [Reverse engineering Rogue Squadron 3D](http://satd.sk/web/rs/)
- Update the [Wine HQ page](https://appdb.winehq.org/objectManager.php?sClass=application&iId=3258)
- Test on Mac (Wine)

## Instructions

- Download one of the two versions of the installer :
  * RS3DInstaller-0.9_nglide_102.exe is a bit laggy, but has no crash at the end of missions
  * RS3DInstaller-0.9_nglide_103.exe is smoother, but you need to relaunch the game after every mission
- Insert original cdrom
- Run the new installer
- Play the game !

## Links and thanks

- [nGlide](http://www.zeus-software.com/downloads/nglide)
- D3D Mission crash fix references
  * http://forum.pj64-emu.com/archive/index.php/t-4168.html
  * http://www.lucasforums.com/archive/index.php/t-171387.html
- [Wine](https://www.winehq.org/)
- [PlayOnLinux](http://www.playonlinux.com/)
- [Lutris](https://lutris.net/)
- [SweetFX](http://forums.guru3d.com/showthread.php?t=381912)
- [Reverse engineering Rogue Squadron 3D](http://satd.sk/web/rs/)
  * https://github.com/dpethes/rerogue
- [Markus Egger](http://www.markusegger.at/Software/Games/Rogue/Instructions.html)

## Disclaimer

**Star Wars, Rogue Squadron (3D), LucasArts, Microsoft, Windows, Windows 7, Vista, XP, and all the entities mentioned in this readme are © and/or ™ of their respective holders.**
