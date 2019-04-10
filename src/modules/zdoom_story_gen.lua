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

  local line_max_length = 35

  -- replace special word tags with their proper ones from the name gen
  if info then
    story_strings = string.gsub(story_strings, "_RAND_DEMON", info.demon_name)
    story_strings = string.gsub(story_strings, "_RAND_ENGLISH_PLACE", info.anglican_name)
    story_strings = string.gsub(story_strings, "_EVULZ", info.demon_title)
    story_strings = string.gsub(story_strings, "_GOTHIC_LEVEL", info.gothic_level)
    story_strings = string.gsub(story_strings, "_RAND_CONTRIBUTOR", info.contributor_name)
    story_strings = string.gsub(story_strings, "_MCGUFFIN_TECH", info.hell_mcguffin)
    story_strings = string.gsub(story_strings, "_MCGUFFIN_HELL", info.tech_mcguffin)
  end

  -- dialogue quotes and apostrphes, man
  story_strings = string.gsub(story_strings, '\"', "'")

  -- remove the spaces left behind by Lua's square bracket stuff.
  story_strings = string.gsub(story_strings, "  ", "")
  gui.printf(story_strings .. "\n\n")
  story_strings = string.gsub(story_strings, "\n", " ")

  -- ensure words are always within the width of Doom's intermission screens
  -- based on the above defined line_max_length
  local i = 1
  local manhandled_string = ''
  local manhandled_string_length = 0
  local story_lines = {}


  -- splitting dem paragraphs
  for word in story_strings:gmatch("%S+") do

    if manhandled_string_length == 0 then
      manhandled_string = '"' .. manhandled_string
    end

    if word == "_SPACE" then
      word = "\\n"
    end

    manhandled_string_length = manhandled_string_length + word:len()

    if manhandled_string_length + word:len() > line_max_length then
      manhandled_string = manhandled_string .. word .. '\\n"'
      table.insert(story_lines, manhandled_string)
      manhandled_string = ""
      manhandled_string_length = 0
    else
      manhandled_string = manhandled_string .. word .. " "
    end
  end

  -- properly add the last line if it exists.
  if manhandled_string != "" then
    table.insert(story_lines, manhandled_string .. '"')
  end
  story_lines[#story_lines] = story_lines[#story_lines] .. ";"

  return story_lines
end

function ZStoryGen_fetch_story_chunk(lev_info)
  local info = { }

  if lev_info then
    info.level_name = lev_info.description
  end

  -- some names based on the namelib need to pass through the unique noun generator on
  -- the occasion it picks up the noun gen keywords, or the keywords will
  -- stay as they are in the string
  local demon_name = rand.key_by_probs(namelib.NAMES.GOTHIC.lexicon.e)
  demon_name = string.gsub(demon_name, "NOUNGENEXOTIC", namelib.generate_unique_noun("exotic"))
  info.demon_name = demon_name

  info.anglican_name = namelib.generate_unique_noun("anglican")

  info.demon_title = rand.key_by_probs(ZDOOM_STORIES.EVIL_TITLES)
  info.gothic_level = Naming_grab_one("GOTHIC")
  info.contributor_name = rand.key_by_probs(namelib.NAMES.TITLE.lexicon.c)
  info.hell_mcguffin = rand.key_by_probs(ZDOOM_STORIES.MCGUFFINS.hellish)
  info.tech_mcguffin = rand.key_by_probs(ZDOOM_STORIES.MCGUFFINS.tech)

  return rand.key_by_probs(ZDOOM_STORIES.LIST), info
end

function ZStoryGen_hook_me_with_a_story(story_id, info)
  local story_chunk = ZDOOM_STORIES.STORIES[story_id]
  local story_string = rand.pick(story_chunk.hooks)
  local story_table = ZStoryGen_format_story_chunk(story_string, info)
  return story_table
end

function ZStoryGen_conclude_my_story(story_id, info)
  local story_chunk = ZDOOM_STORIES.STORIES[story_id]
  local story_string = rand.pick(story_chunk.conclusions)
  local story_table = ZStoryGen_format_story_chunk(story_string, info)
  return story_table
end

function ZStoryGen_init()

  gui.printf("\n--== ZDoom: Story generator ==--\n\n")

  local hooks = {}
  local conclusions = {}
  local x = 1
  local language_lump = {}

  while x <= #GAME.episodes do
    local story_id, info = ZStoryGen_fetch_story_chunk()
    hooks[x] = ZStoryGen_hook_me_with_a_story(story_id, info)
    conclusions[x] = ZStoryGen_conclude_my_story(story_id, info)
    x = x + 1
  end


  -- create language lump
  table.insert(language_lump, "[enu default]\n")
  table.insert(language_lump, "// The following stories are brought to you by\n")
  table.insert(language_lump, "// the ObAddon Story Generator!\n")
  table.insert(language_lump, "\n")
  x = 1
  local y
  while x <= #GAME.episodes do

    -- insert story start sequence
    table.insert(language_lump, "STORYSTART" .. x .. " =\n")
    for _,line in pairs(hooks[x]) do
      table.insert(language_lump, "  " .. line .. "\n")
    end
    table.insert(language_lump, "\n")

    -- insert story end sequences
    table.insert(language_lump, "STORYEND" .. x .. " =\n")
    for _,line in pairs(conclusions[x]) do
      table.insert(language_lump, "  " .. line .. "\n")
    end
    table.insert(language_lump, "\n")
    x = x + 1
  end


  -- create secret messages
  local secret_entry = ZStoryGen_format_story_chunk(rand.pick(ZDOOM_STORIES.SECRET_TEXTS.d2_secretnearby))
  local secret1 = ZStoryGen_format_story_chunk(rand.pick(ZDOOM_STORIES.SECRET_TEXTS.d2_secret1))
  local secret2 = ZStoryGen_format_story_chunk(rand.pick(ZDOOM_STORIES.SECRET_TEXTS.d2_secret2))
  table.insert(language_lump, "SECRETNEARBY =\n")
  for _,line in pairs(secret_entry) do
    table.insert(language_lump, " " .. line .. "\n")
  end
  table.insert(language_lump, "\n")
  table.insert(language_lump, "SECRET1 =\n")
  for _,line in pairs(secret1) do
    table.insert(language_lump, " " .. line .. "\n")
  end
  table.insert(language_lump, "\n")
  table.insert(language_lump, "SECRET2 =\n")
  for _,line in pairs(secret2) do
    table.insert(language_lump, " " .. line .. "\n")
  end

  gui.wad_add_text_lump("LANGUAGE",language_lump)
end

-- LOOK AT ALL THIS CODE NOW
-- SO HAPPY ALEXA PLAY D_RUNNIN
