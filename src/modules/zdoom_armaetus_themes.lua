----------------------------------------------------------------
--  MODULE: Armaetus Themes
----------------------------------------------------------------
--
--  Copyright (C) 2019 MsrSgtShooterPerson
--  Copyright (C) 2019 Armaetus
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
------------------------------------------------------------------

-- General room themes are placed here (includes cave rooms)
ARMAETUS_THEMES =
{
  any_ducts_Hallway =
  {
    env   = "hallway"
    group = "ducts"
    prob  = 1

    walls =
    {
      GRAY1 = 50
      GRAY5 = 50
      ICKWALL1 = 30
      ICKWALL3 = 30
    }

    floors =
    {
      FLAT1 = 30
      FLOOR0_3 = 20
      FLAT20 = 15
      FLAT3 = 10
    }

    ceilings =
    {
      FLAT1 = 30
      FLAT19 = 20
      FLAT23 = 20
      FLAT5_4 = 15
    }
  }

  tech_GrayMet =
  {
    env = "building"
    prob = 120

    walls =
    {
      GRAY6 = 50
      GRAY8 = 50

      GRAYMET1 = 20
      GRAYMET2 = 20
      GRAYMET3 = 20
      GRAYMET4 = 20
      GRAYMET5 = 20
      GRAYMET6 = 6
      GRAYMET7 = 6
      GRAYMET8 = 6
      GRAYMET9 = 6
      GRAYMETA = 6
      GRAYMETB = 6
      GRAYMETC = 6

      METAL8 = 25
      METAL9 = 25
      METAL10 = 25
      METAL11 = 25

      SHAWN4 = 33
      SHAWN5 = 33
      HEX01 = 33

      DARKMET1 = 30
      DARKM01 = 30

      STARBR1 = 30
      STARGRY1 = 30

      TEKGRBLU = 30
      TEKGRN01 = 30
      TEKGRY01 = 30
      TEKSHAW = 30

      TKWALL2 = 15
      TEKWALL7 = 15
      TEKWALL8 = 15
      TEKWALL9 = 15
      TEKWALLA = 10
      TEKWALLB = 10
      TEKWALLC = 10
      TEKWALLD = 10
      TEKWALLE = 10
    }

    floors =
    {
      FLOOR4_8 = 25
      FLOOR5_1 = 25
      FLOOR5_3 = 30
      FLOOR0_3 = 30
      FLOOR3_3 = 20
      FLOOR0_2 = 20
      FLOOR0_1 = 20
      FLOOR4_6 = 15
      FLOOR7_1 = 15
      FLAT4 = 15
      FLAT14 = 10
      SLIME15 = 10
      SLIME16 = 10
      FLOOR1_6 = 6
      FLOOR1_1 = 8
      FLOOR0_5 = 5
      FLAT5 = 5

      GRATE1 = 100
      GRATE2 = 100
      GRATE3 = 100
      GRATE5 = 100
      GRATE6 = 100
      GRATE7 = 100

      DARKF01 = 75
      DARKF02 = 75
      DARKF03 = 75

      SHINY01 = 75
      SHINY02 = 75
      SHINY03 = 75
      SHINY04 = 35
    }

    ceilings =
    {
      CEIL3_1 = 20
      CEIL3_2 = 20
      CEIL3_5 = 20
      CEIL3_3 = 15
      CEIL4_2 = 10
      CEIL4_3 = 10
      CEIL5_1 = 15

      FLAT9  = 30
      FLAT19 = 20
      FLAT4  = 20
      FLAT9  = 15
      FLAT23 = 5
    }
  }

  tech_Computers =
  {
    prob = 50
    env = "building"

    walls =
    {
      COMPSPAN = 30
      CMPOHSO = 10
      CMPTILE = 15
      COMPBLUE = 10
    }

    floors =
    {
      FLAT14 = 70
      FLOOR1_1 = 35
      FLAT4 = 10
      CEIL4_1 = 20
      CEIL4_2 = 20
      CEIL5_1 = 20
      CEIL4_4 = 20
    }

    ceilings =
    {
      CEIL5_1 = 50
      CEIL4_1 = 20
      CEIL4_2 = 20
      CEIL4_4 = 15
      TEK1    = 7
      TEK2    = 7
      QFLAT09 = 5
      GRATE3  = 5
    }
  }

  -- Multi colors here!
  tech_ComputersMulti =
  {
    prob = 25
    env = "building"

    walls =
    {
      COMPSPAN = 20
      CMPOHSO = 10
      CMPTILE = 20
      COMPTIL2 = 20
      COMPTIL3 = 10
      COMPTIL4 = 20
      COMPTIL5 = 20
      COMPTIL6 = 20
      COMPBLUE = 10
      COMPGREN = 10
      COMPRED  = 10
    }

    floors =
    {
      FLAT14 = 70
      FLOOR1_1 = 35
      FLOOR1_2 = 30
      GRENFLOR = 20
      FLAT4 = 10
      CEIL4_1 = 20
      CEIL4_2 = 20
      CEIL5_1 = 20
      CEIL4_4 = 20
    }

    ceilings =
    {
      CEIL5_1 = 50
      CEIL4_1 = 20
      CEIL4_2 = 20
      CEIL4_4 = 15
      TEK1    = 7
      TEK2    = 7
      QFLAT09 = 5
      GRATE3  = 5
    }
  }

  -- single color comp rooms
  tech_ComputersRed =
  {
    prob = 7
    env = "building"

    walls =
    {
      COMPSPAN = 20
      CMPTILE = 20
      COMPTIL2 = 20
      COMPRED  = 10
      TEKWALL8 = 20
      GRAYMET9 = 20
    }

    floors =
    {
      -- predominantly red
      FLOOR1_6 = 50
      FLOOR1_2 = 50
      FLAT15 = 50
      STARBR2F = 25
      STARTANF = 25

      -- everything else
      FLOOR1_1 = 5
      FLAT3 = 10
      FLAT4 = 10
      FLAT20 = 10
      CEIL4_1 = 2
      CEIL4_2 = 2
      CEIL5_1 = 5
      CEIL4_4 = 2
      FLOOR4_8 = 20
      GRATE1 = 20
      GRATE2 = 20
      GRATE5 = 10
      GRATE6 = 10
      GRATE7 = 20
      SHINY01 = 10
      SHINY03 = 10
    }

    ceilings =
    {
      CEIL5_1 = 20
      CEIL5_2 = 20
      FLOOR1_6 = 10
      TEK1    = 20
      QFLAT09 = 5
      GRATE3  = 5
    }
  }

  tech_ComputersBlue =
  {
    prob = 7
    env = "building"

    walls =
    {
      CMPTILE = 15
      CMPOHSO = 15
      GRAYBLU1 = 20
      SILVBLU1 = 20
      TEKGRBLU = 20
      COMPBLUE = 10
      TEKWALLB = 20
      TEKWALLD = 20
      GRAYMET6 = 15
      GRAYMETA = 15
    }

    floors =
    {
      -- predominantly blue
      CEIL4_1 = 30
      CEIL4_2 = 30
      CEIL4_4 = 30
      FLOOR1_1 = 50
      FLAT14 = 35

      FLOOR1_1 = 15
      FLOOR1_2 = 5
      FLAT3 = 10
      FLAT4 = 10
      FLAT20 = 10
      CEIL5_1 = 10
      FLOOR4_8 = 20
      GRATE1 = 20
      GRATE2 = 20
      GRATE5 = 10
      GRATE6 = 10
      GRATE7 = 20
      SHINY01 = 10
      SHINY03 = 10
    }

    ceilings =
    {
      CEIL5_1 = 10
      CEIL5_2 = 10
      CEIL4_1 = 20
      CEIL4_2 = 20
      CEIL4_4 = 20
      TEK4    = 20
      TEK6    = 20
      QFLAT09 = 5
      GRATE3  = 5
    }
  }

  tech_ComputersGreen =
  {
    prob = 7
    env = "building"

    walls =
    {
      TEKWALL9 = 20
      COMPGREN = 20
      COMPTIL4 = 20
      GRAYMET8 = 15
    }

    floors =
    {
      -- predominantly green
      GRENFLOR = 75
      STARG1F = 50

      FLOOR1_1 = 15
      FLOOR1_2 = 5
      FLAT3 = 10
      FLAT4 = 10
      FLAT20 = 10
      CEIL4_1 = 2
      CEIL4_2 = 2
      CEIL5_1 = 10
      CEIL4_4 = 2
      FLOOR4_8 = 20
      GRATE1 = 20
      GRATE2 = 20
      GRATE5 = 10
      GRATE6 = 10
      GRATE7 = 20
      SHINY01 = 10
      SHINY03 = 10
    }

    ceilings =
    {
      CEIL5_1 = 20
      CEIL5_2 = 20
      TEK2    = 30
      QFLAT09 = 5
      GRATE3  = 5
    }
  }

  tech_ComputersYellowish =
  {
    prob = 7
    env = "building"

    walls =
    {
      TEKWALLE = 20
      COMPTIL5 = 20
      COMPTIL3 = 8
      COMPBLAK = 8
      GRAYMETC = 8
    }

    floors =
    {
      -- predominantly yellow or orange shades
      ORANFLOR = 50
      STARBR2F = 25
      STARTANF = 25
      FLOOR4_1 = 25
      FLOOR4_5 = 25
      SLIME16 = 25

      FLOOR1_1 = 15
      FLOOR1_2 = 5
      FLAT3 = 10
      FLAT4 = 10
      FLAT20 = 10
      CEIL5_1 = 10
      FLOOR4_8 = 20
      GRATE1 = 20
      GRATE2 = 20
      GRATE5 = 10
      GRATE6 = 10
      GRATE7 = 20
      SHINY01 = 10
      SHINY03 = 10
    }

    ceilings =
    {
      CEIL5_1 = 15
      CEIL5_2 = 30
      TEK7    = 30
      QFLAT09 = 5
      GRATE3  = 5
    }
  }

  tech_ComputersParple =
  {
    prob = 7
    env = "building"

    walls =
    {
      TEKWALLA = 20
      TEKWALLC = 20
      COMPTIL6 = 20
      COMPTIL3 = 10
      COMPBLAK = 10
      GRAYMET7 = 10
      GRAYMETB = 10
    }

    floors =
    {
      FLAT14 = 20
      FLOOR1_1 = 15
      FLOOR1_2 = 5
      FLAT3 = 10
      FLAT4 = 10
      FLAT20 = 10
      CEIL4_1 = 5
      CEIL4_2 = 5
      CEIL5_1 = 10
      CEIL4_4 = 5
      FLOOR4_8 = 20
      GRATE1 = 20
      GRATE2 = 20
      GRATE5 = 10
      GRATE6 = 10
      GRATE7 = 20
      SHINY01 = 10
      SHINY03 = 10
    }

    ceilings =
    {
      CEIL5_1 = 50
      CEIL5_2 = 30
      TEK3    = 20
      TEK5    = 20
      QFLAT09 = 5
      GRATE3  = 5
    }
  }

  -- Hooray, CEMENT textures!
  tech_Cement =
  {
    env = "building"
    prob = 100

    walls =
    {
      CEM03 = 15
      CEM04 = 15
      CEM06 = 120
      CEM07 = 120
      CEM09 = 120
    }

    floors =
    {
      FLAT1 = 50
      FLAT5_4 = 40
      GRATE1  = 15
      GRATE2  = 15
      FLOOR4_8 = 10
      FLOOR5_1 = 10
      FLOOR51C = 10
      FLOOR46D = 15
      FLOOR46E = 15
      DARKF01 = 15
      DARKF02 = 15
    }

    ceilings =
    {
      FLAT19 = 50
      FLAT5_4 = 20
      MFLR8_1 = 15
      FLAT5_2 = 5
      CEIL1_1 = 5
      FLAT5_2 = 5
      GRATE4  = 10
    }
  }

  tech_Shiny =
  {
    prob = 75
    env = "building"

    walls =
    {
      SHAWGRY4 = 15

      SHAWN2 = 60
      SHAWN4 = 40
      SHAWN5 = 40

      SHAWHOSO = 40
      SHAWN01C = 15
      SHAWN01D = 15
      SHAWN01F = 15

      TEKSHAW = 25
      HEX01  = 15
      STARGR1 = 5
      STARGR2 = 5
      STARGRY1 = 8

      SNOWWAL1 = 15
      SNOWWAL2 = 15
      SNOWWAL3 = 15
      SNOWWAL4 = 15
    }

    floors =
    {
      FLOOR4_7 = 10
      FLOOR4_8 = 10
      FLOOR5_1 = 10
      FLAT14 = 10
      FLAT15 = 10
      FLOOR1_1 = 5
      FLOOR1_2 = 5
      FLAT23 = 70
      SHINY01 = 20
      SHINY02 = 30
      SHINY03 = 25
      TILES4  = 5
      TILES6  = 5
    }

    ceilings =
    {
      FLAT23 = 70
      FLAT1  = 5
      FLAT19 = 10
      SHINY02 = 15
      FLOOR4_7 = 10
      SHINY03 = 15
      SHINY04 = 10
    }
  }

  tech_HeavyMetal =
  {
    env = "building"
    prob = 120

    walls =
    {
      METAL2 = 70
      METAL8 = 70
      METAL9 = 70
      METAL10 = 50
      BRONZE1 = 30
      BRONZE3 = 30
      METAL1 = 25
      RUSTWALL = 20
    }

    floors =
    {
      FLAT3 = 50
      FLOOR0_1 = 30
      GRATE1 = 30
      GRATE2 = 30
      GRATE3 = 30
      FLOOR4_5 = 20
      FLOOR4_6 = 20
      FLOOR4_8 = 20
      FLOOR5_1 = 15
      FLOOR7_1 = 15
      GRATE7 = 15
      MFLR8_2  = 20
      SLIME15 = 20
      SLIME14 = 20
      GRATE4 = 10
      CEIL4_1 = 5
      CEIL4_2 = 5
      QFLAT09 = 10
      QFLAT10 = 5
      MEM01   = 10
      DARKF01 = 15
      DARKF02 = 15
      DARKF03 = 15
      FLOOR46E = 10
      GMET06   = 10
      GMET07   = 10
      GMET05   = 15
    }

    ceilings =
    {
      CEIL5_1 = 40
      CEIL5_2 = 15
      GRATE4  = 25
      SLIME15 = 40
      CEIL4_1 = 20
      SLIME14 = 40
      SLIME16 = 20
      GRATE3  = 20
      GRATE5  = 15
      GRATE6  = 15
      GRATE8  = 20
      G15     = 10
      GMET02  = 15
      GMET03  = 15
      GMET04  = 20
    }
  }

  tech_VeryGray =
  {
    env = "building"
    prob = 85

    walls =
    {
      GRAY1 = 80
      GRAY5 = 80
      GRAY4 = 80
      GRAY6 = 60
      GRAY7 = 80
      GRAY8 = 60
      ICKWALL1 = 10
      ICKWALL2 = 10
      ICKWALL3 = 10
      TEKGRY01 = 10
    }

    floors =
    {
      FLAT4 = 50
      FLOOR0_3 = 30
      FLAT5_4 = 25
      FLAT19 = 15
      TILES4 = 15
      TILES5 = 10
      TILES6 = 10
      FLOOR0_5 = 10
      FLOOR4_7 = 15
      SHINY01 = 5
      SHINY02 = 5
      SHINY03 = 10
      GMET07  = 3
    }

    ceilings =
    {
      FLAT19 = 40
      FLAT5_4 = 20
      FLAT4  = 20
      FLAT23 = 10
      FLAT1 = 10
      FLOOR4_7 = 5
      SHINY02 = 5
      RROCK21 = 5
      SHINY04 = 5
      SLIME14 = 10
      SLIME15 = 10
    }
  }

  tech_VeryBrown =
  {
    env = "building"
    prob = 60

    walls =
    {
      BROWN1 = 30
      BROWN3 = 5
      BROWNGRN = 20
      BROWNGR2 = 5
      BROWNGR3 = 5
      BROWNGR4 = 5
      BROWN96 = 10
      BRVINE = 5
      BROVINE2 = 5
    }

    floors =
    {
      FLOOR0_1 = 30
      FLOOR0_2 = 20
      FLOOR3_3 = 20
      FLOOR7_1 = 15
      FLOOR4_5 = 30
      FLOOR4_6 = 30
      FLOOR5_2 = 30
      FLAT5 = 20
      FLAT14 = 15
      FLAT5_4 = 10
      FLOOR46D = 10
      FLOOR46E = 10
      DARKF01 = 5
      DARKF02 = 5
    }

    ceilings =
    {
      CEIL5_1 = 20
      CEIL3_3 = 15
      CEIL3_5 = 50
      FLAT1 = 20
      FLOOR4_1 = 30
      FLAT5_4 = 10
      FLOOR5_4 = 10
      QFLAT09 = 5
    }
  }

  hell_ArmaetusGothic =
  {
    env  = "building"
    prob = 150

    walls =
    {
      GOTH01 = 15
      GOTH02 = 15
      GOTH03 = 15
      GOTH06 = 15
      GOTH07 = 15
      GOTH08 = 15
      GOTH09 = 15
      GOTH10 = 15
      GOTH11 = 15
      GOTH12 = 15
      GOTH13 = 15
      GOTH14 = 15
      GOTH15 = 15
      GOTH16 = 15
      GOTH17 = 15
      GOTH18 = 15
      GOTH23 = 15
      GOTH24 = 15
      GOTH25 = 15
      GOTH26 = 15
      GOTH27 = 15
      GOTH28 = 15
      GOTH34 = 15
      GOTH35 = 15
      GOTH36 = 15
      GOTH37 = 15
      GOTH38 = 15
      GOTH39 = 15
      GOTH40 = 15
      GOTH41 = 15
      GOTH42 = 15
      GOTH43 = 15
      GOTH44 = 15
      GOTH45 = 15
      GOTH46 = 15
      GOTH47 = 15
      GOTH48 = 15
      GOTH49 = 15
    }

    floors =
    {
      GRNROCK  = 30
      FLAT5_4  = 30
      FLAT5_1  = 30
      FLOOR7_1 = 30
      DEM1_6   = 15
      FLAT5_1  = 5
      FLAT5_2  = 5

      FLAT10   = 10
      FLOOR6_2 = 10
      MFLR8_2  = 10

      G01 = 40
      G02 = 40
      G03 = 40
      G04 = 40
      G05 = 40
      G06 = 40
      G07 = 40
      G08 = 40
      G09 = 40
      G10 = 40
      G11 = 40
      G12 = 40
      G13 = 40
      G14 = 40
      G15 = 40
      G16 = 40
      G17 = 40
      G18 = 40
      G19 = 40
      G20 = 40
      G21 = 40

      GMET01 = 90
      GMET02 = 90
      GMET03 = 90
      GMET04 = 90
      GMET05 = 90
      GMET06 = 90
      GMET07 = 90
    }

    ceilings =
    {
      FLOOR7_2 = 50
      DEM1_5   = 20
      FLOOR6_1 = 20
      FLOOR6_2 = 20
      MFLR8_4  = 15
    }

    cliff_mats =
    {
      GRNSTONE = 5
      HELLROK1 = 10
      RDROK1 = 15
      ROK04 = 30
      ROK05 = 30
      ROK12 = 30
      ROK13 = 30
      ROK14 = 30
      ROK15 = 30
      ROK20 = 30
      ROK21 = 30
      ROK22 = 30
      ROK23 = 30
      SKULLS = 10
      SKULLS2 = 10
      BODIESB = 10
      BODIESC = 10
    }
  }

  hell_CementCautionlines =
  {
    env = "building"
    prob = 50

    theme_override = "tech"

    walls =
    {
      CEM01 = 20
      CEM02 = 20
      CEM03 = 20
      CEM04 = 20
      CEM06 = 20
      CEM07 = 20
      CEM09 = 20
      DRKCMT01 = 10
      DRKCMT02 = 10
      DRKCMT03 = 10
      DRKCMT04 = 10
      DRKCMT05 = 10
      DRKCMT06 = 10
      HELLCMT1 = 20
      HELLCMT2 = 20
      HELLCMT3 = 20
      HELLCMT4 = 20
      HELLCMT5 = 20
      HELLCMT6 = 20
      HELLCMT7 = 15
      HELLCMT8 = 15
    }

    floors =
    {
      FLAT1 = 50
      FLAT5_4 = 40
      FLAT5_2 = 5
      FLAT5_1 = 5
      GRATE1  = 10
      GRATE2  = 10
      GRATE7  = 10
      FLOOR4_8 = 10
      FLOOR5_1 = 10
      FLOOR51C = 10
      FLOOR46D = 10
      FLOOR46E = 10
      DARKF01 = 10
      DARKF02 = 10
    }

    ceilings =
    {
      FLAT19 = 50
      FLAT5_4 = 20
      MFLR8_1 = 15
      FLAT5_2 = 5
      CEIL1_1 = 5
      FLAT5_2 = 5
      GRATE4  = 10
      GRATE8  = 10
    }

    cliff_mats =
    {
      GRNSTONE = 5
      HELLROK1 = 10
      RDROK1 = 15
      ROK04 = 30
      ROK05 = 30
      ROK12 = 30
      ROK13 = 30
      ROK14 = 30
      ROK15 = 30
      ROK20 = 30
      ROK21 = 30
      ROK22 = 30
      ROK23 = 30
      SKULLS = 10
      SKULLS2 = 10
      BODIESB = 10
      BODIESC = 10
    }
  }

  hell_CementCautionless =
  {
    env = "building"
    prob = 50

    walls =
    {
      CEM01 = 20
      CEM02 = 20
      CEM09 = 20
      DRKCMT05 = 10
      DRKCMT06 = 10
      HELLCMT1 = 20
      HELLCMT2 = 20
      HELLCMT7 = 15
      HELLCMT8 = 15
    }

    floors =
    {
      FLAT1 = 50
      FLAT5_4 = 40
      FLAT5_2 = 5
      FLAT5_1 = 5
      GRATE1  = 10
      GRATE2  = 10
      GRATE7  = 10
      FLOOR4_8 = 10
      FLOOR5_1 = 10
      FLOOR51C = 10
      FLOOR46D = 10
      FLOOR46E = 10
      DARKF01 = 10
      DARKF02 = 10
    }

    ceilings =
    {
      FLAT19 = 50
      FLAT5_4 = 20
      MFLR8_1 = 15
      FLAT5_2 = 5
      CEIL1_1 = 5
      FLAT5_2 = 5
      GRATE4  = 10
      GRATE8  = 10
    }

    cliff_mats =
    {
      GRNSTONE = 5
      HELLROK1 = 10
      RDROK1 = 15
      ROK04 = 30
      ROK05 = 30
      ROK12 = 30
      ROK13 = 30
      ROK14 = 30
      ROK15 = 30
      ROK20 = 30
      ROK21 = 30
      ROK22 = 30
      ROK23 = 30
      SKULLS = 10
      SKULLS2 = 10
      BODIESB = 10
      BODIESC = 10
    }
  }

  hell_fleshcraft =
  {
    env  = "building"
    prob = 50

    walls =
    {
     SKIN2 = 10
     SKIN3 = 10
     SKIN4 = 10
     SKINMET1 = 30
     SKINMET2 = 30
     SKINLOW1 = 30
     SKINMET3 = 20
     SKINMET4 = 20
     SKINMET5 = 30
     SKINMET6 = 10
     SKINMET7 = 10
     SKTEK01 = 15
     SKTEK02 = 15
    }

    floors =
    {
     FLAT5_1 = 50
     FLAT5_2 = 50
     FLAT5 = 30
     WOODTIL = 30
     WOODTI2 = 30
     FLOOR46D = 30
     FLOOR46E = 30
     G13 = 20
    }

    ceilings =
    {
     CEIL1_1 = 50
     FLAT5_2 = 50
     G02 = 30
     G03 = 30
     FLOOR7_2 = 15
     FLOOR7_3 = 15
    }

    cliff_mats =
    {
    SKSNAKE1 = 50
    SKSNAKE2 = 50
    SKINFACE = 50
    SKIN2    = 50
    SKIN4    = 50
    BODIESB   = 30
    BODIESC   = 20
    SKULLS2  = 50
    }
  }

  hell_blackened =
  {
    env  = "building"
    prob = 40

    walls =
    {
     KSTONE1 = 50
     KMARBLE2 = 50
     KMARBLE3 = 50
     KMARBLE1 = 20
    }

    floors =
    {
     BMARB1 = 50
     BMARB2 = 50
     BMARB3 = 20
    }

    ceilings =
    {
     BMARB3 = 100
     BMARB1 = 30
    }

    cliff_mats =
    {
    FIREBLK1 = 80
    BONES2  = 40
    BODIESC   = 20
    ESAND1 = 20
    ESAND2 = 20
    ASHWALL1 = 10
    ASH05 = 5
    }
  }

  hell_crimson =
  {
    env  = "building"
    prob = 40

    walls =
    {
     REDMARB1 = 20
     REDMARB2 = 60
     REDMARB3 = 60
    }

    floors =
    {
     RMARB1 = 50
     RMARB2 = 50
     RMARB3 = 20
    }

    ceilings =
    {
     RMARB3 = 100
     RMARB1 = 30
    }

    cliff_mats =
    {
      FIREBLU1 = 100
      RDROK1 = 50
      RDROK2 = 50
    }
  }

  -- MSSP
  hell_egyptish =
  {
    env = "building"
    prob = 120

    walls =
    {
      BRIKS03 = 15
      BRIKS06 = 15
      BRIKS12 = 15
      BRIKS14 = 15

      DESBRIK1 = 50
      DESBRIK2 = 50
      DESBRIK3 = 50
      DESBRIK4 = 50
      DESBRIK5 = 50
      DESBRIK6 = 50
      DESBRIK7 = 50

      DESMARB1 = 25
      DESMARB2 = 50

      EGYPT03 = 50
      EGYPT04 = 50
      EGYPT05 = 50
      EGYPT06 = 50
    }

    floors =
    {
      BRIK01 = 50
      EG01 = 50
      EG02 = 50
      EG03 = 50
      EG04 = 50
      EG05 = 15
      EG06 = 50

      GSTN03 = 50
      GSTN04 = 50
      GSTN05 = 50

      FLOOR0_1 = 20
      FLOOR3_3 = 20
      RROCK09 = 15
      RROCK10 = 15
      RROCK12 = 15
      RROCK15 = 15
    }

    ceilings =
    {
      EG01 = 50
      EG03 = 50
      EG06 = 50
      FLOOR0_1 = 50
      FLOOR3_3 = 50
      RROCK09 = 20
      RROCK10 = 20
      RROCK12 = 20
      RROCK15 = 20
    }
  }

  hell_armaetuscave =
  {
    env  = "cave"
    prob = 60

    walls =
    {
    RDROK1   = 80
    RDROK2   = 80
    SP_ROCK1 = 50
    ASHWALL2 = 50
    ASHWALL3 = 50
    ASHWALL4 = 50
    ASHWALL6 = 50
    ASHWALL7 = 50
    ASH05    = 50
    ROK04    = 35
    ROK05    = 35
    ROK12    = 35
    ROK13    = 35
    ROK14    = 30
    ROK15    = 30
    ROK20    = 20
    ROK21    = 20
    ROK22    = 20
    ROK23    = 20
    ROK24    = 15
    ROK25    = 15
    ROK26    = 10
    }

    floors =
    {
     FLAT10 = 60
     MFLR8_3 = 50
     RROCK03 = 50
     RROCK09 = 30
    }
  }

  hell_fireycave =
  {
    env  = "cave"
    prob = 60

    light_adjusts = { 32,48,64 }

    walls =
    {
      ROCKRED1 = 50
      HELLROK1 = 30
      RDROK1   = 20
      RDROK2   = 20
      CRACKRED = 15
      CRACKRD2 = 15
      FIREBLU1 = 15
      CRACKLE2 =  5
      CRACKLE4 =  5
      FIREBLK1 =  3
    }

    floors =
    {
      FLOOR6_2 = 40
      FLOOR6_1 = 20

      RROCK01  = 20
      RROCK05  = 20
      RROCK03  = 10
      RROCK02  = 5
    }
  }

  -- Hell has frozen over!
  hell_icecave =
  {
    env  = "cave"
    prob = 50

    light_adjusts = { 8,16,24 }

    walls =
    {
    SNOW03 = 50
    SNOW07 = 100
    SNOW08 = 100
    SNOW09 = 100
    SNOW10 = 100
    SNOW11 = 100
    SNOW12 = 100
    SNOW13 = 100
    SNOW14 = 100
    SNOW15 = 100
    }

    floors =
    {
    SNOW1 = 50
    SNOW5 = 50
    SNOW6 = 50
    SNOW7 = 50
    SNOW8 = 50
    }
  }

--  18 through 20 don't tile horizontally well so I removed them. 14 and 30 seems more like it works for exterior.
  urban_ArmaetusBricks =
  {
    env = "building"
    prob = 100

    walls =
    {
      BRIKS01 = 15
      BRIKS02 = 15
      BRIKS03 = 15
      BRIKS04 = 15
      BRIKS05 = 15
      BRIKS06 = 15
      BRIKS07 = 15
      BRIKS08 = 15
      BRIKS09 = 15
      BRIKS10 = 15
      BRIKS11 = 15
      BRIKS12 = 15
      BRIKS14 = 15
      BRIKS15 = 15
      BRIKS16 = 15
      BRIKS17 = 15
      BRIKS21 = 15
      BRIKS22 = 15
      BRIKS23 = 15
      BRIKS24 = 15
      BRIKS25 = 15
      BRIKS26 = 15
      BRIKS27 = 15
      BRIKS28 = 15
      BRIKS29 = 15
      BRIKS33 = 15
      BRIKS34 = 15
      BRIKS35 = 15
      BRIKS36 = 15
      BRIKS40 = 15
      BRIKS43 = 15

      URBAN1 = 15
      URBAN2 = 15
      URBAN3 = 15
    }

    floors =
    {
      FLAT1_1 = 25
      FLAT1_2 = 30
      FLAT1   = 30
      FLAT5   = 15
      FLAT5_1 = 25
      FLAT5_2 = 30
      FLAT5_4 = 20
      FLAT5_5 = 25
      FLAT8   = 30

      FLOOR0_1 = 20
      FLOOR0_2 = 20
      FLOOR0_3 = 20
      FLOOR4_6 = 20
      FLOOR5_3 = 25
      FLOOR5_4 = 10

      TILES1 = 80
      TILES2 = 80
      TILES3 = 80
      TILES4 = 80
      TILES5 = 80
      TILES6 = 80

      GMET04 = 80
      GMET05 = 80

      CARPET1 = 15
      CARPET2 = 15
      CARPET3 = 15
      CARPET4 = 15
      CARPET5 = 15
      CARPET6 = 15
      CARPET7 = 15
      CARPET8 = 15

      FFLAT01 = 80
    }

    ceilings =
    {
      FLAT1   = 50
      FLAT5_4 = 20
      FLAT5_5 = 15
      RROCK10 = 20
      RROCK14 = 20
      CEIL1_1 = 30
      FLAT5_2 = 10
      MFLR8_1 = 10
      SLIME13 = 5
    }
  }

  urban_MoreWood =
  {
    env = "building"
    prob = 75

    walls =
    {
      WOOD1 = 50
      WOOD3 = 50
      WOOD5 = 50
      WOOD12 = 50
      WOODVERT = 50
      WD03   = 50
      WD04   = 50
      WOOD15 = 50
      WOOD16 = 50
      WOOD17 = 50
      WOOD18 = 30
    }

    floors =
    {
      FLAT5_1 = 80
      FLAT5_2 = 80
      FLAT5_5 = 50

      CARPET1 = 15
      CARPET2 = 15
      CARPET3 = 15
      CARPET4 = 15
      CARPET5 = 15
      CARPET6 = 15
      CARPET7 = 15
      CARPET8 = 15

      WOODTIL = 30
      WOODTI2 = 30
      FFLAT01 = 30
    }

    ceilings =
    {
    CEIL1_1 = 70
    FLAT5_2 = 50
    GSTN01  = 30
    GSTN02  = 30
    SLIME14 = 20
    SLIME15 = 20

    }
  }

  -- MSSP: anything that vaguely looks like cement
  urban_Cement =
  {
    env = "building"
    prob = 100

    walls =
    {
      CEM01 = 50
      CEM02 = 50
      CEM06 = 50
      CEM07 = 50
      CEM09 = 50
      CEM10 = 100
      CEM11 = 100
      STON7 = 100
      STONE10 = 100
      STONE8 = 100
      STONE9 = 75
    }

    floors =
    {
      FFLAT01 = 100
      SHINY01 = 50
      SHINY02 = 50
      STARGRF = 50
      TILES4 = 100
      TILES5 = 100
      TILES6 = 100
      FLOOR4_7 = 100

      FLOOR1_6 = 75
      FLAT14 = 75

      FLAT3 = 25
      FLAT4 = 15
      FLAT18 = 25
      FLAT19 = 25
      FLAT20 = 25
      FLAT1 = 50
      FLOOR0_5 = 75
      FLOOR0_3 = 75
    }

    ceilings =
    {
      FLAT1 = 50
      FLAT18 = 50
      FLAT19 = 50
      FLAT3 = 25
      FLAT5_4 = 50
    }
  }

  urban_armaetuscave =
  {
    env  = "cave"
    prob = 60

    walls =
    {

    SP_ROCK1 = 30
    ASHWALL2 = 50
    ASHWALL3 = 50
    ASHWALL4 = 50
    ASHWALL6 = 50
    ASHWALL7 = 50
    ASH05    = 50
    ROK04    = 35
    ROK05    = 35
    ROK12    = 35
    ROK13    = 35
    ROK14    = 30
    ROK15    = 30
    ROK20    = 20
    ROK21    = 20
    ROK22    = 20
    ROK23    = 20
    ROK24    = 15
    ROK25    = 15
    ROK26    = 10
    }

    floors =
    {
     FLAT10 = 60
     MFLR8_3 = 50
     RROCK03 = 50
     RROCK09 = 30
     FLAT5_4 = 10
    }
  }

}

