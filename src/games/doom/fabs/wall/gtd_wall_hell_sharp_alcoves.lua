PREFABS.Wall_hell_sharp_alcoves_single =
{
  file   = "wall/gtd_wall_hell_sharp_alcoves.wad"
  map    = "MAP01"

  prob   = 50
  theme  = "hell"
  env = "building"

  where  = "edge"
  deep   = 16
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = { 32,40 }

  tex_FIRELAVA =
  {
    FIRELAVA=1
    FIREBLU1=1
    FIREMAG1=1
    CRACKLE2=1
    CRACKLE4=1
    ROCKRED1=1
    SKIN2=1
  }

  thing_35 =
  {
    evil_eye=1
    candelabra=1
    blue_torch=1
    green_torch=1
    red_torch=1
    skull_cairn=1
  }
}

PREFABS.Wall_hell_sharp_alcoves_double =
{
  template = "Wall_hell_sharp_alcoves_single"
  map      = "MAP02"
}