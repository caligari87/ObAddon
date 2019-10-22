----------------------------------------------------------------
--  MODULE: ZDoom Ambient Sound Addon
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

ZDOOM_SOUND = {}

ZDOOM_SOUND.SOUND_IDS =
{
  ["Computer_Station"] = 16000
}

ZDOOM_SOUND.DECORATE_TEMPLATE =
{
[[Actor NAMENAMENAME IDIDID : AmbientSound
{
  +THRUACTORS
  Radius 4
  Height 4
  States
  {
    Spawn:
      TNT1 A 0
      TNT1 A 0 A_PlaySoundEx("SOUNDSOUNDSOUND", "Auto", 1)
      Goto Live

    Live:
      TNT1 A 24
      Loop
  }
}
]]
}

ZDOOM_SOUND.SNDINFO_TEMPLATE =
{
[[SNDLUMP SNDLUMP
$ambient 1 SNDLUMP point continuous 1.0
$limit
]]
}

function ZDOOM_SOUND.setup(self)
  gui.printf("\n--== Ambient Sound Addons module active ==--\n\n")

  --[[for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end]]

  PARAM.ambient_sounds = true
end

OB_MODULES["zdoom_ambient_sound"] =
{
  label = _("ZDoom: Frozsoul's Ambient Sound")

  game = "doomish"

  side = "left"

  priority = 69

  engine = { zdoom=1, gzdoom=1 }

  hooks =
  {
    setup = ZDOOM_SOUND.setup
  }

  tooltip = "Adds ambient sound to maps."
}
