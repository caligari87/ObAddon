![ObAddon Title Graphic](https://i.imgur.com/InGFHSX.png)

# ObAddon

A repository of community-built prefabs and other enhancements for [Oblige 7.70](http://oblige.sourceforge.net/).

## Community
Currently, the Oblige community resides on an unofficial Discord server since the official forums were shut down. You may join us at the following link:

[**Unofficial Oblige Discord**](https://discord.gg/AFws8ty)

## Download
We are in the process of transitioning our development process! For now, new manual builds are being posted every couple days on the Discord server linked above. If the build linked below is very old, please check the `#readme` channel on the server to see if a newer build is available.

[**ObAddon-2-17-19.pk3**](https://cdn.discordapp.com/attachments/405211037344989184/546694387414073347/ObAddon-2-17-19.pk3)

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

## What this adds

### Prefabs

Adds a HUGE library of prefabricates to decorate maps, a collection spanning months of work including decorative walls, doodads, and functional pieces such as stairs, joiners, teleporters, start rooms, joining pieces, and lifts.

### Extensions

* Procedural Gotchas! Massive procedurally generated arenas with increased challenge (and bosses), with customizable difficulty.

* PsYcHeDeLiC theme.

* Layout Absurdification! This module attempts to create more interesting maps by forcing certain shape rules in the grammar set to be much more prominent than normal.
  
* Toggle for turning prebuilt levels on or off.
  
* Exposed parameters for the Sky Generator such as day/night and mountain settings. Play an entire generated WAD at night mood... for the mood.

* Expanded controls for monster setting, such as trap style, monster mix-it-up fine tune, and monster placement inside secrets.

* LOTS and LOTS of new shape rules such as new steepness shapes, new liquid shapes, new shape of all sorts. Above 200% more shapes than vanilla! (or at least 200% new lines...)

* Prefab Control module - can control the amount of detail desired for the map, for your visual preference or for stability.

* Expanded prefab error reporting - you too, can make your own fabs and test them out.

* Rudimentary support for prefabricated ZDoom 3D skyboxes.

* New vista types, such as bottomless pits (ZDoom only) and liquid oceans.

* Buildings with windows that open into vistas.

* Experimental "Stretched-Out" size tries to make the map stretchy and longitudinal.

* New control to select ceiling and floor sink styles: curved and flowy, or sharp and angular.

AND MORE TO COME!

***

[![Creative Commons License](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/)  
This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/)
