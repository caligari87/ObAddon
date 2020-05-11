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

PREFAB_CONTROL.CHOICES =
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

PREFAB_CONTROL.DETAIL_CHOICES =
{
  "on",  _("On"),
  "off", _("Off"),
}

function PREFAB_CONTROL.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
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
  }

  options =
  {
    autodetail =
    {
      name = "autodetail"
      label=("Auto Detailing")
      choices=PREFAB_CONTROL.DETAIL_CHOICES
      tooltip = "Forces Walls to be 'Less' if a map is Extreme-sized, in order to reduce linedef overflow and BSP leakage."
      default = "on"
      priority = 4
      gap = 1
    }

    point_prob =
    {
      name = "point_prob"
      label=_("Decor")
      choices=PREFAB_CONTROL.POINT_CHOICES
      tooltip = "Decor prefabs are prefabs placed along the floors such as crates, pillars, and other decorative elements which aren't tied to walls. This directly modifies probabilities on a per-room basis, not the density for decor prefabs in any given room.\n\nNote: DEFAULT actually behaves like Mix-It-Up."
      default = "fab_default"
      priority = 3
    }

    wall_prob =
    {
      name = "wall_prob"
      label=_("Walls")
      choices=PREFAB_CONTROL.CHOICES
      tooltip = "Determines the amount plain wall prefabs. What it actually does is greatly increase the probability of Oblige's basic plain wall prefab, rather than reduce the probability of all the prefabs in the library."
      default = "fab_default"
      priority = 2
      gap = 1
    }

    match_theme =
    {
      name = "match_theme"
      label=("Match Theme")
      choices=PREFAB_CONTROL.DETAIL_CHOICES
      tooltip = "Ensures that prefabs selected match their intended Theme."
      default = "on"
      priority = 1
    }
  }
}
