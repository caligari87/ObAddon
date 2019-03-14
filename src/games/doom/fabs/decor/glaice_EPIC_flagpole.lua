PREFABS.Decor_glaice_flagpole =
{
  file   = "decor/glaice_EPIC_flagpole.wad"
  map    = "MAP01"

  theme  = "!hell"
  env = "outdoor"

  prob   = 5000

  where  = "point"
  height = 264
  size   = 56

  bound_z1 = 0
  bound_z2 = 264

  sink_mode = "never"

  z_fit = { 5,6 }
}

-- Uses OBLIGE logo!!
UNFINISHED.Decor_glaice_flagpole_obaddon_logo_earth =
{
  template = "Decor_glaice_flagpole"
  map    = "MAP02"

  theme  = "!hell"
  env = "outdoor"

  uses_epic_textures = true

  height = 280
  size   = 56

  bound_z1 = 0
  bound_z2 = 280
}

-- Uses OBLIGE logo!!
UNFINISHED.Decor_glaice_flagpole_obaddon_logo_hell =
{
  template = "Decor_glaice_flagpole"
  map    = "MAP02"

  theme  = "hell"
  env = "outdoor"

  uses_epic_textures = true

  height = 282
  size   = 56

  bound_z1 = 0
  bound_z2 = 280

  tex_OBDNBNR1 =
  {
    OBDNBNR2 = 100
  }
}
