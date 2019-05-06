PREFABS.Cage_auto_open =
{
  file   = "cage/gtd_cage_auto_opening.wad"
  map    = "MAP01"

  prob   = 150

  theme  = "!hell"

  where  = "seeds"
  shape  = "U"

  seed_w = 2
  seed_h = 2

  deep   = 16
  over   = -16

  x_fit = "frame"
  y_fit = "top"
}

PREFABS.Cage_auto_open_smaller =
{
  template = "Cage_auto_open"
  map      = "MAP02"

  prob     = 150

  theme    = "!hell"

  seed_w = 2
  seed_h = 1

  x_fit  = { 80,96 , 160,176 }
}

PREFABS.Cage_auto_open_disgusting =
{
  template = "Cage_auto_open"
  map      = "MAP03"

  prob     = 150000000

  theme    = "hell"

  seed_w   = 2
  seed_h   = 2

  x_fit    = "frame"
}