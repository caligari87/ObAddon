------------------------------------------------------------------------
--  HERETIC THEMES
------------------------------------------------------------------------
--
--  Copyright (C) 2006-2017 Andrew Apted
--  Copyright (C)      2008 Sam Trenholme
--  Copyright (C) 2019-2020 MsrSgtShooterPerson
--  Adapted for Heretic by Dashodanger using Andrew's original Heretic themes
--  from Oblige <= 4.28
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

-- sky ceilings

  sky_ceiling =
  {
    mat   = "_SKY"
    dz    = 48
    light = 16

    trim_mat = "_WALL"
    trim_dz  = -9
    trim_light = 16
  }

  -- liquid floor --

  liquid_plain =
  {
    mat = "_LIQUID"
    dz  = -12
  }

  liquid_trim =
  {
    mat   = "_LIQUID"
    dz    = -16

    trim_mat = "_WALL"
    trim_dz  = -8
  }

  -- ceiling lights --


  light_plain =
  {
    mat = "_FLOOR"
    dz  = 8
    light = 32

    trim_mat = "_WALL"
    trim_dz  = -5
    trim_light = 16
  }

-- plain floors

  floor_plain =
  {
    mat = "_FLOOR"
    dz = -16
    light = 32

    trim_mat = "_WALL"
    trim_dz = -8
  }

  -- fantastic floors
  floor_sky =
  {
    mat = "_SKY"
    dz = -16
    light = 32

    trim_mat = "_WALL"
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
    }

    wide_halls =
    {
      deuce = 50
    }

    floor_sinks =
    {
      floor_plain = 50
      liquid_plain = 40
      liquid_trim = 40
      floor_sky = 5
      floor_trim_sky = 5
      floor_trim_liquid = 5
      floor_mixup = 5
    }

    ceiling_sinks =
    {
      sky_plain = 50
      sky_ceiling = 50
      light_plain = 25
    }

    fences =
    {
      CSTLRCK = 80
      GRSTNPB = 40
    }

    cage_mats =
    {
      CSTLRCK = 80
      GRSTNPB = 40
    }

    facades =
    {
      CSTLRCK = 80
      GRSTNPB = 40
      CTYSTUC2 = 10
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

--    ceil_light_prob = 70

    scenic_fences =
    {
      GATMETL2 = 50
      GATMETL3 = 50
      GATMETL4 = 50
      GATMETL5 = 50
    }

    sink_style =
    {
      sharp = 1
      curved = 0.1
    }
    
    steps_mat = "WOODWL"

    post_mat  = "METL2"

  }
  
  cave =
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
      lava   = 20
      magma  = 10
    }
    
    narrow_halls =
    {
      vent = 50
    }

    wide_halls =
    {
      deuce = 50
    }

    floor_sinks =
    {
      floor_plain = 50
      liquid_plain = 40
      liquid_trim = 40
      floor_sky = 5
      floor_trim_sky = 5
      floor_trim_liquid = 5
      floor_mixup = 5
    }

    ceiling_sinks =
    {
      sky_plain = 50
      sky_ceiling = 50
      light_plain = 25
    }

    fences =
    {
      LOOSERCK = 80
      LAVA1 = 40
      RCKSNMUD = 30
    }

    cage_mats =
    {
      LOOSERCK = 80
      LAVA1 = 40
      RCKSNMUD = 30
    }

    facades =
    {
      LOOSERCK = 80
      LAVA1 = 40
      RCKSNMUD = 30
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

--    ceil_light_prob = 70

    scenic_fences =
    {
      WDGAT64 = 50
    }

    sink_style =
    {
      sharp = 1
      curved = 0.1
    }
    
    steps_mat = "LOOSERCK"

    post_mat  = "WOODWL"

  }
  
  dome =
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
      lava   = 5
      sludge = 15
      magma  = 5
    }
    
    narrow_halls =
    {
      vent = 50
    }

    wide_halls =
    {
      deuce = 50
    }

    floor_sinks =
    {
      floor_plain = 50
      liquid_plain = 40
      liquid_trim = 40
      floor_sky = 5
      floor_trim_sky = 5
      floor_trim_liquid = 5
      floor_mixup = 5
    }

    ceiling_sinks =
    {
      sky_plain = 50
      sky_ceiling = 50
      light_plain = 25
    }

    fences =
    {
      SQPEB1 = 80
      CSTLRCK = 40
    }

    cage_mats =
    {
      SQPEB1 = 80
      CSTLRCK = 40
    }

    facades =
    {
      SQPEB1 = 80
      CSTLRCK = 40
      CTYSTUC2 = 30
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

--    ceil_light_prob = 70

    scenic_fences =
    {
      GATMETL2 = 50
      GATMETL3 = 50
      GATMETL4 = 50
      GATMETL5 = 50
    }

    sink_style =
    {
      sharp = 1
      curved = 0.1
    }
    
    steps_mat = "WOODWL"

    post_mat  = "METL2"

  }
  
   egypt =
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
    }
    
    narrow_halls =
    {
      vent = 50
    }

    wide_halls =
    {
      deuce = 50
    }

    floor_sinks =
    {
      floor_plain = 50
      liquid_plain = 40
      liquid_trim = 40
      floor_sky = 5
      floor_trim_sky = 5
      floor_trim_liquid = 5
      floor_mixup = 5
    }

    ceiling_sinks =
    {
      sky_plain = 50
      sky_ceiling = 50
      light_plain = 25
    }

    fences =
    {
      SNDPLAIN = 80
      SNDBLCKS = 30
      SPINE2 = 10
    }

    cage_mats =
    {
      SNDPLAIN = 80
      SNDBLCKS = 30
      SPINE2 = 10
    }

    facades =
    {
      SNDPLAIN = 80
      SNDBLCKS = 30
      SPINE2 = 10
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

--    ceil_light_prob = 70

    scenic_fences =
    {
      WDGAT64 = 50
    }

    sink_style =
    {
      sharp = 1
      curved = 0.1
    }
    
    steps_mat = "FLOOR27"

    post_mat  = "WOODWL"

  }

 
   garish =
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
      magma  = 10
    }
    
    narrow_halls =
    {
      vent = 50
    }

    wide_halls =
    {
      deuce = 50
    }

    floor_sinks =
    {
      floor_plain = 50
      liquid_plain = 40
      liquid_trim = 40
      floor_sky = 5
      floor_trim_sky = 5
      floor_trim_liquid = 5
      floor_mixup = 5
    }

    ceiling_sinks =
    {
      sky_plain = 50
      sky_ceiling = 50
      light_plain = 25
    }

    fences =
    {
      REDWALL = 40
    }

    cage_mats =
    {
      REDWALL = 40
    }

    facades =
    {
      REDWALL = 40
      WATRWAL1 = 20
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

--    ceil_light_prob = 70

    scenic_fences =
    {
      WDGAT64 = 50
    }

    sink_style =
    {
      sharp = 1
      curved = 0.1
    }
    
    steps_mat = "FLAT502"

    post_mat  = "WOODWL"

  }

}


