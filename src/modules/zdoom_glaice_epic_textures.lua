------------------------------------------------------------------------
--  MODULE: Glaice's Epic Textures Mod
------------------------------------------------------------------------
--
--  Copyright (C) 2019 Glaice
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
-------------------------------------------------------------------

gui.import("zdoom_glaice_materials.lua")
gui.import("zdoom_glaice_themes.lua")

GLAICE_EPIC_TEXTURES = { }

function GLAICE_EPIC_TEXTURES.setup(self)
  GLAICE_EPIC_TEXTURES.put_new_materials()
end

function GLAICE_EPIC_TEXTURES.put_new_materials()

  for skin,defs in pairs(GLAICE_MATERIALS) do
    GAME.MATERIALS[skin] = defs
  end

  for name,prob in pairs(GLAICE_TECH_FACADES) do
    GAME.THEMES.tech.facades[name] = prob
  end

  for name,prob in pairs(GLAICE_HELL_FACADES) do
    GAME.THEMES.hell.facades[name] = prob
  end

  for name,prob in pairs(GLAICE_URBAN_FACADES) do
    GAME.THEMES.urban.facades[name] = prob
  end

  for room_theme,defs in pairs(GLAICE_THEMES) do
    GAME.ROOM_THEMES[room_theme] = defs
  end

end

function GLAICE_EPIC_TEXTURES.put_the_texture_wad_in()
  local garbage_bytes = {0}
  gui.wad_add_binary_lump("TX_START",garbage_bytes)
  gui.wad_merge_sections("games/doom/data/Oblige_Epic_Texture_Set_V620.wad")
  gui.wad_add_binary_lump("TX_END",garbage_bytes)
end
----------------------------------------------------------------

OB_MODULES["glaice_epic_textures"] =
{
  label = _("ZDoom: Glaice's Epic Textures")

  side = "left"
  priority = 70

  game = "doomish"

  hooks =
  {
    setup = GLAICE_EPIC_TEXTURES.setup
    all_done = GLAICE_EPIC_TEXTURES.put_the_texture_wad_in
  }

  tooltip = "If enabled, adds textures from Glaice's Epic Textures collection."
}
