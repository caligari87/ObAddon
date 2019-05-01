PREFABS.Cage_sandbag_fort =
{
  file   = "cage/gtd_cage_sandbag.wad"
  map    = "MAP01"

  prob   = 50

  where  = "point"
  size   = 128

  bound_z1 = 0
}

PREFABS.Cage_sandbag_fort_for_two =
{
  template = "Cage_sandbag_fort"

  map      = "MAP02"

  size     = 96
}

PREFABS.Cage_sandbag_fort_EPIC =
{
  template   = "Cage_sandbag_fort"
  map    = "MAP01"
  prob   = 75

  uses_epic_textures = true

  tex_BRICK12 = "SANDBAGS"
}

PREFABS.Cage_sandbag_fort_for_two_EPIC =
{
  template = "Cage_sandbag_fort"
  map      = "MAP02"
  size     = 96
  prob     = 75

  uses_epic_textures = true

  tex_BRICK12 = "SANDBAGS"
}
