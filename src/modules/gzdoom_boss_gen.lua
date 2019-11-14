BOSS_GEN_TUNE = {}

BOSS_GEN_TUNE.BOSS_DIFF_CHOICES =
{
  "easier",    _("Easier"),
  "default", _("Moderate"),
  "harder", _("Harder"),
  "nightmare", _("Nightmare"),
}

BOSS_GEN_TUNE.BOSS_HEALTH_CHOICES =
{
  "muchless", _("Reduced by 50%"),
  "less", _("Reduced by 25%"),
  "default",  _("Default"),
  "more",  _("Increased by 50%"),
  "muchmore",  _("Increased by 100%"),
  "demiosmode",  _("Increased by 200%"),
}

BOSS_GEN_TUNE.BOSS_HEALTH_BAR =
{
  "yes", _("Yes"),
  "no",  _("No"),
}

BOSS_GEN_TUNE.BOSS_MUSIC =
{
  "yes", _("Yes"),
  "no",  _("No"),
}

BOSS_GEN_TUNE.BOSS_LESS_HITSCAN =
{
  "default", _("No"),
  "less",  _("50% less"),
  "muchless",  _("80% less"),
}

BOSS_GEN_TUNE.TEMPLATES =
{
  ZSC =
[[
class BossGenerator_Handler : EventHandler
{
    bool bossEnabled;
    bool bossFound;
    int currentboss;
    bool IsBoss(actor a)
    {
        int ln = level.LevelNum;
        if(a.angle==ln || a.angle==45+ln || a.angle==90+ln || a.angle==135+ln || a.angle==180+ln || a.angle==225+ln || a.angle==270+ln || a.angle==315+ln)
        { return true;}
        else
        { return false;}
    }
    void SpreadMissile(actor Misl, float ang)
    {
        let proj = Misl.SpawnMissileAngleZSpeed(Misl.Pos.z, Misl.GetClassName(), Misl.Angle+ang, Misl.vel.z, Misl.Speed, Misl.Target,0);
        if(proj)
        {
            proj.A_GiveInventory("bossabilitygiver_spread");
            proj.target = Misl.Target;
            proj.tracer = Misl.Tracer;
        }
    }
    override void WorldLoaded(WorldEvent e)
    {
        LEVELCODE
    }
    Override void WorldThingSpawned(WorldEvent e)
    {
        if(!bossEnabled) return;
        if( e.Thing && e.Thing.bMISSILE && e.Thing.GetMissileDamage(7,1)>0 && e.Thing.Target && e.Thing.Target.CountInv("bossabilitygiver_boss") && e.Thing.GetClassname() != "BossSpook" )
        {
            ThinkerIterator BossFinder = ThinkerIterator.Create("bossController");
            bossController mo;
            while (mo = bossController(BossFinder.Next()))
            {
                mo.LProj=e.Thing.GetClassname();
                if(mo.FProj==""){ mo.FProj=e.Thing.GetClassname(); }
            }
        }
        if( e.Thing && e.Thing.bMISSILE && !e.Thing.CountInv("bossabilitygiver_spread") && !e.Thing.CountInv("bossabilitygiver_boss") && e.Thing.Target && e.Thing.Target.CountInv("bossabilitygiver_spread") )
        {
            SpreadMissile(e.Thing, 25.0);
            SpreadMissile(e.Thing, -25.0);
            if( e.Thing.Target.CountInv("bossabilitygiver_spread")>1)
            {
                SpreadMissile(e.Thing, 12.5);
                SpreadMissile(e.Thing, -12.5);
                if( e.Thing.Target.CountInv("bossabilitygiver_spread")>2)
                {
                    SpreadMissile(e.Thing, 37.5);
                    SpreadMissile(e.Thing, -37.5);
                }
            }
        }
        if( e.Thing && e.Thing.bMISSILE && e.Thing.Target && e.Thing.Target.CountInv("bossabilitygiver_bounce") )
        {
            e.Thing.bBOUNCEONWALLS = true;
            e.Thing.bBOUNCEONFLOORS = true;
            e.Thing.bouncefactor = 0.99;
            e.Thing.WallBounceFactor = 0.99;
            e.Thing.bouncecount = 3;
            if( e.Thing.Target.CountInv("bossabilitygiver_bounce")>1 )
            {
                e.Thing.WallBounceFactor = 1.1;
                e.Thing.bouncecount = 9;
            }
            else if( e.Thing.Target.CountInv("bossabilitygiver_bounce")>2 )
            {
                e.Thing.WallBounceFactor = 1.2;
                e.Thing.bouncecount = 20;
            }
        }
        if( e.Thing && e.Thing.bMISSILE && e.Thing.Target && e.Thing.Target.CountInv("bossabilitygiver_pyro") )
        {
            e.Thing.Target.bNORADIUSDMG = true;
            let misl = BossPyroThinker(new("BossPyroThinker"));
            if(misl)
            {
                misl.missile = e.Thing;
                misl.power = e.Thing.Target.CountInv("bossabilitygiver_pyro");
            }
        }
		if( e.Thing && e.Thing.bMISSILE && e.Thing.Target && e.Thing.Target.Target && e.Thing.Target.CountInv("bossabilitygiver_homing") )
		{
			e.Thing.bSEEKERMISSILE = true;
			let misl2 = BossHomingThinker(new("BossHomingThinker"));
			if(misl2)
			{
				misl2.missile = e.Thing;
				e.Thing.tracer = e.Thing.Target.Target;
				misl2.power = e.Thing.Target.CountInv("bossabilitygiver_homing");
			}
		}
        if(level.time > 1) return;
        if( e.Thing && e.Thing.bISMONSTER && IsBoss(e.Thing) )
        {
            if(!bossFound)
            {
                bossFound = true;
                let bossy = bossController(new("bossController"));
                if(bossy)
                {
                    bossy.boss = e.Thing;
                    bossy.level = currentboss;
                }
            }
            else
            {
                e.Thing.ClearCounters();
                e.Thing.Destroy();
            }
        }
        else if( e.Thing && e.Thing.bISMONSTER )
        {
            if(e.Thing.Health < 1000)
            {
            BossSummonSpot mpos = BossSummonSpot(Actor.Spawn('BossSummonSpot', e.Thing.pos));
            mpos.MonsterClass = e.Thing.getClassName();
            }
            e.Thing.ClearCounters();
            e.Thing.Destroy();
        }
    }
	Override void WorldThingDamaged(WorldEvent e)
	{
		if(!bossEnabled) return;
		if(e.thing && e.thing.bISMONSTER && e.thing.CountInv("bossabilitygiver_deflection") && e.DamageSource && e.Inflictor && !e.Inflictor.bMISSILE)
		{
			ThinkerIterator BossFinder = ThinkerIterator.Create("bossController");
			bossController mo;
			int ang;
			while(mo = bossController(BossFinder.Next()))
			{
				ang=mo.boss.AngleTo(e.DamageSource);
				if(e.thing.CountInv("bossabilitygiver_deflection")==3)
				{
					ang=ang+random(-10,10);
				}
				else if(e.thing.CountInv("bossabilitygiver_deflection")==2)
				{
					ang=ang+random(-45,45);
				}
				else if(e.thing.CountInv("bossabilitygiver_deflection")==1)
				{
					ang=ang+random(-60,60);
					if(ang > -5 && ang < 0) {ang=-5;}
					if(ang < 5 && ang > 0) {ang=5;}
				}
				mo.SpawnMarkedProjectile("BossBDeflect",ang);
			}
		}
	}
    override void WorldTick()
    {
        if(!bossEnabled) return;
		if(!bossfound && level.time > 1 && level.time < 10)
		{
			console.PrintF("Trying fallback method to detect boss thing");
			ThinkerIterator Fallback = ThinkerIterator.Create("Actor");
			Actor findme;
			while (findme = Actor(Fallback.Next()))
			{
				if( findme && findme.bISMONSTER && IsBoss(findme) )
				{
					bossFound = true;
					let bossy = bossController(new("bossController"));
					if(bossy)
					{
						bossy.boss = findme;
						bossy.level = currentboss;
					}
					console.PrintF("Fallback detection successful");
					Break;
				}
			}
			if(!bossfound) { console.PrintF("Fallback detection failed..."); }
		}
    }
    override void RenderOverlay(RenderEvent event)
    {
        if(!bossEnabled) return;
        if (level.time == 10 && !bossfound)
        {
            console.PrintF("There has been a problem spawning a boss!");
        }
        BOSSHPBAR
    }
}

class bossController : thinker
{
    actor boss;
    bool bossactive;
    bool bossdead;
    int ending;
    int summoncd;
    int phase;
    int teleportcd;
    int pcirclecd;
    state prevState;
    int level;
    int bossdelay;
    string FProj;
    string LProj;
    int prevhealth;
	int reflect;
	bool spooky;
    static const class<inventory> abil[] =
    {
        TRAITS
    };
    static const class<inventory> abilstart[] =
    {
        TRAITX
    };
    static const class<inventory> abilstart2[] =
    {
        TRAITZ
    };
    static const int bosshealth[] =
    {
        BHEALTH
    };
    static const int bosssummon[] =
    {
        BSUMMON
    };
    static const string type[] =
    {
        BTYPE
    };
    int ActivateSpawners(int count, int radius)
    {
        ThinkerIterator SpotFinder = ThinkerIterator.Create("BossSummonSpot");
        BossSummonSpot mo;
        while (mo = BossSummonSpot(SpotFinder.Next()))
        {
            if(mo && boss.Distance2D(mo) < radius)
            {
                if(count>0)
                {
                    count--;
                    mo.Activated=true;
                }
            }
        }
        return count;
    }
    void SpawnMarkedProjectile(string pclass, float angle)
    {
        let proj = boss.SpawnMissileAngle(pclass, angle, 0);
        if(proj) { proj.A_GiveInventory("bossabilitygiver_boss"); proj.tracer = boss.target; }
    }
    override void PostBeginPlay()
    {
        super.PostBeginPlay();
        if(boss)
        {
            if(boss.health < 300)
            {
                boss.PainChance*=0.5;
                boss.mass *= 2;
                boss.A_GiveInventory(abilstart2[level-1]);
                boss.DamageMultiply *= 2;
            }
            if(boss.health < 1000)
            {
                boss.PainChance*=0.5;
                boss.mass *= 2;
            }
            if(boss.Health < 2000)
            {
                if(boss.Radius<48)
                {
                    boss.scale *= 2;
                    boss.A_SetSize(boss.Radius*2, boss.Height*2, false);
                }
                else
                {
                    boss.scale *= 1.5;
                    boss.A_SetSize(boss.Radius*1.5, boss.Height*1.5, false);
                }
                if(type[level-1]=="melee")
                {
                    boss.meleerange*=2;
                }
                boss.bALWAYSFAST = true;
                boss.A_GiveInventory(abilstart[level-1]);
                boss.mass *= 1.5;
            }
            boss.Health = bosshealth[level-1];
            boss.starthealth = boss.health / G_SkillPropertyFloat(SKILLP_MonsterHealth);
            boss.bBOSS = true;
            boss.bNOTARGET = true;
            boss.bNOINFIGHTING = true;
            boss.bLOOKALLAROUND = true;
            boss.bTHRUSPECIES = true;
            boss.Species = "IAmTheBoss";
            boss.SetTag(Stringtable.Localize(string.format("%s%i","$BOSS_NAME",level)));
            boss.PainChance*=0.5;
            boss.A_GiveInventory("bossabilitygiver_boss");
        }
    }
    override void Tick()
    {
        super.Tick();
        if(bossactive && !bossdead && !boss)
        {
            bossdead = true;
            ThinkerIterator Fixer = ThinkerIterator.Create("Actor");
            Actor fixthefix;
            while (fixthefix = Actor(Fixer.Next()))
            {
                fixthefix.A_PrintBold(Stringtable.Localize(string.format("%s%i","$BOSS_DEATH",level)));
                fixthefix.A_Quake(6,150,0,2048);
                break;
            }
        }
        if(bossdead)
        {
            ending++;
        }
        if(ending>50)
        {
            Thing_Destroy(0);
        }
        if(ending>350)
        {
            Exit_Normal(0);
        }
        if(boss)
        {
			if(boss.CountInv("bossabilitygiver_spook") && !spooky && bossactive)
			{
				spooky = true;
				SpawnMarkedProjectile("BossSpook",0);
			}
			if(boss.CountInv("bossabilitygiver_deflection"))
			{
				if(boss.CountInv("bossabilitygiver_deflection") == 1 && reflect < 1)
				{
					boss.bREFLECTIVE = true;
					reflect++;
				}
				if(boss.CountInv("bossabilitygiver_deflection") == 2 && reflect < 2)
				{
					boss.bMIRRORREFLECT = true;
					reflect++;
				}
				if(boss.CountInv("bossabilitygiver_deflection") == 3 && reflect < 3)
				{
					boss.bMIRRORREFLECT = false;
					boss.bAIMREFLECT = true;
					reflect++;
				}
			}
            if(boss.target && !bossactive)
            {
                bossactive = true;
                boss.A_PrintBold(Stringtable.Localize(string.format("%s%i","$BOSS_TAUNT",level)));
                boss.A_Quake(6,60,0,2048);
                MUSIC
            }
            if(boss.health > 0 && boss.health < boss.starthealth*0.75 && summoncd == 0)
            {
                summoncd = self.bosssummon[level-1];
                int count = 5;
                int leftover = ActivateSpawners(count,512);
                if(leftover>0)
                {
                    ActivateSpawners(leftover,1024);
                }
            }
            if(boss.health > 0 && boss.health < boss.starthealth*(0.3*(3-phase)))
            {
                boss.A_PlaySound(boss.SeeSound,CHAN_AUTO,1.0,false,ATTN_NONE);
                boss.A_GiveInventory(abil[((level-1)*3)+phase]);
                boss.A_Quake(6,60,0,2048);
                phase++;
            }
            if(boss.health < 1 && !bossdead)
            {
                boss.A_PrintBold(Stringtable.Localize(string.format("%s%i","$BOSS_DEATH",level)));
                boss.A_Quake(6,150,0,2048);
                bossdead = true;
            }
            if(boss.health > prevhealth)
            {
                prevhealth = boss.health;
            }
            if(boss.health < prevhealth && boss.health > 0)
            {
                prevhealth = boss.health;
                if(boss.CountInv("bossabilitygiver_dmgshot"))
                {
                    for(int i = 0; i < boss.CountInv("bossabilitygiver_dmgshot")*2; i++ )
                    {
                        if(FProj=="") { FProj = "CacodemonBall";}
                        SpawnMarkedProjectile(FProj,random(0,359));
                    }
                }
            }
            if(summoncd > 0)
            {
                summoncd--;
            }
            if(teleportcd > 0)
            {
                teleportcd--;
            }
            if(pcirclecd > 0)
            {
                pcirclecd--;
            }
            if(boss.health > 0 && boss.target && teleportcd == 0 && boss.CountInv("bossabilitygiver_teleport"))
            {
            if(boss.CountInv("bossabilitygiver_teleport")>1)
            {
            teleportcd = 200;
            }
            else if (boss.CountInv("bossabilitygiver_teleport")>2)
            {
            teleportcd = 60;
            }
            else
            {
            teleportcd = 800;
            }
            bossdelay=35;
            int maxstep = random(50,50*2);
            boss.A_SpawnItemEx("TeleportFog");
            boss.bJUMPDOWN = true;
            boss.bTHRUACTORS = true;
            boss.MaxDropOffHeight = 512;
            boss.MaxStepHeight = 512;
            boss.A_SetAngle(boss.angle+randompick(-90,-45,0,+45,+90));
            for(int i = 0; i < maxstep; i++)
                {
                boss.A_Chase(null, null,CHF_NORANDOMTURN);
                boss.A_SpawnItemEx("TeleportFog",random(-32,32),random(-32,32),random(0,64));
                }
            boss.bJUMPDOWN = boss.default.bJUMPDOWN;
            boss.bTHRUACTORS = boss.default.bTHRUACTORS;
            boss.MaxDropOffHeight = boss.default.MaxDropOffHeight;
            boss.MaxStepHeight = boss.Default.MaxStepHeight;
            boss.A_SpawnItemEx("TeleportFog");
            }
            if(boss.health > 0 && boss.target && pcirclecd == 0 && boss.CountInv("bossabilitygiver_pcircle"))
            {
            if(boss.CountInv("bossabilitygiver_pcircle")>1)
            {
            pcirclecd = 250;
            }
            else if (boss.CountInv("bossabilitygiver_pcircle")>2)
            {
            pcirclecd = 50;
            }
            else
            {
            pcirclecd = 500;
            }
            if(FProj=="") { FProj = "CacodemonBall";}
            for(int i = 0; i < 18; i++)
            {
                SpawnMarkedProjectile(FProj,i*20);
            }
            }
            if(bossdelay > 0)
            {
                boss.bJUSTATTACKED = true;
                bossdelay--;
            }
            if(boss.health > 0 && boss.CountInv("bossabilitygiver_speed"))
            {
            double multi;
            if(boss.CountInv("bossabilitygiver_speed")>1)
            {
            multi=2.0;
            }
            else if (boss.CountInv("bossabilitygiver_speed")>2)
            {
            multi=3.0;
            }
            else
            {
            multi=1.5;
            }
            if (prevState != boss.curState)
            { boss.A_SetTics (boss.tics / multi); }
            prevState = boss.curState;
            }
        }
    }
}

class BossPyroThinker : Thinker
{
    actor missile;
    int power;
    int fx;
    override void Tick()
    {
        super.Tick();
        if(fx>0)
        {
            fx--;
        }
        if(missile && fx==0)
        {
            missile.A_SpawnItemEx("BossPyroFire", flags:SXF_NOCHECKPOSITION);
            fx=5;
        }
        if(missile && missile.InStateSequence(missile.CurState, missile.ResolveState("Death")))
        {
            actor fire;
            BossPyroSpreadFire truefire;
            bool fireb;
            [fireb, fire] = missile.A_SpawnItemEx("BossPyroSpreadFire", xofs:-24, flags:SXF_NOCHECKPOSITION);
            If(fire)
            {
                truefire = BossPyroSpreadFire(fire);
                truefire.power = power;
                truefire.scale *= power;
            }
            missile.A_Explode(missile.GetMissileDamage(7,1)/2,128);
            missile.A_PlaySound("weapons/rocklx");
            self.Destroy();
        }
        if(!missile)
        {
            self.Destroy();
        }
    }
}

class BossHomingThinker : Thinker
{
	actor missile;
	int power;
	int fx;
	override void Tick()
	{
		super.Tick();
		if(fx>0)
		{
			fx--;
		}
		if(missile && fx==0)
		{
			missile.A_SpawnItemEx("BulletPuff", flags:SXF_NOCHECKPOSITION);
			fx=2;
			if(missile && !missile.InStateSequence(missile.CurState, missile.ResolveState("Death")))
			{
				missile.A_SeekerMissile(1,3*power);
			}
		}
		if(!missile)
		{
			self.Destroy();
		}
	}
}

class BossPyroFire : Actor
{
    Default
    {
        +NOBLOCKMAP +NOGRAVITY +ZDOOMTRANS
        RenderStyle "Add";
        Alpha 0.5;
        Scale 0.5;
    }
    States
    {
    Spawn:
        FIRE ABABCBCBCDCDCDEDEDEFEFEFGHGHGH 1 BRIGHT;
        Stop;
    }
}
class BossPyroSpreadFire : BossPyroFire
{
    int dmgcd;
    int power;
    Default
    {
        Scale 2.0;
    }
    States
    {
    Spawn:
        FIRE ABABCBCBCDCDCDEDEDEFEFEFGHGHGH 2 BRIGHT A_SetTics(1+2*power);
        Stop;
    }
    override void Tick()
    {
        super.Tick();
        if(dmgcd==0)
        {
            dmgcd=10;
            A_Explode(1+2*power,96+(32*power));
        }
        else
        {
            dmgcd--;
        }
    }
}

class BossBDeflect : Actor
{
	Default
	{
		Radius 6;
		Height 8;
		Speed 20;
		Damage 3;
		Projectile;
		RenderStyle "Add";
		Alpha 1;
	}
	States
	{
	Spawn:
		PUFF A 4 BRIGHT;
		Loop;
	Death:
		PUFF BCDE 6 BRIGHT;
		Stop;
	}
}

class BossSpook : Actor
{
	int power;
	Default
	{
		+NOBLOCKMAP +NOGRAVITY +DROPOFF +NOCLIP +SEEKERMISSILE
		Radius 6;
		Height 8;
		Speed 5;
		Damage 3;
		Projectile;
		RenderStyle "Add";
		Alpha 0.5;
		Scale 1.5;
	}
	States
	{
	Spawn:
		SKUL CD 4 BRIGHT;
		Loop;
	Death:
		SKUL FGHIJK 6 BRIGHT;
		Stop;
	}
	override void Tick()
	{
		super.Tick();
		if(target && target.health > 0)
		{
			power = target.CountInv("bossabilitygiver_spook");
			tracer = target.target;
			A_Explode(1,32,0,0,32);
			A_SeekerMissile(1,3*power);
			Speed=8+(3*(power-1));
		}
		else
		{
			if(power < 4)
			{
				SetState(FindState("Death",true));
				power = 4;
			}
		}
	}
}

class bossabilitygiver : Inventory
{
    default
    {
    +INVENTORY.UNDROPPABLE;
    +INVENTORY.UNTOSSABLE;
    Inventory.maxAmount 3;
    }
}

class BossSummonSpot : Actor
{
    string MonsterClass;
    bool Activated;
    Default { +NOINTERACTION }
    override void Tick()
    {
        super.Tick();
        if(Activated)
        {
            actor mon;
            bool done;
            [done, mon] = self.A_SpawnItemEx(MonsterClass);
            if(mon)
            {
                mon.bNOTARGET = 1;
                mon.bLOOKALLAROUND = 1;
            }
            SpawnTeleportFog(self.pos,0,0);
            Activated = false;
        }
    }
}

//special
class bossabilitygiver_nothing : bossabilitygiver { }
class bossabilitygiver_boss : bossabilitygiver { }
//passive
class bossabilitygiver_speed : bossabilitygiver { }
class bossabilitygiver_dmgshot : bossabilitygiver { }
class bossabilitygiver_deflection : bossabilitygiver { }
class bossabilitygiver_spook : bossabilitygiver { }
//major cooldown
class bossabilitygiver_teleport : bossabilitygiver { }
class bossabilitygiver_pcircle : bossabilitygiver { }
//projectile only
class bossabilitygiver_spread : bossabilitygiver { }
class bossabilitygiver_pyro : bossabilitygiver { }
class bossabilitygiver_bounce : bossabilitygiver { }
class bossabilitygiver_homing : bossabilitygiver { }
]]
  BAR = [[if(bossFound)
        {
        ThinkerIterator BossFinder = ThinkerIterator.Create("bossController");
        bossController mo;
        while (mo = bossController(BossFinder.Next()))
        {
            if(mo.boss && mo.bossactive && !mo.bossdead)
            {
            int bars = (mo.boss.health * 20) / mo.boss.starthealth;
            string barsx;
            for(int i = 0; i<bars; i++)
            {
                barsx.AppendFormat("I");
            }
            string bosshp = string.format("%%s %%s %%s", Stringtable.Localize(string.format("%%s%%i","$BOSS_NAME",currentboss)), ":", barsx);
            screen.DrawText(BigFont, Font.CR_RED, 32, -32, bosshp, DTA_Clean, true);
            }
        }
        }
]]
  LVL = [[if(level.LevelNum == NUM)
        {
            bossEnabled = true;
            currentboss = CNT;
        }
]]
  MUS = [[S_ChangeMusic(string.format("%%s%%i","d_boss",level), 0, true, false);]]
}

