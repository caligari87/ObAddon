PREFABS.Stair_fancy_32_brown =
{
  file   = "stairs/gtd_fancy_stair_32.wad"
  map    = "MAP01"

  prob   = 5
  style  = "steepness"

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 1

  x_fit  = { 24,104 , 152,232 }

  bound_z1 = 0

  delta_h = 32
}

PREFABS.Stair_fancy_32_green =
{
  template = "Stair_fancy_32_brown"

  flat_CEIL5_2 = "RROCK20"
  tex_BRONZE5 = "BROWNGRN"
}

PREFABS.Stair_fancy_32_grey =
{
  template = "Stair_fancy_32_brown"

  flat_CEIL5_2 = "FLAT1"
  tex_BRONZE5 = "GRAY1"
}

PREFABS.Stair_fancy_32_brown_2X =
{
  template = "Stair_fancy_32_brown"

  map = "MAP02"

  seed_h = 2
}

PREFABS.Stair_fancy_32_green_2X =
{
  template = "Stair_fancy_32_brown"

  map = "MAP02"

  seed_h = 2

  flat_CEIL5_2 = "RROCK20"
  tex_BRONZE5 = "BROWNGRN"
}

PREFABS.Stair_fancy_32_grey_2X =
{
  template = "Stair_fancy_32_brown"

  map = "MAP02"

  seed_h = 2

  flat_CEIL5_2 = "FLAT1"
  tex_BRONZE5 = "GRAY1"
}

-----
-- diagonal-edges
----

PREFABS.Stair_fancy_diagonal_edged_32_1X =
{
  file   = "stairs/gtd_fancy_stair_32.wad"
  map    = "MAP03"

  prob   = 20
  style  = "steepness"

  where  = "seeds"
  shape  = "I"

  seed_w = 1
  seed_h = 1

  x_fit  = "stretch"

  bound_z1 = 0

  delta_h = 32
}

PREFABS.Stair_fancy_diagonal_edged_32_2X =
{
  template = "Stair_fancy_diagonal_edged_32_1X"
  map      = "MAP04"

  seed_h   = 2
}
