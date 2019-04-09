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

function fetch_story_chunk()
  local story_chunk = rand.pick(ZDOOM_STORIES)
  local hook = rand.pick(story_chunk.hooks)
  local conclusion = rand.pick(story_chunk.conclusions)
  return hook, conclusion
end

function hook_me_with_a_story(level_info)
end

function conclude_my_story(level_info, story_chunk)
end

local function format_story()
end

-- NO USABLE CODE HERE YET
-- SO SAD ALEXA PLAY D_RUNNIN
