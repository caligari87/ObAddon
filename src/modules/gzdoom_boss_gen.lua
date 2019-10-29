BOSS_GEN_TUNE = {}

BOSS_GEN_TUNE.BOSS_DIFF_CHOICES =
{
  "easier",    _("Easier"),
  "default", _("Moderate"),
  "harder", _("Harder"),
  "nightmare", _("Nightmare"),
}

BOSS_GEN_TUNE.BOSS_HEALTH_CHOICES =
{
  "muchless", _("Reduced by 50%"),
  "less", _("Reduced by 25%"),
  "default",  _("Default"),
  "more",  _("Increased by 50%"),
  "muchmore",  _("Increased by 100%"),
}

BOSS_GEN_TUNE.BOSS_HEALTH_BAR =
{
  "yes", _("Yes"),
  "no",  _("No"),
}

BOSS_GEN_TUNE.BOSS_MUSIC =
{
  "yes", _("Yes"),
  "no",  _("No"),
}




function BOSS_GEN_TUNE.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

--[[OB_MODULES["gzdoom_boss_gen"] =
{
  label = _("GZDoom Boss Generator")

  side = "right"
  priority = 92

  hooks =
  {
    setup = BOSS_GEN_TUNE.setup
  }

  tooltip=_(
    "[Very WIP]This module replaces procedural gotchas with boss fight arenas.")

  options =
  {
    boss_gen_diff =
    {
      name="boss_gen_diff",
      label=_("Difficulty"),
      choices=BOSS_GEN_TUNE.BOSS_DIFF_CHOICES,
      default="default",
      tooltip = "Increases or reduces chances of boss being based off more powerful monster and getting more powerful traits.",
    }

    boss_gen_health =
    {
      name="boss_gen_health",
      label=_("Health modifier"),
      choices=BOSS_GEN_TUNE.BOSS_HEALTH_CHOICES,
      default = "default",
      tooltip = "Makes boss health higher or lower than default, useful when playing with mods that have different average power level of weapons",
    }

    boss_gen_hpbar =
    {
      name="boss_gen_hpbar",
      label=_("Visible Health Bar"),
      choices=BOSS_GEN_TUNE.BOSS_HEALTH_BAR,
      default = "yes",
      tooltip = "If enabled, an hp bar will appear on UI while boss is active."
    }

    boss_gen_music =
    {
      name = "boss_gen_music",
      label=_("Force Boss Fight"),
      choices=BOSS_GEN_TUNE.BOSS_MUSIC,
      default = "yes",
      tooltip = "If enabled, encountering a boss will start boss theme music.",
    }

  }

}
]]