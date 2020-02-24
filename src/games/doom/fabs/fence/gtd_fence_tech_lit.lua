PREFABS.Fence_tech_lit =
{
  file   = "fence/gtd_fence_tech_lit.wad"
  map    = "MAP01"

  prob   = 50

  group  = "fence_tech_lit"

  where  = "edge"

  deep   = 16
  over   = 16

  fence_h  = 32
  bound_z1 = 0
}

PREFABS.Fence_tech_lit_diag =
{
  file   = "fence/gtd_fence_tech_lit.wad"
  map    = "MAP02"

  prob   = 50

  group  = "fence_tech_lit"

  where  = "diagonal"

  fence_h = 32

  bound_z1 = 0
}

PREFABS.Fence_tech_lit_EPIC =
{
  file   = "fence/gtd_fence_tech_lit.wad"
  map    = "MAP01"

  prob   = 50

  uses_epic_textures = true
  replaces = "Fence_tech_lit"

  group  = "fence_tech_lit"

  where  = "edge"

  deep   = 16
  over   = 16

  fence_h  = 32
  bound_z1 = 0

  tex_MIDSPACE = "MIDSPAC5"
}


PREFABS.Fence_tech_lit_diag_EPIC =
{
  file   = "fence/gtd_fence_tech_lit.wad"
  map    = "MAP02"

  prob   = 50

  uses_epic_textures = true
  replaces = "Fence_tech_lit_diag"

  group  = "fence_tech_lit"

  where  = "diagonal"

  fence_h = 32

  bound_z1 = 0

  tex_MIDSPACE = "MIDSPAC5"
}
