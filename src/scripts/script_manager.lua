------------------------------------------------------------------------
--  SCRIPT MANAGER
------------------------------------------------------------------------
--
--  Oblige Level Maker // ObAddon
--
--  Copyright (C) 2019 MsrSgtShooterPerson
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
==========================
      SCRIPT MANAGER
==========================
The Script Manager is a catch-all for the creation of various
lumps from different ObAddon modules for better organization.

The goal is gather all lump data from various modules and create
the necessary includes/import lines for each, as well as merging
certain lumps if required such as the need for ZScript editor
numbers to be defined in a MAPINFO instead of within the script
file itself.
]]


function ScriptMan_assemble_acs_lump()
-- MSSP-TODO
end


function ScriptMan_assemble_mapinfo_lump()
  local mapinfo_lines = {
      "gameinfo\n",
      "{\n",
  }
  if PARAM.boss_gen then
    table.insert(mapinfo_lines, 'addeventhandlers = "BossGenerator_Handler"\n')
  end
  if PARAM.custom_quit_messages == "yes" then
    each line in PARAM.gameinfolump do
      table.insert(mapinfo_lines,line)
    end
  end
  table.insert(mapinfo_lines, "\n}\n")
  if PARAM.mapinfolump != nil then
    each line in PARAM.mapinfolump do
      table.insert(mapinfo_lines,line)
    end
  end
  gui.wad_add_text_lump("MAPINFO", mapinfo_lines)
end


function ScriptMan_assemble_zscript_lump()
  local zscript_lines = 'version "3.3"\n'
  if PARAM.boss_gen then
    zscript_lines = zscript_lines .. PARAM.BOSSSCRIPT
  end
  if PARAM.custom_trees == "zs" then
    zscript_lines = zscript_lines .. PARAM.ztrees
  end
  add_script_lump("ZSCRIPT", zscript_lines)
end


function ScriptMan_assemble_decorate_lump()
  local decorate_script_lines = ""
  if PARAM.dynamic_lights == "yes" then
    decorate_script_lines = decorate_script_lines ..
    ZDOOM_SPECIALS.DYNAMIC_LIGHT_DECORATE
  end
  if PARAM.hn_marker_decorate_lines then
    decorate_script_lines = decorate_script_lines ..
    PARAM.hn_marker_decorate_lines
  end
  if PARAM.ambient_sounds then
    decorate_script_lines = decorate_script_lines ..
    PARAM.SOUND_DEC
  end

  add_script_lump("DECORATE", decorate_script_lines)
end


function ScriptMan_assemble_sndinfo_lump()
  local sndinfo_lines = ""
  if PARAM.ambient_sounds then
    sndinfo_lines = sndinfo_lines ..
    PARAM.SNDINFO
    add_script_lump("SNDINFO", sndinfo_lines)
  end
end


function ScriptMan_assemble_gldefs_lump()
  local gldefs_lines = ""
  if PARAM.dynamic_lights == "yes" then
    gldefs_lines = gldefs_lines ..
    ZDOOM_SPECIALS.DYNAMIC_LIGHT_GLDEFS
  end

  add_script_lump("GLDEFS", gldefs_lines)
end


function ScriptMan_assemble_acs_lump()
-- MSSP-TODO
end


function ScriptMan_create_include_lump()
end


function ScriptMan_init()
  gui.printf("\n--==| Script Manager |==--\n\n")
  ScriptMan_assemble_zscript_lump()
  ScriptMan_assemble_decorate_lump()
  ScriptMan_assemble_gldefs_lump()
  ScriptMan_assemble_sndinfo_lump()
  ScriptMan_assemble_mapinfo_lump()
end
