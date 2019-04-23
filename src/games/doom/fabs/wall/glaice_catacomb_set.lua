PREFABS.Wall_glaice_catacomb_straight =
{
  file   = "wall/glaice_catacomb_set.wad"
  map    = "MAP01"
  theme  = "hell"

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

  tex_CATACMB1 = { CATACMB1=50, CATACMB4=50 }
}

PREFABS.Wall_glaice_catacomb_diagonal =
{
  template = "Wall_glaice_catacomb_straight"
  theme = "hell"

  map      = "MAP02"

  where    = "diagonal"

  tex_CATACMB1 = { CATACMB1=50, CATACMB4=50 }
}

-- Versions for Doom1
PREFABS.Wall_glaice_catacomb_straight_doom1 =
{
  template = "Wall_glaice_catacomb_straight"
  theme = "flesh"
  game = "doom"
  map = "MAP01"
  tex_CATACMB1 = { CATACMB1=50, CATACMB4=50 }
}

PREFABS.Wall_glaice_catacomb_diagonal_doom1 =
{
  template = "Wall_glaice_catacomb_straight"
  theme = "flesh"
  game = "doom"
  map      = "MAP02"

  where    = "diagonal"

  tex_CATACMB1 = { CATACMB1=50, CATACMB4=50 }
}