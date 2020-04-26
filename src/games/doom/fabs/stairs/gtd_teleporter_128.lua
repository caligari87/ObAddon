PREFABS.Lift_gtd_teleporter_128 =
{
  file = "stairs/gtd_teleporter_128.wad"
  map = "MAP01"

  prob = 15
  style = "steepness"

  where = "seeds"
  shape = "I"

  seed_h = 1
  seed_w = 1

  x_fit = "frame"
  y_fit = { 0,4 , 124,128 }

  bound_z1 = 0

  delta_h = 128
  plain_ceiling = true
}

--[[
PREFABS.Lift_gtd_teleporter_2h =
{
  template = "Lift_gtd_teleporter_128"
  map = "MAP02"

  seed_h = 2
}

PREFABS.Lift_gtd_teleporter_3h =
{
  template = "Lift_gtd_teleporter_128"
  map = "MAP03"

  seed_h = 3
}]]
