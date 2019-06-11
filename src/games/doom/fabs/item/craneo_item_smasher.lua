PREFABS.Item_craneo_smasher_tech =
{
  file  = "item/craneo_item_smasher.wad"
  where = "point"

  theme = "!hell"

  map = "MAP01"
  env = "building"

  size = 72

  prob = 8
}

PREFABS.Item_craneo_smasher_alt_tech =
{
  template = "Item_craneo_smasher_tech"

  map = "MAP02"
}

PREFABS.Item_craneo_smasher_gothic =
{
  template = "Item_craneo_smasher_tech"

  theme = "hell"

  flat_FLAT23 = "CEIL5_2"
  tex_SHAWN2 = "BIGDOOR5"
  tex_SUPPORT2 = "GSTONE2"
}

PREFABS.Item_craneo_smasher_alt_gothic =
{
  template = "Item_craneo_smasher_tech"

  map = "MAP02"

  theme = "hell"

  flat_FLAT23 = "CEIL5_2"
  tex_SHAWN2 = "BIGDOOR5"
  tex_SUPPORT2 = "GSTONE2"
}
