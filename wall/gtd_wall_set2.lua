--
-- Fancy walls
--

PREFABS.Wall_machine_inset =
{
  file   = "wall/gtd_wall_set2.wad"
  map    = "MAP01"

  prob   = 15
  env   = "building"
  theme = "tech"
  
  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "top" 
}

PREFABS.Wall_liquid_tank =
{
  file   = "wall/gtd_wall_set2.wad"
  map    = "MAP02"

  prob   = 15
  env   = "building"
  theme = "tech"
  
  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "stretch" 
}

PREFABS.Wall_double_light =
{
  file   = "wall/gtd_wall_set2.wad"
  map    = "MAP03"

  prob   = 15
  env   = "building"
  theme = "tech"
  
  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "top" 
}

PREFABS.Wall_diag_sewer =
{
  file   = "wall/gtd_wall_set2.wad"
  map    = "MAP04"

  prob   = 50
  theme = "tech"
  env   = "building"
  
  where  = "diagonal"
  height = 128
  
  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "top"
}

PREFABS.Wall_diag_outcrop =
{
  file   = "wall/gtd_wall_set2.wad"
  map    = "MAP05"

  prob   = 50
  theme = "tech"
  env   = "building"
  
  where  = "diagonal"
  height = 128
  
  bound_z1 = 0
  bound_z2 = 128

  z_fit  = { 32,40 }
}

PREFABS.Wall_diag_outcrop_outdoor =
{
  template = "Wall_diag_outcrop"

  env = "outdoor"
}

PREFABS.Wall_diag_triple_braced =
{
  file   = "wall/gtd_wall_set2.wad"
  map    = "MAP06"

  prob   = 50
  theme = "tech"
  env   = "building"
  
  where  = "diagonal"
  height = 128
  
  bound_z1 = 0
  bound_z2 = 128

  z_fit  = { 32,40 }
}

PREFABS.Wall_diag_triple_braced_outdoor =
{
  template = "Wall_diag_triple_braced"

  env = "outdoor"
}