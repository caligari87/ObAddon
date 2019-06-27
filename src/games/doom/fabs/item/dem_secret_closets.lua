--
--  Secret items closets
--

--a secret aera in a garage you need to duck
PREFABS.Item_secret_garage_closet =
{
  file  = "item/dem_secret_closets.wad"
  map   = "MAP01"

  engine = "zdoom"

  theme = "urban"
  env   = "outdoor"
  prob  = 100

  key   = "secret"

  where  = "seeds"
  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit  = "frame"

  tex_BRICK9 = {
    BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK3=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
    STONE3=50, BRICK12=50, BRICK5=50,
    BRONZE1=50, BROWN1=50, BROWN96=50,
    BROWNGRN=50, CEMENT7=50,
    CEMENT9=50
    }

  can_flip = true
}

--a secret in a grocery store, shoot the electric panel
PREFABS.Item_secret_store_closet =
{
  file  = "item/dem_secret_closets.wad"
  map   = "MAP02"

  engine = "zdoom"

  theme = "urban"
  env   = "outdoor"
  prob  = 100

  key   = "secret"

  where  = "seeds"
  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit  = "frame"

  can_flip = true

  tex_BRICK9 = {
    BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK3=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    STONE2=50, STUCCO=50, STUCCO1=50,
    STUCCO3=50, TANROCK2=50, TANROCK3=50,
    SHAWN2=50
  }

  thing_59 =
  {
    hang_twitching = 50
    hang_torso = 50
    hang_leg   = 50
    hang_leg_gone = 50
  }

  thing_62 =
  {
    hang_twitching = 50
    hang_torso = 50
    hang_leg   = 50
    hang_leg_gone = 50
  }

  thing_12 =
  {
    hang_twitching = 50
    hang_torso = 50
    hang_leg   = 50
    hang_leg_gone = 50
  }

}
