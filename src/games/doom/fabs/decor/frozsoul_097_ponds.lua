--
-- Outdoor pond based on Oblige 0.97
--


PREFABS.Decor_frozsoul_097_pond1 =
{
  file   = "decor/frozsoul_097_ponds.wad"
  map    = "MAP01"

  prob   = 500000
  theme  = "!hell"
  env    = "outdoor"

  where  = "point"
  size   = 128

  bound_z1 = -16

  sink_mode = "never"
}

PREFABS.Decor_frozsoul_097_pond2 =
{
  template = "Decor_frozsoul_097_pond1"
  map      = "MAP02"
}