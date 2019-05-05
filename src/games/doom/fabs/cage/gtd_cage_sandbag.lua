PREFABS.Cage_sandbag_fort =
{
  file   = "cage/gtd_cage_sandbag.wad"
  map    = "MAP01"

  prob   = 50

  where  = "point"
  size   = 96

  bound_z1 = 0
}

PREFABS.Cage_sandbag_fort_for_two =
{
  file = "cage/gtd_cage_sandbag.wad"
  map      = "MAP02"

  prob     = 50

  where    = "point"
  size     = 128

  bound_z1 = 0
}

PREFABS.Cage_sandbag_fort_EPIC =
{
  file   = "cage/gtd_cage_sandbag.wad"
  map    = "MAP01"

  prob   = 50

  where    = "point"
  size     = 104

  replaces = "Cage_sandbag_fort"
  uses_epic_textures = true

  tex_BRICK12 = "SANDBAGS"

  bound_z1 = 0
}

PREFABS.Cage_sandbag_fort_for_two_EPIC =
{
  file     = "cage/gtd_cage_sandbag.wad"
  map      = "MAP02"

  prob     = 50

  where    = "point"
  size     = 136

  replaces = "Cage_sandbag_fort_for_two"
  uses_epic_textures = true

  tex_BRICK12 = "SANDBAGS"

  bound_z1 = 0
}

PREFABS.Cage_sandbag_inset =
{
  file = "cage/gtd_cage_sandbag.wad"
  map  = "MAP03"

  prob = 300

  where = "seeds"
  shape = "U"

  seed_w = 2
  seed_h = 1

  deep = 16
  over = 16

  x_fit = { 80,96 , 160,176 }
  y_fit = "top"

  thing_3004 =
  {
    zombie = 50
    shooter = 50
    gunner = 50
  }
}

PREFABS.Cage_sandbag_inset_EPIC =
{
  file = "cage/gtd_cage_sandbag.wad"
  map  = "MAP03"

  prob = 300

  replaces = "Cage_sandbag_inset"
  uses_epic_textures = true

  where = "seeds"
  shape = "U"

  seed_w = 2
  seed_h = 1

  deep = 16
  over = 16

  x_fit = { 80,96 , 160,176 }
  y_fit = "top"

  tex_BRICK12 = "SANDBAGS"

  thing_3004 =
  {
    zombie = 50
    shooter = 50
    gunner = 50
  }
}