PREFABS.Wall_hell_castle_maccicolations =
{
  file   = "wall/gtd_wall_hell_overhangs.wad"
  map    = "MAP01"

  prob   = 150
  env   = "!building"
  theme = "hell"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "bottom"
}

PREFABS.Wall_hell_castle_maccicolations_overhang =
{
  template = "Wall_hell_castle_maccicolations"

  map = "MAP02"

  deep = 32
}

PREFABS.Wall_hell_castle_turret =
{
  template = "Wall_hell_castle_maccicolations"

  map = "MAP03"

  deep = 48
}
