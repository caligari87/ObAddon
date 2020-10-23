PREFABS.Hallway_access_door_locked_red =
{
  file   = "hall/access_k.wad"
  map    = "MAP01"

  kind   = "terminator"
  group  = "access"
  key    = "k_red"

  prob   = 50

  where  = "seeds"
  shape  = "I"

  deep   = 16
}

PREFABS.Hallway_access_door_locked_blue =
{
  template = "Hallway_access_door_locked_red"

  key = "k_blue"

  tex_DOORRED = "DOORBLU"
  line_33 = 32
}

PREFABS.Hallway_access_door_locked_yellow =
{
  template = "Hallway_access_door_locked_red"

  key = "k_yellow"

  tex_DOORRED = "DOORYEL"
  line_33 = 34
}

--

PREFABS.Hallway_access_door_locked_switched =
{
  file   = "hall/access_k.wad"
  map    = "MAP02"

  kind   = "terminator"
  group  = "access"
  key    = "barred"

  prob   = 50

  where  = "seeds"
  shape  = "I"

  deep   = 16

  tag_1 = "?door_tag"
  door_action = "S1_LowerFloor"
}
