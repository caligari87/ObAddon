--
--  item closets
--

--a item in a maze of mirrors1 in hell
PREFABS.Item_mirrormaze_closet =
{
  file  = "item/dem_item_closets.wad"
  map   = "MAP01"

  engine = "zdoom"

  theme = "hell"
  prob  = 100

  where  = "seeds"
  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit  = "frame"
}

--a item in a maze of mirrors2 in hell
PREFABS.Item_mirrormaze2_closet =
{
  file  = "item/dem_item_closets.wad"
  map   = "MAP02"

  engine = "zdoom"

  theme = "hell"
  prob  = 100

  where  = "seeds"
  seed_w = 2
  seed_h = 3

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit  = "frame"
}

--a item on a shrine in a rift in hell
PREFABS.Item_rift_closet =
{
  file  = "item/dem_item_closets.wad"
  map   = "MAP03"

  engine = "zdoom"

  theme = "hell"
  prob  = 100

  where  = "seeds"
  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit  = "frame"

  uses_epic_textures = true

  thing_63 =
  {
    hang_twitching = 50
    hang_torso = 50
    hang_leg   = 50
    hang_leg_gone = 50
  }

  thing_28 =
  {
    skull_pole = 50
    skull_kebab = 50
    skull_cairn = 50
    impaled_human = 50
    impaled_twitch = 50
    evil_eye = 50
    skull_rock = 50
    big_tree = 50
    burnt_tree = 50

  }

  thing_25 =
  {
    skull_pole = 50
    skull_kebab = 50
    skull_cairn = 50
    impaled_human = 50
    impaled_twitch = 50
    evil_eye = 50
    skull_rock = 50
    big_tree = 50
    burnt_tree = 50

  }

}