BOSS_GEN_TUNE.TAUNTS =
{
  -- Scionox
  ["YOU CANNOT HANDLE THE POWER OF THE INFINITE HELL"] = 50
  ["YOU ARE DOOMED!"] = 50

  -- MSSP
  ["YOUR SOUL WILL BE MINE"] = 50
  ["AH. FRESH MEAT"] = 50
  ["HELL IS INFINITE"] = 50
  ["WE ARE LEGION"] = 50

  ["SHED THE BLOOD OF THE INNOCENTS"] = 50
  ["DARKNESS REIGNS"] = 50
  ["YOUR HEAD MAKES A FINE TROPHY"] = 50
  ["I WILL FEAST ON YOUR SOUL"] = 50
  ["I WILL PLAY HOPSCOTCH ON YOUR CHEST CAVITY"] = 50

  ["I SACRIFICE THEE TO THE BURNING VOID"] = 50
  ["THY FLESH CONSUMED. THY SOUL DEVOURED."] = 50
  ["GAZE UPON THE ABYSS, MORTAL"] = 50
  ["I AM THE END OF ALL THINGS"] = 50
  ["I WILL DRAG YOUR ENTRAILS INTO THE DARK AETHER"] = 50

  ["ALL DEMONS SERVE. ALL MEN DIE."] = 50
  ["I HAVE COME FOR HELL'S BOUNTY UPON YOU"] = 50
  ["BEG FOR YOUR LIFE, MORTAL"] = 50
  ["ANGELS FEAR WHERE I TREAD AND SO WILL YOU"] = 50
  ["YOU WILL FIND ONLY DEATH HERE, MORTAL"] = 50

  ["DOOMSLAYER! HELL REVEALS ITSELF TO YOU!"] = 50
  ["WHO DARES ENTER MY REALM?"] = 50
  ["YOU ARE NO HERO, MORTAL. HELL IS INFINITE"] = 50
  ["I WILL DESTROY EVERYTHING YOU HAVE EVER LOVED"] = 50
  ["WE FINALLY MEET, DOOMSLAYER"] = 50

  ["STEP INTO THE FOLD. I WILL UNMAKE YOU"] = 50
  ["THE END OF YOU IS REVEALED"] = 50
  ["TO BEAT THE GAME, YOU MUST BEAT ALL OF HELL, DOOMSLAYER"] = 50
  ["SUFFER ME NOW"] = 50
  ["YOU CREATED ME, MORTAL. YOU TRULY HAVE"] = 50

  ["I WILL BREAK YOU LIKE A WISHBONE"] = 50
  ["I CANNOT WAIT TO WEAR YOU FLESH, DOOMSLAYER!"] = 50
  ["I HUNGER."] = 50
  ["I THIRST FOR MORTAL FLESH AND BLOOD"] = 50
  ["THE DEATH OF ALL THINGS IS NIGH"] = 50

  ["YOU ARE BUT A MORTAL IN THE WRONG PLACE. I WILL SHOW YOU WHY."] = 50
  ["THIS IS NO PLACE FOR A HERO"] = 50
  ["NO GODS OR KINGS. ONLY HELL AND BEYOND."] = 50
  ["THE WORLD FEARS ITS INEVITABLE DEMISE. AND ME."] = 50
  ["THERE IS NO SALVATION FOR THE WICKED. YOU AND ME."] = 50

  ["LONG WILL BE YOUR SUFFERING. JOYOUS WILL BE YOUR PAIN."] = 50
  ["I AM THE DESTROYER OF WORLDS."] = 50
  ["I WILL ANOINT MY BLADES WITH YOUR BLOOD"] = 50
  ["A LITTLE FLEA. I AM INCLINED TO SCRATCH."] = 50
  ["FOOLISH CUR. THE DARKNESS SURROUNDS YOU."] = 50

  ["THE WORLD BURNS AND YOU WILL BE AMONG THE ASHES"] = 50

  ["I wasn't supposed to be here today"] = 10 -- rare
  ["You wanna go, bro? You wanna go?"] = 10 -- rare
  ["Never gonna give you up, never gonna let you down"] = 10 --rare

  -- Beed28
  ["A MAN LIKE YOU IS NOTHING BUT A MISERABLE PILE OF SECRETS"] = 50
  ["WELCOME... TO DIE!"] = 50

  -- Craneo
  ["GREETINGS, MORTAL. ARE YOU READY TO DIE?"] = 50
  ["WE HAVE SUCH SIGHTS TO SHOW YOU"] = 50
  ["WE WILL TEAR YOUR SOUL APART"] = 50
  ["YOUR SUFFERING WILL BE LEGENDARY, EVEN IN HELL!"] = 50

  ["PAIN HAS A FACE. I WILL SHOW IT TO YOU."] = 50
  ["WELCOME TO YOUR DEATH, MORTAL!"] = 50
  ["DID YOU HOPE TO ACCOMPLISH ANYTHING BY COMING HERE?"] = 50
  ["ONLY SUFFERING AND PAIN AWAITS YOU FURTHER ON"] = 50
  ["YOUR JOURNEY IS FUTILE. YOU WILL DIE AND YOU SOUL WILL BE MINE."] = 50

  ["THERE IS NO ESCAPE"] = 50
  ["DEATH IS NOT YOUR END. YOUR SOUL WILL BURN IN HELL FOREVER."] = 50
  ["EVERY STEP TAKEN BRINGS YOUR SOUL CLOSER TO ME"] = 50

  ["IT WAS ME WHO RUINED THE TOILETS!!!"] = 10 -- rare
  ["Giggity"] = 10 -- rare

  -- Tapwave
  ["YOU WILL NEVER FIND WHAT YOU SEEK. IT IS TRAPPED IN HELL FOREVER."] = 50

  -- Demios
  ["YOU? HERE?! ARGH! INCOMPETENTS ALL OF THEM!"] = 50
  ["WHEN I'M DONE WITH YOU, I WILL SEE TO YOUR ETERNAL SUFFERING"] = 50
  ["YOU DARE INTERFERE, MORTAL?"] = 50
  ["YOU WILL RELIVE THIS NIGHTMARE FOREVER"] = 50

  -- EpicTyph
  ["SMASH. TIME TO SMASH!"] = 50
  ["YOUR KIND ARE OVER"] = 50

  -- Mogwaltz
  ["HOW MANY OF YOUR MISBEGOTTEN KIND I MUST SQUASH?"] = 50

  -- Frozsoul
  ["ALL YOUR BASE ARE BELONG TO US"] = 10 -- rare

  -- retxirT
  ["WHY MUST I DO EVERYTHING MYSELF?"] = 50
  ["YOUR STAY OF EXECUTION IS OVER. I HAVE COME TO DELIVER."] = 50
}

