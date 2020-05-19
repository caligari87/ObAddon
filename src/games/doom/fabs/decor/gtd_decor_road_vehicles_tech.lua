PREFABS.Decor_road_vehicle_tractor_thing =
{
  file = "decor/gtd_decor_road_vehicles_tech.wad"
  map = "MAP01"

  prob = 5000
  theme = "tech"
  env = "outdoor"

  uses_epic_textures = true

  can_be_on_roads = true

  where = "point"
  size = 160
  height = 88

  bound_z1 = 0
  bound_z2 = 160

}

PREFABS.Decor_road_vehicle_dump_truck =
{
  template = "Decor_road_vehicle_tractor_thing"
  map = "MAP02"

  height = 96
}
