![ObAddon Title Graphic](https://i.imgur.com/SK5gc0r.png)

# ObAddon

A repository of new features, enhancements, and an extensive library of community-built prefabs for [Oblige 7.70](http://oblige.sourceforge.net/).

New: For Windows x64 users, [**a win64 executable for Oblige 7.70**](https://forum.zdoom.org/viewtopic.php?f=44&t=64879) is now available which addresses memory issues in creating large megawads, boosts performance, and prompts the user in taskbar when map building is complete.  Credit to Sumwunn for this!

## Community
Currently, the Oblige community resides on an unofficial Discord server since the official forums were shut down. You may join us at the following link:

[**Unofficial Oblige Discord**](https://discord.gg/dfqCt9v)

## Download

Please visit our [**Latest Release**](https://github.com/caligari87/ObAddon/releases/latest) to download the current build of ObAddon. Older releases may be found [here](https://github.com/caligari87/ObAddon/releases) if required.

## Instructions

Your `addons/` folder location may vary depending on your operating system and whether Oblige is installed system-wide.

* Download ObAddon via the link above.
* Place `ObAddon.pk3` file into your Oblige `addons/` folder
* Open Oblige and go to Menu > Addons
* Place a checkmark next to the addon `ObAddon.pk3` to enable it.
* Restart Oblige.

## Building

If you wish to try our "bleeding edge" code, you can build the addon yourself.

**Automated** (for environments with `make` available such as Linux):

* `git clone https://github.com/caligari87/ObAddon ObAddon`
* `cd ObAddon`
* `cd scripts`
* `make`
* The file `ObAddon.pk3` will appear in a new `build/` folder. This may be imported to your current Oblige installation as described in the **Instructions** section above.

**Manually:**

* Download or clone the repo as desired.
* Open the `src/` folder.
* Add the contents of the folder to a compressed / zipped folder named ObAddon.
* Rename the `.zip` file/folder to `.pk3`.
* `ObAddon.pk3` may be imported to your current Oblige installation as described in the **Instructions** section above.

## Features

### Prefabs

Adds a HUGE library of prefabricates to decorate maps, a collection spanning months of work including decorative walls, doodads, and functional pieces such as stairs, joiners, teleporters, start rooms, joining pieces, and lifts.

### Extensions

#### New Level Layouts!
* Streets mode! Create a map composed of largely outdoor street-like zones from which rooms (buildings!) will sprout from!

* Linear mode! Don't want to get lost navigating through a maze of doors? It's only a walk forward from start to finish without branches!

* Procedural Gotchas! Massive procedurally generated arenas with increased challenge (and bosses), with customizable difficulty.

* Layout Absurdification! A module that attempts to create more interesting maps by forcing certain shape rules in the grammar set to be much more prominent!

* LOTS and LOTS of new shape rules such as new steepness shapes, new liquid shapes, new shape of all sorts. Above 200% more shapes than vanilla! (or at least 200% new lines...)

#### New Architectural Elements!
* Beams! Just like Oblige 3.x and 6.x, beams have a chance of appearing between borders of varying ceilings, floors and liquid zones!

* Naturalistic parks! Parks can now have natural-looking cliffs!

* Porches/gazebos! Be careful, one might be out to get you!

* New vista types, such as bottomless pits, gradual falling cliffs, and oceans!

* Buildings with windows that open into vistas!

* New control to select ceiling and floor sink styles: curved and flowy, or sharp and angular.

#### New Cosmetic Features!
* PsYcHeDeLiC theme. VAYP NAYSH, YA'LL.

* Glaice's Epic Textures mod, now integrated from Oblige 6.x, including new textures such as ObAddon banners and vending machines!
* * Also includes Enviornment Themes system, allowing levels to be desert-ish or snowy!
* * Includes Custom Trees, available in ZScript and ACS/Decorate format! (ACS/Decorate version still needs fixing)

* Quite literally exploded name generator with lots of new words and combinations!

#### ZDoom Stuff!
* ZDoom Story Generator! Make Doomguy do something different each time you play and give yourself something to read in-between your demon face-blasting!

* ZDoom fog! With the ZDoom Special Addons module, you can now get parametric fog (based on the Sky Generator inputs) within the levels!

* Glorious 3D multi-sector skyboxes!

* Custom quit messages and intermission pictures!

* Episode selection?! **In my Doom 2 WAD?!**

#### Expanded Fine Tune!
* Exposed parameters for the Sky Generator such as day/night and mountain settings. Play an entire generated WAD at night mood... for the mood.

* Toggle for turning prebuilt levels on or off!
  
* Expanded controls for monster setting, such as trap style, monster mix-it-up fine tune, and monster placement inside secrets and traps.

* Change global light setting with Brightness Offset control!

#### Expanded Debug Control
* Live Growth Minimap! Watch Oblige build a level in front of you - just like a Japanese teppanyaki chef!

* Prefab Control module - can control the amount of detail desired for the map, for your visual preference or for stability.

* Expanded prefab error reporting - you too, can make your own fabs and test them out.

#### Lots and lots and lots of bugfixes from base Oblige 7.7!

AND MORE TO COME!

***

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
