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

  prob   = 3500
  theme  = "urban"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit = "top"
  
  sink_mode = "never"
}

PREFABS.Decor_marquee_sign2 =
{
   template = "Decor_marquee_sign"
   
   tex_CEMENT6 = "CEMENT1"
}
   
PREFABS.Decor_marquee_sign3 =
{
   template = "Decor_marquee_sign"
   
   tex_CEMENT6 = "CEMENT2"
}

PREFABS.Decor_marquee_sign4 =
{
   template = "Decor_marquee_sign"
   
   tex_CEMENT6 = "CEMENT4"
}