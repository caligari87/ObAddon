--
-- Tech outdoor walls
--

PREFABS.Wall_tech_outdoor_accent_flat_plain =
{
  file   = "wall/gtd_wall_tech_exterior_1.wad"
  map    = "MAP01"

  prob   = 50
  env   = "!building"
  theme = "tech"

  where  = "edge"
  height = 128

  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "bottom"
}

PREFABS.Wall_tech_outdoor_accent_flat_piped =
{
  template = "Wall_tech_outdoor_accent_flat_plain"
  map      = "MAP02"
}

PREFABS.Wall_tech_vertical_long_windows =
{
  template = "Wall_tech_outdoor_accent_flat_plain"
  map    = "MAP03"

  z_fit = { 64-8,64+8 }
}

PREFABS.Wall_tech_plain_diag = --MSSP-TODO: transfer this to tech diagonals *.wad
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
