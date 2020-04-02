--
-- 2-seed-wide hallway : + peice
--

PREFABS.Hallway_conveyor_p1 =
{
  file   = "hall/dem_conveyor_p.wad"
  map    = "MAP01"
  engine = "zdoom"

  theme  = "tech"

  group  = "conveyor"
  prob   = 50

  where  = "seeds"
  shape  = "P"

  seed_w = 2
  seed_h = 2

  uses_epic_textures = true

 thing_2035 =
  {
    barrel = 60
    nothing = 40
  }

}

