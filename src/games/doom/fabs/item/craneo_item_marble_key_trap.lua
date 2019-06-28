PREFABS.Item_craneo_marble_key_trap =
{
  file  = "item/craneo_item_marble_key_trap.wad"

  map   = "MAP01"

  uses_epic_textures = true

  rank  = 2
  prob  = 400
  theme = "!tech"
  env   = "outdoor"

  where = "seeds"
  height = 160

  seed_w = 3
  seed_h = 2

  item_kind = "key"

  x_fit = "frame"

  open_to_sky = true

  flat_CARPET5 =
  {
    CARPET5 = 50
    CARPET7 = 50
    CARPET8 = 50
  }

  tex_MARBFACF =
  {
    MARBFAC2 = 50
    MARBFAC3 = 50
    MARBFAC6 = 50
    MARBFAC7 = 50
    MARBFACF = 50
  }
}

PREFABS.Item_craneo_marble_key_trap_interior =
{
  template = "Item_craneo_marble_key_trap"
  map = "MAP02"

  rank = 2
  prob = 250

  height = 128

  deep = 16
  over = 16

  env = "building"

  y_fit = "top"

  open_to_sky = false
}
