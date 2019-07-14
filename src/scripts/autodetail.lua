------------------------------------------------------------------------
--  AUTODETAIL
------------------------------------------------------------------------
--
--  Oblige Level Maker // ObAddon
--
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

function Autodetail_get_level_svolume()
  if PARAM.autodetail == "off" then return end

  local total_walkable_area = 0

  each R in LEVEL.rooms do
    total_walkable_area = total_walkable_area + R.svolume
  end

  LEVEL.total_svolume = total_walkable_area


  if LEVEL.total_svolume > 1800 then
    LEVEL.autodetail_group_walls_factor = (LEVEL.total_svolume / 1800) ^ 2
  end
end

function Autodetail_plain_walls()
  if PARAM.autodetail == "off" then return end

  local total_perimeter = 0
  each _,junc in LEVEL.junctions do
    if junc.E1 and Edge_is_wallish(junc.E1) then
      total_perimeter = total_perimeter + junc.perimeter
    end
  end

  LEVEL.total_perimeter = total_perimeter

  local tone_down_factor = 1

  if total_perimeter >= 1200 then
    tone_down_factor = ((total_perimeter/1200)) ^ 3.5
    PREFABS["Wall_plain"].use_prob = PREFABS["Wall_plain"].prob * tone_down_factor
    PREFABS["Wall_plain_diag"].use_prob = PREFABS["Wall_plain"].prob * tone_down_factor
  end

  LEVEL.autodetail_plain_walls_factor = tone_down_factor
end

function Autodetail_report()
  gui.printf("\n--==| Auto Detail Report |==--\n\n")
  gui.printf("Total walkable volume: " .. LEVEL.total_svolume .. "\n")
  gui.printf("Group walls tone down multiplier: " .. LEVEL.autodetail_group_walls_factor .. "\n")
  gui.printf("Total perimeter: " .. LEVEL.total_perimeter .. "\n")
  gui.printf("Plain walls tone down multiplier: " .. LEVEL.autodetail_plain_walls_factor .. "\n")
end