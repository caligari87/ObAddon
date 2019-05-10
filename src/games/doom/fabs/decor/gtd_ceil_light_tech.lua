PREFABS.Light_gtd_detailed =
{
  file   = "decor/gtd_ceil_light_tech.wad"
  map    = "MAP01"

  prob   = 100
  theme  = "!hell"
  env    = "building"

  kind   = "light"
  where  = "point"

  height = 128

  bound_z1 = -32
  bound_z2 = 0

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}

PREFABS.Light_gtd_detailed_alt =
{
  template = "Light_gtd_detailed"

  tex_TLITE6_6 = "TLITE6_5"
}

PREFABS.Light_gtd_flourescent_lamp =
{
  template = "Light_gtd_detailed"
  map = "MAP02"

  bound_z1 = -24
}

PREFABS.Light_gtd_flourescent_lamp_alt =
{
  template = "Light_gtd_detailed"
  map = "MAP02"

  bound_z1 = -24

  tex_LITE3 = "LITEBLU4"
  tex_LITE5 = "LITEBLU4"
  flat_FLAT23 = "FLAT14"
}

PREFABS.Light_gtd_round =
{
  template = "Light_gtd_detailed"
  map = "MAP03"

  bound_z1 = -16
}

PREFABS.Light_gtd_round_alt =
{
  template = "Light_gtd_detailed"
  map = "MAP03"

  bound_z1 = -16

  tex_LITE5 = "LITEBLU4"
  flat_FLAT23 = "FLAT22"
}

PREFABS.Light_gtd_tall_light =
{
  template = "Light_gtd_detailed"
  map = "MAP04"

  prob = 150

  bound_z1 = -88

  height = 184
}
