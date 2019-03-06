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

ZDOOM_SPECIALS = { }

ZDOOM_SPECIALS.YES_NO =
{
  "yes", _("Yes"),
  "no",  _("No"),
}

ZDOOM_SPECIALS.FOG_GEN_CHOICES =
{
  "per_sky_gen",    _("Per Sky Generator"),
  "random", _("Random"),
  "no",     _("No"),
}

ZDOOM_SPECIALS.FOG_ENV_CHOICES =
{
  "all",     _("All"),
  "outdoor", _("Outdoors Only"),
}

ZDOOM_SPECIALS.FOG_DENSITY_CHOICES =
{
  "clear", _("Clear"),
  "misty", _("Misty"),
  "foggy", _("Foggy"),
  "dense", _("Dense"),
  "mixed", _("Mix It Up"),
}

function ZDOOM_SPECIALS.setup(self)
  print("ZDoom Special Addons module activated.")

  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
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
    elseif skyname == "STARS" then
      color = "00 00 00"
    else
      color = "00 00 00"
    end

    if color then
      return color
    else
      gui.printf("\nCould not resolve skybox generator color.\n")
      return "00 00 00"
    end
  end


  local function pick_random_fog_color()
    local function give_random_hex()
      return rand.pick({'0','1','2','3','4','5','6','8','9','a','b','c','d','e','f'})
    end
    local octet1 = give_random_hex() .. give_random_hex()
    local octet2 = give_random_hex() .. give_random_hex()
    local octet3 = give_random_hex() .. give_random_hex()
    return octet1 .. " " .. octet2 .. " " .. octet3
  end


  --[[if PARAM.light_fixtures then
    for name,def in ipairs(PARAM.light_fixtures) do
      print("\n" .. table.tostr(def))
    end
  end]]


  local function add_mapinfo(mapinfo_tab)

    -- mapinfo table requires color for fog and map number
    fog_color = mapinfo_tab.fog_color
    map_num = mapinfo_tab.map_num

    local function list_doom2_music()
      local doom2_music_list = {}
      doom2_music_list[1] = "$MUSIC_RUNNIN"
      doom2_music_list[2] = "$MUSIC_STALKS"
      doom2_music_list[3] = "$MUSIC_COUNTD"
      doom2_music_list[4] = "$MUSIC_BETWEE"
      doom2_music_list[5] = "$MUSIC_DOOM"
      doom2_music_list[6] = "$MUSIC_THE_DA"
      doom2_music_list[7] = "$MUSIC_SHAWN"
      doom2_music_list[8] = "$MUSIC_DDTBLU"
      doom2_music_list[9] = "$MUSIC_IN_CIT"
      doom2_music_list[10] = "$MUSIC_DEAD"
      doom2_music_list[11] = "$MUSIC_STLKS2"
      doom2_music_list[12] = "$MUSIC_THEDA2"
      doom2_music_list[13] = "$MUSIC_DOOM2"
      doom2_music_list[14] = "$MUSIC_DDTBL2"
      doom2_music_list[15] = "$MUSIC_RUNNI2"
      doom2_music_list[16] = "$MUSIC_DEAD2"
      doom2_music_list[17] = "$MUSIC_STLKS3"
      doom2_music_list[18] = "$MUSIC_ROMERO"
      doom2_music_list[19] = "$MUSIC_SHAWN2"
      doom2_music_list[20] = "$MUSIC_MESSAG"
      doom2_music_list[21] = "$MUSIC_COUNT2"
      doom2_music_list[22] = "$MUSIC_DDTBL3"
      doom2_music_list[23] = "$MUSIC_AMPIE"
      doom2_music_list[24] = "$MUSIC_THEDA3"
      doom2_music_list[25] = "$MUSIC_ADRIAN"
      doom2_music_list[26] = "$MUSIC_MESSG2"
      doom2_music_list[27] = "$MUSIC_ROMER2"
      doom2_music_list[28] = "$MUSIC_TENSE"
      doom2_music_list[29] = "$MUSIC_SHAWN3"
      doom2_music_list[30] = "$MUSIC_OPENIN"
      doom2_music_list[31] = "$MUSIC_EVIL"
      doom2_music_list[32] = "$MUSIC_ULTIMA"
      return doom2_music_list
    end

    local function list_doom1_music()
      local doom1_music_list = {}
      doom1_music_list[1] = "$MUSIC_E1M1"
      doom1_music_list[2] = "$MUSIC_E1M2"
      doom1_music_list[3] = "$MUSIC_E1M3"
      doom1_music_list[4] = "$MUSIC_E1M4"
      doom1_music_list[5] = "$MUSIC_E1M5"
      doom1_music_list[6] = "$MUSIC_E1M6"
      doom1_music_list[7] = "$MUSIC_E1M7"
      doom1_music_list[8] = "$MUSIC_E1M8"
      doom1_music_list[9] = "$MUSIC_E1M9"
      doom1_music_list[10] = "$MUSIC_E2M1"
      doom1_music_list[11] = "$MUSIC_E2M2"
      doom1_music_list[12] = "$MUSIC_E2M3"
      doom1_music_list[13] = "$MUSIC_E2M4"
      doom1_music_list[14] = "$MUSIC_E2M5"
      doom1_music_list[15] = "$MUSIC_E2M6"
      doom1_music_list[16] = "$MUSIC_E2M7"
      doom1_music_list[17] = "$MUSIC_E2M8"
      doom1_music_list[18] = "$MUSIC_E2M9"
      doom1_music_list[19] = "$MUSIC_E3M1"
      doom1_music_list[20] = "$MUSIC_E3M2"
      doom1_music_list[21] = "$MUSIC_E3M3"
      doom1_music_list[22] = "$MUSIC_E3M4"
      doom1_music_list[24] = "$MUSIC_E3M5"
      doom1_music_list[25] = "$MUSIC_E3M6"
      doom1_music_list[26] = "$MUSIC_E3M7"
      doom1_music_list[27] = "$MUSIC_E3M8"
      doom1_music_list[28] = "$MUSIC_E3M9"
      doom1_music_list[29] = "$MUSIC_E3M4"
      doom1_music_list[30] = "$MUSIC_E3M2"
      doom1_music_list[31] = "$MUSIC_E3M3"
      doom1_music_list[32] = "$MUSIC_E1M5"
      return doom1_music_list
    end

    local music_list

    if OB_CONFIG.game == "doom1" then
      music_list = list_doom1_music()
    else
      music_list = list_doom2_music()
    end

    local music_line = ''

    if PARAM.mapinfo_music_shuffler == "yes" then
      music_list = rand.shuffle(music_list)
    end

    if music_list then
      music_line = '  Music = "' .. music_list[map_num] .. '"\n'
    else
      music_line = ''
    end

    -- resolve map MAPINFO linkages
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

    -- resolve proper episodic sky texture assignments
    if map_num <= 11 then
      sky_tex = "SKY1"
    elseif map_num > 11 and map_num <= 20 then
      sky_tex = "SKY2"
    elseif map_num > 20 then
      sky_tex = "SKY3"
    end

    -- produce endtitle screen end of game
    if (map_num + 1 > level_count) or map_num == 30 then
      map_id_next = '"EndTitle"'
    end

    local secret_level_line

    -- establish secret map MAPINFO links
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

    local fog_color_line = '  fade = "' .. fog_color .. '"\n'

    local fog_intensity = "48"

    -- resolve fog intensity
    if PARAM.fog_intensity == "clear" then
      fog_intensity = "48"
    elseif PARAM.fog_intensity == "misty" then
      fog_intensity = "128"
    elseif PARAM.fog_intensity == "foggy" then
      fog_intensity = "255"
    elseif PARAM.fog_intensity == "dense" then
      fog_intensity = "368"
    elseif PARAM.fog_intensity == "mixed" then
      fog_intensity = "" .. rand.irange(48,368)
    end

    local fog_intensity_line = '  fogdensity = ' .. fog_intensity .. '\n'

    -- fog forced to outdoors only
    if PARAM.fog_env == "outdoor" then
      fog_color_line = '  OutsideFog  = "' .. fog_color .. '"\n'
      fog_intensity_line = '  outsidefogdensity = ' .. fog_intensity .. '\n'
    end

    -- if fog tints sky, based on ZDoom GL specs
    if PARAM.fog_affects_sky == "yes" then
      fog_intensity_line = fog_intensity_line .. '  skyfog = ' .. fog_intensity + 16 .. '\n'
    end

    -- no fog in MAPINFO at all if the fog generator is off
    if PARAM.fog_generator == "no" then
      fog_color_line = ""
      fog_intensity_line = ""
    end


    local mapinfo =
    {
      'map ' .. map_id .. ' lookup HUSTR_'.. map_num ..'\n'
      '{\n'
      --'  cluster = 1\n'
      '  sky1 = "' .. sky_tex .. '"\n'
      '' .. fog_color_line .. ''
      '' .. fog_intensity_line .. ''
      '' .. next_level_line .. ''
      '' .. secret_level_line .. ''
      '' .. music_line .. ''
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

  -- collect lines for MAPINFO lump
  local mapinfolump = {}
  for i=1, #GAME.levels do

    local info = {}

    info.map_num = i

    if PARAM.fog_generator == "per_sky_gen" then
      if i <= 11 then
        info.fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,1)
      elseif i > 11 and i <= 20 then
        info.fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,2)
      elseif i > 20 then
        info.fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,3)
      end
    elseif PARAM.fog_generator == "random" then
      info.fog_color = pick_random_fog_color()
    end

    local mapinfo_lines = add_mapinfo(info)
    each line in mapinfo_lines do
      table.insert(mapinfolump,line)
    end
  end

  gui.wad_add_text_lump("MAPINFO", mapinfolump)
