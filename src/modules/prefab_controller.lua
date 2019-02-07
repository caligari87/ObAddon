------------------------------------------------------------------------
--  MODULE: prefab spawn quantity controller
------------------------------------------------------------------------

PREFAB_CONTROL = { }

PREFAB_CONTROL.CHOICES =
{
  "fab_default", _("DEFAULT"),
  "fab_some", _("Some"),
  "fab_less", _("Less"),
  "fab_few", _("Few"),
  "fab_rare", _("Rare"),
  "fab_random", _("Mix It Up"),
}

function PREFAB_CONTROL.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

function PREFAB_CONTROL.modify_prob()

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
    get_levels = PREFAB_CONTROL.modify_prob
  }

  options =
  {
    --[[point_prob =
    {
      name = "point_prob"
      label=_("Points")
      choices=PREFAB_CONTROL.CHOICES
      tooltip = "Point prefabs are prefabs placed along the floors such as crates, pillars, and other decorative elements which aren't tied to walls. What this does is actually increase the chances of Oblige picking a dummy empty prefab in place of an actual prefab rather than modify placement code."
      default = "fab_default"
    }]]

    wall_prob =
    {
      name = "wall_prob"
      label=_("Walls")
      choices=PREFAB_CONTROL.CHOICES
      tooltip = "Determines the amount plain wall prefabs. What it actually does is greatly increase the probability of Oblige's basic plain wall prefab, rather than reduce the probability of all the prefabs in the library."
      default = "fab_default"
    }
  }
}
