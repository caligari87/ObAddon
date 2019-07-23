PREFABS.Decor_armaetus_crufiied_pillar_1 =
{
  file   = "decor/armaetus_crucified.wad"
  map    = "MAP01"

  prob   = 5000
  theme  = "hell"

  where  = "point"
  size   = 88
  height = 136

  bound_z1 = 0
  bound_z2 = 138

  tex_SP_DUDE4 = { SP_DUDE4=50, SP_DUDE5=50 }
}

PREFABS.Decor_armaetus_crufiied_pillar_1_EPIC =
{
  template   = "Decor_armaetus_crufiied_pillar_1"
  prob       = 5000

  uses_epic_textures = true
  replaces   = "Decor_armaetus_crufiied_pillar_1"

  tex_SP_DUDE4 = { SP_DUDE4=50, SP_DUDE5=50, SPDUDE3=50, SPDUDE6=30 }
}
