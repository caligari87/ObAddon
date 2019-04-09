----------------------------------------------------------------
--  MODULE: ZDoom Story Tables
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

--[[
Some keywords for parsing later on:

  RAND_DEMON = name of a demonic entity
               (based on the GOTHIC entity names table)

  RAND_GAL
  RAND_GUY
  RAND_HUMAN = names for a mere mortals (there is no human name generator
               yet as of 2019-04-09)

Notes and Tips:

* Hooks are the 'pull' of the story as per D&D terminology, a method
  of getting the characters' attention towards something. When writing
  hooks, make it as universal as possible i.e. the situation can start
  at any point of play.

* Conclusions are the resulting effect after a hook has been engaged.
  Conclusions can vary from positive, to negative, or even weird results.
  Be creative!

* Hooks are placed at any point before the end of the episode
  but preferably at least in the first few maps of that episode.
  Conclusions are strictly placed at the end of each episode so
  it meshes with the climax of a boss battle or procedural gotcha.

* Doomguy doesn't care about story. But we do, we can just keep saying
  things about things he ends up doing, so be creative.

* For each story type under the STORIES table, there can be any number
  of hooks and conclusion per story.

]]

ZDOOM_STORIES =
{
  portal_to_hell =
  {
    hooks =
    {
      [[It seems as though demons continue to spill into the area
      despite your best efforts. Your locator marks a massive spike
      in energy nearby. It seems the source of the demonic surge
      is from that direction...]],

      [[Hell's forces continue to lay siege upon this region. It
      is clear their numbers are being reinforced from elsewhere.
      You begin a search for the potential existence of a hell
      portal...]],

      [[You are slowly drawn to a mysterious source of energy
      as you progress and notice the continued flow of demons
      into the fray. There must be an entrance to hell nearby...]]
    }

    conclusions =
    {
      [[You have destroyed the guardian waiting upon a portal to hell!
      With his defeat, the portal collapses. Hell will find it more
      difficult to return to this place!]],

      [[Hell's commanders went through great means to guard this portal
      to hell. You slip through to find yourself in a new place, in which
      the source of the demonic invasion seems to further come from...]],

      [[It was a trap! As the demon's corpse crashes into the floor,
      a portal to hell was underneath all along! The platform crumbles
      and throws you into its maw - you find yourself in a new place...]]
    }
  }

  fuck_argent_energy =
  {
    hooks =
    {
      [[As you continue, a quiet but distinct hum of power seems
      to permeate this area. It feels hair-raising and ominous.
      It must be Argent Energy. The source must be closed.]],
    }

    conclusions =
    {
      [[You have found a conduit through which Argent Energy
      is being transmitted through from hell! With a quick bash
      with your fists, the conduit is damaged beyond repair.
      The power goes out through the region - but so does the
      corruption hell has radiated throughout.]]
    }
  }
}