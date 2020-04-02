--
-- 2-seed-wide hallway : T peice
--

PREFABS.Hallway_conveyor_t1 =
{
  file   = "hall/dem_conveyor_t.wad"
  map    = "MAP01"
  engine = "zdoom"

  theme  = "tech"

  group  = "conveyor"
  prob   = 50

  where  = "seeds"
  shape  = "T"

  seed_w = 2
  seed_h = 2

  uses_epic_textures = true

 thing_2035 =
  {
    barrel = 60
    nothing = 40
  }

}

PREFABS.Hallway_conveyor_t2 =
{
  template  = "Hallway_conveyor_t1"
  map    = "MAP02"
  style  = "cages"

}

PREFABS.Hallway_conveyor_t3 =
{
  template  = "Hallway_conveyor_t1"
  map    = "MAP03"

}
