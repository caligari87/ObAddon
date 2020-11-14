--------------------------------------------------------------------
--  The Plutonia Experiment
--------------------------------------------------------------------
--
--  Copyright (C) 2006-2016 Andrew Apted
--  Copyright (C) 2019-2020 Armaetus
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--------------------------------------------------------------------

PLUTONIA = { }


PLUTONIA.PARAMETERS =
{
  bex_map_prefix  = "PHUSTR_"

  bex_secret_name  = "P5TEXT"
  bex_secret2_name = "P6TEXT"
}


PLUTONIA.MATERIALS =
{
  -- Note the actual texture names contain hyphens, but we must use
  -- an underscore for the OBLIGE material names.

  A_BRBRK  = { t="A-BRBRK",  f="RROCK18" }
  A_BRBRK2 = { t="A-BRBRK2", f="RROCK16" }
  A_BRICK1 = { t="A-BRICK1", f="MFLR8_1" }
  A_BROWN1 = { t="A-BROWN1", f="RROCK17" }
  A_BROWN2 = { t="A-BROWN2", f="FLAT8" }
  A_BROWN3 = { t="A-BROWN3", f="RROCK03" }
  A_BROWN5 = { t="A-BROWN5", f="RROCK19" }

  A_CAMO1 =  { t="A-CAMO1",  f="GRASS1" }
  A_CAMO2 =  { t="A-CAMO2",  f="SLIME13" }
  A_CAMO3 =  { t="A-CAMO3",  f="SLIME13" }
  A_CAMO4 =  { t="A-CAMO4",  f="FLOOR7_2" }

  A_DBRI1 =  { t="A-DBRI1",  f="FLAT5_4" }
  A_DBRI2 =  { t="A-DBRI2",  f="MFLR8_2" }
  A_DROCK1 = { t="A-DROCK1", f="FLOOR6_2" }
  A_DROCK2 = { t="A-DROCK2", f="MFLR8_2" }

  A_MARBLE = { t="A-MARBLE", f="FLAT1" }
  A_MOSBRI = { t="A-MOSBRI", f="SLIME13" }
  A_MOSROK = { t="A-MOSROK", f="FLAT5_7" }
  A_MOSRK2 = { t="A-MOSRK2", f="SLIME13" }
  A_MOULD =  { t="A-MOULD",  f="RROCK19" }
  A_MUD =    { t="A-MUD",    f="RROCK16" }

  A_MYWOOD = { t="A-MYWOOD", f="FLAT5_1" }
  A_POIS =   { t="A-POIS",   f="CEIL5_2" }
  A_REDROK = { t="A-REDROK", f="FLAT5_3" }
  A_ROCK =   { t="A-ROCK",   f="FLAT5_7" }
  A_TILE =   { t="A-TILE",   f="GRNROCK" }
  A_VINE3 =  { t="A-VINE3",  f="RROCK12" }
  A_VINE4 =  { t="A-VINE4",  f="RROCK16" }
  A_VINE5 =  { t="A-VINE5",  f="MFLR8_3" }

  A_YELLOW = { t="A-YELLOW", f="FLAT23" }

  A_ASKIN1 =   { t="A-ASKIN1",   f="FLAT5_6" }
  A_ASKIN2 =   { t="A-ASKIN2",   f="FLAT5_6" }
  A_ASKIN3 =   { t="A-ASKIN3",   f="FLAT5_6" }
  A_ASKIN4 =   { t="A-ASKIN4",   f="FLAT5_6" }
  A_ASKIN5 =   { t="A-ASKIN5",   f="FLAT5_6" }

  -- Actually named SLIME## but named TSLIME to avoid
  -- confusion with the flats of the same name
  TSLIME1 =  { t="SLIME1",  f="FLAT5_2" }
  TSLIME2 =  { t="SLIME2",  f="MFLR8_2" }
  TSLIME3 =  { t="SLIME3",  f="SLIME13" }
  TSLIME4 =  { t="SLIME4",  f="SLIME13" }
  TSLIME5 =  { t="SLIME5",  f="CEIL5_2" }
  TSLIME8 =  { t="SLIME8",  f="SLIME13" }

  -- this is animated
  AROCK1   = { t="AROCK1",   f="GRNROCK" }
  FIREBLU1 = { t="FIREBLU1", f="GRNROCK" }
  FIREBLU2 = { t="FIREBLU2", f="GRNROCK" }

  JUNGLE1  = { t="MC10", f="RROCK19" }
  JUNGLE2  = { t="MC2",  f="RROCK19" }

  -- use the TNT name for this
  METALDR  = { t="A-BROWN4", f="CEIL5_2" }

  -- use Plutonia's waterfall texture instead of our own
  WFALL1   = { t="WFALL1", f="FWATER1", sane=1 }
  FWATER1  = { t="WFALL1", f="FWATER1", sane=1 }

  -- Railing / Grates
  A_GRATE = { t="A-GRATE", rail_h=128 }
  A_RAIL1 = { t="A-RAIL1", rail_h=32 }
  A_VINE1 = { t="A-VINE1", rail_h=128 }
  A_VINE2 = { t="A-VINE2", rail_h=128 }

  -- Overrides for existing DOOM materials --

  WOOD1    = { t="A-MYWOOD", f="FLAT5_2" }
  CEIL1_1  = { f="CEIL1_1", t="A-WOOD1" }
  CEIL1_3  = { f="CEIL1_3", t="A-WOOD1" }
  FLAT5_1  = { f="FLAT5_1", t="A-WOOD1" }
  FLAT5_2  = { f="FLAT5_2", t="A-WOOD1" }

  STONE   = { t="A-CONCTE", f="FLAT5_4" }
  FLAT5_4 = { t="A-CONCTE", f="FLAT5_4" }

  BIGBRIK2 = { t="A-BRICK1", f="MFLR8_1" }
  BIGBRIK1 = { t="A-BRICK2", f="RROCK14" }
  RROCK14  = { t="A-BRICK2", f="RROCK14" }
  BRICK5   = { t="A-BRICK3", f="RROCK12" }
  BRICJ10  = { t="A-TILE",   f="GRNROCK" }
  BRICK11  = { t="A-BRBRK",  f="RROCK18" }
  BRICK12  = { t="A-BROCK2", f="FLOOR4_6" }

  ASHWALL4 = { t="A-DROCK2", f="MFLR8_2" }
  ASHWALL7 = { t="A-MUD",    f="RROCK16" }

  BIGDOOR2 = { t="A-BROWN4", f="CEIL5_2" }
  BIGDOOR3 = { t="A-BROWN4", f="CEIL5_2" }
  BIGDOOR4 = { t="A-BROWN4", f="CEIL5_2" }
}


