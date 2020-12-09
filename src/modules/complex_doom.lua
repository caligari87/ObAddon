----------------------------------------------------------------
--  MODULE: Complex Doom Changes
----------------------------------------------------------------
--  Copyright (C) 2006-2017 Andrew Apted
--  Copyright (C) 2011, 2020 Armaetus
--  Copyright (C) 2020 MsrShooterPerson
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
----------------------------------------------------------------

-- Usable keywords
-- ===============
--
-- id         : editor number used to place monster on the map
-- level      : how far along (over episode) it should appear (1..9)
--
-- prob       : general probability of being used
-- crazy_prob : probability for "Crazy" setting (default is 50)
--
-- health : hit points of monster
-- damage : total damage inflicted on player (on average)
-- attack : kind of attack (hitscan | missile | melee)
-- density : how many too use (e.g. 0.5 = half the normal amount)
--
-- float  : true if monster floats (flies)
-- invis  : true if invisible (or partially)
--
-- weap_needed : weapons player must have to fight this monster
-- weap_min_damage : damage (per second) of player weapon required
-- weap_prefs : weapon preferences table (usage by player)
-- disloyal   : can hurt a member of same species
-- infight_damage : damage inflicted on one (or more) other monsters

--

-- Changes to make up for the difficulty ramp that Complex Doom
-- does. Even the weaker monsters could kill you if you're not
-- careful!

-- Based on the "Harder Enemy Setup" module, so there's no need to
-- use both.

COMPLEX_DOOM = { }

