PREFABS.Wall_tech_outdoor_caution_strip = --#
{
  file   = "wall/gtd_wall_tech_exterior_wall_groups.wad"
  map    = "MAP01"

  prob   = 15

  group = "tech_o_caution_strip"

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

PREFABS.Wall_tech_outdoor_orange_light_stack = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map      = "MAP02"

  group = "tech_o_orange_light_stack"

  z_fit    = "stretch"
}

-- LITE strips

PREFABS.Wall_tech_outdoor_lite_strip_white = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map    = "MAP03"

  group = "tech_o_lite_strip_white"

  z_fit = "bottom"
}

PREFABS.Wall_tech_outdoor_lite_strip_blue = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map    = "MAP03"

  group = "tech_o_lite_strip_blue"

  z_fit = "bottom"

  tex_LITE3 = "LITEBLU4"
}

-- teklite inset

PREFABS.Wall_tech_outdoor_inset_teklite = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map      = "MAP04"

  group = "tech_o_inset_teklite"

  z_fit    = "top"
}

PREFABS.Wall_tech_outdoor_inset_teklite2 = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map      = "MAP04"

  group = "tech_o_inset_teklite2"

  tex_TEKLITE = "TEKLITE2"

  z_fit    = "top"
}

-- green light

PREFABS.Wall_tech_outdoor_halfbase_green_light = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map      = "MAP05"

  group = "tech_o_halfbase_green_light"

  z_fit    = {40,56}
}

PREFABS.Wall_tech_outdoor_halfbase_blue_triangle = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map      = "MAP05"

  group = "tech_o_halfbase_blue_triangle"

  tex_TEKGREN5 = "TEKGREN3"

  z_fit     = "top"
}

-- because you need to be constantly reminded how the UAC screwed everything up

PREFABS.Wall_tech_outdoor_giant_UAC_sign = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map = "MAP06"

  group = "tech_o_giant_UAC_sign"

  z_fit = "bottom"

  tex_SHAWN1 =
  {
    SHAWN1 = 1
    SHAWN2 = 3
  }

  sector_1 = { [0]=80, [1]=15 }
}

-- vents

PREFABS.Wall_tech_outdoor_double_hanging_vents = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map = "MAP07"

  group = "tech_o_double_hanging_vents"

  tex_METAL2 =
  {
    METAL5 = 50
    METAL3 = 10
  }

  z_fit = "bottom"
}

-- overhangs

PREFABS.Wall_tech_outdoor_overhanging_braced_vent = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map = "MAP08"

  group = "tech_o_overhanging_braced_vent"

  height = 192
  deep = 48

  z_fit = { 48,56 }

  bound_z2 = 192
}

PREFABS.Wall_tech_outdoor_overhanging_lite_platform = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map = "MAP09"

  group = "tech_o_overhanging_lite_platform"

  deep = 64

  z_fit = { 12,20 }
}

PREFABS.Wall_tech_outdoor_pipe_junctions = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map = "MAP10"

  group = "tech_o_pipe_junctions"

  height = 192

  tex_PIPES =
  {
    PIPES = 15
    TEKWALL6 = 50
  }

  z_fit = { 32,96 }

  bound_z2 = 192
}

PREFABS.Wall_tech_hadleys_hope_sort_of_wall = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map = "MAP11"

  group = "tech_o_hadleys_hope"

  height = 192

  deep = 64

  engine = "zdoom"

  z_fit = "bottom"

  bound_z2 = 192
}

PREFABS.Wall_tech_overhanging_lights = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map = "MAP12"

  group = "tech_o_overhanging_lights"

  deep = 64

  engine = "zdoom"

  z_fit = "top"
}

PREFABS.Wall_outdoor_shiny_silver_overhang = --#
{
  template = "Wall_tech_outdoor_caution_strip"

  map = "MAP13"

  group = "tech_o_shiny_silver_overhang"

  height = 160
  deep = 80

  tex_GRAYMET4 = "GRAY7"
  tex_GRAYMET3 = "METAL2"
  tex_SHAWN5 = "GRAY5"
  tex_MIDSPAC5 = "MIDSPACE"
  tex_COLLITE3 = "LITEBLU4"

  z_fit = "bottom"

  bound_z2 = 160
}

PREFABS.Wall_outdoor_shiny_silver_overhang_EPIC =
{
  template = "Wall_tech_outdoor_caution_strip"

  map = "MAP13"

  uses_epic_textures = true
  replaces = "Wall_outdoor_shiny_silver_overhang"

  group = "tech_o_shiny_silver_overhang"

  height = 160
  deep = 80

  tex_GRAYMET4 =
  {
    GRAYMET4 = 50
    GRAYMET2 = 8
  }
  tex_GRAYMET3 = "GRAYMET3"
  tex_SHAWN5 = "SHAWN5"
  tex_MIDSPAC5 = "MIDSPAC5"
  tex_COLLITE3 = "COLLITE3"

  z_fit = "bottom"

  bound_z2 = 160
}
