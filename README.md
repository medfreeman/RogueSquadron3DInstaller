RogueSquadron3DInstaller
========================

**Star Wars : Rogue Squadron 3D** unofficial installer

Game published in 1998 by [LucasArts](http://www.starwars.com/games-apps), developed by [Factor 5](http://www.factor5.de/)

*for Windows (All 32 and 64 bit versions from XP) and Wine*

tested on Windows 7 Ultimate x64, Wine 1.7.26 and 1.7.27, with Intel graphics HD4000, and Nvidia Geforce 620m

This software is freeware. It is neither supported nor endorsed by LucasArts. Use at your own risk! Original CD required.

Made with [nsis](http://nsis.sourceforge.net) 3.0b0

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
- Detects wine (to disable directx installation and unsupported file copying method, and later automatically set needed wine settings)
- Asks to run graphic settings at the end of setup

## Plans / Issues

## Instructions

## Links
