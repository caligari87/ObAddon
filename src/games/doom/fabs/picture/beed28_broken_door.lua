PREFABS.Pic_beed28_broken_door =
{
  file   = "picture/beed28_broken_door.wad"
  map    = "MAP01"

  prob   = 12
  env   = "building"
  theme = "!hell"

  where  = "seeds"
  height = 128

  seed_w = 2
  seed_h = 1

  bound_z1 = 0
  bound_z2 = 128

  deep   =  16
  over   = -16

  x_fit = "frame"
  y_fit = "top"

  tex_BIGDOOR2 =
  {
    BIGDOOR2 = 50
    BIGDOOR3 = 50
    BIGDOOR4 = 50
  }

  thing_10 =
   {
   gibs = 50
   gibbed_player = 50
   dead_player   = 50
   dead_zombie = 50
   dead_shooter = 50
   dead_imp = 50
   dead_demon = 50
   }
}

PREFABS.Pic_beed28_broken_door2 =
{
  template = "Pic_beed28_broken_door"

  map = "MAP02"
}
