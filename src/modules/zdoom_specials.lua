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

gui.import("zdoom_story_gen.lua")

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

ZDOOM_SPECIALS.STORY_CHOICES =
{
  "generic", _("Generic"),
  "proc",    _("Generated"),
  "none",    _("NONE"),
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
  [23] = "$MUSIC_E3M5",
  [24] = "$MUSIC_E3M6",
  [25] = "$MUSIC_E3M7",
  [26] = "$MUSIC_E3M8",
  [27] = "$MUSIC_E3M9",
  [28] = "$MUSIC_E3M4",
  [29] = "$MUSIC_E3M2",
  [30] = "$MUSIC_E3M3",
  [31] = "$MUSIC_E1M5",
  [32] = "$MUSIC_E2M7",
  [33] = "$MUSIC_E2M4",
  [34] = "$MUSIC_E2M6",
  [35] = "$MUSIC_E2M5",
  [36] = "$MUSIC_E1M9"
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

ZDOOM_SPECIALS.DOOM1_MAP_NOMENCLATURE =
{
  [1] = "E1M1"
  [2] = "E1M2"
  [3] = "E1M3"
  [4] = "E1M4"
  [5] = "E1M5"
  [6] = "E1M6"
  [7] = "E1M7"
  [8] = "E1M8"
  [9] = "E1M9"
  [10] = "E2M1"
  [11] = "E2M2"
  [12] = "E2M3"
  [13] = "E2M4"
  [14] = "E2M5"
  [15] = "E2M6"
  [16] = "E2M7"
  [17] = "E2M8"
  [18] = "E2M9"
  [19] = "E3M1"
  [20] = "E3M2"
  [21] = "E3M3"
  [22] = "E3M4"
  [23] = "E3M5"
  [24] = "E3M6"
  [25] = "E3M7"
  [26] = "E3M8"
  [27] = "E3M9"
  [28] = "E4M1"
  [29] = "E4M2"
  [30] = "E4M3"
  [31] = "E4M4"
  [32] = "E4M5"
  [33] = "E4M6"
  [34] = "E4M7"
  [35] = "E4M8"
  [36] = "E4M9"
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

ZDOOM_SPECIALS.INTERPIC_MUSIC =
{
  "$MUSIC_DM2INT", _("Universal Intermission"),
  "$MUSIC_READ_M", _("Doom 2 Vanilla"),
  "$MUSIC_INTER",  _("Doom 1 Vanilla")
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

  if OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
    music_table = ZDOOM_SPECIALS.MUSIC_DOOM
  else
    music_table = ZDOOM_SPECIALS.MUSIC_DOOM2
  end

  if PARAM.mapinfo_music_shuffler == "yes" then
    rand.shuffle(music_table)
  end

  ZDOOM_SPECIALS.MUSIC = music_table

  local story_id, info = ZStoryGen_fetch_story_chunk()
  gui.printf("\n--== Story Generator test ==--\n")
  gui.printf("\nHook:\n")
  ZStoryGen_hook_me_with_a_story(story_id, info)
  gui.printf("\n\nConclusion:\n")
  ZStoryGen_conclude_my_story(story_id, info)
  gui.printf("\n")
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

  local function add_languagelump()
  end

  local function add_mapinfo(mapinfo_tab)

    -- mapinfo table requires color for fog and map number
    local fog_color = mapinfo_tab.fog_color
    local map_num = mapinfo_tab.map_num
    local interpic = mapinfo_tab.interpic

    local music_list = ZDOOM_SPECIALS.MUSIC

    local music_line = ''

    if music_list then
      gui.printf("Music index: " .. map_num .. "\n")
      music_line = '  Music = "' .. music_list[map_num] .. '"\n'
    else
      music_line = ''
    end

    -- resolve map MAPINFO linkages
    if OB_CONFIG.game == "doom2" then
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
    elseif OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
      map_id = ZDOOM_SPECIALS.DOOM1_MAP_NOMENCLATURE[map_num]
      map_id_next = ZDOOM_SPECIALS.DOOM1_MAP_NOMENCLATURE[map_num + 1]
    end

    -- resolve proper episodic sky texture assignments
    if map_num <= 11 then
      sky_tex = "SKY1"
    elseif map_num > 11 and map_num <= 20 then
      sky_tex = "SKY2"
    elseif map_num > 20 then
      sky_tex = "SKY3"
    end

    if PARAM.fireblu_mode then
      sky_tex = "FIREBLU1"
    end

    -- produce endtitle screen end of game
    if OB_CONFIG.game == "doom2" then
      if (map_num + 1 > level_count) or map_num == 30 then
        map_id_next = '"EndGameC"'
      end
    elseif OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
      if (map_num + 1 > level_count) then
        map_id_next = '"EndTitle"'
      end
    end

    local secret_level_line

    local next_level_line = '  next = ' .. map_id_next .. '\n'

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
      else
        secret_level_line = ''
      end

      -- skip for secret levels
      if map_num == 8 then
        next_level_line = '  next = "EndGame1"\n'
      elseif map_num == 17 then
        next_level_line = '  next = "EndGame2"\n'
      elseif map_num == 26 then
        next_level_line = '  next = "endbunny"\n'
      end

      -- final level
      if map_num == 35 then
        next_level_line = '  next = "EndGame4"\n'
      end
    end

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

    -- add cluster linking for DOOM2
    local cluster_line = ''

    if PARAM.story_generator == "generic" then
      if OB_CONFIG.game == "doom2" then
        if map_num >= 1 and map_num <= 5 then
          cluster_line = "  Cluster = 5\n"
        elseif map_num > 5 and map_num <= 11 then
          cluster_line = "  Cluster = 6\n"
        elseif map_num > 11 and map_num <= 14 then
          cluster_line = "  Cluster = 7\n"
        elseif map_num > 14 and map_num <= 20 then
          cluster_line = "  Cluster = 8\n"
        elseif map_num > 20 and map_num <= 30 then
          cluster_line = "  Cluster = 9\n"
        elseif map_num == 31 then
          cluster_line = "  Cluster = 10\n"
        elseif map_num == 32 then
          cluster_line = "  Cluster = 11\n"
        end
      end
    end

    -- fix for level name string linking between Doom VS Doom 2
    local name_string_map_id
    if OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
      name_string_map_id = map_id
    else
      name_string_map_id = map_num
    end

    -- special tags for Doom 1 stuff
    local special_attributes = ''
    if OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
      if map_id == "E1M8" then
        special_attributes = '  nointermission\n'
        if GAME.levels[map_num].prebuilt then
          special_attributes = special_attributes .. '  nosoundclipping\n'
          special_attributes = special_attributes .. '  baronspecial\n'
          special_attributes = special_attributes .. '  specialaction_lowerfloor\n'
        end
      elseif map_id == "E2M8" then
        special_attributes = '  nointermission\n'
        if GAME.levels[map_num].prebuilt then
          special_attributes = special_attributes .. '  nosoundclipping\n'
          special_attributes = special_attributes .. '  cyberdemonspecial\n'
          special_attributes = special_attributes .. '  specialaction_exitlevel\n'
        end
      elseif map_id == "E3M8" then
        special_attributes = '  nointermission\n'
        if GAME.levels[map_num].prebuilt then
          special_attributes = special_attributes .. '  nosoundclipping\n'
          special_attributes = special_attributes .. '  spidermastermindspecial\n'
          special_attributes = special_attributes .. '  specialaction_exitlevel\n'
        end
      elseif map_id == "E4M8" then
        special_attributes = '  nointermission\n'
        if GAME.levels[map_num].prebuilt then
          special_attributes = special_attributes .. '  nosoundclipping\n'
          special_attributes = special_attributes .. '  spidermastermindspecial\n'
          special_attributes = special_attributes .. '  specialaction_lowerfloor\n'
        end
      else
        special_attributes = ''
      end
    end

    local mapinfo =
    {
      'map ' .. map_id .. ' lookup HUSTR_'.. name_string_map_id ..'\n'
      '{\n'
      --'  cluster = 1\n'
      '  sky1 = "' .. sky_tex .. '"\n'
      '' .. cluster_line .. ''
      '' .. fog_color_line .. ''
      '' .. fog_intensity_line .. ''
      '' .. next_level_line .. ''
      '' .. secret_level_line .. ''
      '' .. music_line .. ''
      '  EnterPic = "' .. interpic .. '"\n'
      '  ExitPic = "' .. interpic .. '"\n'
      '' .. special_attributes .. ''
      '}\n'
    }

    return mapinfo
  end

  local function add_clusterdef(interpic)
    local clusterdef = {''}
    if OB_CONFIG.game == "doom2" then

      local cluster_music_line = '  music = "' .. PARAM.generic_intermusic .. '"\n'

      clusterdef =
      {
        'cluster 5\n' -- MAP01-05
        '{\n'
        '' .. cluster_music_line .. ''
        '  pic = "' .. interpic .. '"\n'
        --[['  entertext = \n'
        '    "Time to enter the fray once more!",\n'
        '    "The forces of hell have opened",\n'
        '    "the gates to the netherworld",\n'
        '    "and have spilled across the land.",\n'
        '    " ",\n'
        '    "Time to greet them the only way",\n'
        '    "you know: locked and loaded!",\n'
        '    " ",\n'
        '    "Good luck out there",\n'
        '    "and blast those hellspawn back",\n'
        '    "to which they came!"\n']]
        '  exittext =\n'
        '    "Hell has taken a strong hold",\n'
        '    "upon these lands, corrupting it",\n'
        '    "in their wake!",\n'
        '    " ",\n'
        '    "Ahead, their forces gather in strength",\n'
        '    "almost inumerable in count."\n'
        '}\n'
        'cluster 6\n' -- MAP06-MAP11
        '{\n'
        '' .. cluster_music_line .. ''
        '  pic = "' .. interpic .. '"\n'
        '  exittext =\n'
        '    "A lieutenant of hell falls",\n'
        '    "but otherworldly shrieks echo",\n'
        '    "further still.",\n'
        '    " ",\n'
        '    "You pick up your armaments",\n'
        '    "and point them forward",\n'
        '    "to continue the siege",\n'
        '    "against the darkness.",\n'
        '    " ",\n'
        '    "The battle rages on!"\n'
        '}\n'
        'cluster 7\n' -- MAP12-14
        '{\n'
        '' .. cluster_music_line .. ''
        '  pic = "' .. interpic .. '"\n'
        '  exittext =\n'
        '    "You tirelessly battle against",\n'
        '    "waves upon waves of",\n'
        '    "seemingly infinite hellspawn.",\n'
        '    " ",\n'
        '    "Your tracker informs you",\n'
        '    "a secret point of interest",\n'
        '    "may exist nearby..."\n'
        '}\n'
        'cluster 8\n' -- MAP15-20
        '{\n'
        '' .. cluster_music_line .. ''
        '  pic = "' .. interpic .. '"\n'
        '  exittext =\n'
        '    "Hell\'s forces attempt to push back",\n'
        '    "but your relentless assault on their",\n'
        '    "breaches keeps them at bay!",\n'
        '    " ",\n'
        '    "More of their overlords have fallen",\n'
        '    "and the opportunity for their defeat",\n'
        '    "draws ever closer..."\n'
        '}\n'
        'cluster 9\n' -- MAP21-30
        '{\n'
        '' .. cluster_music_line .. ''
        '  pic = "' .. interpic .. '"\n'
        '  exittext =\n'
        '    "Mission Accomplished!",\n'
        '    " ",\n'
        '    "You have loosened hell\'s grip upon",\n'
        '    "this place! Demonic entities flee in terror",\n'
        '    "from your display of indomitable strength.",\n'
        '    " ",\n'
        '    "You realize, however,",\n'
        '    "while hell lies defeated today,",\n'
        '    "hell has not yet been destroyed.",\n'
        '    "Rest for now, but remember:",\n'
        '    "Hell is already preparing",\n'
        '    "for another challenge."\n'
        '}\n'
        'cluster 10\n' -- MAP31
        '{\n'
        '' .. cluster_music_line .. ''
        '  pic = "' .. interpic .. '"\n'
        '  entertext =\n'
        '    "You have found a secret zone!",\n'
        '    "It seems the hellspawn have barricaded",\n'
        '    "themselves within its confines with the",\n'
        '    "expectation of safety.",\n'
        '    " ",\n'
        '    "You are about to prove them otherwise."\n'
        '}\n'
        'cluster 11\n' -- MAP32
        '{\n'
        '' .. cluster_music_line .. ''
        '  pic = "' .. interpic .. '"\n'
        '  entertext =\n'
        '    "It seems this secret trail",\n'
        '    "goes further than expected.",\n'
        '    "It is time to finish this",\n'
        '    "once and for all and eradicate",\n'
        '    "this hidden pocket of hellish infestation."\n'
        '}\n'
      }
    end
    return clusterdef
  end

  local function add_episodedef(map_num)
    local episodedef = {''}
    local map_string

    if OB_CONFIG.game == "doom2" then
      map_string = map_num
      if map_num < 10 then
        map_string = "0" .. map_num
      end

    end
    if OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
       map_string = ZDOOM_SPECIALS.DOOM1_MAP_NOMENCLATURE[map_num]
    end

    if not map_string then
      return nil
    end

    episodedef =
    {
      'episode MAP' .. map_string .. '\n'
      '{\n'
      '  name = "' .. GAME.levels[map_num].episode.description .. '"\n'
      '}\n'
    }

    return episodedef
  end

  local info = {}

  local ipic = rand.key_by_probs(ZDOOM_SPECIALS.INTERPICS)

  -- collect lines for MAPINFO lump
  local mapinfolump = {}
  for i=1, #GAME.levels do

    info.map_num = i
    info.interpic = ipic

    if PARAM.fireblu_mode then
      info.interpic = "OBDNLOAT"
    end

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

  -- lines for episode definition
  if PARAM.episode_selection == "yes" then

    -- for Doom2 (yes, there's no Doom2 episode splitting)
    -- but there is from now on
    if OB_CONFIG.game == "doom2" then
      local episode_1_info = add_episodedef(1)
      each line in episode_1_info do
        table.insert(mapinfolump,line)
      end

      if #GAME.levels > 11 then
        local episode_2_info = add_episodedef(12)
        local episode_3_info = add_episodedef(21)
        each line in episode_2_info do
          table.insert(mapinfolump,line)
        end
        each line in episode_3_info do
          table.insert(mapinfolump,line)
        end
      end
    end

    if OB_CONFIG.game == "doom1" or OB_CONFIG.game == "ultdoom" then
      local episode_info = add_episodedef(1)
      each line in episode_info do
        table.insert(mapinfolump,line)
      end

      if #GAME.levels > 9 then
        episode_info = add_episodedef(10)
        each line in episode_info do
          table.insert(mapinfolump,line)
        end
        episode_info = add_episodedef(19)
        each line in episode_info do
          table.insert(mapinfolump,line)
        end
      end

      if #GAME.levels > 27 then
        episode_info = add_episodedef(28)
        each line in episode_info do
          table.insert(mapinfolump,line)
        end
      end
    end
  end

  -- collect lines for the cluster information in MAPINFO
  if PARAM.story_generator == "generic" then
    local clusterinfo_lines = add_clusterdef(ipic)
    each line in clusterinfo_lines do
      table.insert(mapinfolump,line)
    end
  elseif PARAM.story_generator == "proc" then
    -- language lump is written inside the story generator
  end

  -- insert custom music
  if PARAM.story_generator != "none" then
    if PARAM.generic_intermusic == "$MUSIC_DM2INT" then
      gui.wad_insert_file("data/music/D_DM2INT.ogg","D_DM2INT")
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

    story_generator = {
      label = _("Story Generator"),
      priority = 5
      choices = ZDOOM_SPECIALS.STORY_CHOICES
      default = "proc"
      tooltip = "Adds cluster information with generic or randomized story text into the MAPINFO structure!"
    }

    generic_intermusic = {
      label = _("Intermission Music"),
      priority = 4
      choices = ZDOOM_SPECIALS.INTERPIC_MUSIC
      default = "$MUSIC_READ_M"
      tooltip = "Changes the music playing during intermission screens."
    }

    episode_selection = {
      label = _("Episode Selection"),
      priority = 3
      choices = ZDOOM_SPECIALS.YES_NO
      default = "no"
      tooltip = "Creates a classic Doom/Ultimate Doom style episode selection."
    }
  }
}
