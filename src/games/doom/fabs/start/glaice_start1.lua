PREFABS.Start_glaice_start_center_pillar =
{
  file  = "start/glaice_start1.wad"
  map = "MAP01"

  prob  = 500
  theme = "!hell"

  where = "seeds"

  seed_w = 2
  seed_h = 1

  deep  =  16

  x_fit = "frame"
  y_fit = "top"
}

PREFABS.Start_glaice_start_center_pillar_hell =
{
  template  = "Start_glaice_start_center_pillar"
  prob = 500
  map = "MAP01"
  theme = "hell"

  tex_TEKWALL1 = { SKIN2=50, SKINFACE=50, MARBLE1=50, GSTVINE1=50, GSTVINE2=50, GSTONE1=50, SP_HOT1=50 }
  tex_SHAWN2 = "METAL"
  tex_COMPSPAN = { STONE2=50, STONE3=50 }
  flat_FLAT4 = "FLAT1"
  flat_CEIL5_1 = "FLOOR6_2"

}

PREFABS.Start_glaice_start_lift =
{
  file  = "start/glaice_start1.wad"
  map = "MAP02"

  prob  = 500
  theme = "!hell"

  where = "seeds"

  seed_w = 2
  seed_h = 2

  deep  =  16

  x_fit = "frame"
  y_fit = "top"
}

PREFABS.Start_glaice_start_lift_hell =
{
  template  = "Start_glaice_start_lift"
  prob = 500
  map = "MAP02"
  theme = "hell"

  tex_SW1COMM = "SW1DIRT"
  tex_DOORSTOP = "METAL"
  tex_SHAWN2 = "METAL"
  tex_SUPPORT2 = "SUPPORT3"
  tex_TEKWALL4 = { MARBLE2=50, MARBLE3=50 }
  tex_COMPSPAN = { STONE2=50, STONE3=50 }
  flat_FLAT4 = "FLAT1"
  flat_CEIL5_1 = "FLOOR7_2"

  }