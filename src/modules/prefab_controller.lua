------------------------------------------------------------------------
--  MODULE: prefab spawn quantity controller
------------------------------------------------------------------------
--
--  Copyright (C) 2019-2020 MsrSgtShooterPerson
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

PREFAB_CONTROL = { }

PREFAB_CONTROL.WALL_CHOICES =
{
  "fab_default", _("DEFAULT"),
  "fab_some",    _("Some"),
  "fab_less",    _("Less"),
  "fab_few",     _("Few"),
  "fab_rare",    _("Rare"),
  "fab_random",  _("Mix It Up"),
}

PREFAB_CONTROL.POINT_CHOICES =
{
  "fab_none",    _("NONE"),
  "fab_rare",    _("Rare"),
  "fab_few",     _("Few"),
  "fab_default", _("DEFAULT"),
  "fab_more",    _("More"),
  "fab_heaps",   _("Heaps"),
}

PREFAB_CONTROL.ON_OFF =
{
  "on",  _("On"),
  "off", _("Off"),
}

PREFAB_CONTROL.FINE_TUNE_FABS =
{
  crushers =
  {
    "Joiner_tech_triple_crusher",
    "Joiner_tech_3x3_crusher",
    "Joiner_tech_double_mega_crusher",
    "Hallway_conveyorh_c6",
    "Hallway_hellcata_i8",
  }

  gambling =
  {
    "Item_dem_gamble_closet1",
    "Item_dem_gamble_closet2",
  }

  dexterity =
  {
    "Joiner_scionox_minichasm",
    "Joiner_scionox_minichasm_2",
  }

  sight_ambushes =
  {
    "Cage_auto_open",
    "Cage_auto_open_smaller",
    "Cage_teleporter_ambush_tech",
    "Cage_teleporter_ambush_hell",
    "Cage_dem_garage_ambush1",
    "Cage_dem_garage_ambush1CBL",
    "Cage_dem_garage_ambush1CBR",
    "Cage_dem_garage_ambush2",
    "Cage_scionox_guardpost_destroyed",
  }
}

function PREFAB_CONTROL.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

function PREFAB_CONTROL.fine_tune_filters()
  local tab_remove_fabs = {}

  if PARAM.pf_crushers and PARAM.pf_crushers == "off" then
    table.append(tab_remove_fabs, PREFAB_CONTROL.FINE_TUNE_FABS["crushers"])
  end

  if PARAM.pf_gamble and PARAM.pf_gamble == "off" then
    table.append(tab_remove_fabs, PREFAB_CONTROL.FINE_TUNE_FABS["gambling"])
  end

  if PARAM.pf_dexterity and PARAM.pf_dexterity == "off" then
    table.append(tab_remove_fabs, PREFAB_CONTROL.FINE_TUNE_FABS["dexterity"])
  end

  if PARAM.pf_sight_ambushes and PARAM.pf_sight_ambushes == "off" then
    table.append(tab_remove_fabs, PREFAB_CONTROL.FINE_TUNE_FABS["sight_ambushes"])
  end

  each fab in tab_remove_fabs do
    PREFABS[fab] = nil
  end
end

----------------------------------------------------------------

OB_MODULES["prefab_control"] =
{
  label = _("Prefab Control")

  side = "left"
  priority = 93

  game = "doomish"

  hooks =
  {
    setup = PREFAB_CONTROL.setup
    get_levels = PREFAB_CONTROL.fine_tune_filters
  }

  options =
  {
    autodetail =
    {
      name = "autodetail"
      label=("Auto Detailing")
      choices=PREFAB_CONTROL.ON_OFF
      tooltip = "Reduces the amount of complex architecture in a map based on its size. Default is on."
      default = "on"
      priority = 102
      gap = 1
    }

    point_prob =
    {
      name = "point_prob"
      label=_("Decor")
      choices=PREFAB_CONTROL.POINT_CHOICES
      tooltip = "Decor prefabs are prefabs placed along the floors such as crates, pillars, and other decorative elements which aren't tied to walls. This directly modifies probabilities on a per-room basis, not the density for decor prefabs in any given room.\n\nNote: DEFAULT actually behaves like Mix-It-Up."
      default = "fab_default"
      priority = 101
    }

    wall_prob = -- code for this option is currently under revision
    {
      name = "wall_prob"
      label=_("Walls")
      choices=PREFAB_CONTROL.WALL_CHOICES
      tooltip = "Determines the amount plain wall prefabs. What it actually does is greatly increase the probability of Oblige's basic plain wall prefab, rather than reduce the probability of all the prefabs in the library."
      default = "fab_default"
      priority = 100
      gap = 1
    }

    --

    --[[pf_lifts =
    {
      name="pf_lifts", label=_("Lifts"), choices=PREFAB_CONTROL.ON_OFF
      tooltip="Enables or disables lift fabs. Default is on."
      default="on"
      priority = 50
    }]]

    pf_crushers =
    {
      name="pf_crushers", label=_("Crushers"), choices=PREFAB_CONTROL.ON_OFF
      tooltip="Enables or disables fabs with crushing sectors. Default is on."
      default="on"
      priority = 49
    }

    pf_dexterity =
    {
      name="pf_dexterity", label=_("Dexterity Fabs"), choices=PREFAB_CONTROL.ON_OFF
      tooltip="Enables or disables fabs featuring Chasm-ish navigation. Default is on."
      default="on"
      priority = 48
    }

    --[[pf_jump =
    {
      name="pf_jump", label=_("Jumps"), choices=PREFAB_CONTROL.ON_OFF
      tooltip="Enables or disables fabs absolutely requiring jumping to traverse. Default is on."
      default="on"
      priority = 47
    }]]

    pf_gamble =
    {
      name="pf_dexterity", label=_("Gambling Fabs"), choices=PREFAB_CONTROL.ON_OFF
      tooltip="Enables or disables fabs that may lockout a player on items. Default is on."
      default="on"
      priority = 46
    }

    pf_sight_ambushes =
    {
      name="pf_sight_ambushes", label=_("Sight Ambush Cages"), choices=PREFAB_CONTROL.ON_OFF
      tooltip="Enables or disables cages that unleash its monsters when player is in sight. " ..
      "Default is on."
      default="on"
      priority = 45
      gap = 1
    }

    --

    fab_match_theme =
    {
      name = "fab_match_theme"
      label=("Match Theme")
      choices=PREFAB_CONTROL.ON_OFF
      tooltip = "Ensures that prefabs selected match their intended Theme."
      default = "on"
      priority = 1
    }
  }
}
