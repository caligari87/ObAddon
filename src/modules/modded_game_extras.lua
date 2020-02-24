------------------------------------------------------------------------
--  MODULE: Modded Game extras module
------------------------------------------------------------------------

MODDED_GAME_EXTRAS = { }

MODDED_GAME_EXTRAS.ENABLE_DISABLE =
{
  "enable",  _("Enable"),
  "disable", _("Disable"),
}

MODDED_GAME_EXTRAS.SCRIPT_TYPE_CHOICES =
{
  "dec",  _("DECORATE"),
  "none", _("NONE"),
}

MODDED_GAME_EXTRAS.BOSS_NAME_GEN_CHOICES =
{
  "zs", _("ZScript"),
  "none", _("NONE"),
}

MODDED_GAME_EXTRAS.HELLSCAPE_NAVIGATOR_TEMPLATE =
{
  BASE =
[[actor m8f_hn_AreaNameMarker_ObAddon : Actor
{
  +NOBLOCKMAP
  +NOGRAVITY
  +DONTSPLASH
  +NOTONAUTOMAP
  +DONTTHRUST
}

]]

  COPIES =
[[actor m8f_hn_AreaNameMarker_NUMNUMNUM : m8f_hn_AreaNameMarker_ObAddon NUMNUMNUM
{
  Tag "NAMENAMENAME"
  Health SIZESIZESIZE
}

]]

}

function MODDED_GAME_EXTRAS.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end

  if PARAM.hn_markers != "none" then
    MODDED_GAME_EXTRAS.init_hn_info()
  end

  if PARAM.boss_names == "zs" then
    MODDED_GAME_EXTRAS.generate_boss_names()
  end
end

function MODDED_GAME_EXTRAS.init_hn_info()
  HN_INFO_TABLE = {}

  PARAM.hn_thing_start_offset = 15000
end

