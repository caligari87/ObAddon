--
-- Beams for internal areas.
--

PREFABS.Beam_lights =
{
  file   = "fence/beam_lights.wad"
  map    = "MAP01"

  group  = "beam_lights"

  kind   = "beam"

  prob   = 50

  where  = "edge"

  deep   = 8
  over   = 8

  z_fit = { 56,72 }

  bound_z1 = 0
  bound_z2 = 128
}

PREFABS.Beam_lights_diagonal =
{
  file   = "fence/beam_lights.wad"
  map    = "MAP02"

  group  = "beam_lights"

  kind   = "beam"

  prob   = 50

  where  = "diagonal"

  z_fit = { 56,72 }

  bound_z1 = 0
  bound_z2 = 128
}
