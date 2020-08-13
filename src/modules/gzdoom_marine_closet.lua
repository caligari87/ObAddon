MARINE_CLOSET_TUNE = {}

MARINE_CLOSET_TUNE.CHANCE =
{
  "5",    _("5%"),
  "12",    _("12%"),
  "25",    _("25%"),
  "33",    _("33%"),
  "50",    _("50%"),
  "75",    _("75%"),
  "100",    _("100%"),
}

MARINE_CLOSET_TUNE.COUNT =
{
  "1",    _("1"),
  "2",    _("2"),
  "3",    _("3"),
  "4",    _("4"),
  "5",    _("5"),
  "6",    _("6"),
  "7",    _("7"),
  "8",    _("8"),
  "9",    _("9"),
  "10",    _("10"),
}

MARINE_CLOSET_TUNE.TECH =
{
  "low",    _("Low Tech"),
  "mid",    _("Mid Tech"),
  "high",    _("High Tech"),
  "rng",    _("Mix It Up"),
  "prog",    _("Progressive"),
}

MARINE_CLOSET_TUNE.YN =
{
  "yes", _("Yes"),
  "no",  _("No"),
}

MARINE_CLOSET_TUNE.HEALTH =
{
  "50",    _("50"),
  "100",    _("100"),
  "133",    _("133"),
  "150",    _("150"),
  "200",    _("200"),
  "300",    _("300"),
  "400",    _("400"),
  "750",    _("750"),
  "1000",    _("1000"),
  "2000",    _("2000"),
}

MARINE_CLOSET_TUNE.WAKER =
{
  "sight",    _("Sight"),
  "range",    _("Range"),
  "close",    _("Close Range"),
  "start",    _("Map Start"),
}

MARINE_CLOSET_TUNE.QUANTITY =
{
  "default",    _("Normal"),
  "more",    _("More"),
  "lot",    _("Lots"),
  "horde",    _("Hordes"),
}

MARINE_CLOSET_TUNE.STRENGTH =
{
  "default",    _("Normal"),
  "more",    _("Stronger"),
  "lot",    _("Tougher"),
  "horde",    _("Crazier"),
}

