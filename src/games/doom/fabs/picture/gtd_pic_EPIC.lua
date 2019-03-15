PREFABS.Pic_EPIC_box_gothic_big =
{
  file   = "picture/gtd_pic_EPIC.wad"
  map    = "MAP01"

  prob  = 40 * 7
  env   = "building"
  theme = "!tech"

  uses_epic_textures = true

  where  = "seeds"
  seed_w = 2
  seed_h = 1

  height = 160
  deep   =  16
  over   = -16

  x_fit = "frame"
  y_fit = "top"

  tex_GLASS1 =
  {
    GLASS1 = 50
    GLASS2 = 50
    GLASS3 = 50
    GLASS4 = 50
    GLASS5 = 20 --Black glass looks poor, reduced prob
    GLASS6 = 50
    GLASS8 = 50
  }

  sector_1 = 0
  line_2   = 0

  offset_1 = 0
  offset_2 = 0
}

PREFABS.Pic_EPIC_box_gothic_tall =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP02"

  prob = 40 * 5

  seed_w = 1

  tex_GLASS11 =
  {
    GLASS9 = 50
    GLASS11 = 50
    GLASS12 = 50
    GLASS13 = 50
    GLASS14 = 50
  }
}

PREFABS.Pic_EPIC_box_gothic_semibig =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP03"

  prob = 40 * 2

  seed_w = 1

  tex_GLASS10 =
  {
    GLASS10 = 50
    GLASS7 = 50
  }
}

PREFABS.Pic_EPIC_box_skeletons =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 35 * 8

  theme = "hell"

  seed_w = 2

  tex_GLASS1 =
  {
   DEATH1 = 50
   DEATH2 = 50
   DEATH3 = 50
   GUY1   = 25
   PENTA1 = 5
  }
}

PREFABS.Pic_EPIC_box_lavawall =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 25 * 7

  theme = "hell"

  seed_w = 2

  tex_GLASS1 =
  {
   LFAL21 = 50
   LFALL1 = 50
  }
}

PREFABS.Pic_EPIC_box_marblefaces =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 30 * 7

  theme = "hell"

  seed_w = 2

  tex_GLASS1 =
  {
   MARBFAB1 = 50
   MARBFAB2 = 50
   MARBFAB3 = 50
   MARBFAC5 = 50
   MARBFAC6 = 50
   MARBFAC7 = 50
   MARBFACF = 50
  }
}

PREFABS.Pic_EPIC_box_wallofskulls =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 35 * 8

  theme = "hell"

  seed_w = 2

  tex_GLASS1 =
  {
   SKULLS  = 50
   SKULLS2 = 50
   BODIESB = 50
   SKULLS3 = 50
   SKULLS4 = 50
  }
}

PREFABS.Pic_EPIC_box_doom2bodies =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 30 * 8

  theme = "hell"

  seed_w = 2

  tex_GLASS1 =
  {
   SPDUDE7 = 50
   SPDUDE8 = 50
  }
}

-- Some of these we could probably implement into the bloodgutters prefab as a variant
-- since it has a hanging corpse textures that were used in Doom1 and removed during
-- Doom 2 development.
PREFABS.Pic_EPIC_box_gothic_hangingbodies =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP03"

  prob = 30 * 2

  theme = "hell"

  seed_w = 1

  tex_GLASS10 =
  {
   SPDUDE3 = 50 -- Doom1 exclusive
   SPDUDE6 = 50 -- Doom1 exclusive
   SP_DUDE4 = 30
   SP_DUDE5 = 30
  }
}

PREFABS.Pic_EPIC_box_small_facesofevil =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP04"

  prob = 40 * 9

  height = 128

  theme = "hell"

  seed_w = 1

  tex_COMPSA1 =
  {
   EVILFAC2 = 50
   EVILFAC4 = 50
   EVILFAC5 = 50
   EVILFAC6 = 50
   EVILFAC7 = 50
  }
}

PREFABS.Pic_EPIC_box_metal_big =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 40 * 8

  theme = "tech"

  seed_w = 2

  tex_GLASS1 =
  {
    COMPCT01 = 50
    COMPCT02 = 50
    COMPCT03 = 50
    COMPCT04 = 50
    COMPCT05 = 50
    COMPCT06 = 50
    SHAWVENT = 50
    SHAWVEN2 = 50
    CGCANI00 = 50
  }
}

PREFABS.Pic_EPIC_box_bishop =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 30 * 8

  theme = "!tech"

  seed_w = 2

  tex_GLASS1 =
  {
   BISHOP = 100
   GOTH50 = 25
  }
}

PREFABS.Pic_EPIC_box_metal_big =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 40 * 8

  theme = "tech"

  seed_w = 2

  tex_GLASS1 =
  {
    COMPCT01 = 50
    COMPCT02 = 50
    COMPCT03 = 50
    COMPCT04 = 50
    COMPCT05 = 50
    COMPCT06 = 50
    SHAWVENT = 50
    SHAWVEN2 = 50
    CGCANI00 = 50
  }
}

PREFABS.Pic_EPIC_box_metal_big_bunchacomputers =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 40 * 8

  theme = "tech"

  seed_w = 2

  tex_GLASS1 =
  {
    CONSOLE4 = 50
    CONSOLE6 = 50
    CONSOLE7 = 25
    CONSOLE8 = 50
    CONSOLE9 = 25
    CONSOLEA = 50
    CONSOLEB = 50
    CONSOLEC = 50
    CONSOLED = 50
    CONSOLEE = 50
    CGCANI00 = 50
    NOISE1   = 50
  }
}

PREFABS.Pic_EPIC_box_static =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP04"

  prob = 25 * 10

  height = 128

  theme = "tech"

  seed_w = 1

  tex_COMPSA1 =
  {
   NOISE2A = 50
   NOISE3A = 50
   TVSNOW01 = 50
  }
}

PREFABS.Pic_EPIC_box_metal_small =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP04"

  prob = 40 * 10

  height = 128

  theme = "tech"

  seed_w = 1

  tex_COMPSA1 =
  {
    COMPSA1 = 50
    COMPSC1 = 50
    COMPSD1 = 50
    COMPY1 = 50
    COMPFUZ1 = 50
    COMPU1 = 50
    COMPU2 = 50
    COMPU3 = 50
    COMPVENT = 50
    COMPVEN2 = 50
    NMONIA1 = 50
  }
}

PREFABS.Pic_EPIC_box_metal_wide =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP05"

  prob = 40 * 9

  height = 128

  theme = "tech"

  seed_w = 2

  tex_COMPSTA3 =
  {
    COMPSTA3 = 50
    COMPSTA4 = 50
    COMPSTA5 = 50
    COMPSTA6 = 50
    COMPSTA7 = 50
    COMPSTA8 = 50
    COMPSTA9 = 50
    COMPSTAA = 50
    COMPSTAB = 50
  }
}

PREFABS.Pic_EPIC_box_silverwall =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 25 * 7

  theme = "tech"

  seed_w = 2

  tex_GLASS1 =
  {
   SILVER2 = 50
   SILVER2G = 50
   SILVER2O = 50
   SILVER2R = 50
   SILVER2W = 50
   SILVER2Y = 50
  }
}