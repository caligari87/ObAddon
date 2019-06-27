--
-- Props for urban and tech
--

-- a basketball hoop
PREFABS.Decor_basketball_hoop =
{
  file   = "decor/dem_props.wad"
  map    = "MAP01"

  prob   = 5000
  theme  = "urban"
  env    = "outdoor"

  where  = "point"
  size   = 96
  height = 184

  bound_z1 = 0
  bound_z2 = 184

  face_open = true
}

-- a trash bin
PREFABS.Decor_trash_bin =
{
  file   = "decor/dem_props.wad"
  map    = "MAP02"

  engine = "zdoom"

  prob   = 3500
  theme  = "!hell"
  env    = "!cave"

  where  = "point"
  size   = 52
  height = 40

  bound_z1 = 0

  sink_mode = "never"

  face_open = true
}

-- a mailbox
PREFABS.Decor_mailbox =
{
  file   = "decor/dem_props.wad"
  map    = "MAP03"

  engine = "zdoom"

  prob   = 3500
  theme  = "urban"
  env    = "outdoor"

  where  = "point"
  size   = 48
  height = 56

  bound_z1 = 0

  sink_mode = "never"

  face_open = true
}
