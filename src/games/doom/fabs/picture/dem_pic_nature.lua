PREFABS.Pic_dem_cavein1 =
{
  file   = "picture/dem_pic_nature.wad"
  map    = "MAP01"

  engine = "zdoom"

  prob   = 100
  theme = "!hell"
  env = "cave"
  rank = 2

  where  = "seeds"
  height = 128

  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "stretch"
  z_fit = { 56,64 }
}

PREFABS.Pic_dem_cavein2 =
{
  template  = "Pic_dem_cavein1"
  map    = "MAP02"
}

PREFABS.Pic_dem_cavein3 =
{
  template  = "Pic_dem_cavein1"
  map    = "MAP03"
}
