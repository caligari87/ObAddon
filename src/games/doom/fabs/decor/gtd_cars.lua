PREFABS.Decor_sedan =
{
  file   = "decor/gtd_cars.wad"
  map    = "MAP01"

  prob   = 10000
  theme  = "urban"

  env = "!building"

  where  = "point"
  height = 128
  size   = 128

  bound_z1 = 0
  bound_z2 = 128

  sink_mode = "never"
}

PREFABS.Decor_sedan_blue =
{
  template = "Decor_sedan"

  flat_FLAT5_3 = "CEIL4_2"

  tex_REDWALL = "COMPBLUE"
}

PREFABS.Decor_sedan_brown =
{
  template = "Decor_sedan"

  flat_FLAT5_3 = "CEIL5_2"

  tex_REDWALL = "BROWN144"
}

PREFABS.Decor_minitruck =
{
  file   = "decor/gtd_cars.wad"
  map    = "MAP02"

  prob   = 10000
  theme  = "urban"

  env = "!building"

  where  = "point"
  height = 128
  size   = 128

  bound_z1 = 0
  bound_z2 = 128

  sink_mode = "never"
}