HERETIC.ROOM_THEMES =
{

  ---- CASTLE THEME --------------------------------

   
  castle_Gold =
  {
    env  = "building"
    prob = 20

    walls =
    {
      SANDSQ2 = 50
    }

    floors =
    {
      FLOOR06 = 20
    }

    ceilings =
    {
      FLOOR11 = 50
    }
  }

  castle_Block =
  {
    env  = "building"
    prob = 50

    walls =
    {
      GRSTNPB = 50
    }

    floors =
    {
      FLOOR03 = 20
    }

    ceilings =
    {
      FLOOR03 = 50
    }
  }


  castle_Mossy =
  {
    env  = "building"
    prob = 50

    walls =
    {
      MOSSRCK1 = 50
    }

    floors =
    {
      FLOOR00 = 50
    }

    ceilings =
    {
      FLOOR04 = 50
    }
  }


  castle_Wood =
  {
    env  = "building"
    prob = 50

    walls =
    {
      WOODWL = 50
    }

    floors =
    {
      FLOOR10 = 50
    }

    ceilings =
    {
      FLOOR12 = 50
    }
  }
  
  castle_Hut =
  {
    env  = "building"
    prob = 50

    walls =
    {
      CTYSTUC3 = 50
    }

    floors =
    {
      FLOOR10 = 50
    }
    
    ceilings =
    {
      FLOOR11 = 50
    }
    
  }
  
  castle_deuce_Hallway_Rckhall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      GRSTNPB = 50
    }

    floors =
    {
      FLOOR03 = 50
    }

    ceilings =
    {
      FLOOR03 = 50
    }
    
  }
  
  castle_vent_Hallway_Rckhall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      GRSTNPB = 50
    }

    floors =
    {
      FLOOR03 = 50
    }

    ceilings =
    {
      FLOOR03 = 50
    }
    
  }
  
    castle_deuce_Hallway_Sthall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      LOOSERCK = 50
    }

    floors =
    {
      FLOOR00 = 50
    }

    ceilings =
    {
      FLOOR00 = 50
    }
    
  }
  
  castle_vent_Hallway_Sthall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      LOOSERCK = 50
    }

    floors =
    {
      FLOOR00 = 50
    }

    ceilings =
    {
      FLOOR00 = 50
    }
    
  }
  
  castle_deuce_Hallway_Wdhall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      SQPEB2 = 50
    }

    floors =
    {
      FLOOR06 = 50
    }

    ceilings =
    {
      FLOOR06 = 50
    }
    
  }
  
  castle_vent_Hallway_Wdhall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      SQPEB2 = 50
    }

    floors =
    {
      FLOOR06 = 50
    }

    ceilings =
    {
      FLOOR06 = 50
    }
    
  }
  
  castle_Outdoors_Stony =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLOOR00 = 20
    }

    naturals =
    {
      FLOOR00 = 20
    }

    porch_floors =
    {
      FLOOR00 = 50
    }

  }
  
  castle_Outdoors_Muddy =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLOOR17 = 20
    }

    naturals =
    {
      FLOOR17 = 20
    }

    porch_floors =
    {
      FLOOR17 = 50
    }

  }
  
  castle_Outdoors_Sandy =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLOOR27 = 20
    }

    naturals =
    {
      FLOOR27 = 20
    }

    porch_floors =
    {
      FLOOR27 = 50
    }

  }
  
  --------- CAVE THEME -------------

  cave_Cave1 =
  {
    env  = "building"
    prob = 50

    walls =
    {
      LOOSERCK = 50
    }

    floors =
    {
      FLAT516 = 50
    }
    
    ceilings =
    {
      FLOOR01 = 50
    }
    
  }

  cave_Cave2 =
  {
    env  = "building"
    prob = 50

    walls =
    {
      LAVA1 = 50
    }

    floors =
    {
      FLAT516 = 50
    }
    
    ceilings =
    {
      FLAT506 = 50
    }
    
  }
  
  cave_Cave3 =
  {
    env  = "building"
    prob = 50

    walls =
    {
      BRWNRCKS = 50
    }

    floors =
    {
      FLOOR01 = 50
    }
    
    ceilings =
    {
      FLAT516 = 50
    }
    
  }
  
    cave_Root =
  {
    env  = "building"
    prob = 50

    walls =
    {
      ROOTWALL = 50
    }

    floors =
    {
      FLAT506 = 50
    }
    
    ceilings =
    {
      FLAT506 = 50
    }
    
  }

  cave_deuce_Hallway_Sthall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      LOOSERCK = 50
    }

    floors =
    {
      FLOOR00 = 50
    }

    ceilings =
    {
      FLOOR00 = 50
    }
    
  }
  
  cave_vent_Hallway_Sthall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      LOOSERCK = 50
    }

    floors =
    {
      FLOOR00 = 50
    }

    ceilings =
    {
      FLOOR00 = 50
    }
    
  }
  
  cave_deuce_Hallway_Rthall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      ROOTWALL = 50
    }

    floors =
    {
      FLAT506 = 50
    }

    ceilings =
    {
      FLAT506 = 50
    }
    
  }
  
  cave_vent_Hallway_Rthall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      ROOTWALL = 50
    }

    floors =
    {
      FLAT506 = 50
    }

    ceilings =
    {
      FLAT506 = 50
    }
    
  }

  cave_Outdoors_Cave01 =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLAT516 = 20
    }

    naturals =
    {
      FLAT516 = 20
    }

    porch_floors =
    {
      FLAT516 = 20
    }

  }
  
    cave_Outdoors_Cave02 =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLAT510 = 20
    }

    naturals =
    {
      FLAT510 = 20
    }

    porch_floors =
    {
      FLAT510 = 20
    }

  }
  
  --------- DOME THEME -------------

  dome_Disco2 =
  {
    env  = "building"
    prob = 50

    walls =
    {
      SQPEB1 = 50
    }

    floors =
    {
      FLAT522 = 50
    }
    
    ceilings =
    {
      FLOOR06 = 50
    }
    
  }

  dome_Mossy =
  {
    env  = "building"
    prob = 50

    walls =
    {
      MOSSRCK1 = 50
    }

    floors =
    {
      FLOOR00 = 50
    }
    
    ceilings =
    {
      FLOOR04 = 50
    }
    
  }
  
  dome_Hut =
  {
    env  = "building"
    prob = 50

    walls =
    {
      CTYSTUC3 = 50
    }

    floors =
    {
      FLOOR10 = 50
    }
    
    ceilings =
    {
      FLOOR11 = 50
    }
    
  }
  
  dome_deuce_Hallway_Rckhall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      GRSTNPB = 50
    }

    floors =
    {
      FLOOR03 = 50
    }

    ceilings =
    {
      FLOOR03 = 50
    }
    
  }
  
  dome_vent_Hallway_Rckhall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      GRSTNPB = 50
    }

    floors =
    {
      FLOOR03 = 50
    }

    ceilings =
    {
      FLOOR03 = 50
    }
    
  }
  
  dome_deuce_Hallway_Whall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      MOSAIC1 = 50
    }

    floors =
    {
      FLTWAWA1 = 50
    }

    ceilings =
    {
      FLAT502 = 50
    }
    
  }
  
  dome_vent_Hallway_Whall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      MOSAIC1 = 50
    }

    floors =
    {
      FLTWAWA1 = 50
    }

    ceilings =
    {
      FLAT502 = 50
    }
    
  }
 
  dome_Outdoors_ODisco2 =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLAT522 = 20
    }

    naturals =
    {
      FLAT522 = 20
    }

    porch_floors =
    {
      SPINE2 = 20
    }

  }
  
  dome_Outdoors_Muddy =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLOOR17 = 20
    }

    naturals =
    {
      FLOOR17 = 20
    }

    porch_floors =
    {
      FLOOR17 = 20
    }

  }
  
  dome_Outdoors_Sandy =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLOOR27 = 20
    }

    naturals =
    {
      FLOOR27 = 20
    }

    porch_floors =
    {
      FLOOR27 = 20
    }

  }
  