MARINE_CLOSET_TUNE.TEMPLATES =
{
  ZSC =
[[
class AIMarine : Actor
{
	bool follower;
	property follower: follower;
	int strafecd;
	int backcd;
	int scancd;
	int followcd;
	bool seenplayer;
	Default
	{
		Health MHEALTH;
		Radius 16;
		Height 56;
		Mass 100;
		Speed 8;
		Painchance 255;
		Tag "Friendly Marine";
		MONSTER;
		-COUNTKILL
		+FRIENDLY
		+DORMANT
		DeathSound "*death";
		PainSound "*pain50";
		AIMarine.follower MFOLLOW;
	}
	States
	{
	Spawn:
		PLAY A 4 A_Look;
		Loop;
	See:
		PLAY AAAABBBBCCCCDDDD 1 A_Chase;
		Loop;
	Missile:
		PLAY E 4 A_FaceTarget;
		Goto See;
	Pain:
		PLAY G 4;
		PLAY G 4 A_Pain;
		Goto See;
	Death:
		PLAY H 10;
		PLAY I 10 A_Scream;
		PLAY J 10 A_NoBlocking;
		PLAY KLM 10;
		PLAY N -1;
		Stop;
	XDeath:
		PLAY O 5;
		PLAY P 5 A_XScream;
		PLAY Q 5 A_NoBlocking;
		PLAY RSTUV 5;
		PLAY W -1;
		Stop;
	Raise:
		PLAY MLKJIH 5;
		Goto See;
	}
	override void Tick()
	{
		super.Tick();
		if(health > 0 && !self.bDormant)
		{
		if(strafecd>0)
		{
			strafecd--;
		}
		if(backcd>0)
		{
			backcd--;
		}
		if(scancd>0)
		{
			scancd--;
		}
		if(followcd>0)
		{
			followcd--;
		}
		if(scancd==0)
		{
			ThinkerIterator picker = ThinkerIterator.Create("Actor");
			Actor newtarget;
			while(newtarget = Actor(picker.Next()))
			{
				if(newtarget && self.Distance2D(newtarget) < 2048 && CheckSight(newtarget) && newtarget.bIsMonster && !newtarget.bFriendly && newtarget.health > 0)
				{
					if(!self.target || (self.target && ((self.Distance2D(newtarget)-self.Distance2D(self.target)) < -100)))
					{
						self.target = newtarget;
						break;
					}
				}
			}
			scancd = 35;
		}
		if(self.target && CheckSight(self.target))
		{
			if(self.Distance2D(target)<200 && backcd==0)
			{
				A_ChangeVelocity(-20,0,0,1);
				backcd = random(10,30);
			}
			if(strafecd==0)
			{
				if(InStateSequence(Curstate,ResolveState("See"))||InStateSequence(Curstate,ResolveState("Missile")))
				{
					if(random(0,1))
					{
						A_ChangeVelocity(0,20,0,1);
					}
					else
					{
						A_ChangeVelocity(0,-20,0,1);
					}
					strafecd = random(20,50);
				}
			}
			if((self.target.target && !self.target.CheckSight(self.target.target))||!self.target.target)
			{
				self.target.target = self;
				ThinkerIterator Aggro = ThinkerIterator.Create("Actor");
				Actor allattack;
				while(allattack = Actor(Aggro.Next()))
				{
					if(allattack && self.Distance2D(allattack) < 2048 && CheckSight(allattack) && allattack.bIsMonster && !allattack.bFriendly && allattack.health > 0)
					{
						if(!allattack.target || (allattack.target&&!allattack.CheckSight(allattack.target)))
						{
							allattack.target = self;
							if(allattack.inStateSequence(allattack.CurState,allattack.ResolveState("Spawn")))
							{
								allattack.setStateLabel("See");
							}
						}
					}
				}
			}
		}
		if(follower)
		{
			Actor followtarget = Players[(self.FriendPlayer)].mo;
			if(seenplayer && followtarget)
			{
				if(self.target)
				{
					if(!self.CheckSight(self.target)&&followcd==0)
					{
						self.target = null;
						followcd=random(105,350);
					}
				}
				else
				{
					if(!self.CheckSight(followtarget)&&followcd==0&&self.Distance2D(followtarget) > 2000)
					{
						if(self.Teleport(followtarget.Vec3Offset(-32, 0, 0, false),0,0))
						{
							followcd=random(350,700);
						}
						else
						{
							followcd=35;
						}
					}
				}
			}
			else
			{
				if(followtarget && self.CheckSight(followtarget))
				{
					seenplayer = true;
				}
			}
		}
		}
	}
	override int DoSpecialDamage(Actor target, int damage, name damagetype)
	{
		if(target && (target is "PlayerPawn"||target is "AIMarine"))
		{
			return 0;
		}
		return super.DoSpecialDamage(target,damage,damagetype);
	}
}

class PlasmaBallAIMarine : PlasmaBall
{
	override int DoSpecialDamage(Actor target, int damage, name damagetype)
	{
		if(target && (target is "PlayerPawn"||target is "AIMarine"))
		{
			return 0;
		}
		return super.DoSpecialDamage(target,damage,damagetype);
	}
}
class RocketAIMarine : Rocket
{
	override int DoSpecialDamage(Actor target, int damage, name damagetype)
	{
		if(target && (target is "PlayerPawn"||target is "AIMarine"))
		{
			return 0;
		}
		return super.DoSpecialDamage(target,damage,damagetype);
	}
}
class BFGBallAIMarine : BFGBall
{
	override int DoSpecialDamage(Actor target, int damage, name damagetype)
	{
		if(target && (target is "PlayerPawn"||target is "AIMarine"))
		{
			return 0;
		}
		return super.DoSpecialDamage(target,damage,damagetype);
	}
}
class AIMarineWaker : Actor
{
	Default
	{
		+LOOKALLAROUND
		+NOINTERACTION
	}
	States
	{
	WSTATE
	}
	void A_WakeUpMarines()
	{
		ThinkerIterator Marines = ThinkerIterator.Create("AIMarine");
		AIMarine chosenone;
		while(chosenone = AIMarine(Marines.Next()))
		{
			if(chosenone && self.Distance2D(chosenone) < 512)
			{
				chosenone.Activate(self);
				chosenone.followcd=1000;
				chosenone.setStateLabel("See");
				ThinkerIterator Enemies = ThinkerIterator.Create("Actor");
				Actor targetthis;
				while(targetthis = Actor(Enemies.Next()))
				{
					if(targetthis && targetthis.bISMONSTER && !targetthis.bFriendly && targetthis.health > 0 && self.Distance2D(targetthis) < 2000 && self.CheckSight(targetthis))
					{
						chosenone.target = targetthis;
						break;
					}
				}
			}
		}
	}
}
]]
  MWEAK = [[
  class AIMarinePistol : AIMarine
{
	States
	{
	Missile:
		PLAY E 4 A_FaceTarget;
		PLAY E 0 A_PlaySound("weapons/pistol");
		PLAY F 6 BRIGHT A_CustomBulletAttack(9.6,0,1,5);
		PLAY A 9 A_FaceTarget;
		PLAY A 0 A_CposRefire;
		Goto Missile;
	}
}
class AIMarineChaingun : AIMarine
{
	States
	{
	Missile:
		PLAY E 4 A_FaceTarget;
		PLAY E 0 A_PlaySound("weapons/pistol");
		PLAY F 4 BRIGHT A_CustomBulletAttack(13.6,0,1,5);
		PLAY E 0 A_PlaySound("weapons/pistol");
		PLAY F 4 BRIGHT A_CustomBulletAttack(13.6,0,1,5);
		PLAY A 0 A_CposRefire;
		Goto Missile+1;
	}
}
class AIMarineShotgun : AIMarine
{
	States
	{
	Missile:
		PLAY E 3 A_FaceTarget;
		PLAY E 0 A_PlaySound("weapons/shotgf");
		PLAY F 7 BRIGHT A_CustomBulletAttack(5.6,0,7,5);
		PLAY BCDABCDABCDABCD 4 A_Chase(null,null);
		Goto See;
	}
}
class AIMarineSuperShotgun : AIMarine
{
	States
	{
	Missile:
		PLAY E 3 A_FaceTarget;
		PLAY E 0 A_PlaySound("weapons/sshotf");
		PLAY F 7 Bright A_CustomBulletAttack(11.2,7.1,20,5);
		PLAY ABC 4 A_Chase(null,null);
		PLAY A 0 A_PlaySound ("weapons/sshoto");
		PLAY DABC 4 A_Chase(null,null);
		PLAY A 0 A_PlaySound ("weapons/sshotl");
		PLAY DAB 4 A_Chase(null,null);
		PLAY A 0 A_PlaySound ("weapons/sshotc");
		PLAY CDABCDABCDABCD 4 A_Chase(null,null);
		Goto See;
	}
}
class AIMarinePlasma : AIMarine
{
	States
	{
	Missile:
		PLAY E 2 A_FaceTarget;
		PLAY F 6 Bright A_SpawnProjectile("PlasmaBallAIMarine");
		PLAY E 0 A_MonsterRefire(40,"MissileOver");
		Goto Missile+1;
	MissileOver:
		PLAY DABCD 4 A_Chase(null,null);
		Goto See;
	}
}
class AIMarineRocket : AIMarine
{
	States
	{
	Missile:
		PLAY E 8 A_FaceTarget;
		PLAY F 6 Bright A_SpawnProjectile("RocketAIMarine");
		PLAY E 6;
		Goto See;
	}
}
class AIMarineBFG : AIMarine
{
	States
	{
	Missile:
		PLAY E 5 A_PlaySound("weapons/bfgf");
		PLAY EEEEE 5 A_FaceTarget;
		PLAY F 6 Bright A_SpawnProjectile("BFGBallAIMarine");
		PLAY E 4 A_FaceTarget;
		PLAY CDABCDABCDABCD 4 A_Chase(null,null);
		Goto See;
	}
}
  ]]
  MSTRN = [[
  class AIMarinePistol : AIMarine
{
	States
	{
	Missile:
		PLAY E 4 A_FaceTarget;
		PLAY E 0 A_PlaySound("weapons/pistol");
		PLAY F 6 BRIGHT A_CustomBulletAttack(5.6,0,1,5);
		PLAY A 4 A_FaceTarget;
		PLAY A 0 A_CposRefire;
		Goto Missile;
	}
}
class AIMarineChaingun : AIMarine
{
	States
	{
	Missile:
		PLAY E 4 A_FaceTarget;
		PLAY E 0 A_PlaySound("weapons/pistol");
		PLAY F 4 BRIGHT A_CustomBulletAttack(5.6,0,1,5);
		PLAY E 0 A_PlaySound("weapons/pistol");
		PLAY F 4 BRIGHT A_CustomBulletAttack(5.6,0,1,5);
		PLAY A 0 A_CposRefire;
		Goto Missile+1;
	}
}
class AIMarineShotgun : AIMarine
{
	States
	{
	Missile:
		PLAY E 3 A_FaceTarget;
		PLAY E 0 A_PlaySound("weapons/shotgf");
		PLAY F 7 BRIGHT A_CustomBulletAttack(5.6,0,7,5);
		PLAY BCDABCD 4 A_Chase(null,null);
		Goto See;
	}
}
class AIMarineSuperShotgun : AIMarine
{
	States
	{
	Missile:
		PLAY E 3 A_FaceTarget;
		PLAY E 0 A_PlaySound("weapons/sshotf");
		PLAY F 7 Bright A_CustomBulletAttack(11.2,7.1,20,5);
		PLAY ABC 4 A_Chase(null,null);
		PLAY A 0 A_PlaySound ("weapons/sshoto");
		PLAY DABC 4 A_Chase(null,null);
		PLAY A 0 A_PlaySound ("weapons/sshotl");
		PLAY DAB 4 A_Chase(null,null);
		PLAY A 0 A_PlaySound ("weapons/sshotc");
		PLAY CD 4 A_Chase(null,null);
		Goto See;
	}
}
class AIMarinePlasma : AIMarine
{
	States
	{
	Missile:
		PLAY E 2 A_FaceTarget;
		PLAY F 3 Bright A_SpawnProjectile("PlasmaBallAIMarine");
		PLAY E 0 A_MonsterRefire(40,"MissileOver");
		Goto Missile+1;
	MissileOver:
		PLAY DABCD 4 A_Chase(null,null);
		Goto See;
	}
}
class AIMarineRocket : AIMarine
{
	States
	{
	Missile:
		PLAY E 8 A_FaceTarget;
		PLAY F 6 Bright A_SpawnProjectile("RocketAIMarine");
		PLAY E 6;
		PLAY E 0 A_CposRefire;
		Goto Missile;
	}
}
class AIMarineBFG : AIMarine
{
	States
	{
	Missile:
		PLAY E 0 {self.bNOPAIN=1;}
		PLAY E 5 A_PlaySound("weapons/bfgf");
		PLAY EEEEE 5 A_FaceTarget;
		PLAY F 6 Bright A_SpawnProjectile("BFGBallAIMarine");
		PLAY F 0 {self.bNOPAIN=0;}
		PLAY E 4 A_FaceTarget;
		PLAY E 0 A_MonsterRefire(40,"MissileOver");
		Goto Missile;
	MissileOver:
		PLAY CDABCD 4 A_Chase(null,null);
		Goto See;
	}
}
  ]]
  WAKER1 = [[Spawn:
		TNT1 A 4 A_LookEx(LOF_NOSOUNDCHECK);
		Loop;
	See:
		TNT1 A 4 A_WakeUpMarines;
		TNT1 A 4;
		Stop;
  ]]
  WAKER2 = [[Spawn:
		TNT1 A 4 A_LookEx(0,0,1000,1000);
		Loop;
	See:
		TNT1 A 4 A_WakeUpMarines;
		TNT1 A 4;
		Stop;
  ]]
  WAKER3 = [[Spawn:
		TNT1 A 4 A_LookEx(LOF_NOSOUNDCHECK,0,256);
		Loop;
	See:
		TNT1 A 4 A_WakeUpMarines;
		TNT1 A 4;
		Stop;
  ]]
  WAKER4 = [[Spawn:
		TNT1 AAA 4;
		TNT1 A 4 A_WakeUpMarines;
		TNT1 A 4;
		Stop;
  ]]
}

