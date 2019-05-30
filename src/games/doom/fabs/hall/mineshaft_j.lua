PREFABS.Hallway_mineshaft_plain =
{
  file   = "hall/mineshaft_j.wad"
  map    = "MAP01"
  theme  = "!hell"

  kind   = "terminator"
  group  = "mineshaft"

  prob   = 50

  where  = "seeds"
  shape  = "I"

  deep   = 16
}

PREFABS.Hallway_mineshaft_secret =
{
  template = "Hallway_mineshaft_plain"

  map    = "MAP02"
  key    = "secret"
}
