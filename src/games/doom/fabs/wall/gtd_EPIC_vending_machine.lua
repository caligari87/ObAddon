PREFABS.Decor_EPIC_vending_machine =
{
  file   = "wall/gtd_EPIC_vending_machine.wad"
  map    = "MAP01"

  prob   = 8
  theme  = "!hell"
  env    = "!outdoor"

  uses_epic_textures = true

  on_liquids = "never"

  where  = "edge"
  deep   = 52
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "top"

  tex_OBVNMCH1 =
  {
    OBVNMCH1 = 50
    OBVNMCH2 = 50
    OBVNMCH3 = 50
    OBVNMCH4 = 50
    OBVNMCH5 = 50
  }

  sector_1 =
  {
    [0]=90
    [1]=10
    [2]=5
    [3]=5
  }
}
