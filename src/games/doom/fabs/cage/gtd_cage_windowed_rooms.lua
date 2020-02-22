PREFABS.Cage_wall_windowed_rooms_square =
{
  file   = "cage/gtd_cage_windowed_rooms.wad"
  map   = "MAP01"

  prob  = 250
  skip_prob = 33

  theme  = "!hell"

  where  = "seeds"
  shape  = "U"

  height = 128

  seed_w = 2
  seed_h = 1

  deep   =  16

  x_fit = { 24,72 , 104,152 , 184,232 }
  y_fit = "top"
}

PREFABS.Cage_wall_windowed_rooms_square_hell =
{
  template = "Cage_wall_windowed_rooms_square"

  theme    = "hell"

  tex_DOOR1 = "WOODMET1"
}

PREFABS.Cage_wall_windowed_rooms_barred =
{
  template = "Cage_wall_windowed_rooms_square"
  map = "MAP02"

  x_fit = "frame"
}


PREFABS.Cage_wall_windowed_rooms_barred_hell =
{
  template = "Cage_wall_windowed_rooms_square"
  map = "MAP02"

  theme = "hell"
  tex_DOOR1 = "WOODMET1"

  x_fit = "frame"
}

PREFABS.Cage_wall_windowed_rooms_open =
{
  template = "Cage_wall_windowed_rooms_square"
  map = "MAP03"

  x_fit = {24,232}
}


PREFABS.Cage_wall_windowed_rooms_open_hell =
{
  template = "Cage_wall_windowed_rooms_square"
  map = "MAP03"

  theme = "hell"
  tex_DOOR1 = "WOODMET1"

  x_fit = {24,232}
}
