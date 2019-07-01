PREFABS.Window_open_1 =
{
  file   = "window/gtd_window_full_open.wad"
  map    = "MAP01"

  group  = "gtd_window_full_open"
  prob   = 50

  passable = true

  where  = "edge"
  seed_w = 1

  height = 24
  deep   = 16
  over   = 16

  bound_z1 = 0
  bound_z2 = 24
}

PREFABS.Window_open_2 =
{
  template = "Window_open_1"
  map      = "MAP02"

  seed_w   = 2
}

PREFABS.Window_open_3 =
{
  template = "Window_open_1"
  map      = "MAP03"

  seed_w   = 3
}

PREFABS.Window_open_4 =
{
  template = "Window_open_1"
  map      = "MAP03"

  seed_w   = 4
}