-- Adds new facade texture inserts (outdoor building textures)
ARMAETUS_TECH_FACADES =
{

  STARTAN3 = 50
  STARG3 = 50
  BRONZE1 = 25
  BRONZE3 = 25
  BRONZE5 = 15
  BRONZE6 = 10
  BRONZEG3 = 10

  GRAY6 = 25
  GRAY8 = 25
  GRAY9 = 25

  STONE  = 20
  STONE2 = 20
  STONE3 = 20

  BROWN1 = 20
  BROWNGRN = 20
  BRVINE = 20
  BROVINE2 = 20
  BROWNGR2 = 10
  BROWNGR3 = 10
  BROWNGR4 = 10
  GRAYVINE = 10

  TEKGREN2 = 15
  TEKSHAW  = 15
  TEKGRY01 = 15
  TEKGRY02 = 10

  GRAYMET2 = 10
  GRAYMET3 = 10
  GRAYMET4 = 10
  GRAYMET5 = 10
  BROWN2   = 10
  BROWN3   = 10


  METAL8 = 12
  METAL9 = 12
  METAL10 = 12

  SHAWN4 = 15
  SHAWN5 = 15
  HEX01 = 15
}

ARMAETUS_HELL_FACADES =
{
  GSTONE1 = 50
  WOOD5   = 50
  WOOD3   = 50

  MARBLE  = 25
  MARBLE1 = 25
  MARBLE2 = 25
  MARBLE3 = 25
  MARBGRAY = 25
  BLAKMBGY = 20

  SP_HOT1 = 20
  SP_HOT2 = 20
  SP_HOT3 = 20
  STONE   = 20
  STONE4  = 15
  STONE6  = 15
  STONE8  = 5
  STONE9  = 5

  GOTH08 = 20
  GOTH09 = 20
  GOTH10 = 20
  GOTH11 = 20
  GOTH28 = 10
  GOTH29 = 20
  GOTH30 = 20
  GOTH31 = 20
  BRIKS35 = 15
  BRIKS36 = 15
  GSTONE3 = 10

  MARBLE4 = 15
  MARBLE5 = 15
  MARBLE6 = 15
  MARBLE7 = 10
  MARBLE8 = 10
  MM205   = 15
  MM206   = 10
  MM207   = 10
  MM208   = 3

  HELMET1 = 20
  HELMET2 = 20
  CATACMB3 = 10
  CATACMB6 = 10

  HELLCMT1 = 15
  HELLCMT8 = 15
  SKTEK01 = 15
  SKTEK02 = 15
  KSTONE1 = 10
  KMARBLE2 = 5
  KMARBLE3 = 5
  KMARBLE1 = 5

  SKINMET3 = 15
  SKINMET4 = 15
  SKINMET5 = 15
  SKINMET6 = 5
  SKINMET7 = 5
  VINES1   = 5
  VINES2   = 5
  VINES3   = 5
  VINES4   = 5
  WDMET03  = 5

  BROWN1   = 5
  BRVINE   = 10

}

