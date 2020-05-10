------------------------------------------------------------------------
--  MODULE: Fauna Module
------------------------------------------------------------------------
--
--  Copyright (C) 2020 Frozsoul (based off MsrSgtShooterPerson's Jokewad Module)
--  Copyright (C) 2020 josh771  (ZScript code for SpringyFly)
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
ACTOR Fauna 
{
  +CANNOTPUSH
  -CANPUSHWALLS
  -CANUSEWALLS
  -ACTIVATEMCROSS
  -COUNTKILL
  +NOTELESTOMP
  +NEVERRESPAWN
}

ACTOR Insect: Fauna
{
  +NEVERTARGET
}

ACTOR FlyingInsect: Insect
{
  +BOUNCEONWALLS
  +FLOAT
  +NOGRAVITY
}

ACTOR Rodent: Fauna
{
  damagefactor "Trample", 0
  damagefactor "Stomp", 0
}

// Credits:
// Decorate: Captain Toenail	(with modifications by Frozsoul)
// Sprites: Operation Bodycount
// Sounds: FindSounds.com
actor ScurryRat: Rodent 30100
{
  radius 8
  height 8
  mass 50
  speed 15
  scale 0.25
  health 1
  seesound 	"rat/active"
  activesound	"rat/active"
  deathsound	"rat/death"
  +FLOORCLIP
  +FRIGHTENED
  +LOOKALLAROUND
  +STANDSTILL
  +AMBUSH
  +SHOOTABLE
  states
  {
  Spawn:
  LookAround:
	RATS A 10 A_Look
	RATS B 10 A_Look
	RATS C 10 A_Look
	RATS D 10 A_Look
	TNT1 A 0 A_Jump(32,"See")
	loop
  See:
    RATS A 2 A_Chase
	TNT1 A 0 A_PlaySound("rat/scurry", 4, 0.6, 1)
	RATS A 2 A_Chase
	RATS B 2 A_Chase
	RATS B 2 A_Chase
	RATS C 2 A_Chase
	RATS C 2 A_Chase
	RATS D 2 A_Chase
	RATS D 2 A_Chase
	TNT1 A 0 A_Jumpifcloser(20,"Bolt")
	TNT1 A 0 A_Jump(128,"LookAround")
	loop
  Bolt:
	RATS C 2 ThrustThing(0,30,0,1)
	TNT1 A 0
	{
		if (Random(0, 255) < 50)
		{
			A_SetSpeed(RandomPick(15, 16, 17));
		}
	}
	Goto See
  Death:
    TNT1 A 0 A_StopSound(4)
	RATS I 3 A_ScreamAndUnblock	
	RATS JKL 3
	RATS L -1
	stop
  }
}
]]

-- ZScript code: josh771
-- Sounds: FreeSounds
-- Sprites: Blood
-- Sprite Edit: Doomedarchviledemon
-- Idea Base: Population animal
FAUNA_MODULE.ZSC =
[[
class SpringyFly : Actor
{
	FLineTraceData fltData;
	Vector3 dest;
	double chase;
	double ignore;
	int pause;
	
	Vector3 spring(Vector3 p, Vector3 r, Vector3 v, double k, double d)
	{
		//p == current position
		//r == rest position
		//v == current velocity
		//k == spring coefficient
		//d == damping coefficient
		//simple damped spring formula
		return -(d * v) - (k * (p - r));
	}
	
	void getNewDest()
	{
		LineTrace(
			frandom(0,360),
			frandompick(8,16,32,64,128,256,512,1024),
			frandom(-90,90),
			TRF_THRUACTORS | TRF_ABSPOSITION,
			dest.z,
			dest.x,
			dest.y,
			fltData);
		dest = (dest + fltData.HitLocation) * 0.5;
	}
	
	override void PostBeginPlay() 
	{
		SetOrigin((pos.xy, frandom(floorz + 8, ceilingz - 8)), false);
		dest = pos;
		getNewDest();
		chase = 0;
		ignore = 35;
		pause = 0;
		scale *= frandom(0.1,0.2);
	}
		
	override void Tick()
	{
	
        if (isFrozen())
            return;
			
        UpdateWaterLevel();
		
        //This block manually advances states. Ripped straight from FastProjectile class:
        if (tics != -1)
		{
            if (tics > 0)
                tics--;
            while (!tics)
			{
                if (!SetState (CurState.NextState)) // mobj was removed
                    return;
            }
        }
		
		if (pause)
		{
			vel *= 0.8;
			pause--;
		}
		else
		{
			vel += spring(pos, dest, vel, 0.01, 0.01);
		}
		
		A_FaceMovementDirection();
		
		if (!ignore)
		{
			LineTrace(angle, vel.length() * 4, pitch, 0, 4, 4, data:fltData);
		
			if (fltData.TRACE_HitActor && !target)
			{
				target = fltData.HitActor;
				chase = random(18, 525);
			}
		}
		else
			ignore--;
			
		LineTrace(angle, vel.length() * 4, pitch, TRF_THRUACTORS, 4, 4, data:fltData);
		
		if (fltData.HitType != TRACE_HitNone)
		{
			vel *= 0.8;
		}
		
		else
		{
			if (!target && !random(0,34))
			{
				getNewDest();
			}
		}
		
		SetOrigin(pos + vel, true);

		if (target)
		{
			dest = (target.x + frandom(-target.radius , target.radius),
					target.y + frandom(-target.radius , target.radius),
					target.z + target.height);
			if (!chase)
			{
				A_ClearTarget();
				ignore = random(18, 105);
			}
			else
				chase--;
		}
		
		if (!pause && !random(0,104))
			pause = random(1,35);
    }
	
	Default
	{
		ActiveSound "Fly/Buzz";
		Height 8;
		Radius 4;
		+FORCEXYBILLBOARD;
		+NOGRAVITY;
	}

	States
	{
	Spawn:
		FLYA ABABABABABABABABABABABA random(1,2);
		FLYA B random(1,2) A_ActiveSound();
		Loop;
	}
}
]]

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SNDINFO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FAUNA_MODULE.SNDINFO = 
[[
Fly/Buzz FLYBUZZ
$attenuation Fly/Buzz 2

DSRATIDL DSRATIDL
DSRAT DSRAT

// Includes NULLs to reduce frequency of noise
$random rat/active { DSRATIDL DSRAT DSRAT DSRAT DSRAT NULL NULL NULL NULL NULL NULL NULL NULL}

DSRATDI1	DSRATDI1
DSRATDI2	DSRATDI2
$random rat/death	{ DSRATDI1 DSRATDI2 }

// Sound modified from https://freesound.org/people/krnash/sounds/389794/
rat/scurry	RATCRAWL
]]

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DEFINITIONS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FAUNA_MODULE.ACTORS =
{
  SpringyFly = 
  {
    id = 30000
	cluster = 2
  }
  
  rat =
  {
	id = 30100
	cluster = 1
  }
}

