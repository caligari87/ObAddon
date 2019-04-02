------------------------------------------------------------------------
--  MODULE: FIREBLU Mode
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
------------------------------------------------------------------------

FIREBLU_MODE = {}

function FIREBLU_MODE.setup(self)
  PARAM.fireblu_mode = true
end

OB_MODULES["fireblu_mode"] =
{
  label = _("FIREBLU Mode")

  side = "left"
  priority = 65

  hooks =
  {
    setup = FIREBLU_MODE.setup
  }

  tooltip=_(
    "Allows the creation of the greatest maps to ever be generated on " ..
    "on the face of the earth. Warning: ticking this waives any " ..
    "liability for potential emotional and physical damage on the " ..
    "part of the user. \n")

}

