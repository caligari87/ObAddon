--
--Cages for urban
--

--a garage cage with car and small sandbag fortification
PREFABS.Cage_dem_garage_ambush1 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP01"

  engine = "zdoom"

  prob   = 700

  theme  = "urban"
  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 2

  deep   = 16
  over   = -16

  x_fit = "frame"
  y_fit = "frame"

  tex_BRICK9 = { BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK3=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
    STONE3=50, BRICK12=50, BRICK5=50,
    BRONZE1=50, BROWN1=50, BROWN96=50,
    BROWNGRN=50, CEMENT7=50, CEMENT9=50
  }

}

PREFABS.Cage_dem_garage_ambush1CBL =
{
  template = "Cage_dem_garage_ambush1"

  flat_FLAT5_3 = "CEIL4_2"

  tex_REDWALL = "COMPBLUE"
}

PREFABS.Cage_dem_garage_ambush1CBR =
{
  template = "Cage_dem_garage_ambush1"

  flat_FLAT5_3 = "CEIL5_2"

  tex_REDWALL = "BROWN144"
}

--a garage cage with a big truck
PREFABS.Cage_dem_garage_ambush2 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP02"

  engine = "zdoom"

  prob   = 700

  theme  = "urban"
  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 2

  deep   = 16
  over   = -16

  x_fit = "frame"
  y_fit  = "frame"

  tex_BRICK9 = { BRICK1=50, BRICK10=50, BRICK11=50,
    BRICK2=50, BRICK3=50, BRICK4=50,
    BRICK6=50, BRICK7=50, BRICK8=50,
    BIGBRIK1=50, BIGBRIK2=50, STONE2=50,
    STONE3=50, BRICK12=50, BRICK5=50,
    BRONZE1=50, BROWN1=50, BROWN96=50,
    BROWNGRN=50, CEMENT7=50, CEMENT9=50
  }

}

--a grocery store with a horde of enemies inside
PREFABS.Cage_dem_store_ambush =
{
  file  = "cage/dem_cages.wad"
  map   = "MAP03"

  engine = "zdoom"

  theme = "urban"
  env   = "outdoor"
  prob  = 1000

  where  = "seeds"
  shape  = "U"
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

--
--Cages for outdoor
--

--a concrete bunker
PREFABS.Cage_dem_bunker_ambush1 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP04"

  engine = "zdoom"

  game = "doom2"

  prob   = 700

  theme  = "!hell"

  env = "park"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 2

  deep   = 16
  over   = -16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  y_fit  = "frame"
  z_fit = { 56,64 }

  uses_epic_textures = true


  thing_3004 =
  {
    nothing = 20
    zombie = 50
    shooter = 30
    imp = 50
    gunner = 20
  }

}



PREFABS.Cage_dem_bunker_ambush2 =
{
  template = "Cage_dem_bunker_ambush1"

  map = "MAP05"
  env    = "cave"
}

PREFABS.Cage_dem_bunker_ambush3 =
{
  template = "Cage_dem_bunker_ambush1"

  map = "MAP06"
  env = "nature"
  group = "natural_walls"
}

----upper ledge ambush----


PREFABS.Cage_dem_ledge_ambush1 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP07"

  prob   = 700

  theme  = "!hell"

  env = "park"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 1

  deep   = 16
  over   = -16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "frame"
  z_fit = "top"

}

PREFABS.Cage_dem_ledge_ambush2 =
{
  template = "Cage_dem_ledge_ambush1"

  map = "MAP08"
  env    = "cave"


  x_fit = "frame"
  z_fit = { 16,24 }

}

PREFABS.Cage_dem_ledge_ambush3 =
{
  template = "Cage_dem_ledge_ambush1"

  map = "MAP09"
  env = "nature"
  group = "natural_walls"


  x_fit = "frame"
  z_fit = { 18,26 }
}

PREFABS.Cage_dem_ledge_ambush4 =
{
  template = "Cage_dem_ledge_ambush1"

  map = "MAP17"
  env = "park"

  bound_z1 = 0
  bound_z2 = 184

}

