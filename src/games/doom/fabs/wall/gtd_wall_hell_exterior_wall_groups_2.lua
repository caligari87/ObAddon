PREFABS.Wall_hell_exterior_wg2_template =
{
  file   = "wall/gtd_wall_hell_exterior_wall_groups_2.wad"

  prob   = 0
  theme = "hell"
  env = "outdoor"

  where  = "edge"

  height = 128
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

  prob = 15

  uses_epic_textures = true

  group = "hell_o_egyptish_triwindows"
}

PREFABS.Wall_hell_destroyed_city_facade = --#
{
  template = "Wall_hell_exterior_wg2_template"
  map = "MAP02"

  prob = 15

  group = "hell_o_destroyed_city_facade"

  tex_WOOD5 =
  {
    WOOD5 = 1
    BRWINDOW = 5
  }
}

PREFABS.Wall_hell_destroyed_city_facade_2 =
{
  template = "Wall_hell_exterior_wg2_template"
  map = "MAP03"

  prob = 15

  group = "hell_o_destroyed_city_facade"

  tex_WOOD5 =
  {
    WOOD5 = 1
    BRWINDOW = 5
  }
}

PREFABS.Wall_hell_destroyed_city_facade_3 =
{
  template = "Wall_hell_exterior_wg2_template"
  map = "MAP04"

  prob = 15

  group = "hell_o_destroyed_city_facade"

  tex_WOOD5 =
  {
    WOOD5 = 1
    BRWINDOW = 5
  }
}

PREFABS.Wall_hell_alt_cathedral_windows = --#
{
  template = "Wall_hell_exterior_wg2_template"
  map = "MAP05"

  prob = 15

  group = "tech_o_alt_cathedral_windows"

  z_fit = { 48,96 }
}
