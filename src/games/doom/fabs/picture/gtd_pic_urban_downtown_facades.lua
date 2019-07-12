PREFABS.Pic_urban_downtown_facade1_vanilla =
{
  file   = "picture/gtd_pic_urban_downtown_facades.wad"
  map    = "MAP01"

  prob   = 300
  theme  = "urban"

  env    = "outdoor"

  seed_w = 2
  seed_h = 1

  where  = "seeds"
  deep   = 16
  over   = -16

  height = 256

  y_fit  = "top"
  x_fit  = { 124,132 }

  tex_CITY01 =
  {
    MODWALL2 = 50
    MODWALL3 = 50
    MODWALL4 = 50
    BLAKWAL1 = 50
    BLAKWAL2 = 50
  }

  flat_TLITE6_6 =
  {
    TLITE6_5 = 25
    TLITE6_6 = 25
  }

  -- textures for the top half of the 'door' area
  tex_MODWALL3 =
  {
    MODWALL2 = 50
    MODWALL3 = 50
    MODWALL4 = 50
    BLAKWAL1 = 50
    BLAKWAL2 = 50
  }

  -- textures for the bottom half (and all of the 'doors' in facade2)
  tex_MODWALL4 =
  {
    MODWALL2 = 50
    MODWALL3 = 50
    MODWALL4 = 50
    BLAKWAL1 = 50
    BLAKWAL2 = 50
    STEP1 = 50
    STEP2 = 50
    STEP3 = 50
    STEP4 = 50
    STEP5 = 50
    STEPLAD1 = 50
  }

  tex_STEP4 =
  {
    STEP1=50
    STEP2=50
    STEP3=50
    STEP4=50
    STEP5=50
    STEP6=50
    STEPLAD1=50
    COMPBLUE=50
    REDWALL=50
  }
}

PREFABS.Pic_urban_downtown_facade2_vanilla =
{
  template = "Pic_urban_downtown_facade1_vanilla"
  map      = "MAP02"
}

PREFABS.Pic_urban_downtown_facade1_EPIC =
{
  file   = "picture/gtd_pic_urban_downtown_facades.wad"
  map    = "MAP01"

  prob   = 300
  theme  = "urban"

  env    = "outdoor"

  replaces = "Pic_urban_downtown_facade1_vanilla"

  uses_epic_textures = true

  seed_w = 2
  seed_h = 1

  where  = "seeds"
  deep   = 16
  over   = -16

  height = 256

  y_fit  = "top"
  x_fit  = { 124,132 }

  tex_CITY01 =
  {
    MODWALL2 = 25
    MODWALL3 = 25
    MODWALL4 = 25
    BLAKWAL1 = 25
    BLAKWAL2 = 25
    CITY01 = 50
    CITY02 = 50
    CITY03 = 50
    CITY04 = 50
    CITY05 = 50
    CITY06 = 50
    CITY07 = 50
    CITY08 = 50
    CITY09 = 50
    CITY10 = 50
  }

  flat_TLITE6_6 =
  {
    TLITE5_2 = 25
    TLITE5_3 = 25
    TLITE6_5 = 25
    TLITE6_6 = 25
    TLITE65B = 25
    TLITE65G = 25
    TLITE65O = 25
    TLITE65W = 25
    TLITE65Y = 25
    GLITE04 = 50
    GLITE06 = 50
    GLITE07 = 50
    GLITE08 = 50
    GLITE09 = 50
    LIGHTS1 = 50
    LIGHTS2 = 50
    LIGHTS3 = 50
    LIGHTS4 = 50
  }

  -- textures for the top half of the 'door' area
  tex_MODWALL3 =
  {
    MODWALL2 = 50
    MODWALL3 = 50
    MODWALL4 = 50
    BLAKWAL1 = 50
    BLAKWAL2 = 50
    TEKWALL8 = 15
    TEKWALL9 = 15
    TEKWALLA = 15
    TEKWALLB = 15
    TEKWALLC = 15
    TEKWALLD = 15
    TEKWALLE = 15
    COLLITE1 = 50
    COLLITE2 = 50
    COLLITE3 = 50
  }

  -- textures for the bottom half (and all of the 'doors' in facade2)
  tex_MODWALL4 =
  {
    MODWALL2 = 50
    MODWALL3 = 50
    MODWALL4 = 50
    BLAKWAL1 = 50
    BLAKWAL2 = 50
    STEP1 = 50
    STEP2 = 50
    STEP3 = 50
    STEP4 = 50
    STEP5 = 50
    STEPLAD1 = 50
    URBAN6 = 175
    URBAN8 = 175
  }

  tex_STEP4 =
  {
    STEP1=50
    STEP2=50
    STEP3=50
    STEP4=50
    STEP5=50
    STEP6=50
    STEPLAD1=50
    COMPBLUE=50
    REDWALL=50
  }
}

PREFABS.Pic_urban_downtown_facade2_EPIC =
{
  template = "Pic_urban_downtown_facade1_EPIC"
  map      = "MAP02"

  replaces = "Pic_urban_downtown_facade2_vanilla"
}