PREFABS.Cage_dem_ledge_ambush5 =
{
  template = "Cage_dem_ledge_ambush1"

  map = "MAP18"
  env = "park"

  bound_z1 = 0
  bound_z2 = 232

}

---- natural shrine getting corrupted by demon ----

PREFABS.Cage_dem_shrineC =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP10"

  engine = "zdoom"

  prob   = 700

  theme  = "!hell"

  env = "cave"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 2

  deep   = 16
  over   = -16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = { 56,64 }

  uses_epic_textures = true

}

PREFABS.Cage_dem_shrineN =
{
  template = "Cage_dem_shrineC"

  map = "MAP11"
  env = "nature"
  group = "natural_walls"


}

---- Ruins with enemies hidden inside ----

PREFABS.Cage_dem_ruinsN1amb =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP12"

  engine = "zdoom"

  prob   = 100

  env = "nature"

  group = "natural_walls"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  bound_z1 = 0
  bound_z2 = 144

  x_fit = "stretch"
  z_fit = { 84,92 }

  uses_epic_textures = true

}

PREFABS.Cage_dem_ruinsN2amb =
{
  template  = "Cage_dem_ruinsN1amb"
  map    = "MAP13"
}

PREFABS.Cage_dem_ruinsC1amb =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP14"

  engine = "zdoom"

  prob   = 100

  env = "cave"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  bound_z1 = 0
  bound_z2 = 128

  x_fit = "stretch"
  z_fit = { 84,92 }

  uses_epic_textures = true

}

PREFABS.Cage_dem_ruinsC2amd =
{
  template  = "Cage_dem_ruinsC1amb"
  map    = "MAP15"
}


----Natural corner with old cabin that have enemies inside----

PREFABS.Cage_dem_cabinamb =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP16"

  engine = "zdoom"

  theme = "!hell"

  prob   = 100

  env = "nature"

  group = "natural_walls"

  where  = "seeds"
  shape  = "U"

  seed_w = 3
  seed_h = 2

  deep = 16
  over = -16

  bound_z1 = 0
  bound_z2 = 128

  z_fit = { 99,104 }

  uses_epic_textures = true

  thing_10 =
  {
    gibs = 50
    gibbed_player = 50
    pool_brains = 50
    dead_player = 50
    dead_zombie = 50
    dead_shooter = 50
    dead_imp = 50
  }

}

----City windows ambush---

PREFABS.Cage_dem_windows_ambush1 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP19"

  prob   = 200

  theme  = "urban"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 2
  seed_h = 1

  deep   = 48

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

  flat_FLAT5_5 = { FLAT5_5=50, FLOOR7_1=50, FLOOR5_4=50, RROCK09=50
  }

  tex_BRICK1 = { BRICK2=50, BRICK1=50, BRICK12=50, BRICK4=50, BRICK5=50,
        BRICK6=50, BRICK7=50, BRICK8=50, BRICK9=50, BSTONE1=50,
        BSTONE2=50, STEPTOP=50, STONE6=50, STONE7=50, STUCCO=50,
        STUCCO1=50, STUCCO3=50, TANROCK3=50, WOOD12=50, BRIKS16=50,
        BRIKS31=50, BRONZE5=50, PANNYA=50, STUC01=50
  }

}

PREFABS.Cage_dem_windows_ambush2 =
{
  template = "Cage_dem_windows_ambush1"

  map = "MAP20"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

}

PREFABS.Cage_dem_windows_ambush3 =
{
  template = "Cage_dem_windows_ambush1"

  map = "MAP21"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

}

PREFABS.Cage_dem_windows_ambush4 =
{
  template = "Cage_dem_windows_ambush1"


  tex_PANBORD1 = { DOORSTOP=50 }


  flat_FLAT5_5 = { FLAT19=50, FLAT23=50, FLAT5_4=50, CRATOP1=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY5=50, SHAWN2=50, SILVER1=50, STEP4=50, STONE4=50,
        STONE=50, BRIKS32=50, BRIKS43=50, BROWN2=50, BROWN3=50, GOTH07=50,
        GOTH13=50, GRAY9=50, GRAY8=50, ROK17=50, SHAWSH04=50, STON4=50,
        STON7=50, STONE10=50, STONE8=50, STONE9=50
  }

}

