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

gui.import("zdoom_sounds.lua")

ZDOOM_SOUND = {}

ZDOOM_SOUND.ACTOR_ID_OFFSET = 20000

ZDOOM_SOUND.TEMPLATES =
{
  DEC =
[[actor ACTORNAME IDNUM : AmbientSound
{
  +THRUACTORS
  Radius 4
  Height 4
  States
  {
    Spawn:
      TNT1 A 0
      TNT1 A 0 A_PlaySoundEx("SOUNDNAME", "Auto", 1)
      Goto Live

    Live:
      TNT1 A 24
      Loop
  }
}
]]
}

function ZDOOM_SOUND.build_lumps()
  local offset_count = ZDOOM_SOUND.ACTOR_ID_OFFSET
  local sndtable = table.deep_copy(ZDOOM_SOUND_DEFS)
  PARAM.SOUND_DEC = ""
  PARAM.SNDINFO = ""

  table.name_up(sndtable)

  for _,sound in pairs(sndtable) do
    -- build DECORATE chunk
    local dec_chunk = ZDOOM_SOUND.TEMPLATES.DEC

    dec_chunk = string.gsub(dec_chunk, "ACTORNAME", sound.name)
    dec_chunk = string.gsub(dec_chunk, "IDNUM", offset_count)
    dec_chunk = string.gsub(dec_chunk, "SOUNDNAME", sound.lump)

    PARAM.SOUND_DEC = PARAM.SOUND_DEC .. dec_chunk .. "\n\n"

    -- build SNDINFO chunk
    local sndinfo_chunk = sound.lump .. " " .. sound.lump .. "\n" ..
    sound.flags

    PARAM.SNDINFO = PARAM.SNDINFO .. sndinfo_chunk .. "\n"

    offset_count = offset_count + 1
  end
end

function ZDOOM_SOUND.setup(self)
  gui.printf("\n--== Ambient Sound Addons module active ==--\n\n")

  --[[for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end]]

  PARAM.ambient_sounds = true
  ZDOOM_SOUND.build_lumps()
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
