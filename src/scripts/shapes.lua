------------------------------------------------------------------------
--  GRAMMAR RULES
------------------------------------------------------------------------
--
--  Oblige Level Maker // ObAddon
--
--  Copyright (C) 2015-2017 Andrew Apted
--  Copyright (C) 2018-2019 MsrSgtShooterPerson
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
    "x1x", "x1x"
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
  prob = 8
  skip_prob = 30
  aversion = 10

  structure =
  {
    "....", "1111"
    "....", "1CC1"
    "....", "1CC1"
    "....", "1111"
    "x11x", "x11x"
  }

  cage_mode = "fancy"
}


GROW_CAGEPAIR_1 =
{
  prob = 8
  skip_prob = 30

  structure =
  {
    "....", "AAAA"
    "....", "CAAC"
    "....", "AAAA"
    "x11x", "x11x"
  }

  cage_mode = "fancy"
}


GROW_CAGEPAIR_2 =
{
  prob = 8
  skip_prob = 30
  aversion = 5

  structure =
  {
    "....", "AAAA"
    "....", "CAAC"
    "....", "AAAA"
    "....", "CAAC"
    "....", "AAAA"
    "x11x", "x11x"
  }

  cage_mode = "fancy"
}


GROW_LIQUID_CAGE3 =
{
  prob = 10
  skip_prob = 20 --33

  structure =
  {
    "....", "/C~1"
    "....", "C/~1"
    "....", "~~/1"
    "....", "1111"
    "1111", "1111"
  }

  diagonals =
  {
    ".C"
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
    "..", "AA"
    "..", "^^"
    "11", "11"
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
  prob = 8
  --skip_prob = 50
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
  prob = 8
  --skip_prob = 70
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
  prob = 8
  --skip_prob = 70
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
    "...xx", "AAAxx"
    "...xx", "^AAxx"
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
    "x....x", "xAAA%x"
    "1....x", "1/~%Ax"
    "1....x", "1~~~Ax"
    "1....x", "1~~/Ax"
    "1....x", "1>>A/x"
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
    "...", "AAA"
    ".1x", "^1x"
    ".1x", "^1x"
    ".1x", "11x"
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
    "..", "AA"
    "..", "AA"
    ".1", "^1"
    ".1", "^1"
    ".1", "^1"
    ".1", "11"
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


SPROUT_DIRECT_THIN_EMERGENCY =
{
  emergency = true

  prob = 250

  aversion = 65

  env = "!cave"

  structure =
  {
    "..","RR"
    "..","RR"
    "..","11"
    "x1","x1"
  }

  new_room =
  {
    conn = { x=1, y=2, w=2, dir=8 }
  }
}


SPROUT_DIRECT_THROUGH_2X_LIQUID =
{
  emergency = true

  prob = 400

  structure =
  {
    "..","RR"
    "..","RR"
    "~~","11"
    "~~","11"
    "11","11"
  }

  new_room =
  {
    conn = { x=1, y=3, w=2, dir=8 }

    symmetry = { x=1, y=5, w=2, dir=8 }
  }
}


SPROUT_DIRECT_THROUGH_1X_LIQUID =
{
  emergency = true

  prob = 400

  structure =
  {
    "..","RR"
    "..","RR"
    "~~","11"
    "11","11"
  }

  new_room =
  {
    conn = { x=1, y=2, w=2, dir=8 }

    symmetry = { x=1, y=3, w=2, dir=8 }
  }
}


SPROUT_DIRECT_FROM_DIAGONAL =
{
  emergency = true

  prob = 250

  structure =
  {
    "xx..","xxRR"
    "xx..","xxRR"
    "x...","x/11"
    "1%.x","11/x"
    "11xx","11xx"
  }

  diagonals =
  {
    ".1","1."
    "1.","1."
  }

  new_room =
  {
    conn = { x=3, y=3, w=2, dir=8 }
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
  theme = "!urban"
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


--[[SPROUT_DOUBLE_TEST =
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
}]]


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
  prob = 2000 --100

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


SPROUT_JOINER_4x2 =
{
  prob = 2500

  structure =
  {
    "......", ".RRRR."
    "......", ".RRRR."
    "x....x", "xJJJJx"
    "x....x", "xJJJJx"
    "x1111x", "x1111x"
  }

  new_room =
  {
    symmetry = { x=4, y=4, dir=8 }
  }

  joiner =
  {
    from_dir = 2
  }
}


SPROUT_JOINER_2x3 =
{
  prob = 800

  structure =
  {
    "....", ".RR."
    "....", ".RR."
    "x..x", "xJJx"
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
    "..", "/C"
    "C.", "CC"
    "11", "11"
  }

  diagonals =
  {
    ".C"
  }
}


AUX_CAGE_GROW4 =
{
  pass = "cage_grow"

  prob = 35

  structure =
  {
    "C.","CC"
    "C.","CC"
    "11","11"
  }
}


AUX_CAGE_GROW5 =
{
  pass = "cage_grow"

  prob = 35

  structure =
  {
    "C.","C%"
    "C.","CC"
    "11","11"
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


DECORATE_CLOSET_4x2 =
{
  prob = 60

  structure =
  {
    "....", "TTTT"
    "....", "TTTT"
    "1111", "1111"
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
  prob = 2500 -- 1100 --900
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
    "!", "@"
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
    ".#.", ".#."
    "!@#", "@H#"
    ".1.", ".1."
  }

  link1_2 = { dest_dir=4 }
}


HALL_1_GROW_T1 =
{
  pass = "hall_1"
  prob = 90 --50

  structure =
  {
    ".#.", ".#."
    "!@!", "@H@"
    ".1.", ".1."
  }

  hallway = { keep_shape_prob=90 }

  link1_2 = { dest_dir=4 }
  link3_2 = { dest_dir=6 }
}


HALL_1_GROW_P1 =
{
  pass = "hall_1"
  prob = 30 --5

  structure =
  {
    ".!.", ".@."
    "!@!", "@H@"
    ".1.", ".1."
  }

  hallway = { keep_shape_prob=50 }

  link1_2 = { dest_dir=4 }
  link3_2 = { dest_dir=6 }
  link2_3 = { dest_dir=8 }
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
  prob = 3200 --1800 --1500
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
    ".....", "1#1#1"
    ".....", "11111"
    ".....", "1#1#1"
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
    "......", "1#11.1"
    "......", "111111"
    "......", "1#11.1"
    "......", "111111"
    "......", "1#11.1"
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
    "...","1#1"
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
    "xx.....x","xx%~~~/x"
  }

  diagonals =
  {
    "1~","~A"
    ".~","~."
  }
}

-- MSSP's liquid tiles. [MSSPLIQUID]

GROW_LIQUID_GUTTER_SIDE =
{
  prob = 30

  structure =
  {
    ".11","~11"
    ".11","~11"
    ".11","111"
    ".1x","11x"
  }
}

GROW_LIQUID_GUTTER_CORNER =
{
  prob = 30

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
    "....","/~~%"
    "....","%~~/"
    "1111","1111"
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
    "....","/~~%"
    "1111","1111"
    "x11x","x11x"
  }

  diagonals =
  {
    ".~","~."
  }
}

GROW_LIQUID_FIGURE_CORRIDOR =
{
  prob = 7

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

GROW_LIQUID_U =
{
  prob = 5
  structure =
  {
    "1.....","11~~~1"
    "1.....","11~~~1"
    "x.....","x1~~~1"
    "x.....","x1%~/1"
    "x.....","x11111"
  }

  diagonals =
  {
    "1~","~1"
  }
}

GROW_LIQUID_INTERSECTION =
{
  prob = 15
  skip_prob = 2

  structure =
  {
    "xxx...xxx","xxx111xxx"
    "x.......x","x~%111/~x"
    "x........","x%~111~/."
    ".........","111111111"
    ".........","111111111"
    ".........","111111111"
    "x.......x","x/~111~%x"
    "x.......x","x~/111%~x"
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

GROW_LIQUID_OVAL_SPLIT =
{
  prob = 15

  structure =
  {
    "xxx11xxx","xxx11xxx"
    "........","~~~11~~~"
    "........","~~/11%~~"
    "........","~/1/%1%~"
    "........","~11~~11~"
    "........","~11~~11~"
    "........","~%1%/1/~"
    "........","~~%11/~~"
    "........","~~~11~~~"
  }

  diagonals =
  {
    "~1","1~"
    "~1","1~","~1","1~"
    "~1","1~","~1","1~"
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
  prob = 25
  structure =
  {
    "x..","xAA"
    "x..","xAA"
    "x..","x^^"
    "1..","111"
    "1..","11/"
  }

  diagonals =
  {
    "1."
  }
}

GROW_SIDE_ON_RAMP_TALL =
{
  prob = 25
  structure =
  {
    "x..","xAA"
    "x..","xAA"
    "x..","x^^"
    "x..","x^^"
    "1..","111"
    "1..","11/"
  }

  diagonals =
  {
    "1."
  }
}

GROW_CAUSEWAY =
{
  prob = 10

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

GROW_CAUSEWAY =
{
  prob = 10

  structure =
  {
    "1....","111AA"
    "1....","11>AA"
    "x....","x11AA"
    "x....","x11AA"
    "x....","x1>AA"
    "x....","x11AA"
  }
}

GROW_GATED_RAMP =
{
  prob = 15

  structure =
  {
    "......","AAAAAA"
    "......","AAAAAA"
    "......","A.^^.A"
    "xx11xx","xx11xx"
  }
}

GROW_GATED_SIDE_RAMP =
{
  prob = 15

  structure =
  {
    "........","AAAAAAAA"
    "........","AAAAAAAA"
    "........","^^.AA.^^"
    "........","11111111"
    "xxx11xxx","xxx11xxx"
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
    "..xx","11xx"
    "...x","%1%x"
    "x...","x%1%"
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
    "..xx..","11xx11"
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
  prob = 20

  aversion = 10

  structure =
  {
    "..........","/AAAAAAAA%"
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
    ".A","A."
    "A1","1A"
  }
}

GROW_STAIRED_HORSESHOE_TIGHTER =
{
  prob = 20

  aversion = 10

  structure =
  {
    "..........","./AAAAAA%."
    "..........","/AAAAAAAA%"
    "..........","AA/1^^1%AA"
    "..........","AA111111AA"
    "..........","AA111111AA"
    "..........","AA111111AA"
    "xxxx11xxxx","xxxx11xxxx"
  }

  diagonals =
  {
    ".A","A."
    ".A","A."
    "A1","1A"
  }
}

GROW_STAIRED_T =
{
  prob = 25

  aversion = 10

  structure =
  {
    "........","AAAAAAAA"
    "........","AAAAAAAA"
    "........","11%AA/11"
    "........","111AA111"
    "........","111^^111"
    "........","11111111"
    "xxxxxx11","xxxxxx11"
  }

  diagonals =
  {
    "1A","A1"
  }
}

GROW_STAIRED_L =
{
  prob = 40

  aversion = 5

  structure =
  {
    ".....","AAAAA"
    ".....","AAAAA"
    ".....","11%AA"
    ".....","111AA"
    ".....","111^^"
    ".....","111^^"
    ".....","11111"
    ".....","11111"
    "11xxx","11xxx"
  }

  diagonals =
  {
    "1A"
  }
}

-- MSSP's squeezed corridors. [SQUEEZE]


GROW_SQUEEZE_STRAIGHT_NEW_AREA =
{
  prob = 15

  structure =
  {
    "...","AAA"
    "...","AAA"
    "x.x","x1x"
    "x.x","x1x"
    "x.x","x1x"
    "x1x","x1x"
  }
}

GROW_SQUEEZE_CURVE_NEW_AREA =
{
  prob = 10

  structure =
  {
    "xxx..","xxxAA"
    ".....","111AA"
    ".xx..","1xxAA"
    ".xxxx","1xxxx"
    "1xxxx","1xxxx"
  }
}

GROW_SQUEEZE_STRAIGHT =
{
  prob = 10

  group = "squeeze"

  structure =
  {
    "...",".1."
    "...",".1."
    "x1x","x1x"
  }
}

GROW_SQUEEZE_CURVE =
{
  prob = 10

  group = "squeeze"

  structure =
  {
    "...","..."
    "...",".11"
    "x1x","x1x"
  }
}

GROW_SQUEEZE_JUNCTION =
{
  prob = 10

  group = "squeeze"

  structure =
  {
    "...","111"
    "x1x","x1x"
  }
}

GROW_SQUEEZE_STAIRCASE =
{
  prob = 7
  skip_prob = 2

  structure =
  {
    "..x","AAx"
    "..x","AAx"
    "x.x","x^x"
    "x1x","x1x"
  }
}

GROW_SQUEEZE_EVEN_MORE_STAIRCASE =
{
  prob = 7
  skip_prob = 3

  structure =
  {
    "..x","AAx"
    "..x","AAx"
    "x.x","x^x"
    "x.x","x^x"
    "x.x","x^x"
    "x1x","x1x"
  }
}

-- some more other cages

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

GROW_CAGE_SIMPLE_CORNER =
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

GROW_CAGE_SIMPLE_REVERSED =
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

GROW_CAGE_DOOM_MAP01 =
{
  prob = 15

  structure =
  {
    "......","111111"
    "......","1C11C1"
    "......","111111"
    "......","111111"
    "......","1C11C1"
    "......","111111"
    "xx11xx","xx11xx"
  }
}

GROW_CAGE_DOOM_MAP01_PILLARED =
{
  prob = 15

  structure =
  {
    "......","111111"
    "......","1C11C1"
    "......","1#11#1"
    "......","111111"
    "......","1#11#1"
    "......","1C11C1"
    "......","111111"
    "xx11xx","xx11xx"
  }
}

DECORATE_CAGE_ON_LIQUID_CANAL_SIDE =
{
  prob = 10

  structure =
  {
    "~~~~","~CC~"
    "1111","1111"
    "1111","1111"
    "~~~~","~CC~"
  }
}

GROW_CAGE_ROUND_ARENA =
{
  prob = 8

  aversion = 4

  structure =
  {
    ".....","11111"
    ".....","1/C%1"
    ".....","1CCC1"
    ".....","1%C/1"
    ".....","11111"
    "x111x","x111x"
  }

  diagonals =
  {
    "1C","C1"
    "1C","C1"
  }
}

GROW_CAGE_SIDEWAYS =
{
  prob = 6

  skip_prob = 50

  structure =
  {
    "11xxxx","11xxxx"
    "......","111111"
    "......","CCC#11"
    "......","111111"
  }
}

GROW_CAGE_SIDEWAYS_STAIR =
{
  prob = 6

  skip_prob = 50

  structure =
  {
    "11xxxx","11xxxx"
    "......","111111"
    "......","CCC#vv"
    "......","AAAAAA"
  }
}

GROW_CAGE_SIDEWAYS_BOTH_SIDES =
{
  prob = 8

  skip_prob = 50

  structure =
  {
    "xx11xx","xx11xx"
    "......","111111"
    "......","1#11#1"
    "......","1C11C1"
    "......","1C11C1"
    "......","1C11C1"
  }
}


GROW_CAGE_ROUND_RAFTERS_ONE_SIDE =
{
  prob = 8

  structure =
  {
    "xx11","xx11"
    "....","/C11"
    "....","C/11"
    "....","1111"
    "....","1111"
  }

  diagonals =
  {
    ".C"
    "C1"
  }
}

-- MSSP's elevated catwalks. [CATWALK]

GROW_CATWALK_BIFUNNEL_SINK =
{
  prob = 10
  structure =
  {
    "x...x","x111x"
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
    "x...x","x111x"
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
    "xx...xx","xx111xx"
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
    "xx...xx","xx111xx"
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
    ".....x","11111x"
    "......","A<<1/A"
    "......","AAAAAA"
    "......","A<<1%A"
    "x111xx","x111xx"
  }

  diagonals =
  {
    "1A","1A"
  }
}

GROW_CATWALK_U =
{
  prob = 15

  structure =
  {
    "xx.....xx","xx/111%xx"
    "x.......x","x/11111%x"
    ".........","/11/A%11%"
    ".........","11/AAA%11"
    ".........","11AA#AA11"
    "xxxx.....","xxxx#^^11"
    "xxxx.....","xxxx#^^11"
    "xxxxx111x","xxxxx111x"
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
    "xx...","xx/11"
    "x....","x/111"
    ".....","/1111"
    "....x","111/x"
    "111xx","111xx"
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
    "x....","x/A<1"
    ".....","/A/11"
    ".....","A/111"
    "....x","^11/x"
    "111xx","111xx"
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
    "xx...","xx/AA"
    "x....","x/AAA"
    ".....","/A/11"
    ".....","A/111"
    "....x","^11/x"
    "111xx","111xx"
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
    "xxx...","xxx111"
    "xx....","xx/111"
    "x.....","x/111/"
    ".....x","/111/x"
    "....xx","111/xx"
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

GROW_DIAGONAL_SIDE_BLOB =
{
  prob = 30

  structure =
  {
    "....x","AAAAx"
    "....x","AAAAx"
    ".....","%AA/1"
    "x.111","x%/11"
    "xx11x","xx11x"
  }

  diagonals =
  {
    ".A","A1"
    ".A","A1"
  }
}

-- MSSP's water canals. [CANALS]

GROW_LIQUID_CANAL_STRAIGHT =
{
  prob = 60

  group = "canal"

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
  prob = 40

  group = "canal"

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
  prob = 30

  group = "canal"

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

  group = "canal"

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

  group = "canal"

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

  group = "canal"

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
  prob = 50

  group = "canal"

  group_pos = "entry"

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

GROW_LIQUID_CANAL_ENTRY_B =
{
  prob = 50

  group = "canal"

  group_pos = "entry"

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
  prob = 20

  group = "single_canal"

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
  prob = 20

  group = "single_canal"

  structure =
  {
    "1....","111~~"
    "1....","111~~"
  }
}

GROW_LIQUID_SCANAL_STRAIGHT =
{

  prob = 60

  group = "single_canal"

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
  prob = 30

  engine = "zdoom"

  group = "single_canal"

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

  group = "single_canal"

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

  group = "single_canal"

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

  group = "single_canal"

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

  group = "single_canal"

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

  structure =
  {
    "1..","111"
    "1..","111"
    "x..","x~~"
  }
}

GROW_NARROW_CANAL_ENTRY_FROMSIDE =
{
  prob = 20

  structure =
  {
    "1...","111~"
    "1...","111~"
  }
}

GROW_NARROW_CANAL_STRAIGHT =
{
  prob = 80

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

-- MSSP's liquid slabs. [LIQUID_SLABS]

GROW_LIQUID_SLAB_ENTRY =
{
  prob = 30

  group = "slab"
  group_pos = "entry"

  structure =
  {
    "....","~11~"
    "....","~11~"
    "....","~~~~"
    "x11x","x11x"
  }

  diagonals =
  {
    "~1","1~"
  }
}

GROW_LIQUID_SLAB_ENTRY_2X =
{
  prob = 30

  group = "slab"
  group_pos = "entry"

  structure =
  {
    ".......","~11~11~"
    ".......","~11~11~"
    ".......","~~~~~~~"
    "xx111xx","xx111xx"
  }

  diagonals =
  {
    "~1","1~"
  }
}

GROW_LIQUID_SLAB_STRAIGHT =
{
  prob = 150

  group = "slab"

  structure =
  {
    "....","~11~"
    "....","~11~"
    "....","~~~~"
    "~11~","~11~"
  }
}

GROW_LIQUID_SLAB_CURVE =
{
  prob = 50

  group = "slab"

  structure =
  {
    "......","~~~~~~"
    "......","~11~11"
    "......","~11~11"
    "......","~~~~~~"
    "~11~xx","~11~xx"
  }
}

GROW_LIQUID_SLAB_STRAIGHT_4x4 =
{
  prob = 100

  group = "slab"

  structure =
  {
    ".......","~11~11~"
    ".......","~11~11~"
    ".......","~~~~~~~"
    "~11~11~","~11~11~"
  }
}

GROW_LIQUID_SLAB_EXIT =
{
  prob = 15

  group = "slab"

  structure =
  {
    "....","1111"
    "....","~~~~"
    "~11~","~11~"
  }

  diagonals =
  {
    "~1","1~"
  }
}

-- MSSP's shape primitives [PRIMITIVES]

GROW_PRIMITIVE_CIRCLE_3X =
{
  prob = 35

  structure =
  {
    "xx.....xx","xx/111%xx"
    "x.......x","x/11111%x"
    ".........","111111111"
    ".........","111111111"
    ".........","111111111"
    "x.......x","x%11111/x"
    "xx.....xx","xx%111/xx"
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
    "x....x","x/11%x"
    "......","/1111%"
    "......","111111"
    "......","111111"
    "......","%1111/"
    "x....x","x%11/x"
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

-- MSSP's shape tamers. Tries to get rid of strange architectural decisions such as pointy walls. [TAMERS]

SERRATED_EDGE_SMOOTHER =
{
  pass = "smoother"
  prob = 35

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
  prob = 35

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

SERRATED_LIQUID_SMOOTHER3 =
{
  pass = "smoother"

  prob = 15

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

--MSSP's square-out. Makes rooms less... wormy or spaghetti-ish.

SQUARE_OUT_FROM_CORNER_2X =
{
  pass = "square_out"

  prob = 100

  structure =
  {
    "1..","111"
    "x11","x11"
  }
}

SQUARE_OUT_FROM_CORNER =
{
  pass = "square_out"

  prob = 50

  structure =
  {
    "1.","11"
    "x1","x1"
  }
}

SQUARE_OUT_THICKEN_CLIFF_BOTH_SIDES =
{
  pass = "square_out"

  prob = 150

  structure =
  {
    "..","11"
    "11","11"
    "22","22"
    "..","22"
  }
}

SQUARE_OUT_THICKEN_CLIFF_ONE_SIDE =
{
  pass = "square_out"

  prob = 125

  structure =
  {
    "..","11"
    "11","11"
    "22","22"
  }
}

SQUARE_OUT_EXTEND_AREA_BORDER =
{
  pass = "square_out"

  prob = 80

  structure =
  {
    "x1","x1"
    "2.","22"
  }
}

SQUARE_OUT_SMOOTH_EDGE =
{
  pass = "square_out"

  prob = 35

  structure =
  {
    "x1","x1"
    "1.","1/"
  }

  diagonals =
  {
    "1."
  }
}

SQUARE_OUT_SMOOTH_PLATFORM =
{
  pass = "square_out"

  prob = 50

  structure =
  {
    "x1x","x1x"
    "122","1/2"
    "x2x","x2x"
  }

  diagonals =
  {
    "12"
  }
}

SQUARE_OUT_REMOVE_TRIANGLE =
{
  pass = "square_out"

  prob = 15

  structure =
  {
    "1%","11"
    "x1","x1"
  }

  diagonals =
  {
    "1."
  }
}

--MSSP's random negative features [FEATURES] - 'negative' because they attempt to modify an existing room if it has too much clean space.

GROW_FEATURES_CENTER_ALTERED =
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

GROW_ELEVATED_PILLAR_ROUND =
{
  prob = 75

  env = "!cave"

  structure =
  {
    "x......","x111111"
    "1......","1/AAA%1"
    "1......","1AAAAA1"
    "1......","1>A.AA1"
    "1......","1AAAAA1"
    "1......","1%AAA/1"
    "x......","x111111"
  }

  diagonals =
  {
    "1A","A1"
    "1A","A1"
  }
}

GROW_ELEVATED_PILLAR_U =
{
  prob = 50

  env = "!cave"

  structure =
  {
    "11xxx","11xxx"
    "1....","1>AAA"
    "1....","1>AAA"
    "xx...","xx.AA"
    "xx...","xxAAA"
    "xx...","xxAAA"
  }
}

GROW_ELEVATED_PILLAR_U_FULL =
{
  prob = 50

  env = "!cave"

  structure =
  {
    "111xxx","111xxx"
    "1.....","1>>AAA"
    "1.....","1>>AAA"
    "x.....","xAA.AA"
    "x.....","xAAAAA"
    "x.....","xAAAAA"
  }
}

GROW_WIDE_SPACE_DEPRESSION =
{
  prob = 38

  aversion = 5

  env = "!cave"

  structure =
  {
    "...","111"
    "...","vvv"
    "...","AAA"
    "...","AAA"
    "...","^^^"
    "111","111"
  }
}

GROW_WIDE_SPACE_CATWALK_PLAIN =
{
  prob = 75

  group = "catwalk"
  group_pos = "entry"

  env = "!cave"

  structure =
  {
    "....","1AA1"
    "....","1AA1"
    "....","1^^1"
    "1111","1111"
  }
}

GROW_WIDE_SPACE_CATWALK_TALL_PLAIN =
{
  prob = 75

  group = "catwalk"
  group_pos = "entry"

  env = "!cave"

  structure =
  {
    "....","1AA1"
    "....","1AA1"
    "....","1^^1"
    "....","1^^1"
    "1111","1111"
  }
}

GROW_WIDE_SPACE_PLATFORM_TINY =
{
  prob = 75

  group = "catwalk"

  group_pos = "entry"

  env = "!cave"

  structure =
  {
    "....","1AA1"
    "....","1AA1"
    "....","1>A1"
    "1111","1111"
  }
}

GROW_WIDE_SPACE_CATWALK_STRAIGHT =
{
  prob = 100

  group = "catwalk"

  env = "!cave"

  structure =
  {
    "....","1111"
    "....","1221"
    "1221","1221"
  }
}

GROW_WIDE_SPACE_CATWALK_EXTRUDE =
{
  prob = 50

  group = "catwalk"

  env = "!cave"

  structure =
  {
    "....","1111"
    "1111","1221"
    "2222","2222"
  }
}

GROW_WIDE_SPACE_CATWALK_EXTRUDE_3X =
{
  prob = 50

  group = "catwalk"

  env = "!cave"

  structure =
  {
    ".....","11111"
    "11111","12221"
    "22222","22222"
  }
}

GROW_WIDE_SPACE_CATWALK_CURVE =
{
  prob = 45

  group = "catwalk"

  env = "!cave"

  structure =
  {
    "......","111111"
    "......","1/2221"
    "......","122221"
    "......","122/11"
    "1221xx","1221xx"
  }

  diagonals =
  {
    "12","21"
  }
}

GROW_WIDE_SPACE_CATWALK_STRAIGHT_3X =
{
  prob = 50

  group = "catwalk"

  env = "!cave"

  structure =
  {
    ".....","11111"
    "11111","12221"
    "12221","12221"
  }
}

GROW_WIDE_SPACE_CATWALK_STRAIGHT_4X =
{
  prob = 50

  group = "catwalk"

  env = "!cave"

  structure =
  {
    "......","111111"
    "111111","122221"
    "122221","122221"
  }
}

GROW_WIDE_SPACE_CATWALK_CAPPER_3X =
{
  prob = 25

  env = "!cave"

  structure =
  {
    ".....","11111"
    ".....","1/2%1"
    "11111","12221"
    "12221","12221"
  }

  diagonals =
  {
    "12","21"
  }
}

GROW_WIDE_SPACE_CATWALK_CAPPER_4X =
{
  prob = 25

  env = "!cave"

  structure =
  {
    "......","111111"
    "......","1/22%1"
    "111111","122221"
    "122221","122221"
  }

  diagonals =
  {
    "12","21"
  }
}

GROW_HALF_SKILLET =
{
  prob = 25

  structure =
  {
    "x......","x111111"
    "1......","11/AA%1"
    "1......","1>AAAAA"
    "1......","1>AAAAA"
  }

  diagonals =
  {
    "1A","A1"
  }
}

GROW_HALF_SKILLET_SPIRAL =
{
  prob = 25

  structure =
  {
    "11......","11111111"
    "11......","11/AA%11"
    "xx......","xxAAAA<1"
    "xx......","xxAAAA<1"
  }

  diagonals =
  {
    "1A","A1"
  }
}

GROW_WIDE_LOW_CEILING_SIDE =
{
  prob = 15

  env = "building"

  structure =
  {
    "....","1111"
    "....","1.AA"
    "....","1AAA"
    "....","1AAA"
    "....","1.AA"
    "11..","1111"
    "11xx","11xx"
  }
}

GROW_WIDE_LOW_CEILING_CENTER =
{
  prob = 15

  env = "building"

  structure =
  {
    "......","111111"
    "......","1.AA.1"
    "......","1AAAA1"
    "......","1AAAA1"
    "......","1.AA.1"
    "......","111111"
    "xx11xx","xx11xx"
  }
}

GROW_WIDE_LOW_CEILING_CORNER =
{
  prob = 15

  env = "building"

  structure =
  {
    ".....","AAAA1"
    ".....","AAA#1"
    ".....","AAA/1"
    ".....","A#/11"
    "1111x","1111x"
  }

  diagonals =
  {
    "A1"
    "A1"
  }
}

GROW_COLLONADE_3_PILLARS =
{
  prob = 15

  env = "building"

  structure =
  {
    "11......","11111111"
    "11......","11#A#A#1"
    "x.......","x1AAAAA1"
    "x.......","x1AAAAA1"
  }
}

GROW_TRIANGULAR_LOW_CEILING =
{
  prob = 15

  env = "building"

  structure =
  {
    "xxx111xxx","xxx111xxx"
    ".........","111111111"
    ".........","111/.%111"
    ".........","11/AAA%11"
    ".........","1/AAAAA%1"
    "x!xxxxx!x","x!xxxxx!x"
  }

  diagonals =
  {
    "1A","A1"
    "1A","A1"
    "1A","A1"
  }
}

GROW_PILLAR_2X2 =
{
  prob = 10

  env = "building"

  structure =
  {
    "x....","x1111"
    "1....","11..1"
    "1....","11..1"
    "x....","x1111"
  }
}

GROW_PILLAR_3X3 =
{
  prob = 10

  env = "building"

  structure =
  {
    "x.....","x11111"
    "1.....","11/#%1"
    "1.....","11###1"
    "1.....","11%#/1"
    "x.....","x11111"
  }

  diagonals =
  {
    "1.",".1"
    "1.",".1"
  }
}

GROW_PILLAR_BEAN =
{
  prob = 10

  env = "building"

  structure =
  {
    "1....","11111"
    "1....","11/#1"
    "x....","x1#/1"
    "x....","x1111"
  }

  diagonals =
  {
    "1."
    ".1"
  }
}

GROW_PILLAR_GATE =
{
  prob = 20

  env = "building"

  structure =
  {
    "......","111111"
    "......","1#AA#1"
    "11....","111111"
    "11xxxx","11xxxx"
  }
}

DECORATE_CATWALK_SUPPORT_PILLAR_OUTER =
{
  prob = 4

  structure =
  {
    "1122","1122"
    "1122","1.22"
    "1122","1122"
  }
}

DECORATE_CATWALK_SUPPORT_PILLAR_INNER_DOUBLE =
{
  prob = 7

  structure =
  {
    "1122","1122"
    "1122","11.2"
    "1122","1122"
    "1122","11.2"
    "1122","1122"
  }
}

GROW_CHAMFER_WIDE_ROOM_CORNER =
{
  prob = 5

  structure =
  {
    "xxx...","xxx/11"
    "xx....","xx/111"
    "x.....","x/1111"
    "1.....","111111"
    "1.....","111111"
  }


  diagonals =
  {
    ".1"
    ".1"
    ".1"
  }
}

GROW_CHAMFER_WIDE_ROOM_CORNER_OUTLET =
{
  prob = 5

  structure =
  {
    "xxxx..","xxxx11"
    "xxxx..","xxxx11"
    "xxx...","xxx/11"
    "1.....","111111"
    "1.....","111111"
  }

  diagonals =
  {
    ".1"
  }
}

GROW_CHAMFER_WIDE_ROOM_CORNER_OUTLET_SOLID =
{
  prob = 5

  structure =
  {
    "xxx..","xxx11"
    "xxx..","xxx11"
    "1....","11111"
    "1....","11111"
  }

  diagonals =
  {
    ".1"
  }
}

SMOOTHER_CATWALK_EDGES =
{
  prob = 250
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

-- MSSP's 3.x/6.x-style rooms [6.x]
-- supposedly more or less trying to replicate the strange ceiling
-- layouts found in 3.x/6.x

GROW_36_DOUBLE_AREA =
{
  prob = 50

  structure =
  {
    "......","AAAA11"
    "......","AAAA11"
    "xx....","xx1111"
    "xx....","xx1111"
    "xx....","xx1111"
    "xx....","xx1111"
    "....11","AAAA11"
    "....11","AAAA11"
  }
}

GROW_36_SINGLE_AREA =
{
  prob = 50

  structure =
  {
    "x....","x1111"
    "x....","x1111"
    ".....","AAA11"
    ".....","AAA11"
    ".....","AAA11"
    ".....","AAA11"
    "x..11","x1111"
    "x..11","x1111"
  }
}

GROW_36_TRIPLE_AREA =
{
  prob = 35

  structure =
  {
    "....","AA11"
    "....","AA11"
    "x...","x111"
    "x...","x111"
    "....","AA11"
    "....","AA11"
    "x...","x111"
    "x...","x111"
    "..11","AA11"
    "..11","AA11"
  }
}

-- MSSP's rooms shaped like English alphabet letters. [LETTERS]

GROW_DIAGONAL_STALK =
{
  prob = 75

  structure =
  {
    "xxx.....","xxx11111"
    "xxx.....","xxx1111/"
    "xx.....x","xx/111/x"
    "x.....xx","x/111/xx"
    ".....xxx","/1111xxx"
    "11111xxx","11111xxx"
  }

  diagonals =
  {
    "1."
    ".1","1."
    ".1","1."
    ".1"
  }
}

GROW_O =
{
  prob = 40

  structure =
  {
    "x......x","x/1111%x"
    "........","/111111%"
    "........","11111111"
    "...xx...","111xx111"
    "...xx...","111xx111"
    "........","11111111"
    "........","%111111/"
    "x......x","x%1111/x"
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

GROW_O_STAIR =
{
  prob = 20

  structure =
  {
    "x......x","x/AAAA%x"
    "........","/AAAAAA%"
    "........","AAAAAAAA"
    "...xx...","AAAxxAAA"
    "...xx...","^^^xx^^^"
    "........","11111111"
    "........","%111111/"
    "x......x","x%1111/x"
    "xxx11xxx","xxx11xxx"
  }

  diagonals =
  {
    ".A","A."
    ".A","A."
    ".1","1."
    ".1","1."
  }
}

GROW_HALF_C =
{
  prob = 75

  structure =
  {
    "x.......x","x/111111x"
    "........1","/11111111"
    "........1","111111111"
    "........x","11111111x"
    ".....xxxx","1111/xxxx"
    "....xxxxx","1111xxxxx"
  }

  diagonals =
  {
    ".1"
    ".1"
    "1."
  }
}

GROW_HALF_C_STAIR =
{
  prob = 50

  structure =
  {
    "x.......x","x/111111x"
    "........1","/11111111"
    "........1","111111111"
    "........x","11111111x"
    ".....xxxx","1111/xxxx"
    "....xxxxx","vvvvxxxxx"
    "....xxxxx","AAAAxxxxx"
    "....xxxxx","AAAAxxxxx"
  }

  diagonals =
  {
    ".1"
    ".1"
    "1."
  }
}

GROW_L =
{
  prob = 75

  structure =
  {
    "x11xxxxx","x11xxxxx"
    "....xxxx","1111xxxx"
    "....xxxx","1111xxxx"
    "....xxxx","1111xxxx"
    "....xxxx","1111xxxx"
    "........","11111111"
    "........","11111111"
    "........","11111111"
    "........","11111111"
  }
}

GROW_L_STAIR =
{
  prob = 45

  structure =
  {
    "x11xxxxx","x11xxxxx"
    "....xxxx","1111xxxx"
    "....xxxx","1111xxxx"
    "....xxxx","1111xxxx"
    "....xxxx","1111xxxx"
    "........","1111>>AA"
    "........","1111>>AA"
    "........","1111>>AA"
    "........","1111>>AA"
  }
}

-- Elevated letters.

GROW_ELEVATED_T_STALK_ENTRY =
{
  prob = 15

  aversion = 5

  structure =
  {
    "1........","11111AAAA"
    "1........","11111AAAA"
    "x........","x11>AAAAA"
    "x........","x11>AAAAA"
    "x........","x11>AAAAA"
    "x........","x11>AAAAA"
    "x........","x1111AAAA"
    "x........","x1111AAAA"
  }
}

GROW_ELEVATED_O_QUARTER =
{
  prob = 15

  aversion = 5

  structure =
  {
    "x11xx","x11xx"
    ".....","11111"
    ".....","11111"
    ".....","11/AA"
    ".....","11AAA"
    ".....","11AAA"
    ".....","11>AA"
    ".....","11>AA"
  }

  diagonals =
  {
    "1A"
  }
}

-- MSSP's huge-arse rooms. [HUGE]

GROW_EXTRUSION_CORNER_4x4 =
{
  prob = 40

  structure =
  {
    "x....","x1111"
    "x....","x1111"
    "1....","11111"
    "1....","11111"
    "x11xx","x11xx"
  }
}

GROW_EXTRUSION_CORNER_4x4_NEW_AREA =
{
  prob = 40

  structure =
  {
    "x....","xAAAA"
    "x....","xAAAA"
    "1....","1AAAA"
    "1....","1AAAA"
    "x11xx","x11xx"
  }
}

GROW_EXTRUSION_4X6 =
{
  prob = 50

  structure =
  {
    "x11x","x11x"
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
  prob = 65

  structure =
  {
    "x11x","x11x"
    "....","1111"
    "....","1111"
    "....","1111"
    "....","1111"
  }
}

GROW_EXTRUSION_3X2 =
{
  prob = 80

  structure =
  {
    "111","111"
    "...","111"
    "...","111"
  }
}

GROW_EXTRUSION_3X4 =
{
  prob = 75

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
  prob = 30

  structure =
  {
    "x11x","x11x"
    "....","1111"
    "....","1vAA"
    "....","1AAA"
    "....","1^AA"
    "....","1111"
  }
}

DECORATE_CAGE_CANALS_STRAIGHT_3X =
{
  prob = 8

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
  prob = 8

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
  prob = 8

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
  prob = 5

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

GROW_ROUNDED_CAP =
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

GROW_BLADED_CAP =
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

  group = "cliff"

  group_pos = "entry"

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

  group = "cliff"

  group_pos = "entry"

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
  prob = 75

  group = "cliff"

  structure =
  {
    "1..","111"
    "2..","222"
  }
}

GROW_CLIFF_EXTENSION_UP_WE_GO =
{
  prob = 50

  group = "cliff"

  structure =
  {
    "1...","1>AA"
    "2...","2222"
  }
}

GROW_CLIFF_EXTENSION_UPPER_WE_GO =
{
  prob = 35

  group = "cliff"

  structure =
  {
    "x...","xAAA"
    "x...","xA^^"
    "1...","1111"
    "2...","2222"
    "xxxx","xxxx"
  }
}

GROW_CLIFF_EXTENSION_CURVE =
{
  prob = 75

  group = "cliff"

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

GROW_CLIFF_EXTENSION_WIDEN =
{
  prob = 35

  group = "cliff"

  structure =
  {
    "x....","x/111"
    "1....","11111"
    "2....","22222"
    "x....","x%222"
  }

  diagonals =
  {
    ".1"
    ".2"
  }
}

-- 2x2 cliffs

GROW_CLIFF_EXTENSION_X2 =
{
  prob = 50

  group = "cliff"

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
  prob = 35

  group = "cliff"

  structure =
  {
    "1...","1>AA"
    "1...","1>AA"
    "2...","2222"
    "2...","2222"
  }
}

GROW_CLIFF_EXTENSION_X2_UPPER_WE_GO =
{
  prob = 35

  group = "cliff"

  structure =
  {
    "....","AAAA"
    "....","AAAA"
    "1...","1^^1"
    "1...","1111"
    "2...","2222"
    "2...","2222"
  }
}

GROW_CLIFF_EXTENSION_CURVE_X2 =
{
  prob = 85

  group = "cliff"

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
  prob = 35

  group = "cliff"

  structure =
  {
    "1..","1AA"
    "2..","222"
  }
}

GROW_CLIFF_EXTENSON_NEW_AREA_INWARD =
{
  prob = 35

  group = "cliff"

  structure =
  {
    "x..","xAA"
    "1..","111"
    "2..","222"
  }
}

GROW_CLIFF_EXTENSION_NEW_AREA_X2 =
{
  prob = 35

  group = "cliff"

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
  prob = 35

  group = "cliff"

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

-- 4x cliffs

GROW_CLIFF_ENTRY_X4 =
{
  prob = 150

  group = "cliff_x4"

  group_pos = "entry"

  structure =
  {
    "........","1111AAAA"
    "........","1111AAAA"
    "........","11111^^1"
    "........","11111111"
    "........","11111111"
    "x11xxxxx","x11xxxxx"
  }
}

GROW_CLIFF_ENTRY_SIDEWAYS_X4 =
{
  prob = 150

  group = "cliff_x4"

  group_pos = "entry"

  structure =
  {
    "x11xxxxx","x11xxxxx"
    "........","1111AAAA"
    "........","111>AAAA"
    "........","111>AAAA"
    "........","1111AAAA"
  }
}

GROW_CLIFF_STRAIGHT_X4 =
{
  prob = 150

  group = "cliff_x4"

  structure =
  {
    "........","11112222"
    "........","11112222"
    "11112222","11112222"
  }
}

GROW_CLIFF_STRAIGHT_X4_STAIR =
{
  prob = 85

  group = "cliff_x4"

  structure =
  {
    "........","1111AAAA"
    "........","1111AAAA"
    "........","11112^^2"
    "11112222","11112222"
  }
}

GROW_CLIFF_STRAIGHT_X4_LONG =
{
  prob = 100

  group = "cliff_x4"

  structure =
  {
    "........","11112222"
    "........","11112222"
    "........","11112222"
    "........","11112222"
    "11112222","11112222"
  }
}

GROW_CLIFF_STRAIGHT_X4_SIDESTAIR =
{
  prob = 85

  group = "cliff_x4"

  structure =
  {
    "............","1111222>AAAA"
    "............","1111222>AAAA"
    "............","1111222>AAAA"
    "............","1111222>AAAA"
    "11112222xxxx","11112222xxxx"
  }
}

GROW_CLIFF_STRAIGHT_X4_BUMP =
{
  prob = 50

  group = "cliff_x4"

  structure =
  {
    "........","11112222"
    "........","1111%222"
    "........","11111222"
    "........","11111222"
    "........","1111/222"
    "11112222","11112222"
  }

  diagonals =
  {
    "12"
    "12"
  }
}

GROW_CLIFF_CURVED_X4 =
{
  prob = 50

  group = "cliff_x4"

  structure =
  {
    "1.......","11112222"
    "1.......","11112222"
    "1.......","11112222"
    "1.......","111/2222"
    "2.......","22222222"
    "2.......","22222222"
    "2.......","22222222"
    "2.......","22222222"
  }

  diagonals =
  {
    "12"
  }
}

-- cliff-side/area-to-area cages

DECORATE_CLIFF_CAGE =
{
  prob = 8

  structure =
  {
    "x1x","x1x"
    "111","111"
    "111","1C1"
    "222","222"
  }

  cage_mode = "fancy"
}

DECORATE_CLIFF_CAGE_3X_ROW =
{
  prob = 8

  structure =
  {
    "x111x","x111x"
    "11111","11111"
    "11111","1CCC1"
    "22222","22222"
  }

  cage_mode = "fancy"
}

DECORATE_CLIFF_CAGE_3X_STAGGERED =
{
  prob = 3

  structure =
  {
    "x11111x","x11111x"
    "1111111","1111111"
    "1111111","1C1C1C1"
    "2222222","2222222"
  }

  cage_mode = "fancy"
}

-- MSSP's liquid placer [LIQUID-CLIFF]


DECORATE_LIQUID_POOL_PLACE_3x3 =
{
  prob = 35

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

GROW_LIQUID_POOL_PLACE =
{
  prob = 35

  group = "liquid_pool"

  structure =
  {
    "....","1111"
    "....","1~~1"
    "....","1~~1"
    "....","1111"
    "x11x","x11x"
  }
}

GROW_LIQUID_POOL_EXTEND_STRAIGHT =
{
  prob = 50

  group = "liquid_pool"

  structure =
  {
    "1...","1111"
    "1...","~~~1"
    "1...","~~~1"
    "1...","1111"
  }
}

GROW_LIQUID_POOL_SWERVE =
{
  prob = 35

  group = "liquid_pool"

  structure =
  {
    "x....","x1~~1"
    ".....","//~~1"
    ".....","1~~//"
    "1111x","1111x"
  }

  diagonals =
  {
    ".1","1~"
    "~1","1."
  }
}

GROW_LIQUID_POOL_END =
{
  prob = 20

  group = "liquid_pool"

  structure =
  {
    "....","1111"
    "....","1111"
    "....","1~~1"
    "....","1~~1"
    "1111","1111"
  }
}

GROW_LIQUID_POOL_EXTEND_CURVED =
{
  prob = 50

  group = "liquid_pool"

  structure =
  {
    "1...","1111"
    "1...","~~%1"
    "1...","~~~1"
    "1...","1~~1"
    "....","1111"
  }

  diagonals =
  {
    "~1"
  }
}

GROW_LIQUID_PILLAR =
{
  prob = 20

  env = "building"

  structure =
  {
    "....","11~~"
    "....","11#~"
    "....","11~~"
    "11xx","11xx"
  }
}

GROW_LIQUID_PILLAR_INWARD =
{
  prob = 10

  env = "building"

  structure =
  {
    "...","11~"
    "...","A#~"
    "...","11~"
    "11x","11x"
  }
}

GROW_LIQUID_PILLAR_INWARD =
{
  prob = 6

  env = "building"

  structure =
  {
    "...","11~"
    "...","A.~"
    "...","11~"
    "...","A.~"
    "...","11~"
    "11x","11x"
  }
}

DECORATE_LIQUID_MOAT_ROW =
{
  prob = 10

  group = "moat"

  structure =
  {
    "11111","11111"
    "22222","2~~~2"
    "22222","22222"
  }
}

DECORATE_LIQUID_MOAT_CORNER =
{
  prob = 15

  group_pos = "entry"
  group = "moat"

  structure =
  {
    "x122","x122"
    "x122","x1~2"
    "1/22","1/~2"
    "2222","2~/2"
    "2222","2222"
  }

  diagonals =
  {
    "12","1~"
         "~2"
  }
}

DECORATE_LIQUID_MOAT_EXTEND =
{
  prob = 10

  group = "moat"

  structure =
  {
    "111","111"
    "~22","~~2"
    "222","222"
  }
}

DECORATE_LIQUID_MOAT_EXTEND_FROM_CORNER =
{
  prob = 15

  group = "moat"

  structure =
  {
    "111","111"
    "~22","~~2"
    "/22","/22"
  }

  diagonals =
  {
    "~2","~2"
  }
}

SMOOTHER_LIQUID_MOAT_MERGE =
{
  pass = "smoother"

  prob = 50

  structure =
  {
    "111","111"
    "~2~","~~~"
    "222","222"
  }
}

-- MSSP's single-seed trenches. [TRENCHES]

GROW_TRENCH_STRAIGHT =
{
  prob = 50

  structure =
  {
    "1......","11111AA"
    "1......","11>>AAA"
    "1......","11111AA"
  }
}

GROW_TRENCH_STRAIGHT_LONG =
{
  prob = 30

  structure =
  {
    "1.........","11111111AA"
    "1.........","11>>AAAAAA"
    "1.........","11111111AA"
  }
}

GROW_TRENCH_CURVE =
{
  prob = 25
  skip_prob = 10
  aversion = 10

  structure =
  {
    "xxx...","xxxAAA"
    "xxx...","xxxAAA"
    "xx....","xx11A1"
    "1.....","111/A1"
    "1.....","1>AA/1"
    "1.....","111111"
  }

  diagonals =
  {
    "1A"
    "A1"
  }
}

GROW_TRENCH_CURVE_INNER_SOLID =
{
  prob = 15
  skip_prob = 6
  aversion = 6

  structure =
  {
    "xxxx..","xxxxAA"
    "xxxx..","xxxxAA"
    "xxxx..","xxxxA1"
    "xxx...","xxx/A1"
    "1.....","1>AA/1"
    "1.....","111111"
  }

  diagonals =
  {
    ".A"
    "A1"
  }
}

GROW_TRENCH_CURVE_OUTER_SOLID =
{
  prob = 15
  skip_prob = 6
  aversion = 6

  structure =
  {
    "xxx..","xxxAA"
    "xxx..","xxxAA"
    "xx...","xx11A"
    "1....","111/A"
    "1....","1>AA/"
  }

  diagonals =
  {
    "1A"
    "A."
  }
}

-- MSSP's sewers [SEWER]

GROW_SEWER_ENTRY =
{
  prob = 35

  group = "sewer"

  group_pos = "entry"

  structure =
  {
    "x....","x1111"
    "11...","11~~~"
    "11...","11111"
  }
}

GROW_SEWER_STRAIGHT =
{
  prob = 40

  group = "sewer"

  structure =
  {
    "1...","1111"
    "~...","~~~~"
    "1...","1111"
  }
}

GROW_SEWER_STAIRS =
{
  prob = 50

  group = "sewer"

  structure =
  {
    "1...","1>AA"
    "~...","~~~~"
    "1...","1>AA"
  }
}

GROW_SEWER_SWERVE =
{
  prob = 35

  group = "sewer"

  structure =
  {
     "1...x","111%x"
     "~....","~~%11"
     "1....","11%~~"
     "x....","x%111"
  }

  diagonals =
  {
    "1."
    "~1"
    "1~"
    ".1"
  }
}

GROW_SEWER_CURVED =
{
  prob = 35

  group = "sewer"

  structure =
  {
    "1...","1111"
    "~...","~~%1"
    "1...","1%~1"
    "x...","x1~1"
  }

  diagonals =
  {
    "~1"
    "1~"
  }
}

GROW_SEWER_CROSSING =
{
  prob = 35

  group = "sewer"

  structure =
  {
    "1..","1~1"
    "~..","~~~"
    "1..","1~1"
  }
}

GROW_SEWER_EXIT =
{
  prob = 25

  structure =
  {
    "1...","11AA"
    "~...","~~AA"
    "1...","11AA"
  }
}

GROW_SEWER_STAIRS_SIDE_EXIT_NEW_AREA =
{
  prob = 25

  structure =
  {
    "xx..xx","xxAAxx"
    "1.....","1>AA11"
    "~.....","~~~~~1"
    "1.....","111111"
  }
}

-- FORGET IT LMAO IT DOESN'T WORK
-- It works now. Cheer up, buddy. -- March, 2019
-- MSSP's city streets. ExperiMENTAL. [STREETS]

STREETS_ENTRY =
{
  prob = 500

  pass = "streets_entry"

  structure =
  {
    "11..","1111"
    "11..","1111"
    "....","1111"
    "....","1111"
  }
}

STREETS_ENTRY_OFFSET =
{
  prob = 500

  pass = "streets_entry"

  structure =
  {
    "....","1111"
    "11..","1111"
    "11..","1111"
    "....","1111"
  }
}

STREETS_STRAIGHT =
{
  prob = 100

  pass = "streets"

  structure =
  {
    ".1111.",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
  }
}

STREETS_STRAIGHT_LONG =
{
  prob = 50

  pass = "streets"

  structure =
  {
    ".1111.",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
    "......",".1111."
  }

}

STREETS_BLOCK =
{
  prob = 25

  pass = "streets"

  structure =
  {
    "..........................",".1111................1111."
    "1.........................","11111111111111111111111111"
    "1.........................","11111111111111111111111111"
    "1.........................","11111111111111111111111111"
    "1.........................","11111111111111111111111111"
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................",".1111................1111."
    "..........................","11111111111111111111111111"
    "..........................","11111111111111111111111111"
    "..........................","11111111111111111111111111"
    "..........................","11111111111111111111111111"
    "..........................",".1111................1111."
  }
}

STREETS_INTERSECTION =
{
  prob = 15

  pass = "streets"

  structure =
  {
    ".1111.",".1111."
    "......","111111"
    "......","111111"
    "......","111111"
    "......","111111"
    "......",".1111."
  }
}

STREETS_T_JUNCTION =
{
  prob = 25

  pass = "streets"

  structure =
  {
    ".1111.",".1111."
    "......","111111"
    "......","111111"
    "......","111111"
    "......","111111"
  }
}

STREETS_CURVE =
{
  prob = 15

  pass = "streets"

  structure =
  {
    ".1111..",".1111.."
    ".......",".1111%."
    ".......",".111111"
    ".......",".111111"
    ".......",".111111"
    ".......",".%11111"
  }

  diagonals =
  {
    "1."
    ".1"
  }
}

-- MSSP's sidewalks

SIDEWALK_STRAIGHT =
{
  prob = 100

  pass = "sidewalk"

  structure =
  {
    "....","AAAA"
    "....","AAAA"
    "1111","1111"
  }
}

SIDEWALK_STRAIGHT_INWARD =
{
  prob = 35

  pass = "sidewalk"

  structure =
  {
    "1........","1AAAAAAAA"
    "1........","1AAAAAAAA"
  }
}

SIDEWALK_4X4 =
{
  prob = 25

  pass = "sidewalk"

  structure =
  {
    "11..","11AA"
    "11..","11AA"
    "....","AAAA"
    "....","AAAA"
  }
}

SIDEWALK_STRAIGHT_INWARD_ANGLED =
{
  prob = 25

  pass = "sidewalk"

  structure =
  {
    "1......","1AAAAAA"
    "1......","1AAAAAA"
    "1xxxx..","1xxxxAA"
    "1xxxx..","1xxxxAA"
    "1xxxx..","1xxxxAA"
    "1xxxx..","1xxxxAA"
  }
}

SIDEWALK_STRAIGHT_LARGE =
{
  prob = 50

  pass = "sidewalk"

  structure =
  {
    "........","AAAAAAAA"
    "........","AAAAAAAA"
    "11111111","11111111"
  }
}

SIDEWALK_STRAIGHT_LARGE_CHAMFERED =
{
  prob = 15

  pass = "sidewalk"

  structure =
  {
    "........","/AAAAAA%"
    "........","AAAAAAAA"
    "11111111","11111111"
  }

  diagonals =
  {
    ".A","A."
  }
}

SIDEWALK_INTERSECTION_SIDE =
{
  prob = 100

  pass = "sidewalk"

  structure =
  {
    "1....","1AAA%"
    "1....","1AAAA"
    "1....","1AAAA"
    "1%...","1%AAA"
    "11111","11111"
  }

  diagonals =
  {
    "A."
    "1.","1A"
  }
}

SIDEWALK_OUTER_CORNER =
{
  prob = 100

  pass = "sidewalk"

  structure =
  {
    "xx....","xxAAAA"
    "xx....","xxAAAA"
    "x11%..","x11%AA"
    "1111xx","1111xx"
    "111xxx","111xxx"
  }

  diagonals =
  {
    "1.","1A"
  }
}

SIDEWALK_EXTEND_SIDEWAYS =
{
  prob = 250

  pass = "sidewalk"

  structure =
  {
    "2..","222"
    "2..","222"
    "111","111"
    "111","111"
  }
}

SIDEWALK_FILL_2X =
{
  prob = 25

  pass = "sidewalk"

  structure =
  {
    "2..2","2222"
    "2..2","2222"
    "x11x","x11x"
    "1111","1111"
  }
}

SIDEWALK_SLOPE_SIDE_SMOL =
{
  prob = 15

  pass = "sidewalk"

  structure =
  {
    "11..","11AA"
    "11..","11AA"
    "11..","11AA"
    "11..","11>A"
  }
}

SIDEWALK_SLOPE_SIDE_NEAR =
{
  prob = 15

  pass = "sidewalk"

  structure =
  {
    "11....","11AAAA"
    "11....","11>>AA"
    "11....","11>>AA"
    "11....","11AAAA"
  }
}

SIDEWALK_SLOPE_SIDE_FAR =
{
  prob = 10

  pass = "sidewalk"

  structure =
  {
    "11xx..","11xxAA"
    "11....","11>>AA"
    "11....","11>>AA"
    "11xx..","11xxAA"
  }
}

SIDEWALK_SLOPE_ON_RAMP =
{
  prob = 10

  pass = "sidewalk"

  structure =
  {
    "11x..","11xAA"
    "11...","11>AA"
    "11...","11>AA"
    "11...","11>AA"
    "11...","11>AA"
    "11x..","11xAA"
  }
}

SIDEWALK_PLAIN_STAIR =
{
  prob = 10

  pass = "sidewalk"

  structure =
  {
    "..","AA"
    "..","AA"
    "..","^^"
    "11","11"
    "11","11"
  }
}

SIDEWALK_BUILDING_4x4 =
{
  prob = 15

  pass = "sidewalk"

  structure =
  {
    "11......","11AAAAAA"
    "11......","11AAAAAA"
    "........","AA....AA"
    "........","AA....AA"
    "........","AA....AA"
    "........","AA....AA"
    "........","AAAAAAAA"
    "........","AAAAAAAA"
  }
}

SIDEWALK_BUILDING_L =
{
  prob = 15

  pass = "sidewalk"

  structure =
  {
    "11........","11AAAAAAAA"
    "11........","11AAAAAAAA"
    "..........","AAAA....AA"
    "..........","AAAA....AA"
    "..........","AA......AA"
    "..........","AA......AA"
    "..........","AA......AA"
    "..........","AA......AA"
    "..........","AAAAAAAAAA"
    "..........","AAAAAAAAAA"
  }
}

SIDEWALK_CURVE =
{
  prob = 20

  pass = "sidewalk"

  structure =
  {
    "1...x","1AA%x"
    "1....","1AAA%"
    "xx...","xx%AA"
    "xxx..","xxxAA"
  }

  diagonals =
  {
    "A."
      "A."
    ".A"
  }
}

SIDEWALK_ZIGZAG =
{
  prob = 20

  pass = "sidewalk"

  structure =
  {
    "1...xx","1AA%xx"
    "1....x","1AAA%x"
    "xx....","xx%AAA"
    "xxx...","xxx%AA"
  }

  diagonals =
  {
    "A."
      "A."
    ".A"
      "A."
  }
}

SIDEWALK_LIQUID =
{
  prob = 50

  pass = "sidewalk"

  structure =
  {
    "........","AA~~~~AA"
    "11111111","11111111"
  }
}

SIDEWALK_LIQUID_POOL_LONG =
{
  prob = 50

  pass = "sidewalk"

  structure =
  {
    "......","AA~~~~"
    "......","AA~~~~"
    "11xxxx","11xxxx"
  }
}

SIDEWALK_LIQUID_POOL =
{
  prob = 50

  pass = "sidewalk"

  structure =
  {
    "....","AA~~"
    "....","AA~~"
    "11xx","11xx"
  }
}

SIDEWALK_CAGE =
{
  prob = 50

  pass = "sidewalk"

  structure =
  {
    "x..","xCC"
    "1..","1AA"
    "1..","1AA"
  }

  cage_mode = "fancy"
}

SIDEWALK_CAGE_4X =
{
  prob = 40

  pass = "sidewalk"

  structure =
  {
    "x....","xCCCC"
    "1....","1AAAA"
    "1....","1AAAA"
  }

  cage_mode = "fancy"
}

SIDEWALK_CAGE_4X4 =
{
  prob = 35

  pass = "sidewalk"

  structure =
  {
    "x..","xCC"
    "x..","xCC"
    "1..","1AA"
    "1..","1AA"
  }

  cage_mode = "fancy"
}

SIDEWALK_CLOSET_2X2 =
{
  prob = 100

  pass = "sidewalk"

  structure =
  {
    "1!!","1TT"
    "1!!","1TT"
  }

  closet = { from_dir=4 }
}

SIDEWALK_CLOSET_2X1 =
{
  prob = 100

  pass = "sidewalk"

  structure =
  {
    "1!","1T"
    "1!","1T"
  }

  closet = { from_dir=4 }
}

SIDEWALK_CLOSET_3X1 =
{
  prob = 100

  pass = "sidewalk"

  structure =
  {
    "1!","1T"
    "1!","1T"
    "1!","1T"
  }

  closet = { from_dir=4 }
}

SIDEWALK_CLOSET_3X2 =
{
  prob = 100

  pass = "sidewalk"

  structure =
  {
    "1!!","1TT"
    "1!!","1TT"
    "1!!","1TT"
  }

  closet = { from_dir=4 }
}

SIDEWALK_CLOSET_4X1 =
{
  prob = 25

  pass = "sidewalk"

  structure =
  {
    "1!","1T"
    "1!","1T"
    "1!","1T"
    "1!","1T"
  }

  closet = { from_dir=4 }
}

SIDEWALK_CLOSET_6X1 =
{
  prob = 25

  pass = "sidewalk"

  structure =
  {
    "1!","1T"
    "1!","1T"
    "1!","1T"
    "1!","1T"
    "1!","1T"
    "1!","1T"
  }

  closet = { from_dir=4 }
}

SIDEWALK_CLOSET_8X1 =
{
  prob = 25

  pass = "sidewalk"

  structure =
  {
    "1!","1T"
    "1!","1T"
    "1!","1T"
    "1!","1T"
    "1!","1T"
    "1!","1T"
    "1!","1T"
    "1!","1T"
  }

  closet = { from_dir=4 }
}
-- MSSP's street 'smoothers'

STREET_CORNER_FIXER =
{
  prob = 100

  pass = "street_fixer"

  structure =
  {
    "x1111xx","x1111xx"
    "111111.","11111.."
    "111111.","11111.."
    "111111.","11111.."
    "111111.","1111/.."
    "x1111..","x......"
    "x......","x......"
  }

  diagonals =
  {
    "1."
  }
}

STREET_T_JUNCTION_FIXER =
{
  prob = 100

  pass = "street_fixer"

  structure =
  {
    "11111.","11111."
    "11111!","1111/!"
    "!1111!","!....!"
    "!!!!!!","!!!!!!"
  }

  diagonals =
  {
    "1."
  }
}

STREET_WEIRD_DEAD_BRANCH_FIXER =
{
  prob = 100

  pass = "street_fixer"

  structure =
  {
    "111111","111111"
    ".1111.","......"
    "......","......"
  }
}

STREET_DEAD_END_FIXER =
{
  prob = 100

  pass = "street_fixer"

  structure =
  {
    ".1111.",".1111."
    ".1111.",".%11/."
    "!!!!!!","!!!!!!"
  }

  diagonals =
  {
    ".1","1."
  }
}

-- MSSP's building entrances... okay, just joiners and some such really

STREET_BUILDING_ENTRANCE =
{
  prob = 300

  pass = "building_entrance"

  structure =
  {
    "..","RR"
    "..","RR"
    "11","11"
  }

  new_room =
  {
    env = "building"

    conn = { x=1, y=1, w=2, dir=8 }

    symmetry = { x=2, y=1, w=2, dir=8 }
  }
}

STREET_BUILDING_ENTRANCE_WITH_JOINER_2X1 =
{
  prob = 100

  pass = "building_entrance"

  structure =
  {
    "....",".RR."
    "....",".RR."
    "x..x","xJJx"
    "x11x","x11x"
  }

  new_room =
  {
    symmetry = { x=3, y=2, w=2, dir=8 }
  }

  joiner =
  {
    from_dir = 2
  }
}

STREET_BUILDING_ENTRANCE_WITH_JOINER_2X2 =
{
  prob = 100

  pass = "building_entrance"

  structure =
  {
    "....",".RR."
    "....",".RR."
    "x..x","xJJx"
    "x..x","xJJx"
    "x11x","x11x"
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

STREET_BUILDING_ENTRANCE_WITH_JOINER_3X2 =
{
  prob = 100

  pass = "building_entrance"

  structure =
  {
    ".....",".RRR."
    ".....",".RRR."
    "x...x","xJJJx"
    "x...x","xJJJx"
    "x111x","x111x"
  }

  new_room =
  {
    symmetry = { x=3, y=3, w=2, dir=8 }
  }

  joiner =
  {
    from_dir = 2
  }
}

-- end of SHAPE_GRAMMAR

}
