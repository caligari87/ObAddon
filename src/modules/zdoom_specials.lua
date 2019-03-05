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
  ZDOOM_SPECIALS.put_new_materials()
end

function ZDOOM_SPECIALS.put_new_materials()
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

function ZDOOM_SPECIALS.do_special_stuff()

  local fog_color

  local level_count = #GAME.levels

  local function pick_sky_color_from_skygen_map(skytable, cur_level)
    local color

    local skyname = skytable[cur_level]

    if skyname == "SKY_CLOUDS" then
      color = "a7 c3 ef"
    elseif skyname == "BLUE_CLOUDS" then
      color = "17 4f a8"
    elseif skyname == "WHITE_CLOUDS" then
      color = "f2 f4 f7"
    elseif skyname == "GREY_CLOUDS" then
      color = "9d 9e a0"
    elseif skyname == "DARK_CLOUDS" then
      color = "4f 50 51"
    elseif skyname == "BROWN_CLOUDS" then
      color = "ba 68 1b"
    elseif skyname == "BROWNISH_CLOUDS" then
      color = "ba 85 53"
    elseif skyname == "PEACH_CLOUDS" then
      color = "d3 b1 bb"
    elseif skyname == "YELLOW_CLOUDS" then
      color = "db dd 44"
    elseif skyname == "ORANGE_CLOUDS" then
      color = "d3 95 5b"
    elseif skyname == "GREEN_CLOUDS" then
      color = "76 ce 40"
    elseif skyname == "JADE_CLOUDS" then
      color = "92 c4 73"
    elseif skyname == "DARKRED_CLOUDS" then
      color = "9e 1b 0c"
    elseif skyname == "HELLISH_CLOUDS" then
      color = "d8 27 13"
    elseif skyname == "HELL_CLOUDS" then
      color = "d8 27 13"
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
    fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,1)
  else
    fog_color = "00 00 00"
  end

  local function add_mapinfo(mapinfo_tab)
    -- mapinfo table requires color for fog and map number
    fog_color = mapinfo_tab.fog_color
    map_num = mapinfo_tab.map_num

    if map_num < 10 then
      map_id = "MAP0" .. map_num
      if map_num < 9 then
        map_id_next = "MAP0" .. map_num + 1
      else
        map_id_next = "MAP10"
      end
    else
      map_id = "MAP" .. map_num
      map_id_next = "MAP" .. map_num + 1
    end

    if map_num <= 11 then
      sky_tex = "SKY1"
    elseif map_num <= 20 then
      sky_tex = "SKY2"
    elseif map_num > 20 then
      sky_tex = "SKY3"
    end

    if (map_num + 1 > level_count) or map_num == 30 then
      map_id_next = '"EndTitle"'
    end

    local secret_level_line

    if map_num == 15 then
      secret_level_line = '  secretnext = MAP31\n'
    elseif map_num == 31 then
      map_id_next = 16
      secret_level_line = '  secretnext = MAP32\n'
    elseif map_num == 32 then
      map_id_next = 16
      secret_level_line = ''
    else
      secret_level_line = ''
    end

    local next_level_line = '  next = ' .. map_id_next .. '\n'

    local mapinfo =
    {
      'map ' .. map_id .. ' lookup HUSTR_'.. map_num ..'\n'
      '{\n'
      --'  cluster = 1\n'
      '  sky1 = "' .. sky_tex .. '"\n'
      '  fade = "' .. fog_color .. '"\n'
      '  fogdensity = 32\n'
      '' .. next_level_line .. ''
      '' .. secret_level_line .. ''
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

  gui.wad_add_text_lump("MAPINFO", mapinfolump)

  -- Attach Glaice's Epic Texture set
  local garbage_bytes = {0}
  gui.wad_add_binary_lump("TX_START",garbage_bytes)
  gui.wad_merge_sections("games/doom/data/Oblige_Epic_Texture_Set_V620.wad")
  gui.wad_add_binary_lump("TX_END",garbage_bytes)

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
    all_done = ZDOOM_SPECIALS.do_special_stuff
  }

  tooltip = "Warning: This module is fully incomplete but currently adds a small number of tech-themed custom textures as well as Sky Generator-based fog when enabled. Parameters will be included when more features are completed. It is preferable not to use this for now unless you want to participate in cutting edge testing."
}
