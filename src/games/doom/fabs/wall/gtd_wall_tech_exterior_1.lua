--
-- Fancy walls
--

PREFABS.Wall_outdoor_accent_flat =
{
  file   = "wall/gtd_wall_tech_exterior_1.wad"
  map    = "MAP02"

  prob   = 50
  env   = "!building"
  theme = "tech"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "bottom"
}

PREFABS.Wall_vertical_long_windows =
{
  file   = "wall/gtd_wall_tech_exterior_1.wad"
  map    = "MAP03"

  prob   = 50
  env   = "!building"
  theme = "tech"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = { 64-8,64+8 }
}

PREFABS.Wall_plain_diag =
{
  file   = "wall/gtd_wall_tech_exterior_1.wad"
  map    = "MAP05"

  prob   = 50
  theme  = "tech"
  env    = "outdoor"

  where  = "diagonal"
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = { 32,40 }
}
