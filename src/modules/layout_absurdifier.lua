------------------------------------------------------------------------
--  MODULE: Layout Absurdifier
------------------------------------------------------------------------
--
--  Copyright (C) 2014-2016 Andrew Apted
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

--[[LAYOUT_ABSURDIFIER = {}

LAYOUT_ABSURDIFIER.CHOICES =
{
  "none", _("NONE"),
  "all",  _("Every Level"),
  "75",   _("75% of Levels"),
  "50",   _("50% of Levels"),
  "25",   _("25% of Levels"),
}

function LAYOUT_ABSURDIFIER.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

OB_MODULES["layout_absurdifier"] =
{
  label = _("Layout Absurdifier")

  side = "left"
  priority = 92

  engine = "boom"

  hooks =
  {
    setup = LAYOUT_ABSURDIFIER.setup
  }

  tooltip=_(
    "This is an experimental module. The layout absurdifier attempts to cause levels to overprefer specific shape rules from the ruleset in order to create odd and possibly broken but interesting combinations. Use at your own risk.")
	
  options =
  {
    layout_absurdity =
	{
	  name = "layout_absurdity"
	  label = _("Layout Absurdity")
	  choices=LAYOUT_ABSURDIFIER.CHOICES
	  default="NONE"
	  tooltip = "Affects the amount of levels have the absurdity module activated on. Selecting ALL will not necessarily make all levels absurd as it is all still based on chance."
	}
  }

}]]

