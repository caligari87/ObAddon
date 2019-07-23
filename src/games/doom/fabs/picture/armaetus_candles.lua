PREFABS.Pic_armaetus_candles =
{
  file   = "picture/armaetus_candles.wad"
  map    = "MAP01"

  prob   = 20
  env   = "building"
  theme = "hell"

  uses_epic_textures = true

  where  = "seeds"
  height = 128

  seed_w = 1
  seed_h = 1

  bound_z1 = 0
  bound_z2 = 128

  deep   =  16
  over   = -16

  x_fit = { 56,72 }
  y_fit = "top"
}

-- Spooky hellish candles for the Deimos base, not seen as much
PREFABS.Pic_armaetus_candles_deimos =
{
  template   = "Pic_armaetus_candles"

  env  = "building"
  game = "doom"
  prob   = 8
  theme = "deimos"
}
