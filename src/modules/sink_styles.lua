------------------------------------------------------------------------
--  MODULE: sink style
------------------------------------------------------------------------

SINK_STYLE = { }

SINK_STYLE.CHOICES =
{
  "sink_style_curve", _("Curved"),
  "sink_style_sharp", _("Sharp"),
}

function SINK_STYLE.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end
end

----------------------------------------------------------------

OB_MODULES["sink_style"] =
{
  label = _("Floor/Ceiling Styler")

  side = "left"
  priority = 93

  game = "doomish"

  hooks =
  {
    setup = SINK_STYLE.setup
  }

  options =
  {
    corner_style =
    {
      name = "corner_style"
      label=_("Corner Style")
      choices=SINK_STYLE.CHOICES
      tooltip = "Determines the corner style Oblige uses when rendering sunken ceilings and floors. Default is Curved, where Oblige makes sink corners soft, while Sharp leaves the corners angular."
      default = "sink_style_curve"
    }
  }
}