BOSS_GEN_TUNE.DEATHS =
{
  -- Scionox
  ["NOOOO, I SHALL RETURN!!!"] = 50
  ["NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO!"] = 50

  -- MSSP
  ["GRAAAAAHHH!!"] = 50
  ["GRRRRHHHHH!"] = 50
  ["THIS IS NOT THE END, MORTAL"] = 50
  ["THIS IS NOT OVER, MORTAL"] = 50
  ["HELL WILL NOT FORGIVE"] = 50

  ["HELL'S CHAMPIONS SHALL RISE WHERE I FALL"] = 50
  ["DESTROYING ME DOES NOT DESTROY HELL"] = 50
  ["HELL STILL REIGNS ETERNAL"] = 50
  ["THERE WILL BE MORE COMING YOUR WAY, MORTAL"] = 50

  ["And I thought I was retiring tomorrow"] = 5
  ["MY LUNCH!"] = 5

  -- Craneo
  ["CURSE YOU AND YOUR DESCENDANTS!"] = 50
  ["NOT EVEN THE PITS OF HELL WILL CONTAIN MY REVENGE"] = 50
  ["YOU ARE NOW WORTHY OF FIGHTING MY MASTER"] = 50
}

BOSS_GEN_TUNE.TRAITS =
{
    SPEED =
    {
        name = '"bossabilitygiver_speed"'
        probmisl = 60
        probscan = 0
        probmele = 90
        difffact = 1.1
        mislfact = 1.1
		mindiff = -1
    }
    DMGSHOT =
    {
        name = '"bossabilitygiver_dmgshot"'
        probmisl = 50
        probscan = 40
        probmele = 50
        difffact = 1.2
        mislfact = 1.3
		mindiff = 1
    }
    TELEPORT =
    {
        name = '"bossabilitygiver_teleport"'
        probmisl = 50
        probscan = 50
        probmele = 80
        difffact = 1.1
        mislfact = 1.1
		mindiff = -1
    }
    PCIRCLE =
    {
        name = '"bossabilitygiver_pcircle"'
        probmisl = 50
        probscan = 40
        probmele = 60
        difffact = 1.1
        mislfact = 1.3
		mindiff = -1
    }
    SPREAD =
    {
        name = '"bossabilitygiver_spread"'
        probmisl = 30
        probscan = 0
        probmele = 0
        difffact = 1.0
        mislfact = 1.6
		mindiff = -1
    }
    PYRO =
    {
        name = '"bossabilitygiver_pyro"'
        probmisl = 50
        probscan = 0
        probmele = 0
        difffact = 1.0
        mislfact = 1.3
		mindiff = -1
    }
    BOUNCE =
    {
        name = '"bossabilitygiver_bounce"'
        probmisl = 40
        probscan = 0
        probmele = 0
        difffact = 1.0
        mislfact = 1.4
		mindiff = 1
    }
    HOMING =
    {
        name = '"bossabilitygiver_homing"'
        probmisl = 50
        probscan = 0
        probmele = 0
        difffact = 1.0
        mislfact = 1.4
		mindiff = -1
    }
    DEFLECTION =
    {
        name = '"bossabilitygiver_deflection"'
        probmisl = 20
        probscan = 30
        probmele = 40
        difffact = 1.3
        mislfact = 1.1
		mindiff = 1
    }
	SPOOK =
    {
        name = '"bossabilitygiver_spook"'
        probmisl = 40
        probscan = 40
        probmele = 30
        difffact = 1.2
        mislfact = 1.2
		mindiff = -1
    }
}

