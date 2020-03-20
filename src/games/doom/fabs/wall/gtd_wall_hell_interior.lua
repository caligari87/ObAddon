PREFABS.Wall_hell_braced_arch =
{
  file   = "wall/gtd_wall_hell_interior.wad"
  map    = "MAP01"

  prob   = 50
  env   = "building"
  theme = "hell"

  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "bottom"
}

PREFABS.Wall_hell_braced_arch_candle_lit =
{
  template = "Wall_hell_braced_arch"
  map = "MAP02"
}

PREFABS.Wall_hell_churchy_window_big_inside =
{
  template = "Wall_hell_braced_arch"
  map = "MAP03"
}

PREFABS.Wall_hell_churchy_window_small_inside =
{
  template = "Wall_hell_braced_arch"
  map    = "MAP04"
}

-- outside versions of the windows

PREFABS.Wall_hell_churchy_window_big_bottom =
{
  template = "Wall_hell_braced_arch"
  map = "MAP03"

  env = "outdoor"

  on_scenics = "never"

  z_fit = "bottom"
}

PREFABS.Wall_hell_churchy_window_big_stretch =
{
  template = "Wall_hell_braced_arch"
  map = "MAP03"

  prob = 25

  env = "outdoor"

  on_scenics = "never"

  z_fit = { 48,104 }
}

PREFABS.Wall_hell_churchy_window_small_bottom =
{
  template = "Wall_hell_braced_arch"
  map = "MAP04"

  env = "outdoor"

  on_scenics = "never"

  z_fit = "bottom"
}

PREFABS.Wall_hell_churchy_window_small_stretch =
{
  template = "Wall_hell_braced_arch"
  map = "MAP04"

  prob = 25

  env = "outdoor"

  on_scenics = "never"

  z_fit = { 48,104 }
}
