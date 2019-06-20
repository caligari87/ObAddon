PREFABS.Arch_bare =
{
  file   = "door/gtd_bare_arch.wad"
  map    = "MAP01"

  prob = 600

  env = "outdoor"
  neighbor = "!outdoor"

  kind   = "arch"
  where  = "edge"

  deep   = 16
  over   = 16

  seed_w = 1

  x_fit  = { 60,68 }

  bound_z1 = 0
  bound_z2 = 128
}

PREFABS.Arch_bare_flipped =
{
  template = "Arch_bare"

  env = "!outdoor"
  neighbor = "outdoor"
}