function BOSS_GEN_TUNE.grab_random_taunt()
  return rand.key_by_probs(BOSS_GEN_TUNE.TAUNTS)
end

function BOSS_GEN_TUNE.grab_random_death()
  return rand.key_by_probs(BOSS_GEN_TUNE.DEATHS)
end

function BOSS_GEN_TUNE.grab_random_trait(btype, etraits)
  local traits = {}

  each name,info in BOSS_GEN_TUNE.TRAITS do

    local tprob
	local stack = 0

    if btype == "melee" and info.probmele > 0 then
      tprob = info.probmele
      tprob = tprob * (((info.difffact-1.0) * PARAM.boss_gen_dmult)+1)
    elseif btype == "hitscan" and info.probscan > 0 then
      tprob = info.probscan
      tprob = tprob * (((info.difffact-1.0) * PARAM.boss_gen_dmult)+1)
    elseif btype == "missile" and info.probmisl > 0 then
      tprob = info.probmisl
      tprob = tprob * (((info.mislfact-1.0) * PARAM.boss_gen_dmult)+1)
    end
	if(info.mindiff>PARAM.boss_gen_dmult) then
	  tprob = 0
	end
	if etraits != nil then
      each etrait,einfo in etraits do
	    if einfo == info.name then
		  stack = stack + 1
		  if PARAM.boss_gen_dmult < 0 then
		    tprob = int(tprob * 0.25)
		  elseif PARAM.boss_gen_dmult > 1 then
	        tprob = tprob * 2
		  end
	    end
	  end
	  if stack == 3 then
	    tprob = 0
	  end
	end
	if tprob == nil then
	  tprob = 0
	end
    traits[info.name] = tprob

  end

  local trait = rand.key_by_probs(traits)

  return trait
