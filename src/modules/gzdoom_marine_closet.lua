--------------------------------------------------------------------
--  GZDoom Marine Closets
--------------------------------------------------------------------
--
--  Copyright (C) 2019-2021 MsrShooterPerson
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--------------------------------------------------------------------

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
  "vlow",    _("Very Low Tech"),
  "low",    _("Low Tech"),
  "mid",    _("Mid Tech"),
  "high",    _("High Tech"),
  "rng",    _("Mix It Up"),
  "prog",    _("Progressive"),
  "bfg",    _("BFG Fiesta"),
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
  "default",    _("Unmodified"),
  "harder",    _("Harder"),
  "tough",    _("Tough"),
  "fierce",    _("Fierce"),
}

MARINE_CLOSET_TUNE.SCALING =
{
  "default",    _("Random"),
  "prog",    _("Progressive"),
  "reg",    _("Regressive"),
  "epi",    _("Episodic"),
  "epi2",    _("Regressive Episodic"),
}

MARINE_CLOSET_TUNE.SPRITES =
{
  "no", _("no"),
  "yes1",  _("Yes + Merge"),
  "yes2",  _("Yes + No Merge"),
}

MARINE_CLOSET_TUNE.COLORS =
{
  "MarAI1", _("Green"),
  "MarAI2", _("Grey"),
  "MarAI3", _("Brown"),
  "MarAI4", _("Dark Red"),
  "MarAI5", _("Blue"),
  "MarAI6", _("Purple"),
  "MarAI7", _("White"),
  "MarAI8", _("Yellow"),
  "MarAI9", _("Orange"),
  "MarAI10", _("Dark Blue"),
  "MarAI11", _("Red"),
  "MarAI12", _("Gold"),
  "rng", _("Random OG Doom"),
  "rng2", _("Full Random"),
}

