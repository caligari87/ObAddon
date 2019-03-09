PREFABS.Wall_fake_door =
{
  file   = "wall/gtd_wall_urban.wad"
  map    = "MAP01"

  prob   = 35
  theme = "urban"

  on_liquids = "never"

  on_scenics = "never"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "top"
}

PREFABS.Wall_fake_door2 =
{
  template = "Wall_fake_door"

  tex_DOOR3 = "DOOR1"
}

PREFABS.Wall_modern_piping =
{
  file   = "wall/gtd_wall_urban.wad"
  map    = "MAP02"

  prob   = 50
  env   = "building"
  theme = "urban"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "top"
}

PREFABS.Wall_modern_shutter =
{
  file   = "wall/gtd_wall_urban.wad"
  map    = "MAP03"

  prob   = 15
  theme = "urban"

  on_liquids = "never"

  on_scenics = "never"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "top"
}

PREFABS.Wall_modern_shutter2 =
{
  template = "Wall_modern_shutter"

  tex_STEP4 = "STEP1"
}

PREFABS.Wall_modern_shutter3 =
{
  template = "Wall_modern_shutter"

  tex_STEP4 = "STEP2"
}

PREFABS.Wall_modern_shutter4 =
{
  template = "Wall_modern_shutter"

  tex_STEP4 = "STEP3"
}

PREFABS.Wall_modern_shutter5 =
{
  template = "Wall_modern_shutter"

  tex_STEP4 = "STEP5"
}


PREFABS.Wall_fake_warehouse_window =
{
  file   = "wall/gtd_wall_urban.wad"
  map    = "MAP04"

  prob   = 50
  theme = "urban"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "bottom"
}

PREFABS.Wall_double_dark_windows =
{
  file   = "wall/gtd_wall_urban.wad"
  map    = "MAP05"

  prob   = 50
  theme = "urban"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "bottom"
}
