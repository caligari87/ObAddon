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

gui.import("zdoom_glaice_doom1_materials.lua")
gui.import("zdoom_glaice_doom1_themes.lua")

GLAICE_EPIC_TEXTURES = { }

GLAICE_EPIC_TEXTURES.YES_NO =
{
  "yes", _("Yes"),
  "no",  _("No"),
}

GLAICE_EPIC_TEXTURES.SOUCEPORT_CHOICES =
{
  "zs",       _("ZScript"),
  "decorate", _("ACS-Decorate"),
  "no",       _("No"),
}

GLAICE_EPIC_TEXTURES.ENVIRONMENT_THEME_CHOICES =
{
  "random",    _("Random"),
  "mixed",     _("A Bit Mixed"),
  "snowish",   _("Snow-ish"),
  "desertish", _("Desert-ish"),
  "snow",      _("Always Snow"),
  "desert",    _("Always Desert"),
  "no",        _("No"),
}

function GLAICE_EPIC_TEXTURES.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end

  GLAICE_EPIC_TEXTURES.put_new_materials()
  PARAM.epic_textures_activated = true
end

function GLAICE_EPIC_TEXTURES.create_environment_themes()
  gui.printf("OH MAN I AM NOT GOOD WITH COMPUTER PLZ TO HALP\n");
end

function GLAICE_EPIC_TEXTURES.put_new_materials()

  if OB_CONFIG.game == "doom2" then
    -- put the custom material definitions in the materials table!!!
    for skin,defs in pairs(GLAICE_MATERIALS) do
      GAME.MATERIALS[skin] = defs
    end

    for skin,defs in pairs(GLAICE_LIQUIDS) do
      GAME.LIQUIDS[skin] = defs
    end

    -- put the custom theme definitions in the themes table!!!
    -- LIQUIDZ
    if PARAM.custom_liquids != "no" then
      for name,prob in pairs(GLAICE_TECH_LIQUIDS) do
        GAME.THEMES.tech.liquids[name] = prob
      end

      for name,prob in pairs(GLAICE_URBAN_LIQUIDS) do
        GAME.THEMES.urban.liquids[name] = prob
      end

      for name,prob in pairs(GLAICE_HELL_LIQUIDS) do
        GAME.THEMES.hell.liquids[name] = prob
      end
    end

    -- FACADES
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

    -- NATURALS
    for name,prob in pairs(GLAICE_TECH_NATURALS) do
      GAME.ROOM_THEMES.tech_Outdoors_generic.naturals[name] = prob
    end

    for name,prob in pairs(GLAICE_URBAN_NATURALS) do
      GAME.ROOM_THEMES.urban_Outdoors_generic.naturals[name] = prob
    end

    for name,prob in pairs(GLAICE_HELL_NATURALS) do
      GAME.ROOM_THEMES.hell_Outdoors_generic.naturals[name] = prob
    end

    -- SINKS
    for name,def in pairs(GLAICE_SINK_DEFS) do
      GAME.SINKS[name] = def
    end

    for name,prob in pairs(GLAICE_TECH_CEILING_SINKS) do
      GAME.THEMES.tech.ceiling_sinks[name] = prob
    end

    for name,prob in pairs(GLAICE_URBAN_CEILING_SINKS) do
      GAME.THEMES.urban.ceiling_sinks[name] = prob
    end

    for name,prob in pairs(GLAICE_HELL_CEILING_SINKS) do
      GAME.THEMES.hell.ceiling_sinks[name] = prob
    end

    for name,prob in pairs(GLAICE_TECH_FLOOR_SINKS) do
      GAME.THEMES.tech.floor_sinks[name] = prob
    end

    for name,prob in pairs(GLAICE_URBAN_FLOOR_SINKS) do
      GAME.THEMES.urban.floor_sinks[name] = prob
    end

    for name,prob in pairs(GLAICE_HELL_FLOOR_SINKS) do
      GAME.THEMES.hell.floor_sinks[name] = prob
    end

    --new scenic fences feature
    for name,prob in pairs(GLAICE_TECH_SCENIC_FENCES) do
      GAME.THEMES.tech.scenic_fence[name] = prob
    end

    for name,prob in pairs(GLAICE_URBAN_SCENIC_FENCES) do
      GAME.THEMES.urban.scenic_fence[name] = prob
    end

    for name,prob in pairs(GLAICE_HELL_SCENIC_FENCES) do
      GAME.THEMES.hell.scenic_fence[name] = prob
    end

    -- inserts for group walls
    for name,prob in pairs(GLAICE_TECH_WALL_GROUPS) do
      GAME.THEMES.tech.wall_groups[name] = prob
    end

    for name,prob in pairs(GLAICE_URBAN_WALL_GROUPS) do
      GAME.THEMES.urban.wall_groups[name] = prob
    end

    for name,prob in pairs(GLAICE_HELL_WALL_GROUPS) do
      GAME.THEMES.hell.wall_groups[name] = prob
    end

    -- inserts for window groups
    for name,prob in pairs(GLAICE_TECH_WINDOW_GROUPS) do
      GAME.THEMES.tech.window_groups[name] = prob
    end

    for name,prob in pairs(GLAICE_URBAN_WINDOW_GROUPS) do
      GAME.THEMES.urban.window_groups[name] = prob
    end

    for name,prob in pairs(GLAICE_HELL_WINDOW_GROUPS) do
      GAME.THEMES.hell.window_groups[name] = prob
    end

    --hack for the street textures
    GAME.SINKS.floor_streets.trim_mat = "WARN1"
  end

  if OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
    -- put the custom material definitions in the materials table!!!
    for skin,defs in pairs(GLAICE_DOOM1_MATERIALS) do
      GAME.MATERIALS[skin] = defs
    end

    for skin,defs in pairs(GLAICE_DOOM1_LIQUIDS) do
      GAME.LIQUIDS[skin] = defs
    end

    -- put the custom theme definitions in the themes table!!!
    -- LIQUIDZ
    if PARAM.custom_liquids != "yes" then
      for name,prob in pairs(GLAICE_DOOM1_TECH_LIQUIDS) do
        GAME.THEMES.tech.liquids[name] = prob
      end

      for name,prob in pairs(GLAICE_DOOM1_DEIMOS_LIQUIDS) do
        GAME.THEMES.deimos.liquids[name] = prob
      end

      for name,prob in pairs(GLAICE_DOOM1_HELL_LIQUIDS) do
        GAME.THEMES.hell.liquids[name] = prob
      end
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

    for name,prob in pairs(GLAICE_DOOM1_DEIMOS_SCENIC_FENCES) do
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
end