function MODDED_GAME_EXTRAS.create_hn_info()

  -- skip Hellscape Navigator stuff on prebuilt levels (no info to draw from)
  -- and procedural gotchas (what the heck are you gonna navigate in two rooms?)
  if LEVEL.prebuilt then return end
  if LEVEL.is_procedural_gotcha then return end

  if PARAM.hn_markers == "none" or not PARAM.hn_markers then
    return
  end

  gui.printf("--==| Hellscape Navigator Support |==--\n\n")

  -- function to find the best place to put the HN marker on in
  -- MSSP-TODO: Marker placement sometimes fails, figure out a way to place them
  -- on a preferably clean spot
  local function find_closest_seed_to_center(R)
    local cx = (R.sx1 + R.sx2) / 2
    local cy = (R.sy1 + R.sy2) / 2

    local seed_list = {}
    each A in R.areas do
      if not A.chunk
      or (A.chunk and not A.chunk.content) then
        each S in A.seeds do

          -- skip this area if it's a closet or a joiner
          -- want to make sure the entity gets placed... somewhere.
          if S.area.chunk then
            if S.area.chunk.kind == "closet"
            or S.area.chunk.kind == "joiner" then
              continue
            end
          end

          S.distance_from_room_center = geom.dist(cx, cy, S.sx, S.sy)
          table.insert(seed_list, S)
        end
      end
    end

    table.sort(seed_list, function(A,B)
    return A.distance_from_room_center < B.distance_from_room_center end)

    return seed_list[1]
  end

  -- get name, evaluate rooms in the zone for recoloring
  -- based on the zone goal
  local function generate_name(zone)
    local name = Naming_grab_one(LEVEL.name_class)

    if #zone.rooms == 1 and zone.rooms[1].is_exit then
      if zone.rooms[1].conns then
        name = zone.rooms[1].conns[1].R1.zone.hn_name
        zone.single_exit = true
      end
    end

    if not zone.single_exit then
      gui.printf("ZONE_" .. zone.id .. " name: " .. name .. "\n")
    else
      gui.printf("ZONE_" .. zone.id .. " name: " .. name .. " (single exit," ..
      " borrows prior connecting zone's name)\n")
    end

    zone.hn_name = name
  end

  -- decide goal for room
  local function fetch_room_goal(R)
    local goal_string = ""
    local goal_objective = "none"
    local goal_obstacles = {}

    -- check for locked gates (keyed or switched doors)
    each C in R.conns do
      if C.R2 == R then continue end
      if C.lock then
        if C.lock.kind == "quest" then
          each G in C.lock.goals do
            if G.item == "k_yellow" or G.item == "ks_yellow" then
              goal_obstacles.yellow_door = true
            elseif G.item == "k_blue" or G.item == "ks_blue" then
              goal_obstacles.blue_door = true
            elseif G.item == "k_red" or G.item == "ks_red" then
              goal_obstacles.red_door = true
            elseif G.kind == "SWITCH" then
              goal_obstacles.barred_door = true
            end
          end
        end
      end
    end

    -- check for goal contents (keys or quest switches)
    if R.goals then
      if R.goals[1] then
        local goal_info = R.goals[1]

        if goal_info.kind == "SWITCH" then

          goal_objective = "switch"
        elseif goal_info.kind == "KEY" then

          if goal_info.item == "k_yellow" or
          goal_info.item == "ks_yellow" then

            goal_objective = "yellow_key"

          elseif goal_info.item == "k_blue" or
          goal_info.item == "ks_blue" then

            goal_objective = "blue_key"

          elseif goal_info.item == "k_red" or
          goal_info.item == "ks_red" then

            goal_objective = "red_key"
          else

            goal_objective = "none"
          end
        elseif goal_info.kind == "EXIT" then

          goal_objective = "exit"
        end
      end
    end

    -- generate strings for presence of doors
    -- locked by goal items/switches
    if goal_obstacles then

      local door_type = "none"
      if goal_obstacles.yellow_door and goal_obstacles.blue_door
      and goal_obstacles.red_door then
        goal_string = goal_string .. " (All-Key Door)"
        door_type = "all_key"
      end

      if door_type != "all_key" then
        if goal_obstacles.yellow_door then
          goal_string = goal_string .. " (Yellow Door)"
        end
        if goal_obstacles.blue_door then
          goal_string = goal_string .. " (Blue Door)"
        end
        if goal_obstacles.red_door then
          goal_string = goal_string .. " (Red Door)"
        end
        if goal_obstacles.barred_door then
          goal_string = goal_string .. " (Barred Door)"
        end
      end
    end

    -- generate strings for presence of goal items
    if goal_objective == "yellow_key" then
      goal_string = goal_string .. " (Yellow Key Nearby)"
    end
    if goal_objective == "blue_key" then
      goal_string = goal_string .. " (Blue Key Nearby)"
    end
    if goal_objective == "red_key" then
      goal_string = goal_string .. " (Red Key Nearby)"
    end
    if goal_objective == "switch" then
      goal_string = goal_string .. " (Switch Nearby)"
    end
    if goal_objective == "exit" then
      goal_string = goal_string .. " (Exit Nearby)"
    end

    if R.is_secret then
      goal_string = goal_string .. " (Secret Area #" .. PARAM.hn_secret_count .. ")"
      PARAM.hn_secret_count = PARAM.hn_secret_count + 1
    end

    return goal_string
  end

  -- generate information for the HN marker
  local function make_room_info(R)
    local info = {}

    info.name = R.zone.hn_name

    -- attach goal information
    info.name = "Location: " .. info.name .. fetch_room_goal(R)

    info.editor_num = PARAM.hn_thing_start_offset

    local x_span = (R.sx2 - R.sx1) * SEED_SIZE
    local y_span = (R.sy2 - R.sy1) * SEED_SIZE

    info.radius = (x_span + y_span)/2
    info.env = R:get_env()

    PARAM.hn_thing_start_offset = PARAM.hn_thing_start_offset + 1

    local prefered_S = find_closest_seed_to_center(R)
    if not prefered_S then
      gui.printf("WTF man where do I put the HN marker here??!?!! " ..
      "WHERE MAN?!?! WHGEREREE???!!!! OH GOD HELP ME I CAN'T COMPUTER\n")
      return
    end

    table.insert(HN_INFO_TABLE, info)

    hn_marker = {
      x = prefered_S.mid_x
      y = prefered_S.mid_y
      z = prefered_S.area.ceil_h
      id = info.editor_num
    }

    raw_add_entity(hn_marker)
  end

  --== Hellscape Navigator init ==--
  each Z in LEVEL.zones do
    generate_name(Z)
  end

  PARAM.hn_secret_count = 1
  each R in LEVEL.rooms do
    make_room_info(R)
  end
end

function MODDED_GAME_EXTRAS.generate_hn_decorate()

  if PARAM.hn_markers == "none" or not PARAM.hn_markers then
    return
  end

  local decorate_string = MODDED_GAME_EXTRAS.HELLSCAPE_NAVIGATOR_TEMPLATE.BASE

  -- create decorate file!
  each I in HN_INFO_TABLE do
    local name = I.name
    local editor_num = I.editor_num
    local radius = I.radius

    local thing_chunk = MODDED_GAME_EXTRAS.HELLSCAPE_NAVIGATOR_TEMPLATE.COPIES
    thing_chunk = string.gsub(thing_chunk, "NUMNUMNUM", editor_num)
    thing_chunk = string.gsub(thing_chunk, "NAMENAMENAME", name)
    thing_chunk = string.gsub(thing_chunk, "SIZESIZESIZE", radius)

    decorate_string = decorate_string .. thing_chunk
  end

  PARAM.hn_marker_decorate_lines = decorate_string
end



