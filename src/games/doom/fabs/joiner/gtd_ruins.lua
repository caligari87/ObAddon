PREFABS.Joiner_pillaged_shop =
{
  file   = "joiner/gtd_ruins.wad"
  map    = "MAP01"

  prob   = 500

  theme  = "urban"

  where  = "seeds"
  shape  = "I"

  seed_w = 3
  seed_h = 2

  deep = 16
  over = 16

  x_fit = "frame"
}

PREFABS.Joiner_bombed_building =
{
  file = "joiner/gtd_ruins.wad"
  map = "MAP02"

  prob = 500

  theme = "urban"

  env      = "!cave"
  neighbor = "!cave"

  where = "seeds"
  shape = "I"

  style = "steepness"

  seed_w = 3
  seed_h = 2

  deep = 16
  over = 16

  x_fit = "frame"
  y_fit  = "frame"

  delta_h = 104
  nearby_h = 128

  can_flip = true
}
