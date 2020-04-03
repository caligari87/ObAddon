--
-- 2-seed-wide hallway : terminators
--

PREFABS.Hallway_conveyor_term1 =
{
  file   = "hall/dem_conveyor_j.wad"
  map    = "MAP01"
  kind   = "terminator"
  engine = "zdoom"

  theme  = "tech"

  group  = "conveyor"
  prob   = 50

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 1

  uses_epic_textures = true

  deep   = 16
}

PREFABS.Hallway_conveyor_term2 =
{
  template = "Hallway_conveyor_term1"

  map  = "MAP02"

}


---secret

PREFABS.Hallway_conveyor_secret =
{
  template = "Hallway_conveyor_term1"

  map  = "MAP05"
  key  = "secret"
}