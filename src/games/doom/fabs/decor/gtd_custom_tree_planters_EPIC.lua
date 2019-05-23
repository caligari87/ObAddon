PREFABS.Decor_square_planter_grass =
{
  file   = "decor/gtd_custom_tree_planters_EPIC.wad"
  map    = "MAP01"

  uses_epic_textures = true

  climate_theme = "temperate"

  prob   = 10000
  theme  = "!hell"
  env    = "outdoor"

  where  = "point"
  size   = 48

  bound_z1 = 0
}

PREFABS.Decor_square_planter_sand =
{
  template = "Decor_square_planter_grass"
  map      = "MAP02"

  climate_theme = "desert"
}

PREFABS.Decor_square_planter_snow =
{
  template = "Decor_square_planter_grass"
  map      = "MAP03"

  climate_theme = "snow"
}

PREFABS.Decor_round_planter_grass =
{
  template = "Decor_square_planter_grass"
  map      = "MAP04"
}

PREFABS.Decor_round_planter_grass =
{
  template = "Decor_square_planter_grass"
  map      = "MAP05"

  climate_theme = "desert"
}

PREFABS.Decor_round_planter_grass =
{
  template = "Decor_square_planter_grass"
  map      = "MAP06"

  climate_theme = "snow"
}
