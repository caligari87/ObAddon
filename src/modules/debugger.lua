------------------------------------------------------------------------
--  MODULE: Debug Statement Control
------------------------------------------------------------------------
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

DEBUG_CONTROL = { }

DEBUG_CONTROL.YES_NO =
{
  "yes", _("Yes"),
  "no",  _("No"),
}

DEBUG_CONTROL.NAME_GEN_CHOICES =
{
  "32l",  _("Test Level Names"),
  "32t",  _("Test Title Names"),
  "none", _("None"),
}

DEBUG_CONTROL.GROWTH_STEP_CHOICES =
{
  "showmore", _("Show All Steps"),
  "show",     _("Show Successful Steps Only"),
  "no",       _("No"),
}

DEBUG_CONTROL.LEVEL_NUM_CHOICES =
{
  "all", _("All"),
  "1",   _("1 only"),
  "2",   _("2 only"),
  "3",   _("3 only"),
  "4",   _("4 only"),
  "5",   _("5 only"),
  "6",   _("6 only"),
  "7",   _("7 only"),
  "8",   _("8 only"),
  "9",   _("9 only"),
  "10",   _("10 only"),
  "11",   _("11 only"),
  "12",   _("12 only"),
  "13",   _("13 only"),
  "14",   _("14 only"),
  "15",   _("15 only"),
  "16",   _("16 only"),
  "17",   _("17 only"),
  "18",   _("18 only"),
  "19",   _("19 only"),
  "20",   _("20 only"),
  "21",   _("21 only"),
  "22",   _("22 only"),
  "23",   _("23 only"),
  "24",   _("24 only"),
  "25",   _("25 only"),
  "26",   _("26 only"),
  "27",   _("27 only"),
  "28",   _("28 only"),
  "29",   _("29 only"),
  "30",   _("30 only"),
  "31",   _("31 only"),
  "32",   _("32 only"),
  "33",   _("33 only"),
  "34",   _("34 only"),
  "35",   _("35 only"),
  "36",   _("36 only"),
}

function DEBUG_CONTROL.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

----------------------------------------------------------------

OB_MODULES["debugger"] =
{
  label = _("Debug LOG Control")

  side = "left"
  priority = 50

  tooltip = "Prints more debug information into the log.\n" ..
            "Debug Messages under Options currently does not work" ..
            " when an addon package is loaded."

  hooks =
  {
    setup = DEBUG_CONTROL.setup
  }

  options =
  {
    name_gen_test =
    {
      name = "name_gen_test"
      label=_("Name Generator")
      choices=DEBUG_CONTROL.NAME_GEN_CHOICES
      tooltip="Prints a demonstration sample of 32 names per category.\n" ..
              "Level Names = TECH, GOTHIC, URBAN, and BOSS level names\n" ..
              "Title Names = TITLE, SUB_TITLE, and EPISODE names\n"
      default="none"
      priority=100
    }

    print_shape_steps =
    {
      name = "print_shape_steps"
      label=_("Print Growth Steps")
      choices=DEBUG_CONTROL.GROWTH_STEP_CHOICES
      tooltip="Displays more information about the shape grammar steps "..
              "in the LOG. 'Show All Steps' will print all actions " ..
              "the shape grammar system performs but will greatly " ..
              "bloat your LOG file. Default is 'Show Succesful Steps Only'."
      default="show"
      priority=99
    }

    print_prefab_use =
    {
      name = "print_prefab_use"
      label=_("Print Prefab Usage")
      choices=DEBUG_CONTROL.YES_NO
      tooltip="Lists prefabs spawned per map."
      default="yes"
      priority=98
    }

    print_story_strings =
    {
      name = "print_story_strings"
      label=_("Print ZDoom Strings")
      choices=DEBUG_CONTROL.YES_NO
      tooltip="Displays the story generator and custom quit message strings "..
              "added by the ZDoom Special Addons: Story Generator."
      default="yes"
      priority=97
    }

    build_levels =
    {
      name = "build_levels"
      label = _("Build Level")
      choices=DEBUG_CONTROL.LEVEL_NUM_CHOICES
      tooltip="Allows the skipping of level construction along the WAD " ..
              "for debugging purposes."
      default="all"
      priority=96
    }
  }
}