UNFINISHED.MONSTERS =
{

-- Possible replacements:
-- Plasma zombie (Weakest but plasma bursts hurt)
-- Railgun zombie (Has to aim before shooting, and not a Skulltag level damage weapon)
-- DemonTech zombie (Unique weapon used, still hurts)
-- Rocket zombie (Uses a rocket launcher, heavy if not lethal damage!)
  zombie =
  {
    id = 3004
    r = 20
    h = 56
    level = 1
    prob = 50
    health = 45 -- Average health. All replacement health divided by 4.
    damage = 4 -- Need some sort of average damage due to the replacements.
    attack = "missile" -- None of these are instant hit except railgunner's slug, so changed here.
    replaces = "shooter"
    replace_prob = 20
    give = { {ammo="bullet",count=5} }
    weap_prefs = { pistol=0.7, shotty=1.2, chain=1.5 } -- Pistol is actually useful on these guys!
    density = 1.5
    room_size = "any" --small
    disloyal = true
    trap_factor = 0.05
    infight_damage = 5.0 -- Due to the projectile damage done
  }

  -- Possible replacements:
  -- Shotgun zombie (Same as stock, but potential to do more damage)
  -- Assault shotgun zombie (Uses a semi-auto shotgun, hurts even more due to fire rate)
  -- Super shotgun zombie (Double barrel misery. Hurts a lot)
  -- Quad barrel shotgunner (If you thought super shotgunner was bad..Don't want to be close with him!)
  shooter =
  {
    id = 9
    r = 20
    h = 56
    level = 1
    prob = 75
    health = 50
    damage = 8
    attack = "hitscan"
    density = 1.0
    give = { {weapon="shotty"}, {ammo="shell",count=4} }
    weap_prefs = { shotty=1.2, chain=1.5, plasma=1.2 }
    weap_needed = { shotty=true }
    species = "zombie"
    replaces = "zombie"
    replace_prob = 20
    room_size = "any" --small
    disloyal = true
    trap_factor = 2.0
    infight_damage = 9.0
  }

  -- Possible replacements:
  -- Imp (Standard, but can lunge at you if you get close for surprise melee damage)
  -- Void Imp (Tougher and can launch spread projectiles)
  -- Devil (Can charge its shot for extra damage)
  -- Phase Imp (Can evade and charge its shots as well)
  imp =
  {
    id = 3001
    r = 20
    h = 56
    level = 1
    prob = 140
    health = 85
    damage = 1.3
    attack = "missile"
    density = 1.0
    replaces = "demon"
    replace_prob = 25
    weap_prefs = { shotty=1.5, chain=1.25, super=1.2, plasma=1.2 }
    room_size = "any" --small
    trap_factor = 0.5 --0.3
    infight_damage = 8.0
  }

  skull =
  {
    id = 3006
    r = 16
    h = 56
    level = 4 -- STOP SHOWING UP ON MAP01!!
    prob = 25
    health = 100
    damage = 1.7
    attack = "melee"
    density = 0.5
    float = true
    weap_prefs = { super=1.5, chain=1.3, launch=0.3 }
    room_size = "any" --small
    disloyal = true
    trap_factor = 0.35 --0.2
    cage_factor = 0
    infight_damage = 2.1
  }

-- Shows up a little sooner.
  demon =
  {
    id = 3002
    r = 30
    h = 56
    level = 2.4
    prob = 50
    health = 150
    damage = 0.4
    attack = "melee"
    density = 0.85
    weap_min_damage = 40
    weap_prefs = { super=1.75, shotty=1.35, chain=1.3, plasma=1.1, launch=0.3 }
    room_size = "any"
    infight_damage = 3.5
  }

-- Same as Demon.
  spectre =
  {
    id = 58
    r = 30
    h = 56
    level = 2.4
    replaces = "demon"
    replace_prob = 35
    crazy_prob = 25
    health = 150
    damage = 1.0
    attack = "melee"
    density = 0.5
    invis = true
    outdoor_factor = 3.0
    weap_min_damage = 40
    weap_prefs = { super=1.75, shotty=1.35, chain=1.3, plasma=1.1, launch=0.3 }
    species = "demon"
    room_size = "any"
    trap_factor = 0.3
    infight_damage = 2.5
  }

-- Shows up sooner and increased chance to replace
-- the Pain Elemental.
  caco =
  {
    id = 3005
    r = 31
    h = 56
    level = 3
    prob = 30
    health = 400
    damage = 4.0
    attack = "missile"
    density = 0.6
    weap_min_damage = 40
    float = true
    weap_prefs = { launch=1.25, super=1.75, chain=1.2, shotty=0.7, plasma=1.2 }
    replaces = "pain"
    replace_prob = 20
    room_size = "any" --large
    trap_factor = 0.5
    infight_damage = 21
  }


  ---| BOSSES |---

-- Shows up sooner.
  baron =
  {
    id = 3003
    r = 24
    h = 64
    level = 5
    boss_type = "minor"
    boss_prob = 50
    prob = 6.4
    crazy_prob = 20
    weap_prefs = { launch=1.75, super=1.5, plasma=1.75, bfg=1.5 }
    health = 1000
    damage = 7.5
    attack = "missile"
    density = 0.3
    weap_min_damage = 88
    room_size = "any" --medium
    infight_damage = 40
  }

-- Shows up sooner.
  Cyberdemon =
  {
    id = 16
    r = 40
    h = 110
    level = 6 --8
    boss_type = "tough"
    boss_prob = 50
    prob = 1.6
    crazy_prob = 10
    health = 4000
    damage = 125
    attack = "missile"
    density = 0.1
    weap_min_damage = 150
    weap_prefs = { bfg=10.0 }
    room_size = "large" --medium
    infight_damage = 1600
    cage_factor = 0
    boss_replacement = "baron"
  }

-- Shows up sooner and increased chance to be used
-- in maps. Added cage_factor to prevent any chance
-- of placement in cages.
  Spiderdemon =
  {
    id = 7
    r = 128
    h = 100
    level = 6
    boss_type = "tough"
    boss_prob = 15
    boss_limit = 1 -- because they infight
    prob = 2.0
    crazy_prob = 10
    health = 3000
    damage = 100
    attack = "hitscan"
    density = 0.1
    cage_factor = 0
    weap_min_damage = 200
    weap_prefs = { bfg=10.0 }
    room_size = "large"
    infight_damage = 700
    boss_replacement = "baron"
  }


  ---== Doom II only ==---

  -- Possible replacements:
  -- Assault rifle zombie (Standard assault rifle, shoots in bursts)
  -- Chaingunner (Pretty much like your stock chaingunner. Higher ROF)
  -- Minigunner (Like chaingunner but very high ROF. Dangerous up close)
  -- BFG zombie (Yeah, don't want to fuck with these guys. Can wipe out lesser monsters and YOU)
  gunner =
  {
    id = 65
    r = 20
    h = 56
    level = 1.6
    prob = 60
    health = 80
    damage = 10
    attack = "hitscan"
    give = { {weapon="chain"}, {ammo="bullet",count=10} }
    weap_needed = { chain=true }
    weap_min_damage = 50
    weap_prefs = { shotty=1.5, super=1.75, chain=2.0, plasma=1.3, launch=1.1 }
    density = 0.75
    species = "zombie"
    room_size = "any" --large
    replaces = "shooter"
    replace_prob = 15
    disloyal = true
    trap_factor = 2.4
    infight_damage = 45
  }

-- Shows up sooner, marginal probability decrease and
-- increased damage. They *can* knock out up to 80
-- health at maximum.
  revenant =
  {
    id = 66
    r = 20
    h = 64
    level = 3.5
    prob = 25
    health = 300
    damage = 9 --8.5
    attack = "missile"
    weap_min_damage = 60
    density = 0.6
    weap_prefs = { launch=1.75, plasma=1.75, chain=1.5, super=1.25 }
    room_size = "any"
    replaces = "knight"
    replace_prob = 15
    trap_factor = 3.6
    infight_damage = 20
  }

-- Shows up sooner, increased chance to replace
-- Mancubus and can be placed in  any sized room.
  knight =
  {
    id = 69
    r = 24
    h = 64
    level = 4
    prob = 26
    health = 500
    damage = 4.0
    attack = "missile"
    weap_min_damage = 50
    weap_prefs = { launch=1.75, super=1.5, plasma=1.33 }
    density = 0.75
    species = "baron"
    replaces = "mancubus"
    replace_prob = 25
    room_size = "any" --medium
    infight_damage = 36
  }

-- Shows up sooner, increased replacement for Arachnotron
-- and can show up outside more.
  mancubus =
  {
    id = 67
    r = 48
    h = 64
    level = 4.5
    prob = 20
    health = 600
    damage = 8.0
    attack = "missile"
    weap_prefs = { launch=1.5, super=1.5, plasma=1.5, chain=1.2 }
    density = 0.32
    weap_min_damage = 88
    replaces = "arach"
    replace_prob = 30
    room_size = "large"
    outdoor_factor = 2.0
    infight_damage = 70
    boss_replacement = "baron"
  }

-- Shows up sooner and increased chance to replace
-- Mancubus.
  arach =
  {
    id = 68
    r = 64
    h = 64
    level = 4.5
    prob = 12
    health = 500
    damage = 10.7
    attack = "missile"
    weap_min_damage = 60
    weap_prefs = { launch=1.5, super=1.5, plasma=1.5, chain=1.2 }
    replaces = "mancubus"
    replace_prob = 30
    density = 0.5
    room_size = "medium"
    infight_damage = 62
    boss_replacement = "revenant"
  }

-- Shows up sooner and increased number that can be
-- placed in one room. Can replace boss monster for
-- the Baron.
  vile =
  {
    id = 64
    r = 20
    h = 56
    level = 6 --6.5
    boss_type = "nasty"
    boss_prob = 50
    boss_limit = 3 --Triple the pain for this module, up from 2
    prob = 5
    crazy_prob = 15
    health = 700
    damage = 25
    attack = "hitscan"
    density = 0.17
    room_size = "medium"
    weap_prefs = { launch=2.0, super=1.25, plasma=1.5, bfg=1.5 }
    weap_min_damage = 120
    nasty = true
    infight_damage = 18
    boss_replacement = "baron"
  }

-- Shows up sooner, increased total number placed in one
-- room to 4 and density slightly increased.
  pain =
  {
    id = 71
    r = 31
    h = 56
    level = 4
    boss_type = "nasty"
    boss_prob = 15
    boss_limit = 4 --Increases the pain, up from 3. hue hue
    prob = 10
    crazy_prob = 15
    health = 900  -- 400 + 5 skulls
    damage = 14.5 -- about 5 skulls
    attack = "missile"
    density = 0.2
    float = true
    weap_min_damage = 100
    weap_prefs = { launch=1.0, super=1.25, chain=1.5, shotty=0.7 }
    room_size = "any" --large
    cage_factor = 0  -- never put in cages
    infight_damage = 4.5 -- guess
  }

  -- NOTE: this is not normally added to levels
  ss_nazi =
  {
    id = 84
    r = 20
    h = 56
    level = 1
    prob  = 0
    crazy_prob = 0
    health = 50
    damage = 2.8
    attack = "hitscan"
    give = { {ammo="bullet",count=5} }
    density = 1.5
    infight_damage = 6.0
  }
}

DOOM.WEAPONS =
{
  fist =
  {
    attack = "melee"
    rate = 1.5
    damage = 10
  }

  pistol =
  {
    pref = 1
    attack = "hitscan"
    rate = 1.8
    accuracy = 75
    damage = 10
    ammo = "bullet"
    per = 1
  }

  shotty =
  {
    id = 2001
    level = 1.5
    pref = 40
    add_prob = 40
    attack = "hitscan"
    rate = 0.9
    accuracy = 65
    damage = 70
    splash = { 15 }
    ammo = "shell"
    per = 1
    give = { {ammo="shell",count=8} }
    bonus_ammo = 8
  }

  chain =
  {
    id = 2002
    level = 1.5
    pref = 70
    upgrades = "pistol"
    add_prob = 40
    attack = "hitscan"
    rate = 8.5
    accuracy = 85
    damage = 10
    ammo = "bullet"
    per = 1
    give = { {ammo="bullet",count=20} }
    bonus_ammo = 50
  }

  -- the super shotgun is Doom II only
  super =
  {
    id = 82
    level = 2.7
    pref = 40
    upgrades = "shotty"
    add_prob = 70
    attack = "hitscan"
    rate = 0.6
    accuracy = 65
    damage = 150
    -- use splash to simulate hitting a second monster (etc)
    splash = { 40,20,10 }
    ammo = "shell"
    per = 2
    give = { {ammo="shell",count=8} }
    bonus_ammo = 12
  }

  launch =
  {
    id = 2003
    level = 4
    pref = 30
    add_prob = 65
    hide_prob = 10
    attack = "missile"
    rate = 1.7
    accuracy = 80
    damage = 170
    splash = { 65,20,5 }
    ammo = "rocket"
    per = 1
    give = { {ammo="rocket",count=2} }
    bonus_ammo = 5
  }

  plasma =
  {
    id = 2004
    level = 5.2
    pref = 25
    add_prob = 50
    attack = "missile"
    rate = 11
    accuracy = 70
    damage = 22
    ammo = "cell"
    per = 1
    give = { {ammo="cell",count=40} }
    bonus_ammo = 40
  }

  bfg =
  {
    id = 2006
    level = 8
    pref = 12
    upgrades = "plasma"
    add_prob = 20
    hide_prob = 35
    attack = "missile"
    rate = 0.8
    accuracy = 80
    damage = 640
    splash = { 150,150,150,150, 80,80,80,80 }
    ammo = "cell"
    per = 40
    give = { {ammo="cell",count=40} }
    bonus_ammo = 40
  }
}


function COMPLEX_DOOM.setup(self)
  if not PARAM.doom2_weapons then
    GAME.MONSTERS["gunner"] = nil
    GAME.MONSTERS["knight"] = nil
    GAME.MONSTERS["revenant"] = nil
    GAME.MONSTERS["mancubus"] = nil
    GAME.MONSTERS["arach"] = nil
    GAME.MONSTERS["vile"] = nil
    GAME.MONSTERS["pain"] = nil
    GAME.MONSTERS["ss_nazi"] = nil
  end

  for name,_ in pairs(COMPLEX_DOOM.MONSTERS) do
    local M = GAME.MONSTERS[name]

    if M and factor then
      M.prob = M.prob * factor
      M.crazy_prob = (M.crazy_prob or M.prob) * factor
    end
  end
end


UNFINISHED["COMPLEX_DOOM"] =
{
  label = _("Complex Doom Modofications")

  side = "left"
  priority = 61
  game = "doomish"

  tooltip = "Changes enemy placement and thus makes overall gameplay a bit to fair bit harder, depending if you use additional mods in the case of GZDoom."

  engine = { zdoom=1, gzdoom=1, skulltag=1, limit=1 }

  tables =
  {
    COMPLEX_DOOM
  }

  hooks =
  {
    setup = COMPLEX_DOOM.setup
  }
}