end

OB_MODULES["zdoom_specials"] =
{
  label = _("ZDoom Special Addons")

  game = "doomish"

  side = "left"

  priority = 69

  engine = { zdoom=1, gzdoom=1, skulltag=1 }

  hooks =
  {
    setup = ZDOOM_SPECIALS.setup
    all_done = ZDOOM_SPECIALS.do_special_stuff
  }

  tooltip = "This module adds new ZDoom-exclusive features such as fog. More ZDoom-specific features will be included soon."

  options =
  {
    fog_generator = {
      label = _("Fog Generator"),
      priority = 10
      choices = ZDOOM_SPECIALS.FOG_GEN_CHOICES
      default = "no"
      tooltip = "Generates fog colors based on the Sky Generator or generate completely randomly."
    }

    fog_env = {
      label = _("Fog Environment"),
      priority = 9
      choices = ZDOOM_SPECIALS.FOG_ENV_CHOICES
      default = "all"
      tooltip = "Limits fog to outdoors (sectors with exposed sky ceilings) or allows for all."
    }

    fog_intensity = {
      label = _("Fog Intensity"),
      priority = 8
      choices = ZDOOM_SPECIALS.FOG_DENSITY_CHOICES
      default = "no"
      tooltip = "Determines thickness and intensity of fog, if the Fog Generator is enabled. Clear is recommended."
    }

    fog_affects_sky = {
      label = _("Sky Fog"),
      priority = 7
      choices = ZDOOM_SPECIALS.YES_NO
      default = "yes"
      tooltip = "Tints the sky texture with the fog color, intensity is based on the Fog Intensity selection."
      gap = 1
    }

    mapinfo_music_shuffler = {
      label = _("Shuffle Music"),
      priority = 6
      choices = ZDOOM_SPECIALS.YES_NO
      default = "no"
      tooltip = "Shuffles music in the MAPINFO lump. Oblige's vanilla music shuffler uses a BEX lump and is therefore ignored when the ZDoom Addons module is active."
    }
  }
}
