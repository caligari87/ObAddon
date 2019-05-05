-- GREEN version

PREFABS.Wall_epic_collite_inset_straight_green =
{
  file   = "wall/gtd_EPIC_wall_light_column_set.wad"
  map    = "MAP01"

  prob   = 50

  group = "gtd_collite_set_green"

  uses_epic_textures = true

  where  = "edge"
  height = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = { 64-8,64+8 }
}

PREFABS.Wall_epic_collite_inset_diagonal_green =
{
  file   = "wall/gtd_EPIC_wall_light_column_set.wad"
  map    = "MAP02"

  prob   = 50

  group = "gtd_collite_set_green"

  uses_epic_textures = true

  where  = "diagonal"
  height = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = { 64-8,64+8 }
}

-- ORANGE version

PREFABS.Wall_epic_collite_inset_straight_orange =
{
  template = "Wall_epic_collite_inset_straight_green"

  group = "gtd_collite_set_orange"

  tex_COLLITE1= "COLLITE2"
}

PREFABS.Wall_epic_collite_inset_diagonal_orange =
{
  template = "Wall_epic_collite_inset_diagonal_green"

  group = "gtd_collite_set_orange"

  tex_COLLITE1= "COLLITE2"
}

-- BLUE version

PREFABS.Wall_epic_collite_inset_straight_blue =
{
  template = "Wall_epic_collite_inset_straight_green"

  group = "gtd_collite_set_blue"

  tex_COLLITE1= "COLLITE3"
}

PREFABS.Wall_epic_collite_inset_diagonal_blue =
{
  template = "Wall_epic_collite_inset_diagonal_green"

  group = "gtd_collite_set_blue"

  tex_COLLITE1= "COLLITE3"
}

-- RED version

PREFABS.Wall_epic_collite_inset_straight_red =
{
  template = "Wall_epic_collite_inset_straight_green"

  group = "gtd_collite_set_red"

  tex_COLLITE1= "RDWAL01"
}

PREFABS.Wall_epic_collite_inset_diagonal_red =
{
  template = "Wall_epic_collite_inset_diagonal_green"

  group = "gtd_collite_set_red"

  tex_COLLITE1= "RDWAL01"
}