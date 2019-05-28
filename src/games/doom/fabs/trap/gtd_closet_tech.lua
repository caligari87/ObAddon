PREFABS.Trap_closet_tech =
{
  file = "trap/gtd_closet_tech.wad"
  map = "MAP01"

  prob   = 25

  theme = "urban"
  env = "!cave"

  where  = "seeds"
  shape  = "U"

  seed_w = 2
  seed_h = 1

  deep = 16
  over = 16

  x_fit = "frame"
  y_fit = "top"

  bound_z1 = 0
  bound_z2 = 128

  tag_1 = "?trap_tag"
}

PREFABS.Trap_closet_tech_2 =
{
  template = "Trap_closet_tech"

  map = "MAP02"
}
