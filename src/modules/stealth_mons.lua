----------------------------------------------------------------
--  MODULE: Stealth Monsters
----------------------------------------------------------------
--
--  Copyright (C) 2009 Enhas
--  Copyright (C) 2009 Andrew Apted
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
----------------------------------------------------------------

STEALTH = { }

STEALTH.MONSTERS =
{
  -- These are mostly the same as the ones in doom.lua,
  -- but with some different crazy_prob values.

  stealth_zombie =
  {
    id = 9061
    r = 20
    h = 56
    replaces = "zombie"
    replace_prob = 30
    crazy_prob = 5
    health = 20
    damage = 4
    attack = "hitscan"
    give = { {ammo="bullet",count=5} }
    density = 1.5
    invis = true
  }

  stealth_shooter =
  {
    id = 9060
    r = 20
    h = 56
    replaces = "shooter"
    replace_prob = 20
    crazy_prob = 11
    health = 30
    damage = 10
    attack = "hitscan"
    give = { {weapon="shotty"}, {ammo="shell",count=4} }
    invis = true
  }

  stealth_imp =
  {
    id = 9057
    r = 20
    h = 56
    replaces = "imp"
    replace_prob = 40
    crazy_prob = 25
    health = 60
    damage = 20
    attack = "missile"
    invis = true
  }

  stealth_demon =
  {
    id = 9055
    r = 30
    h = 56
    replaces = "demon"
    replace_prob = 40
    crazy_prob = 30
    health = 150
    damage = 25
    attack = "melee"
    invis = true
  }

  stealth_caco =
  {
    id = 9053
    r = 31
    h = 56
    replaces = "caco"
    replace_prob = 25
    crazy_prob = 41
    health = 400
    damage = 35
    attack = "missile"
    density = 0.5
    float = true
    invis = true
  }

  stealth_baron =
  {
    id = 9052
    r = 24
    h = 64
    replaces = "baron"
    replace_prob = 20
    crazy_prob = 10
    health = 1000
    damage = 45
    attack = "missile"
    density = 0.5
    invis = true
  }

  stealth_gunner =
  {
    id = 9054
    r = 20
    h = 56
    replaces = "gunner"
    replace_prob = 20
    crazy_prob = 21
    health = 70
    damage = 50
    attack = "hitscan"
    give = { {weapon="chain"}, {ammo="bullet",count=10} }
    invis = true
  }

  stealth_revenant =
  {
    id = 9059
    r = 20
    h = 64
    replaces = "revenant"
    replace_prob = 30
    crazy_prob = 40
    health = 300
    damage = 70
    attack = "missile"
    density = 0.6
    invis = true
  }

  stealth_knight =
  {
    id = 9056
    r = 24
    h = 64
    replaces = "knight"
    replace_prob = 25
    crazy_prob = 11
    health = 500
    damage = 45
    attack = "missile"
    density = 0.7
    invis = true
  }

  stealth_mancubus =
  {
    id = 9058
    r = 48
    h = 64
    replaces = "mancubus"
    replace_prob = 25
    crazy_prob = 31
    health = 600
    damage = 70
    attack = "missile"
    density = 0.6
    invis = true
  }

  stealth_arach =
  {
    id = 9050
    r = 66
    h = 64
    replaces = "arach"
    replace_prob = 25
    crazy_prob = 11
    health = 500
    damage = 70
    attack = "missile"
    density = 0.8
    invis = true
  }

  stealth_vile =
  {
    id = 9051
    r = 20
    h = 56
    replaces = "vile"
    replace_prob = 10
    crazy_prob = 5
    health = 700
    damage = 40
    attack = "hitscan"
    density = 0.2
    nasty = true
    invis = true
  }
}


STEALTH.EDGE_IDS =
{
  stealth_arach    = 4050
  stealth_vile     = 4051
  stealth_baron    = 4052
  stealth_caco     = 4053
  stealth_gunner   = 4054
  stealth_demon    = 4055
  stealth_knight   = 4056
  stealth_imp      = 4057
  stealth_mancubus = 4058
  stealth_revenant = 4059
  stealth_shooter  = 4060
  stealth_zombie   = 4061
}


