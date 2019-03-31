PREFABS.Ladder_3d_stair_128 =
{
  file   = "stairs/gtd_3d_stair_128.wad"
  map    = "MAP01"

  prob   = 75
  style  = "steepness"

  where  = "seeds"
  shape  = "I"

  seed_w = 1

  x_fit  = { 64-4,64+4 }

  bound_z1 = 0

  delta_h = 128
  plain_ceiling = true
}

PREFABS.Ladder_3d_stair_128_2X =
{
  template = "Ladder_3d_stair_128"
  map      = "MAP02"

  seed_h   = 2
}

PREFABS.Ladder_3d_stair_128_3X =
{
  template = "Ladder_3d_stair_128"
  map      = "MAP03"

  seed_h   = 3
}