----------------------------------------------------------------
--  MODULE: ZDoom Special Addons
----------------------------------------------------------------
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
-------------------------------------------------------------------

gui.import("zdoom_glaice_materials.lua")
gui.import("zdoom_glaice_themes.lua")

ZDOOM_SPECIALS = { }

function ZDOOM_SPECIALS.setup(self)
  print("ZDoom Special Addons module activated.")
end

function ZDOOM_SPECIALS.put_new_materials()
  local garbage_bytes = {0}
  gui.wad_add_binary_lump("TX_START",garbage_bytes)
  gui.wad_merge_sections("games/doom/data/Oblige_Epic_Texture_Set_V620.wad")
  gui.wad_add_binary_lump("TX_END",garbage_bytes)

  for skin,defs in pairs(GLAICE_MATERIALS) do
    DOOM.MATERIALS[skin] = defs
  end

  for room_theme,defs in pairs(GLAICE_THEMES) do
    DOOM.ROOM_THEMES[room_theme] = defs
  end
end

function ZDOOM_SPECIALS.do_special_stuff()

  local fog_color

  local level_count = #GAME.levels

  print("There are " .. level_count .. " levels in this WAD!!!!! DOOD")

  local function pick_sky_color_from_skygen_map(skytable, cur_level)
    local color

    local skyname = skytable[cur_level]

    if skyname == "SKY_CLOUDS" then
      color = "c0 dd e0"
    elseif skyname == "BLUE_CLOUDS" then
      color = "79 99 c6"
    elseif skyname == "WHITE_CLOUDS" then
      color = "3c 3c 3d"
    elseif skyname == "GREY_CLOUDS" then
      color = "90 94 96"
    elseif skyname == "DARK_CLOUDS" then
      color = "25 25 26"
    elseif skyname == "BROWN_CLOUDS" then
      color = "e0 a6 64"
    elseif skyname == "BROWNISH_CLOUDS" then
      color = "d3 b3 8f"
    elseif skyname == "PEACH_CLOUDS" then
      color = "dd be d7"
    elseif skyname == "YELLOW_CLOUDS" then
      color = "ed ed 65"
    elseif skyname == "ORANGE_CLOUDS" then
      color = "e0 a2 38"
    elseif skyname == "GREEN_CLOUDS" then
      color = "60 c6 37"
    elseif skyname == "JADE_CLOUDS" then
      color = "68 d1 7d"
    elseif skyname == "DARKRED_CLOUDS" then
      color = "63 16 16"
    elseif skyname == "HELLISH_CLOUDS" then
      color = "db 7c 64"
    elseif string.match( skyname,"NEBULA" ) then
      color = "00 00 00"
    end

    if color then
      return color
    else
      gui.printf("\nCould not resolve skybox generator color.\n")
      return "00 00 00"
    end
  end


  --[[if PARAM.light_fixtures then
    for name,def in ipairs(PARAM.light_fixtures) do
      print("\n" .. table.tostr(def))
    end
  end]]


  if PARAM.episode_sky_color then

    print(table.tostr(PARAM.episode_sky_color))

    fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,1)
  else
    fog_color = "Black"
  end

  local function add_mapinfo(mapinfo_tab)
    -- mapinfo table requires color for fog and map number
    fog_color = mapinfo_tab.fog_color
    map_num = mapinfo_tab.map_num

    if map_num < 10 then
      map_id = "MAP0" .. map_num
    else
      map_id = "MAP" .. map_num
    end

    if map_num <= 11 then
      sky_tex = "SKY1"
    elseif map_num <= 20 then
      sky_tex = "SKY2"
    elseif map_num > 20 then
      sky_tex = "SKY3"
    end

    local mapinfo =
    {
      'map ' .. map_id .. ' lookup HUSTR_'.. map_num ..'\n'
      '{\n'
      --'  cluster = 1\n'
      '  sky1 = "' .. sky_tex .. '"\n'
      '  fade = "' .. fog_color .. '"\n'
      '}\n'
      --[['cluster 1\n'
      '{\n'
      '  entertext =\n'
      '  "If you are reading this,",\n'
      '  "it\'s because you turned on",\n'
      '  "ZDoom Specials Addon even if",\n'
      '  "it says it does nothing."\n'
      '  exittext =\n'
      '  "If you are reading this,",\n'
      '  "it\'s because you turned on",\n'
      '  "ZDoom Specials Addon even if",\n'
      '  "it says it does nothing."\n'
      '}\n'
      'GameInfo {\n'
      '  AddEventHandlers = "ObligeEvents"\n'
      '}\n']]
    }

    return mapinfo
  end

  local mapinfolump = {}
  for i=1, #GAME.levels do

    local info = {}

    info.map_num = i

    if i <= 11 then
      info.fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,1)
    elseif i <= 20 then
      info.fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,2)
    elseif i > 20 then
      info.fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,3)
    end

    local mapinfo_lines = add_mapinfo(info)
    each line in mapinfo_lines do
      table.insert(mapinfolump,line)
    end
  end
  print(mapinfolump)

  gui.wad_add_text_lump("MAPINFO", mapinfolump)

end

OB_MODULES["zdoom_specials"] =
{
  label = _("ZDoom Special Addons")

  game = "doomish"

  side = "right"

  priority = 50

  engine = { zdoom=1, gzdoom=1, skulltag=1 }

  hooks =
  {
    setup = ZDOOM_SPECIALS.setup
    get_levels = ZDOOM_SPECIALS.put_new_materials
    all_done = ZDOOM_SPECIALS.do_special_stuff
  }

  tooltip = "Warning: This module is fully incomplete but currently adds a small number of tech-themed custom textures as well as Sky Generator-based fog when enabled. Parameters will be included when more features are completed. It is preferable not to use this for now unless you want to participate in cutting edge testing."
}