end

function BOSS_GEN_TUNE.syntaxize(str, str2)
  local final
  if str == "" then
    final = str .. str2
  else
    final = str .. ",\n" .. str2
  end
  return final
end

function BOSS_GEN_TUNE.check_gotchas_enabled()
  if OB_CONFIG.procedural_gotchas == "none"
  and PARAM.boss_gen then
    error("Procedural gotchas must be enabled for boss generator!")
  end
end

function BOSS_GEN_TUNE.setup(self)
  PARAM.boss_gen = true
  PARAM.boss_types = {}
  PARAM.lvlstr = ""
  PARAM.BOSSSCRIPT = ""
  PARAM.boss_count = 1

  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end

  if PARAM.boss_gen_health == "muchless" then
    PARAM.boss_gen_mult = 0.5
  elseif PARAM.boss_gen_health == "less" then
    PARAM.boss_gen_mult = 0.75
  elseif PARAM.boss_gen_health == "default" then
    PARAM.boss_gen_mult = 1.0
  elseif PARAM.boss_gen_health == "more" then
    PARAM.boss_gen_mult = 1.5
  elseif PARAM.boss_gen_health == "muchmore" then
    PARAM.boss_gen_mult = 2.0
  elseif PARAM.boss_gen_health == "demiosmode" then
    PARAM.boss_gen_mult = 3.0
  end

  if PARAM.boss_gen_diff == "easier" then
    PARAM.boss_gen_dmult = -1.0
  elseif PARAM.boss_gen_diff == "default" then
    PARAM.boss_gen_dmult = 1.0
  elseif PARAM.boss_gen_diff == "harder" then
    PARAM.boss_gen_dmult = 2.0
  elseif PARAM.boss_gen_diff == "nightmare" then
    PARAM.boss_gen_dmult = 3.0
  end
