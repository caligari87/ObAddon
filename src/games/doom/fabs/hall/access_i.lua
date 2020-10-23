PREFABS.Hallway_access_plain =
{
  file   = "hall/access_i.wad"
  map    = "MAP01"

  group  = "access"
  prob   = 50

  where  = "seeds"
  shape  = "I"
}

PREFABS.Hallway_access_vent =
{
  template = "Hallway_access_plain"
  map = "MAP02"

  prob = 15

  can_flip = true
}

PREFABS.Hallway_access_one_side =
{
  template = "Hallway_access_plain"
  map = "MAP03"

  prob = 15

  can_flip = true
}

PREFABS.Hallway_access_comp_side =
{
  template = "Hallway_access_plain"
  map = "MAP04"

  prob = 15

  can_flip = true
}

PREFABS.Hallway_access_crate =
{
  template = "Hallway_access_plain"
  map = "MAP05"

  prob = 15

  can_flip = true
}

PREFABS.Hallway_access_low_ceiling =
{
  template = "Hallway_access_plain"
  map = "MAP06"

  prob = 15

  can_flip = true
}

--

PREFABS.Hallway_access_ladder =
{
  file   = "hall/access_i_steepness.wad"
  map    = "MAP01"

  group  = "access"
  prob   = 25

  style = "steepness"

  where  = "seeds"
  shape  = "I"

  delta_h = 128

  can_flip = true
}