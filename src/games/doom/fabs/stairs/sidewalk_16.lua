PREFABS.Sidewalk_16 =
{
  file   = "stairs/sidewalk_16.wad"

  prob   = 20
  map    = "MAP01"

  where  = "seeds"

  style  = "steepness"
  shape  = "I"

  seed_h = 1
  seed_w = 1

  x_fit  = "stretch"
  y_fit  = "stretch"

  bound_z1 = 0
  bound_z2 = 16

  delta_h = 16
}

PREFABS.Sidewalk_16_stepped_tech =
{
  template = "Sidewalk_16"
  map = "MAP02"

  theme = "tech"

  prob = 30

  tex_METAL = "STEP4"
  flat_CEIL5_2 = "FLAT19"
}

PREFABS.Sidewalk_16_stepped =
{
  template = "Sidewalk_16"
  map = "MAP02"

  theme = "!tech"

  prob = 30
}
