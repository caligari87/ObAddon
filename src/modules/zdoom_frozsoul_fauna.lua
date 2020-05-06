------------------------------------------------------------------------
--  MODULE: Fauna Module
------------------------------------------------------------------------
--
--  Copyright (C) 2020 Frozsoul
--  (based off the Jokewad Module by MsrSgtShooterPerson)
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

FAUNA_MODULE = {}

FAUNA_MODULE.ENABLE_DISABLE =
{
  "enable",  _("Enable"),
  "disable", _("Disable"),
}

function FAUNA_MODULE.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

FAUNA_MODULE.DEC =
[[
// Source: https://realm667.com/index.php/en/prop-stop-mainmenu-163-64831/friendlies-fauna#info-3
ACTOR Fly 30000

{
  Radius 3
  Height 3
  Speed 3
  Mass 10
  Scale 0.25
  ActiveSound "Flying/Fly"
  +BOUNCEONWALLS
  +FLOAT
  +NOGRAVITY
  States
  {
  Spawn:
    FLYA AAABBB 1 A_Wander
	TNT1 A 0
	{
		A_Look;
		
		if (Random(0, 255) < 50)
		{
			A_SetSpeed(RandomPick(1, 3, 5));
		}
	}
	loop
  See:
	FLYA AAABBB 1 A_Wander
	TNT1 A 0 A_JumpIf(IsPointerEqual(AAPTR_TARGET, AAPTR_NULL), "Spawn")
	TNT1 A 0 A_JumpIfCloser(156,"Follow")
	TNT1 A 0
	{
		if (Random(0, 255) < 50)
		{
			A_SetSpeed(RandomPick(1, 3, 5));
		}
	}
	loop
  Follow:
	FLYA AAABBBAAABBB 1 A_Chase
	TNT1 A 0 A_Jump(80,"Spawn")
	TNT1 A 0 A_JumpIfCloser(156,"Follow")
	Goto Spawn
  }
}

// Source: https://realm667.com/index.php/en/prop-stop-mainmenu-163-64831/friendlies-fauna#info-3
actor ScurryRat 30005
{
  radius 8
  height 8
  mass 50
  speed 16
  scale 0.5
  health 1
  seesound 	"rat/squeek"
  activesound	"rat/active"
  deathsound	"rat/death"
  +FLOORCLIP
  +FRIGHTENED
  +LOOKALLAROUND
  +NEVERRESPAWN
  +STANDSTILL
  +AMBUSH
  +VULNERABLE
  +TOUCHY
  states
  {
  Spawn:
    RATS A 10 A_Look 
    loop
  See:
    RATS A 2 A_Chase
	// RATS A 0 A_CheckSight ("Vanish")
	RATS A 2 A_Chase
	// RATS A 0 A_CheckSight ("Vanish")
	RATS B 2 A_Chase
	// RATS A 0 A_CheckSight ("Vanish")
	RATS B 2 A_Chase
	// RATS A 0 A_CheckSight ("Vanish")
	RATS C 2 A_Chase
	// RATS A 0 A_CheckSight ("Vanish")
	RATS C 2 A_Chase
	// RATS A 0 A_CheckSight ("Vanish")
	RATS D 2 A_Chase
	// RATS A 0 A_CheckSight ("Vanish")
	RATS D 2 A_Chase
	// RATS A 0 A_CheckSight ("Vanish")
    loop
  Vanish:
    TNT1 A 1
    stop
  Death:
    RATS I 3 A_ScreamAndUnblock
	RATS JKL 3
	RATS L -1
	stop
  }
}
]]

FAUNA_MODULE.SNDINFO = 
[[
Flying/Fly FLYBUZZ

Rat/Squeek	DSRAT
Rat/Active	DSRATIDL
DSRATDI1	DSRATDI1
DSRATDI2	DSRATDI2
$random Rat/Death	{ DSRATDI1 DSRATDI2 }
]]

FAUNA_MODULE.ACTORS =
{
  fly = 
  {
    id = 30000
	cluster = 2
  }
  
  rat =
  {
	id = 30005
	cluster = 1
  }
}

function FAUNA_MODULE.get_levels()
end

function FAUNA_MODULE.end_level()

  if PARAM.insects == "enable" then
    FAUNA_MODULE.add_insects()
  end

  if PARAM.rats == "enable" then
    FAUNA_MODULE.add_rats()
  end

end