end

function BOSS_GEN_TUNE.end_lvl()
  if LEVEL.is_procedural_gotcha then
    local scripty = BOSS_GEN_TUNE.TEMPLATES.LVL

    scripty = string.gsub(scripty, "NUM", LEVEL.id)
    scripty = string.gsub(scripty, "CNT", PARAM.boss_count)

    PARAM.boss_count = PARAM.boss_count + 1
    PARAM.lvlstr = PARAM.lvlstr .. scripty .. "\n"
  end
end

function BOSS_GEN_TUNE.all_done()

  local scripty = BOSS_GEN_TUNE.TEMPLATES.ZSC
  local btrait = ""
  local btrait2 = ""
  local btrait3 = ""
  local bhealth = ""
  local bsummon = ""
  local btype = ""

  if PARAM.boss_count <= 1 then
    -- nothing happens and everyone is just sad
	warning("No procedural gotchas found by boss generator")
	PARAM.boss_count = -1
    return
  end

  scripty = string.gsub(scripty, "LEVELCODE", PARAM.lvlstr)

  if PARAM.boss_gen_hpbar == "yes" then
    scripty = string.gsub(scripty, "BOSSHPBAR", BOSS_GEN_TUNE.TEMPLATES.BAR)
  else
    scripty = string.gsub(scripty, "BOSSHPBAR", "")
  end

  if PARAM.boss_gen_music == "yes" then
    scripty = string.gsub(scripty, "MUSIC", BOSS_GEN_TUNE.TEMPLATES.MUS)
  else
    scripty = string.gsub(scripty, "MUSIC", "")
  end

  for name,info in pairs(PARAM.boss_types) do
    local bhp = info.health
    local batk = info.attack
	local traitstack = {}
	local ttrait
	if(bhp<2000) then
	  ttrait = BOSS_GEN_TUNE.grab_random_trait(batk,traitstack)
	  table.insert(traitstack, ttrait)
      btrait2 = BOSS_GEN_TUNE.syntaxize(btrait2,ttrait)
    else
      btrait2 = BOSS_GEN_TUNE.syntaxize(btrait2,'"bossabilitygiver_nothing"')
    end

    if(bhp<300) then
      ttrait = BOSS_GEN_TUNE.grab_random_trait(batk,traitstack)
	  table.insert(traitstack, ttrait)
      btrait3 = BOSS_GEN_TUNE.syntaxize(btrait3,ttrait)
    else
      btrait3 = BOSS_GEN_TUNE.syntaxize(btrait3,'"bossabilitygiver_nothing"')
    end
	for i = 0,2,1 do
	  ttrait = BOSS_GEN_TUNE.grab_random_trait(batk,traitstack)
	  table.insert(traitstack, ttrait)
	  btrait = BOSS_GEN_TUNE.syntaxize(btrait,ttrait)
	end

    local batkx = "\"" .. batk .. "\""

    btype = BOSS_GEN_TUNE.syntaxize(btype,batkx)

    local mult
    local hpcalc

    if bhp<300 then mult=1.5
    elseif bhp<1000 then mult=1.3
    elseif bhp<2000 then mult=1.1
    else mult=1.0 end

    hpcalc = int(rand.pick({5000,5200,5400,5600,5800,6000})*mult*PARAM.boss_gen_mult)

    if batk == "hitscan" then hpcalc = hpcalc*0.75 end

    bhealth = BOSS_GEN_TUNE.syntaxize(bhealth,hpcalc)

    local sumcalc
    local dmult

    if PARAM.boss_gen_dmult < 0 then
      dmult = 1.5
    else
      dmult = 1.0 - (0.25*(PARAM.boss_gen_dmult-1))
    end

    sumcalc = int(rand.pick({400,450,500,550,600})*dmult)
    bsummon = BOSS_GEN_TUNE.syntaxize(bsummon,sumcalc)

  end

  scripty = string.gsub(scripty, "TRAITS", btrait)
  scripty = string.gsub(scripty, "TRAITX", btrait2)
  scripty = string.gsub(scripty, "TRAITZ", btrait3)
  scripty = string.gsub(scripty, "BHEALTH", bhealth)
  scripty = string.gsub(scripty, "BSUMMON", bsummon)
  scripty = string.gsub(scripty, "BTYPE", btype)

  PARAM.BOSSSCRIPT = PARAM.BOSSSCRIPT .. scripty
  PARAM.BOSSLANG = {}
  PARAM.boss_count = PARAM.boss_count - 1

  for i = 1,PARAM.boss_count,1 do

    local demon_name = rand.key_by_probs(namelib.NAMES.GOTHIC.lexicon.e)
    demon_name = string.gsub(demon_name, "NOUNGENEXOTIC", namelib.generate_unique_noun("exotic"))

    -- sometimes add an honorific to add to the boss's evilness
    if rand.odds(50) then -- title
      demon_name = demon_name .. " the " .. rand.key_by_probs(ZDOOM_STORIES.EVIL_TITLES)
    elseif rand.odds(25) then -- places
      demon_name = demon_name .. " of " .. Naming_grab_one("GOTHIC")
    end

    local line = "BOSS_NAME" .. i .. ' = "' .. demon_name .. '";\n'
    table.insert(PARAM.BOSSLANG, line)

    local taunt = BOSS_GEN_TUNE.grab_random_taunt()
    line = "BOSS_TAUNT" .. i .. ' = "' .. demon_name .. ": " .. taunt .. '";\n'
    table.insert(PARAM.BOSSLANG, line)

    local dead = BOSS_GEN_TUNE.grab_random_death()
    line = "BOSS_DEATH" .. i .. ' = "' .. demon_name .. ": " .. dead .. '";\n'
    table.insert(PARAM.BOSSLANG, line)
  end
