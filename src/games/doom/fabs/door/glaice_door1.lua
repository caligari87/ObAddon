PREFABS.Door_glaice_door1 =
{
  file   = "door/glaice_door1.wad"
  map    = "MAP01"

  uses_epic_textures = true

  prob   = 20

  theme  = "!hell"

  where  = "edge"
  key    = "barred"

  seed_w = 2

  deep   = 32
  over   = 32

  x_fit  = "frame"

  bound_z1 = 0
  bound_z2 = 128

  tag_1  = "?door_tag"
  door_action = "S1_OpenDoor"
}

PREFABS.Door_glaice_door_KEYRED =
{
  file   = "door/glaice_door1.wad"
  map    = "MAP02"

  uses_epic_textures = true

  prob   = 50

  theme  = "!hell"

  where  = "edge"
  key    = "k_red"

  seed_w = 2

  deep   = 32
  over   = 32

  x_fit  = "frame"

  bound_z1 = 0
  bound_z2 = 128
}

PREFABS.Door_glaice_door_KEYBLUE =
{
  template = "Door_glaice_door_KEYRED"
  map    = "MAP02"

  key    = "k_blue"

  line_33 = 32

  tex_DOORRED = "DOORBLU"
}

PREFABS.Door_glaice_door_KEYYELLOW =
{
  template = "Door_glaice_door_KEYRED"
  map    = "MAP02"

  key    = "k_yellow"

  line_33 = 34

  tex_DOORRED = "DOORYEL"
}
