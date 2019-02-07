--
-- Closet with a secret item visible from outside
--

PREFABS.Item_secret_ledge =
{
  file  = "item/secret_ledge.wad"
  where = "seeds"

  prob  = 1000
  env   = "building"
  theme = "!tech"

  key   = "secret"

  seed_w = 3
  seed_h = 1
  height = 160

  deep =  16
  over = -16

  x_fit = "frame"
  y_fit = "top"

  flat_CEIL3_1 = { CEIL3_1=50, CEIL3_2=50, FLOOR0_1=50, FLAT5_5=50, FLAT5=50, FLOOR0_2=50, FLOOR4_6=50, FLOOR5_3=50 }
  tex_STEP2 = { STEP2=50, STEP6=50 }
  tex_METAL2 = { METAL2=50, TEKWALL1=50, TEKWALL4=50, BROWN144=50 }

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=15, [1]=50, [2]=10, [3]=10, [8]=50 }

}

PREFABS.Item_secret_ledge2 =
{
  template  = "Item_secret_ledge"
  theme = "tech"

  tex_SUPPORT3 = "DOORSTOP"
}
