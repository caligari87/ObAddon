--
-- 2-seed-wide hallway : locked terminators
--

---------------------------------------------------------------

PREFABS.Hallway_deuce_barred =
{
  file   = "hall/deuce_k.wad"
  map    = "MAP03"

  kind   = "terminator"
  group  = "deuce"
  key    = "barred"

  prob   = 50

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 1
  deep   = 16

  tag_1  = "?door_tag"
  door_action = "S1_LowerFloor"
}

