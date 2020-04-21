--
-- Fancy walls
--

PREFABS.Wall_machine_inset =
{
  file   = "wall/gtd_wall_tech_interior_2.wad"
  map    = "MAP01"

  prob   = 15
  env   = "building"
  theme = "!hell"

  where  = "edge"
  height = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "top"
}

PREFABS.Wall_liquid_tank =
{
  template = "Wall_machine_inset"
  map      = "MAP02"

  liquid   = true

  z_fit   = "stretch"
}

PREFABS.Wall_double_light =
{
  template = "Wall_machine_inset"
  map      = "MAP03"
}

PREFABS.Wall_diag_sewer =
{
  file   = "wall/gtd_wall_tech_interior_2.wad"
  map    = "MAP04"

  prob   = 50
  theme = "tech"
  env   = "building"

  liquid = true

  where  = "diagonal"
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "top"

  sound = "Water_Streaming"
}
