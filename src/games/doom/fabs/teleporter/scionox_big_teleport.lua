-- 2x2 GATE teleport, tech-only for now

PREFABS.Teleporter_scionox_big_teleport =
{
  file   = "teleporter/scionox_big_teleport.wad"
  map    = "MAP01"
  prob   = 50

  theme  = "tech"
  where  = "seeds"

  seed_w = 3
  seed_h = 2

  deep  =  16

  x_fit = "frame"
  y_fit = "top"

  tag_1 = "?out_tag"
  tag_2 = "?in_tag"

  sector_8  = { [8]=50, [1]=10, [2]=10, [3]=10, [17]=10 }
}
