----------------------------------------------------------------
--  MODULE: ZDoom Special Addons
----------------------------------------------------------------

ZDOOM_SPECIALS = { }

--[[function ZDOOM_SPECIALS.setup(self)
  print("ZDoom Special Addons module activated.")
end]]

function ZDOOM_SPECIALS.do_special_stuff()

  local fog_color

  local level_count = 0

  for LEV in GAME.levels do
    level_count = level_count + 1
  end



  local function pick_sky_color_from_skygen_map(skytable, cur_level)
    local color

    local skyname = skytable[cur_level]

    if skyname == "GREY_CLOUDS" then
      color = "Gray"
    elseif skyname == "DARK_CLOUDS" then
      color = "Black"
    elseif skyname == "BLUE_CLOUDS" then
      color = "Blue"
    elseif skyname == "HELL_CLOUDS" then
      color = "DarkRed"
    elseif skyname == "WHITE_CLOUDS" then
      color = "White"
    end

    if color then
      return color
    else
      gui.printf("\nCould not resolve skybox generator color.\n")
      return "Black"
    end
  end



  if PARAM.episode_sky_color then
    fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,1)
  else
    fog_color = "Black"
  end


  local mapinfolump =
  {
    'map MAP01 lookup HUSTR_1\n'
    '{\n'
    '  cluster = 1\n'
    '  sky1 = "SKY1"\n'
    '  fade = ' .. fog_color .. '\n'
    '}\n'
    'cluster 1\n'
    '{\n'
    '  entertext =\n'
    '  "If you are reading this,",\n'
    '  "it\'s because you turned on",\n'
    '  "ZDoom Specials Addon even if",\n'
    '  "it says it does nothing."\n'
    '  exittext =\n'
    '  "If you are reading this,",\n'
    '  "it\'s because you turned on",\n'
    '  "ZDoom Specials Addon even if",\n'
    '  "it says it does nothing."\n'
    '}\n'
    'GameInfo {\n'
    '  AddEventHandlers = "ObligeEvents"\n'
    '}\n'
  }

  gui.wad_add_text_lump("MAPINFO", mapinfolump)

  local zscriptlump =
  {
    'version "3.7"\n'
    '\n'
    'class ObligeEvents : EventHandler {\n'
    '  override void WorldLoaded(WorldEvent e)\n'
    '  {\n'
    '    console.printf("Hello World!");\n'
    '  }\n'
    '}\n'
  }

  gui.wad_add_text_lump("ZSCRIPT", zscriptlump)

end

OB_MODULES["zdoom_specials"] =
{
  label = _("ZDoom Special Addons")

  game = "doomish"

  side = "right"

  priority = 50

  engine = { zdoom=1, gzdoom=1, skulltag=1 }

  hooks =
  {
    setup = ZDOOM_SPECIALS.setup
    all_done = ZDOOM_SPECIALS.do_special_stuff
  }

  tooltip = "Warning: This addon is entirely just an experiment at the moment and doesn't do anything good. Do not enable for now, it will probably break your game."
}
