PREFABS.Joiner_secret_trap_shootable_eye =
{
  file   = "joiner/mogwaltz_trap_eye.wad"
  map    = "MAP01"

  prob   = 37

  style  = "trap"

  where  = "seeds"
  shape  = "U"

  seed_w = 2
  seed_h = 1

  deep   = 16

  x_fit  = "frame"
  y_fit  = { 64,96 }

  -- prevent monsters stuck in a barrel
  solid_ents = true
}

PREFABS.Joiner_secret_trap_shootable_eye_pair =
{
  template = "Joiner_secret_trap_shootable_eye"
  map = "MAP02"

  prob = 37
}