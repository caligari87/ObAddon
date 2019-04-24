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
  nearby_h = 192

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

PREFABS.Joiner_gtd_universal_wavy_staircase =
{
  file  = "joiner/gtd_universal_joiners.wad"
  map   = "MAP04"

  theme = "!hell"
  prob  = 750

  where = "seeds"
  shape = "I"

  style = "steepness"

  seed_w = 2
  seed_h = 1

  deep = 16
  over = 16

  delta_h  = 48
  nearby_h = 176

  x_fit = { 24,104 , 152,232 }
  y_fit = "frame"

  can_flip = true
}

PREFABS.Joiner_gtd_universal_wavy_staircase_hell =
{
  template = "Joiner_gtd_universal_wavy_staircase"

  theme = "hell"

  thing_2028 =
  {
    blue_torch=50
    green_torch=50
    red_torch=50
    blue_torch_sm=25
    green_torch_sm=25
    red_torch_sm=25
  }
}