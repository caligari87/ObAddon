--
-- Joiners for urban
--

--a living room joiner
PREFABS.Joiner_living_room =
{
  file   = "joiner/dem_urban_joiners.wad"
  map    = "MAP01"

  engine = "zdoom"

  prob   = 1000

  theme  = "urban"

  env      = "outdoor"
  neighbor = "building"

  where  = "seeds"
  shape  = "I"

  seed_w = 3
  seed_h = 2

  deep = 16
  over = 16

  x_fit = "frame"
  y_fit  = "frame"

  can_flip = true

  tex_BRICK9 = {
    BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK3=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
    STUCCO=50,  STUCCO1=50,  STUCCO3=50
  }
}

--a kitchen joiner
PREFABS.Joiner_kitchen =
{
  file = "joiner/dem_urban_joiners.wad"
  map = "MAP02"

  prob = 1000

  theme = "urban"

  env      = "outdoor"
  neighbor = "outdoor"

  where = "seeds"
  shape = "I"

  seed_w = 2
  seed_h = 3

  deep = 16
  over = 16

  x_fit = "frame"
  y_fit  = "frame"

  can_flip = true

  tex_BRICK9 = {
    BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK3=50, BRICK4=50,
     BRICK6=50, BRICK7=50, BRICK8=50,
     BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
     STUCCO=50, STUCCO1=50, STUCCO3=50
    }
}
