--Original vending machine fab is used as a base
PREFABS.Door_EPIC_vending_machine_secret =
{
  file   = "door/scionox_gtd_EPIC_vending_machine.wad"
  map    = "MAP01"

  prob   = 15
  theme  = "!hell"
  env    = "!outdoor"

  uses_epic_textures = true

  on_liquids = "never"

  where  = "edge"
  key    = "secret"
  deep   = 48
  over   = 16

  bound_z1 = 0
  bound_z2 = 128

  x_fit  = "frame"
  z_fit  = "top"

  tex_OBVNMCH1 =
  {
    OBVNMCH1 = 50
    OBVNMCH2 = 50
    OBVNMCH3 = 50
    OBVNMCH4 = 50
    OBVNMCH5 = 50
  }
}
