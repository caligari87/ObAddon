--
-- vent piece : locked terminators
--
----------------------------------------------------------------

PREFABS.Hallway_vent_barred =
{
  file   = "hall/vent_k.wad"
  map    = "MAP03"
  theme  = "!tech"

  kind   = "terminator"
  group  = "vent"
  key    = "barred"

  prob   = 50

  where  = "seeds"
  shape  = "I"

  deep   = 16

  tag_1  = "?door_tag"
  door_action = "S1_LowerFloor"
}

