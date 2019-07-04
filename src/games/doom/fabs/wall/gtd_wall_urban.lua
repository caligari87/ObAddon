PREFABS.Wall_fake_door =
{
  file   = "wall/gtd_wall_urban.wad"
  map    = "MAP01"

  prob   = 30
  theme = "urban"

  on_liquids = "never"

  on_scenics = "never"

  need_solid_back = true

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

  prob   = 60
  theme = "urban"

  on_liquids = "never"

  on_scenics = "never"

  need_solid_back = true

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "top"

  tex_STEP4 =
  {
    STEP4 = 50
    STEP1 = 50
    STEP2 = 50
    STEP3 = 50
    STEP5 = 50
  }
}

PREFABS.Wall_modern_shutter_EPIC =
{
  file   = "wall/gtd_wall_urban.wad"
  map    = "MAP03"

  prob   = 60
  theme = "urban"

  uses_epic_textures = true
  replaces = "Wall_modern_shutter"

  on_liquids = "never"

  on_scenics = "never"

  need_solid_back = true

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "top"

  tex_STEP4 =
  {
    STEP4 = 50
    STEP1 = 50
    STEP2 = 50
    STEP3 = 50
    STEP5 = 50
    URBAN6 = 150
    URBAN8 = 150
  }
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

  tex_LITE3 =
  {
    LITE3 = 50
    LITE5 = 12
    LITEBLU = 12
  }
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

  tex_MODWALL4 =
  {
    MODWALL4 = 50
    MODWALL3 = 50
    BLAKWAL1 = 50
    BLAKWAL2 = 50
  }
}
