PREFABS.Decor_light_pillar_helix =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP01"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 128
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit  = { 120+16,120+32 }
}

PREFABS.Decor_light_pillar_helix_outdoor =
{
  template = "Decor_light_pillar_helix"

  height = {160,512}

  env    = "outdoor"

  z_fit  = "top"
}

PREFABS.Decor_light_pillar_core =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP02"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit  = { 40+16,40+32}
}

PREFABS.Decor_light_pillar_core_outdoor =
{
  template = "Decor_light_pillar_core"

  env    = "outdoor"

  height = {160,320}

  z_fit  = "top"
}

PREFABS.Decor_light_pillar_core2 =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP03"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit  = { 40+16,40+32 }
}

PREFABS.Decor_light_pillar_core2_outdoor =
{
  template = "Decor_light_pillar_core2"

  env    = "outdoor"

  height = {160,320}

  z_fit  = "top"
}

PREFABS.Decor_data_pillar =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP04"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit  = "top"
}

PREFABS.Decor_computer_tall =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP05"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit  = "top"
}

PREFABS.Decor_server_rack =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP06"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit = "top"

  sink_mode = "never"
}

PREFABS.Decor_open_pipe =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP07"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit  = "top"
  sound = "Water_Tank"
}

PREFABS.Decor_floor_decal_stripes =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP08"

  prob   = 5000
  theme  = "!hell"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z1 = 2

  sink_mode = "never"
}

PREFABS.Decor_sealed_storage =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP09"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit = "top"
}

PREFABS.Decor_sealed_storage_outdoor =
{
  template = "Decor_sealed_storage"

  height = {128, 368}

  env    = "outdoor"
}

PREFABS.Decor_sealed_storage_large =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP10"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 128
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit = "top"
}

PREFABS.Decor_sealed_storage_large_outdoor =
{
  template = "Decor_sealed_storage_large"

  height = {128, 368}

  env    = "outdoor"
}

PREFABS.Decor_fuel_rods =
{
  file   = "decor/gtd_decor_tech.wad"
  map    = "MAP11"

  prob   = 5000
  theme  = "tech"
  env    = "building"

  where  = "point"
  size   = 64
  height = 160

  bound_z1 = 0
  bound_z2 = 160

  z_fit = { 56+8,56+16 }
}
