PREFABS.Wall_hell_stone_brace =
{
  file   = "wall/gtd_wall_hell_exterior_skip_prob.wad"
  map    = "MAP01"

  prob   = 450
  theme = "hell"
  env = "outdoor"

  skip_prob = 83.33

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

  prob = 750
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

-- references to some older fabs

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
