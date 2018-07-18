--
-- Various crates
--


-- a small crate, 64x64 in size

PREFABS.Crate_small_brown =
{
  file   = "decor/crates1.wad"
  map    = "MAP01"

  prob   = 2500
  theme  = "tech"

  where  = "point"
  size   = 64

  bound_z1 = 0
}


PREFABS.Crate_small_gray =
{
  template = "Crate_small_brown"

   tex_CRATE1  = "CRATE2"
  flat_CRATOP2 = "CRATOP1"
}

-- ones for Urban and Hell themes

PREFABS.Crate_small_woodmet =
{
  file   = "decor/crates2.wad"
  map    = "MAP11"

  theme  = "!tech"
  prob   = 2500

  where  = "point"
  size   = 64
}

PREFABS.Crate_small_wood3 =
{
  template = "Crate_small_woodmet"

  map    = "MAP10"
}


-- a tall narrow crate

PREFABS.Crate_tall_brown =
{
  file   = "decor/crates1.wad"
  map    = "MAP02"

  prob   = 2500
  theme  = "tech"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
}


-- Tall computer screens

PREFABS.Crate_tall_computers =
{
  template   = "Crate_tall_brown"
  map    = "MAP02"

  prob   = 2500
  theme  = "tech"
  env    = "building"

  tex_CRATELIT = "SPACEW3"
  flat_CRATOP1 = "CEIL5_1"

}

-- a medium-size crate (96x96)

PREFABS.Crate_medium_gray =
{
  file   = "decor/crates1.wad"
  map    = "MAP03"

  prob   = 2500
  theme  = "tech"
  env    = "!cave"

  where  = "point"
  size   = 96

  bound_z1 = 0
}


-- a group of three and a half crates

PREFABS.Crate_group_medium =
{
  file   = "decor/crates1.wad"
  map    = "MAP04"

  prob   = 2500
  env    = "!cave"
  theme  = "tech"

  where  = "point"
  size   = 128
  height = 160

  bound_z1 = 0
}

-- a large, tall, wooden crate

PREFABS.Crate_large_wooden =
{
  file   = "decor/crates2.wad"
  map    = "MAP12"

  theme  = "!tech"
  prob   = 2500

  where  = "point"
  size   = 128
  height = 160
}

PREFABS.Small_Computer1 =
{
  file   = "decor/crates1.wad"
  map    = "MAP13"

  env    = "building"
  theme  = "tech"
  prob   = 2500

  where  = "point"
  size   = 80
  height = 128

 tex_COMPSTA1 = { COMPSTA1=50, COMPSTA2=50 }
}

PREFABS.Small_Computer2 =
{
  file   = "decor/crates1.wad"
  map    = "MAP14"

  env    = "building"
  theme  = "tech"
  prob   = 2500

  where  = "point"
  size   = 112
  height = 128

 tex_COMPSTA1 = { COMPSTA1=50, COMPSTA2=50 }
}