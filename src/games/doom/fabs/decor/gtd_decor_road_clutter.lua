PREFABS.Decor_road_clutter_three_cones =
{
  file = "decor/gtd_decor_road_clutter.wad"
  map = "MAP01"

  prob = 3500
  theme = "!hell"

  can_be_on_roads = true

  where = "point"
  size = 64
  height = 94

  bound_z1 = 0
  bound_z2 = 94
}

PREFABS.Decor_road_clutter_one_cone =
{
  template = "Decor_road_clutter_three_cones"
  map = "MAP02"

  size = 32
}