PLUTONIA.EPISODES =
{
  episode1 =
  {
    theme = "tech"
    sky_patch = "SKY1"
    dark_prob = 10
    bex_mid_name = "P1TEXT"
    bex_end_name = "P2TEXT"
  }

  episode2 =
  {
    theme = "urban"
    sky_patch  = "SKY2A"
    sky_patch2 = "SKY2B"
    sky_patch3 = "SKY2C"
    sky_patch4 = "SKY2D"
    dark_prob = 10
    bex_end_name = "P3TEXT"
  }

  episode3 =
  {
    theme = "hell"
    sky_patch  = "SKY3A"
    sky_patch2 = "SKY3B"
    dark_prob = 40
    bex_end_name = "P4TEXT"
  }
}

-- WORK IN PROGRESS --
-- TEMPORARY SHIT, DO NOT REENABLE JUST YET! --
-- -Armaetus, October 2nd, 2020

-- More tables and other crap are needed so
-- Plutonia has some exclusive themes added,
-- though not too many. If Evilution has some,
-- so should Plutonia.

-- Some thoughts:
-- Plutonia is generally harder and really seems to
-- like using chaingunners and revenants more, possibly
-- other monsters so would suggest monster_prefs be
-- anywhere from 1.25 to 1.5, depending on placement
-- and lethality.


