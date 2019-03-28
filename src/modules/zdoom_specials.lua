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
  "clear",  _("Clear"),
  "misty",  _("Misty"),
  "smokey", _("Smokey"),
  "foggy",  _("Foggy"),
  "dense",  _("Dense"),
  "mixed",  _("Mix It Up"),
}

ZDOOM_SPECIALS.MUSIC_DOOM =
{
  [1] = "$MUSIC_E1M1",
  [2] = "$MUSIC_E1M2",
  [3] = "$MUSIC_E1M3",
  [4] = "$MUSIC_E1M4",
  [5] = "$MUSIC_E1M5",
  [6] = "$MUSIC_E1M6",
  [7] = "$MUSIC_E1M7",
  [8] = "$MUSIC_E1M8",
  [9] = "$MUSIC_E1M9",
  [10] = "$MUSIC_E2M1",
  [11] = "$MUSIC_E2M2",
  [12] = "$MUSIC_E2M3",
  [13] = "$MUSIC_E2M4",
  [14] = "$MUSIC_E2M5",
  [15] = "$MUSIC_E2M6",
  [16] = "$MUSIC_E2M7",
  [17] = "$MUSIC_E2M8",
  [18] = "$MUSIC_E2M9",
  [19] = "$MUSIC_E3M1",
  [20] = "$MUSIC_E3M2",
  [21] = "$MUSIC_E3M3",
  [22] = "$MUSIC_E3M4",
  [24] = "$MUSIC_E3M5",
  [25] = "$MUSIC_E3M6",
  [26] = "$MUSIC_E3M7",
  [27] = "$MUSIC_E3M8",
  [28] = "$MUSIC_E3M9",
  [29] = "$MUSIC_E3M4",
  [30] = "$MUSIC_E3M2",
  [31] = "$MUSIC_E3M3",
  [32] = "$MUSIC_E1M5",
  [33] = "$MUSIC_E2M7",
  [34] = "%MUSIC_E2M4",
  [35] = "$MUSIC_E2M6",
  [36] = "$MUSIC_E2M5",
  [37] = "$MUSIC_E1M9"
}

ZDOOM_SPECIALS.MUSIC_DOOM2 =
{
  [1] = "$MUSIC_RUNNIN"
  [2] = "$MUSIC_STALKS"
  [3] = "$MUSIC_COUNTD"
  [4] = "$MUSIC_BETWEE"
  [5] = "$MUSIC_DOOM"
  [6] = "$MUSIC_THE_DA"
  [7] = "$MUSIC_SHAWN"
  [8] = "$MUSIC_DDTBLU"
  [9] = "$MUSIC_IN_CIT"
  [10] = "$MUSIC_DEAD"
  [11] = "$MUSIC_STLKS2"
  [12] = "$MUSIC_THEDA2"
  [13] = "$MUSIC_DOOM2"
  [14] = "$MUSIC_DDTBL2"
  [15] = "$MUSIC_RUNNI2"
  [16] = "$MUSIC_DEAD2"
  [17] = "$MUSIC_STLKS3"
  [18] = "$MUSIC_ROMERO"
  [19] = "$MUSIC_SHAWN2"
  [20] = "$MUSIC_MESSAG"
  [21] = "$MUSIC_COUNT2"
  [22] = "$MUSIC_DDTBL3"
  [23] = "$MUSIC_AMPIE"
  [24] = "$MUSIC_THEDA3"
  [25] = "$MUSIC_ADRIAN"
  [26] = "$MUSIC_MESSG2"
  [27] = "$MUSIC_ROMER2"
  [28] = "$MUSIC_TENSE"
  [29] = "$MUSIC_SHAWN3"
  [30] = "$MUSIC_OPENIN"
  [31] = "$MUSIC_EVIL"
  [32] = "$MUSIC_ULTIMA"
}

ZDOOM_SPECIALS.INTERPICS =
{
  OBDNLOAD = 50
  OBDNLOA2 = 50
  OBDNLOA3 = 50
  OBDNLOA4 = 50
  OBDNLOA5 = 50
  OBDNLOA6 = 50
  OBDNLOA7 = 50
}

ZDOOM_SPECIALS.MUSIC = {}

