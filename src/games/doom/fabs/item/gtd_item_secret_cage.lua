-- This is supposed to be a shoot-triggered, stretchable version of the original cage fab.

PREFABS.Item_gtd_secret_cage =
{
  file  = "item/gtd_item_secret_cage.wad"
  where = "seeds"

  engine = "zdoom"

  prob  = 100
  env   = "building"
  theme = "!hell"

  key   = "secret"

  seed_w = 2
  seed_h = 2
  height = 120

  deep =  16
  over = -16

  x_fit = { 68,76 , 180,188 }
}

PREFABS.Item_gtd_secret_cage_hell =
{
  template = "Item_gtd_secret_cage"

  theme = "hell"

  tex_LITE3 = "FIREWALL"
}
