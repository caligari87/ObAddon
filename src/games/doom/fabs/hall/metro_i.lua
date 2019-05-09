PREFABS.Hallway_metro_i =
{
  file   = "hall/metro_i.wad"
  map    = "MAP01"

  group  = "metro"
  prob   = 50

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 2

  sector_1  = { [0]=90, [1]=15 }
}

PREFABS.Hallway_metro_i_rise =
{
  template = "Hallway_metro_i"
  map = "MAP02"

  prob = 15

  style = "steepness"

  delta_h = 64

  can_flip = true
}
