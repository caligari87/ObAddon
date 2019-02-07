------------------------------------------------------------------------
--  GRAMMAR RULES
------------------------------------------------------------------------
--
--  Oblige Level Maker
--
--  Copyright (C) 2015-2017 Andrew Apted
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
------------------------------------------------------------------------

--[[
 MSSP's hints:
 * Do not define a shape rule with new enclaved areas for caves. Caves never have new "areas".
 * Do not allow water tiles on the edges of shape rules, unless it's only for indoors.
     If you really want it though, pad the edges with a # tile i.e.
     "11##"
     "11~#"
     "11~#"
     "11~#"
     "11##"
     Oblige seems to have an issue when certain shapes have adjecant water tiles and are used outdoors.
]]

gui.printf("Doom shape rules now being loaded!\n")

SHAPE_GRAMMAR =
{

ROOT_1 =
{
  prob = 50

  structure =
  {
    "!!!!!", "....."
    "!!!!!", ".RRR."
    "!!!!!", ".RRR."
    "!!!!!", ".RRR."
    "!!!!!", "....."
  }

  new_room =
  {
    symmetry  = { kind="mirror", x=3, y=2, dir=8 }
    symmetry2 = { kind="rotate", x=2, y=2, x2=4, y2=4 }
  }

  auxiliary =
  {
    pass = "start_closet3"
  }
}


ROOT_3 =
{
  prob = 40

  structure =
  {
    "!!!!!!", "......"
    "!!!!!!", ".RRRR."
    "!!!!!!", ".RRRR."
    "!!!!!!", ".RRRR."
    "!!!!!!", ".RRRR."
    "!!!!!!", "......"
  }

  new_room =
  {
    symmetry  = { kind="mirror", x=3, y=2, w=2, dir=8 }
    symmetry2 = { kind="rotate", x=2, y=2, x2=5, y2=5 }
  }

  auxiliary =
  {
    pass = "start_closet4"
  }
}


ROOT_4 =
{
  prob = 20

  structure =
  {
    "!!!!!!", "......"
    "!!!!!!", "./RR%."
    "!!!!!!", ".RRRR."
    "!!!!!!", ".RRRR."
    "!!!!!!", ".%RR/."
    "!!!!!!", "......"
  }

  diagonals =
  {
    ".R", "R."
    ".R", "R."
  }

  new_room =
  {
    symmetry  = { kind="mirror", x=3, y=2, w=2, dir=8 }
    symmetry2 = { kind="rotate", x=2, y=2, x2=5, y2=5 }
  }

  auxiliary =
  {
    pass = "start_closet2"
  }
}


ROOT_L1 =
{
  prob = 1

  structure =
  {
    "!!!!!", ".RR#."
    "!!!!!", ".RR##"
    "!!!!!", "#RRRR"
    "!!!!!", "#RRRR"
    "!!!!!", "###.."
  }
}


ROOT_T2 =
{
  prob = 25 --5

  structure =
  {
    "!!!!!!", "......"
    "!!!!!!", "RRRRRR"
    "!!!!!!", "RRRRRR"
    "!!!!!!", "#%RR/#"
    "!!!!!!", "##RR##"
  }

  diagonals = { ".R", "R." }

  new_room =
  {
    symmetry = { kind="mirror", x=3, y=1, w=2, dir=8 }
  }

  auxiliary =
  {
    pass = "start_closet2"
  }
}


ROOT_LIQUID_1A =
{
  prob = 7 --5

  structure =
  {
    "!!!!!", "/RRR%"
    "!!!!!", "R/~%R"
    "!!!!!", "R~~~R"
    "!!!!!", "R%~/R"
    "!!!!!", "%RRR/"
  }

  diagonals =
  {
    ".R", "R."
    "R~", "~R"
    "R~", "~R"
    ".R", "R."
  }

  new_room =
  {
    symmetry  = { kind="mirror", x=3, y=1, dir=8 }
    symmetry2 = { kind="rotate", x=2, y=2, x2=4, y2=4 }
  }

  auxiliary =
  {
    pass = "start_closet3"
  }
}


ROOT_LIQUID_1B =
{
  template = "ROOT_LIQUID_1A"

  prob = 1

  structure =
  {
    "!!!!!", "/RRR%"
    "!!!!!", "R/~%R"
    "!!!!!", "R~C~R"
    "!!!!!", "R%~/R"
    "!!!!!", "%RRR/"
  }

  cage_mode = "fancy"
}


START_CLOSET_2x2 =
{
  pass = "start_closet2"
  prob = 50

  structure =
  {
    "..", "TT"
    "..", "TT"
    "11", "11"
  }

  closet = { from_dir=2, usage="start" }
}


START_CLOSET_3x2 =
{
  pass = "start_closet3"
  prob = 50

  structure =
  {
    "...", "TTT"
    "...", "TTT"
    "111", "111"
  }

  closet = { from_dir=2, usage="start" }
}


START_CLOSET_4x2 =
{
  pass = "start_closet4"
  prob = 50

  structure =
  {
    "....", "TTTT"
    "....", "TTTT"
    "1111", "1111"
  }

  closet = { from_dir=2, usage="start" }
}


------------------------------------------


EXIT_1 =
{
  prob = 75 --60

  structure =
  {
    "!!!!!", "....."
    "!!!!!", ".RRR."
    "!!!!!", ".RRR."
    "!!!!!", ".RRR."
    "!!!!!", "....."
  }

  new_room =
  {
    usage = "boss"
    symmetry = { x=3, y=2, dir=8 }
  }

  auxiliary =
  {
    pass = "exit1_closet"
  }

  auxiliary2 =
  {
    pass = "exit1_area"
  }
}


EXIT1_CLOSET =
{
  pass = "exit1_closet"
  prob = 66 --50

  structure =
  {
    "...", "TTT"
    "...", "TTT"
    "111", "111"
  }

  closet = { from_dir=2, usage="exit" }
}


EXIT1_AREA_A =
{
  pass = "exit1_area"
  prob = 95 --50

  structure =
  {
    ".111.", "#111#"
    ".111.", "#111#"
    ".111.", "#111#"
    "x...x", "xvvvx"
    "x...x", "xAAAx"
    "x...x", "xAAAx"
    "x...x", "xAAAx"
  }

}

EXIT1_AREA_B =
{
  pass = "exit1_area"
  prob = 80 --50

  structure =
  {
    ".111.", "A111A"
    ".111.", "A111A"
    ".111.", "A111A"
    ".....", "AvvvA"
    ".....", "AAAAA"
  }

}


EXIT1_AREA_C =
{
  pass = "exit1_area"
  prob = 65 --50

  structure =
  {
    "...111...", "AA<111>AA"
    "...111...", "AA<111>AA"
    "...111...", "AA<111>AA"
    "xxx...xxx", "xxx###xxx"
  }

}


EXIT_2 =
{
  prob = 30

  structure =
  {
    "!!!!!", ".###."
    "!!!!!", ".RRR."
    "!!!!!", ".RRR."
    "!!!!!", ".RRR."
    "!!!!!", "....."
  }

  new_room =
  {
    usage = "boss"
  }

  auxiliary =
  {
    pass = "exit2_closet"
  }

  auxiliary2 =
  {
    pass = "exit2_decor"
  }
}


EXIT2_CLOSET =
{
  pass = "exit2_closet"
  prob = 50

  structure =
  {
    "1..", "1TT"
    "1..", "1TT"
    "1..", "1TT"
  }

  closet = { from_dir=4, usage="exit" }
}


EXIT2_DECOR =
{
  pass = "exit2_decor"
  prob = 70 --50

  structure =
  {
    "..1", "TT1"
    "..1", "TT1"
    "..1", "TT1"
  }

  closet = { from_dir=6 }
}


EXIT_3 =
{
  env  = "building"
  prob = 30 --20

  structure =
  {
    "!!!!!", "....."
    "!!!!!", "....."
    "!!!!!", "....."
    "!!!!!", "....."
    "!!!!!", "....."
    "!!!!!", ".RRR."
    "!!!!!", "#RRR#"
    "!!!!!", ".RRR."
    "!!!!!", "....."
  }

  new_room =
  {
    usage = "boss"
    symmetry = { x=3, y=2, dir=8 }
  }

  auxiliary =
  {
    pass = "exit3_area"
  }
}


EXIT3_AREA_A =
{
  pass = "exit3_area"
  prob = 50

  structure =
  {
    ".......", "#AAAAA#"
    ".......", "#A...A#"
    "..111..", "#A111A#"
  }

  auxiliary =
  {
    pass = "exit3_closet"
  }

  auxiliary2 =
  {
    pass = "exit3_decor"
  }
}


EXIT3_AREA_B =
{
  pass = "exit3_area"
  prob = 70 --50

  structure =
  {
    ".......", "#/AAA%#"
    ".......", "#A/#%A#"
    "..111..", "#A111A#"
  }

  diagonals =
  {
    "#A", "A#"
    "A#", "#A"
  }

  auxiliary =
  {
    pass = "exit1_closet"
  }
}


EXIT3_CLOSET =
{
  pass = "exit3_closet"
  prob = 70 --50

  structure =
  {
    "11111", "11111"
    "1...1", "1TTT1"
  }

  closet = { from_dir=8, usage="exit" }
}


EXIT3_DECOR =
{
  pass = "exit3_decor"
  prob = 70 --50

  structure =
  {
    ".....", "#TTT#"
    "11111", "11111"
  }

  closet = { from_dir=2 }
}


------------------------------------------


GROW_2 =
{
  prob = 100 --Non-MSSP default: 100
  prob_skew = 2

  structure =
  {
    "....", ".11."
    "x11x", "x11x"
  }
}


GROW_3 =
{
  prob = 50 --Non-MSSP default: 50
  prob_skew = 2

  structure =
  {
    ".....", ".111."
    "x111x", "x111x"
  }
}


GROW_4 =
{
  prob = 50 --Non-MSSP default: 50
  prob_skew = 2
  skip_prob = 25 --50

  structure =
  {
    "....", "1111"
    ".11.", "1111"
  }
}


GROW_BLOB_1 =
{
  prob = 25 --Non-MSSP default: 25

  structure =
  {
    "....", "1111"
    "....", "1111"
    "x11x", "x11x"
  }
}

 --7.50 stuff

GROW_DIAG_BLOB1 =
{
  prob = 45

  structure =
  {
    "...", "AA%"
    "%..", "%AA"
    "x%.", "x%A"
    "x1.", "x1."
  }

  diagonals =
  {
          "A."
    "1.", "1A"
    "1.", "1A"
  }
}


GROW_DIAG_BLOB2 =
{
  prob = 65 --45

  structure =
  {
    "...", "AA%"
    "%..", "%AA"
    "x%.", "x%A"
    "x1.", "x1."
    "x/.", "x/A"
    "/..", "/AA"
    "...", "AA/"
  }

  diagonals =
  {
          "A."
    "1.", "1A"
    "1.", "1A"
    "1.", "1A"
    "1.", "1A"
          "A."
  }
}

-- End 7.50 stuff

GROW_FUNNEL_2 =
{
  prob = 25 --5
  skip_prob = 15 --50

  structure =
  {
    "....", "#11#"
    "....", "/11%"
    "1111", "1111"
  }

  diagonals = { "#1", "1#" }
}


GROW_CURVE_1 =
{
  prob = 75 --50
  prob_skew = 3
  skip_prob = 5 --25

  structure =
  {
    "1.", "1%"
    "1.", "11"
    "1.", "11"
    "1.", "1/"
  }

  diagonals = { "1.", "1." }
}


GROW_AREA_1 =
{
  prob = 60 --40

  structure =
  {
    "....", ".AA."
    "x11x", "x11x"
  }
}


GROW_AREA_2 =
{
  prob = 20 --6
  skip_prob = 30 --50

  structure =
  {
    "...", "AAA"
    "11.", "11A"
    "11.", "11A"
  }
}


GROW_DIAG_WING =
{
  prob = 70 --40
  prob_skew = 2
  skip_prob = 5 --35

  env = "building"

  structure =
  {
    "x...", "x#AA"
    "x...", "x/AA"
    "1%..", "1%/#"
    "11xx", "11xx"
  }

  diagonals =
  {
    "#A"
    "1.", "1A", "A#"
  }
}


GROW_BIG_CAGE =
{
  prob = 5
  skip_prob = 70
  aversion = 10

  structure =
  {
    "....", "1111"
    "....", "1CC1"
    "....", "1CC1"
    "1111", "1111"
  }

  cage_mode = "fancy"
}


GROW_CAGEPAIR_1 =
{
  prob = 1
  skip_prob = 50

  structure =
  {
    "......", "#AAAA#"
    "......", "#CAAC#"
    "......", "#AAAA#"
    "xx11xx", "xx11xx"
  }

  cage_mode = "fancy"
}


GROW_CAGEPAIR_2 =
{
  prob = 5
  skip_prob = 30
  aversion = 5

  structure =
  {
    "......", "#AAAA#"
    "......", "#CAAC#"
    "......", "#AAAA#"
    "......", "#CAAC#"
    "......", "#AAAA#"
    ".1111.", ".1111."
  }

  cage_mode = "fancy"
}


GROW_LIQUID_CAGE3 =
{
  prob = 10
  skip_prob = 20 --33

  structure =
  {
    ".....", "#####"
    ".....", "#/C~1"
    ".....", "#C/~1"
    ".....", "#~~/1"
    ".....", ".1111"
    ".1111", ".1111"
  }

  diagonals =
  {
    "#C"
    "C~"
    "~1"
  }

  cage_mode = "fancy"
}


GROW_STAIR_2 =
{
  prob = 10 --12
  prob_skew = 3
  skip_prob = 45 --35

  structure =
  {
    "....", ".AA."
    "x..x", "x^^x"
    "x11x", "x11x"
  }
}


GROW_STAIR_3 =
{
  prob = 5 --5
  prob_skew = 3
  skip_prob = 45 --35

  structure =
  {
    "...", "AAA"
    "...", "^^^"
    "111", "111"
  }
}


GROW_NARROWSTAIR_1 =
{
  prob = 25 --10
  prob_skew = 3
  skip_prob = 7 --25

  structure =
  {
    "...", "AAA"
    "...", "1^1"
    "111", "111"
  }
}


GROW_NARROWSTAIR_2 =
{
  prob = 20 --10
  prob_skew = 3
  skip_prob = 15 --70

  z_dir = "up"

  structure =
  {
    "...", "AAA"
    "...", "1^1"
    "...", "1^1"
    "111", "111"
  }
}


GROW_CAGESTAIR_1 =
{
  prob = 5
  skip_prob = 50
  aversion = 5

  structure =
  {
    "...", "AAA"
    "...", "^C^"
    "111", "111"
  }

  cage_mode = "fancy"
}


GROW_CAGESTAIR_2 =
{
  prob = 5
  skip_prob = 70
  aversion = 5

  structure =
  {
    "....", "AAAA"
    "....", "^CC^"
    "1111", "1111"
  }

  cage_mode = "fancy"
}


GROW_CAGESTAIR_3 =
{
  prob = 5
  skip_prob = 70
  aversion = 5

  structure =
  {
    "....", "AAAA"
    "....", "^CC^"
    "....", "^CC^"
    "1111", "1111"
  }

  cage_mode = "fancy"
}


GROW_STAIRPAIR_4 =
{
  prob = 80 --200
  skip_prob = 40 --60
  aversion = 3

  structure =
  {
    ".......", "AAAAAAA"
    ".......", "^^111^^"
    ".......", "^^111^^"
    "..111..", "1111111"
  }
}

GROW_STAIRPAIR_4B =
{
  prob = 85 --120
  skip_prob = 40 --60
  aversion = 3

  structure =
  {
    ".......", "AAAAAAA"
    ".......", "^^111^^"
    ".......", "^^111^^"
    ".11111.", "1111111"
  }
}


GROW_STAIRPAIR_4C =
{
  prob = 40 --50
  skip_prob = 40 --60

  structure =
  {
    ".......", "AAAAAAA"
    ".......", "^^~~~^^"
    ".......", "^^~~~^^"
    ".11111.", "1111111"
  }
}


GROW_STAIRPAIR_5 =
{
  prob = 20 --20
  skip_prob = 45 --50
  aversion = 5

  z_dir = "up"

  structure =
  {
    ".....", "AAAAA"
    ".....", "^111A"
    ".....", "^111A"
    "11...", "1111A"
    "11...", "11>>A"
  }
}


-- FIXME : rename, as these are really L-shape new-floor rules
GROW_STAIRPAIR_5E =
{
  prob = 60 --80
  skip_prob = 33
  aversion = 4

  z_dir = "up"

  structure =
  {
    "....", "AAAA"
    "....", "^11A"
    "....", "^11A"
    "11..", "111A"
    "11..", "111A"
  }
}


GROW_STAIRPAIR_5F =
{
  prob = 25 --30
  skip_prob = 50
  aversion = 4

  z_dir = "up"

  structure =
  {
    "....", "AAAA"
    "....", "11^A"
    "....", "11^A"
    "11..", "111A"
    "11..", "111A"
  }
}


GROW_STAIRPAIR_5G =
{
  prob = 10
  skip_prob = 50
  aversion = 4

  z_dir = "up"

  structure =
  {
    "....", "AAAA"
    "....", "11^A"
    "....", "11^A"
    "11..", "11^A"
    "11..", "111A"
  }
}


GROW_STAIRPAIR_5D =
{
  prob = 20
  skip_prob = 50
  aversion = 4

  z_dir = "down"

  structure =
  {
    ".....", "AAA##"
    ".....", "^AA##"
    ".....", "^AAAA"
    "11...", "11AAA"
    "11...", "11>>A"
  }
}


GROW_STAIR_POOL2 =
{
  -- this one is higher than STAIR_POOL1

  prob = 5 --7
  skip_prob = 85 --75
  aversion = 15

  structure =
  {
    "x.....", "xAAA%."
    "1.....", "1/~%A."
    "1.....", "1~~~A."
    "1.....", "1~~/A#"
    "1.....", "1>>A/."
    "x....x", "x##..x"
  }

  diagonals =
  {
    "A."
    "1~", "~A"
    "~A"
    "A."
  }
}


GROW_STAIR_SIDE2 =
{
  prob = 80
  prob_skew = 3
  skip_prob = 30 --30

  z_dir = "up"

  structure =
  {
    "....", "#AAA"
    "..1x", "#^1x"
    "..1x", "#^1x"
    "..1x", "#11x"
  }
}


GROW_STAIR_SIDE3 =
{
  prob = 50
  prob_skew = 3
  skip_prob = 70 --50
  aversion  = 7

  structure =
  {
    "...", ".AA"
    "...", ".AA"
    "..1", "#^1"
    "..1", "#^1"
    "..1", "#^1"
    "..1", "#11"
  }
}


GROW_STAIR_HUGE =
{
  prob = 8 --8
  skip_prob = 65 --80
  aversion  = 15 --20

  structure =
  {
    "x....x", "xAAAAx"
    "......", "/~^^~%"
    "......", "~~^^~~"
    "......", "%~^^~/"
    "x1111x", "x1111x"
  }

  diagonals =
  {
    ".~", "~."
    ".~", "~."
  }
}


GROW_XXX_BRIDGE1 =
{
  prob = 0

  structure =
  {
    "x..x", "x~~x"
    "x...", "x~~A"
    "1...", "1==A"
    "x...", "x~~A"
    "x..x", "x~~x"
  }
}


--[[ test crud......

GROW_LIQUID_1 =
{
  prob = 200

  structure =
  {
    "....", ".11."
    "....", ".~~."
    "x11x", "x11x"
    "x11x", "x11x"
  }

  auxiliary =
  {
    pass = "liquid_grow"

    count = { 4,8 }
  }

  xx_auxiliary2 =
  {
    pass = "liquid_newarea"

    count = { 1,3 }
  }
}


AUX_LIQUID_1 =
{
  pass = "liquid_grow"
  prob = 30 --50

  structure =
  {
    "1.", "11"
    "~.", "~~"
    "1.", "11"
  }
}


AUX_LIQUID_2 =
{
  pass = "liquid_grow"
  prob = 30 --50

  structure =
  {
    "...", ".11"
    "1..", "1/~"
    "~..", "~/1"
    "1..", "11."
  }

  diagonals =
  {
    "1~", "~1"
  }
}


AUX_LIQUID_3 =
{
  pass = "liquid_grow"
  prob = 0

  structure =
  {
    "...", "..."
    "~.~", "~~~"
  }

  diagonals =
  {
    ".~", "~."
  }
}
--]]


------------------------------------------


SPROUT_DIRECT_1 =
{
  prob = 3 --3

  structure =
  {
    "....", ".RR."
    "....", ".RR."
    "x11x", "x11x"
  }

  new_room =
  {
    conn = { x=2, y=1, w=2, dir=8 }

    symmetry = { x=2, y=3, w=2, dir=8 }
  }
}


SPROUT_DIRECT_2 =
{
  prob = 100

  structure =
  {
    "....", ".RR."
    "....", ".RR."
    "x11x", "x11x"
    "x11x", "x11x"
  }

  new_room =
  {
    conn = { x=2, y=2, w=2, dir=8 }

    symmetry = { x=2, y=3, w=2, dir=8 }
  }
}


SPROUT_DIRECT_2_EMERGENCY =
{
  emergency = true

  -- high prob to force this rule to be tried fairly early
  prob = 500

  structure =
  {
    "..", "RR"
    "..", "RR"
    "11", "11"
  }

  new_room =
  {
    conn = { x=1, y=1, w=2, dir=8 }

    symmetry = { x=1, y=2, w=2, dir=8 }
  }
}


SPROUT_DIRECT_3 =
{
  prob = 400

  structure =
  {
    ".....", ".RRR."
    ".....", ".RRR."
    "x111x", "x111x"
  }

  new_room =
  {
    conn = { x=2, y=1, w=3, dir=8 }

    symmetry = { x=3, y=2, dir=8 }
  }
}


SPROUT_DIRECT_4 =
{
  prob = 4000

  structure =
  {
    "....", "RRRR"
    "....", "RRRR"
    "1111", "1111"
  }

  new_room =
  {
    conn = { x=1, y=1, w=4, dir=8 }

    symmetry = { x=2, y=3, w=2, dir=8 }
  }
}


SPROUT_CASTLE_2 =
{
  env = "outdoor"
  prob = 350 --200

  structure =
  {
    "!!!!!!!!", "11RRRR11"
    "!!!!!!!!", "11%RR/11"
    "!!!!!!!!", "11111111"
    "xxx11xxx", "xxx11xxx"
  }

  diagonals = { "1R", "R1" }

  new_room =
  {
    env = "building"

    conn = { x=4, y=2, w=2, dir=8 }
  }
}


SPROUT_DOUBLE_TEST =
{
  prob = 0  -- not supported yet

  structure =
  {
    "....", "RR%."
    "....", "RRR%"
    "11..", "11RR"
    "11..", "11RR"
  }

  diagonals =
  {
    "R.", "R."
  }

  new_room =
  {
    conn  = { x=1, y=2, w=2, dir=8 }
    conn2 = { x=2, y=2, w=2, dir=6 }

    symmetry = { x=3, y=3, dir=9 }
  }
}


SPROUT_SYMMETRY_3 =
{
  prob = 30

  structure =
  {
    ".....", ".RRR."
    ".....", ".RRR."
    "x111x", "x111x"
  }

  new_room =
  {
    conn = { x=2, y=1, w=3, dir=8 }

    symmetry = { x=3, y=2, dir=8 }
  }
}


SPROUT_JOINER_2x1 =
{
  prob = 350 --360

  structure =
  {
    "....", ".RR."
    "....", ".RR."
    "x..x", "xJJx"
    "x11x", "x11x"
  }

  new_room =
  {
    symmetry = { x=2, y=3, w=2, dir=8 }
  }

  joiner =
  {
    from_dir = 2
  }
}


SPROUT_JOINER_3x1 =
{
  prob = 1500

  structure =
  {
    ".....", ".RRR."
    ".....", ".RRR."
    "x...x", "xJJJx"
    "x111x", "x111x"
  }

  new_room =
  {
    symmetry = { x=3, y=3, dir=8 }
  }

  joiner =
  {
    from_dir = 2
  }
}


SPROUT_JOINER_4x1 =
{
  prob = 3000

  structure =
  {
    "....", "RRRR"
    "....", "RRRR"
    "....", "JJJJ"
    "1111", "1111"
  }

  new_room =
  {
    symmetry = { x=2, y=3, w=2, dir=8 }
  }

  joiner =
  {
    from_dir = 2
  }
}


SPROUT_JOINER_2x2 =
{
  prob = 100 --100

  structure =
  {
    "....", ".RR."
    "....", ".RR."
    "x..x", "xJJx"
    "x..x", "xJJx"
    "x11x", "x11x"
  }

  new_room =
  {
    symmetry = { x=2, y=4, dir=8 }
  }

  joiner =
  {
    from_dir = 2
  }
}


SPROUT_JOINER_3x2 =
{
  prob = 3000

  structure =
  {
    ".....", ".RRR."
    ".....", ".RRR."
    "x...x", "xJJJx"
    "x...x", "xJJJx"
    "x111x", "x111x"
  }

  new_room =
  {
    symmetry = { x=3, y=4, dir=8 }
  }

  joiner =
  {
    from_dir = 2
  }
}


SPROUT_JOINER_L =
{
  prob = 60 --40 --30

  structure =
  {
    "....", "####"
    "....", "RRJJ"
    "....", "RRJJ"
    "xx11", "xx11"
  }

  new_room =
  {
  }

  joiner =
  {
    shape = "L"
    from_dir = 2
    dest_dir = 4
  }
}


SPROUT_TELEPORTER_2x2 =
{
  prob = 700

  structure =
  {
    "..", "TT"
    "..", "TT"
    "11", "11"
    "11", "11"
  }

  teleporter = true

  closet =
  {
    from_dir = 2
  }
}


------------------------------------------


DECORATE_CAGE_1 =
{
  prob = 4
  env  = "!cave"

  structure =
  {
    "...", "..."
    "...", ".C."
    "x1x", "x1x"
  }

  auxiliary =
  {
    pass = "cage_grow"

    count = { 1,4 }
  }
}


DECORATE_CAGE_2 =
{
  prob = 10
  env  = "!cave"

  structure =
  {
    "....", "...."
    "....", ".CC."
    "x11x", "x11x"
  }

  auxiliary =
  {
    pass = "cage_grow"

    count = { 1,4 }
  }
}


AUX_CAGE_GROW1 =
{
  pass = "cage_grow"

  prob = 50

  structure =
  {
    "C.", "CC"
    "11", "11"
  }
}


AUX_CAGE_GROW2 =
{
  pass = "cage_grow"

  prob = 50

  structure =
  {
    "C.", "CC"
    "1.", "1C"
  }
}


AUX_CAGE_GROW3 =
{
  pass = "cage_grow"

  prob = 50 --50

  structure =
  {
    "...", "C%."
    "C..", "CC."
    "11x", "11x"
  }

  diagonals =
  {
    "C."
  }
}


DECORATE_CLOSET_2x1 =
{
  prob = 60 --40
  prob_skew = 2

  structure =
  {
    "..", "TT"
    "11", "11"
  }

  closet = { from_dir=2 }
}


DECORATE_CLOSET_2x2 =
{
  prob = 120 --80
  prob_skew = 2

  structure =
  {
    "..", "TT"
    "..", "TT"
    "11", "11"
  }

  closet = { from_dir=2 }
}


DECORATE_CLOSET_3x1 =
{
  prob = 60
  prob_skew = 2

  structure =
  {
    "...", "TTT"
    "111", "111"
  }

  closet = { from_dir=2 }
}


DECORATE_CLOSET_3x2 =
{
  prob = 80 --60
--prob_skew = 4

  structure =
  {
    "...", "TTT"
    "...", "TTT"
    "111", "111"
  }

  closet = { from_dir=2 }
}



------------------------------------------
--   Landscape stuff
------------------------------------------


PARK_ROOT_3x3 =
{
  prob = 90 --50

  structure =
  {
    "!!!", "RRR"
    "!!!", "RRR"
    "!!!", "RRR"
  }
}


PARK_GROW_1 =
{
  prob = 200 --100

  structure =
  {
    "....", ".11."
    "....", ".11."
    "....", ".11."
    "x11x", "x11x"
  }
}

PARK_GROW_2 =
{
  prob = 80 --30

  structure =
  {
    "....", ".11."
    "....", ".11."
    "x11x", "x11x"
  }
}


PARK_GROW_3 =
{
  prob = 600 --500

  structure =
  {
    ".....", ".111."
    ".....", ".111."
    "x111x", "x111x"
  }
}


FILLER_1 =
{
  pass = "filler"
  prob = 40 --30

  structure =
  {
    "1..", "1.."
    "1..", "11."
    "111", "111"
  }
}


FILLER_2 =
{
  pass = "filler"
  prob = 75 --60

  structure =
  {
    "1.1", "111"
    "x1x", "x1x"
  }
}


FILLER_3 =
{
  pass = "filler"
  prob = 45 --30

  structure =
  {
    "1..1", "1111"
    "1111", "1111"
  }
}


SMOOTHER_1 =
{
  pass = "smoother"
  prob = 75 --50

  structure =
  {
    "x.", "x."
    "1.", "1%"
    "11", "11"
  }

  diagonals = { "1." }
}


------------------------------------------
--   Cave stuff
------------------------------------------

CAVE_ROOT_5x5 =
{
  prob = 20 --10

  structure =
  {
    "!!!!!", "RRRRR"
    "!!!!!", "RRRRR"
    "!!!!!", "RRRRR"
    "!!!!!", "RRRRR"
    "!!!!!", "RRRRR"
  }
}


CAVE_ROOT_6x6 =
{
  prob = 100

  structure =
  {
    "!!!!!!", "RRRRRR"
    "!!!!!!", "RRRRRR"
    "!!!!!!", "RRRRRR"
    "!!!!!!", "RRRRRR"
    "!!!!!!", "RRRRRR"
    "!!!!!!", "RRRRRR"
  }
}


SPROUT_DIRECT_2_cave =
{
  prob = 100

  structure =
  {
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    "xx11x", "xx11x"
  }

  new_room =
  {
    env = "cave"

    conn = { x=3, y=1, w=2, dir=8 }
  }
}


SPROUT_DIRECT_3_cave =
{
  prob = 300

  structure =
  {
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    "x111x", "x111x"
  }

  new_room =
  {
    env = "cave"

    conn = { x=2, y=1, w=3, dir=8 }
  }
}


SPROUT_JOINER_2x1_cave =
{
  prob = 500

  structure =
  {
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    "xx..x", "xxJJx"
    "xx11x", "xx11x"
  }

  new_room =
  {
    env = "cave"
  }

  joiner =
  {
    from_dir = 2
  }
}


SPROUT_JOINER_3x1_cave =
{
  prob = 2000

  structure =
  {
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    "x...x", "xJJJx"
    "x111x", "x111x"
  }

  new_room =
  {
    env = "cave"
  }

  joiner =
  {
    from_dir = 2
  }
}


--[[ disabled for now....

SPROUT_JOINER_3x2_cave =
{
  prob = 4000

  structure =
  {
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    ".....", "RRRRR"
    "x...x", "xJJJx"
    "x...x", "xJJJx"
    "x111x", "x111x"
  }

  new_room =
  {
    env = "cave"
  }

  joiner =
  {
    from_dir = 2
  }
}
--]]


CAVE_GROW_3x1 =
{
  prob = 75 --50

  structure =
  {
    "...", "111"
    "111", "111"
  }
}


CAVE_GROW_3x2 =
{
  prob = 80 --50

  structure =
  {
    "...", "111"
    "...", "111"
    "111", "111"
  }
}


CAVE_GROW_4x1 =
{
  prob = 100

  structure =
  {
    "....", "1111"
    "1111", "1111"
  }
}


CAVE_GROW_4x2 =
{
  prob = 100

  structure =
  {
    "....", "1111"
    "....", "1111"
    "1111", "1111"
  }
}


CAVE_GROW_5x1 =
{
  prob = 150

  structure =
  {
    ".....", "11111"
    "11111", "11111"
  }
}


CAVE_GROW_5x2 =
{
  prob = 200 --150

  structure =
  {
    ".....", "11111"
    ".....", "11111"
    "11111", "11111"
  }
}


------------------------------------------
--   Hallway stuff
------------------------------------------

SPROUT_narrow_hallway =
{
  prob = 1100 --900
  skip_prob = 10

  structure =
  {
    "...", ".@."
    "...", ".H."
    "111", "111"
  }

  new_room =
  {
    env = "hallway"

    conn = { x=2, y=1, dir=8 }

    hall_type = "narrow"

    grow_pass = "hall_1"
  }
}


HALL_1_GROW_I1 =
{
  pass = "hall_1"
  prob = 90 --50

  structure =
  {
    ".", "@"
    "@", "H"
    "1", "1"
  }
}


HALL_1_GROW_L1 =
{
  pass = "hall_1"
  prob = 90 --50

  structure =
  {
    "....", "...."
    "..@.", ".@H."
    "..1.", "..1."
  }

  link2_2 = { dest_dir=4 }
}


HALL_1_GROW_T1 =
{
  pass = "hall_1"
  prob = 90 --50

  structure =
  {
    ".....", "....."
    "..@..", ".@H@."
    "..1..", "..1.."
  }

  hallway = { keep_shape_prob=90 }

  link2_2 = { dest_dir=4 }
  link4_2 = { dest_dir=6 }
}


HALL_1_GROW_P1 =
{
  pass = "hall_1"
  prob = 30 --5

  structure =
  {
    ".....", "....."
    ".....", "....."
    ".....", "..@.."
    "..@..", ".@H@."
    "..1..", "..1.."
  }

  hallway = { keep_shape_prob=50 }

  link2_2 = { dest_dir=4 }
  link4_2 = { dest_dir=6 }
  link3_3 = { dest_dir=8 }
}


HALL_1_SPROUT_A =
{
  pass = "hall_1_sprout"
  prob = 120 --100

  structure =
  {
    "....", "RRRR"
    "....", "RRRR"
    "x@xx", "xHxx"
    "x1xx", "x1xx"
  }

  new_room =
  {
    conn = { x=2, y=2, dir=8 }

    symmetry = { kind="mirror", x=2, y=3, w=2, dir=8 }
  }
}


SPROUT_wide_hallway =
{
  prob = 1800 --1500
  skip_prob = 20

  structure =
  {
    "..", ".."
    "..", "@@"
    "..", "HH"
    "11", "11"
  }

  new_room =
  {
    env = "hallway"

    conn = { x=1, y=1, w=2, dir=8 }

    hall_type = "wide"

    grow_pass = "hall_2"
  }
}


HALL_2_GROW_I1 =
{
  pass = "hall_2"
  prob = 40 --25

  structure =
  {
    "..", ".."
    "..", "@@"
    "..", "HH"
    "@@", "HH"
    "11", "11"
  }
}


HALL_2_GROW_L1 =
{
  pass = "hall_2"
  prob = 50

  structure =
  {
    "....", ".@HH"
    "..@@", ".@HH"
    "xx11", "xx11"
  }

  link2_2 = { dest_dir=4 }
}


HALL_2_GROW_T1 =
{
  pass = "hall_2"
  prob = 30 --25

  structure =
  {
    "......", ".@HH@."
    "..@@..", ".@HH@."
    "xx11xx", "xx11xx"
  }

  hallway = { keep_shape_prob=50 }

  link2_2 = { dest_dir=4 }
  link5_2 = { dest_dir=6 }
}


HALL_2_GROW_P1 =
{
  pass = "hall_2"
  prob = 10 --5

  structure =
  {
    "xx..xx", "xx..xx"
    "xx..xx", "xx@@xx"
    "......", ".@HH@."
    "..@@..", ".@HH@."
    "xx11xx", "xx11xx"
  }

  link2_2 = { dest_dir=4 }
  link5_2 = { dest_dir=6 }
  link3_4 = { dest_dir=8 }
}


HALL_2_SPROUT_A =
{
  pass = "hall_2_sprout"
  prob = 100

  structure =
  {
    "....", "RRRR"
    "....", "RRRR"
    "x@@x", "xHHx"
    "x11x", "x11x"
  }

  new_room =
  {
    conn = { x=2, y=2, w=2, dir=8 }

    symmetry = { kind="mirror", x=2, y=3, w=2, dir=8 }
  }
}


HALL_2_SPROUT_B =
{
  pass = "hall_2_sprout"
  prob = 15 --10

  structure =
  {
    "....", "RRRR"
    "....", "RRRR"
    "@@xx", "HHxx"
    "11xx", "11xx"
  }

  new_room =
  {
    conn = { x=1, y=2, w=2, dir=8 }

    -- deliberately no symmetry info
  }
}

-- MsrSgtShooterPerson's kool x-perimental shapes of definite kool

-- MSSP's Greek collonade sort of things. [MSSPCOLLONADE]

GROW_COLONNADE_1 =
{
  prob = 3
  prob_skew = 5

  structure =
  {
    ".....", "11111"
    ".....", "1.1.1"
    ".....", "11111"
    ".....", "1.1.1"
    ".....", "11111"
    "x111x", "x111x"
  }
}

GROW_COLONNADE_2 =
{
  prob = 3
  prob_skew = 5

  structure =
  {
    "......", "111111"
    "......", "1.11.1"
    "......", "111111"
    "......", "1.11.1"
    "......", "111111"
    "......", "1.11.1"
    "......", "111111"
    "xx11xx", "xx11xx"
  }
}

GROW_COLONNADE_TINY =
{
  prob = 5

  structure =
  {
    "...","111"
    "...","1.1"
    "...","111"
    "...","1.1"
    "111","111"
  }
}

GROW_COLONNADE_PARTHENON =
{
  prob = 3
  prob_skew = 3

  structure =
  {
    "x...","x1>A"
    "x...","x1#A"
    "1...","11>A"
    "1...","11>A"
    "x...","x1#A"
    "x...","x1>A"
  }
}

GROW_COLONNADE_PARTHENON_3P =
{
  prob = 3
  prob_skew = 3

  structure =
  {
    "x...","x1>A"
    "x...","x1.A"
    "1...","11>A"
    "1...","11.A"
    "1...","11>A"
    "x...","x1.A"
    "x...","x1>A"
  }
}

GROW_COLONNADE_PARTHENON_LAKE =
{
  prob = 5
  prob_skew = 3
  aversion = 5

  structure =
  {
    "x.......","x111>>AA"
    "1.......","1111>>AA"
    "1.......","11/~#~%A"
    "x.......","x1~~~~~A"
    "x.......","x#%~~~/#"
    "x.......","x#######"
  }

  diagonals =
  {
    "1~","~A"
    ".~","~."
  }
}

-- MSSP's liquid tiles. [MSSPLIQUID]

--[[SPROUT_LIQUID_GUTTER_SIDE =
{
  prob = 30

  env = "building"

  structure =
  {
    ".11","~11"
    ".11","~11"
    ".11","111"
    ".1x","11x"
  }
}--]]

SPROUT_LIQUID_GUTTER_CORNER =
{
  prob = 30

  env = "building"

  structure =
  {
    "....","~~11"
    "....","~/11"
    "x11x","x11x"
  }

  diagonals =
  {
    "~1"
  }
}

GROW_LIQUID_POOL_1X1 =
{
  prob = 5
  prob_skew = 2

  structure =
  {
    "...","111"
    "...","1~1"
    "111","111"
  }
}

GROW_LIQUID_POOL_2X2 =
{
  prob = 15
  prob_skew = 5

  structure =
  {
    "....","1111"
    "....","1~~1"
    "....","1~~1"
    "1111","1111"
  }
}

GROW_LIQUID_POOL_3X1 =
{
  prob = 15
  prob_skew = 5

  structure =
  {
    "...","111"
    "...","1~1"
    "...","1~1"
    "...","1~1"
    "111","111"
  }
}

GROW_LIQUID_PILLAR_CENTER =
{
  prob = 10

  structure =
  {
    ".....","11111"
    ".....","1/~%1"
    ".....","1~.~1"
    ".....","1%~/1"
    ".....","11111"
    "x111x","x111x"
  }

  diagonals =
  {
    "1~","~1"
    "1~","~1"
  }
}

GROW_LIQUID_PILLAR_CENTER_LONG =
{
  prob = 10

  structure =
  {
    ".....","11111"
    ".....","1/~%1"
    ".....","1~.~1"
    ".....","1~.~1"
    ".....","1~.~1"
    ".....","1%~/1"
    ".....","11111"
    "x111x","x111x"
  }

    diagonals =
  {
    "1~","~1"
    "1~","~1"
  }
}

GROW_LIQUID_SIDE_POOL_THICC =
{
  prob = 15

  structure =
  {
    "....","####"
    "....","/~~%"
    "....","%~~/"
    "1111","1111"
    "xxxx","xxxx"
  }

  diagonals =
  {
    ".~","~."
    "1~","~1"
  }
}

GROW_LIQUID_SIDE_POOL_THIN =
{
  prob = 15

  structure =
  {
    "....","####"
    "....","/~~%"
    "....","1111"
    "1111","1111"
    "xxxx","xxxx"
  }

  diagonals =
  {
    ".~","~."
  }
}

GROW_LIQUID_FIGURE_CORRIDOR =
{
  prob = 7

  env = "building"

  structure =
  {
    "....","1111"
    "....","~11~"
    "....","1111"
    "....","~11~"
    "....","1111"
    "x11x","x11x"
  }
}

GROW_LIQUID_BRIDGE_CORRIDOR =
{
  prob = 15

  env = "building"

  structure =
  {
    "...","111"
    "...","%1/"
    "...","~1~"
    "...","/1%"
    "111","111"
  }

  diagonals =
  {
    "~1","1~"
    "~1","1~"
  }
}

GROW_LIQUID_BRIDGE_CORRIDOR_CROSSING =
{
  prob = 15

  env = "building"

  structure =
  {
    "...","111"
    "...","%1/"
    "...","~~~"
    "...","/1%"
    "111","111"
  }

  diagonals =
  {
    "~1","1~"
    "~1","1~"
  }
}

GROW_LIQUID_PLATFORM_FUNNEL =
{
  prob = 15

  env = "building"

  structure =
  {
    "......","/~11~%"
    "......","~/11%~"
    "x1111x","x1111x"
  }

  diagonals =
  {

    ".~","~."
    "~1","1~"
  }
}

GROW_LIQUID_WATERFALL_SIDES =
{
  prob = 20

  env = "building"

  structure =
  {
    "...","AAA"
    "...","~^~"
    "111","111"
  }
}

GROW_LIQUID_U =
{
  prob = 5
  structure =
  {
    ".....","#####"
    ".....","1~~~1"
    ".....","1~~~1"
    ".....","1~~~1"
    ".....","1%~/1"
    ".....","11111"
    "x111x","x111x"
  }

  diagonals =
  {
    "1~","~1"
  }
}

GROW_LIQUID_S =
{
  prob = 15
  skip_prob = 5

  env = "building"

  structure =
  {
    "......","111111"
    "......","~~~%11"
    "......","~~~/11"
    "......","111111"
    "......","111111"
    "......","11/~~~"
    "......","11%~~~"
    "......","111111"
    "xx11xx","xx11xx"
  }

  diagonals =
  {
    "~1"
    "~1"
    "1~"
    "1~"
  }
}

GROW_LIQUID_INTERSECTION =
{
  prob = 15
  skip_prob = 5

  env = "building"

  structure =
  {
    ".........","...111..."
    ".........",".~%111/~."
    ".........",".%~111~/."
    ".........","111111111"
    ".........","111111111"
    ".........","111111111"
    ".........","./~111~%."
    ".........",".~/111%~."
    "xxx111xxx","xxx111xxx"
  }

  diagonals =
  {
    "~1","1~"
    "1~","~1"
    "1~","~1"
    "~1","1~"
  }
}

-- MSSP's ramps and all sorts of stuff. [RAMPS]

GROW_RAMP_THIN_SINK =
{
  prob = 20
  aversion = 5

  structure =
  {
    "...","AAA"
    "...","%A/"
    "...","1^1"
    "...","1^1"
    "111","111"
  }

  diagonals =
  {
    "1A","A1"
  }
}

GROW_RAMP_THIN_RISE =
{
  prob = 20
  aversion = 5

  structure =
  {
    "...","AAA"
    "...","A^A"
    "...","A^A"
    "...","A1A"
    "...","/1%"
    "111","111"
  }

  diagonals =
  {
    "A1","1A"
  }
}

GROW_REVERSE_FUNNEL =
{
  prob = 20
  aversion = 3

  structure =
  {
    "x.....","x11AAA"
    "1.....","111%AA"
    "1.....","1111AA"
    "x.....","x11>AA"
    "x.....","x111AA"
    "x.....","x11/AA"
    "x.....","x11AAA"
  }

  diagonals =
  {
    "1A"
    "1A"
  }
}

GROW_SIDE_ON_RAMP =
{
  prob = 50

  env = "building"

  structure =
  {
    "x...","xAA."
    "x...","xAA."
    "x...","x^^."
    "1...","111."
    "1...","11/."
  }

  diagonals =
  {
    "1."
  }
}

GROW_SIDE_ON_RAMP_TALL =
{
  prob = 50

  env = "building"

  structure =
  {
    "x...","xAA."
    "x...","xAA."
    "x...","x^^."
    "x...","x^^."
    "1...","111."
    "1...","11/."
  }

  diagonals =
  {
    "1."
  }
}

GROW_CAUSEWAY =
{
  prob = 20

  structure =
  {
    "1......","111AA11"
    "1......","11>AA<1"
    "x......","x11AA11"
    "x......","x11AA11"
    "x......","x1>AA<1"
    "x......","x11AA11"
  }
}

--MSSP's simple bends. [BEND]

GROW_BEND =
{
  prob = 20

  structure =
  {
    "..","1%"
    "..","11"
    "11","11"
  }

  diagonals =
  {
    "1."
  }
}

GROW_SQUIGGLE =
{
  prob = 15

  structure =
  {
    "....","11.."
    "....","%1%."
    "....",".%1%"
    "xx11","xx11"
  }

  diagonals =
  {
    ".1","1."
    ".1","1."
  }
}

GROW_TINY_U =
{
  prob = 13

  structure =
  {
    "......","/1111%"
    "......","111111"
    "......","11..11"
    "11xxxx","11xxxx"
  }

  diagonals =
  {
    ".1","1."
  }
}

-- Thicker on-ramps [BIGRAMPS]

GROW_STAIRED_HORSESHOE =
{
  prob = 50

  aversion = 10

  structure =
  {
    "..........","AAAAAAAAAA"
    "..........","AAAAAAAAAA"
    "..........","AA/1111%AA"
    "..........","AA111111AA"
    "..........","^^111111^^"
    "..........","1111111111"
    "..........","1111111111"
    "xxxxxxxx11","xxxxxxxx11"
  }

  diagonals =
  {
    "A1","1A"
  }
}

GROW_STAIRED_T =
{
  prob = 50

  aversion = 10

  structure =
  {
    "..........","AAAAAAAAAA"
    "..........","AAAAAAAAAA"
    "..........","111%AA/111"
    "..........","1111AA1111"
    "..........","1111^^1111"
    "..........","1111111111"
    "xxxxxxxx11","xxxxxxxx11"
  }

  diagonals =
  {
    "1A","A1"
  }
}

GROW_STAIRED_J =
{
  prob = 50

  aversion = 10

  structure =
  {
    "..........","AAAAAAAAAA"
    "..........","AAAAAAAAAA"
    "..........","AA/1111%AA"
    "..........","AA111111AA"
    "..........","^^111111AA"
    "..........","1111111111"
    "..........","1111111111"
    "xxxxxxxx11","xxxxxxxx11"
  }

  diagonals =
  {
    "A1","1A"
  }
}

GROW_STAIRED_SPIRAL =
{
  prob = 35

  aversion = 5

  structure =
  {
    "11xxxxxxxxxx","11xxxxxxxxxx"
    "............","11111>>AAAAA"
    "............","11111>>AAAAA"
    "............","11/AAAAAAAAA"
    "............","11AAAAAAAAAA"
    "............","11AAAAAAAAAA"
    "............","vvAAAAAAAA^^"
    "............","vvAAAAAAAA^^"
    "............","AAAAAAAAAA11"
    "............","AAAAAAAAAA11"
    "............","AAAAAAAAA/11"
    "............","AAAAA<<11111"
    "............","AAAAA<<11111"
  }

  diagonals =
  {
    "1A","A1"
  }
}

GROW_STAIRED_L =
{
  prob = 75

  structure =
  {
    "........","AAAAAAAA"
    "........","AAAAAAAA"
    "........","11111%AA"
    "........","111111AA"
    "........","111111^^"
    "........","111111^^"
    "........","11111111"
    "........","11111111"
    "11xxxxxx","11xxxxxx"
  }

  diagonals =
  {
    "1A"
  }
}

-- MSSP's squeezed corridors. [SQUEEZE]

GROW_SQUEEZE_ENTRY =
{
  prob = 25
  prob_skew = 10
  aversion = 25

  env = "!cave"

  structure =
  {
    ".....","..A.."
    ".....","#/A%#"
    "x111x","x111x"
  }

  diagonals =
  {
    ".A","A."
  }
}

GROW_SQUEEZE_IN_STAIRED =
{
  prob = 15

  structure =
  {
    ".....","..A.."
    ".....","..A.."
    ".....","1>A<1"
    "1xxx1","1xxx1"
  }
}

GROW_SQUEEZE_OUT =
{
  prob = 30

  structure =
  {
    "...","AAA"
    "...","%A/"
    ".1.",".1."
  }

  diagonals =
  {
    ".A","A."
  }
}

GROW_SQUEEZE_STRAIGHT =
{
  prob = 60

  structure =
  {
    "...",".1."
    "...",".1."
    ".1.",".1."
  }
}

GROW_SQUEEZE_STRAIGHT_AREA_TRANSITION =
{
  prob = 10
  structure =
  {
    "...",".A."
    "...",".A."
    ".1.",".1."
  }
}

GROW_SQUEEZE_CURVE =
{
  prob = 60
  structure =
  {
    "...","..."
    "...",".11"
    ".1.",".1."
  }
}

GROW_SQUEEZE_CURVE_REVERSED =
{
  prob = 60
  structure =
  {
    "...","..."
    "...","11."
    ".1.",".1."
  }
}

GROW_SQUEEZE_JUNCTION =
{
  prob = 60
  structure =
  {
    "...",".#."
    "...","111"
    ".1.",".1."
  }
}

GROW_SQUEEZE_STAIRCASE =
{
  prob = 30
  structure =
  {
    "...",".A."
    "...",".^."
    ".1.",".1."
  }
}

GROW_SQUEEZE_EVEN_MORE_STAIRCASE =
{
  prob = 20
  structure =
  {
    "...",".A."
    "...",".^."
    "...",".^."
    "...",".^."
    ".1.",".1."
  }
}

GROW_CAGE_BETWEEN_PILLAR =
{
  prob = 10

  skip_prob = 70
  aversion = 10

  structure =
  {
    ".....","11111"
    ".....","1#C#1"
    ".....","11111"
    "x111x","x111x"
  }

  cage_mode = "fancy"
}

GROW_CAGE_AROUND_PILLAR =
{
  prob = 25
  structure =
  {
    ".....","11111"
    ".....","1CCC1"
    ".....","1C#C1"
    ".....","1CCC1"
    "11111","11111"
    "x111x","x111x"
  }

  cage_mode = "fancy"
}

GROW_CAGE_Z =
{
  prob = 10

  skip_prob = 70
  aversion = 5

  structure =
  {
    "....","1111"
    "....","11CC"
    "....","1111"
    "....","CC11"
    "....","1111"
    "x11x","x11x"
  }

  cage_mode = "fancy"
}

SPROUT_CAGE_SIMPLE_CORNER =
{
  prob = 6

  skip_prob = 70
  aversion = 10

  structure =
  {
    "....","/C11"
    ".111","C111"
  }

  diagonals =
  {
    ".C"
  }

  cage_mode = "fancy"
}

SPROUT_CAGE_SIMPLE_REVERSED =
{
  prob = 6

  skip_prob = 70
  aversion = 10

  structure =
  {
    "....","11C%"
    "111.","111C"
  }

  diagonals =
  {
    "C."
  }

  cage_mode = "fancy"
}

-- MSSP's elevated catwalks. [CATWALK]

GROW_CATWALK_BIFUNNEL_SINK =
{
  prob = 10
  structure =
  {
    ".....",".111."
    ".....","A%1/A"
    ".....","A<1>A"
    ".....","A/1%A"
    ".....","11111"
    "x111x","x111x"
  }

  diagonals =
  {
    "A1","1A"
    "A1","1A"
  }
}

GROW_CATWALK_BIFUNNEL_RISE =
{
  prob = 10

  structure =
  {
    ".....","11111"
    ".....","A%v/A"
    ".....","AAAAA"
    ".....","A/^%A"
    ".....","11111"
    "x111x","x111x"
  }

  diagonals =
  {
    "A1","1A"
    "A1","1A"
  }
}

GROW_CATWALK_BIFUNNEL_SINK_TALL =
{
  prob = 7

  structure =
  {
    ".......","..111.."
    ".......","1111111"
    ".......","AA%1/AA"
    ".......","A<<1>>A"
    ".......","AA/1%AA"
    ".......","1111111"
    "xx111xx","xx111xx"
  }

  diagonals =
  {
    "A1","1A"
    "A1","1A"
  }
}

GROW_CATWALK_BIFUNNEL_RISE_TALL =
{
  prob = 7

  structure =
  {
    ".......","..111.."
    ".......","111v111"
    ".......","A%1v1/A"
    ".......","AAAAAAA"
    ".......","A/1^1%A"
    ".......","111^111"
    ".......","1111111"
    "xx111xx","xx111xx"
  }

  diagonals =
  {
    "A1","1A"
    "A1","1A"
  }
}

GROW_CATWALK_SIDESTAIRS =
{
  prob = 10

  structure =
  {
    ".....","11111"
    ".....","A<<1/"
    ".....","AAAAA"
    ".....","A<<1%"
    "x111x","x111x"
  }

  diagonals =
  {
    "1A","1A"
  }
}

GROW_CATWALK_U =
{
  prob = 10

  structure =
  {
    ".........","../111%.."
    ".........","./11111%."
    ".........","/11/A%11%"
    ".........","11/AAA%11"
    ".........","11AA#AA11"
    ".........","....#^^11"
    ".........","....#^^11"
    ".....111x",".....111x"
  }

  diagonals =
  {
         ".1","1."
         ".1","1."
    ".1","1A","A1","1."
         "1A","A1"
  }
}

-- MSSP's wide diagonals. [DIAGONALS]

GROW_DIAGONAL_L =
{
  prob = 20

  structure =
  {
    "......","......"
    "......",".../11"
    "......","../111"
    "......","./1111"
    "......",".111/."
    "x111xx","x111xx"
  }

  diagonals =
  {
    ".1"
    ".1"
    ".1"
    "1."
  }
}

GROW_DIAGONAL_L_CATWALK =
{
  prob = 20

  structure =
  {
    "......","......"
    "......","../A<1"
    "......","./A/11"
    "......",".A/111"
    "......",".^11/."
    "x111xx","x111xx"
  }

  diagonals =
  {
       ".A"
    ".A","A1"
       "A1"
    "1."
  }
}

GROW_DIAGONAL_L_CATWALK_CONTINUE =
{
  prob = 20

  structure =
  {
    "......",".../AA"
    "......","../AAA"
    "......","./A/11"
    "......",".A/111"
    "......",".^11/."
    "x111xx","x111xx"
  }

  diagonals =
  {
       ".A"
       ".A"
    ".A","A1"
       "A1"
    "1."
  }
}

GROW_DIAGONAL_S =
{
  prob = 15

  structure =
  {
    "......","...111"
    "......","../111"
    "......","./111/"
    "......","/111/."
    "......","111/.."
    "111xxx","111xxx"
  }

  diagonals =
  {
    ".1"
    ".1","1."
    ".1","1."
         "1."
  }
}

--[[ GROW_DIAGONAL_SIDE_BLOB =
{
  prob = 30

  structure =
  {
    ".....","....."
    ".....","AAAA%"
    "..../","AAAA/"
    ".../x","AAA/x"
    "../xx",".%/xx"
    "..1xx","..1xx"
  }

  diagonals =
  {
    "A."
    ".1", "A1"
    ".1", "A1"
    ".1", ".A","A1"
  }
-- }]]

-- MSSP's water canals. [CANALS]

GROW_LIQUID_CANAL_STRAIGHT =
{
  prob = 60

  env = "building"

  structure =
  {
    "~.","~~"
    "~.","~~"
    "1.","11"
    "1.","11"
    "~.","~~"
    "~.","~~"
  }
}

GROW_LIQUID_CANAL_CROSSING =
{
  prob = 20

  env = "building"

  engine = "zdoom"

  structure =
  {
    "~..","~~~"
    "~..","~~~"
    "1..","1A1"
    "1..","1A1"
    "~..","~~~"
    "~..","~~~"
  }
}


GROW_LIQUID_CANAL_STRAIGHT_AREA_TRANSITION =
{
  prob = 20

  env = "building"

  structure =
  {
    "~.","~~"
    "~.","~~"
    "1.","1A"
    "1.","1A"
    "~.","~~"
    "~.","~~"
  }
}

GROW_LIQUID_CANAL_STRAIGHT_STAIRCASE =
{
  prob = 40

  env = "building"

  structure =
  {
    "~..","~~~"
    "~..","~~~"
    "1..","1>A"
    "1..","1>A"
    "~..","~~~"
    "~..","~~~"
  }
}

GROW_LIQUID_CANAL_STRAIGHT_BULGE =
{
  prob = 40

  env = "building"

  structure =
  {
    "~.....","~~11~~"
    "~.....","~/11%~"
    "1.....","11111A"
    "1.....","11111A"
    "~.....","~%11/~"
    "~.....","~~11~~"
  }

  diagonals =
  {
    "~1","1~"
    "~1","1~"
  }
}

GROW_LIQUID_CANAL_CURVE =
{
  prob = 60

  env = "building"

  structure =
  {
    "~.....","~~~~~%"
    "~.....","~~~~~~"
    "1.....","111%~~"
    "1.....","1111~~"
    "~.....","~%11~~"
    "~.....","~~11~~"
  }

  diagonals =
  {
    "~."
    "1~"
    "~1"
  }
}

GROW_LIQUID_CANAL_ENTRY =
{
  prob = 25
  aversion = 5

  env = "building"

  structure =
  {
    "x...","x./~"
    "xx..","xx~~"
    "1...","1111"
    "1...","1111"
    "xx..","xx~~"
    "x...","x.%~"
  }

  diagonals =
  {
    ".~"
    ".~"
  }
}

GROW_LIQUID_CANAL_ENTRY =
{
  prob = 25
  aversion = 5

  env = "building"

  structure =
  {
    "x..","x~~"
    "x..","x~~"
    "1..","111"
    "1..","111"
    "x..","x~~"
    "x..","x~~"
  }

  diagonals =
  {
    ".~"
    ".~"
  }
}

GROW_LIQUID_CANAL_OUT =
{
  prob = 10

  env = "building"

  structure =
  {
    "..~","./~"
    "..~",".~~"
    "..1","A11"
    "..1","A11"
    "..~",".~~"
    "..~",".%~"
  }

  diagonals =
  {
    ".~"
    ".~"
  }
}

GROW_LIQUID_CANAL_OUT_ALT =
{
  prob = 10

  env = "building"

  structure =
  {
    "~.","~A"
    "1.","1A"
    "1.","1A"
    "~.","~A"
  }
}

-- [SINGLE_CANAL : SCANAL]

GROW_LIQUID_SCANAL_ENTRY =
{
  prob = 12

  env = "building"

  structure =
  {
    "1..","111"
    "1..","111"
    "x..","x~~"
    "x..","x~~"
  }
}

GROW_LIQUID_SCANAL_ENTRY_FORWARD =
{
  prob = 12

  env = "building"

  structure =
  {
    "1....","111~~"
    "1....","111~~"
  }
}

GROW_LIQUID_SCANAL_STRAIGHT =
{

  prob = 60

  env = "building"

  structure =
  {
    "1.","11"
    "1.","11"
    "~.","~~"
    "~.","~~"
  }
}

GROW_LIQUID_SCANAL_STRAIGHT_CROSSING =
{

  prob = 20

  env = "building"

  engine = "zdoom"

  structure =
  {
    "1....","11~11"
    "1....","1/~%1"
    "~....","~~~~~"
    "~....","~~~~~"
  }

  diagonals =
  {
    "1~","~1"
  }
}

GROW_LIQUID_SCANAL_STAIR =
{

  prob = 40

  env = "building"

  structure =
  {
    "1..","1>A"
    "1..","1>A"
    "~..","~~~"
    "~..","~~~"
  }
}

GROW_LIQUID_SCANAL_OUTER_BEND =
{

  prob = 30

  env = "building"

  structure =
  {
    "1...","111%"
    "1...","1111"
    "~...","~~11"
    "~...","~~11"
  }

  diagonals =
  {
    "1."
  }

}

GROW_LIQUID_SCANAL_INNER_BEND =
{

  prob = 30

  env = "building"

  structure =
  {
    "1...","11~~"
    "1...","11~~"
    "~...","~~~~"
    "~...","~~~/"
  }

  diagonals =
  {
    "~."
  }
}

GROW_LIQUID_SCANAL_T_JUNCTION =
{
  prob = 20

  env = "building"

  structure =
  {
    "1.....","111111"
    "1.....","111111"
    "~.....","~%11/~"
    "~.....","~~11~~"
  }

  diagonals =
  {
    "~1","1~"
  }
}

-- [NARROW CANALS : NCANALS]

GROW_NARROW_CANAL_ENTRY =
{
  prob = 20

  env = "building"

  structure =
  {
    "1..","111"
    "1..","111"
    "x..","x~~"
  }
}

GROW_NARROW_CANAL_ENTRY_FROMSIDE =
{
  prob = 10

  env = "building"

  structure =
  {
    "1...","111~"
    "1...","111~"
  }
}

GROW_NARROW_CANAL_STRAIGHT =
{
  prob = 80

  env = "building"

  structure =
  {
    "1.","11"
    "1.","11"
    "~.","~~"
  }
}

GROW_NARROW_CANAL_STRAIGHT_CROSSING =
{
  prob = 20

  env = "building"

  engine = "zdoom"

  structure =
  {
    "1....","11A11"
    "1....","1/~%1"
    "~....","~~~~~"
  }

  diagonals =
  {
    "1~","~1"
  }
}

GROW_NARROW_CANAL_STAIRS =
{
  prob = 60

  env = "building"

  structure =
  {
    "1..","1>A"
    "1..","1>A"
    "~..","~~~"
  }
}

GROW_NARROW_CANAL_INNER_CURVE =
{
  prob = 30

  env = "building"

  structure =
  {
    "1...","111%"
    "1...","1111"
    "~...","~%11"
    "x...","x~11"
  }

  diagonals =
  {
    "1."
    "~1"
  }
}

GROW_NARROW_CANAL_OUTER_CURVE =
{
  prob = 30

  env = "building"

  structure =
  {
    "1..","11~"
    "1..","1/~"
    "~..","~~/"
  }

  diagonals =
  {
    "1~"
    "~."
  }
}

-- MSSP's escapes - these are special tiles intended to remove potential dead-ending tiles such as corners. [ESCAPE]

GROW_SQUEEZE_EXIT =
{
  pass = "exit1_closet"
  prob = 40

  structure =
  {
    "...","TTT"
    "...","TTT"
    "...","111"
    "...","%1/"
    "...",".1."
    ".1.",".1."
  }

  diagonals =
  {
    ".1","1."
  }

  closet = { from_dir=2, usage="exit" }
}

GROW_LIQUID_CANAL_EXIT =
{
  prob = 40

  pass = "exit1_closet"

  env = "building"

  structure =
  {
    "~......","~%.TTT."
    "~......","~~.TTT."
    "1......","111111."
    "1......","11111/."
    "~......","~~....."
    "~......","~/....."
  }

  diagonals =
  {
    "~."
    "1."
    "~."
  }

  closet = { from_dir=2, usage="exit" }

}

GROW_LIQUID_EMERGENCY_EXIT =
{
  prob = 50

  pass = "exit1_closet"

  structure =
  {
    "...","TTT"
    "...","TTT"
    "...","%11"
    "~~x","~1x"
    "x1x","x1x"
  }

  diagonals =
  {
    "~1"
  }

  closet = { from_dir=2, usage="exit" }
}

-- MSSP's shape primitives [PRIMITIVES]

GROW_PRIMITIVE_CIRCLE_3X =
{
  prob = 35

  structure =
  {
    ".........","../111%.."
    ".........","./11111%."
    ".........","111111111"
    ".........","111111111"
    ".........","111111111"
    ".........",".%11111/."
    ".........","..%111/.."
    "xxx111xxx","xxx111xxx"
  }

  diagonals =
  {
    ".1","1."
    ".1","1."
    ".1","1."
    ".1","1."
  }
}

GROW_PRIMITIVE_CIRCLE_2X =
{
  prob = 20

  structure =
  {
    "......","./11%."
    "......","/1111%"
    "......","111111"
    "......","111111"
    "......","%1111/"
    "......",".%11/."
    "xx11xx","xx11xx"
  }

  diagonals =
  {
    ".1","1."
    ".1","1."
    ".1","1."
    ".1","1."
  }
}

GROW_PRIMITIVE_HALFTRIANGLE_3X =
{
  prob = 18

  structure =
  {
    "......","../111"
    "......","./1111"
    "......","/11111"
    "......","111111"
    "......","%11111"
    "xxxx11","xxxx11"
  }

  diagonals =
  {
    ".1"
    ".1"
    ".1"
    ".1"
  }
}

GROW_PRIMITIVE_TRIANGLE_2X =
{
  prob = 10

  structure =
  {
    "....","./11"
    "....","/111"
    "....","%111"
    "xx11","xx11"
  }

  diagonals =
  {
    ".1"
    ".1"
    ".1"
  }
}

GROW_PRIMITIVE_DIAMOND_2X =
{
  structure =
  {
    "xx11xx","xx11xx"
    "......","./11%."
    "......","/1111%"
    "......","111111"
    "......","111111"
    "......","%1111/"
    "......",".%11/."
  }

  diagonals =
  {
    "1.",".1"
    "1.",".1"
    "1.",".1"
    "1.",".1"
  }
}

-- MSSP's shape tamers. Tries to get rid of strange architectural decisions such as pointy walls. [TAMERS]

SERRATED_EDGE_SMOOTHER =
{
  pass = "smoother"
  prob = 1000

  structure =
  {
    "1","1"
    "/","1"
  }

  diagonals =
  {
    ".1"
  }
}

SERRATED_EDGE_SMOOTHER2 =
{
  pass = "smoother"
  prob = 400

  structure =
  {
    "/","/"
    "/","1"
    "1","1"
  }

  diagonals =
  {
    ".1",".1"
    ".1"
  }
}

SERRATED_LIQUID_SMOOTHER =
{
  pass = "smoother"
  prob = 400

  env = "building"

  structure =
  {
    "1","1"
    "/","~"
    "~","~"
  }

  diagonals =
  {
    ".~"
  }
}

SERRATED_LIQUID_SMOOTHER_REVERSED =
{
  pass = "smoother"
  prob = 400

  env = "building"

  structure =
  {
    "~","~"
    "/","1"
    "1","1"
  }

  diagonals =
  {
    "21"
  }
}

SERRATED_LIQUID_SMOOTHER2 =
{
  pass = "smoother"
  prob = 400

  env = "building"

  structure =
  {
    "/~1","~~1"
    "/~1","~~1"
  }

  diagonals =
  {
    ".~"
    ".~"
  }
}

SERRATED_LIQUID_SMOOTHER3 =
{
  pass = "smoother"
  prob = 100

  env = "building"

  structure =
  {
    "~~1","~~1"
    "/~1","~~1"
  }

  diagonals =
  {
    ".~"
  }
}

SERRATED_AREA_TRANSITION_SMOOTHER =
{
  pass = "smoother"
  prob = 10000

  structure =
  {
    "2","2"
    "/","1"
    "1","1"
  }

  diagonals =
  {
    ".1"
  }
}

FAILED_SQUEEZE_ENTRANCE_SMOOTHER =
{
  pass = "smoother"
  prob = 10000

  structure =
  {
    "%..","%.."
    "11.","1.."
    "/..","/.."
  }

  diagonals =
  {
    "1.","1."
    "1.","1."
  }
}

--MSSP's random negative features [FEATURES] - 'negative' because they attempt to modify an existing room if it has too much clean space.

SPROUT_FEATURES_CENTER_ALTERED =
{
  prob = 150
  skip_prob = 5

  env = "building"

  structure =
  {
    "11111","11111"
    "11111","1/A%1"
    "11111","1AAA1"
    "11111","1%A/1"
    "11111","11111"
  }

  diagonals =
  {
    "1.",".1"
    "1.",".1"
  }
}

SPROUT_FEATURES_CENTER_ALTER_RAISED =
{
  prob = 150
  skip_prob = 5

  env = "building"

  structure =
  {
    "11111","11111"
    "11111","1/v%1"
    "11111","1>A<1"
    "11111","1%^/1"
    "11111","11111"
  }

  diagonals =
  {
    "1.",".1"
    "1.",".1"
  }
}

SPROUT_ELEVATED_PILLAR_ROUND =
{
  prob = 150

  env = "!cave"

  structure =
  {
    "1111111","1111111"
    "1111111","1/AAA%1"
    "1111111","1AAAAA1"
    "1111111","1>A.AA1"
    "1111111","1AAAAA1"
    "1111111","1%AAA/1"
    "1111111","1111111"
  }

  diagonals =
  {
    "1A","A1"
    "1A","A1"
  }
}

SPROUT_ELEVATED_PILLAR_U =
{
  prob = 150

  env = "!cave"

  structure =
  {
    "111111","111111"
    "111111","1>AAA1"
    "111111","1>AAA1"
    "111111","11.AA1"
    "111111","11AAA1"
    "111111","11AAA1"
    "111111","111111"
  }
}

SPROUT_ELEVATED_PILLAR_U_FULL =
{
  prob = 150

  env = "!cave"

  structure =
  {
    "1111111","1111111"
    "1111111","1>>AAA1"
    "1111111","1>>AAA1"
    "1111111","1AA.AA1"
    "1111111","1AAAAA1"
    "1111111","1AAAAA1"
    "1111111","1111111"
  }
}

SPROUT_WIDE_SPACE_DEPRESSION =
{
  prob = 150

  env = "!cave"

  structure =
  {
    "11111","11111"
    "11111","1vvv1"
    "11111","1AAA1"
    "11111","1AAA1"
    "11111","1^^^1"
    "11111","11111"
  }
}

SPROUT_WIDE_SPACE_CATWALK_FUNNEL =
{
  prob = 80

  env = "!cave"

  structure =
  {
    "111111","111111"
    "111111","1AAAA1"
    "111111","1%AA/1"
    "111111","11^^11"
    "x1111x","x1111x"
  }

  diagonals =
  {
    "1A","A1"
  }
}

SPROUT_WIDE_SPACE_CATWALK_PLAIN =
{
  prob = 75

  env = "!cave"

  structure =
  {
    "1111","1111"
    "1111","1AA1"
    "1111","1^^1"
    "1111","1111"
  }
}

SPROUT_WIDE_SPACE_CATWALK_TALL_PLAIN =
{
  prob = 75

  env = "!cave"

  structure =
  {
    "1111","1111"
    "1111","1AA1"
    "1111","1AA1"
    "1111","1^^1"
    "1111","1^^1"
    "1111","1111"
  }
}

SPROUT_WIDE_SPACE_PLATFORM_TINY =
{
  prob = 75

  env = "!cave"

  structure =
  {
    "1111","1111"
    "1111","1AA1"
    "1111","1>A1"
    "1111","1111"
  }
}

SPROUT_WIDE_SPACE_CATWALK_STRAIGHT =
{
  prob = 3500

  aversion = -1000

  env = "!cave"

  structure =
  {
    "1111","1111"
    "1111","1221"
    "1111","1221"
    "x22x","x22x"
  }
}

SPROUT_WIDE_SPACE_CATWALK_EXTRUDE =
{
  prob = 4000

  aversion = -1000

  env = "!cave"

  structure =
  {
    "1111","1111"
    "1111","1221"
    "1111","1221"
    "2222","2222"
  }
}

SPROUT_WIDE_SPACE_CATWALK_EXTRUDE_3X =
{
  prob = 4000

  aversion = -1000

  env = "!cave"

  structure =
  {
    "11111","11111"
    "11111","12221"
    "11111","12221"
    "22222","22222"
  }
}

SPROUT_WIDE_SPACE_CATWALK_CURVE =
{
  prob = 2500

  aversion = -1000

  env = "!cave"

  structure =
  {
    "111111","111111"
    "111111","122221"
    "111111","122221"
    "122xxx","122xxx"
  }
}

SPROUT_WIDE_SPACE_CATWALK_STRAIGHT_3X =
{
  prob = 3000

  env = "!cave"

  structure =
  {
    "11111","11111"
    "11111","12221"
    "11111","12221"
    "1222x","1222x"
  }
}

SPROUT_WIDE_SPACE_CATWALK_STRAIGHT_4X =
{
  prob = 2000

  env = "!cave"

  structure =
  {
    "111111","111111"
    "111111","122221"
    "111111","122221"
    "12222x","12222x"
  }
}

SPROUT_WIDE_SPACE_CATWALK_CAPPER_3X =
{
  prob = 1500

  env = "!cave"

  structure =
  {
    "11111","11111"
    "11111","1/2%1"
    "11111","12221"
    "1222x","1222x"
  }

  diagonals =
  {
    "12","21"
  }
}

SPROUT_WIDE_SPACE_CATWALK_CAPPER_4X =
{
  prob = 1500

  env = "!cave"

  structure =
  {
    "111111","111111"
    "111111","1/22%1"
    "111111","122221"
    "12222x","12222x"
  }

  diagonals =
  {
    "12","21"
  }
}

--[[GROW_WIDE_SPACE_CATWALK_STRAIGHT_BY_WALL =
{
  prob = 2000

  env = "building"

  aversion = -1000

  structure =
  {
    "111.","111."
    "111.","122."
    "122.","122."
  }
}

GROW_WIDE_SPACE_CATWALK_CAPPER =
{
  prob = 250

  env = "building"

  structure =
  {
    "1111","1111"
    "1111","1/%1"
    "1221","1221"
  }

  diagonals =
  {
    "12","21"
  }
}

GROW_WIDE_SPACE_CATWALK_CAPPER_BY_WALL =
{
  prob = 750

  env = "building"

  structure =
  {
    "111.","111."
    "111.","1/2."
    "122x","122x"
  }

  diagonals =
  {
    "12"
  }
}

GROW_WIDE_SPACE_CATWALK_CORNER_TURN =
{
  prob = 2500

  aversion = -1000

  structure =
  {
    "....","...."
    "111.","122."
    "122x","122x"
  }
}

GROW_WIDE_SPACE_CATWALK_THROUGH_WALL =
{
  prob = 1500

  structure =
  {
    "....",".22."
    "....",".22."
    "122x","122x"
  }
}

GROW_WIDE_SPACE_CATWALK_CAPPER_3WIDE =
{
  prob = 600

  env = "building"

  structure =
  {
    "1111","1111"
    "1111","1/2%"
    "1222","1222"
  }

  diagonals =
  {
    "12","21"
  }
}

GROW_WIDE_SPACE_CATWALK_STRAIGHT_TO_WALL =
{
  prob = 2500

  env = "building"

  structure =
  {
    "....","...."
    "1111","1221"
    "1221","1221"
  }
}]]

SPROUT_SKILLET =
{
  prob = 150

  env = "building"

  structure =
  {
    "x111111","x111111"
    "1111111","11/AA%1"
    "1111111","1>AAAA1"
    "1111111","1>AAAA1"
    "1111111","11%AA/1"
    "x111111","x111111"
  }

  diagonals =
  {
    "1A","A1"
    "1A","A1"
  }
}

SPROUT_WIDE_LOW_CEILING_SIDE =
{
  prob = 150

  env = "building"

  structure =
  {
    "1111.","1111."
    "1111.","1.AA."
    "1111.","1AAA."
    "1111.","1AAA."
    "1111.","1.AA."
    "1111.","1111."
  }
}

SPROUT_WIDE_LOW_CEILING_CENTER =
{
  prob = 150

  env = "building"

  structure =
  {
    "111111","111111"
    "111111","1.AA.1"
    "111111","1AAAA1"
    "111111","1AAAA1"
    "111111","1.AA.1"
    "111111","111111"
  }
}

SPROUT_WIDE_LOW_CEILING_CORNER =
{
  prob = 150

  env = "building"

  structure =
  {
    "......","......"
    ".11111",".AAAA1"
    ".11111",".AAA.1"
    ".11111",".AAA/1"
    ".11111",".A./11"
    ".11111",".11111"
  }

  diagonals =
  {
    "A1"
    "A1"
  }
}

SPROUT_COLLONADE_3_PILLARS =
{
  prob = 150

  env = "building"

  structure =
  {
    "1111111","1111111"
    "1111111","1.A.A.1"
    "1111111","1AAAAA1"
    "1111111","1AAAAA1"
    ".......","......."
  }
}

SPROUT_TRIANGULAR_LOW_CEILING =
{
  prob = 150

  env = "building"

  structure =
  {
    "1111111","1111111"
    "1111111","11/.%11"
    "1111111","1/AAA%1"
    "1111111","/AAAAA%"
    ".......","......."
  }

  diagonals =
  {
    "1A","A1"
    "1A","A1"
    "1A","A1"
  }
}

SPROUT_PILLAR_2X2 =
{
  prob = 150

  env = "building"

  structure =
  {
    "1111","1111"
    "1111","1..1"
    "1111","1..1"
    "1111","1111"
  }
}

SPROUT_PILLAR_3X3 =
{
  prob = 150

  env = "building"

  structure =
  {
    "11111","11111"
    "11111","1/.%1"
    "11111","1...1"
    "11111","1%./1"
    "11111","11111"
  }

  diagonals =
  {
    "1.",".1"
    "1.",".1"
  }
}

SPROUT_PILLAR_BEAN =
{
  prob = 150

  env = "building"

  structure =
  {
    "1111","1111"
    "1111","1/.1"
    "1111","1./1"
    "1111","1111"
  }

  diagonals =
  {
    "1."
    ".1"
  }
}

SPROUT_PILLAR_GATE =
{
  prob = 80

  env = "building"

  structure =
  {
    "111111","111111"
    "111111","1.AA.1"
    "111111","111111"
  }
}

SPROUT_CATWALK_SUPPORT_PILLAR_OUTER =
{
  prob = 150

  structure =
  {
    "1122","1122"
    "1122","1.22"
    "1122","1122"
  }
}

SPROUT_CATWALK_SUPPORT_PILLAR_INNER =
{
  prob = 150

  structure =
  {
    "1122","1122"
    "1122","11.2"
    "1122","1122"
  }
}

SPROUT_CATWALK_SUPPORT_PILLAR_INNER_DOUBLE =
{
  prob = 150

  structure =
  {
    "1122","1122"
    "1122","11.2"
    "1122","1122"
    "1122","11.2"
    "1122","1122"
  }
}

SMOOTHER_CHAMFER_WIDE_ROOM_CORNER =
{
  prob = 1500

  pass = "smoother"

  env = "building"

  structure =
  {
    ".....","....."
    ".1111",".../1"
    ".1111","../11"
    ".1111","./111"
    ".1111",".1111"
  }

  diagonals =
  {
    ".1"
    ".1"
    ".1"
  }
}

SMOOTHER_CHAMFER_WIDE_ROOM_CORNER_OUTLET =
{
  prob = 1500

  pass = "smoother"

  env = "building"

  structure =
  {
    ".....","....."
    ".1111","....1"
    ".1111","....1"
    ".1111",".../1"
    ".1111",".1111"
  }

  diagonals =
  {
    ".1"
  }
}

SMOOTHER_CHAMFER_WIDE_ROOM_CORNER_OUTLET_SOLID =
{
  prob = 1500

  pass = "smoother"

  env = "building"

  structure =
  {
    ".....","....."
    ".1111","...11"
    ".1111","...11"
    ".1111",".1111"
    ".1111",".1111"
  }

  diagonals =
  {
    ".1"
  }
}

SMOOTHER_CATWALK_EDGES =
{
  prob = 1500
  pass = "smoother"

  structure =
  {
    "11","11"
    "21","%1"
  }

  diagonals =
  {
    "21"
  }
}

--This exit will cause errors, because it will keep looking for staircase prefabs
--at the specially matched height of any given two floors this rule may apply to. Bad idea!

--[[DECORATE_WIDE_SPACE_CATWALK_EXIT =
{
  prob = 20

  structure =
  {
    "1111","1111"
    "1111","11^^"
    "1122","1122"
  }
}]]

-- MSSP's rooms shaped like English alphabet letters. [LETTERS]

GROW_T =
{
  prob = 75

  structure =
  {
    "x............","x111111111111"
    "1............","1111111111111"
    "1............","1111111111111"
    "x............","x111111111111"
    "x............","x....1111...."
    "x............","x....1111...."
    "x............","x....1111...."
    "x............","x....1111...."
  }
}

GROW_T_STALK_ENTRY =
{
  prob = 65

  structure =
  {
    "............","111111111111"
    "............","111111111111"
    "............","111111111111"
    "............","111111111111"
    "............","....1111...."
    "............","....1111...."
    "............","....1111...."
    "............","....1111...."
    "xxxxx11xxxxx","xxxxx11xxxxx"
  }
}

GROW_X =
{
  prob = 65

  structure =
  {
    "x............","x111%..../111"
    "1............","11111%../1111"
    "1............","1111111111111"
    "x............","x111111111111"
    "x............","x%1111111111/"
    "x............","x.%11111111/."
    "x............","x..11111111.."
    "x............","x..11111111.."
    "x............","x./11111111%."
    "x............","x/1111111111%"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x1111/..%1111"
    "x............","x111/....%111"
  }

  diagonals =
  {
    "1.",".1"
    "1.",".1"
    ".1","1."
    ".1","1."
    ".1","1."
    ".1","1."
    "1.",".1"
    "1.",".1"
  }
}

GROW_H =
{
  prob = 65

  structure =
  {
    "x............","x1111....1111"
    "1............","11111....1111"
    "1............","11111....1111"
    "x............","x1111%../1111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x1111/..%1111"
    "x............","x1111....1111"
    "x............","x1111....1111"
    "x............","x1111....1111"
  }

  diagonals =
  {
    "1.",".1"
    "1.",".1"
  }
}

GROW_H_STALK_ENTRY_TEST =
{
  prob = 65

  structure =
  {
    "x11xxxxxxxxx","x11xxxxxxxxx"
    "............","1111....1111"
    "............","1111....1111"
    "............","1111....1111"
    "............","1111%../1111"
    "............","111111111111"
    "............","111111111111"
    "............","111111111111"
    "............","111111111111"
    "............","1111/..%1111"
    "............","1111....1111"
    "............","1111....1111"
    "............","1111....1111"
  }

    diagonals =
  {
    "1.",".1"
    "1.",".1"
  }
}

GROW_Z =
{
  prob = 65

  structure =
  {
    "x........","x11111111"
    "1........","111111111"
    "1........","111111111"
    "x........","x11111111"
    "x........","x...1111/"
    "x........","x../111/."
    "x........","x./111/.."
    "x........","x/1111..."
    "x........","x11111111"
    "x........","x11111111"
    "x........","x11111111"
    "x........","x11111111"
  }

  diagonals =
  {
    "1."
    ".1","1."
    ".1","1."
    ".1"
  }
}

GROW_Z_ALT =
{
  prob = 65

  structure =
  {
    "........x","11111111x"
    "........1","111111111"
    "........1","111111111"
    "........x","11111111x"
    "........x","...1111/x"
    "........x","../111/.x"
    "........x","./111/..x"
    "........x","/1111...x"
    "........x","11111111x"
    "........x","11111111x"
    "........x","11111111x"
    "........x","11111111x"
  }

  diagonals =
  {
    "1."
    ".1","1."
    ".1","1."
    ".1"
  }
}

GROW_C =
{
  prob = 75

  structure =
  {
    "........x","./111111x"
    "........1","/11111111"
    "........1","111111111"
    "........x","11111111x"
    "........x","1111/...x"
    "........x","1111....x"
    "........x","1111....x"
    "........x","1111%...x"
    "........x","11111111x"
    "........x","11111111x"
    "........x","%1111111x"
    "........x",".%111111x"
  }

  diagonals =
  {
    ".1"
    ".1"
    "1."
    "1."
    ".1"
    ".1"
  }
}

GROW_O =
{
  prob = 75

  structure =
  {
    "........","./1111%."
    "........","/111111%"
    "........","11111111"
    "........","111..111"
    "........","111..111"
    "........","11111111"
    "........","%111111/"
    "........",".%1111/."
    "xxx11xxx","xxx11xxx"
  }

  diagonals =
  {
    ".1","1."
    ".1","1."
    ".1","1."
    ".1","1."
  }
}

GROW_L =
{
  prob = 75

  structure =
  {
    "x11xxxxx","x11xxxxx"
    "........","1111...."
    "........","1111...."
    "........","1111...."
    "........","1111...."
    "........","11111111"
    "........","11111111"
    "........","11111111"
    "........","11111111"
  }
}

-- Elevated letters.

GROW_ELEVATED_T_STALK_ENTRY =
{
  prob = 20

  aversion = 10

  structure =
  {
    "x........","x1111AAAA"
    "1........","11111AAAA"
    "1........","11111AAAA"
    "x........","x1111AAAA"
    "x........","x11>AAAAA"
    "x........","x11>AAAAA"
    "x........","x11>AAAAA"
    "x........","x11>AAAAA"
    "x........","x1111AAAA"
    "x........","x1111AAAA"
    "x........","x1111AAAA"
    "x........","x1111AAAA"
  }
}

GROW_ELEVATED_T_SIDE_ENTRY =
{
  prob = 20

  aversion = 10

  structure =
  {
    "xxxxx11x","xxxxx11x"
    "........","11111111"
    "........","11111111"
    "........","1111vvvv"
    "........","1111AAAA"
    "........","AAAAAAAA"
    "........","AAAAAAAA"
    "........","AAAAAAAA"
    "........","AAAAAAAA"
    "........","1111AAAA"
    "........","1111^^^^"
    "........","11111111"
    "........","11111111"
  }
}

GROW_ELEVATED_H_ENTRY =
{
  prob = 20

  aversion = 10

  structure =
  {
    "xxxxxxxxx11x","xxxxxxxxx11x"
    "............","1111AAAA1111"
    "............","1111AAAA1111"
    "............","1111AAAA1111"
    "............","1111^^^^1111"
    "............","111111111111"
    "............","111111111111"
    "............","111111111111"
    "............","111111111111"
    "............","1111vvvv1111"
    "............","1111AAAA1111"
    "............","1111AAAA1111"
    "............","1111AAAA1111"
  }
}

GROW_ELEVATED_H_ALT =
{
  prob = 20

  aversion = 10

  structure =
  {
    "xxxxxxxxx11x","xxxxxxxxx11x"
    "............","111111111111"
    "............","111111111111"
    "............","vvvv1111vvvv"
    "............","AAAA1111AAAA"
    "............","AAAAAAAAAAAA"
    "............","AAAAAAAAAAAA"
    "............","AAAAAAAAAAAA"
    "............","AAAAAAAAAAAA"
    "............","AAAA1111AAAA"
    "............","^^^^1111^^^^"
    "............","111111111111"
    "............","111111111111"
  }
}

GROW_ELEVATED_O =
{
  prob = 20

  structure =
  {
    "x11xxxxxxxxx","x11xxxxxxxxx"
    "............","111111111111"
    "............","111111111111"
    "............","11/AAAAAA%11"
    "............","11AAAAAAAA11"
    "............","11AAAAAAAA11"
    "............","11>AAAAAA<11"
    "............","11>AAAAAA<11"
    "............","11AAAAAAAA11"
    "............","11AAAAAAAA11"
    "............","11%AAAAAA/11"
    "............","111111111111"
    "............","111111111111"
  }

  diagonals =
  {
    "1A","A1"
    "1A","A1"
  }
}

--[MISC SHAPES]

--[[GROW_PILL =
{
  prob = 20

  structure =
  {
    "111111111111"
    "111111111111"
    "1111vvvv1111"
    "AAAAAAAAAAAA"
  }
}]]

-- MSSP's huge-arse rooms. [HUGE]

ROOT_WIDE_SPACE_4X2 =
{
  prob = 100

  structure =
  {
    "x........","x11111111"
    "1........","111111111"
    "1........","111111111"
    "x........","x11111111"
  }
}

ROOT_WIDE_SPACE_4X8 =
{
  prob = 100

  structure =
  {
    "x........","x11111111"
    "x........","x11111111"
    "1........","111111111"
    "1........","111111111"
    "1........","111111111"
    "1........","111111111"
    "x........","x11111111"
    "x........","x11111111"
  }
}

GROW_WIDE_SPACE_12x12 =
{
  prob = 75

  structure =
  {
    "1............","1111111111111"
    "1............","1111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
  }
}

GROW_WIDE_SPACE_8x12 =
{
  prob = 100

  structure =
  {
    "1............","1111111111111"
    "1............","1111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
    "x............","x111111111111"
  }
}

GROW_WIDE_SPACE_8x8 =
{
  prob = 100

  structure =
  {
    "1........","111111111"
    "1........","111111111"
    "x........","x11111111"
    "x........","x11111111"
    "x........","x11111111"
    "x........","x11111111"
    "x........","x11111111"
    "x........","x11111111"
  }
}

GROW_EXTRUSION_4X6 =
{
  prob = 125

  structure =
  {
    "1111","1111"
    "....","1111"
    "....","1111"
    "....","1111"
    "....","1111"
    "....","1111"
    "....","1111"
  }
}

GROW_EXTRUSION_4X4 =
{
  prob = 150

  structure =
  {
    "1111","1111"
    "....","1111"
    "....","1111"
    "....","1111"
    "....","1111"
  }
}

GROW_EXTRUSION_4X2 =
{
  prob = 200

  structure =
  {
    "1111","1111"
    "....","1111"
    "....","1111"
  }
}

GROW_EXTRUSION_3X2 =
{
  prob = 125

  structure =
  {
    "111","111"
    "...","111"
    "...","111"
  }
}

GROW_EXTRUSION_3X4 =
{
  prob = 200

  structure =
  {
    "111","111"
    "...","111"
    "...","111"
    "...","111"
    "...","111"
  }
}

GROW_EXTRUSION_NEW_AREA_4x2 =
{
  prob = 80

  structure =
  {
    "1111","1111"
    "....","AAAA"
    "....","AAAA"
  }
}

GROW_EXTRUSION_STAIRCASE_4x2 =
{
  prob = 80

  structure =
  {
    "1111","1111"
    "....","AAvv"
    "....","AAvv"
    "....","AAAA"
    "....","AAAA"
  }
}

GROW_EXTRUSION_STAIRCASE_4x2_SIDEWAYS =
{
  prob = 80

  structure =
  {
    "1111","1111"
    "....","A<<1"
    "....","A<<1"
    "....","AAAA"
    "....","AAAA"
  }
}

GROW_EXTRUSION_STAIRCASE_4x2_SMALL =
{
  prob = 80

  structure =
  {
    "1111","1111"
    "....","AAAv"
    "....","AAAA"
    "....","AAAA"
    "....","AAAA"
  }
}

GROW_EXTRUSION_STAIRCASE_4x2_SMALL_SIDEWAYS =
{
  prob = 80

  structure =
  {
    "1111","1111"
    "....","AA<1"
    "....","AAAA"
    "....","AAAA"
    "....","AAAA"
  }
}

GROW_EXTRUSION_SINK =
{
  prob = 5

  structure =
  {
    "1111","1111"
    "....","1111"
    "....","1vAA"
    "....","1AAA"
    "....","1^AA"
    "....","1111"
  }
}

DECORATE_CAGE_CANALS_STRAIGHT_3X =
{
  prob = 50

  env = "building"

  structure =
  {
    "...","CCC"
    "~~~","~~~"
    "111","111"
  }

  cage_mode = "fancy"
}

DECORATE_CAGE_CANALS_STRAIGHT_1X =
{
  prob = 25

  env = "building"

  structure =
  {
    "..","C."
    "~~","~~"
    "11","11"
  }

  cage_mode = "fancy"
}

DECORATE_CAGE_CANALSWIDE_STRAIGHT_3X =
{
  prob = 40

  env = "building"

  structure =
  {
    "...","CCC"
    "~~~","~~~"
    "~~~","~~~"
    "111","111"
  }

  cage_mode = "fancy"
}

DECORATE_CAGE_CANALSWIDE_STRAIGHT_1X =
{
  prob = 25

  env = "building"

  structure =
  {
    "..","C."
    "~~","~~"
    "~~","~~"
    "11","11"
  }

  cage_mode = "fancy"
}

GROW_WIDE_SPACE_2X12 =
{
  prob = 2
  prob_skew = 1

  structure =
  {
    "1............","1111111111111"
    "1............","1111111111111"
  }
}

GROW_WIDE_SPACE_2X12_SIDEWAYS =
{
  prob = 2
  prob_skew = 1

  structure =
  {
    ".............","1111111111111"
    ".............","1111111111111"
    "11xxxxxxxxxxx","11xxxxxxxxxxx"
  }
}

GROW_WIDE_SPACE_2X8 =
{
  prob = 2
  prob_skew = 1

  structure =
  {
    "1........","111111111"
    "1........","111111111"
  }
}

GROW_WIDE_SPACE_2X8_SIDEWAYS =
{
  prob = 2
  prob_skew = 1

  structure =
  {
    ".........","111111111"
    ".........","111111111"
    "11xxxxxxx","11xxxxxxx"
  }
}

SPROUT_ROUNDED_CAP =
{
  prob = 20
  prob_skew = 10

  structure =
  {
    "1...","111%"
    "1...","1111"
    "1...","1111"
    "1...","111/"
  }

  diagonals =
  {
    "1."
    "1."
  }
}

SPROUT_BLADED_CAP =
{
  prob = 20
  prob_skew = 10

  structure =
  {
    "1..","111"
    "1..","111"
    "1..","11/"
    "1..","1/."
  }

  diagonals =
  {
    "1."
    "1."
  }
}

--MSSP's cliff extensions [CLIFF] [LEDGES]

GROW_INTO_CLIFF =
{
  prob = 50

  structure =
  {
    "....","11AA"
    "....","11^^"
    "....","1111"
    "x11x","x11x"
  }
}

GROW_INTO_CLIFF_TALL =
{
  prob = 50

  structure =
  {
    "....","11AA"
    "....","11AA"
    "....","11^^"
    "....","1111"
    "x11x","x11x"
  }
}

GROW_CLIFF_EXTENSION =
{
  prob = 1000

  aversion = -100

  structure =
  {
    "x..","x.."
    "1..","111"
    "2..","222"
    "x..","x.."
  }
}

GROW_CLIFF_EXTENSION_UP_WE_GO =
{
  prob = 350

  structure =
  {
    "x...","x..."
    "1...","1>AA"
    "2...","2222"
    "x...","x..."
  }
}

GROW_CLIFF_EXTENSION_OUTER_CURVE =
{
  prob = 750

  aversion = -75

  structure =
  {
    "1..","111"
    "2..","2%1"
    "x..","x21"
  }

  diagonals =
  {
    "21"
  }
}

GROW_CLIFF_EXTENSION_INNER_CURVE =
{
  prob = 750

  aversion = -75

  structure =
  {
    "x...","x112"
    "1...","11/2"
    "2...","2222"
  }

  diagonals =
  {
    "12"
  }
}

GROW_CLIFF_EXTENSION_X2 =
{
  prob = 3000

  aversion = -1000

  structure =
  {
    "1..","111"
    "1..","111"
    "2..","222"
    "2..","222"
  }
}

GROW_CLIFF_EXTENSION_X2_UP_WE_GO =
{
  prob = 500

  structure =
  {
    "1...","1>AA"
    "1...","1>AA"
    "2...","2222"
    "2...","2222"
  }
}

GROW_CLIFF_EXTENSION_OUTER_CURVE_X2 =
{
  prob = 2500

  aversion = -1000

  structure =
  {
    "1....","11111"
    "1....","11111"
    "2....","22%11"
    "2....","22211"
  }

  diagonals =
  {
    "21"
  }
}

GROW_CLIFF_EXTENSION_OUTER_CURVE_X2 =
{
  prob = 2500

  aversion = -1000

  structure =
  {
    "x....","x1122"
    "1....","11122"
    "1....","11/22"
    "2....","22222"
    "2....","22222"
  }

  diagonals =
  {
    "12"
  }
}

GROW_CLIFF_EXTENSON_NEW_AREA =
{
  prob = 150

  structure =
  {
    "x..","x.."
    "1..","1AA"
    "2..","222"
    "x..","x.."
  }
}

GROW_CLIFF_EXTENSON_NEW_AREA_INWARD =
{
  prob = 300

  structure =
  {
    "x..","xAA"
    "1..","111"
    "2..","222"
    "x..","x.."
  }
}

GROW_CLIFF_EXTENSION_NEW_AREA_X2 =
{
  prob = 750

  structure =
  {
    "1..","1AA"
    "1..","1AA"
    "2..","222"
    "2..","222"
  }
}

GROW_CLIFF_EXTENSION_NEW_AREA_INWARD_X2 =
{
  prob = 1500

  structure =
  {
    "x..","xAA"
    "x..","xAA"
    "1..","111"
    "1..","111"
    "2..","222"
    "2..","222"
  }
}

-- MSSP's huge liquid rooms. [HUGE-LIQUID]

GROW_HUGE_LIQUID_ROOM_ZIGZAG =
{
  prob = 15

  aversion = 5

  env = "building"

  structure =
  {
    "........","~~11~~~~"
    "........","~~11~~~~"
    "........","~~%1%~~~"
    "........","~~~%1%~~"
    "........","~~~~11~~"
    "........","~~~~11~~"
    "xxxx11xx","xxxx11xx"
  }

  diagonals =
  {
    "~1","1~"
    "~1","1~"
  }
}

GROW_HUGE_LIQUID_ROOM_TUMOR =
{
  prob = 15

  aversion = 5

  env = "building"

  structure =
  {
    "..........","~~~~11~~~~"
    "..........","~~~~11~~~~"
    "..........","~~~/11%~~~"
    "..........","~~~1111~~~"
    "..........","~~~1111~~~"
    "..........","~~~%11/~~~"
    "..........","~~~~11~~~~"
    "..........","~~~~11~~~~"
    "xxxx11xxxx","xxxx11xxxx"
  }

  diagonals =
  {
    "~1","1~"
    "~1","1~"
  }
}

GROW_HUGE_LIQUID_ROOM_TUMOR_ELEVATED =
{
  prob = 15

  aversion = 5

  env = "building"

  structure =
  {
    "..........","~~~~AA~~~~"
    "..........","~~~~AA~~~~"
    "..........","~~~/AA%~~~"
    "..........","~~~AAAA~~~"
    "..........","~~~AAAA~~~"
    "..........","~~~%AA/~~~"
    "..........","~~~~AA~~~~"
    "..........","~~~~11~~~~"
    "xxxx11xxxx","xxxx11xxxx"
  }

  diagonals =
  {
    "~A","A~"
    "~A","A~"
  }
}

GROW_HUGE_LIQUID_ROOM_PILLARED_PLATFORM =
{
  prob = 10

  aversion = 3

  env = "building"

  structure =
  {
    "xxxx11xxxx","xxxx11xxxx"
    "..........","~~~~11~~~~"
    "..........","~~~~11~~~~"
    "..........","~~.1111.~~"
    "..........","~~111111~~"
    "..........","~~111111~~"
    "..........","~~111111~~"
    "..........","~~.1111.~~"
    "..........","~~~~11~~~~"
    "..........","~~~~11~~~~"
  }
}

GROW_HUGE_LIQUID_ROOM_PILLARED_PLATFORM_STAIRS =
{
  prob = 10

  aversion = 3

  env = "building"

  structure =
  {
    "xxxx11xxxx","xxxx11xxxx"
    "..........","~~~~11~~~~"
    "..........","~~~~vv~~~~"
    "..........","~~.AAAA.~~"
    "..........","~~AAAAAA~~"
    "..........","~~AAAAAA~~"
    "..........","~~AAAAAA~~"
    "..........","~~.AAAA.~~"
    "..........","~~~~11~~~~"
    "..........","~~~~11~~~~"
  }
}

GROW_HUGE_LIQUID_ROOM_PILLARED_FROM_WALL =
{
  prob = 10

  aversion = 3

  env = "building"

  structure =
  {
    "xxxx11xxxx","xxxx11xxxx"
    "..........","~~111111~~"
    "..........","~~111111~~"
    "..........","~~.1111.~~"
    "..........","~~~~11~~~~"
    "..........","~~~~11~~~~"
  }
}

GROW_HUGE_LIQUID_ROOM_PILLARED_TO_WALL =
{
  prob = 10

  aversion = 3

  env = "building"

  structure =
  {
    "..........","~~111111~~"
    "..........","~~111111~~"
    "..........","~~.1111.~~"
    "..........","~~~~11~~~~"
    "..........","~~~~11~~~~"
    "xxxx11xxxx","xxxx11xxxx"
  }
}

GROW_HUGE_LIQUID_ROOM_PILLARED_TO_WALL_STAIRS =
{
  prob = 10

  aversion = 3

  env = "building"

  structure =
  {
    "..........","~~AAAAAA~~"
    "..........","~~AAAAAA~~"
    "..........","~~.AAAA.~~"
    "..........","~~~~^^~~~~"
    "..........","~~~~11~~~~"
    "xxxx11xxxx","xxxx11xxxx"
  }
}

GROW_HUGE_LIQUID_ROOM_SQUARE =
{
  prob = 35

  aversion = 15

  structure =
  {
    "............","111111111111"
    "............","111111111111"
    "............","11~~~~~~~~11"
    "............","11~~~~~~~~11"
    "............","11~~~~~~~~11"
    "............","11~~~~~~~~11"
    "............","11~~~~~~~~11"
    "............","11~~~~~~~~11"
    "............","11~~~~~~~~11"
    "............","11~~~~~~~~11"
    "............","111111111111"
    "............","111111111111"
    "xxxxxxxxx11x","xxxxxxxxx11x"
  }

  diagonals =
  {
    "1~","~1"
    "1~","~1"
  }
}

GROW_HUGE_LIQUID_ROOM_SQUARE_THIN =
{
  prob = 25

  aversion = 8

  structure =
  {
    "........","11111111"
    "........","11111111"
    "........","11~~~~11"
    "........","11~~~~11"
    "........","11~~~~11"
    "........","11~~~~11"
    "........","11~~~~11"
    "........","11~~~~11"
    "........","11~~~~11"
    "........","11~~~~11"
    "........","11111111"
    "........","11111111"
    "xxxxx11x","xxxxx11x"
  }

  diagonals =
  {
    "1~","~1"
    "1~","~1"
  }
}

GROW_HUGE_LIQUID_ROOM_SQUARE_ELEVATED =
{
  prob = 40

  aversion = 15

  structure =
  {
    "............","AAAAAAAAAAAA"
    "............","AAAAAAAAAAAA"
    "............","AA/~~~~~~%AA"
    "............","AA~~~~~~~~AA"
    "............","AA~~~~~~~~AA"
    "............","^^~~~~~~~~^^"
    "............","^^~~~~~~~~^^"
    "............","11~~~~~~~~11"
    "............","11~~~~~~~~11"
    "............","11%~~~~~~/11"
    "............","111111111111"
    "............","111111111111"
    "xxxxxxxxx11x","xxxxxxxxx11x"
  }

  diagonals =
  {
    "A~","~A"
    "1~","~1"
  }
}

GROW_HUGE_LIQUID_ROOM_SQUARE_THIN_ELEVATED =
{
  prob = 35

  aversion = 15

  structure =
  {
    "........","AAAAAAAA"
    "........","AAAAAAAA"
    "........","AA/~~%AA"
    "........","AA~~~~AA"
    "........","AA~~~~AA"
    "........","^^~~~~^^"
    "........","^^~~~~^^"
    "........","11~~~~11"
    "........","11~~~~11"
    "........","11%~~/11"
    "........","11111111"
    "........","11111111"
    "xxxxx11x","xxxxx11x"
  }

  diagonals =
  {
    "A~","~A"
    "1~","~1"
  }
}
GROW_HUGE_LIQUID_ROOM_SQUARE_L =
{
  prob = 35

  aversion = 15

  env = "building"

  structure =
  {
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","111111111111"
    "............","111111111111"
    "xxxxxxxxx11x","xxxxxxxxx11x"
  }

  diagonals =
  {
    "1~"
  }
}

GROW_HUGE_LIQUID_ROOM_SQUARE_L_ELEVATED =
{
  prob = 35

  aversion = 15

  env = "building"

  structure =
  {
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","^^~~~~~~~~~~"
    "............","^^~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","111111111111"
    "............","111111111111"
    "xxxxxxxxx11x","xxxxxxxxx11x"
  }

  diagonals =
  {
    "1~"
  }
}

GROW_HUGE_LIQUID_ROOM_SQUARE_U =
{
  prob = 35

  aversion = 15

  env = "building"

  structure =
  {
    "............","111111111111"
    "............","111111111111"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","111111111111"
    "............","111111111111"
    "xxxxxxxxx11x","xxxxxxxxx11x"
  }
}

GROW_HUGE_LIQUID_ROOM_SQUARE_U_THIN =
{
  prob = 25

  aversion = 15

  env = "building"

  structure =
  {
    "............","111111111111"
    "............","111111111111"
    "............","11/~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11%~~~~~~~~~"
    "............","111111111111"
    "............","111111111111"
    "xxxxxxxxx11x","xxxxxxxxx11x"
  }

  diagonals =
  {
    "1~"
    "1~"
  }
}

GROW_HUGE_LIQUID_ROOM_SQUARE_U_ELEVATED =
{
  prob = 35

  aversion = 15

  env = "building"

  structure =
  {
    "............","AAAAA<<11111"
    "............","AAAAA<<11111"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AAAAA<<11111"
    "............","AAAAA<<11111"
    "xxxxxxxxx11x","xxxxxxxxx11x"
  }
}

GROW_HUGE_LIQUID_ROOM_SQUARE_U_ELEVATED =
{
  prob = 25

  aversion = 10

  env = "building"

  structure =
  {
    "............","AAAAA<<11111"
    "............","AAAAA<<11111"
    "............","AA/~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA~~~~~~~~~~"
    "............","AA%~~~~~~~~~"
    "............","AAAAA<<11111"
    "............","AAAAA<<11111"
    "xxxxxxxxx11x","xxxxxxxxx11x"
  }

  diagonals =
  {
    "A~"
    "A~"
  }
}

GROW_HUGE_LIQUID_ROOM_STRAIGHT_SIDE =
{
  prob = 50

  aversion = 25

  env = "building"

  structure =
  {
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "11xxxxxx","11xxxxxx"
  }
}

GROW_HUGE_LIQUID_ROOM_STRAIGHT_SIDE_WIDER =
{
  prob = 50

  aversion = 25

  env = "building"

  structure =
  {
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "............","11~~~~~~~~~~"
    "11xxxxxxxxxx","11xxxxxxxxxx"
  }
}

GROW_HUGE_LIQUID_ROOM_STRAIGHT_SIDE_SMALLER =
{
  prob = 25

  aversion = 10

  env = "building"

  structure =
  {
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "........","11~~~~~~"
    "11xxxxxx","11xxxxxx"
  }
}

-- MSSP's procedural platforms-on-liquids [LIQUID-PLATFORM]

SPROUT_LIQUID_PLATFORM_ENTRY =
{
  prob = 250



  structure =
  {
    "1~~~","1%~~"
    "1~~~","111~"
    "1~~~","111~"
    "1~~~","1/~~"
  }

  diagonals =
  {
    "1~"
    "1~"
  }
}

SPROUT_LIQUID_PLATFORM_STRAIGHT =
{
  prob = 7000

  structure =
  {
    "x~~","x~~"
    "1~~","111"
    "1~~","111"
    "x~~","x~~"
  }
}

SPROUT_LIQUID_PLATFORM_STRAIGHT_NEW_AREA =
{
  prob = 5000


  structure =
  {
    "x~~","x~~"
    "1~~","1AA"
    "1~~","1AA"
    "x~~","x~~"
  }
}

SPROUT_LIQUID_PLATFORM_STRAIGHT_NEW_AREA_STAIRS =
{
  prob = 5000


  structure =
  {
    "x~~~","x~~~"
    "1~~~","1>AA"
    "1~~~","1>AA"
    "x~~~","x~~~"
  }
}

SPROUT_LIQUID_PLATFORM_STRAIGHT_LONG =
{
  prob = 5000


  structure =
  {
    "x~~~~","x~~~~"
    "1~~~~","11111"
    "1~~~~","11111"
    "x~~~~","x~~~~"
  }
}

SPROUT_LIQUID_PLATFORM_CURVED =
{
  prob = 3500


  structure =
  {
    "x~~~","x~~~"
    "1~~~","111%"
    "1~~~","1111"
    "x~~~","x%11"
  }

  diagonals =
  {
    "1~"
    "~1"
  }
}

SPROUT_LIQUID_PLATFORM_LARGE_CIRCLE =
{
  prob = 5000

  structure =
  {
    "x~~~~","x/11%"
    "1~~~~","11111"
    "1~~~~","11111"
    "x~~~~","x%11/"
  }

  diagonals =
  {
    "~1","1~"
    "~1","1~"
  }
}

SPROUT_LIQUID_PLATFORM_4x4 =
{
  prob = 2000

  structure =
  {
    "x~~~~","x1111"
    "1~~~~","11111"
    "1~~~~","11111"
    "x~~~~","x1111"
  }
}

-- MSSP's liquid placer [LIQUID-CLIFF]

DECORATE_LIQUID_POOL_PLACE =
{
  prob = 35

  env = "building"

  structure =
  {
    "1111","1111"
    "1111","1~~1"
    "1111","1~~1"
    "1111","1111"
  }
}

DECORATE_LIQUID_POOL_PLACE_DIAMOND =
{
  prob = 5

  aversion = 1

  env = "building"

  structure =
  {
    "1111","1111"
    "1111","1/%1"
    "1111","1%/1"
    "1111","1111"
  }

  diagonals =
  {
    "1~","~1"
    "1~","~1"
  }
}

DECORATE_LIQUID_POOL_PLACE_3x3 =
{
  prob = 35

  env = "building"

  structure =
  {
    "11111","11111"
    "11111","1/~%1"
    "11111","1~~~1"
    "11111","1%~/1"
    "11111","11111"
  }

  diagonals =
  {
    "1~","~1"
    "1~","~1"
  }
}

DECORATE_LIQUID_POOL_PLACE_3x6 =
{
  prob = 40

  env = "building"

  structure =
  {
    "1111111","1111111"
    "1111111","1/~~~%1"
    "1111111","1~~~~~1"
    "1111111","1%~~~/1"
    "1111111","1111111"
  }

  diagonals =
  {
    "1~","~1"
    "1~","~1"
  }
}

DECORATE_LIQUID_POOL_EXTEND_STRAIGHT =
{
  prob = 100

  env = "building"

  structure =
  {
    "x111","x111"
    "~111","~~~1"
    "~111","~~~1"
    "1111","1111"
  }
}

DECORATE_LIQUID_POOL_EXTEND_CURVED =
{
  prob = 75

  env = "building"

  structure =
  {
    "x111","x111"
    "~111","~~%1"
    "~111","~~~1"
    "1111","1~~1"
    "1111","1111"
  }

  diagonals =
  {
    "~1"
  }
}

DECORATE_LIQUID_PILLAR =
{
  prob = 10

  env = "building"

  structure =
  {
    "1~~","1~~"
    "1~~","1.~"
    "1~~","1~~"
  }
}

DECORATE_LIQUID_PILLAR_INWARD =
{
  prob = 6

  env = "building"

  structure =
  {
    ".11~",".11~"
    ".11~",".A.~"
    ".11~",".11~"
  }
}

DECORATE_LIQUID_PILLAR_INWARD =
{
  prob = 6

  env = "building"

  structure =
  {
    ".11~",".A.~"
    ".11~",".11~"
    ".11~",".A.~"
    ".11~",".11~"
    ".11~",".A.~"
    ".11~",".11~"
  }
}

DECORATE_LIQUID_PILLAR_3X =
{
  prob = 10

  env = "building"

  structure =
  {
    "1~~","1~~"
    "1~~","1.~"
    "1~~","1~~"
    "1~~","1.~"
    "1~~","1~~"
    "1~~","1.~"
  }
}

-- FORGET IT LMAO IT DOESN'T WORK
--[[ MSSP's city streets. ExperiMENTAL. [STREETS]

GROW_STREETS_ENTRY =
{
  prob = 1000000

  env = "!building"

  theme = "urban"

  z_dir = "down"

  structure =
  {
    "............","111111111111"
    "............","1111vvvv1111"
    "............","AAAAAAAAAAAA"
    "............","AAAAAAAAAAAA"
    "............","AAAAAAAAAAAA"
    "............","AAAAAAAAAAAA"
    "............","1111^^^^1111"
    "............","111111111111"
    "xxxxxxxxx11x","xxxxxxxxx11x"
  }
}

GROW_STREETS_STRAIGHT =
{
  prob = 1000000

  env = "!building"

  theme = "urban"

  structure =
  {
    "................1111","11111111111111111111"
    "................1111","11111111111111111111"
    "................2222","22222222222222222222"
    "................2222","22222222222222222222"
    "................2222","22222222222222222222"
    "................2222","22222222222222222222"
    "................1111","11111111111111111111"
    "................1111","11111111111111111111"
  }
}]]

-- end of SHAPE_GRAMMAR

}
