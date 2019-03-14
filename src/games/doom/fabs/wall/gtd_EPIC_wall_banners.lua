PREFABS.Wall_epic_obaddon_banner =
{
  file   = "wall/gtd_EPIC_wall_banners.wad"
  map    = "MAP01"

  prob   = 35
  env   = "!building"
  theme = "!hell"

  uses_epic_textures = true

  where  = "edge"
  height = 256
  long   = 128
  deep   = 40

  bound_z1 = 0
  bound_z2 = 256

  x_fit = "frame"
  z_fit = "bottom"
}

PREFABS.Wall_epic_obaddon_banner2 =
{
  template = "Wall_epic_obaddon_banner"

  theme = "hell"

  tex_OBDNBNR1 =
  {
    OBDNBNR2 = 100
  }
}