PREFABS.Cage_dem_windows_ambush5 =
{
  template = "Cage_dem_windows_ambush1"

  map = "MAP20"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

  tex_PANBORD1 = { DOORSTOP=50 }


  flat_FLAT5_5 = { FLAT19=50, FLAT23=50, FLAT5_4=50, CRATOP1=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY5=50, SHAWN2=50, SILVER1=50, STEP4=50, STONE4=50,
        STONE=50, BRIKS32=50, BRIKS43=50, BROWN2=50, BROWN3=50, GOTH07=50,
        GOTH13=50, GRAY9=50, GRAY8=50, ROK17=50, SHAWSH04=50, STON4=50,
        STON7=50, STONE10=50, STONE8=50, STONE9=50
  }

}

PREFABS.Cage_dem_windows_ambush6 =
{
  template = "Cage_dem_windows_ambush1"

  map = "MAP21"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

  tex_PANBORD1 = { DOORSTOP=50 }


  flat_FLAT5_5 = { FLAT19=50, FLAT23=50, FLAT5_4=50, CRATOP1=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY5=50, SHAWN2=50, SILVER1=50, STEP4=50, STONE4=50,
        STONE=50, BRIKS32=50, BRIKS43=50, BROWN2=50, BROWN3=50, GOTH07=50,
        GOTH13=50, GRAY9=50, GRAY8=50, ROK17=50, SHAWSH04=50, STON4=50,
        STON7=50, STONE10=50, STONE8=50, STONE9=50
  }

}

---- City windows ambush where monsters duck for cover ----

PREFABS.Cage_dem_windows_ambushd1 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP22"

  prob   = 200

  theme  = "urban"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   = 48

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

  flat_FLAT5_5 = { FLAT5_5=50, FLOOR7_1=50, FLOOR5_4=50, RROCK09=50
  }

  tex_BRICK1 = { BRICK2=50, BRICK1=50, BRICK12=50, BRICK4=50, BRICK5=50,
        BRICK6=50, BRICK7=50, BRICK8=50, BRICK9=50, BSTONE1=50,
        BSTONE2=50, STEPTOP=50, STONE6=50, STONE7=50, STUCCO=50,
        STUCCO1=50, STUCCO3=50, TANROCK3=50, WOOD12=50, BRIKS16=50,
        BRIKS31=50, BRONZE5=50, PANNYA=50, STUC01=50
  }

}

PREFABS.Cage_dem_windows_ambushd2 =
{
  template = "Cage_dem_windows_ambushd1"

  map = "MAP23"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

}

PREFABS.Cage_dem_windows_ambushd3 =
{
  template = "Cage_dem_windows_ambushd1"

  map = "MAP24"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

}

PREFABS.Cage_dem_windows_ambushd4 =
{
  template = "Cage_dem_windows_ambushd1"


  tex_PANBORD1 = { DOORSTOP=50 }


  flat_FLAT5_5 = { FLAT19=50, FLAT23=50, FLAT5_4=50, CRATOP1=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY5=50, SHAWN2=50, SILVER1=50, STEP4=50, STONE4=50,
        STONE=50, BRIKS32=50, BRIKS43=50, BROWN2=50, BROWN3=50, GOTH07=50,
        GOTH13=50, GRAY9=50, GRAY8=50, ROK17=50, SHAWSH04=50, STON4=50,
        STON7=50, STONE10=50, STONE8=50, STONE9=50
  }

}

PREFABS.Cage_dem_windows_ambushd5 =
{
  template = "Cage_dem_windows_ambushd1"

  map = "MAP23"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

  tex_PANBORD1 = { DOORSTOP=50 }


  flat_FLAT5_5 = { FLAT19=50, FLAT23=50, FLAT5_4=50, CRATOP1=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY5=50, SHAWN2=50, SILVER1=50, STEP4=50, STONE4=50,
        STONE=50, BRIKS32=50, BRIKS43=50, BROWN2=50, BROWN3=50, GOTH07=50,
        GOTH13=50, GRAY9=50, GRAY8=50, ROK17=50, SHAWSH04=50, STON4=50,
        STON7=50, STONE10=50, STONE8=50, STONE9=50
  }

}

