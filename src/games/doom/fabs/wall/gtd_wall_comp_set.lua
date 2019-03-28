PREFABS.Wall_gtd_computer_wall_1 =
{
  file   = "wall/gtd_wall_comp_set.wad"
  map    = "MAP01"

  prob   = 50
  group  = "gtd_computers"

  where  = "edge"

  deep   = 16

  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "top"
}

PREFABS.Wall_gtd_computer_wall_2 =
{
  template = "Wall_gtd_computer_wall_1"
  map      = "MAP02"
}

PREFABS.Wall_gtd_computer_wall_3 =
{
  template = "Wall_gtd_computer_wall_1"
  map      = "MAP03"
}

PREFABS.Wall_gtd_computer_diag_1 =
{
  file   = "wall/gtd_wall_comp_set.wad"
  map    = "MAP04"

  prob   = 50
  group  = "gtd_computers"

  where  = "diagonal"

  deep   = 16

  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "top"
}

PREFABS.Wall_gtd_computer_diag_2 =
{
  template = "Wall_gtd_computer_diag_1"
  map      = "MAP05"
}