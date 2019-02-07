PREFABS.Wall_hell_vaults_plain =
{
  file   = "wall/gtd_wall_hell_vaults.wad"
  map    = "MAP01"

  prob   = 50
  theme  = "hell"
  env = "building"

  group = "gtd_wall_hell_vaults"

  where  = "edge"
  deep   = 16
  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "bottom"
}

PREFABS.Wall_hell_vaults_windowed =
{
  template = "Wall_hell_vaults_plain"

  map = "MAP02"

  prob = 20
}

PREFABS.Wall_hell_vaults_diag =
{
  file   = "wall/gtd_wall_hell_vaults.wad"
  map    = "MAP03"

  prob   = 50
  theme = "hell"
  group = "gtd_wall_hell_vaults"

  where  = "diagonal"

  height = 128

  bound_z1 = 0
  bound_z2 = 128

  z_fit  = "bottom"
}