MODDED_GAME_EXTRAS.BOSS_NAME_SCRIPT =
[[/* Content of this list is pulled directly from ObAddon's names libraries. */

class bossNameHandler : EventHandler
{
  string exoticSyllables[SYL_NUM + 1];
  string demonTitles[TITLE_NUM + 1];
  string mon_name;

  bool isBoss(Actor a)
  {
    if (a.Species == "IAmTheBoss"){return false;}
    if (a.bBoss){return true;}

    /* Check for Champions-morphed things */
    Inventory token;
    token = a.FindInventory("champion_TitanToken", true);
    token = a.FindInventory("champion_SplitterToken", true);
    token = a.FindInventory("champion_HeartToken", true);
    if(token) return true;

    /* Vanilla Oblige sets these up as "bosses" so might as well. */
    if (a is "BaronOfHell"){return true;}
    if (a is "Archvile"){return true;}
    if (a is "PainElemental"){return true;}

    return false;
  }

  void nameGenInit()
  {
    SYLLABLE_LIST
    EVIL_TITLE_LIST
  }

  string getExoticSyls()
  {
    return exoticSyllables[Random(0,SYL_NUM)];
  }

  string getExoticName()
  {
    string tmp;

    switch(Random(1,6))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        tmp = getExoticSyls() .. getExoticSyls();
        break;
      case 6:
        tmp = getExoticSyls() .. getExoticSyls() .. getExoticSyls();
        break;
    }

    return tmp;
  }

  string getDemonTitles()
  {
    return demonTitles[Random(0,TITLE_NUM)];
  }

  string getFancyDemonTag()
  {
    return getExoticName() .. " the " .. getDemonTitles();
  }

  string getNormalDemonTag()
  {
    return getExoticName();
  }

  string assembleName()
  {
    string currentName;
    string firstLetter;

    currentName = getFancyDemonTag();
    /* getNormalDemonTag currently not used */

    firstLetter = currentName.Left(1);
    firstLetter.toUpper();
    currentName.Remove(0,1);
    currentName = firstLetter .. currentName;

    return currentName;
  }

  override void WorldLoaded(WorldEvent e)
  {
    nameGenInit();
  }

  override void WorldThingSpawned(WorldEvent e)
  {
    if (e.Thing && isBoss(e.Thing))
    {
      mon_name = assembleName();
      e.Thing.SetTag(mon_name);
    }
  }
}
]]

function MODDED_GAME_EXTRAS.generate_boss_names()
  local boss_name_script = ""

  local syl_list = "\n"
  local title_list = "\n"

  local title_num = 0
  local syl_num = 0

  boss_name_script = boss_name_script .. MODDED_GAME_EXTRAS.BOSS_NAME_SCRIPT

  each name,prob in namelib.SYLLABLES.e do
    syl_list = syl_list .. '    exoticSyllables[' .. syl_num .. ']="' .. name .. '";\n'
    syl_num = syl_num + 1
  end

  each name,prob in ZDOOM_STORIES.EVIL_TITLES do
    title_list = title_list .. '    demonTitles[' .. title_num .. ']="' .. name .. '";\n'
    title_num = title_num + 1
  end

  boss_name_script = string.gsub( boss_name_script, "SYLLABLE_LIST", syl_list )
  boss_name_script = string.gsub( boss_name_script, "EVIL_TITLE_LIST", title_list )

  boss_name_script = string.gsub( boss_name_script, "SYL_NUM", syl_num - 1 )
  boss_name_script = string.gsub( boss_name_script, "TITLE_NUM", title_num - 1 )

  gui.printf(boss_name_script .. "\n")

  PARAM.boss_name_script = boss_name_script
end

----------------------------------------------------------------

OB_MODULES["modded_game_extras"] =
{
  label = _("Modded Game Extras")

  side = "left"
  priority = 75

  game = "doomish"

  hooks =
  {
    setup = MODDED_GAME_EXTRAS.setup
    end_level = MODDED_GAME_EXTRAS.create_hn_info
    all_done = MODDED_GAME_EXTRAS.generate_hn_decorate
  }

  tooltip = "Offers extra features and expanded support for various mods."

  options =
  {
    hd_cover_walls =
    {
      name = "hd_cover_walls"
      label=_("HD Cover Walls")
      choices=MODDED_GAME_EXTRAS.ENABLE_DISABLE
      tooltip = "Adds some Hideous Destructor-specific fabs such as walls with" ..
      "cover to serve Hideous Destructor gameplay better. " ..
      "It is recommended to keep this disabled if you are not " ..
      "playing Hideous Destructor as these fabs will interfere with non-HD gameplay."
      default = "disable"
    }

    hn_markers =
    {
      name = "hn_markers"
      label=_("HN Markers")
      choices=MODDED_GAME_EXTRAS.SCRIPT_TYPE_CHOICES
      tooltip = "Adds support for m8f's Hellscape Navigator by generating " ..
      "name markers in the map per room."
      default = "none"
    }

    boss_names =
    {
      name = "boss_names"
      label=_("Custom Boss Names")
      choices=MODDED_GAME_EXTRAS.BOSS_NAME_GEN_CHOICES
      tooltip = "Renames tags of boss actors with more or less actually demonic names. " ..
      "Best used with TargetSpy or other healthbar mods to see the name. " ..
      "For now, only works with actors flagged as bosses by default, rather than morphed to be bosses."
      default = "none"
    }
  }
}
