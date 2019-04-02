PREFABS.Hallway_metro_term =
{
  file   = "hall/metro_j.wad"
  map    = "MAP01"
  kind   = "terminator"
  theme  = "!hell"

  group  = "metro"
  prob   = 50

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 1

  deep   = 16
}

PREFABS.Hallway_metro_term_secret =
{
  template = "Hallway_metro_term"

  map  = "MAP02"
  theme = "!hell"
  key  = "secret"
}