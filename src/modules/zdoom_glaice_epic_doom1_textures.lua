------------------------------------------------------------------------
--  MODULE: Glaice's Epic Textures Mod (Doom/Ultimate Doom)
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

gui.import("zdoom_glaice_doom1_materials.lua")
gui.import("zdoom_glaice_doom1_themes.lua")

GLAICE_DOOM1_EPIC_TEXTURES = { }

GLAICE_DOOM1_EPIC_TEXTURES.YES_NO =
{
  "yes", _("Yes"),
  "no",  _("No"),
}

function GLAICE_DOOM1_EPIC_TEXTURES.setup(self)
  GLAICE_DOOM1_EPIC_TEXTURES.put_new_materials()
  PARAM.epic_textures_activated = true

  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end

end

function GLAICE_DOOM1_EPIC_TEXTURES.put_new_materials()

  -- put the custom material definitions in the materials table!!!
  for skin,defs in pairs(GLAICE_DOOM1_MATERIALS) do
    GAME.MATERIALS[skin] = defs
  end

  for skin,defs in pairs(GLAICE_DOOM1_LIQUIDS) do
    GAME.LIQUIDS[skin] = defs
  end

  -- put the custom theme definitions in the themes table!!!
  -- LIQUIDZ
  for name,prob in pairs(GLAICE_DOOM1_TECH_LIQUIDS) do
    GAME.THEMES.tech.liquids[name] = prob
  end


  for name,prob in pairs(GLAICE_DOOM1_DEIMOS_LIQUIDS) do
    GAME.THEMES.deimos.liquids[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_HELL_LIQUIDS) do
    GAME.THEMES.hell.liquids[name] = prob
  end

  -- FACADES
  for name,prob in pairs(GLAICE_DOOM1_TECH_FACADES) do
    GAME.THEMES.tech.facades[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_HELL_FACADES) do
    GAME.THEMES.hell.facades[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_FLESH_FACADES) do
    GAME.THEMES.flesh.facades[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_DEIMOS_FACADES) do
    GAME.THEMES.deimos.facades[name] = prob
  end

  for room_theme,defs in pairs(GLAICE_DOOM1_THEMES) do
    GAME.ROOM_THEMES[room_theme] = defs
  end

  -- NATURALS
  for name,prob in pairs(GLAICE_DOOM1_TECH_NATURALS) do
    GAME.ROOM_THEMES.tech_Outdoors.naturals[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_DEIMOS_NATURALS) do
    GAME.ROOM_THEMES.deimos_Outdoors.naturals[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_HELL_NATURALS) do
    GAME.ROOM_THEMES.hell_Outdoors.naturals[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_FLESH_NATURALS) do
    GAME.ROOM_THEMES.flesh_Outdoors.naturals[name] = prob
  end

  -- SINKS
  for name,def in pairs(GLAICE_DOOM1_SINK_DEFS) do
    GAME.SINKS[name] = def
  end

  for name,prob in pairs(GLAICE_DOOM1_TECH_CEILING_SINKS) do
    GAME.THEMES.tech.ceiling_sinks[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_DEIMOS_CEILING_SINKS) do
    GAME.THEMES.deimos.ceiling_sinks[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_HELL_CEILING_SINKS) do
    GAME.THEMES.hell.ceiling_sinks[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_FLESH_CEILING_SINKS) do
    GAME.THEMES.flesh.ceiling_sinks[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_TECH_FLOOR_SINKS) do
    GAME.THEMES.tech.floor_sinks[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_DEIMOS_FLOOR_SINKS) do
    GAME.THEMES.deimos.floor_sinks[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_HELL_FLOOR_SINKS) do
    GAME.THEMES.hell.floor_sinks[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_FLESH_FLOOR_SINKS) do
    GAME.THEMES.flesh.floor_sinks[name] = prob
  end

  --new scenic fences feature
  for name,prob in pairs(GLAICE_DOOM1_TECH_SCENIC_FENCES) do
    GAME.THEMES.tech.scenic_fence[name] = prob
  end

  for name,prob in pairs(GLAICE_DEIMOS_SCENIC_FENCES) do
    GAME.THEMES.deimos.scenic_fence[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_HELL_SCENIC_FENCES) do
    GAME.THEMES.hell.scenic_fence[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_FLESH_SCENIC_FENCES) do
    GAME.THEMES.flesh.scenic_fence[name] = prob
  end

  -- inserts for group walls
  for name,prob in pairs(GLAICE_DOOM1_TECH_WALL_GROUPS) do
    GAME.THEMES.tech.wall_groups[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_DEIMOS_WALL_GROUPS) do
    GAME.THEMES.deimos.wall_groups[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_HELL_WALL_GROUPS) do
    GAME.THEMES.hell.wall_groups[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_FLESH_WALL_GROUPS) do
    GAME.THEMES.flesh.wall_groups[name] = prob
  end

  -- inserts for window groups
  for name,prob in pairs(GLAICE_DOOM1_TECH_WINDOW_GROUPS) do
    GAME.THEMES.tech.window_groups[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_DEIMOS_WINDOW_GROUPS) do
    GAME.THEMES.deimos.window_groups[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_HELL_WINDOW_GROUPS) do
    GAME.THEMES.hell.window_groups[name] = prob
  end

  for name,prob in pairs(GLAICE_DOOM1_FLESH_WINDOW_GROUPS) do
    GAME.THEMES.flesh.window_groups[name] = prob
  end

  --hack for the street textures
  GAME.SINKS.floor_streets.trim_mat = "WARN1"
end

function GLAICE_DOOM1_EPIC_TEXTURES.put_the_texture_wad_in()
  local glaice_tex_wad_file = "games/doom/data/Oblige_Epic_Texture_Set_V620.wad"
  if PARAM.include_package != "no" then
    gui.wad_transfer_lump(glaice_tex_wad_file, "ANIMDEFS", "ANIMDEFS")
    gui.wad_transfer_lump(glaice_tex_wad_file, "CREDITS", "CREDITS")
    gui.wad_merge_sections(glaice_tex_wad_file)
  end
end
----------------------------------------------------------------

OB_MODULES["glaice_doom1_epic_textures"] =
{
  label = _("ZDoom: Glaice's Epic Textures (Doom)")

  side = "left"
  priority = 60

  game = "doomish"

  hooks =
  {
    setup = GLAICE_DOOM1_EPIC_TEXTURES.setup
    all_done = GLAICE_DOOM1_EPIC_TEXTURES.put_the_texture_wad_in
  }

  tooltip = "If enabled, adds textures from Glaice's Epic Textures collection, which also includes a few new Epic-texture exclusive prefabs."

  options =
  {
    include_package =
    {
      name = "include_package"
      label = _("Texture WAD Merge")
      choices = GLAICE_DOOM1_EPIC_TEXTURES.YES_NO
      default = "yes"
      tooltip =
        "Allows the trimming down of resulting WAD by not merging the Epic texture WAD.\n\n" ..
        "This will require you to extract and load up the WAD manually in your preferred sourceport installation.\n\n" ..
        "This is the preferrable option for multiplayer situations and server owners and have each client obtain a copy of the texture pack instead.\n"
    }
  }
}