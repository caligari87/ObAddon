PREFABS.Door_plain_flat =
{
  file   = "door/door1.wad"
  map    = "MAP01"

  prob   = 750

  where  = "edge"
  seed_w = 1

  deep   = 32
  over   = 32

  x_fit  = "frame"

  bound_z1 = 0
  bound_z2 = 128

  flat_TLITE6_6 = { TLITE6_6=50, TLITE6_5=50 }

  tex_DOOR3 =
  {
    DOOR1 = 50
    DOOR3 = 50
  }
}

PREFABS.Door_plain_flat_EPIC =
{
  file   = "door/door1.wad"
  map    = "MAP01"

  uses_epic_textures = true
  replaces = "Door_plain_flat"

  prob   = 750

  where  = "edge"
  seed_w = 1

  deep   = 32
  over   = 32

  x_fit  = "frame"

  bound_z1 = 0
  bound_z2 = 128

  flat_TLITE6_6 = { TLITE6_6=50, TLITE6_5=50 }

  tex_DOOR3 =
  {
    DOOR1 = 50
    DOOR3 = 50
    DOORHI = 50
	ICKDOOR1 = 50
    }
}
