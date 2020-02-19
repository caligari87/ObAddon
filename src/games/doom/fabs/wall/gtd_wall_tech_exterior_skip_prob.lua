PREFABS.Wall_tech_outdoor_caution_strip =
{
  file   = "wall/gtd_wall_tech_exterior_skip_prob.wad"
  map    = "MAP01"

  prob   = 200
  skip_prob = 75

  env   = "!building"
  theme = "tech"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = {24,32}
}

PREFABS.Wall_tech_outdoor_orange_light_stack =
{
  template = "Wall_tech_outdoor_caution_strip"

  map      = "MAP02"

  z_fit    = "stretch"
}

-- LITE strips

PREFABS.Wall_tech_outdoor_lite_strip_white =
{
  template = "Wall_tech_outdoor_caution_strip"

  map    = "MAP03"

  z_fit = "bottom"
}

PREFABS.Wall_tech_outdoor_lite_strip_blue =
{
  template = "Wall_tech_outdoor_caution_strip"

  map    = "MAP03"

  z_fit = "bottom"

  tex_LITE3 = "LITEBLU4"
}
