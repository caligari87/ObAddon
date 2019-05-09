--
-- 2-seed-wide hallway : straight piece
--

PREFABS.Hallway_deuce_i1 =
{
  file   = "hall/deuce_i.wad"
  map    = "MAP01"
  theme  = "!tech"

  group  = "deuce"
  prob   = 50

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 2
}

PREFABS.Hallway_deuce_i1_tech =
{
  template  = "Hallway_deuce_i1"
  map    = "MAP01"
  theme  = "tech"

  tex_METAL = "SHAWN2"
  flat_CEIL5_2 = "FLAT23"
}

PREFABS.Hallway_deuce_i1_rise =
{
  template = "Hallway_deuce_i1"
  map = "MAP02"

  prob = 15

  style = "steepness"

  delta_h = 32

  can_flip = true
}

PREFABS.Hallway_deuce_i_rise_tech =
{
  template = "Hallway_deuce_i1"
  map = "MAP02"
  theme = "tech"

  prob = 15

  style = "steepness"

  delta_h = 32

  tex_METAL = "SHAWN2"
  flat_CEIL5_2 = "FLAT23"

  can_flip = true
}