function FAUNA_MODULE.add_insects()

  --if LEVEL.is_procedural_gotcha then return end

  if LEVEL.prebuilt then return end

  each A in LEVEL.areas do
    
	-- No spawning in outdoor snow areas
	if (A.is_outdoor and LEVEL.outdoor_theme == "snow") then end
	
	if (A.mode and A.mode == "floor") then
      each S in A.seeds do

		--[[
        -- not on chunks with something on it
        if S.chunk and S.chunk.content then continue end

        -- not on diagonals
        if S.diagonal then continue end

        -- not on areas with liquid sinks
        if A.floor_group and A.floor_group.sink
        and A.floor_group.sink.mat == "_LIQUID" then continue end
		--]]
		
        if rand.odds(7) then

          local item_tab = {
            fly = 5
          }

          local choice = rand.key_by_probs(item_tab)
          local item = FAUNA_MODULE.ACTORS[choice]
          local cluster
          local count = 1

          if item.cluster then
            count = rand.irange(1, item.cluster)
          end

          for i = 1, count do
            local event_thing = {}

            local final_z = A.ceil_h

            if A.room and not A.room.is_park then
              final_z = A.floor_h + 2
            end

            event_thing.id = FAUNA_MODULE.ACTORS[choice].id
            event_thing.z = final_z
            event_thing.x = rand.irange(S.mid_x + 48, S.mid_x - 48)
            event_thing.y = rand.irange(S.mid_y + 48, S.mid_y - 48)

            raw_add_entity(event_thing)
          end

        end

      end
    end
  end
end

function FAUNA_MODULE.add_rats()

  --if LEVEL.is_procedural_gotcha then return end

  if LEVEL.prebuilt then return end

  -- No rats in snow theme
  if LEVEL.outdoor_theme == "snow" then return end

  each A in LEVEL.areas do
    if (A.mode and A.mode == "floor") then
      each S in A.seeds do

		-- No spawning in outdoor snow areas
		if (A.is_outdoor and LEVEL.outdoor_theme == "snow") then end
	
		--[[
        -- not on chunks with something on it
        if S.chunk and S.chunk.content then continue end

        -- not on diagonals
        if S.diagonal then continue end

        -- not on areas with liquid sinks
        if A.floor_group and A.floor_group.sink
        and A.floor_group.sink.mat == "_LIQUID" then continue end
		--]]
		
        if rand.odds(7) then

          local item_tab = {
            rat = 5
          }

          local choice = rand.key_by_probs(item_tab)
          local item = FAUNA_MODULE.ACTORS[choice]
          local cluster
          local count = 1

          if item.cluster then
            count = rand.irange(1, item.cluster)
          end

          for i = 1, count do
            local event_thing = {}

            local final_z = A.ceil_h

            if A.room and not A.room.is_park then
              final_z = A.floor_h + 2
            end

            event_thing.id = FAUNA_MODULE.ACTORS[choice].id
            event_thing.z = final_z
            event_thing.x = rand.irange(S.mid_x + 48, S.mid_x - 48)
            event_thing.y = rand.irange(S.mid_y + 48, S.mid_y - 48)

            raw_add_entity(event_thing)
          end

        end

      end
    end
  end

end



function FAUNA_MODULE.all_done()

  if (PARAM.insects == "enable" or PARAM.rats == "enable") then
    PARAM.fauna_dec = FAUNA_MODULE.DEC
	PARAM.fauna_SNDINFO = FAUNA_MODULE.SNDINFO
  end

  if PARAM.insects == "enable" then
    local dir = "games/doom/data/"
    gui.wad_merge_sections(dir .. "Fly.wad")
	gui.wad_insert_file("data/sounds/FLYING.ogg", "FLYBUZZ")
  end

  if PARAM.rats == "enable" then
    local dir = "games/doom/data/"
    gui.wad_merge_sections(dir .. "Rats.wad")
	gui.wad_insert_file("data/sounds/DSRATIDL.ogg", "DSRATIDL")
  end

end

OB_MODULES["fauna_module"] =
{
  label = _("ZDoom: Fauna")

  game = "doomish"

  side = "left"
  priority = 68

  engine = { zdoom=1, gzdoom=1 }

  hooks =
  {
    setup = FAUNA_MODULE.setup
    get_levels = FAUNA_MODULE.get_levels
    end_level = FAUNA_MODULE.end_level
    all_done = FAUNA_MODULE.all_done
  }

  options =
  {
    insects =
    {
      name = "insects"
      label=_("Insects")
      choices = FAUNA_MODULE.ENABLE_DISABLE
      tooltip = _(
        "Adds insects to maps. \n" ..
        "Currently only flies are available.")
      default = "disable"
    }

    rats =
    {
      name = "rats"
      label=_("Rats")
      choices = FAUNA_MODULE.ENABLE_DISABLE
      tooltip = _(
        "Adds scurrying rats to maps. \n")
      default = "disable"
    }
  }
}