function GLAICE_EPIC_TEXTURES.put_the_texture_wad_in()
  local wad_file = "games/doom/data/Oblige_Epic_Texture_Set_V620.wad"
  if PARAM.include_package != "no" then
    gui.wad_transfer_lump(wad_file, "ANIMDEFS", "ANIMDEFS")
    gui.wad_transfer_lump(wad_file, "CREDITS", "CREDITS")
    gui.wad_merge_sections(wad_file)
    wad_file = "games/doom/data/vending_machine_textures.wad"
    gui.wad_merge_sections(wad_file)

    -- wad_merge_sections currently does not support merging HI_START
    -- and HI_END... *sigh*
    gui.wad_add_binary_lump("HI_START",{})
    gui.wad_insert_file("games/doom/data/OBVNMCH1.png", "OBVNMCH1")
    gui.wad_insert_file("games/doom/data/OBVNMCH2.png", "OBVNMCH2")
    gui.wad_insert_file("games/doom/data/OBVNMCH3.png", "OBVNMCH3")
    gui.wad_insert_file("games/doom/data/OBVNMCH4.png", "OBVNMCH4")
    gui.wad_insert_file("games/doom/data/OBVNMCH5.png", "OBVNMCH5")
    gui.wad_add_binary_lump("HI_END",{})
  end

  if PARAM.custom_trees != "no" then
    gui.wad_merge_sections("modules/zdoom_internal_scripts/ObAddon_trees.wad")
    if PARAM.custom_trees == "zs" then
      gui.wad_insert_file("modules/zdoom_internal_scripts/ZSCRIPT.txt", "ZSCRIPT")
    elseif PARAM.custom_trees == "decorate" then
      gui.wad_insert_file("modules/zdoom_internal_scripts/DECORATE.txt", "DECORATE")
      gui.wad_insert_file("modules/zdoom_internal_scripts/LOADACS.txt", "LOADACS")
      gui.wad_add_binary_lump("A_START",{})
      gui.wad_insert_file("modules/zdoom_internal_scripts/ASSGRASS.lmp", "ASSGRASS")
      gui.wad_add_binary_lump("A_END",{})
    end
  end
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
    begin_level = GLAICE_EPIC_TEXTURES.create_environment_themes
    all_done = GLAICE_EPIC_TEXTURES.put_the_texture_wad_in
  }

  tooltip = "If enabled, adds textures from Glaice's Epic Textures collection, which also includes a few new Epic-texture exclusive prefabs."

  options =
  {
    custom_liquids =
    {
      name = "custom_liquids"
      label = _("Custom Liquids")
      choices = GLAICE_EPIC_TEXTURES.YES_NO
      default = "yes"
      tooltip = "Adds new Epic Textures liquid flats."
      priority=4
    }

    custom_trees =
    {
      name = "custom_trees"
      label = _("Custom Trees")
      choices = GLAICE_EPIC_TEXTURES.SOUCEPORT_CHOICES
      default = "zs"
      tooltip =
        "Adds custom flat-depedendent tree sprites into the game. Currently only replaces " ..
        "trees on specific grass flats and will be expanded in the future to accomnodate " ..
        "Epic Textures and more. If you are playing a mod that already does its own trees, " ..
        "it may be better to leave this off."
      priority=3
    }

    environment_themes =
    {
      name = "environment_themes"
      label = _("Environment Themes")
      choices = GLAICE_EPIC_TEXTURES.ENVIRONMENT_THEME_CHOICES
      default = "random"
      tooltip =
        "Influences outdoor environments with different climate-based textures such as " ..
        "desert or snow."
      priority=2
      gap=1
    }

    include_package =
    {
      name = "include_package"
      label = _("Texture WAD Merge")
      choices = GLAICE_EPIC_TEXTURES.YES_NO
      default = "yes"
      tooltip =
        "Allows the trimming down of resulting WAD by not merging the Epic texture WAD.\n\n" ..
        "This will require you to extract and load up the WAD manually in your preferred sourceport installation.\n\n" ..
        "This is the preferrable option for multiplayer situations and server owners and have each client obtain a copy of the texture pack instead.\n"
      priority=1
    }
  }
}
