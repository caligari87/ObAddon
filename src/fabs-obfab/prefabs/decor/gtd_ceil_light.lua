PREFABS.Light_gtd_A =
{
  file   = "decor/gtd_ceil_light.wad"
  map    = "MAP01"

  prob   = 1
  theme  = "!hell"
  env    = "building"

  kind   = "light"
  where  = "point"

  height = 128

  bound_z1 = -32
  bound_z2 = 0

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}
