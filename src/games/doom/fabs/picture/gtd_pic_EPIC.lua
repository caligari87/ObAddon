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
    GLASS5 = 50
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

PREFABS.Pic_EPIC_box_metal_big =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP01"

  prob = 40 * 8

  theme = "!hell"

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
  }
}

PREFABS.Pic_EPIC_box_metal_small =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP04"

  prob = 40 * 10

  height = 128

  theme = "!hell"

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
  }
}

PREFABS.Pic_EPIC_box_metal_wide =
{
  template = "Pic_EPIC_box_gothic_big"
  map = "MAP05"

  prob = 40 * 9

  height = 128

  theme = "!hell"

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