end


OB_MODULES["gzdoom_boss_gen"] =
{
  label = _("[Exp]GZDoom Boss Generator")

  side = "right"
  priority = 92

  hooks =
  {
    setup = BOSS_GEN_TUNE.setup
    begin_level = BOSS_GEN_TUNE.check_gotchas_enabled
    end_level = BOSS_GEN_TUNE.end_lvl
    all_done = BOSS_GEN_TUNE.all_done
  }

  tooltip=_(
    "[WIP/Experimental]This module replaces procedural gotchas with boss fight arenas.")

  options =
  {
    boss_gen_diff =
    {
      name="boss_gen_diff",
      label=_("Difficulty"),
      choices=BOSS_GEN_TUNE.BOSS_DIFF_CHOICES,
      default="default",
      tooltip = "Increases or reduces chances of boss being based off more powerful monster and getting more powerful traits.",
    }

    boss_gen_health =
    {
      name="boss_gen_health",
      label=_("Health modifier"),
      choices=BOSS_GEN_TUNE.BOSS_HEALTH_CHOICES,
      default = "default",
      tooltip = "Makes boss health higher or lower than default, useful when playing with mods that have different average power level of weapons",
    }

    boss_gen_hitscan =
    {
      name="boss_gen_hitscan",
      label=_("Reduce hitscan chance"),
      choices=BOSS_GEN_TUNE.BOSS_LESS_HITSCAN,
      default = "default",
      tooltip = "Reduces chance of hitscan bosses spawning",
    }

    boss_gen_hpbar =
    {
      name="boss_gen_hpbar",
      label=_("Visible Health Bar"),
      choices=BOSS_GEN_TUNE.BOSS_HEALTH_BAR,
      default = "yes",
      tooltip = "If enabled, an hp bar will appear on UI while boss is active."
    }

    boss_gen_music =
    {
      name = "boss_gen_music",
      label=_("Enable Boss Music"),
      choices=BOSS_GEN_TUNE.BOSS_MUSIC,
      default = "yes",
      tooltip = "If enabled, encountering a boss will start boss theme music.",
    }
  }
}
