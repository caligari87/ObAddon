--
-- Beams for internal areas.
--

PREFABS.Beam =
{
  file   = "fence/beam.wad"
  map    = "MAP01"

  group  = "beam_gothic"

  kind   = "beam"

  prob   = 50

  where  = "edge"

  deep   = 8
  over   = 8

  bound_z1 = 0
}

PREFABS.Beam_diagonal =
{
  file   = "fence/beam.wad"
  map    = "MAP02"

  group  = "beam_gothic"

  kind   = "beam"

  prob   = 50

  where  = "diagonal"

  bound_z1 = 0
}

PREFABS.Beam_tech =
{
  template = "Beam"
  map = "MAP03"

  group = "beam_shiny"
}

PREFABS.Beam_diagonal_tech =
{
  template = "Beam_diagonal"
  map = "MAP04"

  group = "beam_shiny"
}