MARINE_CLOSET_TUNE.MAPINFO =
{
[[
  31000 = AIMarineWaker
  31001 = AIMarinePistol
  31002 = AIMarineChaingun
  31003 = AIMarineShotgun
  31004 = AIMarineSupershotgun
  31005 = AIMarinePlasma
  31006 = AIMarineRocket
  31007 = AIMarineBFG
]]
}

function MARINE_CLOSET_TUNE.setup(self)
  PARAM.marine_gen = true
  PARAM.marine_skip = false
  PARAM.MARINESCRIPT = ""
  PARAM.marine_closets = 0
  PARAM.marine_marines = 0

  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

function MARINE_CLOSET_TUNE.calc_closets()
  if rand.odds(tonumber(PARAM.m_c_chance)) then
    PARAM.marine_skip = false
	local rngmin
    local rngmax
    rngmin = tonumber(PARAM.m_c_min)
	rngmax = tonumber(PARAM.m_c_max)
	if rngmin > rngmax then
	  rngmax = tonumber(PARAM.m_c_min)
	  rngmin = tonumber(PARAM.m_c_max)
	end
	PARAM.marine_closets = rand.irange(rngmin,rngmax)
	rngmin = tonumber(PARAM.m_c_m_min)
	rngmax = tonumber(PARAM.m_c_m_max)
	if rngmin > rngmax then
	  rngmax = tonumber(PARAM.m_c_m_min)
	  rngmin = tonumber(PARAM.m_c_m_max)
	end
	PARAM.marine_marines = rand.irange(rngmin,rngmax)
  else
    PARAM.marine_skip = true
  end