PREFABS.Cage_dem_windows_ambushd6 =
{
  template = "Cage_dem_windows_ambushd1"

  map = "MAP24"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

  tex_PANBORD1 = { DOORSTOP=50 }


  flat_FLAT5_5 = { FLAT19=50, FLAT23=50, FLAT5_4=50, CRATOP1=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY5=50, SHAWN2=50, SILVER1=50, STEP4=50, STONE4=50,
        STONE=50, BRIKS32=50, BRIKS43=50, BROWN2=50, BROWN3=50, GOTH07=50,
        GOTH13=50, GRAY9=50, GRAY8=50, ROK17=50, SHAWSH04=50, STON4=50,
        STON7=50, STONE10=50, STONE8=50, STONE9=50
  }

}

---- City windows ambush where monsters open the window ----

PREFABS.Cage_dem_windows_ambusho1 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP25"

  engine = "zdoom"

  prob   = 200

  theme  = "urban"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   = 48

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

  flat_FLAT5_5 = { FLAT5_5=50, FLOOR7_1=50, FLOOR5_4=50, RROCK09=50
  }

  tex_BRICK1 = { BRICK2=50, BRICK1=50, BRICK12=50, BRICK4=50, BRICK5=50,
        BRICK6=50, BRICK7=50, BRICK8=50, BRICK9=50, BSTONE1=50,
        BSTONE2=50, STEPTOP=50, STONE6=50, STONE7=50, STUCCO=50,
        STUCCO1=50, STUCCO3=50, TANROCK3=50, WOOD12=50, BRIKS16=50,
        BRIKS31=50, BRONZE5=50, PANNYA=50, STUC01=50
  }

}

PREFABS.Cage_dem_windows_ambusho2 =
{
  template = "Cage_dem_windows_ambusho1"

  map = "MAP26"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

}

PREFABS.Cage_dem_windows_ambusho3 =
{
  template = "Cage_dem_windows_ambusho1"

  map = "MAP27"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

}

PREFABS.Cage_dem_windows_ambusho4 =
{
  template = "Cage_dem_windows_ambusho1"


  tex_PANBORD1 = { DOORSTOP=50 }


  flat_FLAT5_5 = { FLAT19=50, FLAT23=50, FLAT5_4=50, CRATOP1=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY5=50, SHAWN2=50, SILVER1=50, STEP4=50, STONE4=50,
        STONE=50, BRIKS32=50, BRIKS43=50, BROWN2=50, BROWN3=50, GOTH07=50,
        GOTH13=50, GRAY9=50, GRAY8=50, ROK17=50, SHAWSH04=50, STON4=50,
        STON7=50, STONE10=50, STONE8=50, STONE9=50
  }

}

PREFABS.Cage_dem_windows_ambusho5 =
{
  template = "Cage_dem_windows_ambusho1"

  map = "MAP26"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

  tex_PANBORD1 = { DOORSTOP=50 }


  flat_FLAT5_5 = { FLAT19=50, FLAT23=50, FLAT5_4=50, CRATOP1=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY5=50, SHAWN2=50, SILVER1=50, STEP4=50, STONE4=50,
        STONE=50, BRIKS32=50, BRIKS43=50, BROWN2=50, BROWN3=50, GOTH07=50,
        GOTH13=50, GRAY9=50, GRAY8=50, ROK17=50, SHAWSH04=50, STON4=50,
        STON7=50, STONE10=50, STONE8=50, STONE9=50
  }

}

