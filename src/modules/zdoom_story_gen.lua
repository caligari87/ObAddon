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

ZDOOM_STORY_GENERATOR = { }

table.name_up(ZDOOM_STORIES.STORIES)

function ZDOOM_STORY_GENERATOR.format_story_chunk(story_strings, info)

  -- remove the spaces left behind by Lua's square bracket stuff.
  story_strings = string.gsub(story_strings, "      ", "")

  story_strings = string.gsub(story_strings, "_RAND_DEMON", info.demon_name)
  story_strings = string.gsub(story_strings, "_GOTHIC_LEVEL", info.gothic_level)
  story_strings = string.gsub(story_strings, "NOUNGENANGLICAN", namelib.generate_unique_noun("anglican"))
  story_strings = string.gsub(story_strings, "NOUNGENEXOTIC", namelib.generate_unique_noun("exotic"))
  return story_strings
end

function ZDOOM_STORY_GENERATOR.fetch_story_chunk()
  local info = { }

  local demon_name = rand.key_by_probs(namelib.NAMES.GOTHIC.lexicon.e)
  local gothic_level = Naming_grab_one("GOTHIC")
  info =
  {
    demon_name = demon_name
    gothic_level = gothic_level
  }

  return rand.key_by_probs(ZDOOM_STORIES.LIST), info
end

function ZDOOM_STORY_GENERATOR.hook_me_with_a_story(story_id, info)
  local story_chunk = ZDOOM_STORIES.STORIES[story_id]
  local story_string = rand.pick(story_chunk.hooks)
  story_string = ZDOOM_STORY_GENERATOR.format_story_chunk(story_string, info)
  return story_string
end

function ZDOOM_STORY_GENERATOR.conclude_my_story(story_id, info)
  local story_chunk = ZDOOM_STORIES.STORIES[story_id]
  local story_string = rand.pick(story_chunk.conclusions)
  story_string = ZDOOM_STORY_GENERATOR.format_story_chunk(story_string, info)
  return story_string
end

-- NO USABLE CODE HERE YET
-- SO SAD ALEXA PLAY D_RUNNIN
