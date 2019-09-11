--Based on gtd_pic_tech_controlroom
PREFABS.Joiner_control_room_secret =
{
  file   = "joiner/scionox_secrets_tech.wad"
  map    = "MAP01"

  prob   = 25
  theme  = "tech"

  env    = "building"
  key    = "secret"

  where  = "seeds"
  shape  = "I"

  seed_w = 3
  seed_h = 2

  deep = 16
  over = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  y_fit = { 248,264 }

  sector_1  = { [0]=70, [1]=20, [2]=5, [3]=5, [8]=10 }

}

PREFABS.Joiner_control_room_secret_2 =
{
  template = "Joiner_hell_control_room_secret"

  tex_SILVER3 = "COMPSPAN"
  tex_COMPSTA1 = "SPACEW3"
  tex_COMPSTA2 = "SPACEW3"
}