PREFABS.Cage_dem_windows_ambusho6 =
{
  template = "Cage_dem_windows_ambusho1"

  map = "MAP27"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

  tex_PANBORD1 = { DOORSTOP=50 }


  flat_FLAT5_5 = { FLAT19=50, FLAT23=50, FLAT5_4=50, CRATOP1=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY5=50, SHAWN2=50, SILVER1=50, STEP4=50, STONE4=50,
        STONE=50, BRIKS32=50, BRIKS43=50, BROWN2=50, BROWN3=50, GOTH07=50,
        GOTH13=50, GRAY9=50, GRAY8=50, ROK17=50, SHAWSH04=50, STON4=50,
        STON7=50, STONE10=50, STONE8=50, STONE9=50
  }

}

---- Industrial door/catwalk ambush ----

PREFABS.Cage_dem_windows_ambush7 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP28"

  engine = "zdoom"

  prob   = 200

  theme  = "tech"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   = 48

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

  flat_FLAT5_4 = { FLAT5_4=50, FLAT19=50, GRATE3=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY4=50, GRAY5=50, GRAY7=50, ICKWALL1=50, ICKWALL2=50, ICKWALL3=50, METAL1=50, METAL2=50, SHAWN2=50, SILVER1=50, STARG1=50, STARG3=50, STARGR1=50, STONE=50, STONE2=50, STONE3=50, TEKGREN2=50, TEKGREN5=50, BIGSTON2=50, BIGSTON3=50, BRONZE5=50, GRAY6=50, GRAY8=50, GRAY9=50, HEX01=50, MET2=50, MET6=50, MET7=50, SHAWN4=50, SHAWN5=50
  }

}

PREFABS.Cage_dem_windows_ambush8 =
{
  template = "Cage_dem_windows_ambush7"

  map = "MAP29"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

}

PREFABS.Cage_dem_windows_ambush9 =
{
  template = "Cage_dem_windows_ambush7"

  map = "MAP30"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

}

---- Industrial door/catwalk ambush where monsters open the door ----

PREFABS.Cage_dem_windows_ambusho7 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP31"

  engine = "zdoom"

  prob   = 200

  theme  = "tech"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   = 48

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

  flat_FLAT5_4 = { FLAT5_4=50, FLAT19=50, GRATE3=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY4=50, GRAY5=50, GRAY7=50, ICKWALL1=50, ICKWALL2=50, ICKWALL3=50, METAL1=50, METAL2=50, SHAWN2=50, SILVER1=50, STARG1=50, STARG3=50, STARGR1=50, STONE=50, STONE2=50, STONE3=50, TEKGREN2=50, TEKGREN5=50, BIGSTON2=50, BIGSTON3=50, BRONZE5=50, GRAY6=50, GRAY8=50, GRAY9=50, HEX01=50, MET2=50, MET6=50, MET7=50, SHAWN4=50, SHAWN5=50
  }

}

PREFABS.Cage_dem_windows_ambusho8 =
{
  template = "Cage_dem_windows_ambusho7"

  map = "MAP32"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

}

PREFABS.Cage_dem_windows_ambusho9 =
{
  template = "Cage_dem_windows_ambusho7"

  map = "MAP33"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

}

---- Industrial windows ambush----

PREFABS.Cage_dem_windows_ambush10 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP34"

  engine = "zdoom"

  prob   = 200

  theme  = "tech"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   = 48

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

  flat_FLAT5_4 = { FLAT5_4=50, FLAT19=50, GRATE3=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY4=50, GRAY5=50, GRAY7=50, ICKWALL1=50, ICKWALL2=50, ICKWALL3=50, METAL1=50, METAL2=50, SHAWN2=50, SILVER1=50, STARG1=50, STARG3=50, STARGR1=50, STONE=50, STONE2=50, STONE3=50, TEKGREN2=50, TEKGREN5=50, BIGSTON2=50, BIGSTON3=50, BRONZE5=50, GRAY6=50, GRAY8=50, GRAY9=50, HEX01=50, MET2=50, MET6=50, MET7=50, SHAWN4=50, SHAWN5=50
  }

}

PREFABS.Cage_dem_windows_ambush11 =
{
  template = "Cage_dem_windows_ambush10"

  map = "MAP35"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

}

PREFABS.Cage_dem_windows_ambush12 =
{
  template = "Cage_dem_windows_ambush10"

  map = "MAP36"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

}

