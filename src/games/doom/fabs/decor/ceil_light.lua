--
-- Simple ceiling light
--

PREFABS.Light_basic =
{
  file   = "decor/ceil_light.wad"
  map    = "MAP01"

  prob   = 1
  env    = "building"

  kind   = "light"
  where  = "point"

  height = 96

  bound_z1 = -32
  bound_z2 = 0

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}


----------- URBAN THEME ------------------------


PREFABS.Light_urban1 =
{
  template = "Light_basic"
  -- use outie style

  prob   = 50
  theme  = "urban"

  flat_TLITE6_4 = "CEIL1_3"
   tex_METAL    = "WOOD10"

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }
}


PREFABS.Light_urban2 =
{
  template = "Light_basic"
  map    = "MAP02"

  prob   = 25
  theme  = "urban"

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}


PREFABS.Light_urban3 =
{
  template = "Light_basic"
  map      = "MAP02"

  prob   = 50
  theme  = "urban"

  flat_TLITE6_1 = "FLAT2"

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}


----------- TECH THEME ------------------------


PREFABS.Light_tech1 =
{
  template = "Light_basic"
  map      = "MAP02"

  prob   = 100
  theme  = "tech"

  flat_TLITE6_1 = "TLITE6_5"
  flat_CEIL5_2  = "FLAT23"
  tex_METAL = "SHAWN2"

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}


PREFABS.Light_tech2 =
{
  template = "Light_basic"
  map      = "MAP02"

  prob   = 50
  theme  = "tech"

  flat_TLITE6_1 = "TLITE6_6"
  flat_CEIL5_2  = "FLAT23"
  tex_METAL = "SHAWN2"

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}


PREFABS.Light_tech_red =
{
  template = "Light_basic"
  map      = "MAP02"

  prob   = 50
  theme  = "tech"

  flat_TLITE6_1 = "FLOOR1_7"
  flat_CEIL5_2  = "FLAT23"
  tex_METAL = "SHAWN2"

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}


PREFABS.Light_tech_green =
{
  template = "Light_basic"
  map      = "MAP02"

  prob   = 50
  theme  = "tech"

  flat_TLITE6_1 = "GRNLITE1"
  flat_CEIL5_2  = "FLAT23"
  tex_METAL = "SHAWN2"

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}


PREFABS.Light_tech_blue =
{
  template = "Light_basic"
  -- use outie style

  prob   = 50
  theme  = "tech"

  flat_TLITE6_4 = "FLAT22"
   tex_METAL    = "SHAWN2"

  -- use the occasional-blink FX (fairly rarely)
  sector_1  = { [0]=90, [1]=15 }

}

