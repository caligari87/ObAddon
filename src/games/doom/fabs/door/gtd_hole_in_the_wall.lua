PREFABS.Arch_hole_in_the_wall_1x =
{
  file   = "door/gtd_hole_in_the_wall.wad"
  map    = "MAP01"

  prob = 250

  kind   = "arch"
  where  = "edge"

  deep   = 16
  over   = 16

  seed_w = 1

  x_fit = "frame"

  bound_z1 = 0
  bound_z2 = 128
}

PREFABS.Arch_hole_in_the_wall_2x =
{
  template = "Arch_hole_in_the_wall_1x"

  prob = 325

  seed_w = 2

  map = "MAP02"
}

PREFABS.Arch_hole_in_the_wall_3x =
{
  template = "Arch_hole_in_the_wall_1x"

  prob = 450

  seed_w = 3

  map = "MAP03"
}
