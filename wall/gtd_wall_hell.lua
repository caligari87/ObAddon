--
-- Fancy walls
--

PREFABS.Wall_hellarch =
{
  file   = "wall/gtd_wall_hell.wad"
  map    = "MAP01"

  prob   = 50
  env   = "building"
  theme = "!tech"
  
  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "bottom" 
}

PREFABS.Wall_hellarch_candlelit =
{
  file   = "wall/gtd_wall_hell.wad"
  map    = "MAP02"

  prob   = 50
  env   = "building"
  theme = "!tech"
  
  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "bottom" 
}

PREFABS.Wall_hell_cageframe =
{
  file   = "wall/gtd_wall_hell.wad"
  map    = "MAP03"

  prob   = 50
  env   = "building"
  theme = "!tech"
  
  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = { 64-16,64+16 }
}

PREFABS.Wall_hell_fake_window =
{
  file   = "wall/gtd_wall_hell.wad"
  map    = "MAP04"

  prob   = 50
  env   = "building"
  theme = "!tech"
  
  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = { 32,32+8 }
}

PREFABS.Wall_hell_fake_window_outdoor =
{
  template = "Wall_hell_fake_window"

  env = "outdoor"
}

PREFABS.Wall_hell_fake_window_outdoor_topstretch =
{
  template = "Wall_hell_fake_window"

  env = "outdoor"
  
  z_fit = "bottom"
}

PREFABS.Wall_hell_flataccent_outdoor =
{
  file   = "wall/gtd_wall_hell.wad"
  map    = "MAP05"

  prob   = 50
  env   = "outdoor"
  theme = "!tech"
  
  where  = "edge"
  height = 128
  long   = 128
  deep   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "stretch"
  z_fit = "stretch"
}