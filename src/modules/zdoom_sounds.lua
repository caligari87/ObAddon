----------------------------------------------------------------
--  ZDoom Ambient Sound Definitions
----------------------------------------------------------------
--
--  Copyright (C) 2019 MsrSgtShooterPerson
--  Copyright (C) 2019 Frozsoul
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
-------------------------------------------------------------------

ZDOOM_SOUND_DEFS =
{

Computer_Station =
{
  lump = "COMPY1"
  flags = "$ambient 6 COMPY1 point continuous 8.0"
}

Ambience_Urban_Outdoors =
{
  lump = "RAINAMB"
  flags = "$ambient 2 RAINAMB point continuous 0.6 $limit RAINAMB 1"
}

}
