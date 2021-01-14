------------------------------------------------------------------------
--  HERETIC THEMES
------------------------------------------------------------------------
--
--  Copyright (C) 2006-2017 Andrew Apted
--  Copyright (C)      2008 Sam Trenholme
--  Copyright (C) 2019-2020 MsrSgtShooterPerson
--  --Adapted from MsrSgtShooterPerson's Doom themes.lua file
    --Into a singular theme (Castle) for Heretic
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
------------------------------------------------------------------------

HERETIC.SINKS =
{
  -- sky holes --

  sky_plain =
  {
    mat   = "_SKY"
    dz    = 64
    light = 16
  }

  sky_metal =
  {
    mat   = "_SKY"
    dz    = 48
    light = 16

    trim_mat = "METL1"
    trim_dz  = -9
    trim_light = 16
  }

  sky_red =
  {
    mat   = "_SKY"
    dz    = 32
    light = 16

    trim_mat = "FLOOR09"
    trim_dz  = -5
    trim_light = 16
  }

  sky_castle1 =
  {
    mat   = "_SKY"
    dz    = 128
    light = 16

    trim_mat = "CSTLRCK"
    trim_dz  = 0
  }

-- sky ceilings

  sky_metal2 =
  {
    mat   = "_SKY"
    dz    = 48
    light = 16

    trim_mat = "METL2"
    trim_dz  = -9
    trim_light = 16
  }

  sky_castle2 =
  {
    mat   = "_SKY"
    dz    = 144
    light = 16

    trim_mat = "GRNBLOK4"
    trim_dz  = 16
  }

  sky_stone_1 =
  {
    mat   = "_SKY"
    dz    = 64
    light = 16

    trim_mat = "CSTLRCK"
    trim_dz  = 0
  }

  sky_castle3 =
  {
    mat   = "_SKY"
    dz    = 128
    light = 16

    trim_mat = "MOSSRCK1"
    trim_dz  = 16
  }

  sky_castle4 =
  {
    mat   = "_SKY"
    dz    = 128
    light = 16

    trim_mat = "METL1"
    trim_dz  = 16
  }

  sky_fltlava =
  {
    mat   = "_SKY"
    dz    = 80
    light = 32

    trim_mat = "FLTLAVA1"
    trim_dz  = 16
  }

  -- liquid floor --

  liquid_plain =
  {
    mat = "_LIQUID"
    dz  = -12
  }

  liquid_metal =
  {
    mat = "_LIQUID"
    dz  = -8

    trim_mat = "METL2"
    trim_dz  = 0
  }

  liquid_firelava =
  {
    mat = "_LIQUID"
    dz  = -8
    light = 40

    trim_mat = "FLTLAVA1"
    trim_dz  = 2
  }

  liquid_bstone =
  {
    mat = "_LIQUID"
    dz  = -8

    trim_mat = "CSTLRCK"
    trim_dz  = 2
  }


  -- ceiling lights --


  light_brightred_metal =
  {
    mat = "FLOOR09"
    dz  = 8
    light = 32

    trim_mat = "METL2"
    trim_dz  = -5
    trim_light = 16
  }

  light_side1 =
  {
    mat = "FLOOR16"
    dz  = 16
    light = 32

    trim_mat = "METL1"
    trim_dz  = 0
  }

  light_side2 =
  {
    mat = "FLOOR30"
    dz  = 16
    light = 32

    trim_mat = "METL1"
    trim_dz  = 0
  }

   light_side3 =
  {
    mat = "FLOOR17"
    dz  = 24
    light = 24

    trim_mat = "GRNBLOK4"
    trim_dz  = 0
  }

  -- misc floor --

  floor_glowingrock =
  {
    mat = "FLAT523"
    dz  = -8
  }

  floor_green =
  {
    mat = "FLOOR18"
    dz  = -8
  }

  floor_red =
  {
    mat = "FLOOR09"
    dz  = -8
  }

  floor_blue =
  {
    mat = "FLOOR16"
    dz  = -8
  }

   floor_glowingrock2 =
  {
    mat = "FLTLAVA1"
    dz  = -8
  }

  floor_dirt =
  {
    mat = "FLOOR17"
    dz  = -8
  }

  -- misc ceiling --

  ceil_redash =
  {
    mat = "FLOOR09"
    dz  = 8
  }

  ceil_icky =
  {
    mat   = "FLOOR08"
    dz    = 64

    trim_mat = "MOSSRCK1"
    trim_dz  = 64
  }

  ceil_glowrock =
  {
    mat = "FLTLAVA1"
    dz    = 64
    light = 16

    trim_mat = "LOOSERCK"
    trim_dz  = -8
  }

  ceil_water =
  {
    mat = "FLTFLWW1"
    dz    = 64

    trim_mat = "CSTLRCK"
    trim_dz  = -8
  }

  -- fantastic floors
  floor_sky =
  {
    mat = "_SKY"
    dz = -16
    light = 32

    trim_mat = "FLOOR18"
    trim_dz = -8
  }

  floor_trim_sky =
  {
    mat = "_FLOOR"

    trim_mat = "_SKY"
    trim_dz = -8
  }

  floor_trim_liquid =
  {
    mat = "_FLOOR"
    dz = -4

    trim_mat = "_LIQUID"
    trim_dz = -8
  }

  floor_mixup =
  {
    mat = "_CEIL"
    dz = -8

    trim_mat = "_WALL"
    trim_dz = -4
  }

  floor_shawn_wall =
  {
    mat = "_WALL"
    dz = -8

    trim_mat = "CSTLRCK"
    trim_dz = -4
  }

  floor_metal_wall =
  {
    mat = "_WALL"
    dz = -8

    trim_mat = "METL2"
    trim_dz = -4
  }

  floor_shawn_c =
  {
    mat = "_CEIL"
    dz = -8

    trim_mat = "CSTLRCK"
    trim_dz = -4
  }

  floor_metal_c =
  {
    mat = "_CEIL"
    dz = -8

    trim_mat = "METL2"
    trim_dz = -4
  }

  --[[ street sink def, do not use for anything else
  floor_default_streets =
  {
    mat = "FLOOR30"
    dz = 2

    trim_mat = "FLOOR10"
    trim_dz = 2
  } ]]
}


