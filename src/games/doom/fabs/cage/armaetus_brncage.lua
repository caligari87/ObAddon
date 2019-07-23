PREFABS.Cage_wall_brncage =
{
  file   = "cage/armaetus_brncage.wad"

  prob  = 800

  where  = "seeds"
  shape  = "U"

  theme  = "!hell"

  height = 128

  seed_w = 1
  seed_h = 1

  deep   =  16
  over   = -16

  x_fit = { 60,64 }
  y_fit = "top"

  sector_8  = { [8]=60, [2]=10, [3]=10, [17]=10, [21]=5 }

  tex_BRNSMALC =
  {
    BRNSMALC = 50
    MIDSPACE = 50
  }
}

PREFABS.Cage_wall_brncage_hell =
{
  template = "Cage_wall_brncage"

  theme    = "hell"

  tex_BRNSMALC =
  {
    BRNSMALC = 15
    MIDSPACE = 25
    MIDBRN1 = 50
  }
}
