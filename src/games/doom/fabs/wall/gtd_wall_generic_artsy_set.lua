PREFABS.Wall_generic_artsy_bedazzled =
{
  file = "wall/gtd_wall_generic_artsy_set.wad"
  map = "MAP01"

  prob = 50
  env = "building"

  group = "gtd_generic_artsy_bedazzled"

  where = "edge"
  deep = 16
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "top"
}

PREFABS.Wall_generic_alternating_colors =
{
  template = "Wall_generic_artsy_bedazzled"
  map = "MAP02"

  group = "gtd_generic_alt_colors"

  z_fit = {40,88}
}

PREFABS.Wall_generic_mid_band =
{
  template = "Wall_generic_artsy_bedazzled"
  map = "MAP03"

  group = "gtd_generic_mid_band"

  z_fit = "top"
}

PREFABS.Wall_generic_double_banded_ceil =
{
  template = "Wall_generic_artsy_bedazzled"
  map = "MAP04"

  group = "gtd_generic_double_banded_ceil"

  z_fit = {60,68}
}

-- diagonals

PREFABS.Wall_generic_mid_band_diag =
{
  template = "Wall_generic_artsy_bedazzled"
  map = "MAP13"

  group = "gtd_generic_mid_band"

  where = "diagonal"

  z_fit = "top"
}

PREFABS.Wall_generic_double_banded_ceil_diag =
{
  template = "Wall_generic_artsy_bedazzled"
  map = "MAP14"

  group = "gtd_generic_double_banded_ceil"

  z_fit = {60,68}
}
