PREFABS.Stairs_128 =
{
  file   = "stairs/gtd_stairs_128.wad"
  map    = "MAP01"

  prob   = 250
  style  = "steepness"

  where  = "seeds"
  shape  = "I"

  seed_w = 1

  x_fit  = "stretch"

  bound_z1 = 0

  delta_h = 128
  plain_ceiling = true
}

PREFABS.Stairs_128_2X =
{
  template = "Stairs_128"
  map    = "MAP02"

  seed_h = 2
}

PREFABS.Stairs_128_3X =
{
  template = "Stairs_128"
  map    = "MAP03"

  seed_h = 3
}
