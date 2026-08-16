RogueSquadron3DInstaller
========================

**Star Wars : Rogue Squadron 3D** unofficial installer

Game published in 1998 by [LucasArts](https://www.starwars.com/games-apps), developed by [Factor 5](https://www.factor5.de/)

*for Windows (All 32 and 64 bit versions from XP) and Wine*

*tested on Windows 7 Ultimate x64, Windows 11 Home, Ubuntu 14.04 Trusty x64, Debian Wheezy 7.6 x64 on Wine 1.7.26, 1.7.27 and 1.7.28, with Intel graphics HD4000, Intel Iris Xe, Nvidia Geforce 620m, and Geforce GTX 660Ti*

**This software is freeware. It is neither supported nor endorsed by LucasArts. Use at your own risk! Original CD required.**

**The source code of this installer, excluding all files licensed or containing elements licensed by other parties, is subject to [Attribution-NonCommercial-NoDerivs 3.0 Unported (CC BY-NC-ND 3.0) license](https://creativecommons.org/licenses/by-nc-nd/3.0/).**

**You may only redistribute the original executables when done free of charge and all files are left intact (no additions, removals or alterations).**

**The only goal of this installer is to provide a means to install and play this game on newer systems, in the context of video game history preservation, and not in any way to bypass the original copy protection (which it doesn't), or favor piracy**

Made with [nsis](https://nsis.sourceforge.io/) 3.12

## Changelog

See [changelog.txt](changelog.txt)

## Goal

The goal is to make a 'definitive' version of the game, to allow playing without hassles on recent computers.

Since the original installer is a 16bit executable, it won't run on 64bit Windows, and Wine on recent linux kernels (>= 3.14) by default.

It has also known issues with recent graphic cards.

Since it needs a few compatibility fixes and additions, i feel it is simpler to bundle all the requirements into one package.

## Features

- Independent installer : needs the original cd, but can be run from anywhere, no need to burn a modified cdrom
- Contains update 1.2
- Detects game version to avoid unecessary updates
- Installs DirectX 9.0c
- Installs [nGlide](https://www.zeus-software.com/downloads/nglide) 2.10 glide wrapper, allowing to play the game in 3dfx mode, up to 7860x4320 (although i have tested only up to 2880x1800). Automatically sets the renderer to glide.
- Patches the game to fix the Direct3D mission crash bug. The game is known to crash at the end of missions in D3D mode (albeit of limited use since the game doesn't work with a lot of cards in D3D mode)
- Detects Wine (to disable directx installation and unsupported file copying method, force path)
- Asks to run graphic settings at the end of setup
- '/nocdprompt' command line switch to avoid asking two times for the cdrom when already asked before (i.e in [PlayOnLinux](https://www.playonlinux.com/) or [Lutris](https://lutris.net/))

## Plans / Issues

- Make an 1.3 update. It was only distributed in newer rogue squadron cds, never been packaged separatly. It was made to support more graphics cards and fix a few bugs. But i don't really know the real differences between 1.2 and 1.3
- Test with non-english versions
- ~~Wait for the next nGlide update. The game runs perfect with latest version (1.03), but has a [mission crash bug of its own](https://www.zeus-software.com/forum/viewtopic.php?f=10&t=729), so you need to relaunch the game after each mission. Penultimate (1.02) has no bug, but the game feels laggy in every resolution. For now i'll provide two versions of the installer, one for each nGlide version. Up for you to choose. Thanks to them for their amazing work !~~
- Integrate [Wingman](https://github.com/horkrux/wingman) to fix a list of known bugs such as the camera bug!
- Support Steam and Gog versions of the game
- Optionally integrate [SweetFX](https://forums.guru3d.com/showthread.php?t=381912), to allow for shiny new (or rusty) graphics for those who want it ! It is known to work with nGlide.
- Who knows? [Reverse engineering Rogue Squadron 3D](https://satd.sk/web/rs/)
- Update the [Wine HQ page](https://appdb.winehq.org/objectManager.php?sClass=application&iId=3258)
- Test on Mac (Wine)
- Make the menu video work (by properly configuring LucasArts SANM fourcc, not sure if possible)

## Dependencies

- NSIS 3.12 : [Download page](https://nsis.sourceforge.io/Download) / [Direct link](https://prdownloads.sourceforge.net/nsis/nsis-3.12-setup.exe?download)

- NSIS Plugins and Headers (also available in the nsis folder in this repository, merge the contents of this folder to nsis installation folder):
  * [AccessControl plug-in](https://nsis.sourceforge.net/AccessControl_plug-in) **[v.1.0.8.1](https://nsis.sourceforge.net/mediawiki/images/4/4a/AccessControl.zip)**:

    Written by [Mathias Hasselmann](https://taschenorakel.de/mathias/)
    
    NSIS-Unicode port by [Olivier Marcoux](https://wizou.fr/)
    
    Major changes by [Afrow UK](https://www.afrowsoft.co.uk/)
    
    Win95/WinNT4 support and bugfixes by [Anders](https://nsis.sourceforge.net/User:Anders)
    
  * [nsArray plug-in](https://nsis.sourceforge.net/Arrays_in_NSIS) **[v.1.1.1.6](https://nsis.sourceforge.net/mediawiki/images/9/97/NsArray.zip)**:

    Written by [Afrow UK](https://www.afrowsoft.co.uk/)
    
  * [NsisFile plug-in](https://nsis.sourceforge.net/NsisFile_plug-in) **[v.1.0](http://wiz0u.free.fr/prog/nsisFile/latest.php)**:

    Written by [Wizou](https://nsis.sourceforge.net/User:Wizou)

  * [NScurl plug-in](https://github.com/negrutiu/nsis-nscurl)

    Written by [Marius Negruțiu](https://github.com/negrutiu)
    
  * [Advanced Uninstall Log NSIS Header](https://nsis.sourceforge.net/Advanced_Uninstall_Log_NSIS_Header) **[Download](https://nsis.sourceforge.net/mediawiki/images/1/12/Advunlog.zip)**:
    
    Written by [Red Wine](https://nsis.sourceforge.net/User:Red_Wine)

    **This header needs a fix or an error will be triggered during compilation** : 
    
    l.428 change
    ```!undef ID ${__LINE__}```
    to
    ```!undef ID```
      
## Compilation

- Clone this repository or download and extract archive
- Right-click on RS3DInstaller.nsi, then click 'Compile NSIS Script'
- Run the resulting executable, et voila !

## Installation

- Download the installer [RS3DInstaller-0.97.exe](https://github.com/medfreeman/RogueSquadron3DInstaller/raw/master/RS3DInstaller-0.97.exe)
- Insert original cdrom
- Run the new installer
- Play the game !

## Links and thanks

- [development PlayOnLinux Rogue scripts](https://github.com/medfreeman/playonlinux/tree/master/RogueSquadron3D/WIP)
  * [Testing game page](https://www.playonlinux.com/en/app-2277-Star_Wars__Rogue_Squadron_3D.html)
- [nGlide](https://www.zeus-software.com/downloads/nglide)
  * [Bug fix request thread](https://www.zeus-software.com/forum/viewtopic.php?f=10&t=729)
- [nsis](https://nsis.sourceforge.net)
- D3D Mission crash fix references
  * https://forum.pj64-emu.com/archive/index.php/t-4168.html
  * https://www.lucasforums.com/archive/index.php/t-171387.html
- [Wine](https://www.winehq.org/)
  * [Wine game page](https://appdb.winehq.org/objectManager.php?sClass=application&iId=3258)
- [PlayOnLinux](https://www.playonlinux.com/)
- [Lutris](https://lutris.net/)
- [SweetFX](https://forums.guru3d.com/showthread.php?t=381912)
- [Reverse engineering Rogue Squadron 3D](https://satd.sk/web/rs/)
  * [Tools](https://github.com/dpethes/rerogue)
- [Markus Egger](https://www.markusegger.at/Software/Games/Rogue/Instructions.html)

## Disclaimer

**Star Wars, Rogue Squadron (3D), LucasArts, Microsoft, Windows, Windows 7, Vista, XP, DirectX and all the entities mentioned in this readme are ©, ® and/or ™ of their respective holders.**

**The file gfx/icon/rogue.ico is the original rogue squadron 3D icon, © LucasArts**

**The files gfx/header/rogue.bmp and gfx/welcome/rogue.bmp were made by myself, and contain Rogue Squadron 3D logo © LucasArts**

**The file assets/update/rogueupd12.exe is the original rogue squadron 3D update v.1.2 © LucasArts**

**The file license/LICENSE.TXT is the original game license, and is property of LucasArts**

**This installer source code is available solely to prove that there's no intent to include malicious software inside this installer**
