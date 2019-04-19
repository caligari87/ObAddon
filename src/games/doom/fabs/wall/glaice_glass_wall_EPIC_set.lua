PREFABS.Wall_glaice_glass_huge =
{
  file   = "wall/glaice_glass_wall_EPIC_set.wad"
  map    = "MAP01"

  prob   = 50
  env = "building"

  group = "glaice_glass_huge"

  where  = "edge"
  deep   = 16
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "frame"

  tex_GLASS1 = "GLASS9"
}

PREFABS.Wall_glaice_glass_huge_diag =
{
  file   = "wall/glaice_glass_wall_EPIC_set.wad"
  map    = "MAP02"

  prob   = 50
  group = "glaice_glass_huge"

  where  = "diagonal"

  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "frame"

  tex_GLASS1 = "GLASS9"
}

PREFABS.Wall_glaice_glass_huge_red =
{
  template = "Wall_glaice_glass_huge"

  prob     = 15

  group    = "gtd_tall_glass_epic_red"
}

PREFABS.Wall_glaice_glass_huge_red_diag =
{
  template = "Wall_glaice_glass_huge_diag"

  prob     = 15

  group    = "gtd_tall_glass_epic_red"
}

PREFABS.Wall_glaice_glass_huge_orange =
{
  template = "Wall_glaice_glass_huge"

  prob     = 15

  group    = "gtd_tall_glass_epic_orange"

  tex_GLASS1 = "GLASS6"
}

PREFABS.Wall_glaice_glass_huge_orange_diag =
{
  template = "Wall_glaice_glass_huge_diag"

  prob     = 15

  group    = "gtd_tall_glass_epic_orange"

  tex_GLASS1 = "GLASS6"
}

PREFABS.Wall_glaice_glass_huge_blue =
{
  template = "Wall_glaice_glass_huge"

  prob     = 15

  group    = "gtd_tall_glass_epic_blue"

  tex_GLASS1 = "GLASS2"
}

PREFABS.Wall_glaice_glass_huge_blue_diag =
{
  template = "Wall_glaice_glass_huge_diag"

  prob     = 15

  group    = "gtd_tall_glass_epic_blue"

  tex_GLASS1 = "GLASS2"
}