--an item forgotten in a grocery store
PREFABS.Item_grocerystore_closet =
{
  file  = "item/dem_item_closets.wad"
  map   = "MAP04"

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
    BRICK2=50, BRICK4=50,
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

--an elevator shaft with an item
PREFABS.Item_elevatorshaft_closet =
{
  file   = "item/dem_item_closets.wad"
  map    = "MAP05"

  engine = "zdoom"

  prob   = 50

  theme  = "!hell"

  env      = "building"

  where  = "seeds"
  seed_w = 2
  seed_h = 2

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit  = "frame"

  uses_epic_textures = true

  tex_BROWN1 = {
	GRAY1=50, GRAY4=50, GRAY5=50, GRAY6=50,
	GRAY7=50, GRAY8=50, GRAY9=50, CEMENT3=50,
	CEMENT5=50, CEMENT6=50, CEMENT7=50,
	CEM01=50, CEM07=50, CEM09=50, PIPE2=50,
	PIPE4=50, SLADWALL=50, TEKLITE=50, BROWN3=50,
	MET2=50, MET6=50, MET7=50, PIPEDRK1=50,
	SHAWGRY4=50, SHAWN01C=50, SHAWN01F=50,
	SHAWVEN2=50, SHAWVENT=50
  }
}

--a corrupted elevator shaft with an item
PREFABS.Item_elevatorshaftcorr_closet =
{
  file   = "item/dem_item_closets.wad"
  map    = "MAP06"

  engine = "zdoom"
  prob   = 50

  theme  = "!hell"
  env    = "building"
  where  = "seeds"

  seed_w = 2
  seed_h = 2

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit = "top"

  uses_epic_textures = true

  tex_BROWN1 = {
    GRAY1=50, GRAY4=50, GRAY5=50, GRAY6=50,
    GRAY7=50, GRAY8=50, GRAY9=50, CEMENT3=50,
    CEMENT5=50, CEMENT6=50, CEMENT7=50,
    CEM01=50, CEM07=50, CEM09=50, PIPE2=50,
    PIPE4=50, SLADWALL=50, TEKLITE=50, BROWN3=50,
    MET2=50, MET6=50, MET7=50, PIPEDRK1=50,
    SHAWGRY4=50, SHAWN01C=50, SHAWN01F=50,
    SHAWVEN2=50, SHAWVENT=50
  }
}

--a living room with an item
PREFABS.Item_living_room_closet =
{
  file   = "item/dem_item_closets.wad"
  map    = "MAP07"

  engine = "zdoom"

  prob   = 2000

  theme  = "urban"

  env      = "outdoor"

  where  = "seeds"
  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  x_fit = "frame"
  y_fit = "frame"

  tex_BRICK9 = {
    BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
    STUCCO=50,  STUCCO1=50,  STUCCO3=50
  }
}

--a kitchen with an item hidden behind the table
PREFABS.Item_kitchen_closet =
{
  file = "item/dem_item_closets.wad"
  map = "MAP08"

  prob = 2000

  theme = "urban"

  env      = "outdoor"

  where = "seeds"

  seed_w = 2
  seed_h = 3

  deep = 16

  x_fit = "frame"
  y_fit  = "frame"

  tex_BRICK9 = {
    BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK4=50,
     BRICK6=50, BRICK7=50, BRICK8=50,
     BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
     STUCCO=50, STUCCO1=50, STUCCO3=50
    }
}

--a bedroom with an hidden item
PREFABS.Item_bedroom_closet =
{
  file = "item/dem_item_closets.wad"
  map = "MAP09"

  prob = 2000

  theme = "urban"

  engine = "zdoom"

  env      = "outdoor"

  where = "seeds"

  seed_w = 3
  seed_h = 2

  deep = 16

  x_fit = "frame"
  y_fit  = "frame"

  uses_epic_textures = true

  tex_BRICK9 = {
    BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK4=50,
     BRICK6=50, BRICK7=50, BRICK8=50,
     BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
     STUCCO=50, STUCCO1=50, STUCCO3=50
    }
}


--an appartment stairwell with a ritual and an item
PREFABS.Item_stairwell_closet =
{
  file = "item/dem_item_closets.wad"
  map = "MAP10"

  prob = 4500

  theme = "urban"

  engine = "zdoom"

  env      = "outdoor"

  where = "seeds"

  seed_w = 2
  seed_h = 3

  deep = 16

  x_fit = "frame"
  y_fit  = "frame"

  tex_BRICK9 = {
    BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK4=50,
     BRICK6=50, BRICK7=50, BRICK8=50,
     BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
     STUCCO=50, STUCCO1=50, STUCCO3=50
    }
}

--a bar with an item hidden behind of it
PREFABS.Item_bar_closets =
{
  file = "item/dem_item_closets.wad"
  map    = "MAP11"

  engine = "zdoom"

  prob   = 2000

  theme  = "urban"
  env      = "outdoor"
  where  = "seeds"

  seed_w = 3
  seed_h = 2

  deep = 16

  x_fit = "frame"
  y_fit  = "frame"

  uses_epic_textures = true

  tex_STARTAN1 = {
    BRICK1=50, BRICK12=50, BRICK11=50,
    BRICK2=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    STONE2=50, SHAWN4=50, SHAWN5=50,
    STUCCO=50,  STUCCO1=50,  STUCCO3=50, STARGR1=50, GRAY7=50,
    PANEL6=50, BRIKS40=50, BRIKS43=50,
    GOTH16=50, GOTH31=50, WD03=50
  }
}

--a waiting room with an item on the desk
PREFABS.Item_waiting_room_closets =
{
  file = "item/dem_item_closets.wad"
  map    = "MAP12"

  engine = "zdoom"

  prob   = 2000

  theme  = "urban"

  env      = "outdoor"

  where  = "seeds"

  seed_w = 3
  seed_h = 2

  deep = 16

  x_fit = "frame"
  y_fit  = "frame"

  uses_epic_textures = true

  tex_STARTAN1 = {
    BRICK1=50, BRICK12=50, BRICK11=50,
    BRICK2=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    STONE2=50, SHAWN4=50, SHAWN5=50,
    STUCCO=50,  STUCCO1=50,  STUCCO3=50, STARGR1=50, GRAY7=50,
    PANEL6=50, BRIKS40=50, BRIKS43=50,
    GOTH16=50, GOTH31=50, WD03=50
  }

  tex_CPAQLRRE = {
    CPAQLRRE=50, CPGARDEN=50, CPGARDN2=50,
    CPHRSEMN=50, CPHRSMN2=50
  }
}

--a raided electronic store with an item
PREFABS.Item_electronic_store_closets =
{
  file = "item/dem_item_closets.wad"
  map    = "MAP13"

  engine = "zdoom"

  prob   = 2000
  theme  = "urban"
  env      = "outdoor"
  where  = "seeds"

  seed_w = 3
  seed_h = 2

  deep = 16

  x_fit = "frame"
  y_fit  = "frame"

  uses_epic_textures = true

  tex_STARTAN1 = {
    BRICK1=50, BRICK12=50, BRICK11=50,
    BRICK2=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    STONE2=50, SHAWN4=50, SHAWN5=50,
    STUCCO=50,  STUCCO1=50,  STUCCO3=50, STARGR1=50,
    PANEL6=50, BRIKS40=50, BRIKS43=50,
    GOTH16=50, GOTH31=50, WD03=50
  }

}

--a raided cornerstore with only one item remaining
PREFABS.Item_cornerstore_closets =
{
  file = "item/dem_item_closets.wad"
  map    = "MAP14"

  engine = "zdoom"

  prob   = 2000

  theme  = "urban"

  env      = "outdoor"

  where  = "seeds"

  seed_w = 2
  seed_h = 3

  deep = 16

  x_fit = "frame"
  y_fit  = "frame"

  uses_epic_textures = true

  tex_STARTAN1 = {
    BRICK1=50, BRICK12=50, BRICK11=50,
    BRICK2=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    STONE2=50, STUCCO=50,  STUCCO1=50,
    STUCCO3=50, STARGR1=50,
    PANEL6=50, BRIKS40=50, BRIKS43=50,
    GOTH31=50, BRICK9=50,
    BRICK10=50,TANROCK2=50, TANROCK3=50
  }

}

--a fairly intact bookstore with an item inside
PREFABS.Item_bookstore_closets =
{
  file = "item/dem_item_closets.wad"
  map    = "MAP15"

  engine = "zdoom"

  prob   = 2000

  theme  = "urban"

  env      = "outdoor"

  where  = "seeds"

  seed_w = 2
  seed_h = 3

  deep = 16

  x_fit = "frame"
  y_fit  = "frame"

  uses_epic_textures = true

  tex_STARTAN1 = {
    BRICK1=50, BRICK12=50,
    BRICK2=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    STUCCO=50, STUCCO1=50,
    STUCCO3=50, BRIKS43=50,
    GOTH31=50,GOTH16=50,GOTH02=50,
    BRICK9=50, TANROCK2=50, TANROCK3=50
  }

}
