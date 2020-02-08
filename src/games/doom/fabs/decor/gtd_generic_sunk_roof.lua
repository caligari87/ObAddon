PREFABS.Decor_generic_sunk_roof =
{
  file   = "decor/gtd_generic_sunk_roof.wad"
  map    = "MAP01"

  prob   = 3500

  where  = "point"
  size   = 64
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit = "top"

  flat_FLAT2 =
  {
    FLAT2=50
    CEIL1_2=50
    CEIL1_3=50
    CEIL3_4=50
    CEIL3_6=50
    FLAT17=50
    FLAT22=50
    GRNLITE1=50
    TLITE6_1=50
    TLITE6_4=50
    TLITE6_5=50
    TLITE6_6=50
  }

  tex_GRAY7 = "METAL"

  sector_1  = { [0]=90, [1]=15 }

  sink_mode = "never"
}

PREFABS.Decor_generic_sunk_roof_yuge =
{
  template = "Decor_generic_sunk_roof"

  map      = "MAP02"

  size     = 128
}

PREFABS.Decor_generic_sunk_roof_octagon =
{
  template = "Decor_generic_sunk_roof"

  map      = "MAP03"

  size     = 128
}

PREFABS.Decor_generic_sunk_roof_X =
{
  template = "Decor_generic_sunk_roof"

  map      = "MAP04"

  size     = 128

  z_fit = { 48,56 }

  tex_LITE5 =
  {
    LITE5 = 50
    LITEBLU1 = 50
    LITEBLU4 = 50
    TEKLITE = 50
  }
}