MARINE_CLOSET_TUNE.FRIENDLYFIRE =
{
  "yes", _("Yes"),
  "no2", _("No + Self Damage"),
  "no",  _("No"),
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
    int forgetcd;
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
        +NOBLOCKMONST
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
    override void PostBeginPlay()
    {
        super.PostBeginPlay();
        MTRANSLATE
    }
    override void Tick()
    {
        super.Tick();
        if(inStateSequence(CurState,ResolveState("See"))&&self.bDormant)
        {
            self.bDormant = false;
        }
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
        if(self.bFriendly)
        {
        if(scancd>0)
        {
            scancd--;
        }
        if(followcd>0)
        {
            followcd--;
        }
        if(forgetcd>0)
        {
            forgetcd--;
        }
        if(forgetcd==0)
        {
            A_ClearTarget();
        }
        if(scancd==0)
        {
            ThinkerIterator picker = ThinkerIterator.Create("Actor");
            Actor newtarget;
            while(newtarget = Actor(picker.Next()))
            {
                if(newtarget && self.Distance2D(newtarget) < 2048 && CheckSight(newtarget) && newtarget.bIsMonster && !newtarget.bFriendly && newtarget.health > 0 && newtarget.bShootable)
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
                if(followtarget && self.CheckSight(followtarget) && self.Distance2D(followtarget) < 128)
                {
                    seenplayer = true;
                }
            }
        }
        }
        if(self.target && CheckSight(self.target) && self.target.health > 0 && self.target.bShootable)
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
            if(self.bFriendly)
            {
            forgetcd = 1000;
            if((self.target.target && !self.target.CheckSight(self.target.target))||!self.target.target||(self.target.target && ((self.target.Distance2D(self)-self.target.Distance2D(self.target.target)) < -100)))
            {
                self.target.target = self;
                ThinkerIterator Aggro = ThinkerIterator.Create("Actor");
                Actor allattack;
                while(allattack = Actor(Aggro.Next()))
                {
                    if(allattack && self.Distance2D(allattack) < 2048 && CheckSight(allattack) && allattack.bIsMonster && !allattack.bFriendly && allattack.health > 0)
                    {
                        if(!allattack.target || (allattack.target&&!allattack.CheckSight(allattack.target)) || (allattack.target && ((allattack.Distance2D(self)-allattack.Distance2D(allattack.target)) < -100)))
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
        }
        }
    }
    override int DoSpecialDamage(Actor target, int damage, name damagetype)
    {
        if(target && target is "PlayerPawn" && self.bFriendly)
        {
            return 0;
        }
        return super.DoSpecialDamage(target,damage,damagetype);
    }
    override int TakeSpecialDamage(Actor inflictor, Actor source, int damage, Name damagetype)
    {
        if(source && source is "AIMarine" && source.bFriendly && self.bFriendly)
        {
            MFRIENDLYFIREX
        }
        return super.TakeSpecialDamage(inflictor,source,damage,damagetype);
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
            if(chosenone && chosenone.health > 0 && chosenone.bFriendly && self.Distance2D(chosenone) < 512)
            {
                chosenone.Activate(self);
                chosenone.followcd=1000;
                chosenone.setStateLabel("See");
                ThinkerIterator Enemies = ThinkerIterator.Create("Actor");
                Actor targetthis;
                while(targetthis = Actor(Enemies.Next()))
                {
                    if(targetthis && targetthis.bISMONSTER && !targetthis.bFriendly && targetthis.health > 0 && self.Distance2D(targetthis) < 2000 && self.CheckSight(targetthis) && targetthis.bShootable)
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
        PLAY E 0 A_StartSound("weapons/pistol");
        PLAY F 6 BRIGHT A_CustomBulletAttack(9.6,0,1,5,"BulletPuff");
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
        PLAY E 0 A_StartSound("weapons/pistol");
        PLAY F 4 BRIGHT A_CustomBulletAttack(13.6,0,1,5,"BulletPuff");
        PLAY E 0 A_StartSound("weapons/pistol");
        PLAY F 4 BRIGHT A_CustomBulletAttack(13.6,0,1,5,"BulletPuff");
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
        PLAY E 0 A_StartSound("weapons/shotgf");
        PLAY F 7 BRIGHT A_CustomBulletAttack(5.6,0,7,5,"BulletPuff");
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
        PLAY E 0 A_StartSound("weapons/sshotf");
        PLAY F 7 Bright A_CustomBulletAttack(11.2,7.1,20,5,"BulletPuff");
        PLAY ABC 4 A_Chase(null,null);
        PLAY A 0 A_StartSound ("weapons/sshoto");
        PLAY DABC 4 A_Chase(null,null);
        PLAY A 0 A_StartSound ("weapons/sshotl");
        PLAY DAB 4 A_Chase(null,null);
        PLAY A 0 A_StartSound ("weapons/sshotc");
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
        PLAY F 6 Bright A_SpawnProjectile("PlasmaBall");
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
        PLAY F 6 Bright A_SpawnProjectile("Rocket");
        PLAY E 6;
        PLAY DABCD 4 A_Chase(null,null);
        Goto See;
    }
}
class AIMarineBFG : AIMarine
{
    States
    {
    Missile:
        PLAY E 5 A_StartSound("weapons/bfgf");
        PLAY EEEEE 5 A_FaceTarget;
        PLAY F 6 Bright A_SpawnProjectile("BFGBall");
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
        PLAY E 0 A_StartSound("weapons/pistol");
        PLAY F 6 BRIGHT A_CustomBulletAttack(5.6,0,1,5,"BulletPuff");
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
        PLAY E 0 A_StartSound("weapons/pistol");
        PLAY F 4 BRIGHT A_CustomBulletAttack(5.6,0,1,5,"BulletPuff");
        PLAY E 0 A_StartSound("weapons/pistol");
        PLAY F 4 BRIGHT A_CustomBulletAttack(5.6,0,1,5,"BulletPuff");
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
        PLAY E 0 A_StartSound("weapons/shotgf");
        PLAY F 7 BRIGHT A_CustomBulletAttack(5.6,0,7,5,"BulletPuff");
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
        PLAY E 0 A_StartSound("weapons/sshotf");
        PLAY F 7 Bright A_CustomBulletAttack(11.2,7.1,20,5,"BulletPuff");
        PLAY ABC 4 A_Chase(null,null);
        PLAY A 0 A_StartSound ("weapons/sshoto");
        PLAY DABC 4 A_Chase(null,null);
        PLAY A 0 A_StartSound ("weapons/sshotl");
        PLAY DAB 4 A_Chase(null,null);
        PLAY A 0 A_StartSound ("weapons/sshotc");
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
        PLAY F 3 Bright A_SpawnProjectile("PlasmaBall");
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
        PLAY F 6 Bright A_SpawnProjectile("Rocket");
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
        PLAY E 5 A_StartSound("weapons/bfgf");
        PLAY EEEEE 5 A_FaceTarget;
        PLAY F 6 Bright A_SpawnProjectile("BFGBall");
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
  MGSTRN = [[
  class AIMarinePistol : AIMarine
{
  States
  {
  Spawn:
    ALY2 A 4 A_Look;
    Loop;
  See:
    ALY2 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY2 E 4 A_FaceTarget;
    ALY2 E 0 A_StartSound("weapons/pistol");
    ALY2 F 6 Bright A_CustomBulletAttack(5.6,0,1,5,"BulletPuff");
    ALY2 E 4 A_FaceTarget;
    ALY2 E 0 A_CposRefire;
    Goto Missile;
  Pain:
    ALY2 G 4;
    ALY2 G 4 A_Pain;
    Goto See;
  Death:
    ALY2 H 10;
    ALY2 I 10 A_Scream;
    ALY2 J 10 A_NoBlocking;
    ALY2 KLM 10;
    ALY2 N -1;
    Stop;
  XDeath:
    ALY2 O 5;
    ALY2 P 5 A_XScream;
    ALY2 Q 5 A_NoBlocking;
    ALY2 RSTUV 5;
    ALY2 W -1;
    Stop;
  Raise:
    ALY2 MLKJIH 5;
    Goto See;
  }
}
class AIMarineChaingun : AIMarine
{
  States
  {
  Spawn:
    ALY4 A 4 A_Look;
    Loop;
  See:
    ALY4 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY4 X 4 A_FaceTarget;
    ALY4 E 0 A_StartSound("weapons/pistol");
    ALY4 E 4 Bright A_CustomBulletAttack(5.6,0,1,5,"BulletPuff");
    ALY4 F 0 A_StartSound("weapons/pistol");
    ALY4 F 4 Bright A_CustomBulletAttack(5.6,0,1,5,"BulletPuff");
    ALY4 E 0 A_CposRefire;
    Goto Missile+1;
  Pain:
    ALY4 G 4;
    ALY4 G 4 A_Pain;
    Goto See;
  Death:
    ALY4 H 10;
    ALY4 I 10 A_Scream;
    ALY4 J 10 A_NoBlocking;
    ALY4 KLM 10;
    ALY4 N -1;
    Stop;
  XDeath:
    ALY4 O 5;
    ALY4 P 5 A_XScream;
    ALY4 Q 5 A_NoBlocking;
    ALY4 RSTUV 5;
    ALY4 W -1;
    Stop;
  Raise:
    ALY4 MLKJIH 5;
    Goto See;
  }
}
class AIMarineShotgun : AIMarine
{
  States
  {
  Spawn:
    ALY5 A 4 A_Look;
    Loop;
  See:
    ALY5 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY5 E 3 A_FaceTarget;
    ALY5 E 0 A_StartSound("weapons/shotgf");
    ALY5 F 7 Bright A_CustomBulletAttack(5.6,0,7,5,"BulletPuff");
    ALY5 BCDABCD 4 A_Chase(null,null);
    Goto See;
  Pain:
    ALY5 G 4;
    ALY5 G 4 A_Pain;
    Goto See;
  Death:
    ALY5 H 10;
    ALY5 I 10 A_Scream;
    ALY5 J 10 A_NoBlocking;
    ALY5 KLM 10;
    ALY5 N -1;
    Stop;
  XDeath:
    ALY5 O 5;
    ALY5 P 5 A_XScream;
    ALY5 Q 5 A_NoBlocking;
    ALY5 RSTUV 5;
    ALY5 W -1;
    Stop;
  Raise:
    ALY5 MLKJIH 5;
    Goto See;
  }
}

class AIMarineSuperShotgun : AIMarine
{
  States
  {
  Spawn:
    AL11 A 4 A_Look;
    Loop;
  See:
    AL11 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    AL11 E 3 A_FaceTarget;
    AL11 E 0 A_StartSound("weapons/sshotf");
    AL11 F 7 Bright A_CustomBulletAttack(11.2,7.1,20,5,"BulletPuff");
    AL11 ABC 4 A_Chase(null,null);
    AL11 A 0 A_StartSound ("weapons/sshoto");
    AL11 DABC 4 A_Chase(null,null);
    AL11 A 0 A_StartSound ("weapons/sshotl");
    AL11 DAB 4 A_Chase(null,null);
    AL11 A 0 A_StartSound ("weapons/sshotc");
    AL11 CD 4 A_Chase(null,null);
    Goto See;
  Pain:
    AL11 G 4;
    AL11 G 4 A_Pain;
    Goto See;
  Death:
    AL11 H 10;
    AL11 I 10 A_Scream;
    AL11 J 10 A_NoBlocking;
    AL11 KLM 10;
    AL11 N -1;
    Stop;
  XDeath:
    AL11 O 5;
    AL11 P 5 A_XScream;
    AL11 Q 5 A_NoBlocking;
    AL11 RSTUV 5;
    AL11 W -1;
    Stop;
  Raise:
    AL11 MLKJIH 5;
    Goto See;
  }
}
class AIMarinePlasma : AIMarine
{
  States
  {
  Spawn:
    ALY8 A 4 A_Look;
    Loop;
  See:
    ALY8 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY8 E 2 A_FaceTarget;
    ALY8 F 3 Bright A_SpawnProjectile("PlasmaBall");
    ALY8 E 0 A_MonsterRefire(40,"MissileOver");
    Goto Missile+1;
  MissileOver:
    ALY8 DABCD 4 A_Chase(null,null);
    Goto See;
  Pain:
    ALY8 G 4;
    ALY8 G 4 A_Pain;
    Goto See;
  Death:
    ALY8 H 10;
    ALY8 I 10 A_Scream;
    ALY8 J 10 A_NoBlocking;
    ALY8 KLM 10;
    ALY8 N -1;
    Stop;
  XDeath:
    ALY8 O 5;
    ALY8 P 5 A_XScream;
    ALY8 Q 5 A_NoBlocking;
    ALY8 RSTUV 5;
    ALY8 W -1;
    Stop;
  Raise:
    ALY8 MLKJIH 5;
    Goto See;
  }
}
class AIMarineRocket : AIMarine
{
  States
  {
  Spawn:
    ALY9 A 4 A_Look;
    Loop;
  See:
    ALY9 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY9 E 8 A_FaceTarget;
    ALY9 F 6 Bright A_SpawnProjectile("Rocket");
    ALY9 E 6;
    ALY9 E 0 A_CposRefire;
    Goto Missile;
  Pain:
    ALY9 G 4;
    ALY9 G 4 A_Pain;
    Goto See;
  Death:
    ALY9 H 10;
    ALY9 I 10 A_Scream;
    ALY9 J 10 A_NoBlocking;
    ALY9 KLM 10;
    ALY9 N -1;
    Stop;
  XDeath:
    ALY9 O 5;
    ALY9 P 5 A_XScream;
    ALY9 Q 5 A_NoBlocking;
    ALY9 RSTUV 5;
    ALY9 W -1;
    Stop;
  Raise:
    ALY9 MLKJIH 5;
    Goto See;
  }
}
class AIMarineBFG : AIMarine
{
  States
  {
  Spawn:
    AL10 A 4 A_Look;
    Loop;
  See:
    AL10 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    AL10 E 0 {self.bNOPAIN=1;}
    AL10 E 5 A_StartSound("weapons/bfgf");
    AL10 EEEEE 5 A_FaceTarget;
    AL10 F 6 Bright A_SpawnProjectile("BFGBall");
    AL10 F 0 {self.bNOPAIN=0;}
    AL10 E 4 A_FaceTarget;
    AL10 E 0 A_MonsterRefire(40,"MissileOver");
    Goto Missile;
  MissileOver:
    AL10 CDABCD 4 A_Chase(null,null);
    Goto See;
  Pain:
    AL10 G 4;
    AL10 G 4 A_Pain;
    Goto See;
  Death:
    AL10 H 10;
    AL10 I 10 A_Scream;
    AL10 J 10 A_NoBlocking;
    AL10 KLM 10;
    AL10 N -1;
    Stop;
  XDeath:
    AL10 O 5;
    AL10 P 5 A_XScream;
    AL10 Q 5 A_NoBlocking;
    AL10 RSTUV 5;
    AL10 W -1;
    Stop;
  Raise:
    AL10 MLKJIH 5;
    Goto See;
  }
}
  ]]
  MGWEAK = [[
  class AIMarinePistol : AIMarine
{
  States
  {
  Spawn:
    ALY2 A 4 A_Look;
    Loop;
  See:
    ALY2 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY2 E 4 A_FaceTarget;
    ALY2 E 0 A_StartSound("weapons/pistol");
    ALY2 F 6 Bright A_CustomBulletAttack(9.6,0,1,5,"BulletPuff");
    ALY2 E 9 A_FaceTarget;
    ALY2 E 0 A_CposRefire;
    Goto Missile;
  Pain:
    ALY2 G 4;
    ALY2 G 4 A_Pain;
    Goto See;
  Death:
    ALY2 H 10;
    ALY2 I 10 A_Scream;
    ALY2 J 10 A_NoBlocking;
    ALY2 KLM 10;
    ALY2 N -1;
    Stop;
  XDeath:
    ALY2 O 5;
    ALY2 P 5 A_XScream;
    ALY2 Q 5 A_NoBlocking;
    ALY2 RSTUV 5;
    ALY2 W -1;
    Stop;
  Raise:
    ALY2 MLKJIH 5;
    Goto See;
  }
}
class AIMarineChaingun : AIMarine
{
  States
  {
  Spawn:
    ALY4 A 4 A_Look;
    Loop;
  See:
    ALY4 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY4 X 4 A_FaceTarget;
    ALY4 E 0 A_StartSound("weapons/pistol");
    ALY4 E 4 Bright A_CustomBulletAttack(13.6,0,1,5,"BulletPuff");
    ALY4 F 0 A_StartSound("weapons/pistol");
    ALY4 F 4 Bright A_CustomBulletAttack(13.6,0,1,5,"BulletPuff");
    ALY4 E 0 A_CposRefire;
    Goto Missile+1;
  Pain:
    ALY4 G 4;
    ALY4 G 4 A_Pain;
    Goto See;
  Death:
    ALY4 H 10;
    ALY4 I 10 A_Scream;
    ALY4 J 10 A_NoBlocking;
    ALY4 KLM 10;
    ALY4 N -1;
    Stop;
  XDeath:
    ALY4 O 5;
    ALY4 P 5 A_XScream;
    ALY4 Q 5 A_NoBlocking;
    ALY4 RSTUV 5;
    ALY4 W -1;
    Stop;
  Raise:
    ALY4 MLKJIH 5;
    Goto See;
  }
}
class AIMarineShotgun : AIMarine
{
  States
  {
  Spawn:
    ALY5 A 4 A_Look;
    Loop;
  See:
    ALY5 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY5 E 3 A_FaceTarget;
    ALY5 E 0 A_StartSound("weapons/shotgf");
    ALY5 F 7 Bright A_CustomBulletAttack(5.6,0,7,5,"BulletPuff");
    ALY5 BCDABCDABCDABCD 4 A_Chase(null,null);
    Goto See;
  Pain:
    ALY5 G 4;
    ALY5 G 4 A_Pain;
    Goto See;
  Death:
    ALY5 H 10;
    ALY5 I 10 A_Scream;
    ALY5 J 10 A_NoBlocking;
    ALY5 KLM 10;
    ALY5 N -1;
    Stop;
  XDeath:
    ALY5 O 5;
    ALY5 P 5 A_XScream;
    ALY5 Q 5 A_NoBlocking;
    ALY5 RSTUV 5;
    ALY5 W -1;
    Stop;
  Raise:
    ALY5 MLKJIH 5;
    Goto See;
  }
}

class AIMarineSuperShotgun : AIMarine
{
  States
  {
  Spawn:
    AL11 A 4 A_Look;
    Loop;
  See:
    AL11 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    AL11 E 3 A_FaceTarget;
    AL11 E 0 A_StartSound("weapons/sshotf");
    AL11 F 7 Bright A_CustomBulletAttack(11.2,7.1,20,5,"BulletPuff");
    AL11 ABC 4 A_Chase(null,null);
    AL11 A 0 A_StartSound ("weapons/sshoto");
    AL11 DABC 4 A_Chase(null,null);
    AL11 A 0 A_StartSound ("weapons/sshotl");
    AL11 DAB 4 A_Chase(null,null);
    AL11 A 0 A_StartSound ("weapons/sshotc");
    AL11 CDABCDABCDABCD 4 A_Chase(null,null);
    Goto See;
  Pain:
    AL11 G 4;
    AL11 G 4 A_Pain;
    Goto See;
  Death:
    AL11 H 10;
    AL11 I 10 A_Scream;
    AL11 J 10 A_NoBlocking;
    AL11 KLM 10;
    AL11 N -1;
    Stop;
  XDeath:
    AL11 O 5;
    AL11 P 5 A_XScream;
    AL11 Q 5 A_NoBlocking;
    AL11 RSTUV 5;
    AL11 W -1;
    Stop;
  Raise:
    AL11 MLKJIH 5;
    Goto See;
  }
}
class AIMarinePlasma : AIMarine
{
  States
  {
  Spawn:
    ALY8 A 4 A_Look;
    Loop;
  See:
    ALY8 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY8 E 2 A_FaceTarget;
    ALY8 F 6 Bright A_SpawnProjectile("PlasmaBall");
    ALY8 E 0 A_MonsterRefire(40,"MissileOver");
    Goto Missile+1;
  MissileOver:
    ALY8 DABCD 4 A_Chase(null,null);
    Goto See;
  Pain:
    ALY8 G 4;
    ALY8 G 4 A_Pain;
    Goto See;
  Death:
    ALY8 H 10;
    ALY8 I 10 A_Scream;
    ALY8 J 10 A_NoBlocking;
    ALY8 KLM 10;
    ALY8 N -1;
    Stop;
  XDeath:
    ALY8 O 5;
    ALY8 P 5 A_XScream;
    ALY8 Q 5 A_NoBlocking;
    ALY8 RSTUV 5;
    ALY8 W -1;
    Stop;
  Raise:
    ALY8 MLKJIH 5;
    Goto See;
  }
}
class AIMarineRocket : AIMarine
{
  States
  {
  Spawn:
    ALY9 A 4 A_Look;
    Loop;
  See:
    ALY9 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    ALY9 E 8 A_FaceTarget;
    ALY9 F 6 Bright A_SpawnProjectile("Rocket");
    ALY9 E 6;
    ALY9 DABCD 4 A_Chase(null,null);
    Goto See;
  Pain:
    ALY9 G 4;
    ALY9 G 4 A_Pain;
    Goto See;
  Death:
    ALY9 H 10;
    ALY9 I 10 A_Scream;
    ALY9 J 10 A_NoBlocking;
    ALY9 KLM 10;
    ALY9 N -1;
    Stop;
  XDeath:
    ALY9 O 5;
    ALY9 P 5 A_XScream;
    ALY9 Q 5 A_NoBlocking;
    ALY9 RSTUV 5;
    ALY9 W -1;
    Stop;
  Raise:
    ALY9 MLKJIH 5;
    Goto See;
  }
}
class AIMarineBFG : AIMarine
{
  States
  {
  Spawn:
    AL10 A 4 A_Look;
    Loop;
  See:
    AL10 AAAABBBBCCCCDDDD 1 A_Chase;
    Loop;
  Missile:
    AL10 E 5 A_StartSound("weapons/bfgf");
    AL10 EEEEE 5 A_FaceTarget;
    AL10 F 6 Bright A_SpawnProjectile("BFGBall");
    AL10 E 4 A_FaceTarget;
    AL10 CDABCDABCDABCD 4 A_Chase(null,null);
    Goto See;
  Pain:
    AL10 G 4;
    AL10 G 4 A_Pain;
    Goto See;
  Death:
    AL10 H 10;
    AL10 I 10 A_Scream;
    AL10 J 10 A_NoBlocking;
    AL10 KLM 10;
    AL10 N -1;
    Stop;
  XDeath:
    AL10 O 5;
    AL10 P 5 A_XScream;
    AL10 Q 5 A_NoBlocking;
    AL10 RSTUV 5;
    AL10 W -1;
    Stop;
  Raise:
    AL10 MLKJIH 5;
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
  PROJREP = [[class BulletPuffAIMarine : BulletPuff
{
    Default
    {
        +PUFFGETSOWNER
    }
    override int DoSpecialDamage(Actor target, int damage, name damagetype)
    {
        if(target && target is "PlayerPawn" && self.target && self.target.bFriendly)
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
        if(target && target is "PlayerPawn" && self.target && self.target.bFriendly)
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
        if(target && target is "PlayerPawn" && self.target && self.target.bFriendly)
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
        if(target && (target is "PlayerPawn"||target is "AIMarine") && self.target && self.target.bFriendly)
        {
            return 0;
        }
        return super.DoSpecialDamage(target,damage,damagetype);
    }
}
]]
  TRANSL = [[A_SetTranslation(MTRANSDEF);
  ]]
  TRANSL2 = [[int rng = random(1,4);
  A_SetTranslation(string.format("%%s%%i", "MarAI", rng));
  ]]
  TRANSL3 = [[int rng = random(1,12);
  A_SetTranslation(string.format("%%s%%i", "MarAI", rng));
  ]]
  FFX = [[if(inflictor && ((inflictor.bISMONSTER && inflictor.bFriendly) || (!inflictor.bISMONSTER && inflictor.target && inflictor.target is "AIMarine" && !(inflictor is "ExplosiveBarrel"))))
  {
    return 0;
  }
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

MARINE_CLOSET_TUNE.TRNSLATE =
[[
MarAI1 = "112:127=112:127"
MarAI2 = "112:127=96:111"
MarAI3 = "112:127=64:79"
MarAI4 = "112:127=32:47"
MarAI5 = "112:127=192:207"
MarAI6 = "112:127=250:254"
MarAI7 = "112:127=80:95"
MarAI8 = "112:127=160:167"
MarAI9 = "112:127=208:223"
MarAI10 = "112:127=240:247"
MarAI11 = "112:127=168:191"
MarAI12 = "112:127=224:231"
]]

MARINE_CLOSET_TUNE.TECHWPN =
{
[1] = { 31001 }
[2] = { 31003, 31001, 31001, 31001, 31001, 31001, 31001, 31001 }
[3] = { 31003, 31002, 31001, 31001, 31001, 31001, 31001, 31001 }
[4] = { 31003, 31002, 31001, 31001 }
[5] = { 31003, 31002, 31001, 31003, 31002, 31001, 31003, 31002, 31001, 31004 }
[6] = { 31003, 31002, 31001, 31003, 31002, 31005, 31003, 31002, 31006, 31004 }
[7] = { 31003, 31002, 31001, 31004, 31002, 31005, 31006, 31004 }
[8] = { 31004, 31004, 31002, 31004, 31005, 31005, 31006 }
[9] = { 31005, 31005, 31005, 31005, 31006, 31006, 31006, 31004, 31007 }
[10] = { 31005, 31006, 31007 }
[66] = { 31007 }
[99] = { 31001, 31001, 31001, 31003, 31003, 31003 ,31002 ,31002 ,31002, 31004, 31004, 31005, 31005, 31006, 31006, 31007 }
}

function MARINE_CLOSET_TUNE.setup(self)
  PARAM.marine_gen = true
  PARAM.MARINESCRIPT = ""
  PARAM.marine_closets = 0
  PARAM.marine_marines = 0
  PARAM.marine_tech = 1

  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

function MARINE_CLOSET_TUNE.calc_closets()
  if rand.odds(tonumber(PARAM.m_c_chance))
  and not LEVEL.prebuilt
  and not (PARAM.m_c_boss == "no" and LEVEL.is_procedural_gotcha) then
    local rngmin
    local rngmax

    PARAM.level_has_marine_closets = true

    rngmin = math.min(tonumber(PARAM.m_c_min),tonumber(PARAM.m_c_max))
    rngmax = math.max(tonumber(PARAM.m_c_min),tonumber(PARAM.m_c_max))

    if PARAM.m_c_type == "default" then
      PARAM.marine_closets = rand.irange(rngmin,rngmax)
    elseif PARAM.m_c_type == "prog" then
      PARAM.marine_closets = rngmin + math.round((rngmax - rngmin) * LEVEL.game_along)
    elseif PARAM.m_c_type == "reg" then
      PARAM.marine_closets = rngmax - math.round((rngmax - rngmin) * LEVEL.game_along)
    elseif PARAM.m_c_type == "epi" then
      PARAM.marine_closets = rngmin + math.round((rngmax - rngmin) * LEVEL.ep_along)
    elseif PARAM.m_c_type == "epi2" then
      PARAM.marine_closets = rngmax - math.round((rngmax - rngmin) * LEVEL.ep_along)
    end
    rngmin = math.min(tonumber(PARAM.m_c_m_min),tonumber(PARAM.m_c_m_max))
    rngmax = math.max(tonumber(PARAM.m_c_m_min),tonumber(PARAM.m_c_m_max))

    if PARAM.m_c_m_type == "default" then
      PARAM.marine_marines = rand.irange(rngmin,rngmax)
    elseif PARAM.m_c_m_type == "prog" then
      PARAM.marine_marines = rngmin + math.round((rngmax - rngmin) * LEVEL.game_along)
    elseif PARAM.m_c_m_type == "reg" then
      PARAM.marine_marines = rngmax - math.round((rngmax - rngmin) * LEVEL.game_along)
    elseif PARAM.m_c_m_type == "epi" then
      PARAM.marine_marines = rngmin + math.round((rngmax - rngmin) * LEVEL.ep_along)
    elseif PARAM.m_c_m_type == "epi2" then
      PARAM.marine_marines = rngmax - math.round((rngmax - rngmin) * LEVEL.ep_along)
    end

    if PARAM.m_c_tech == "vlow" then
      PARAM.marine_tech = 1
    elseif PARAM.m_c_tech == "low" then
      PARAM.marine_tech = rand.irange(1,3)
    elseif PARAM.m_c_tech == "mid" then
      PARAM.marine_tech = rand.irange(5,7)
    elseif PARAM.m_c_tech == "high" then
      PARAM.marine_tech = rand.irange(8,9)
    elseif PARAM.m_c_tech == "rng" then
      PARAM.marine_tech = 99
    elseif PARAM.m_c_tech == "bfg" then
      PARAM.marine_tech = 66
    elseif PARAM.m_c_tech == "prog" then
      if LEVEL.game_along < 1.0 then
        PARAM.marine_tech = math.ceil(LEVEL.game_along * 10)
      else
        PARAM.marine_tech = 10
      end
    end

  else
    PARAM.level_has_marine_closets = false
  end

  local info =
  {
    kind = "marine_closet"
    min_count = 1
    max_count = PARAM.marine_closets
    not_start = true
    min_prog = 0
    max_prog = 1
    level_prob = 100
  }

  if PARAM.level_has_marine_closets then
    table.insert(LEVEL.secondary_importants, info)
  end
end

function MARINE_CLOSET_TUNE.grab_type()
   return rand.pick(MARINE_CLOSET_TUNE.TECHWPN[PARAM.marine_tech])
end

function MARINE_CLOSET_TUNE.randomize_count()
   if PARAM.m_c_m_type != "default" then return end
   local rngmin = math.min(tonumber(PARAM.m_c_m_min),tonumber(PARAM.m_c_m_max))
   local rngmax = math.max(tonumber(PARAM.m_c_m_min),tonumber(PARAM.m_c_m_max))
   PARAM.marine_marines = rand.irange(rngmin,rngmax)
end

function MARINE_CLOSET_TUNE.all_done()

  local scripty = MARINE_CLOSET_TUNE.TEMPLATES.ZSC

  if PARAM.m_c_power == "yes" then
    if PARAM.m_c_sprites == "no" then
      scripty = scripty .. MARINE_CLOSET_TUNE.TEMPLATES.MSTRN
    else
      scripty = scripty .. MARINE_CLOSET_TUNE.TEMPLATES.MGSTRN
    end
  else
    if PARAM.m_c_sprites == "no" then
      scripty = scripty .. MARINE_CLOSET_TUNE.TEMPLATES.MWEAK
    else
      scripty = scripty .. MARINE_CLOSET_TUNE.TEMPLATES.MGWEAK
    end
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

  if PARAM.m_c_ff != "yes" then
    scripty = scripty .. MARINE_CLOSET_TUNE.TEMPLATES.PROJREP
    scripty = string.gsub(scripty, "\"BulletPuff\"", "\"BulletPuffAIMarine\"")
    scripty = string.gsub(scripty, "\"PlasmaBall\"", "\"PlasmaBallAIMarine\"")
    scripty = string.gsub(scripty, "\"Rocket\"", "\"RocketAIMarine\"")
    scripty = string.gsub(scripty, "\"BFGBall\"", "\"BFGBallAIMarine\"")
  end

  if PARAM.m_c_ff == "no2" then
    scripty = string.gsub(scripty, "MFRIENDLYFIREX", MARINE_CLOSET_TUNE.TEMPLATES.FFX)
  else
    scripty = string.gsub(scripty, "MFRIENDLYFIREX", "return 0;")
  end

  if PARAM.m_c_sprites == "yes1" then
    gui.wad_merge_sections("modules/zdoom_internal_scripts/AISprite.wad")
  end

  if PARAM.m_c_color == "MarAI1" then
    scripty = string.gsub(scripty, "MTRANSLATE", "")
  elseif PARAM.m_c_color == "rng" then
    scripty = string.gsub(scripty, "MTRANSLATE", MARINE_CLOSET_TUNE.TEMPLATES.TRANSL2)
  elseif PARAM.m_c_color == "rng2" then
    scripty = string.gsub(scripty, "MTRANSLATE", MARINE_CLOSET_TUNE.TEMPLATES.TRANSL3)
  else
    scripty = string.gsub(scripty, "MTRANSLATE", MARINE_CLOSET_TUNE.TEMPLATES.TRANSL)
    scripty = string.gsub(scripty, "MTRANSDEF", "\"" .. PARAM.m_c_color .. "\"")
  end

  PARAM.MARINESCRIPT = PARAM.MARINESCRIPT .. scripty
  PARAM.MARINEMAPINFO = MARINE_CLOSET_TUNE.MAPINFO

  if PARAM.m_c_color != "MarAI1" then
    PARAM.MARINETRNSLATE = MARINE_CLOSET_TUNE.TRNSLATE
  end
end

OB_MODULES["gzdoom_marine_closets"] =
{
  label = _("[Exp]GZDoom Marine Closets")

  game = "doomish"

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

    m_c_type =
    {
      name = "m_c_type",
      label = _("Closet scaling type"),
      priority = 96,
      choices = MARINE_CLOSET_TUNE.SCALING,
      default = "default",
      tooltip = "Affects how min and max work for closet count:\n\n" ..
      "Random: Random range\n" ..
      "Progressive: Goes from min to max through entire game\n" ..
      "Episodic: Goes from min to max through episode\n" ..
      "Regressive/Regressive episodic: Goes from max to min through game or episode" ,
    }

    m_c_m_min =
    {
      name = "m_c_m_min",
      label = _("Minimum marines"),
      priority = 95,
      choices = MARINE_CLOSET_TUNE.COUNT,
      default = "1",
      tooltip = "Sets least amount of marines that can spawn per closet.",
    }

    m_c_m_max =
    {
      name = "m_c_m_max",
      label = _("Maximum marines"),
      priority = 94,
      choices = MARINE_CLOSET_TUNE.COUNT,
      default = "5",
      tooltip = "Sets most amount of marines that can spawn per closet.",
    }

    m_c_m_type =
    {
      name = "m_c_m_type",
      label = _("Marine scaling type"),
      priority = 93,
      choices = MARINE_CLOSET_TUNE.SCALING,
      default = "default",
      tooltip = "Affects how min and max work for marine count:\n\n" ..
      "Random: Random range\n" ..
      "Progressive: Goes from min to max through entire game\n" ..
      "Episodic: Goes from min to max through episode\n" ..
      "Regressive/Regressive episodic: Goes from max to min through game or episode" ,
    }

    m_c_tech =
    {
      name = "m_c_ttech",
      label = _("Weapon tech level"),
      priority = 92,
      choices = MARINE_CLOSET_TUNE.TECH,
      default = "mid",
      tooltip = "Influences weapons that marines spawn with:\n\n" ..
      "Very Low tech: Clearing demonic invasion with nothing but pistols and harsh language\n" ..
      "Low tech: Pistols, with some rare chainguns and shotguns\n" ..
      "Mid tech: Shotguns/Chainguns with some rare pistols, super shotguns, rocket launchers and plasma rifles\n" ..
      "High tech: Rocket launchers/Plasma rifles with some rare BFGs and super shotguns\n" ..
      "Mix it up: Any weapon goes, let the dice decide!\n" ..
      "BFG Fiesta: BFG only, cyberdemons beware!\n" ..
      "Progressive: Marines start with pistols and get more powerful weapons through episode/megawad",
    }

    m_c_power =
    {
      name = "m_c_power",
      label = _("Strong Marines"),
      priority = 91,
      choices = MARINE_CLOSET_TUNE.YN,
      default = "yes",
      tooltip = "Influences whether marines are as accurate and rapid firing as player, or are weaker.",
    }

    m_c_follow =
    {
      name = "m_c_follow",
      label = _("Followers"),
      priority = 90,
      choices = MARINE_CLOSET_TUNE.YN,
      default = "no",
      tooltip = "By default marines try to follow the player if they have nothing else to do but would otherwise prioritize chasing enemies, and are also unable to follow player through rough terrain.\n" ..
      "If this is enabled marines will much harder prioritize following player and will teleport if they are too far away.",
    }

    m_c_health =
    {
      name = "m_c_health",
      label = _("Marine Health"),
      priority = 89,
      choices = MARINE_CLOSET_TUNE.HEALTH,
      default = "100",
      tooltip = "Influences how much damage marines can take before dying.",
    }

    m_c_waker =
    {
      name = "m_c_waker",
      label = _("Trigger Type"),
      priority = 88,
      choices = MARINE_CLOSET_TUNE.WAKER,
      default = "sight",
      tooltip = "Influences the trigger that activates marines.\n\n" ..
      "Sight: Marine closet activates once it can 'see' the player.\n" ..
      "Range: Closet activates when player is close enough, even if behind wall.\n" ..
      "Close Range: same as range except requires player to be really really close.\n" ..
      "Map Start: Closets are active on map start.",
    }

    m_c_quantity =
    {
      name = "m_c_quantity",
      label = _("Monster Quantity Multiplier"),
      priority = 87,
      choices = MARINE_CLOSET_TUNE.QUANTITY,
      default = "default",
      tooltip = "Influences amount of monsters in rooms with a marine closet.",
    }

    m_c_strength =
    {
      name = "m_c_strength",
      label = _("Monster Strength Modifier"),
      priority = 86,
      choices = MARINE_CLOSET_TUNE.STRENGTH,
      default = "default",
      tooltip = "If set, this strength setting is used in the room with marine closet instead of normal one.",
    }
    m_c_ff =
    {
      name = "m_c_ff",
      label = _("Friendly Fire"),
      priority = 85,
      choices = MARINE_CLOSET_TUNE.FRIENDLYFIRE,
      default = "no",
      tooltip = "By default marines do no damage to player. However that means their use their own version of puffs and projectiles.\n" ..
      "If this is enabled marines can damage player and original puffs and projectiles are used making them affected by mods that replace those.\n"..
      "Additionally if self damage variant is chosen marines can still get hurt by exploding barrels and such",
    }
    m_c_sprites =
    {
      name = "m_c_sprites",
      label = _("Weapon Sprites"),
      priority = 84,
      choices = MARINE_CLOSET_TUNE.SPRITES,
      default = "no",
      tooltip = "By default marines use default player sprite.\n" ..
      "If this is enabled, marines will use special sprites according to weapon they carry.\n" ..
      "With merge option sprites will be merged into oblige wad, otherwise they need to be loaded separately.",
    }
    m_c_boss =
    {
      name = "m_c_boss",
      label = _("Allow in Gotchas"),
      priority = 83,
      choices = MARINE_CLOSET_TUNE.YN,
      default = "no",
      tooltip = "Allows or disallows marine closets to spawn on gotchas and boss generator levels.",
    }
    m_c_color =
    {
      name = "m_c_color",
      label = _("Marine Color"),
      priority = 82,
      choices = MARINE_CLOSET_TUNE.COLORS,
      default = "MarAI1",
      tooltip = "Lets you choose the color of marines, including option for random color per marine.",
    }
  }
}