HERETIC.THEMES =
{
  DEFAULTS =
  {
    -- Note: there is no way to control the order which keys are used

    keys =
    {
      k_yellow = 70
      k_green  = 50
      k_blue   = 30
    }

    skyboxes =
    {
      -- Heretic needs a 3D skybox, bois
    }

    cage_lights = { 0, 8, 12, 13 }

    pool_depth = 24
  }


  castle =
  {

   style_list =
    {
      caves = { none=60, few=40, some=12, heaps=2 }
      outdoors = { none=10, few=35, some=90, heaps=30 }
      pictures = { few=20, some=80, heaps=30 }
      hallways = { none=30, few=80, some=15, heaps=10 }
      windows = { few=25, some=50, heaps=90 }
      cages = { none=30, few=50, some=20, heaps=10 }
      liquids = { none=45, few=30, some=20, heaps=5 }
      doors = { few=20, some=70, heaps=30 }
      steepness = { few=25, some=50, heaps=90 }
      big_rooms = { none=25, few=40, some=25, heaps=15 }
      ambushes = { none=5, few=20, some=75, heaps=30 }
      teleporters = { none=20, few=30, some=65, heaps=10 }
      keys = { none=15, few=50, some=50, heaps=20 }
      symmetry = { none=40, few=30, some=35, heaps=25 }
      switches = { none=20, few=60, some=40, heaps=10 }
      secrets = { few=5, some=80, heaps=25 }
      traps   = { none=10, few=40, some=70, heaps=25 }
      barrels = { none=10, few=50, some=20, heaps=5 }
    }

    liquids =
    {
      water2 = 40
      water  = 50
      lava   = 10
      sludge = 15
      magma  = 10
    }
    
    narrow_halls =
    {
      vent = 50
      mineshaft = 50
      access = 50
    }

    wide_halls =
    {
      deuce = 50
      metro = 50
    }

    floor_sinks =
    {
      liquid_plain = 15
      liquid_metal = 10
      liquid_firelava = 5
      liquid_bstone = 5
      floor_glowingrock
      floor_green = 25
      floor_red = 15
      floor_blue = 25
      floor_glowingrock2 = 15
      floor_dirt = 25
      floor_sky = 5
      floor_trim_sky = 5
      floor_trim_liquid = 5
      floor_mixup = 25
      floor_shawn_wall = 25
      floor_shawn_c = 25
      floor_metal_wall = 25
      floor_metal_c = 25
    }

    ceiling_sinks =
    {
      sky_plain = 25
      sky_metal = 20
      sky_metal2 = 20
      sky_red = 15
      sky_stone_1 = 5
      sky_castle1 = 7
      sky_castle2 = 7
      sky_castle3 = 20
      sky_castle4 = 15
      sky_fltlava = 5
      light_brightred_metal = 20
      light_side1 = 100
      light_side2 = 100
      light_side3 = 100
      ceil_redash = 10
      ceil_icky = 10
      ceil_glowrock = 10
      ceil_water = 5
    }

    fences =
    {
      GRNBLOK4 = 60
      CSTLRCK = 40
      METL2 = 30
      GRNBLOK1 = 30
      MOSSRCK1 = 30
      METL1 = 10
    }

    cage_mats =
    {
      METL1 = 60
      METL2 = 60
      GRNBLOK4 = 60
      CSTLRCK = 60
      MOSSRCK1 = 40
      GRNBLOK1 = 40
    }

    facades =
    {
      GRNBLOK3 = 80
      GRNBLOK1 = 40
      CSTLRCK = 30
      GRNBLOK2 = 25
      MOSSRCK1 = 5
      METL2 = 15
      METL1 = 10
    }

    fence_groups =
    {
      PLAIN = 50
    }

    fence_posts =
    {
      Post = 50
    }

    beam_groups =
    {
      beam_metal = 50
    }

    window_groups =
    {
      square = 70
      tall   = 30
    }
    
    wall_groups =
    {
      PLAIN = 50
      torches1 = 50
    }
    
    cave_torches =
    {
      fire_brazier  = 20
      wall_torch   = 70
      mercury_lamp  = 10
    }
    
    outdoor_torches =
    {
      fire_brazier   = 10
      mercury_lamp  = 40
    }

    ceil_light_prob = 70

    scenic_fences =
    {
      GATMETL2 = 50
      GATMETL3 = 50
      GATMETL4 = 50
      GATMETL5 = 50
      WDGAT64 = 50
    }

    sink_style =
    {
      sharp = 1
      curved = 0.1
    }
    
    steps_mat = "FLOOR10"

    post_mat  = "WOODWL"

  }

}


