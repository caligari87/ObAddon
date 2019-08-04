-- quake-inspired exit gate

PREFABS.Exit_scionox_quakeish_gate_exit =
{
  file   = "exit/scionox_quakeish_gate_exit.wad"
  map    = "MAP01"

  prob   = 250

  theme = "hell"

  where  = "seeds"

  uses_epic_textures = true

  seed_w = 3
  seed_h = 2

  deep   = 16

  x_fit  = "frame"
  y_fit  = "top"
  
  tex_EVILFAC2 = { EVILFAC2=50, EVILFAC4=50, EVILFAC5=50, EVILFAC6=50, EVILFAC7=50, EVILFAC8=50, EVILFAC9=50, EVILFACA=50 }
}
PREFABS.Exit_scionox_quakeish_gate_exit_2 =
{
  template = "Exit_scionox_quakeish_gate_exit"
  tex_BODIESC = "BODIESB"
  flat_BODIESF2 = "BODIESFL"
}
