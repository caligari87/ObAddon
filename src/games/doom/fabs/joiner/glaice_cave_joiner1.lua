PREFABS.Joiner_glaice_cave_to_cave_joiner =
{
  file   = "joiner/glaice_cave_joiner1.wad"
  map    = "MAP01"

  prob   = 750

  env      = "cave"
  neighbor = "cave"

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 2

  deep = 16
  over = 16

  delta_h = 64
  nearby_h = 128

  x_fit = "frame"
  y_fit = "frame"

  can_flip = true
}

PREFABS.Joiner_glaice_cave_to_cave_joiner_2x1 =
{
  template = "Joiner_glaice_cave_to_cave_joiner"

  map      = "MAP02"

  seed_h   = 1

  delta_h  = 32
}