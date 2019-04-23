PREFABS.Wall_glaice_catacomb_straight =
{
  file   = "wall/glaice_catacomb_set.wad"
  map    = "MAP01"

  prob   = 50
  env = "building"

  uses_epic_textures = true

  group = "glaice_catacomb_wall_set"

  where  = "edge"
  deep   = 16
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "frame"
}

PREFABS.Wall_glaice_catacomb_diagonal =
{
  template = "Wall_glaice_catacomb_straight"

  map      = "MAP03"

  where    = "diagonal"
}