FAUNA_MODULE.DOOMEDNUMS =
{
[[
	30000 = SpringyFly
]]
}

function FAUNA_MODULE.get_levels()
end

function FAUNA_MODULE.end_level()

  if PARAM.flies == "enable" then
    FAUNA_MODULE.add_flies()
  end

  if PARAM.rats == "enable" then
    FAUNA_MODULE.add_rats()
  end

end

function FAUNA_MODULE.add_flies()

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
			--fly = 5
            SpringyFly = 5
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

  if (PARAM.flies == "enable" or PARAM.rats == "enable") then
	PARAM.fauna_SNDINFO = FAUNA_MODULE.SNDINFO
  end

  if PARAM.flies == "enable" then
    PARAM.fauna_zsc = FAUNA_MODULE.ZSC
	PARAM.fauna_mapinfo = FAUNA_MODULE.DOOMEDNUMS
	local dir = "games/doom/data/"
    gui.wad_merge_sections(dir .. "Fly.wad")
	gui.wad_insert_file("data/sounds/FLYBUZZ.ogg", "FLYBUZZ")
  end

  if PARAM.rats == "enable" then
    PARAM.fauna_dec = FAUNA_MODULE.DEC
    local dir = "games/doom/data/"
    gui.wad_merge_sections(dir .. "Rats.wad")
	gui.wad_insert_file("data/sounds/DSRAT.ogg", "DSRAT")
	gui.wad_insert_file("data/sounds/DSRATIDL.ogg", "DSRATIDL")
	gui.wad_insert_file("data/sounds/DSRATDI1.ogg", "DSRATDI1")
	gui.wad_insert_file("data/sounds/DSRATDI2.ogg", "DSRATDI2")
	gui.wad_insert_file("data/sounds/RATCRAWL.ogg", "RATCRAWL")
  end

end

OB_MODULES["fauna_module"] =
{
  label = _("GZDoom: Fauna")

  game = "doomish"

  side = "left"
  priority = 68

  engine = { gzdoom=1 }

  hooks =
  {
    setup = FAUNA_MODULE.setup
    get_levels = FAUNA_MODULE.get_levels
    end_level = FAUNA_MODULE.end_level
    all_done = FAUNA_MODULE.all_done
  }

  options =
  {
    flies =
    {
      name = "flies"
      label=_("Flies")
      choices = FAUNA_MODULE.ENABLE_DISABLE
      tooltip = _("Adds flies to maps. \n")
      default = "disable"
    }

    rats =
    {
      name = "rats"
      label=_("Rats")
      choices = FAUNA_MODULE.ENABLE_DISABLE
      tooltip = _("Adds scurrying rats to maps. \n")
      default = "disable"
    }
  }
}
