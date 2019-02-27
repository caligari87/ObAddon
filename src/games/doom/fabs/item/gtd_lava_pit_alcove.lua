--
--  Large alcove with lava pit crossing.
--

PREFABS.Item_lava_pit_alcove =
{
  file   = "item/gtd_lava_pit_alcove.wad"
  map    = "MAP01"

  prob   = 50
  theme  = "!hell"

  where  = "seeds"
  seed_w = 3
  seed_h = 2

  height = 192
  deep =  16
  over = -16

  x_fit = "frame"
  y_fit = "top"
}

-- Lava trap
PREFABS.Item_lava_pit_alcove_trap =
{
  file   = "item/gtd_lava_pit_alcove.wad"
  map    = "MAP03"

  prob   = 80
  theme  = "!hell"
  style  = "traps"

  where  = "seeds"
  seed_w = 3
  seed_h = 2

  height = 192
  deep =  16
  over = -16

  x_fit = "frame"
  y_fit = "top"
}
