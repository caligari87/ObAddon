PREFABS.Joiner_gtd_universal_beams =
{
  file   = "joiner/gtd_universal_joiners.wad"
  map    = "MAP01"

  prob   = 750

  where  = "seeds"
  shape  = "I"

  seed_w = 3
  seed_h = 1

  deep = 16
  over = 16

  x_fit = { 176,208 }
  y_fit = { 76,84 }

  can_flip = true
}

PREFABS.Joiner_gtd_universal_staircase =
{
  file   = "joiner/gtd_universal_joiners.wad"
  map    = "MAP02"

  prob   = 750

  style  = "steepness"

  where  = "seeds"
  shape  = "I"

  seed_w = 1
  seed_h = 1

  deep = 16
  over = 16

  x_fit = { 56,72 }
  y_fit = "stretch"

  delta_h  = 64
  nearby_h = 128

  can_flip = true
}

PREFABS.Joiner_gtd_universal_funnel =
{
  file   = "joiner/gtd_universal_joiners.wad"
  map    = "MAP03"

  prob   = 750

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 1

  deep = 16
  over = 16

  x_fit = { 120,137 }
  y_fit = { 24,28 , 132,140 }

  can_flip = true
}
