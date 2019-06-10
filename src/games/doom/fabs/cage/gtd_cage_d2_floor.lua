PREFABS.Cage_gtd_D2_floor =
{
  file   = "cage/gtd_cage_d2_floor.wad"

  prob  = 100
  theme = "hell"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   =  16
  over   = -16

  x_fit = { 20,88 }
  y_fit = "top"

  tex_MISDPSACE =
  {
    MIDSPACE = 50
    MIDGRATE = 50
    MIDBARS1 = 50
  }
}

PREFABS.Cage_gtd_D2_floor_tech =
{
  template = "Cage_gtd_D2_floor"

  theme = "!hell"

  tex_SUPPORT3 = "SHAWN2"
  tex_METAL = "SHAWN2"

  tex_MIDSPACE =
  {
    MIDSPACE = 50
    MIDBARS1 = 50
    BRNSMALC = 50
  }
}