------- EGYPT THEME -------

   egypt_Gold =
  {
    env  = "building"
    prob = 50

    walls =
    {
      SANDSQ2 = 50
    }

    floors =
    {
      FLOOR06 = 50
    }

    ceilings =
    {
      FLOOR11 = 50
    }
  }
  
  egypt_Wood =
  {
    env  = "building"
    prob = 50

    walls =
    {
      WOODWL = 50
    }

    floors =
    {
      FLOOR10 = 50
    }

    ceilings =
    {
      FLOOR12 = 50
    }
  }

  egypt_Disco1 =
  {
    env  = "building"
    prob = 50

    walls =
    {
      SPINE2 = 50
    }

    floors =
    {
      FLAT522 = 50
    }
    
    ceilings =
    {
      FLOOR06 = 50
    }
    
  }
  
  egypt_Pyramid =
  {
    env  = "building"
    prob = 50

    walls =
    {
      SNDPLAIN = 50
    }

    floors =
    {
      FLOOR27 = 50
    }
    
    ceilings =
    {
      FLOOR10 = 50
    }
    
  }
  
  egypt_Pharoah =
  {
    env  = "building"
    prob = 50

    walls =
    {
      TRISTON2 = 50
    }

    floors =
    {
      FLAT522 = 50
    }
    
    ceilings =
    {
      FLOOR20 = 50
    }
    
  }
  
  egypt_Parlor =
  {
    env  = "building"
    prob = 50

    walls =
    {
      SQPEB2 = 50
    }

    floors =
    {
      FLOOR06 = 50
    }
    
    ceilings =
    {
      FLOOR06 = 50
    }
    
  }
  
  egypt_Sblock =
  {
    env  = "building"
    prob = 50

    walls =
    {
      SNDBLCKS = 50
    }

    floors =
    {
      FLOOR27 = 50
    }
    
    ceilings =
    {
      FLOOR10 = 50
    }
    
  }
  
  egypt_Cave3 =
  {
    env  = "building"
    prob = 10

    walls =
    {
      BRWNRCKS = 50
    }

    floors =
    {
      FLOOR01 = 50
    }
    
    ceilings =
    {
      FLAT516 = 50
    }
    
  }
  
  egypt_deuce_Hallway_Wdhall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      SQPEB2 = 50
    }

    floors =
    {
      FLOOR06 = 50
    }

    ceilings =
    {
      FLOOR06 = 50
    }
    
  }
  
  egypt_vent_Hallway_Wdhall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      SQPEB2 = 50
    }

    floors =
    {
      FLOOR06 = 50
    }

    ceilings =
    {
      FLOOR06 = 50
    }
    
  }
  
  egypt_deuce_Hallway_Sdhall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      SNDPLAIN = 50
    }

    floors =
    {
      FLOOR27 = 50
    }

    ceilings =
    {
      FLOOR10 = 50
    }
    
  }
  
  egypt_vent_Hallway_Sdhall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      SNDPLAIN = 50
    }

    floors =
    {
      FLOOR27 = 50
    }

    ceilings =
    {
      FLOOR10 = 50
    }
    
  }
  
  egypt_Outdoors_ODisco1 =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLAT522 = 50
    }

    naturals =
    {
      FLAT522 = 50

    }

    porch_floors =
    {
      SNDBLCKS = 50
    }

  }
  
  egypt_Outdoors_PyramidO =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLOOR27 = 50
    }

    naturals =
    {
      FLOOR27 = 50
    }

    porch_floors =
    {
      SPINE2 = 50
    }

  }
  
  egypt_Outdoors_PharoahO =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLAT521 = 50
    }

    naturals =
    {
      FLAT521 = 50
    }

    porch_floors =
    {
      SQPEB2 = 50
    }

  }
  
  egypt_Outdoors_Sandz =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLOOR27 = 50
    }

    naturals =
    {
      FLOOR27 = 50
    }

    porch_floors =
    {
      FLOOR27 = 50
    }

  }
   
  
