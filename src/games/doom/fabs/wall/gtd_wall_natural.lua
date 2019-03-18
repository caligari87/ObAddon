PREFABS.Wall_natural1 =
{
  file   = "wall/gtd_wall_natural.wad"
  map    = "MAP01"

  prob   = 50
  env    = "park"

  group  = "natural_walls"

  where  = "edge"
  deep   = 32

  bound_z1 = 0
  bound_z2 = 2

  x_fit  = "stretch"
  z_fit  = "stretch"
}

PREFABS.Wall_natural2 =
{
  template = "Wall_natural1"
  map      = "MAP02"

  deep  = 16
}

PREFABS.Wall_natural3 =
{
  template = "Wall_natural1"
  map      = "MAP03"

  deep  = 24
}

PREFABS.Wall_natural4 =
{
  template = "Wall_natural1"
  map      = "MAP04"

  deep  = 40
}

PREFABS.Wall_natural5 =
{
  template = "Wall_natural1"
  map      = "MAP05"

  deep  = 40
}
