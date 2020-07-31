PREFABS.Light_typh_flourescent_lamp =
{
  file   = "decor/typh_ceil_light_tech.wad"
  map    = "MAP01"

  prob   = 80
  theme  = "!hell"
  env    = "building"

  kind   = "light"
  where  = "point"

  height = 128

  bound_z1 = -32

  light_color = "white"

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}

-- blue lights, same shell
PREFABS.Light_typh_flourescent_lamp_alt =
{
  template = "Light_typh_flourescent_lamp"

  light_color = "blue"

  flat_FLAT23 = "FLAT14"
  tex_LITE3 = "LITEBLU4"
}

-- red lights, same shell
PREFABS.Light_typh_flourescent_lamp_alt2 =
{
  template = "Light_typh_flourescent_lamp"

  light_color = "red"

  flat_FLAT23 = "FLAT5_3"
  tex_LITE3 = "REDWALL"
}
