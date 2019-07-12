-- Joiner Inside-to-outside

PREFABS.Joiner_ScionoxGuardpost =
{
  file   = "joiner/ScionoxGuardpost.wad"
  map    = "MAP01"

  prob   = 100
  theme  = "!hell"
  style  = "doors"
 
  env    = "building"
  neighbor = "!building"

  where  = "seeds"
  shape  = "I"

  seed_w = 2
  seed_h = 2

  deep   = 16
  over   = 16

  x_fit  = "frame"
  y_fit  = "frame"
  
  tex_COMPSTA1 = { COMPSTA1=50, COMPSTA2=50 }
  tex_GRAY5 = { GRAY5=50, BIGBRIK2=50, BLAKWAL2=50, MODWALL3=50, METAL2=50, SHAWN2=50 }
  flat_FLOOR4_6 = { FLOOR4_6=50, FLOOR1_1=50, FLOOR0_3=50, FLAT5=50 }
  flat_CEIL5_1 = { CEIL5_1=50, CEIL3_3=50, CEIL4_2=50, CEIL5_2=50 }
}

-- Joiner Outside-to-inside

PREFABS.Joiner_ScionoxGuardpost2 =
{
  template = "Joiner_ScionoxGuardpost"
  map    = "MAP02"
 
  env    = "!building"
  neighbor = "building"
}

-- Joiner Inside-to-outside Blue

PREFABS.Joiner_ScionoxGuardpostBlue =
{
  template = "Joiner_ScionoxGuardpost"
  map    = "MAP03"
 
  key    = "k_blue"
}

-- Joiner Inside-to-outside Red

PREFABS.Joiner_ScionoxGuardpostRed =
{
  template = "Joiner_ScionoxGuardpost"
  map    = "MAP03"
 
  key    = "k_red"
  tex_DOORBLU = "DOORRED"
  line_133     = 135
}

-- Joiner Inside-to-outside Yellow

PREFABS.Joiner_ScionoxGuardpostYellow =
{
  template = "Joiner_ScionoxGuardpost"
  map    = "MAP03"
 
  key    = "k_yellow"
  tex_DOORBLU = "DOORYEL"
  line_133     = 137
}

-- Joiner Inside-to-outside All

PREFABS.Joiner_ScionoxGuardpostAll =
{
  template = "Joiner_ScionoxGuardpost"
  map    = "MAP04"
 
  key    = "k_ALL"
}

-- Joiner Inside-to-outside Trapped

PREFABS.Joiner_ScionoxGuardpostTrapped =
{
  template = "Joiner_ScionoxGuardpost"
  map    = "MAP05"
  seed_w = 3
}