--
-- 2-seed-wide hallway : terminators
--

PREFABS.Hallway_conveyorh_term1 =
{
  file   = "hall/dem_conveyorh_j.wad"
  map    = "MAP01"
  engine = "gzdoom"

  kind   = "terminator"
  theme  = "hell"

  group  = "conveyorh"
  prob   = 50

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 1

  deep   = 16

  uses_epic_textures = true

}

PREFABS.Hallway_conveyorh_term2 =
{
  template = "Hallway_conveyorh_term1"

  map  = "MAP02"

}

PREFABS.Hallway_conveyorh_term3 =
{
  template = "Hallway_conveyorh_term1"

  map  = "MAP03"

}

PREFABS.Hallway_conveyorh_term4 =
{
  template = "Hallway_conveyorh_term1"

  map  = "MAP04"
  style = "doors"

}

PREFABS.Hallway_conveyorh_term5 =
{
  template = "Hallway_conveyorh_term1"

  map  = "MAP05"
  style = "doors"

}

PREFABS.Hallway_conveyorh_term6 =
{
  template = "Hallway_conveyorh_term1"

  map  = "MAP06"
  style = "doors"

}


---secret

PREFABS.Hallway_conveyorh_secret =
{
  template = "Hallway_conveyorh_term1"

  map  = "MAP07"
  key  = "secret"
}