---- Industrial window ambush where monsters open the window ----

PREFABS.Cage_dem_windows_ambusho10 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP37"

  engine = "zdoom"

  prob   = 200

  theme  = "tech"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   = 48

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

  flat_FLAT5_4 = { FLAT5_4=50, FLAT19=50, GRATE3=50
  }

  tex_BRICK1 = { GRAY1=50, GRAY4=50, GRAY5=50, GRAY7=50, ICKWALL1=50, ICKWALL2=50, ICKWALL3=50, METAL1=50, METAL2=50, SHAWN2=50, SILVER1=50, STARG1=50, STARG3=50, STARGR1=50, STONE=50, STONE2=50, STONE3=50, TEKGREN2=50, TEKGREN5=50, BIGSTON2=50, BIGSTON3=50, BRONZE5=50, GRAY6=50, GRAY8=50, GRAY9=50, HEX01=50, MET2=50, MET6=50, MET7=50, SHAWN4=50, SHAWN5=50
  }

}

PREFABS.Cage_dem_windows_ambusho11 =
{
  template = "Cage_dem_windows_ambusho10"

  map = "MAP38"

  height = 200

  bound_z1 = 0
  bound_z2 = 200

}

PREFABS.Cage_dem_windows_ambusho12 =
{
  template = "Cage_dem_windows_ambusho10"

  map = "MAP39"

  height = 248

  bound_z1 = 0
  bound_z2 = 248

}

---- Hell battlements ambush ----

PREFABS.Cage_dem_windows_ambush13 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP40"

  engine = "zdoom"

  prob   = 200

  theme  = "hell"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 2
  seed_h = 1

  deep   = 64

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

}

PREFABS.Cage_dem_windows_ambush14 =
{
  template = "Cage_dem_windows_ambush13"

  map = "MAP41"

  height = 200

  bound_z1 = 0
  bound_z2 = 200
}

PREFABS.Cage_dem_windows_ambush15 =
{
  template = "Cage_dem_windows_ambush13"

  map = "MAP42"

  height = 248

  bound_z1 = 0
  bound_z2 = 248
}

---- Hell windows ambush ----

PREFABS.Cage_dem_windows_ambush16 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP43"

  engine = "zdoom"

  prob   = 200

  theme  = "hell"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   = 48

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

    thing_55 =
  {
  blue_torch_sm = 50
  green_torch_sm = 50
  red_torch_sm  = 50
  }
}

PREFABS.Cage_dem_windows_ambush17 =
{
  template = "Cage_dem_windows_ambush16"

  map = "MAP44"

  height = 200

  bound_z1 = 0
  bound_z2 = 200
}

PREFABS.Cage_dem_windows_ambush18 =
{
  template = "Cage_dem_windows_ambush16"

  map = "MAP45"

  height = 248

  bound_z1 = 0
  bound_z2 = 248
}

---- Hell windows ambush where enemy duck for cover ----

PREFABS.Cage_dem_windows_ambushd7 =
{
  file   = "cage/dem_cages.wad"
  map    = "MAP46"

  engine = "zdoom"

  prob   = 600

  theme  = "hell"

  env    = "outdoor"

  where  = "seeds"
  shape  = "U"

  seed_w = 1
  seed_h = 1

  deep   = 48

  height = 144

  bound_z1 = 0
  bound_z2 = 144

  y_fit = "top"
  z_fit = "top"

  uses_epic_textures = true

  sector_17 = { [0]=50, [17]=50 }

    thing_55 =
  {
  blue_torch_sm = 50
  green_torch_sm = 50
  red_torch_sm  = 50
  }
}

PREFABS.Cage_dem_windows_ambushd8 =
{
  template = "Cage_dem_windows_ambushd7"

  map = "MAP47"

  height = 200

  bound_z1 = 0
  bound_z2 = 200
}

PREFABS.Cage_dem_windows_ambushd9 =
{
  template = "Cage_dem_windows_ambushd7"

  map = "MAP48"

  height = 248

  bound_z1 = 0
  bound_z2 = 248
}