ARMAETUS_URBAN_FACADES =
{

  BIGBRIK1 = 50
  BIGBRIK2 = 50
  STUCCO   = 50
  STUCCO1  = 20
  STUCCO3  = 20

  BSTONE1 = 25
  BSTONE2 = 25

  BRICK1 = 25
  BRICK10 = 25
  BRICK11 = 25
  BRICK12 = 25
  BRICK5  = 25
  BRICK6  = 25
  BRICK7  = 25
  BRICK8  = 25
  BRICK9  = 25

  STONE    = 25
  BIGSTONE = 25
  BIGSTON2 = 25
  BIGSTON3 = 25
  BIGSTON4 = 25
  STONE2   = 15
  STONE3   = 15

  BRIKS01 = 20
  BRIKS02 = 20
  BRIKS04 = 20
  BRIKS05 = 20
  BRIKS06 = 20
  BRIKS10 = 20
  BRIKS12 = 20
  BRIKS13 = 20
  BRIKS14 = 20
  BRIKS15 = 20
  BRIKS16 = 20
  BRIKS17 = 20
  BRIKS21 = 20
  BRIKS22 = 20
  BRIKS23 = 20
  BRIKS24 = 20
  BRIKS25 = 10
  BRIKS26 = 20
  BRIKS27 = 20
  BRIKS28 = 10
  BRIKS29 = 15
  BRIKS30 = 10
  BRIKS31 = 10
  BRIKS32 = 10
  BRIKS33 = 15
  BRIKS34 = 20
  BRIKS35 = 15
  BRIKS36 = 15
  BRIKS37 = 10
  BRIKS38 = 10
  BRIKS39 = 15
  BRIKS40 = 10
  BRIKS41 = 10
  BRIKS42 = 15
  BRIKS43 = 20
  GOTH45  = 20
  ROK17   = 20
  ROK18   = 20
  ROK19   = 15

  URBAN1 = 20
  URBAN2 = 20
  URBAN3 = 20
  URBAN4 = 20

  METAL2 = 15
  BRONZE1 = 10
  BRONZE3 = 10

}

