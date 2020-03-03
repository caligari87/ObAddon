PREFABS.Wall_hell_stone_brace = --#
{
  file   = "wall/gtd_wall_hell_exterior_skip_prob.wad"
  map    = "MAP01"

  prob   = 750
  theme = "hell"
  env = "outdoor"

  skip_prob = 92.39

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "bottom"
}

PREFABS.Wall_hell_wood_brace = --#
{
  template = "Wall_hell_stone_brace"

  tex_STONE2 = "WOODMET2"
}

PREFABS.Wall_hell_metal_framed_skin = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP02"

  tex_SKINEDGE =
  {
    SKINEDGE = 50
    SKSNAKE2 = 50
    SKSPINE1 = 7
    SKSPINE2 = 7
    SKSNAKE1 = 7
  }

  z_fit = "stretch"
}

PREFABS.Wall_hell_caged_up_corpses = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP03"

  tex_SLOPPY1 =
  {
    SLOPPY1 = 50
    SLOPPY2 = 50
  }
  tex_WOODMET4 =
  {
    WOODMET3 = 50
    WOODMET4 = 50
  }

  z_fit = "top"
}

PREFABS.Wall_hell_giant_stone_faces = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP04"

  height = 192

  tex_MARBFAC2 =
  {
    MARBFAC2 = 50
    MARBFAC3 = 50
  }

  z_fit = { 8,56 }

  bound_z2 = 192
}

PREFABS.Wall_hell_giant_stone_faces_EPIC =
{
  template = "Wall_hell_stone_brace"
  map = "MAP04"

  height = 192

  uses_epic_textures = true

  replaces = "Wall_hell_giant_stone_faces"

  tex_MARBFAC2 =
  {
    MARBFAC2 = 50
    MARBFAC3 = 50
    MARBFAC6 = 50
    MARBFAC7 = 50
    MARBFACF = 50
  }

  z_fit = { 8,56 }

  bound_z2 = 192
}

PREFABS.Wall_hell_outdoor_rising_spfaces = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP05"

  engine = "zdoom"

  z_fit = "top"
}

PREFABS.Wall_hell_outdoor_lava_falls = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP06"

  tex_FIREMAG1 =
  {
    FIREMAG1 = 10
    SLADWALL = 50
  }

  z_fit = { 48,72 }
}

PREFABS.Wall_hell_outdoor_huge_overhang = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP07"

  deep = 48

  z_fit = "stretch"
}

PREFABS.Wall_hell_outdoor_spiny_overhang = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP08"

  deep = 64

  z_fit = { 32,96 }
}

PREFABS.Wall_hell_outdoor_red_glass_tall = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP09"

  height = 192

  tex_GOTH19 = "METAL2"
  tex_GOTH20 = "METAL2"
  tex_GOTH21 = "BRONZE1"
  tex_GOTH36 = "BRONZE1"
  tex_GLASS13 = "REDWALL"

  z_fit = { 40,120 }

  bound_z2 = 192
}

PREFABS.Wall_hell_outdoor_red_glass_tall_EPIC =
{
  template = "Wall_hell_stone_brace"
  map = "MAP09"

  height = 192

  uses_epic_textures = true

  replaces = "Wall_hell_outdoor_red_glass_tall"

  z_fit = { 40,120 }

  bound_z2 = 192
}

PREFABS.Wall_hell_outdoor_rising_energy = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP10"

  height = 192

  z_fit = { 136,186 }

  bound_z2 = 192
}

PREFABS.Wall_hell_outdoor_rising_energy_EPIC =
{
  template = "Wall_hell_stone_brace"
  map = "MAP10"

  uses_epic_textures = true

  height = 192

  replaces = "Wall_hell_outdoor_rising_energy"

  tex_FIREBLU1 = "RDWAL01"
  tex_MARBFAC4 =
  {
    MARBF01 = 50
    MARBF02 = 50
    MARBF03 = 50
  }

  z_fit = { 136,186 }

  bound_z2 = 192
}

PREFABS.Wall_hell_wooden_palisades = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP11"

  tex_WOODMET3 =
  {
    WOODMET1 = 50
    WOODMET3 = 10
    WOODMET4 = 10
  }
  tex_WOOD10 =
  {
    WOOD5 = 5
    WOOD6 = 5
    WOOD7 = 5
    WOOD8 = 5
    WOOD9 = 5
    WOOD10 = 5
  }

  z_fit = "top"
}

PREFABS.Wall_gothic_flying_alcoves = --#
{
  template = "Wall_hell_stone_brace"
  map = "MAP12"

  deep = 64

  z_fit = "top"
}


PREFABS.Wall_gothic_flying_alcoves_EPIC =
{
  template = "Wall_hell_stone_brace"
  map = "MAP12"

  deep = 64

  replaces = "Wall_gothic_flying_alcoves"

  uses_epic_textures = true

  tex_MIDBRN1 ="MIDWIND7"

  z_fit = "top"
}

-- references to some older fabs [2]

PREFABS.Wall_hell_fake_window_outdoor = --#
{
  template = "Wall_hell_fake_window"

  prob = 75

  env = "outdoor"
}

PREFABS.Wall_hell_fake_window_outdoor_topstretch =
{
  template = "Wall_hell_fake_window"

  env = "outdoor"
  prob = 75

  z_fit = "bottom"
}

PREFABS.Wall_hell_fake_window_small_outdoor = --#
{
  template = "Wall_hell_fake_window_small"

  env = "outdoor"
  prob = 75

  x_fit = "stretch"
  z_fit = { 16-8,16+8 }
}

PREFABS.Wall_hell_fake_window_small_outdoor_stretchy =
{
  template = "Wall_hell_fake_window_small"

  env = "outdoor"
  prob = 75

  x_fit = "stretch"
  z_fit = { 48,56 }
}
