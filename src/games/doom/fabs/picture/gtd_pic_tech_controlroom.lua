PREFABS.Pic_control_room =
{
  file   = "picture/gtd_pic_tech_controlroom.wad"
  map    = "MAP01"

  prob   = 50 --35
  theme = "tech"
  
  env = "building"
  
  where  = "seeds"
  height = 128
  
  seed_w = 3
  seed_h = 1
  
  deep = 16
  over = -16
  
  bound_z1 = 0
  bound_z2 = 128
  
  x_fit = "frame"
  y_fit = "top"
}

PREFABS.Pic_control_room_small_monitors =
{
  template = "Pic_control_room"
  
  tex_SILVER3 = "COMPSPAN"
  tex_COMPSTA1 = "SPACEW3"
  tex_COMPSTA2 = "SPACEW3"
}