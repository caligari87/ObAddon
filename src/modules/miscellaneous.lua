------------------------------------------------------------------------
--  MODULE: Miscellaneous Stuff
------------------------------------------------------------------------
--
--  Copyright (C) 2009      Enhas
--  Copyright (C) 2009-2017 Andrew Apted
--  Copyright (C) 2019      MsrSgtShooterPerson
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

MISC_STUFF = { }

MISC_STUFF.YES_NO =
{
  "no",  _("No"),
  "yes", _("Yes"),
}

MISC_STUFF.LIGHTINGS =
{
  "flat",    _("FLAT"),
  "lower",   _("Lower"),
  "normal",  _("Normal"),
  "higher",  _("Higher"),
}

MISC_STUFF.LIGHT_CHOICES =
{
  "-3",   _("Pitch-black"),
  "-2",   _("Gloomy"),
  "-1",   _("Darker"),
  "none", _("NONE"),
  "+1",   _("Brighter"),
  "+2",   _("Vivid"),
  "+3",   _("Radiant"),
}

MISC_STUFF.LIVEMAP_CHOICES =
{
  "step", _("Per Step (Very Slow)"),
  "room", _("Per Room (Slightly Slow)"),
  "none", _("No Live Minimap"),
}

MISC_STUFF.SINK_STYLE_CHOICES =
{
  "curved", _("Curved"),
  "sharp", _("Sharp"),
  "random", _("Random"),
}

MISC_STUFF.HEIGHT_CHOICES =
{
  "short",     _("Mostly Short"),
  "short-ish", _("Slightly Short"),
  "normal",    _("Normal"),
  "tall-ish",  _("Slightly Tall"),
  "tall",      _("Mostly Tall"),
  "mixed",     _("Mix It Up"),
}

MISC_STUFF.WINDOW_BLOCKING_CHOICES =
{
  "not_on_vistas", _("Not on Vistas"),
  "never",         _("Never"),
  "all",           _("All"),
}

function MISC_STUFF.begin_level(self)
  each opt in self.options do
    local name  = assert(opt.name)
    local value = opt.value

    if opt.choices == STYLE_CHOICES then
      if value != "mixed" then
        STYLE[name] = value
      end

    else
      -- pistol_starts, or other YES/NO stuff

      if value != "no" then
        PARAM[name] = value
      end
    end
  end
end


