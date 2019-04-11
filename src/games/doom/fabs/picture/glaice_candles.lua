PREFABS.Pic_glaice_candles =
{
  file   = "picture/glaice_candles.wad"
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
PREFABS.Pic_glaice_candles_deimos =
{
  template   = "Pic_glaice_candles"
  
  env  = "indoors"
  game = "doom"
  prob   = 8
  theme = "deimos"
}