end

function MARINE_CLOSET_TUNE.all_done()

  local scripty = MARINE_CLOSET_TUNE.TEMPLATES.ZSC
  
  if PARAM.m_c_power == "yes" then
    scripty = scripty .. MARINE_CLOSET_TUNE.TEMPLATES.MSTRN
  else
    scripty = scripty .. MARINE_CLOSET_TUNE.TEMPLATES.MWEAK
  end
  
  scripty = string.gsub(scripty, "MHEALTH", PARAM.m_c_health)
  
  if PARAM.m_c_follow == "yes" then
    scripty = string.gsub(scripty, "MFOLLOW", "true")
  else
    scripty = string.gsub(scripty, "MFOLLOW", "false")
  end
  
  if PARAM.m_c_waker == "sight" then
    scripty = string.gsub(scripty, "WSTATE", MARINE_CLOSET_TUNE.TEMPLATES.WAKER1)
  elseif PARAM.m_c_waker == "range" then
    scripty = string.gsub(scripty, "WSTATE", MARINE_CLOSET_TUNE.TEMPLATES.WAKER2)
  elseif PARAM.m_c_waker == "close" then
    scripty = string.gsub(scripty, "WSTATE", MARINE_CLOSET_TUNE.TEMPLATES.WAKER3)
  else
    scripty = string.gsub(scripty, "WSTATE", MARINE_CLOSET_TUNE.TEMPLATES.WAKER4)
  end
  
  PARAM.MARINESCRIPT = PARAM.MARINESCRIPT .. scripty
  PARAM.MARINEMAPINFO = MARINE_CLOSET_TUNE.MAPINFO
