PREFABS.Pillar_gtd_generic1 =
{
  file   = "decor/gtd_pillar_generic.wad"
  map    = "MAP01"

  rank   = 2
  prob   = 5000
  theme  = "!hell"
  env    = "building"

  where  = "point"
  size   = 112
  height = 192

  bound_z1 = 0
  bound_z2 = 192

  z_fit  = { 80,112 }

  sink_mode = "never"

  tex_LITE5 =
  {
    LITE5 = 50
    LITEBLU4 = 50
    LITEBLU1 = 50
  }
}

PREFABS.Pillar_gtd_generic1_hell =
{
  template = "Pillar_gtd_generic1"
  map      = "MAP01"

  theme  = "hell"

  tex_LITE5 =
  {
    FIREBLU1 = 50
    FIRELAVA = 50
    FIREMAG1 = 50
  }
}

PREFABS.Pillar_gtd_generic2 =
{
  template = "Pillar_gtd_generic1"
  map      = "MAP02"

  theme  = "!hell"

  tex_SILVER2 =
  {
    SILVER2 = 50
    LITE3 = 50
    LITEBLU4 = 50
  }
}

PREFABS.Pillar_gtd_generic2_hell =
{
  template = "Pillar_gtd_generic1"
  map      = "MAP02"

  theme  = "hell"

  tex_SILVER2 =
  {
    FIRELAVA = 20
    FIREMAG = 20
  }
}

PREFABS.Pillar_gtd_generic3 =
{
  template = "Pillar_gtd_generic1"
  map      = "MAP03"
}
