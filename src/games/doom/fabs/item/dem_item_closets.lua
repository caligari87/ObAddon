--
--  item closets
--

--a item in a maze of mirrors1 in hell
PREFABS.Item_mirrormaze_closet =
{
  file  = "item/dem_item_closets.wad"
  map   = "MAP01"

  engine = "zdoom"

  theme = "hell"
  prob  = 100

  where  = "seeds"
  seed_w = 3
  seed_h = 2

  deep = 16
  over = 16

  x_fit = "frame"
  y_fit  = "frame"

  can_flip = true
}

--a item in a maze of mirrors2 in hell
PREFABS.Item_mirrormaze2_closet =
{
  file  = "item/dem_item_closets.wad"
  map   = "MAP02"

  engine = "zdoom"

  theme = "hell"
  prob  = 100

  where  = "seeds"
  seed_w = 2
  seed_h = 3

  deep = 16
  over = 16

  x_fit = "frame"
  y_fit  = "frame"

  can_flip = true
}

--a item on a shrine in a rift in hell
PREFABS.Item_rift_closet =
{
  file  = "item/dem_item_closets.wad"
  map   = "MAP03"

  engine = "zdoom"

  theme = "hell"
  prob  = 100

  where  = "seeds"
  seed_w = 3
  seed_h = 2

  deep = 16
  over = 16

  x_fit = "frame"
  y_fit  = "frame"

  can_flip = true

  uses_epic_textures = true

  thing_63 =
  {
    hang_twitching = 50
    hang_torso = 50
    hang_leg   = 50
    hang_leg_gone = 50
  }

  thing_28 =
  {
	skull_pole = 50
	skull_kebab = 50
	skull_cairn = 50
	impaled_human = 50
	impaled_twitch = 50
	evil_eye = 50
	skull_rock = 50
	big_tree = 50
	burnt_tree = 50

  }

  thing_25 =
  {
	skull_pole = 50
	skull_kebab = 50
	skull_cairn = 50
	impaled_human = 50
	impaled_twitch = 50
	evil_eye = 50
	skull_rock = 50
	big_tree = 50
	burnt_tree = 50

  }

}
