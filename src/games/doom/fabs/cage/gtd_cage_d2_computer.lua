PREFABS.Cage_wall_d2_computer_tech =
{
  file   = "cage/gtd_cage_d2_computer.wad"

  map   = "MAP01"

  prob  = 150

  theme  = "tech"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   =  16
  over   = -16

  x_fit = { 48,80 }
  y_fit = "top"

  sector_8  = { [8]=60, [2]=10, [3]=10, [17]=10, [21]=5 }
}

PREFABS.Cage_wall_d2_computer_hell =
{
  template = "Cage_wall_d2_computer_tech"

  map = "MAP02"

  theme = "hell"
}

PREFABS.Cage_wall_d2_computer_tech_flipped =
{
  template = "Cage_wall_d2_computer_tech"

  map = "MAP03"
}

PREFABS.Cage_wall_d2_computer_hell_flipped =
{
  template = "Cage_wall_d2_computer_tech"

  map = "MAP04"

  theme = "hell"
}
