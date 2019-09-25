--
--Cages for urban
--

--a garage cage with car and small sandbag fortification
PREFABS.Cage_dem_garage_ambush1 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP01"

  engine = "zdoom"

  prob   = 1000

  theme  = "urban"
  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 2

  deep   = 16
  over   = -16

  x_fit = "frame"
  y_fit  = "frame"

  tex_BRICK9 = { BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK3=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
    STONE3=50, BRICK12=50, BRICK5=50,
    BRONZE1=50, BROWN1=50, BROWN96=50,
    BROWNGRN=50, CEMENT7=50, CEMENT9=50
  }

}

PREFABS.Cage_dem_garage_ambush1CBL =
{
  template = "Cage_dem_garage_ambush1"

  flat_FLAT5_3 = "CEIL4_2"

  tex_REDWALL = "COMPBLUE"
}

PREFABS.Cage_dem_garage_ambush1CBR =
{
  template = "Cage_dem_garage_ambush1"

  flat_FLAT5_3 = "CEIL5_2"

  tex_REDWALL = "BROWN144"
}

--a garage cage with a big truck
PREFABS.Cage_dem_garage_ambush2 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP02"

  engine = "zdoom"

  prob   = 1000

  theme  = "urban"
  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 2

  deep   = 16
  over   = -16

  x_fit = "frame"
  y_fit  = "frame"

  tex_BRICK9 = { BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK3=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
    STONE3=50, BRICK12=50, BRICK5=50,
    BRONZE1=50, BROWN1=50, BROWN96=50,
    BROWNGRN=50, CEMENT7=50, CEMENT9=50
  }

}

--a grocery store with a horde of enemies inside
PREFABS.Cage_dem__store_ambush =
{
  file  = "cage/dem_cages.wad"
  map   = "MAP03"

  engine = "zdoom"

  theme = "urban"
  env   = "outdoor"
  prob  = 1000

  where  = "seeds"
  shape  = "U"
  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit  = "frame"

  can_flip = true

  tex_BRICK9 = { BRICK1=50, BRICK10=50, BRICK11=50, BRICK2=50, BRICK3=50, BRICK4=50, BRICK6=50, BRICK7=50, BRICK8=50, STONE2=50, STUCCO=50, STUCCO1=50, STUCCO3=50, TANROCK2=50, TANROCK3=50, SHAWN2=50}

  thing_59 =
  {
  hang_twitching = 50
  hang_torso = 50
  hang_leg   = 50
  hang_leg_gone = 50
  }

  thing_62 =
  {
  hang_twitching = 50
  hang_torso = 50
  hang_leg   = 50
  hang_leg_gone = 50
  }

  thing_12 =
  {
  hang_twitching = 50
  hang_torso = 50
  hang_leg   = 50
  hang_leg_gone = 50
  }
}
