------------------------------------------------------------------------
--  AUTODETAIL
------------------------------------------------------------------------
--
--  Oblige Level Maker // ObAddon
--
--  Copyright (C) 2018-2020 MsrSgtShooterPerson
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

-- Autodetail constants

-- the volume of a map in seed count
-- this is the minimum volume required
-- before Autodetail for grouped walls kicks in
LEVEL_SVOLUME_KICKIN = 1800

-- added exponent for grouped walls
-- higher numbers mean grouped walls are even
-- less likely to show
GROUPED_WALL_TONE_DOWN_EXP = 2.5

-- the total perimeter of wall-ish junctions required in the map
-- before Autodetail for ungrouped walls kicks in
LEVEL_PERIMETER_COUNT_KICKIN = 1200

-- added exponent for ungrouped walls
-- higher numbers mean plain walls are more likely
UNGROUPED_WALL_TONE_DOWN_EXP = 3.5


function Autodetail_get_level_svolume()
  LEVEL.autodetail_group_walls_factor = 1

  if PARAM.autodetail == "off" then return end

  local total_walkable_area = 0

  each R in LEVEL.rooms do
    total_walkable_area = total_walkable_area + R.svolume
  end

  LEVEL.total_svolume = total_walkable_area

  if LEVEL.total_svolume > LEVEL_SVOLUME_KICKIN then
    LEVEL.autodetail_group_walls_factor = (LEVEL.total_svolume / LEVEL_SVOLUME_KICKIN)
    ^ GROUPED_WALL_TONE_DOWN_EXP
  end
end


function Autodetail_plain_walls()
  LEVEL.autodetail_plain_walls_factor = 1

  if PARAM.autodetail == "off" then return end

  local total_perimeter = 0
  each _,junc in LEVEL.junctions do
    if junc.E1 and Edge_is_wallish(junc.E1) then
      total_perimeter = total_perimeter + junc.perimeter
    end
  end

  LEVEL.total_perimeter = total_perimeter

  local tone_down_factor = 1

  if total_perimeter >= LEVEL_PERIMETER_COUNT_KICKIN then
    tone_down_factor = ((total_perimeter/LEVEL_PERIMETER_COUNT_KICKIN))
    ^ UNGROUPED_WALL_TONE_DOWN_EXP
  end

  LEVEL.autodetail_plain_walls_factor = tone_down_factor * 4
end


function Autodetail_report()
  if PARAM.autodetail == "off" then return end

  gui.printf("\n--==| Auto Detail Report |==--\n\n")
  gui.printf("Total walkable volume: " .. LEVEL.total_svolume .. "\n")
  gui.printf("Group walls tone down multiplier: " .. LEVEL.autodetail_group_walls_factor .. "\n")
  gui.printf("Total perimeter: " .. LEVEL.total_perimeter .. "\n")
  gui.printf("Plain walls tone down multiplier: " .. LEVEL.autodetail_plain_walls_factor .. "\n")
end
