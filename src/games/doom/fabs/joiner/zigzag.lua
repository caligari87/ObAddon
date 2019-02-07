--
-- Joiner with zigzag stairs
--

PREFABS.Joiner_zigzag1 =
{
  file   = "joiner/zigzag.wad"
  map    = "MAP01"

  prob   = 2500
  style  = "steepness"

  env      = "building"
  neighbor = "building"

  where  = "seeds"
  shape  = "I"

  seed_w = 3
  seed_h = 1

  deep   = 16
  over   = 16

  x_fit  = "frame"

  delta_h  = 128
  nearby_h = 192
  can_flip = true
}

