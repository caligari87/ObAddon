PREFABS.Arch_bare =
{
  file   = "door/gtd_bare_arch.wad"
  map    = "MAP01"

  prob = 200

  kind   = "arch"
  where  = "edge"

  deep   = 16
  over   = 16

  seed_w = 1

  x_fit  = { 60,68 }
  z_fit  = { 56,72 }

  bound_z1 = 0
  bound_z2 = 128
}

PREFABS.Arch_bare_columned =
{
  template = "Arch_bare"
  map      = "MAP02"

  seed_w   = 2

  x_fit    = { 24,104 , 152,232 }
}

PREFABS.Arch_bare_columned_2X =
{
  template = "Arch_bare"
  map      = "MAP02"

  seed_w   = 3

  x_fit    = { 24,104 , 152,232 , 280,360 }
}
