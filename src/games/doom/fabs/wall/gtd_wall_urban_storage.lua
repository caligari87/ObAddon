PREFABS.Wall_urban_storage1 =
{
  file   = "wall/gtd_wall_urban_storage.wad"
  map    = "MAP01"

  prob   = 50
  theme  = "!hell"
  env = "building"

  group = "gtd_wall_urban_storage"

  where  = "edge"
  deep   = 16
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "top"
}

PREFABS.Wall_urban_storage2 =
{
  template = "Wall_urban_storage1"

  map = "MAP02"
}

PREFABS.Wall_urban_storage3 =
{
  template = "Wall_urban_storage1"

  map = "MAP03"
}

PREFABS.Decor_urban_storage =
{
  file = "wall/gtd_wall_urban_storage"
  map = "MAP04"

  prob = 5000
  theme = "!hell"
  env = "building"

  where = "point"
  size = 64

  height = 128

  bound_z1 = 0
  bound_z2 = 128

  tex_CRATE3 = { CRATE3=50, CRATE2=50, CRATE1=50, CRATELIT=50 }

  z_fit = { 64-4,64+4 }
}

PREFABS.Wall_urban_storage_diag =
{
  file   = "wall/gtd_wall_urban_storage.wad"
  map    = "MAP05"

  prob   = 50
  theme = "!hell"
  group = "gtd_wall_urban_storage"

  where  = "diagonal"

  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "top"

  tex_CRATELIT = { CRATELIT=50, CRATINY=20, CRATWIDE=50 }
}
