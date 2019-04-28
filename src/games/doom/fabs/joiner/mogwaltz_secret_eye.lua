PREFABS.Joiner_secret_secret_shootable_eye =
{
  file   = "joiner/mogwaltz_secret_eye.wad"
  map    = "MAP01"

  prob   = 75

  key    = "secret"

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 1

  deep   = 16
  over   = 16

  x_fit  = "frame"
  y_fit  = { 64,96 }

  -- prevent monsters stuck in a barrel
  solid_ents = true
}