--------- GARISH THEME -------------

  garish_Purple =
  {
    env  = "building"
    prob = 50

    walls =
    {
      BLUEFRAG = 50
    }

    floors =
    {
      FLOOR07 = 50
    }
    
    ceilings =
    {
      FLOOR07 = 50
    }
    
  }

  garish_Blue =
  {
    env  = "building"
    prob = 50

    walls =
    {
      MOSAIC1 = 50
    }

    floors =
    {
      FLAT502 = 50
    }
    
    ceilings =
    {
      FLOOR16 = 50
    }
    
  }
  
  garish_Ice =
  {
    env  = "building"
    prob = 50

    walls =
    {
      STNGLS1 = 50
    }

    floors =
    {
      FLAT502 = 50
    }
    
    ceilings =
    {
      FLAT517 = 50
    }
    
  }
  
  garish_deuce_Hallway_Whall =
  {
    env   = "hallway"
    group = "deuce"
    prob  = 50

    walls =
    {
      MOSAIC1 = 50
    }

    floors =
    {
      FLTWAWA1 = 50
    }

    ceilings =
    {
      FLAT502 = 50
    }
    
  }
  
  garish_vent_Hallway_Whall =
  {
    env   = "hallway"
    group = "vent"
    prob  = 50

    walls =
    {
      MOSAIC1 = 50
    }

    floors =
    {
      FLTWAWA1 = 50
    }

    ceilings =
    {
      FLAT502 = 50
    }
    
  }
  
  garish_Outdoors_Water =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLTWAWA1 = 20
    }

    naturals =
    {
      FLTWAWA1 = 20
    }

    porch_floors =
    {
      FLTWAWA1 = 20
    }

  }  
  
  garish_Outdoors_PurpleO =
  {
    env  = "outdoor"
    prob = 50

    floors =
    {
      FLOOR07 = 20
    }

    naturals =
    {
      FLOOR07 = 20
    }

    porch_floors =
    {
      FLOOR07 = 20
    }

  } 
   
--------- GENERIC ITEMS ----------

  any_Cave =
  {
    env  = "cave"
    prob = 50

    walls =
    {
      LOOSERCK=20, LAVA1=20, BRWNRCKS=20, ROOTWALL=20
    }

    floors =
    {
      FLAT516=20, FLAT506=20, FLOOR01=20
    }
  }
   
}
------------------------------------------------------------------------


HERETIC.ROOMS =
{

  GENERIC =
  {
    env = "any"
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

OB_THEMES["cave"] =
{
  label = _("Cave")
  game = "heretic"
  name_class = "CASTLE"
  mixed_prob = 50
}

OB_THEMES["dome"] =
{
  label = _("Dome")
  game = "heretic"
  name_class = "CASTLE"
  mixed_prob = 50
}

OB_THEMES["egypt"] =
{
  label = _("Egypt")
  game = "heretic"
  name_class = "CASTLE"
  mixed_prob = 50
}

OB_THEMES["garish"] =
{
  label = _("Garish")
  game = "heretic"
  name_class = "CASTLE"
  mixed_prob = 50
}

