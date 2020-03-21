PREFABS.Wall_tech_outdoor_hex_inset = --#
{
  file   = "wall/gtd_wall_tech_exterior_wall_groups_2.wad"
  map    = "MAP01"

  prob   = 15

  group = "tech_o_hex_inset"
  engine = "zdoom"

  env   = "!building"
  theme = "tech"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "top"
}

PREFABS.Wall_tech_outdoor_grated_greenwall = --#
{
  template = "Wall_tech_outdoor_hex_inset"
  map = "MAP02"

  group = "tech_o_grated_greenwall"

  tex_PIPEWAL1 =
  {
    PIPEWAL1 = 1
    PIPEWAL2 = 5
  }
}
