--
-- Fancy walls
--

PREFABS.Wall_fake_window_thin =
{
  file   = "wall/gtd_wall_fake_windows.wad"
  map    = "MAP01"

  prob   = 10
  theme  = "tech"
  env    = "building"

  where  = "edge"

  height = 128
  long   = 128
  deep   = 24

  bound_z1 = 0
  bound_z2 = 128

  x_fit  = { 64-4,64+4 }
  z_fit  = "bottom"
}

PREFABS.Wall_fake_window_thin_diag =
{
  file   = "wall/gtd_wall_fake_windows.wad"
  map    = "MAP02"

  prob   = 50
  theme  = "tech"
  env    = "building"

  where  = "diagonal"
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "bottom"
}
