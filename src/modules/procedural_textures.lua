------------------------------------------------------------------------
--  MODULE: Procedural Texture Generator
------------------------------------------------------------------------
--
--  Copyright (C) 2019 MsrSgtShooterPerson
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
------------------------------------------------------------------------

-- WARNING: This is not finished yet. If you are interested in adding
-- patch definitions below, don't - the system is still likely to change.

PROC_TEX = { }

PROC_TEX.TEXTURE_SCOPE_CHOICES =
{
  "vanilla", _("Vanilla Only"),
  "epic", _("Include Epic Textures"),
}

PROC_TEX.FLATS =
{

}

PROC_TEX.WALLS =
{
  -- base category: patches that don't have much details
  WALL00_1 = { t = "base", c = "gray"}
  WALL00_7 = { t = "base", c = "brown"}
  WALL03_4 = { t = "base", c = "brown"}
  W13_1 = { t = "base", c = "silver"}
  W31_1 = { t = "base", c = "gray"}
  W32_1 = { t = "base", c = "gray"} -- dark gray strip with cave-in bend
  W32_4 = { t = "base", c = "gray"} -- dark gray strip
  W33_5 = { t = "base", c = "gray"} -- dark gray inset box inside
  WALL62_1 = { t = "base", c = "brown"}
  WALL62_2 = { t = "base", c = "green"}
  AG128_1 = { t = "base", c = "silver"}

  SW11_1 = { t = "base", c = "grey"}
  SW11_4 = { t = "base", c = "brown"}
  SW12_1 = { t = "base", c = "green"}
  WLA128_1 = { t = "base", c = "green"}
  SUPPORT2 = { t = "base", c = "gray"}

  COMP03_1 = { t = "base", c = "blue"}
  COMP03_4 = { t = "base", c = "black"}
  COMP03_8 = { t = "base", c = "black"}

  WALL42_3 = { t = "base", c = "brown"} --SUPPORT3
  WALL47_1 = { t = "base", c = "brown"} --METAL

  -- tech
  WALL02_2 = { t = "tech", c = "brown"}
  WALL03_7 = { t = "tech", c = "gray"} -- hex
  W17_1 = { t = "tech", c = "gray"} -- machine doohickies
  W94_1 = { t = "tech", c = "brown"} -- machine doohickies

  TP2_1 = { t = "tech", c = "brown"} --pipez
  TP2_2 = { t = "tech", c = "brown"}

  -- brick
  W28_5 = { t = "brick" , c = "gray" }

  -- wood
  WALL40_1 = { t = "wood", c = "brown"}

}

function PROC_TEX.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

function generate_textures()
end

----------------------------------------------------------------

--[[OB_MODULES["proc_tex"] =
{
  label = _("Procedural Textures")

  side = "left"
  priority = 69.5

  game = "doomish"

  hooks =
  {
    setup = PROC_TEX.setup
    get_levels = PROC_TEX.generate_textures
  }

  options =
  {
    texture_scope =
    {
      label = _("Scope")
      choices = PROC_TEX.TEXTURE_SCOPE_CHOICES
      tooltip = "That one guy"
      default = "vanilla"
    }
  }
}]]
