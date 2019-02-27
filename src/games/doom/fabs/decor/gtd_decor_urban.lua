PREFABS.Decor_bench_n_trashcan =
{
  file   = "decor/gtd_decor_urban.wad"
  map    = "MAP01"

  prob   = 5000
  theme  = "urban"

  where  = "point"
  size   = 64

  bound_z1 = 0

  sink_mode = "never"
}

PREFABS.Decor_round_planter =
{
  file   = "decor/gtd_decor_urban.wad"
  map    = "MAP02"

  prob   = 5000
  theme  = "urban"

  where  = "point"
  size   = 64

  bound_z1 = 0

  sink_mode = "never"
}

PREFABS.Decor_guardhouse =
{
  file   = "decor/gtd_decor_urban.wad"
  map    = "MAP03"

  prob   = 5000
  theme  = "urban"
  env    = "building"

  where  = "point"
  size   = 64
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "top"

  sink_mode = "never"
}

PREFABS.Decor_marquee_sign =
{
  file   = "decor/gtd_decor_urban.wad"
  map    = "MAP04"

  prob   = 10000 --10000 from 3500 - Increased probability because the templates have now been replaced by a simple prob control.
  theme  = "urban"
  env    = "building"

  where  = "point"
  size   = 16 --64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit = "top"

  sink_mode = "never"

  tex_SHAWN1 =
  {
    SHAWN1   = 50
    MARBFACE = 16
    MARBFAC2 = 16
    MARBFAC3 = 16
    O_NEON   = 50
    O_BOLT   = 50
    O_PILL   = 50
    O_RELIEF = 50
  }

}

PREFABS.Decor_market_stall =
{
  file   = "decor/gtd_decor_urban.wad"
  map    = "MAP05"

  prob   = 5000
  theme  = "urban"
  env    = "building"

  where  = "point"
  size   = 64
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "top"
}

PREFABS.Decor_street_barrier =
{
  file   = "decor/gtd_decor_urban.wad"
  map    = "MAP06"

  prob   = 6000
  theme  = "urban"

  where  = "point"
  size   = 64

  bound_z1 = 0
}

PREFABS.Decor_waiting_shed =
{
  file   = "decor/gtd_decor_urban.wad"
  map    = "MAP07"

  prob   = 5000
  theme  = "urban"
  env    = "building"

  where  = "point"
  size   = 64
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "top"
}

PREFABS.Decor_cafe_table_set =
{
  file   = "decor/gtd_decor_urban.wad"
  map    = "MAP08"

  prob   = 5000
  theme  = "urban"
  env    = "!cave"

  where  = "point"
  size   = 64

  bound_z1 = 0
}