-- Custom liquids
ARMAETUS_TECH_LIQUIDS =
{
  hotlava = 3
  magma   = 3
  qlava   = 3
  purwater = 15
  sludge  = 40
  gwater  = 50
  ice     = 20
  ice2    = 20
}

ARMAETUS_URBAN_LIQUIDS =
{
  hotlava = 5
  magma   = 5
  qlava   = 5
  purwater = 20
  sludge  = 60
  gwater  = 60
  ice     = 20
  ice2    = 20
}

ARMAETUS_HELL_LIQUIDS =
{
  hotlava = 80
  magma   = 80
  qlava   = 80
  purwater = 5
  sludge  = 20
  gwater  = 25
  ice     = 40
  ice2    = 40
}

-- Custom sink definitions as well as probability tables.
ARMAETUS_SINK_DEFS =
{
  liquid_warning_strip =
  {
    mat = "_LIQUID"
    dz  = -8

    trim_mat = "WARN1"
    trim_dz  = 0
  }

  light_TLITE5_1 =
  {
    mat = "TLITE5_1"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_TLITE5_2 =
  {
    mat = "TLITE5_2"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_TLITE5_3 =
  {
    mat = "TLITE5_3"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_TLITE65B =
  {
    mat = "TLITE65B"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_TLITE65G =
  {
    mat = "TLITE65G"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_TLITE65O =
  {
    mat = "TLITE65O"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_TLITE65W =
  {
    mat = "TLITE65W"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_TLITE65Y =
  {
    mat = "TLITE65Y"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_LIGHTS1 =
  {
    mat = "LIGHTS1"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_LIGHTS2 =
  {
    mat = "LIGHTS2"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_LIGHTS3 =
  {
    mat = "LIGHTS3"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_LIGHTS4 =
  {
    mat = "LIGHTS4"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_GLITE01 =
  {
    mat = "GLITE01"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_GLITE02 =
  {
    mat = "GLITE02"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_GLITE03 =
  {
    mat = "GLITE03"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_GLITE04 =
  {
    mat = "GLITE04"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_GLITE05 =
  {
    mat = "GLITE05"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_GLITE06 =
  {
    mat = "GLITE06"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_GLITE07 =
  {
    mat = "GLITE07"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_GLITE08 =
  {
    mat = "GLITE08"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_GLITE09 =
  {
    mat = "GLITE09"
    dz  = 8
    light = 32

    trim_mat = "METAL"
    trim_dz  = -5
    trim_light = 16
  }

  light_COLLITE1 = -- green
  {
    mat = "LITES04"
    dz = 62
    light = 32

    trim_mat = "COLLITE1"
    trim_dz = -2
    trim_light = 24
  }

  light_COLLITE2 = -- orange
  {
    mat = "LITES03"
    dz = 62
    light = 32

    trim_mat = "COLLITE2"
    trim_dz = -2
    trim_light = 24
  }

  light_COLLITE3 = -- blue
  {
    mat = "LITES02"
    dz = 62
    light = 32

    trim_mat = "COLLITE3"
    trim_dz = -2
    trim_light = 24
  }

  light_RDWAL01 = -- red
  {
    mat = "LITES01"
    dz = 62
    light = 32

    trim_mat = "RDWAL01"
    trim_dz = -2
    trim_light = 24
  }

  ceiling_sink_TEKWALL8 = -- red
  {
    mat = "TEKWALL8"
    dz = 8
    light = 32

    trim_mat = "METAL7"
    trim_dz = -8
    light = 16
  }

  ceiling_sink_TEKWALL9 = -- green
  {
    mat = "TEKWALL9"
    dz = 8
    light = 32

    trim_mat = "METAL7"
    trim_dz = -8
    light = 16
  }

  ceiling_sink_TEKWALLA = -- purple
  {
    mat = "TEKWALLA"
    dz = 8
    light = 32

    trim_mat = "METAL7"
    trim_dz = -8
    light = 16
  }

  ceiling_sink_TEKWALLB = -- blue
  {
    mat = "TEKWALLB"
    dz = 8
    light = 32

    trim_mat = "METAL7"
    trim_dz = -8
    light = 16
  }

  ceiling_sink_TEKWALLC = -- pink
  {
    mat = "TEKWALLC"
    dz = 8
    light = 32

    trim_mat = "METAL7"
    trim_dz = -8
    light = 16
  }

  ceiling_sink_TEKWALLD = -- cyan
  {
    mat = "TEKWALLD"
    dz = 8
    light = 32

    trim_mat = "METAL7"
    trim_dz = -8
    light = 16
  }

  ceiling_sink_TEKWALLE = -- orange
  {
    mat = "TEKWALLE"
    dz = 8
    light = 32

    trim_mat = "METAL7"
    trim_dz = -8
    light = 16
  }

  ceiling_sink_SILVER2R = -- silver lights red
  {
    mat = "LITES01"
    dz = 58
    light = 32

    trim_mat = "SILVER2R"
    trim_dz = -16
    light = 16
  }

  ceiling_sink_SILVER2O = -- silver lights orange
  {
    mat = "LITES03"
    dz = 58
    light = 32

    trim_mat = "SILVER2O"
    trim_dz = -16
    light = 16
  }

  ceiling_sink_SILVER2Y = -- silver lights yellow
  {
    mat = "LITES03"
    dz = 58
    light = 32

    trim_mat = "SILVER2Y"
    trim_dz = -16
    light = 16
  }

  ceiling_sink_SILVER2W = -- silver lights white
  {
    mat = "LIGHTS3"
    dz = 58
    light = 32

    trim_mat = "SILVER2W"
    trim_dz = -16
    light = 16
  }

  ceiling_sink_SILVER2G = -- silver lights green
  {
    mat = "LITES04"
    dz = 58
    light = 32

    trim_mat = "SILVER2G"
    trim_dz = -16
    light = 16
  }

  -- hell cielings

  ceiling_sink_SKINLOW1 =
  {
    mat = "SKINFLT1"
    dz = 112
    light = 16

    trim_mat = "SKINLOW1"
    trim_dz = -16
    light = 8
  }

  ceiling_sink_SKINMET3 =
  {
    mat = "SKINFLT1"
    dz = 112
    light = 16

    trim_mat = "SKINMET3"
    trim_dz = -16
    light = 8
  }

  ceiling_sink_SKINMET4 =
  {
    mat = "SKINFLT1"
    dz = 112
    light = 16

    trim_mat = "SKINMET4"
    trim_dz = -16
    light = 8
  }

  ceiling_sink_SKINMET5 =
  {
    mat = "SKINFLT1"
    dz = 112
    light = 16

    trim_mat = "SKINMET5"
    trim_dz = -16
    light = 8
  }

  ceiling_sink_SKINMET6 =
  {
    mat = "SKINFLT1"
    dz = 112
    light = 16

    trim_mat = "SKINMET6"
    trim_dz = -16
    light = 8
  }

  ceiling_sink_SKINMET7 =
  {
    mat = "FLAT5_3"
    dz = 112
    light = 16

    trim_mat = "SKINMET7"
    trim_dz = -16
    light = 8
  }

  ceiling_sink_GOTH18 = -- metal tiles
  {
    mat = "DARKF03"
    dz = 64
    light = 16

    trim_mat = "GOTH18"
    trim_dz = 0
    light = 8
  }

  ceiling_sink_GOTH19 = -- tall red cross
  {
    mat = "GLITE04"
    dz = 128
    light = 16

    trim_mat = "GOTH19"
    trim_dz = 0
    light = 8
  }

  ceiling_sink_GOTH20 = -- small red cross
  {
    mat = "GLITE03"
    dz = 96
    light = 16

    trim_mat = "GOTH20"
    trim_dz = 0
    light = 8
  }

  ceiling_sink_GOTH21 = -- horizontal red line
  {
    mat = "GLITE04"
    dz = 32
    light = 16

    trim_mat = "GOTH21"
    trim_dz = 0
    light = 8
  }

  ceiling_sink_GOTH15 = -- double dark trimmed
  {
    mat = "DARKM01"
    dz = 128

    trim_mat = "GOTH15"
    trim_dz = 0
  }

  ceiling_sink_GOTH17 = -- wide beam
  {
    mat = "DARKF03"
    dz = 32

    trim_mat = "GOTH17"
    trim_dz = 0
  }

  ceiling_sink_GOTH28 = -- scary faces
  {
    mat = "G05"
    dz = 128

    trim_mat = "GOTH28"
    trim_dz = 0
  }

  ceiling_sink_GOTH47 = -- small brown skulls
  {
    mat = "G09"
    dz = 48

    trim_mat = "GOTH47"
    trim_dz = -16
  }

  ceiling_sink_GOTH48 = -- large brown skulls
  {
    mat = "GMET02"
    dz = 48

    trim_mat = "GOTH48"
    trim_dz = -16
  }

  ceiling_sink_GOTH49 = -- inset brown skulls
  {
    mat = "G14"
    dz = 48

    trim_mat = "GOTH49"
    trim_dz = -16
  }

  -- hell floors
  floor_sink_GOTH22 =
  {
    mat = "GMET04"
    dz = -16

    trim_mat = "GOTH22"
    trim_dz = 0
  }

  -- urban-ish carpets -MSSP
  floor_sink_CARPET1 =
  {
    mat = "CARPET1"
    dz = 0

    trim_mat = "ORANFLOR"
    trim_dz = 0
  }

  floor_sink_CARPET1 =
  {
    mat = "CARPET1"
    dz = 0

    trim_mat = "ORANFLOR"
    trim_dz = 0
  }

  floor_sink_CARPET1 =
  {
    mat = "CARPET1"
    dz = 0

    trim_mat = "ORANFLOR"
    trim_dz = 0
  }

  floor_sink_CARPET2 =
  {
    mat = "CARPET2"
    dz = 0

    trim_mat = "ORANFLOR"
    trim_dz = 0
  }

  floor_sink_CARPET2 =
  {
    mat = "CARPET2"
    dz = 0

    trim_mat = "CEIL5_1"
    trim_dz = 0
  }

  floor_sink_CARPET3 =
  {
    mat = "CARPET3"
    dz = 0

    trim_mat = "ORANFLOR"
    trim_dz = 0
  }

  floor_sink_CARPET4 =
  {
    mat = "CARPET4"
    dz = 0

    trim_mat = "CEIL5_1"
    trim_dz = 0
  }

  floor_sink_CARPET5 =
  {
    mat = "CARPET5"
    dz = 0

    trim_mat = "CEIL5_1"
    trim_dz = 0
  }

  floor_sink_CARPET6 =
  {
    mat = "CARPET6"
    dz = 0

    trim_mat = "CEIL5_1"
    trim_dz = 0
  }

  floor_sink_CARPET7 =
  {
    mat = "CARPET7"
    dz = 0

    trim_mat = "ORANFLOR"
    trim_dz = 0
  }

  floor_sink_CARPET8 =
  {
    mat = "CARPET8"
    dz = 0

    trim_mat = "FLAT19"
    trim_dz = 0
  }

  -- tech carpets
  floor_sink_carpet_FLAT15 =
  {
    mat = "FLAT15"
    dz = 0

    trim_mat = "FASHBLU"
    trim_dz = 0
  }

  floor_sink_carpet_FLOOR1_1 =
  {
    mat = "FLOOR1_1"
    dz = 0

    trim_mat = "FLAT15"
    trim_dz = 0
  }

  floor_sink_carpet_FLOOR1_2 =
  {
    mat = "FLOOR1_2"
    dz = 0

    trim_mat = "FASHBLU"
    trim_dz = 0
  }
}

ARMAETUS_TECH_CEILING_SINKS =
{
  light_TLITE5_1 = 7
  light_TLITE5_2 = 7
  light_TLITE5_3 = 7
  light_TLITE65B = 7
  light_TLITE65G = 7
  light_TLITE65O = 7
  light_TLITE65W = 7
  light_TLITE65Y = 7
  light_LIGHTS1 = 7
  light_LIGHTS2 = 7
  light_LIGHTS3 = 7
  light_LIGHTS4 = 7

  light_COLLITE1 = 15
  light_COLLITE2 = 15
  light_COLLITE3 = 15
  light_RDWAL01 = 15

  ceiling_sink_TEKWALL8 = 8
  ceiling_sink_TEKWALL9 = 8
  ceiling_sink_TEKWALLA = 8
  ceiling_sink_TEKWALLB = 8
  ceiling_sink_TEKWALLC = 8
  ceiling_sink_TEKWALLD = 8
  ceiling_sink_TEKWALLE = 8

  ceiling_sink_SILVER2R = 5
  ceiling_sink_SILVER2O = 5
  ceiling_sink_SILVER2Y = 5
  ceiling_sink_SILVER2W = 5
  ceiling_sink_SILVER2G = 5

  ceiling_sink_GOTH21 = 15
}

ARMAETUS_URBAN_CEILING_SINKS =
{
  light_TLITE5_1 = 7
  light_TLITE5_2 = 7
  light_TLITE5_3 = 7
  light_TLITE65B = 7
  light_TLITE65G = 7
  light_TLITE65O = 7
  light_TLITE65W = 7
  light_TLITE65Y = 7
  light_LIGHTS1 = 7
  light_LIGHTS2 = 7
  light_LIGHTS3 = 7
  light_LIGHTS4 = 7

  light_COLLITE1 = 15
  light_COLLITE2 = 15
  light_COLLITE3 = 15
  light_RDWAL01 = 15

  ceiling_sink_TEKWALL8 = 7
  ceiling_sink_TEKWALL9 = 7
  ceiling_sink_TEKWALLA = 7
  ceiling_sink_TEKWALLB = 7
  ceiling_sink_TEKWALLC = 7
  ceiling_sink_TEKWALLD = 7
  ceiling_sink_TEKWALLE = 7

  ceiling_sink_GOTH15 = 20
  ceiling_sink_GOTH17 = 20
  ceiling_sink_GOTH21 = 20
}

ARMAETUS_HELL_CEILING_SINKS =
{
  light_GLITE01 = 10
  light_GLITE02 = 10
  light_GLITE03 = 10
  light_GLITE04 = 10
  light_GLITE05 = 10
  light_GLITE06 = 10
  light_GLITE07 = 10
  light_GLITE08 = 10
  light_GLITE09 = 10

  ceiling_sink_SKINLOW1 = 13
  ceiling_sink_SKINMET3 = 13
  ceiling_sink_SKINMET4 = 13
  ceiling_sink_SKINMET5 = 13
  ceiling_sink_SKINMET6 = 13
  ceiling_sink_SKINMET7 = 13

  ceiling_sink_GOTH15 = 20
  ceiling_sink_GOTH17 = 20
  ceiling_sink_GOTH18 = 20
  ceiling_sink_GOTH19 = 20
  ceiling_sink_GOTH20 = 20
  ceiling_sink_GOTH28 = 20

  ceiling_sink_GOTH47 = 20
  ceiling_sink_GOTH48 = 20
  ceiling_sink_GOTH49 = 20
}

ARMAETUS_TECH_FLOOR_SINKS =
{
  liquid_warning_strip = 10

  floor_sink_carpet_FLAT15 = 10
  floor_sink_carpet_FLOOR1_1 = 10
  floor_sink_carpet_FLOOR1_2 = 10
}

ARMAETUS_URBAN_FLOOR_SINKS =
{
  liquid_warning_strip = 10

  floor_sink_CARPET1 = 7
  floor_sink_CARPET2 = 7
  floor_sink_CARPET3 = 7
  floor_sink_CARPET4 = 7
  floor_sink_CARPET5 = 7
  floor_sink_CARPET6 = 7
  floor_sink_CARPET7 = 7
  floor_sink_CARPET8 = 7
}

ARMAETUS_HELL_FLOOR_SINKS =
{
  floor_sink_GOTH22 = 10

  floor_sink_CARPET1 = 7
  floor_sink_CARPET2 = 7
  floor_sink_CARPET3 = 7
  floor_sink_CARPET4 = 7
  floor_sink_CARPET5 = 7
  floor_sink_CARPET6 = 7
  floor_sink_CARPET7 = 7
  floor_sink_CARPET8 = 7
}

-- Natural textures for outdoor parks.
ARMAETUS_TECH_NATURALS =
{
  ALTASH = 20
  ASH05 = 20
  ROK04 = 30
  ROK05 = 10
  ROK06 = 30
  ROK12 = 50
  ROK13 = 30
  ROK14 = 30
  ROK15 = 30
  ROK20 = 20
  ROK21 = 50
  ROK22 = 30
  ROK23 = 20
  VINES1 = 10
  VINES2 = 10
  VINES3 = 10
  VINES4 = 10
  MOSROK3 = 10
}

ARMAETUS_URBAN_NATURALS =
{
  ALTASH = 15
  ROK03 = 20
  ROK04 = 30
  ROK05 = 20
  ROK06 = 40
  ROK12 = 60
  ROK13 = 40
  ROK14 = 35
  ROK15 = 50
  ROK20 = 40
  ROK21 = 35
  ROK22 = 30
  ROK23 = 20
  VINES1 = 20
  VINES2 = 20
  VINES3 = 20
  VINES4 = 20
  MOSROK3 = 20
}

ARMAETUS_HELL_NATURALS =
{
  ALTASH = 20
  ASH05 = 40
  ASHWALL1 = 10
  ROK05 = 15
  ROK12 = 10
  ROK21 = 15
  HELLROK1 = 40
  RDROK1 = 30
  RDROK2 = 35
  SKIN3 = 6
  SKIN4 = 6
  VINES1 = 3
  VINES2 = 3
  VINES3 = 3
  VINES4 = 3
}

-- Adds custom ObAddon scenic fence textures to the set
ARMAETUS_TECH_SCENIC_FENCES =
{
  FENCE1 = 10
  FENCE2 = 10
  FENCE3 = 7
  FENCE6 = 5
  FENCE7 = 5
  FENCE8 = 5
  FENCE9 = 3
  FENCEA = 5
  FENCEB = 3
  FENCEC = 4
  RAIL1 = 10
  MIDWIND4 = 3
  MIDWIND6 = 3
  MIDSPAC2 = 2
  MIDSPAC4 = 5
  MIDSPAC5 = 5
  MIDSPAC8 = 3
  MIDVINE1 = 1
  MIDVINE2 = 1
}

ARMAETUS_URBAN_SCENIC_FENCES =
{
  FENCE1 = 2
  FENCE2 = 2
  FENCE3 = 5
  FENCE6 = 10
  FENCE7 = 10
  FENCE8 = 4
  FENCE9 = 4
  FENCEA = 4
  FENCEB = 4
  FENCEC = 5
  RAIL1 = 10
  MIDSPAC2 = 4
  MIDSPAC3 = 1
  MIDSPAC5 = 2
  MIDSPAC8 = 3
  MIDWIND1 = 10
  MIDWIND2 = 2
  MIDWIND3 = 2
  MIDWIND4 = 10
  MIDWIND5 = 2
  MIDWIND6 = 10
  MIDWIND7 = 2
  MIDVINE1 = 3
  MIDVINE2 = 3
}

ARMAETUS_HELL_SCENIC_FENCES =
{
  FENCE2 = 5
  FENCE4 = 10
  FENCE5 = 10
  FENCE8 = 2
  FENCE9 = 4
  FENCEA = 2
  FENCEB = 4
  FENCEC = 3
  RAIL1 = 4
  MIDVINE1 = 4
  MIDVINE2 = 4
  MIDWIND1 = 7
  MIDWIND2 = 10
  MIDWIND3 = 7
  MIDWIND4 = 4
  MIDWIND5 = 8
  MIDWIND6 = 5
  MIDWIND7 = 7
  MIDSPAC2 = 5
  MIDSPAC3 = 5
  MIDSPAC6 = 5
  MIDSPAC7 = 2
  MIDSPAC8 = 4
}

-- Adds group wall sets using Epic textures
ARMAETUS_TECH_WALL_GROUPS =
{
  gtd_wall_server_room2 = 25
  gtd_collite_set_green = 7
  gtd_collite_set_orange = 7
  gtd_collite_set_blue = 7
  gtd_collite_set_red = 7
  gtd_wall_lit_box_blue = 9
  gtd_wall_lit_box_red = 9
  gtd_wall_lit_box_white = 9
}

ARMAETUS_URBAN_WALL_GROUPS =
{
  gtd_tall_glass_epic_yellow = 2
  gtd_tall_glass_epic_orange = 2
  gtd_tall_glass_epic_red = 2
  gtd_tall_glass_epic_blue = 2
  armaetus_glass_huge = 3
  gtd_winglass_wall = 4
  gtd_collite_set_green = 1
  gtd_collite_set_orange = 1
  gtd_collite_set_blue = 1
  gtd_collite_set_red = 1
  gtd_wall_lit_box_blue = 3
  gtd_wall_lit_box_red = 3
  gtd_wall_lit_box_white = 3
}

ARMAETUS_HELL_WALL_GROUPS =
{
  gtd_tall_glass_epic_yellow = 15
  gtd_tall_glass_epic_orange = 15
  gtd_tall_glass_epic_red = 15
  gtd_tall_glass_epic_blue = 15
  armaetus_glass_huge = 25
  armaetus_catacomb_wall_set = 40
  gtd_winglass_wall = 40
  gtd_collite_set_green = 6
  gtd_collite_set_orange = 6
  gtd_collite_set_blue = 6
  gtd_collite_set_red = 6
  gtd_g99 = 30
}


-- Adds new window groups using Epic textures
ARMAETUS_TECH_WINDOW_GROUPS =
{
}

ARMAETUS_URBAN_WINDOW_GROUPS =
{
  gtd_window_gothic_epic = 30
}

ARMAETUS_HELL_WINDOW_GROUPS =
{
  gtd_window_gothic_epic = 80
}


-- tables for the Epic skyboxes
ARMAETUS_TECH_SKYBOXES =
{
  Skybox_tech_ffvii_EPIC = 50
  Skybox_generic_EPIC = 50
  Skybox_craneo_fishing_village_EPIC = 25
  Skybox_garrett_winterfall_EPIC = 12
}

ARMAETUS_URBAN_SKYBOXES =
{
  Skybox_hellish_city_EPIC = 50
  Skybox_garrett_city_EPIC = 50
  Skybox_craneo_fishing_village_EPIC = 50
  Skybox_garrett_winterfall_EPIC = 25
  Skybox_craneo_egypt_EPIC = 35
}

ARMAETUS_HELL_SKYBOXES =
{
  Skybox_hellish_city_EPIC = 50
  Skybox_garrett_hell_EPIC = 50
  Skybox_garrett_winterfall_EPIC = 35
  Skybox_craneo_egypt_EPIC = 35
}


-- exclude tables for specific environment themes
ARMAETUS_EXCLUDE_DESERT_SKYBOXES =
{
  "Skybox_craneo_egypt_EPIC"
}

ARMAETUS_EXCLUDE_SNOW_SKYBOXES =
{
  "Skybox_garrett_winterfall_EPIC"
}

-- intercepts for the new environment theme feature

ARMAETUS_SNOW_OUTDOORS =
{
  floors =
  {
    SNOW1 = 25
    SNOW5 = 25
    SNOW6 = 25
    SNOW7 = 25
    SNOW8 = 25
    SNOW10F = 25
    SNOW11F = 25
    SNOW12F = 25
    SNOW13F = 25
    SNOW14F = 25
    SNOWBRIK = 15
    SNOWROCK = 15
    SNOWSTON = 15
    SNOWWAL1 = 10 -- These four use shiny flats, thus lower chance!
    SNOWWAL2 = 10
    SNOWWAL3 = 10
    SNOWWAL4 = 10
    SNOW03=50
    SNOW04=50
    SNOW06=50
    SNOW07=50
    SNOW08=50
    SNOW09=50
    SNOW10=50
    SNOW11=50
    SNOW12=50
    SNOW13=50
    SNOW14=50
    SNOW15=50
  }

  naturals =
  {
   SNOW03 = 50
   SNOW06 = 50
   SNOW07 = 50
   SNOW08 = 50
   SNOW09 = 50
   SNOW10 = 50
   SNOW11 = 50
   SNOW12 = 50
   SNOW13 = 30
   SNOW14 = 30
   SNOW15 = 50
  }
}

ARMAETUS_SNOW_CLIFF_MATS =
{
  SNOWROCK = 50
  SNOWSTON = 50
  SNOW03 = 50
  SNOW04 = 50
  SNOW05 = 15
  SNOW06 = 50
  SNOW07 = 50
  SNOW08 = 50
  SNOW09 = 50
  SNOW10 = 50
  SNOW11 = 50
  SNOW12 = 50
  SNOW13 = 30
  SNOW14 = 30
  SNOW15 = 50
}

-- Snowed-in building facades, per map theme type

ARMAETUS_SNOW_TECH_FACADES =
{
  SNOWWAL1 = 50
  SNOWWAL2 = 50
  SNOWWAL3 = 50
  SNOWWAL4 = 50
  STONE2   = 35
  STONE10  = 30
  BIGSTONE = 20
  BRIKS01   = 30
  BRIKS11   = 20
  BRIKS32   = 60
  BRIKS34   = 35
  BRIKS36   = 25
  BRIKS43   = 40
  BRONZEG3  = 20
  CEM10     = 30
}

ARMAETUS_SNOW_URBAN_FACADES =
{
  SNOW01 = 50
  SNOW02 = 20
  SNOW05 = 10
  SNOWWAL1 = 50
  SNOWWAL2 = 50
  SNOWWAL3 = 30
  SNOWWAL4 = 20
  STONE2   = 30
  BIGSTONE = 20
  BRIKS01   = 30
  BRIKS11   = 20
  BRIKS32   = 60
  BRIKS34   = 35
  BRIKS36   = 25
  BRIKS39   = 20
  BRIKS43   = 40
  BRONZEG3  = 20
  CEM10     = 30
  GOTHJ1    = 15
  STONE10   = 20
}

ARMAETUS_SNOW_HELL_FACADES =
{
  SNOWWAL1 = 70
  SNOWWAL2 = 70
  SNOWWAL3 = 70
  SNOWWAL4 = 70
  STONE2   = 50
  STONE3   = 40
  BIGSTONE = 30
  BRIKS01   = 30
  BRIKS11   = 20
  BRIKS32   = 60
  BRIKS34   = 35
  BRIKS36   = 25
  BRIKS43   = 40
  BRONZEG3  = 20
  CEM10     = 30
  GOTH09    = 20
  GOTH11    = 30
  GOTH12    = 10
  GOTH15    = 20
  GOTH26    = 30
  GOTH27    = 20
  GOTH28    = 25
  GOTH31    = 35
  GOTH36    = 20
  GOTH37    = 20
  KSTONE1   = 20
  METAL2    = 15
  ROK17     = 25
  ROK18     = 25
  SNOW02    = 20
  SNOW05    = 20
  STONE10   = 15
}

ARMAETUS_DESERT_OUTDOORS =
{
  floors =
  {
    SAND1 = 100
    SAND2 = 100
    SAND3 = 100
    SAND4 = 100
    SAND5 = 100
    SAND6 = 100
    SAND7 = 100
    EG06  = 15
    EG05  = 10
    EG03  = 15
    EG02  = 10
    EG01  = 15
  }

  naturals =
  {
    ESAND1 = 45
    ESAND2 = 45
    DESROCK1 = 20
    DESROCK2 = 20
    DESROCK3 = 20
    DESROCK4 = 25
    DESROCK5 = 20
  }
}

ARMAETUS_DESERT_CLIFF_MATS =
{
  DESROCK1 = 20
  DESROCK2 = 20
  DESROCK3 = 20
  DESROCK4 = 25
  DESROCK5 = 20
}

ARMAETUS_DESERT_FACADES =
{
  BSTONE1 = 15
  BSTONE2 = 15
  STUCCO  = 15
  DESBRIK1 = 80
  DESBRIK2 = 80
  DESBRIK3 = 80
  DESBRIK4 = 80
  DESBRIK5 = 80
  DESBRIK6 = 80
  DESBRIK7 = 80
  DESMARB1 = 50
  DESMARB2 = 50
  EGYPT04  = 25
  EGYPT05  = 25
  EGYPT06  = 25
}

ARMAETUS_DESERT_URBAN_FACADES =
{
  BSTONE1 = 20
  BSTONE2 = 20
  STUCCO  = 20
  DESBRIK1 = 60
  DESBRIK2 = 60
  DESBRIK3 = 60
  DESBRIK4 = 60
  DESBRIK5 = 60
  DESBRIK6 = 60
  DESBRIK7 = 60
  DESMARB1 = 35
  DESMARB2 = 35
  EGYPT04  = 15
  EGYPT05  = 15
  EGYPT06  = 15
}

ARMAETUS_DESERT_HELL_FACADES =
{
  BSTONE1 = 25
  BSTONE2 = 25
  STUCCO  = 25
  BRIKS12 = 10
  BRIKS14 = 10
  BRIKS15 = 10
  DESBRIK1 = 80
  DESBRIK2 = 80
  DESBRIK3 = 80
  DESBRIK4 = 80
  DESBRIK5 = 80
  DESBRIK6 = 80
  DESBRIK7 = 80
  DESMARB1 = 55
  DESMARB2 = 55
  EGYPT04  = 35
  EGYPT05  = 35
  EGYPT06  = 35
}

ARMAETUS_NARROW_HALLWAYS =
{
}

ARMAETUS_WIDE_HALLWAYS =
{
  ducts = 50
}
