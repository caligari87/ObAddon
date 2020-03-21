PREFABS.Wall_hell_exterior_wg2_template =
{
  file   = "wall/gtd_wall_hell_exterior_wall_groups.wad"

  prob   = 15
  theme = "hell"
  env = "outdoor"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "top"
}

--

PREFABS.Wall_hell_egyptish_triwindows = --#
{
  template = "Wall_hell_exterior_wg2_template"
  map = "MAP01"

  uses_epic_textures = true

  group = "hell_o_egyptish_triwindows"
}
