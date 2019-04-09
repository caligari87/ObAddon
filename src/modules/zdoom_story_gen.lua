----------------------------------------------------------------
--  MODULE: ZDoom Story Generator
----------------------------------------------------------------
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
-------------------------------------------------------------------

gui.import("zdoom_stories.lua")

table.name_up(ZDOOM_STORIES.STORIES)

function ZStoryGen_format_story_chunk(story_strings, info)
  local line_max_length = 32

  -- replace special word tags with their proper ones from the name gen
  story_strings = string.gsub(story_strings, "_RAND_DEMON", info.demon_name)
  story_strings = string.gsub(story_strings, "_GOTHIC_LEVEL", info.gothic_level)

  -- remove the spaces left behind by Lua's square bracket stuff.
  story_strings = string.gsub(story_strings, "      ", "")
  gui.printf(story_strings)
  story_strings = string.gsub(story_strings, "\n", " ")

  -- ensure words are always within the width of Doom's intermission screens
  -- based on the above defined line_max_length
  local i = 1
  local manhandled_string = ''
  local manhandled_string_length = 0

  for word in story_strings:gmatch("%S+") do

    manhandled_string_length = manhandled_string_length + word:len() + 1

    if manhandled_string_length + word:len() > line_max_length then
      manhandled_string = manhandled_string .. word .. "\\n"
      manhandled_string_length = 0
    else
      manhandled_string = manhandled_string .. word .. " "
    end

    i = i + 1
  end
  story_strings = manhandled_string

  story_strings = string.gsub(story_strings, "_SPACE", "\n")

  return story_strings
end

function ZStoryGen_fetch_story_chunk(lev_info)
  local info = { }

  if lev_info then
    info.level_name = lev_info.description
  end

  local demon_name = rand.key_by_probs(namelib.NAMES.GOTHIC.lexicon.e)
  local gothic_level = Naming_grab_one("GOTHIC")

  demon_name = string.gsub(demon_name, "NOUNGENEXOTIC", namelib.generate_unique_noun("exotic"))

  info.demon_name = demon_name
  info.gothic_level = gothic_level

  return rand.key_by_probs(ZDOOM_STORIES.LIST), info
end

function ZStoryGen_hook_me_with_a_story(story_id, info)
  local story_chunk = ZDOOM_STORIES.STORIES[story_id]
  local story_string = rand.pick(story_chunk.hooks)
  story_string = ZStoryGen_format_story_chunk(story_string, info)
  return story_string
end

function ZStoryGen_conclude_my_story(story_id, info)
  local story_chunk = ZDOOM_STORIES.STORIES[story_id]
  local story_string = rand.pick(story_chunk.conclusions)
  story_string = ZStoryGen_format_story_chunk(story_string, info)
  return story_string
end

-- LOOK AT ALL THIS CODE NOW
-- SO HAPPY ALEXA PLAY D_RUNNIN