end
--[[
OB_MODULES["gzdoom_marine_closets"] =
{
  label = _("[Exp]GZDoom Marine Closets")

  side = "right"
  priority = 93

  hooks =
  {
    setup = MARINE_CLOSET_TUNE.setup
    begin_level = MARINE_CLOSET_TUNE.calc_closets
    all_done = MARINE_CLOSET_TUNE.all_done
  }

  tooltip=_(
    "[WIP/Experimental]This module adds customizable closets to the map filled with friendly ai marines.")

  options =
  {
    m_c_chance =
    {
      name = "m_c_chance",
      label = _("Chance per map"),
      priority = 99,
      choices = MARINE_CLOSET_TUNE.CHANCE,
      default = "100",
      tooltip = "Chance per map of marine closets spawning at all. E.G. at 50% theres 50% chance of each map being empty of marine closets.",
    }

    m_c_min =
    {
      name = "m_c_min",
      label = _("Minimum closets"),
      priority = 98,
      choices = MARINE_CLOSET_TUNE.COUNT,
      default = "1",
      tooltip = "Sets least amount of closets that can spawn per map.",
    }

    m_c_max =
    {
      name = "m_c_max",
      label = _("Maximum closets"),
      priority = 97,
      choices = MARINE_CLOSET_TUNE.COUNT,
      default = "2",
      tooltip = "Sets most amount of closets that can spawn per map.",
    }

    m_c_m_min =
    {
      name = "m_c_m_min",
      label = _("Minimum marines"),
      priority = 96,
      choices = MARINE_CLOSET_TUNE.COUNT,
      default = "1",
      tooltip = "Sets least amount of marines that can spawn per closet.",
    }

    m_c_m_max =
    {
      name = "m_c_m_max",
      label = _("Maximum marines"),
      priority = 95,
      choices = MARINE_CLOSET_TUNE.COUNT,
      default = "5",
      tooltip = "Sets most amount of marines that can spawn per closet.",
    }

    m_c_tech =
    {
      name = "m_c_ttech",
      label = _("Weapon tech level"),
      priority = 94,
      choices = MARINE_CLOSET_TUNE.TECH,
      default = "mid",
      tooltip = "Influences weapons that marines spawn with " ..
      "Low tech: Pistols, with some rare chainguns and shotguns" ..
	  "Mid tech: Shotguns/Chainguns with some rare pistols, super shotguns, rocket launchers and plasma rifles" ..
	  "High tech: Rocket launchers/Plasma rifles with some rare BFGs and super shotguns" ..
	  "Mix it up: Any weapon goes" ..
	  "Progressive: Marines start with pistols and get more powerful through episode/megawad",
    }

    m_c_power =
    {
      name = "m_c_power",
      label = _("Strong Marines"),
      priority = 93,
      choices = MARINE_CLOSET_TUNE.YN,
      default = "yes",
      tooltip = "Influences whether marines are as accurate and rapid firing as player, or are weaker.",
    }

    m_c_follow =
    {
      name = "m_c_follow",
      label = _("Followers"),
      priority = 92,
      choices = MARINE_CLOSET_TUNE.YN,
      default = "no",
      tooltip = "By default marines try to follow the player if they have nothing else to do but would otherwise prioritize chasing enemies, and are also unable to follow player through rough terrain." ..
	  "If this is enabled marines will much harder prioritize following player and will teleport if they are too far away.",
    }

    m_c_health =
    {
      name = "m_c_health",
      label = _("Marine Health"),
      priority = 91,
      choices = MARINE_CLOSET_TUNE.HEALTH,
      default = "100",
      tooltip = "Influences how much damage marines can take before dying.",
    }
	
	m_c_waker =
	{
	  name = "m_c_waker",
      label = _("Trigger Type"),
      priority = 90,
      choices = MARINE_CLOSET_TUNE.WAKER,
      default = "default",
      tooltip = "Influences the trigger that activates marines." ..
	  "Sight: Marine closet activates once it can 'see' the player." ..
	  "Range: Closet activates when player is close enough, even if behind wall." ..
	  "Close Range: same as range except requires player to be really really close." ..
	  "Map Start: Closets are active on map start.",
	}
	
    m_c_quantity =
    {
      name = "m_c_quantity",
      label = _("Monster Quantity Multiplier"),
      priority = 89,
      choices = MARINE_CLOSET_TUNE.QUANTITY,
      default = "default",
      tooltip = "Influences amount of monsters in rooms with a marine closet.",
    }
	
    m_c_strength =
    {
      name = "m_c_strength",
      label = _("Monster Strength Multiplier"),
      priority = 88,
      choices = MARINE_CLOSET_TUNE.STRENGTH,
      default = "default",
      tooltip = "Influences strength of monsters in rooms with a marine closet.",
    }
  }
}
]]