HERETIC.ROOM_THEMES =
{
  any_Hallway =
  {
    env  = "hallway"
    prob = 1

    walls =
    {
      GRSTNPB  = 60
      SANDSQ2  = 20
      SNDCHNKS = 20
    }

    floors =
    {
      FLOOR00 = 50
      FLOOR18 = 50
      FLAT521 = 50
      FLAT506 = 50
    }

    ceilings =
    {
      FLAT523 = 50
    }
  }

  ---- CASTLE THEME --------------------------------

  castle_Green =
  {
    env  = "building"
    prob = 50

    walls =
    {
      GRNBLOK1 = 50
      MOSSRCK1 = 50
    }

    floors =
    {
      FLOOR19 = 20
      FLOOR27 = 50
      FLAT520 = 50
      FLAT521 = 50
    }

    ceilings =
    {
      FLOOR05 = 50
      FLAT512 = 50
    }
  }


  castle_Gray =
  {
    env  = "building"
    prob = 50

    walls =
    {
      CSTLRCK  = 50
      TRISTON1 = 50
    }

    floors =
    {
      FLAT503 = 50
      FLAT522 = 50
      FLOOR10 = 50
    }

    ceilings =
    {
      FLOOR04 = 50
      FLAT520 = 50
    }
  }


  castle_Orange =
  {
    env  = "building"
    prob = 50

    walls =
    {
      SQPEB2   = 50
      TRISTON2 = 50
    }

    floors =
    {
      FLOOR01 = 50
      FLOOR03 = 50
      FLOOR06 = 20
    }

    ceilings =
    {
      FLAT523 = 50
      FLOOR17 = 50
    }
  }

  castle_Cave =
  {
    env  = "cave"
    prob = 50

    walls =
    {
      LOOSERCK=20, BRWNRCKS=20
    }

    floors =
    {
      LOOSERCK=20, BRWNRCKS=20
    }
  }


  castle_Outdoors =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLOOR00=20, FLOOR27=30, FLOOR18=50,
      FLAT522=10, FLAT523=20,
    }

    naturals =
    {
      FLOOR17=50, FLAT509=20, FLAT510=20,
      FLAT513=20, FLAT516=35,
    }

    porch_floors =
    {
      FLAT503 = 10
      FLAT503 = 15
      FLAT516 = 8
      FLOOR05 = 10
      FLOOR06 = 5
      FLOOR06 = 8
      FLOOR08 = 10
      FLOOR10 = 10
      FLOOR11 = 10
      FLOOR12 = 10
      FLOOR17 = 15
      FLOOR25 = 15
      FLOOR28 = 10
      FLOOR29 = 10
    }

  }


  castle_deuce_Hallway =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      SNDCHNKS = 30
      SQPEB1   = 30
      SQPEB2   = 20
      SKULLSB1 = 10
    }

    floors =
    {
      FLOOR00 = 20
      FLOOR01 = 20
      FLOOR06 = 20
      FLOOR07 = 20
      FLOOR09 = 20
      FLAT502 = 10
    }

    ceilings =
    {
      FLOOR29 = 20
      FLOOR00 = 10
      FLOOR09 = 10
      FLAT510 = 10
      FLAT520 = 10
    }
    
  }
  
  castle_vent_Hallway =
  {
    env   = "hallway"
    group = "vent"
    prob  = 1

    walls =
    {
      CSTLRCK = 50
      MOSSRCK1 = 30
    }

    floors =
    {
      FLOOR10 = 30
      FLAT503 = 20
      FLOOR11 = 10
    }

    ceilings =
    {
      FLOOR10 = 30
      FLOOR12 = 20
      FLOOR08 = 20
    }
  }

  castle_access_Hallway =
  {
    env   = "hallway"
    group = "access"
    prob  = 1

    walls =
    {
      CSTLRCK = 50
    }

    floors =
    {
      FLOOR10 = 30
    }

    ceilings =
    {
      FLOOR10 = 30
    }
  }

    castle_mineshaft_Hallway =
  {
    env = "hallway"
    group = "mineshaft"
    prob = 1

    walls =
    {
      LOOSERCK = 50
      SNDPLAIN = 50
      SNDBLCKS = 50
    }

    floors =
    {
      FLOOR17 = 50
      FLAT523 = 50
      FLAT522 = 50
      FLOOR11 = 50
      FLOOR12 = 50
    }

    ceilings =
    {
      FLOOR11 = 50 -- the mineshafts don't actually have
                 -- separate _CEIL textures
    }
   }

   castle_metro_Hallway =
  {
    env   = "hallway"
    group = "metro"
    prob  = 15

    walls =
    {
      GRNBLOK3 = 50
      CSTLRCK = 50
      GRNBLOK1 = 50
      GRNBLOK2 = 50
      GRNBLOK4 = 50
      METL1 = 50
      BLUEFRAG = 50
    }

    floors =
    {
      FLAT503 = 50
      FLAT508 = 50
      FLAT516 = 50
      FLAT522 = 50
      FLOOR03 = 50
      FLOOR05 = 50
      FLOOR06 = 50
      FLOOR10 = 50
      FLOOR11 = 50
      FLOOR12 = 50
      FLOOR28 = 50
      FLOOR30 = 50
    }

    ceilings =
    {
      FLAT503 = 50
      FLAT508 = 50
      FLAT516 = 50
      FLAT522 = 50
      FLOOR03 = 50
      FLOOR05 = 50
      FLOOR06 = 50
      FLOOR10 = 50
      FLOOR11 = 50
      FLOOR12 = 50
      FLOOR28 = 50
      FLOOR30 = 50

    }
  }
   
}
------------------------------------------------------------------------

HERETIC.NAMES =
{
  -- TODO
}


HERETIC.ROOMS =
{
  GENERIC =
  {
    env = "any"
  }

  PRISON =
  {
    style = "cages"
    prob  = 50
  }

  OUTSIDE =
  {
    env = "outdoor"
    prob = 50
  }

}


------------------------------------------------------------------------


OB_THEMES["castle"] =
{
  label = _("Castle")
  game = "heretic"
  name_class = "CASTLE"
  mixed_prob = 50
}