-- Copied from x_tnt.lua as a placeholder, mostly.
UNFINISHED.THEMES =
{

jungle =
  {
    liquids =
    {
      slime = 60
      blood = 30
      water = 20
      lava  = 10
    }

    entity_remap =
    {
      k_red    = "ks_red"
      k_blue   = "ks_blue"
      k_yellow = "ks_yellow"
    }

    facades =
    {
      SMSTONE6 = 30
      STONEW1  = 20
      STWALL   = 20
      CAVERN1  = 10

      BIGBRIK1 = 30
      BSTONE2  = 20
      BRICK4   = 10
    }

    prefab_remap =
    {
      DOORBLU  = "DOORBLU2"
      DOORRED  = "DOORRED2"
      DOORYEL  = "DOORYEL2"

      SILVER3  = "MURAL1"
      GATE3    = "FLAT22"
      GATE4    = "FLAT22"
      REDWALL  = "DOKGRIR"
      SW1COMP  = "SW1CMT"
    }

    window_groups =
    {
      round  = 90
      barred = 60
      grate  = 30
    }

    outdoor_torches =
    {
      blue_torch = 50
      green_torch = 50
      red_torch = 50
      candelabra = 20
    }

    beam_groups =
    {
      beam_gothic = 50
      beam_quakeish = 50
    }

    fence_groups =
    {
      PLAIN = 50
      crenels = 50
      gappy = 50
      fence_gothic = 50
    }

    fence_posts =
    {
      Post_metal = 25
      Post_gothic_blue = 10
      Post_gothic_green = 10
      Post_gothic_red = 15
      Post_gothic_blue_2 = 10
      Post_gothic_green_2 = 10
      Post_gothic_red_2 = 15
    }

-- Based on Plutonia's FUCK YOU to the player..

-- November 14th, 2020
-- WIP: Further analysis of plutonia.wad's monster placement.
-- monster_prefs are subject to change.
    monster_prefs =
    {
      gunner = 1.5
      mancubus = 1.2
      revenant = 1.3
      demon   = 0.8
      vile = 1.1
      shooter = 0.75
      zombie = 0.5
    }

--Any rocky/stonelike/metal doors (IE METALDR) would do great for this theme -Chris
    scenic_fences =
    {
      MIDBARS3 = 50
    }

    skyboxes =
    {
      Skybox_generic = 50
    }
  }
}

UNFINISHED.ROOM_THEMES =
{

-- JUNGLE BULLSHIT --
-- TEMP TEMP TEMP! --

  jungle_placeholder =
  {
    env  = "building"
    prob = 25

    walls =
    {
      STARTAN2 = 50
      STARTAN3 = 60

      STARG1 = 40
      STARG2 = 20
      STARG3 = 40

      STARGR1 = 50
      STARGR2 = 20

      STARBR2  = 40
    }

    floors =
    {
      FLOOR4_8 = 50
      FLOOR5_1 = 50
      FLOOR5_3 = 30
      FLOOR0_3 = 30
      FLOOR5_1 = 25
      FLOOR3_3 = 20
      FLOOR0_2 = 20
      FLOOR0_1 = 20
      FLOOR4_6 = 15
      FLOOR7_1 = 15
      FLAT4 = 15
      FLAT14 = 10
      SLIME15 = 10
      SLIME16 = 10
      FLOOR1_6 = 6
      FLOOR1_1 = 8
      FLOOR0_5 = 5
      FLAT5 = 5
    }
  }
}


--------------------------------------------------------------------

OB_GAMES["plutonia"] =
{
  label = _("Plutonia")

  extends = "doom2"

  iwad_name = "plutonia.wad"

  tables =
  {
    PLUTONIA
  }
}
