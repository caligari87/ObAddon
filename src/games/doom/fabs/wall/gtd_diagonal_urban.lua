PREFABS.Wall_urban_diagonal_window_bright =
{
  file = "wall/gtd_diagonal_urban.wad"
  map = "MAP01"

  prob = 50
  theme = "urban"
  env = "!cave"

  where = "diagonal"
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "top"
}

PREFABS.Wall_urban_diagonal_window_dark =
{
  template = "Wall_urban_diagonal_window_bright"
  map = "MAP02"

  z_fit = { 60,68 }
}

PREFABS.Wall_urban_diagonal_window_dark_top_fit =
{
  template = "Wall_urban_diagonal_window_bright"
  map = "MAP02"

  z_fit = "bottom"
}

PREFABS.Wall_urban_tall_lite5 =
{
  template = "Wall_urban_diagonal_window_bright"
  map = "MAP03"

  theme = "!hell"

  z_fit = { 60,68 }
}
