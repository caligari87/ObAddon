------------------------------------------------------------------------
--  MODULE: Hideous Destructor support module
------------------------------------------------------------------------

HD_SUPPORT = { }

HD_SUPPORT.WALL_CHOICES =
{
  "enable",  _("Enable"),
  "disable", _("Disable"),
}

function HD_SUPPORT.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

----------------------------------------------------------------

OB_MODULES["hd_support"] =
{
  label = _("Hideous Destructor Support")

  side = "left"
  priority = 75

  game = "doomish"

  hooks =
  {
    setup = HD_SUPPORT.setup
  }

  options =
  {
    hd_cover_walls =
    {
      name = "hd_cover_walls"
      label=_("Cover Walls")
      choices=HD_SUPPORT.WALL_CHOICES
      tooltip = "Adds some Hideous Destructor-specific fabs such as walls with cover to serve Hideous Destructor gameplay better. It is recommended to keep this disabled if you are not playing Hideous Destructor as these fabs will interfere with non-HD gameplay."
      default = "disable"
    }
  }
}
