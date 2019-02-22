------------------------------------------------------------------------
--  PANEL: Monsters
------------------------------------------------------------------------
--
--  Copyright (C) 2016-2017 Andrew Apted
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

UI_MONS = { }

UI_MONS.QUANTITIES =
{
    "none",   _("[0] NONE"),
    "rarest", _("[0.1] Scarce"),
    "rarer",  _("[0.35] Few"),
    "rare",   _("[0.7] Less"),
    "scarce", _("[1.0] id software"),
    "few",    _("[1.3] Evilution"),
    "less",   _("[1.5] Plutonia"),
    "normal", _("[2.0] Valiant"),
    "more",   _("[2.5] Ancient Aliens"),
    "heaps",  _("[3.0] Sunlust"),
    "nuts",   _("[4.0] Combat Shock 2"),
    "nutser", _("[6.66] Sunder"),
    "mixed",  _("Mix It Up"),
}

UI_MONS.MIX_QUANTITIES =
{
    "rarest", _("[0.1] Scarce"),
    "rarer",  _("[0.35] Few"),
    "rare",   _("[0.7] Less"),
    "scarce", _("[1.0] id software"),
    "few",    _("[1.3] Evilution"),
    "less",   _("[1.5] Plutonia"),
    "normal", _("[2.0] Valiant"),
    "more",   _("[2.5] Ancient Aliens"),
    "heaps",  _("[3.0] Sunlust"),
    "nuts",   _("[4.0] Combat Shock 2"),
    "nutser", _("[6.66] Sunder"),
    "mixed",  _("Mix It Up"),
}

UI_MONS.STRENGTHS =
{
  "weak",   _("[0.59] Weak"),
  "easier", _("[0.77] Easier"),
  "medium", _("[1] Normal"),
  "harder", _("[1.3] Harder"),
  "tough",  _("[1.7] Tough"),
  "crazy",  _("[12] CRAZY"),
}

UI_MONS.BOSSES =
{
  "none",   _("NONE"),
  "easier", _("Easier"),
  "medium", _("Normal"),
  "harder", _("Harder"),
}

UI_MONS.RAMPS =
{
  "slow",    _("Slow"),
  "medium",  _("Medium"),
  "fast",    _("Fast"),
  "epi",     _("Episodic"),
}

UI_MONS.TRAP_STYLE =
{
  "default",   _("DEFAULT"),
  "teleports", _("Teleports Only"),
  "closets",   _("Closets Only"),
  "20",        _("20% Closets - 80% Teleports"),
  "40",        _("40% Closets - 60% Teleports"),
  "60",        _("60% Closets - 40% Teleports"),
  "80",        _("80% Closets - 20% Teleports"),
}

UI_MONS.TRAP_STRENGTH =
{
  "weaker",   _("Weaker"),
  "normal",   _("Normal"),
  "stronger", _("Stronger"),
  "mixed",    _("Mix It Up"),
}

UI_MONS.SECRET_MONSTERS =
{
  "yesyes", _("Yes - Full Strength"),
  "yes", _("Yes - Weak"),
  "no",  _("No"),
}

UI_MONS.START_ROOM_MON_CHOICES =
{
  "default", _("DEFAULT"),
  "none",    _("NONE"),
}

OB_MODULES["ui_mons"] =
{
  label = _("Monsters")

  side = "right"
  priority = 102

  options =
  {
    {
      name="mons",
      label=_("Quantity"),
      choices=UI_MONS.QUANTITIES,
      tooltip="For reference: Oblige 7.x's default for normal is 1.0",
      default="scarce",
      gap = 1
    }

    {
      name="mix_it_up_upper_range",
      label=_("Mixed Upper Range"),
      choices=UI_MONS.MIX_QUANTITIES,
      defualt="scarce",
      tooltip="If you have Mix It Up selected, you can define the upper bound here. Otherwise, this option is simply ignored."
    }

    {
      name="mix_it_up_lower_range",
      label=_("Mixed Lower Range"),
      choices=UI_MONS.MIX_QUANTITIES,
      default="nuts",
      tooltip="If you have Mix It Up selected, you can define the lower bound here. Otherwise, this option is simply ignored."
      gap = 1
    }

    { name="strength",  label=_("Strength"),  choices=UI_MONS.STRENGTHS}
    { name="ramp_up",   label=_("Ramp Up"),   choices=UI_MONS.RAMPS,  gap=1 }

    { name="bosses",    label=_("Bosses"),    choices=UI_MONS.BOSSES }
    { name="traps",     label=_("Traps"),     choices=STYLE_CHOICES }
    {
      name="trap_style",
      label=_("Trap Style"),
      choices=UI_MONS.TRAP_STYLE,
      default="default",
      tooltip="This option selects between using only teleport or closet traps. DEFAULT means both are used.",
    }
    {
      name="trap_strength",
      label=_("Trap Monsters"),
      choices=UI_MONS.TRAP_STRENGTH,
      default="normal",
      tooltip="Changes the quantity of ambushing monsters from traps.",
      gap=1
    }
    { name="cages",     label=_("Cages"),     choices=STYLE_CHOICES,  gap=1 }

    {
      name="secret_monsters",
      label=_("Monsters in Secrets"),
      choices=UI_MONS.SECRET_MONSTERS,
      tooltip="I'm in your secret rooms, placing some monsters. Note: default is none.",
      default="no",
    }
    {
      name="start_room_mons",
      label=_("Monsters in Start"),
      choices=UI_MONS.START_ROOM_MON_CHOICES,
      tooltip="I'm in your start rooms, placing some monsters. Note: Oblige normally spawns weak monsters in the start room.",
      default="default",
    }
  }
}

