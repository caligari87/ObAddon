PREFABS.Decor_craneo_billiards_table =
{
  file  = "decor/craneo_decor_tabletop_games.wad"
  map   = "MAP01"

  prob  = 2500

  theme = "urban"
  env   = "building"

  where = "point"
  size  = 96

  bound_z1 = 0
}

PREFABS.Decor_craneo_arcade_machine =
{
  template = "Decor_craneo_billiards_table"
  map  = "MAP02"

  size = 64

  face_open = true
}