function ZDOOM_SPECIALS.setup(self)
  print("ZDoom Special Addons module activated.")

  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

function ZDOOM_SPECIALS.shuffle_music()

  local music_table

  if OB_CONFIG.game == "doom1" then
    music_table = ZDOOM_SPECIALS.MUSIC_DOOM
  else
    music_table = ZDOOM_SPECIALS.MUSIC_DOOM2
  end

  if PARAM.mapinfo_music_shuffler == "yes" then
    rand.shuffle(music_table)
  end

  ZDOOM_SPECIALS.MUSIC = music_table
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
    local fog_color = mapinfo_tab.fog_color
    local map_num = mapinfo_tab.map_num
    local interpic = mapinfo_tab.interpic

    local music_list = ZDOOM_SPECIALS.MUSIC

    local music_line = ''

    if music_list then
      music_line = '  Music = "' .. music_list[map_num] .. '"\n'
    else
      music_line = ''
    end

    if os.date("%m %d") == "04 01" then
      music_line = '  Music = "$MUSIC_RUNNIN"\n'
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
    if OB_CONFIG.game == "doom2" then
      if (map_num + 1 > level_count) or map_num == 30 then
        map_id_next = '"EndTitle"'
      end
    elseif OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
      if (map_num + 1 > level_count) or map_num == 35 then
        map_id_next = '"EndTitle"'
      end
    end

    local secret_level_line

    -- establish secret map MAPINFO links
    -- for DOOM2
    if OB_CONFIG.game == "doom2" then
      if map_num == 15 then
        next_level_line = '  next = MAP16'
        secret_level_line = '  secretnext = MAP31\n'
      elseif map_num == 31 then
        map_id_next = 16
        next_level_line = '  next = MAP16'
        secret_level_line = '  secretnext = MAP32\n'
      elseif map_num == 32 then
        map_id_next = 16
        secret_level_line = ''
      else
        secret_level_line = ''
      end
    end

    -- for DOOM1
    if OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
      -- secret entrances
      if map_num == 3 then
        secret_level_line = '  secretnext = E1M9\n'
      elseif map_num == 14 then
        secret_level_line = '  secretnext = E2M9\n'
      elseif map_num == 24 then
        secret_level_line = '  secretnext = E3M9\n'
      elseif map_num == 29 then
        secret_level_line = '  secretnext = E4M9\n'
      end

      -- skip for secret levels
      if map_num == 8 then
        next_level_line = '  next = E2M1\n'
      elseif map_num == 17 then
        next_level_line = '  next = E3M1\n'
      elseif map_num == 26 then
        next_level_line = '  next = E4M1\n'
      end

      -- final level
      if map_num == 35 then
        next_level_line = ''
      end
    end

    local next_level_line = '  next = ' .. map_id_next .. '\n'

    local fog_color_line = '  fade = "' .. fog_color .. '"\n'

    local fog_intensity = "48"

    -- resolve fog intensity
    if PARAM.fog_intensity == "clear" then
      fog_intensity = "16"
    elseif PARAM.fog_intensity == "misty" then
      fog_intensity = "48"
    elseif PARAM.fog_intensity == "smokey" then
      fog_intensity = "128"
    elseif PARAM.fog_intensity == "foggy" then
      fog_intensity = "255"
    elseif PARAM.fog_intensity == "dense" then
      fog_intensity = "368"
    elseif PARAM.fog_intensity == "mixed" then
      fog_intensity = "" .. rand.irange(16,368)
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
      '  EnterPic = "' .. interpic .. '"\n'
      '  ExitPic = "' .. interpic .. '"\n'
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

  local info = {}

  local ipic = rand.key_by_probs(ZDOOM_SPECIALS.INTERPICS)

  -- collect lines for MAPINFO lump
  local mapinfolump = {}
  for i=1, #GAME.levels do

    info.map_num = i
    info.interpic = ipic

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
  gui.wad_merge_sections("data/loading/loading_screens.wad")
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
    get_levels = ZDOOM_SPECIALS.shuffle_music
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
      tooltip = "Determines thickness and intensity of fog, if the Fog Generator is enabled. Clear or Misty is recommended."
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