OB_MODULES["misc"] =
{
  label = _("Miscellaneous")

  side = "left"
  priority = 103

  hooks =
  {
    begin_level = MISC_STUFF.begin_level
  }

  options =
  {
    {
      name="pistol_starts"
      label=_("Pistol Starts")
      choices=MISC_STUFF.YES_NO
      tooltip=_("Ensure every map can be completed from a pistol start (ignore weapons obtained from earlier maps)")
    }

    {
      name="alt_starts"
      label=_("Alt-start Rooms")
      choices=MISC_STUFF.YES_NO
      tooltip=_("For Co-operative games, sometimes have players start in different rooms")
      gap=1
    }

    { name="big_rooms",   label=_("Big Rooms"),      choices=STYLE_CHOICES }
    {
      name="room_heights",
      label=_("Room Heights"),
      choices=MISC_STUFF.HEIGHT_CHOICES,
      tooltip=_("Determines if rooms should have a height limit or should exaggerate their height. " ..
      "Short means room areas strictly have at most 128 units of height, tall means rooms immediately have " ..
      "doubled heights. Normal is the default Oblige behavior.")
      default="normal"
      gap=1
    }


    { name="parks",       label=_("Parks"),          choices=STYLE_CHOICES }
    {
      name="natural_parks",
      label=_("Natural Cliffs"),
      tooltip=_("Percentage of parks that use completely naturalistic walls.")
      choices=STYLE_CHOICES,
      default="none",
    }
    { name="park_detail",
      label=_("Park Detail"),
      tooltip=_("Reduces or increases the probability of park decorations such as trees on park rooms."),
      choices=STYLE_CHOICES,
      gap=1,
    }

    { name="windows",     label=_("Windows"),        choices=STYLE_CHOICES }
    {
      name="passable_windows",
      label=_("Passable Windows"),
      choices=MISC_STUFF.WINDOW_BLOCKING_CHOICES,
      tooltip=_("Sets the preferences for passability on certain windows. On Vistas Only means only windows " ..
                "that look out to vistas/map border scenics have a blocking line."),
      default="not_on_vistas",
      gap=1
    }

    { name="symmetry",    label=_("Symmetry"),       choices=STYLE_CHOICES }
    { name="beams",       label=_("Beams"),          choices=STYLE_CHOICES,
      tooltip = "Allows the appearance of thin pillars to appear between the borders of different elevations.",
    }
    { name="fences",      label=_("Fences"),         choices=STYLE_CHOICES,
      tooltip = "Creates thick solid fences and fence posts between areas of varying height for outdoor rooms.",
    }
    { name="porches",     label=_("Porches\\Gazebos"),        choices=STYLE_CHOICES,
      tooltip = "Occasional outdoor areas with a lowered indoor-ish ceiling.",
    }
    { name="scenics",     label=_("Scenics"),          choices=STYLE_CHOICES,
      tooltip = "Controls the amount of fancy scenics visible at room bordering the maps.",
      gap = 1,
    }
    { name = "corner_style",
      label=_("Sink Style"),
      choices=MISC_STUFF.SINK_STYLE_CHOICES,
      tooltip = "Determines the style for corners with sunken " ..
                "ceilings and floors. Default is Curved, where Oblige makes sink " ..
                "corners soft, while Sharp leaves the corners angular.",
      default = "random",
    }
    {
      name = "liquid_sinks"
      label=_("Liquid Sinks"),
      choices=MISC_STUFF.YES_NO,
      tooltip = "Enables or disables liquid sinks. Liquid sinks are walkable floors that " ..
                "are often converted into depressions with the level's liquid. " ..
                "May greatly inconvenience the player but default Oblige behavior is 'Yes'.",
      default = "yes",
      gap = 1,
    }

    { name="darkness",    label=_("Dark Outdoors"),  choices=STYLE_CHOICES }
    { name="brightness_offset",
      label=_("Brightness Offset"),
      choices=MISC_STUFF.LIGHT_CHOICES,
      tooltip = "Creates an extra brightness offset for rooms. Does not change the lighting palette for rooms.",
      default = "none"
    }
    { name="barrels",     label=_("Barrels"),        choices=STYLE_CHOICES, gap=1 }

    { name="doors",       label=_("Doors"),          choices=STYLE_CHOICES }
    { name="keys",        label=_("Keyed Doors"),    choices=STYLE_CHOICES }
    { name="switches",    label=_("Switched Doors"), choices=STYLE_CHOICES, gap=1 }

    {
      name="road_markings",
      label=_("Road Markings"),
      choices=MISC_STUFF.YES_NO,
      default = "yes",
      tooltip = _("Adds street markings to roads."),
    }
    {
      name="street_traffic",
      label=_("Street Traffic"),
      choices=STYLE_CHOICES,
      tooltip = _("If Street Mode is enabled, changes the density of prefabs such " ..
      "as cars, barriers, crates, and relevant items on the roads."),
      gap = 1,
    }

    {
      name="exit_signs"
      label=_("Exit Signs")
      choices=MISC_STUFF.YES_NO
      tooltip=_("Places exit signs by exiting room")
      default = "yes"
      gap=1
    }

    {
      name="linear_start"
      label=_("Linear Start")
      choices=MISC_STUFF.YES_NO
      tooltip=_("Stops start rooms from having more than one external room connection. " ..
      "Can help reduce being overwhelmed by attacks from multiple directions " ..
      "when multiple neighboring rooms connect into the start room.")
      default = "no"
    }
    {
      name="dead_ends"
      label=_("Dead Ends")
      choices=STYLE_CHOICES
      tooltip=_("Cleans up and removes areas with staircases that lead to nowhere.\n" ..
      "NONE means all dead ends are removed.\n" ..
      "Heaps means all dead ends are preserved (Oblige default).")
      default = "heaps"
      gap = 1
    }

    {
      name="live_minimap"
      label=_("Live Growth Minimap")
      choices=MISC_STUFF.LIVEMAP_CHOICES
      tooltip=_("Shows more steps Oblige performs on rooms as they are grown on the GUI minimap. May take a hit on generation speed.")
    }

---- PLANNED (UNFINISHED) STUFF ----

-- already done: -- MSSP
--  { name="light_level",  label=_("Lighting"),   choices=MISC_STUFF.LIGHTINGS }
--  { name="detail_level", label=_("Detail"),     choices=MISC_STUFF.LIGHTINGS, gap=1 }

--  pictures    = { label=_("Pictures"),       choices=STYLE_CHOICES }
--  cycles      = { label=_("Multiple Paths"), choices=STYLE_CHOICES }
--  ex_floors   = { label=_("3D Floors"),      choices=STYLE_CHOICES }

--  lakes       = { label=_("Lakes"),          choices=STYLE_CHOICES }
  }
}
