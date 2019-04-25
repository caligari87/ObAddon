PREFABS.Joiner_stairs_swurve_tech =
{
  file   = "joiner/gtd_stair_swurve.wad"
  map    = "MAP01"

  theme  = "tech"

  prob   = 250

  style  = "steepness"

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 2

  deep = 16
  over = 16

  delta_h = 64
  nearby_h = 128

  x_fit = { 136,152 }
  y_fit = "frame"

  can_flip = true

  tex_PANEL5 = "LITEBLU1"

  tex_LITE5 =
  {
    LITE5=1
    LITEBLU4=1
  }
}

PREFABS.Joiner_stairs_swurve_urban =
{
  template = "Joiner_stairs_swurve_tech"

  theme = "urban"
}

PREFABS.Joiner_stairs_swurve_hell =
{
  template = "Joiner_stairs_swurve_tech"

  theme = "hell"

  tex_PANEL5 =
  {
    GSTGARG=1
    GSTLION=1
    GSTSATYR=1
  }

  tex_LITE5 = "FIRELAVA"
}

PREFABS.Joiner_stairs_swurve_tech_mirrored =
{
  template = "Joiner_stairs_swurve_tech"

  map = "MAP02"

  x_fit = { 104,120 }

  tex_PANEL5 = "LITEBLU1"

  tex_LITE5 =
  {
    LITE5=1
    LITEBLU4=1
  }
}

PREFABS.Joiner_stairs_swurve_urban_mirrored =
{
  template = "Joiner_stairs_swurve_tech"

  theme = "urban"

  map = "MAP02"

  x_fit = { 104,120 }
}

PREFABS.Joiner_stairs_swurve_hell_mirrored =
{
  template = "Joiner_stairs_swurve_tech"

  theme = "urban"

  map = "MAP02"

  tex_PANEL5 =
  {
    GSTGARG=1
    GSTLION=1
    GSTSATYR=1
  }

  tex_LITE5 = "FIRELAVA"

  x_fit = { 104,120 }
}