STEALTH.CHOICES =
{
  "normal", _("Normal"),
  "less",   _("Less"),
  "more",   _("More"),
}


function STEALTH.setup(self)
  -- apply the Quantity choice
  local qty = self.options.qty.value

  for name,_ in pairs(STEALTH.MONSTERS) do
    local M = GAME.MONSTERS[name]

    if M and qty == "less" then
      M.replace_prob = M.replace_prob / 2
      M.crazy_prob = M.crazy_prob / 3
    end

    if M and qty == "more" then
      M.replace_prob = math.max(80, M.replace_prob * 2)
      M.crazy_prob = M.crazy_prob * 3
    end

    -- EDGE uses different id numbers -- fix them
    if M and OB_CONFIG.game == "edge" then
      M.id = EDGE_IDS[name]
    end
  end
end


OB_MODULES["stealth_mons"] =
{
  label = _("Stealth Monsters")

  game = "doomish"

  engine = { edge=1, zdoom=1, gzdoom=1, skulltag=1 }

  tables =
  {
    STEALTH
  }

  hooks =
  {
    setup = STEALTH.setup
  }

  options =
  {
    qty =
    {
      label = _("Default Quantity")
      choices = STEALTH.CHOICES
    }
  }
}


----------------------------------------------------------------


STEALTH.CONTROL_CHOICES =
{
  "default", _("DEFAULT"),
  "none",    _("None at all"),
  "scarce",  _("Scarce"),
  "less",    _("Less"),
  "plenty",  _("Plenty"),
  "more",    _("More"),
  "heaps",   _("Heaps"),
  "insane",  _("INSANE"),
}

STEALTH.CONTROL_PROBS =
{
  none   = 0
  scarce = 2
  less   = 15
  plenty = 50
  more   = 120
  heaps  = 300
  insane = 2000
}


function STEALTH.control_setup(self)
  for name,opt in pairs(self.options) do
    local M = GAME.MONSTERS[name]

    if M and opt.value != "default" then
      local prob = STEALTH.CONTROL_PROBS[opt.value]

      M.replaces = nil
      M.prob = prob
      M.crazy_prob = prob

      if prob > 80 then M.density = 1.0 end
    end
  end -- for opt
end


OB_MODULES["stealth_mon_control"] =
{
  label = _("Stealth Monsters : Control")

  module = "stealth_mons"

  hooks =
  {
    setup = STEALTH.control_setup
  }

  options =
  {
    stealth_zombie   = { label=_("Zombieman"),     choices=STEALTH.CONTROL_CHOICES }
    stealth_shooter  = { label=_("Shotgun Guy"),   choices=STEALTH.CONTROL_CHOICES }
    stealth_imp      = { label=_("Imp"),           choices=STEALTH.CONTROL_CHOICES }
    stealth_demon    = { label=_("Demon"),         choices=STEALTH.CONTROL_CHOICES }
    stealth_caco     = { label=_("Cacodemon"),     choices=STEALTH.CONTROL_CHOICES }
    stealth_baron    = { label=_("Baron of Hell"), choices=STEALTH.CONTROL_CHOICES }

    stealth_gunner   = { label=_("Chaingunner"),   choices=STEALTH.CONTROL_CHOICES }
    stealth_knight   = { label=_("Hell Knight"),   choices=STEALTH.CONTROL_CHOICES }
    stealth_revenant = { label=_("Revenant"),      choices=STEALTH.CONTROL_CHOICES }
    stealth_mancubus = { label=_("Mancubus"),      choices=STEALTH.CONTROL_CHOICES }
    stealth_arach    = { label=_("Arachnotron"),   choices=STEALTH.CONTROL_CHOICES }
    stealth_vile     = { label=_("Arch-vile"),     choices=STEALTH.CONTROL_CHOICES }
  }
}

