--
-- Beams for internal areas.
--

PREFABS.Beam =
{
  file   = "fence/beam.wad"
  map    = "MAP01"
  theme = "!tech"

  kind   = "beam"

  prob   = 50

  where  = "edge"

  deep   = 8
  over   = 8

  fence_h  = 128
  bound_z1 = 0
}

PREFABS.Beam_tech =
{
  template = "Beam"
  theme = "tech"

  tex_SUPPORT3 = "SUPPORT2"
}

PREFABS.Beam_diagonal =
{
  file   = "fence/beam.wad"
  map    = "MAP02"
  theme  = "!tech"

  kind   = "beam"

  prob   = 50

  where  = "diagonal"

  fence_h = 128

  bound_z1 = 0
}

PREFABS.Beam_diagonal_tech =
{
  template = "Beam_diagonal"
  theme = "tech"

  tex_SUPPORT3 = "SUPPORT2"
}
