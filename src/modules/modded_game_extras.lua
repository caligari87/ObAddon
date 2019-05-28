------------------------------------------------------------------------
--  MODULE: Modded Game extras module
------------------------------------------------------------------------

MODDED_GAME_EXTRAS = { }

MODDED_GAME_EXTRAS.WALL_CHOICES =
{
  "enable",  _("Enable"),
  "disable", _("Disable"),
}

function MODDED_GAME_EXTRAS.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

----------------------------------------------------------------

OB_MODULES["modded_game_extras"] =
{
  label = _("Modded Game Extras")

  side = "left"
  priority = 75

  game = "doomish"

  hooks =
  {
    setup = MODDED_GAME_EXTRAS.setup
  }

  tooltip = "Offers extra features for various mods."

  options =
  {
    hd_cover_walls =
    {
      name = "hd_cover_walls"
      label=_("HD Cover Walls")
      choices=MODDED_GAME_EXTRAS.WALL_CHOICES
      tooltip = "Adds some Hideous Destructor-specific fabs such as walls with cover to serve Hideous Destructor gameplay better. It is recommended to keep this disabled if you are not playing Hideous Destructor as these fabs will interfere with non-HD gameplay."
      default = "disable"
    }
  }
}
