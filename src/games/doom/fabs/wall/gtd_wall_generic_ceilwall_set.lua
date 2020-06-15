PREFABS.Wall_generic_ceilwall =
{
  file   = "wall/gtd_wall_generic_ceilwall_set.wad"
  map    = "MAP01"

  prob   = 50
  theme  = "!hell"

  group  = "gtd_generic_ceilwall"

  where  = "edge"
  deep   = 16
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = {88, 92}
}

PREFABS.Wall_generic_ceilwall_diag =
{
  template = "Wall_generic_ceilwall"
  map    = "MAP02"

  where  = "diagonal"
}

PREFABS.Wall_generic_ceilwall_hell =
{
  template = "Wall_generic_ceilwall"
  map = "MAP01"

  theme = "hell"

  tex_LITE3 = "ROCKRED1"
  tex_BRNSMALC = "MIDBARS3"
}

PREFABS.Wall_generic_ceilwall_diag_hell =
{
  template = "Wall_generic_ceilwall"
  map = "MAP02"

  where = "diagonal"

  theme = "hell"

  tex_LITE3 = "ROCKRED1"
  tex_BRNSMALC = "MIDBARS3"
}
