PREFABS.Pic_armaetus_double_fans =
{
  file = "picture/armaetus_pic_fans.wad"
  map = "MAP01"

  prob = 25
  env = "building"
  theme = "!hell"

  uses_epic_textures = true

  where = "seeds"
  height = 128

  seed_w = 2
  seed_h = 1

  bound_z1 = 0
  bound_z2 = 128

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit = "top"

  sound = "Indoor_Fan"
}

PREFABS.Pic_armaetus_double_fans_hell =
{
  template = "Pic_armaetus_double_fans"

  prob = 5
  theme = "hell"

  tex_DOORSTOP = "METAL"
}
