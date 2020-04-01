------------------------------------------------------------------------
--  MODULE: Modded Game extras module
------------------------------------------------------------------------
--
--  Copyright (C) 2019-2020 MsrSgtShooterPerson
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

MODDED_GAME_EXTRAS.ACTOR_NAME_GEN_CHOICES =
{
  "zs",      _("ZScript - Generic"),
  "zs_pb",   _("ZScript - Project Brutality"),
  "zs_qcde", _("ZScript - Quake Champions: Doom Edition"),
  "zs_d4t",  _("ZScript - Death Foretold"),
  "none",    _("NONE"),
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

MODDED_GAME_EXTRAS.QCDE_LOOTBOX_NICE_ITEMS =
{
  lb_backpack =
  {
    id = 15514
    kind = "powerup"
    add_prob = 5
    start_prob = 40
    closet_prob = 10
    secret_prob = 35
    storage_prob = 80
  }

  lb_chest =
  {
    id = 15515
    kind = "powerup"
    add_prob = 5
    start_prob = 30
    closet_prob = 8
    secret_prob = 35
    storage_prob = 60
  }

  lb_reliquary =
  {
    id = 15516
    kind = "powerup"
    add_prob = 4
    start_prob = 20
    closet_prob = 8
    secret_prob = 35
    storage_prob = 40
  }
}

MODDED_GAME_EXTRAS.D4T_THINGS =
{
  d4t_drone =
  {
    id = 13611
    kind = "powerup"
    closet_prob = 4
    secret_prob = 15
    storage_prob = 20
  }
}

MODDED_GAME_EXTRAS.D4T_MONS =
{
  d4t_gore_nest =
  {
    id = 13511
    r = 2
    h = 5
    level = 1
    boss_type = "minor"
    boss_prob = 50
    prob = 8
    health = 1000
    damage = 25
    attack = "hitscan"
    density = 0.3
    weap_min_damage = 25
  }
}

function MODDED_GAME_EXTRAS.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end

  if PARAM.hn_markers != "none" then
    MODDED_GAME_EXTRAS.init_hn_info()
  end

  if PARAM.custom_actor_names != "none" then
    MODDED_GAME_EXTRAS.generate_custom_actor_names(PARAM.custom_actor_names)
  end

  if PARAM.qcde_lootboxes == "enable" then
    MODDED_GAME_EXTRAS.add_qcde_lootboxes()
  end

  if PARAM.d4t_ents == "enable" then
    MODDED_GAME_EXTRAS.add_d4t_ents()
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



MODDED_GAME_EXTRAS.ACTOR_NAME_SCRIPT =
[[/* Content of this list is pulled directly from ObAddon's names libraries. */

class bossNameHandler : EventHandler
{
  string exoticSyllables[SYL_NUM + 1];
  string demonTitles[TITLE_NUM + 1];
  string humanFirstNames[F_NUM];
  string humanLastNames[L_NUM];
  string humanNicknames[NICK_NUM];

  string mon_name;
  string obit;

  bool isRankedDemon(Actor a)
  {
    if (a.Species == "IAmTheBoss") return false;
    if (a.bBoss) return true;

    /* Check for Champions-morphed things */
    /* Inventory token;
    token = a.FindInventory("champion_TitanToken", true);
    token = a.FindInventory("champion_SplitterToken", true);
    token = a.FindInventory("champion_HeartToken", true);
    if(token) return true; */

    /* Vanilla Oblige sets these up as "bosses" so might as well. */
    if (a is "BaronOfHell") return true;
    if (a is "Archvile") return true;
    if (a is "PainElemental") return true;
    if (a is "HellKnight") return true;

    GDEMONS_COMPAT_CHECKS

    return false;
  }

  bool isSemiRankedDemon(Actor a)
  {
    if (a is "Cacodemon") return true;
    if (a is "Fatso") return true;
    if (a is "Revenant") return true;
    if (a is "Arachnotron") return true;

    SDEMONS_COMPAT_CHECKS

    return false;
  }

  bool isRanklessDemon(Actor a)
  {
    if (a is "DoomImp") return true;
    if (a is "Demon") return true;
    if (a is "Spectre") return true;

    LDEMONS_COMPAT_CHECKS

    return false;
  }

  bool isHuman(Actor a)
  {
    if (a is "ZombieMan") return true;
    if (a is "ShotgunGuy") return true;
    if (a is "ChaingunGuy") return true;
    if (a is "ScriptedMarine") return true;

    HUMAN_COMPAT_CHECKS

    return false;
  }

  void nameGenInit()
  {
    SYLLABLE_LIST
    EVIL_TITLE_LIST
    FIRST_NAMES_LIST
    LAST_NAMES_LIST
    HUMAN_TITLES_LIST
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

  string getRandomDemonTag()
  {
    string tmp;

    switch(Random(1,2))
    {
      case 1:
        tmp = getFancyDemonTag();
        break;
      case 2:
        tmp = getNormalDemonTag();
        break;
    }

    return tmp;
  }

  string getHumanTag()
  {
    string tmp;

    switch(Random(1,4))
    {
      case 1:
      case 2:
      case 3:
        tmp = humanFirstNames[Random(0, F_NUM - 1)] .. ' ' .. humanLastNames[Random(0, L_NUM - 1)];
        break;
      case 4:
        tmp = humanFirstNames[Random(0, F_NUM - 1)] .. ' "' .. humanNicknames[Random(0, NICK_NUM - 1)] .. '" ' .. humanLastNames[Random(0, L_NUM - 1)];
        break;
    }

    return tmp;
  }

  string bootifyName(string inputName)
  {
    string firstLetter;

    firstLetter = inputName.Left(1);
    firstLetter.toUpper();
    inputName.Remove(0,1);
    inputName = firstLetter .. inputName;

    return inputName;
  }

  override void WorldLoaded(WorldEvent e)
  {
    nameGenInit();
  }

  override void WorldThingSpawned(WorldEvent e)
  {
    if (e.Thing)
    {
      mon_name = "";

      if (isRanklessDemon(e.Thing))
      {
        mon_name = getNormalDemonTag();
      }

      if (isSemiRankedDemon(e.Thing))
      {
        mon_name = getRandomDemonTag();
      }

      if (isRankedDemon(e.Thing))
      {
        mon_name = getFancyDemonTag();
      }

      if (isHuman(e.Thing))
      {
        mon_name = getHumanTag();
      }

      // universal check if all other checks failed
      if (e.Thing.bIsMonster && e.Thing.bCountKill
      && mon_name == "")
      {
        if( e.Thing.Health)
        {
          int mon_hp = e.Thing.Health;

          if (mon_hp > 0 && mon_hp <= 100)
          {
            mon_name = getNormalDemonTag();
          }else if(mon_hp > 100 && mon_hp < 300)
          {
            mon_name = getRandomDemonTag();
          }else if(mon_hp >= 300)
          {
            mon_name = getFancyDemonTag();
          }

          // human-ish check
          obit = e.Thing.Obituary;

          if(obit)
          {
            if(obit.IndexOf("$", 0) > -1)
            {
              obit = Stringtable.localize(obit);
            }
            obit = obit.MakeLower();

            if(obit.IndexOf("human", 0) > -1
            || obit.IndexOf("zombie", 0) > -1
            || obit.IndexOf("former", 0) > -1
            || obit.IndexOf("sergeant", 0) > -1
            || obit.IndexOf("scientist", 0) > -1
            || obit.IndexOf("gunner", 0) > -1
            || obit.IndexOf("dude", 0) > -1
            || obit.IndexOf("z-spec", 0) > -1)
            {
              mon_name = getHumanTag();
            }
          }
        }
      }

      if (mon_name != "")
      {
        mon_name = bootifyName(mon_name);
        e.Thing.SetTag(mon_name);
        e.Thing.giveInventory("ObAddonNameToken", 1);
      }
    }
  }
}

class ObAddonNameToken : Inventory
{
}
]]

MODDED_GAME_EXTRAS.PB_HUMAN_CHECK =
[[    if (a is "PB_Zombieman") return true;
    if (a is "PB_CarbineZombieman") return true;
    if (a is "PB_HelmetZombieman") return true;
    if (a is "PB_PistolZombieman2") return true;
    if (a is "PB_PistolZombieman1") return true;
    if (a is "PB_ZombieScientist") return true;
    if (a is "Zombie_Man") return true;
    if (a is "Labguy") return true;
    if (a is "ShotgunGuy1") return true;
    if (a is "ChaingunGuy1") return true;
    if (a is "HellTrooper") return true;

    if (a is "Marine_Rifle") return true;

    if (a is "ImpaledMarineAlive1") return true;
    if (a is "ImpaledMarineAlive2") return true;
]]

MODDED_GAME_EXTRAS.PB_LESSER_DEMONS_CHECK =
[[
    if (a is "NamiDarkImp") return true;
    if (a is "NetherDarkImp") return true;
    if (a is "STDarkImp") return true;
    if (a is "VoidDarkImp") return true;
    if (a is "Imp") return true;
    if (a is "BullDemon") return true;
]]

MODDED_GAME_EXTRAS.PB_STANDARD_DEMONS_CHECK =
[[
    if (a is "Arachnophyte") return true;
    if (a is "Aracnorb") return true;
    if (a is "Daedabus") return true;
    if (a is "Afrit") return true;
    if (a is "Watcher") return true;
    if (a is "Revenant1") return true;
]]

MODDED_GAME_EXTRAS.PB_GREATER_DEMONS_CHECK =
[[
    if (a is "OverLord") return true;
    if (a is "Cyberbaron") return true;
    if (a is "FleshWizard") return true;
    if (a is "Hellion") return true;
    if (a is "CyberPaladin") return true;
    if (a is "ICEVILE") return true;

    if (a is "BossBrainBase") return true;
    if (a is "TheSpiderMastermind") return true;
    if (a is "Motherdemon") return true;
    if (a is "Juggernaut") return true;
]]

-- Quake Champions: Doom Edition + addons

MODDED_GAME_EXTRAS.QCDE_HUMAN_CHECK =
[[
    //Classic Doom
    if (a is "QCChaingunGuy") return true;
    if (a is "QCShotgunGuy") return true;
    if (a is "QCZombieman") return true;

    /* Doom 3
    if (a is "D3ZSecPistol") return true;
    if (a is "D3ZSecShotgunner") return true;
    if (a is "D3ZSecSMG") return true;
    if (a is "D3CommandoChaingunner") return true;
    if (a is "D3ZSpecOpsRailgunner") return true;
    if (a is "D3ZSpecOpsMachinegunner") return true;
    if (a is "D3ZSpecOpsShotgunner") return true;
    if (a is "D3ZSpecOpsRiotShield") return true;
    if (a is "D3ChainsawZombie") return true;*/

    // Doom 4
    if (a is "D4HellRazer") return true;
    if (a is "D4PossessedSecurity") return true;
    if (a is "D4ShotgunGuy") return true;
    if (a is "D4Zombieman") return true;

    // Quake 1
    if (a is "QZombie") return true;
    if (a is "QNailEnforcer") return true;
    if (a is "QGrunt") return true;
    if (a is "QEnforcer") return true;

    // Quake 2 - poor guys
    if (a is "Q2Berserker") return true;
    if (a is "Q2Brains") return true;
    if (a is "Q2Flyer") return true;
    if (a is "Q2Gladiator") return true;
    if (a is "Q2Gunner") return true;
    if (a is "Q2Hornet") return true;
    if (a is "Q2Hover") return true;
    if (a is "Q2Infantry") return true;
    if (a is "QEnforcer") return true;
    if (a is "Q2IronMaiden") return true;
    if (a is "Q2LightGuard") return true;
    if (a is "Q2MachinegunGuard") return true;
    if (a is "Q2Medic") return true;
    if (a is "Q2Parasite") return true;
    if (a is "Q2ShieldHover") return true;
    if (a is "Q2ShotgunGuard") return true;

    // Quake 4
    if (a is "Q4Berserker") return true;
    if (a is "Q4FailedTransfer") return true;
    if (a is "Q4Gladiator") return true;
    if (a is "Q4Grunt") return true;
    if (a is "Q4Gunner") return true;
    if (a is "Q4Harvester") return true;
    if (a is "Q4HoverTank") return true;
    if (a is "Q4LightTank") return true;
    if (a is "Q4HyperBlasterTactical") return true;
    if (a is "Q4IronMaiden") return true;
    if (a is "Q4HyperBlasterTactical") return true;
    if (a is "Q4LightGuard") return true;
    if (a is "Q4MachinegunGuard") return true;
    if (a is "Q4HyperBlasterTactical") return true;
    if (a is "Q4RailgunTactical") return true;
    if (a is "Q4RepairBot") return true;
    if (a is "Q4Scientist") return true;
    if (a is "Q4ShotgunGuard") return true;
    if (a is "Q4SlimyTransfer") return true;
    if (a is "Q4Scientist") return true;
    if (a is "Q4Sentry") return true;
    if (a is "Q4StroggHover") return true;
    if (a is "Q4TeleportDropper") return true;
    if (a is "Q4Voss") return true;

    /*Half-Life
    if (a is "HLBarney") return true;
    if (a is "HLZombie") return true;
    if (a is "HLZombieMoan") return true;
    if (a is "HLGonome") return true;
    if (a is "HLGruntM16") return true;

    Half-life 2
    if (a is "HL2Barney") return true;
    if (a is "HL2Combine") return true;
    if (a is "HL2FastZombie") return true;
    if (a is "HL2MetroCop") return true;
    if (a is "HL2PoisonZombie") return true;
    if (a is "HL2CombineElite") return true;
    if (a is "HL2Zombie") return true;
    if (a is "HL2Zombine") return true;*/
]]

MODDED_GAME_EXTRAS.QCDE_LESSER_DEMONS_CHECK =
[[
    //Classic Doom
    if (a is "QCDemon") return true;
    if (a is "QCDoomImp") return true;

    /* Doom 3
    if (a is "D3Wraith") return true;
    if (a is "D3DoomImp") return true;
    if (a is "D3DoomImp") return true;
    if (a is "D3Vulgar") return true;*/

    //Doom 4
    if (a is "D4Demon") return true;
    if (a is "D4DoomImp") return true;
    if (a is "D4Harvester") return true;
    if (a is "D4Prowler") return true;

    //Quake 1
    if (a is "QFiend") return true;

    /* Half-life
    if (a is "HLPitDrone") return true;

    Heretic
    if (a is "HrtcWelph") return true;
    if (a is "HrtcImp") return true;*/
]]

MODDED_GAME_EXTRAS.QCDE_STANDARD_DEMONS_CHECK =
[[
    //Classic Doom
    if (a is "QCArachnotron") return true;
    if (a is "QCCacodemon") return true;
    if (a is "QCFatso") return true;
    if (a is "QCRevenant") return true;

    /*Doom 3
    if (a is "D3Revenant") return true;
    if (a is "D3Mancubus") return true;
    if (a is "D3Cacodemon") return true;*/

    //Doom 4
    if (a is "D4Arachnotron") return true;
    if (a is "D4Cacodemon") return true;
    if (a is "D4FatsoTech") return true;
    if (a is "D4Revenant") return true;

    //Quake 1
    if (a is "QOgre") return true;
    if (a is "QRocketOgre") return true;
    if (a is "QScrag") return true;
    if (a is "QShambler") return true;
    if (a is "QRocketOgre") return true;
    if (a is "QVore") return true;

    /*Half-Life
    if (a is "HLStrooper") return true;
    if (a is "HLHornetGrunt") return true;

    Heretic
    if (a is "HrtcClink") return true;
    if (a is "HrtcMummy") return true;
    if (a is "HrtcSnake") return true;*/
]]

MODDED_GAME_EXTRAS.QCDE_GREATER_DEMONS_CHECK =
[[
    //Classic Doom
    if (a is "QCArchvile") return true;
    if (a is "QCBaronOfHell") return true;
    if (a is "QCCyberdemon") return true;
    if (a is "QCHellKnight") return true;
    if (a is "QCPainElemental") return true;
    if (a is "QCSpiderMastermind") return true;

    /*Doom 3
    if (a is "D3HellKnight") return true;
    if (a is "D3Bruiser") return true;
    if (a is "D3PainElemental") return true;
    if (a is "D3Archvile") return true;
    if (a is "D3SpiderMastermind") return true;
    if (a is "D3CyberDemon") return true;
    if (a is "D3SpiderMastermind") return true;
    if (a is "D3HellTimeHunter") return true;
    if (a is "D3Sabaoth") return true;*/

    //Doom 4
    if (a is "D4BaronOfHell") return true;
    if (a is "D4Cyberdemon") return true;
    if (a is "D4Harvester") return true;
    if (a is "D4HellKnight") return true;
    if (a is "D4PainElemental") return true;
    if (a is "D4SpiderMastermind") return true;

    //Quake 1
    if (a is "QDeathKnight") return true;
    if (a is "QKnight") return true;
    if (a is "QIaldagorth") return true;
    if (a is "QNgyrKorath") return true;
    if (a is "QSilverKnight") return true;
    if (a is "QWrath") return true;

    //Quake 2
    if (a is "Q2JorgMakron") return true;
    if (a is "Q2PrototypeContainer") return true;
    if (a is "Q2Tank") return true;
    if (a is "Q2TankBoss") return true;
    if (a is "Q2TankCommander") return true;

    //Quake 4
    if (a is "Q4Harvester") return true;
    if (a is "Q4NetworkGuardian") return true;
    if (a is "Q4StreamProtector") return true;
    if (a is "Q4StroggHover") return true;
    if (a is "Q4StreamProtector") return true;

    /*Half-life
    if (a is "HLController") return true;
    if (a is "HLVoltigore") return true;
    if (a is "HLGargantua") return true;
    if (a is "MiniGarg") return true;
    if (a is "MiniGarg2") return true;
    if (a is "HLVoltigore") return true;
    if (a is "HLGonarch") return true;
    if (a is "HLNihilant") return true;

    Heretic
    if (a is "HrtcBeast") return true;
    if (a is "HrtcDSparil") return true;
    if (a is "HrtcSorcerer2") return true;
    if (a is "HrtcMinotaur") return true;
    if (a is "HrtcSorcerer2") return true;
    if (a is "HrtcImpLeader") return true;
    if (a is "HrtcIronlich") return true;
    if (a is "HrtcKnight") return true;
    if (a is "HrtcKnightGhost") return true;
    if (a is "HrtcImpLeader") return true;
    if (a is "HrtcWizard") return true;
    if (a is "HrtcWraith") return true;*/
]]

-- D4T addons

MODDED_GAME_EXTRAS.D4T_HUMAN_CHECK =
[[
  if (a is "D4Zombieman") return true;
  if (a is "D4Unwilling") return true;
  if (a is "D4ShotgunGuy") return true;
  if (a is "D4PossessedSecurity") return true;
  if (a is "D4HellRazer") return true;
]]

MODDED_GAME_EXTRAS.D4T_LESSER_DEMONS_CHECK =
[[
  if (a is "D4DoomImp") return true;
  if (a is "D4Demon") return true;
]]

MODDED_GAME_EXTRAS.D4T_STANDARD_DEMONS_CHECK =
[[
  if (a is "D4Arachnotron") return true;
  if (a is "D4Cacodemon") return true;
  if (a is "D4FatsoTech") return true;
  if (a is "D4FatsoHell") return true;
  if (a is "D4Prowler") return true;
  if (a is "D4Revenant") return true;
]]

MODDED_GAME_EXTRAS.D4T_GREATER_DEMONS_CHECK =
[[
  if (a is "D4SpiderMastermind") return true;
  if (a is "D4Cyberdemon") return true;
  if (a is "D4Archvile") return true;
  if (a is "D4HellKnight") return true;
  if (a is "D4BaronOfHell") return true;
  if (a is "D4Harvester") return true;
]]


function MODDED_GAME_EXTRAS.generate_custom_actor_names(mode)
  local actor_name_script = ""

  local syl_list = "\n"
  local title_list = "\n"

  local title_num = 0
  local syl_num = 0

  local first_name_list = "\n"
  local last_name_list = "\n"
  local human_titles_list = "\n"

  local f_num = 0
  local l_num = 0
  local t_num = 0

  actor_name_script = actor_name_script .. MODDED_GAME_EXTRAS.ACTOR_NAME_SCRIPT

  each name,prob in namelib.SYLLABLES.e do
    syl_list = syl_list .. '    exoticSyllables[' .. syl_num .. ']="' .. name .. '";\n'
    syl_num = syl_num + 1
  end

  each name,prob in ZDOOM_STORIES.EVIL_TITLES do
    title_list = title_list .. '    demonTitles[' .. title_num .. ']="' .. name .. '";\n'
    title_num = title_num + 1
  end

  each name,prob in namelib.HUMAN_NAMES.f do
    local dupe_count = prob
    while(dupe_count > 0) do
      first_name_list = first_name_list .. '    humanFirstNames[' .. f_num .. ']="' .. name .. '";\n'
      dupe_count = dupe_count - 1
      f_num = f_num + 1
    end
  end

  each name,prob in namelib.HUMAN_NAMES.l do
    last_name_list = last_name_list .. '    humanLastNames[' .. l_num .. ']="' .. name .. '";\n'
    l_num = l_num + 1
  end

  each name,prob in namelib.HUMAN_NAMES.t do
    human_titles_list = human_titles_list .. '    humanNicknames[' .. t_num .. ']="' .. name .. '";\n'
    t_num = t_num + 1
  end


  actor_name_script = string.gsub( actor_name_script, "SYLLABLE_LIST", syl_list )
  actor_name_script = string.gsub( actor_name_script, "EVIL_TITLE_LIST", title_list )

  actor_name_script = string.gsub( actor_name_script, "SYL_NUM", syl_num - 1 )
  actor_name_script = string.gsub( actor_name_script, "TITLE_NUM", title_num - 1 )

  actor_name_script = string.gsub( actor_name_script, "FIRST_NAMES_LIST", first_name_list)
  actor_name_script = string.gsub( actor_name_script, "LAST_NAMES_LIST", last_name_list)
  actor_name_script = string.gsub( actor_name_script, "HUMAN_TITLES_LIST", human_titles_list)

  actor_name_script = string.gsub( actor_name_script, "F_NUM", f_num)
  actor_name_script = string.gsub( actor_name_script, "L_NUM", l_num)
  actor_name_script = string.gsub( actor_name_script, "NICK_NUM", t_num)

  if mode == "zs_pb" then
    actor_name_script = string.gsub( actor_name_script, "HUMAN_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.PB_HUMAN_CHECK)
    actor_name_script = string.gsub( actor_name_script, "LDEMONS_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.PB_LESSER_DEMONS_CHECK)
    actor_name_script = string.gsub( actor_name_script, "SDEMONS_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.PB_STANDARD_DEMONS_CHECK)
    actor_name_script = string.gsub( actor_name_script, "GDEMONS_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.PB_GREATER_DEMONS_CHECK)
  elseif mode == "zs_qcde" then
    actor_name_script = string.gsub( actor_name_script, "HUMAN_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.QCDE_HUMAN_CHECK)
    actor_name_script = string.gsub( actor_name_script, "LDEMONS_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.QCDE_LESSER_DEMONS_CHECK)
    actor_name_script = string.gsub( actor_name_script, "SDEMONS_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.QCDE_STANDARD_DEMONS_CHECK)
    actor_name_script = string.gsub( actor_name_script, "GDEMONS_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.QCDE_GREATER_DEMONS_CHECK)
  elseif mode == "zs_d4t" then
    actor_name_script = string.gsub( actor_name_script, "HUMAN_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.D4T_HUMAN_CHECK)
    actor_name_script = string.gsub( actor_name_script, "LDEMONS_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.D4T_LESSER_DEMONS_CHECK)
    actor_name_script = string.gsub( actor_name_script, "SDEMONS_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.D4T_STANDARD_DEMONS_CHECK)
    actor_name_script = string.gsub( actor_name_script, "GDEMONS_COMPAT_CHECKS", "\n" .. MODDED_GAME_EXTRAS.D4T_GREATER_DEMONS_CHECK)
  elseif mode == "zs" then
    actor_name_script = string.gsub( actor_name_script, "HUMAN_COMPAT_CHECKS", " ")
    actor_name_script = string.gsub( actor_name_script, "LDEMONS_COMPAT_CHECKS", " ")
    actor_name_script = string.gsub( actor_name_script, "SDEMONS_COMPAT_CHECKS", " ")
    actor_name_script = string.gsub( actor_name_script, "GDEMONS_COMPAT_CHECKS", " ")
  end

  PARAM.actor_name_script = actor_name_script
end



function MODDED_GAME_EXTRAS.add_qcde_lootboxes()
  table.name_up(MODDED_GAME_EXTRAS.QCDE_LOOTBOX_NICE_ITEMS)

  each item, property in MODDED_GAME_EXTRAS.QCDE_LOOTBOX_NICE_ITEMS do
    GAME.NICE_ITEMS[item] = property
  end
end



function MODDED_GAME_EXTRAS.add_d4t_ents()
  table.name_up(MODDED_GAME_EXTRAS.D4T_THINGS)

  each item, property in MODDED_GAME_EXTRAS.D4T_THINGS do
    GAME.NICE_ITEMS[item] = property
  end

  each mon, property in MODDED_GAME_EXTRAS.D4T_MONS do
    GAME.MONSTERS[mon] = property
  end
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
    hn_markers =
    {
      name = "hn_markers"
      label=_("HN Markers")
      choices=MODDED_GAME_EXTRAS.SCRIPT_TYPE_CHOICES
      tooltip = "Adds support for m8f's Hellscape Navigator by generating " ..
      "name markers in the map per room."
      default = "none"
      priority = 5
      gap = 1
    }

    custom_actor_names =
    {
      name = "custom_actor_names"
      label=_("Custom Actor Names")
      choices=MODDED_GAME_EXTRAS.ACTOR_NAME_GEN_CHOICES
      tooltip = "Renames tags of monsters with generated names. Humans recieve human names, " ..
      "demons recieve exotic names.\n" ..
      "Best used with TargetSpy or other healthbar mods to see the name." ..
      "Uses class inheritance, so custom monsters inheriting from the base classes also recieve "..
      "custom names. Use compatibility options only when necessary."
      default = "none"
      priority = 4
      gap = 1
    }

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
      priority = 3
    }

    qcde_lootboxes =
    {
      name = "qcde_lootboxes"
      label = _("QC:DE Lootboxes")
      choices = MODDED_GAME_EXTRAS.ENABLE_DISABLE
      tooltip = "Adds Quake Champions: Doom Edition Lootboxes as nice item pickups."
      default = "disable"
      priority = 2
    }

    d4t_ents =
    {
      name = "d4t_ents"
      label = _("D4T Entities")
      choices = MODDED_GAME_EXTRAS.ENABLE_DISABLE
      tooltip = "Adds Death Foretold field drones into items table and " ..
                "gore nests as potential minor boss monsters."
      default = "disable"
      priority = 1
    }
  }
}
