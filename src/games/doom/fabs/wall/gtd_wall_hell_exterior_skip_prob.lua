PREFABS.Wall_hell_stone_brace =
{
  file   = "wall/gtd_wall_hell_exterior_skip_prob.wad"
  map    = "MAP01"

  prob   = 450
  theme = "hell"
  env = "outdoor"

  skip_prob = 85.71

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "bottom"
}

PREFABS.Wall_hell_wood_brace =
{
  template = "Wall_hell_stone_brace"

  tex_STONE2 = "WOODMET2"
}

PREFABS.Wall_hell_metal_framed_skin =
{
  template = "Wall_hell_stone_brace"
  map = "MAP02"

  prob = 750

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

PREFABS.Wall_hell_caged_up_corpses =
{
  template = "Wall_hell_stone_brace"
  map = "MAP03"

  prob = 750

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

PREFABS.Wall_hell_giant_stone_faces =
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

-- references to some older fabs [2]
PREFABS.Wall_hell_fake_window_outdoor =
{
  template = "Wall_hell_fake_window"

  prob = 100

  env = "outdoor"
}

PREFABS.Wall_hell_fake_window_outdoor_topstretch =
{
  template = "Wall_hell_fake_window"

  env = "outdoor"
  prob = 100

  z_fit = "bottom"
}

PREFABS.Wall_hell_fake_window_small_outdoor =
{
  template = "Wall_hell_fake_window_small"

  env = "outdoor"
  prob = 100

  x_fit = "stretch"
  z_fit = { 16-8,16+8 }
}

PREFABS.Wall_hell_fake_window_small_outdoor_stretchy =
{
  template = "Wall_hell_fake_window_small"

  env = "outdoor"
  prob = 100

  x_fit = "stretch"
  z_fit = { 48,56 }
}
