PREFABS.Wall_urban_neon_sign =
{
  file   = "wall/gtd_wall_neonsigns.wad"
  map    = "MAP03"

  prob   = 8
  env    = "!building"
  theme  = "urban"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 144

  bound_z1 = 0
  bound_z2 = 128

  sector_1  = { [0]=50, [1]=20, [8]=7 }

  x_fit  = "frame"
  z_fit  = "bottom"
}

PREFABS.Wall_urban_neon_sign_id =
{
  template = "Wall_urban_neon_sign"
  map    = "MAP04"

  prob   = 15

  deep   = 80

  tex_O_RELIEF =
  {
    CEMENT2 = 50
    CEMENT4 = 50
  }
}

PREFABS.Wall_urban_neon_sign_huge =
{
  template = "Wall_urban_neon_sign"
  map    = "MAP05"

  prob   = 5

  deep   = 144
  height = 192

  bound_z2 = 192
}
