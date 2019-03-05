----------------------------------------------------------------
--  MODULE: ZDoom Special Addons
----------------------------------------------------------------

gui.import("modules\zdoom_glaice_materials.lua")
gui.import("modules\zdoom_glaice_themes.lua")

ZDOOM_SPECIALS = { }

function ZDOOM_SPECIALS.setup(self)
  print("ZDoom Special Addons module activated.")
end

function ZDOOM_SPECIALS.put_new_materials()
  local garbage_bytes = {0}
  gui.wad_add_binary_lump("TX_START",garbage_bytes)
  gui.wad_merge_sections("games/doom/data/Oblige_Epic_Texture_Set_V620.wad")
  gui.wad_add_binary_lump("TX_END",garbage_bytes)

  for skin,defs in pairs(GLAICE.MATERIALS) do
    DOOM.MATERIALS[skin] = defs
  end

  for room_theme,defs in pairs(GLAICE.THEMES) do
    DOOM.ROOM_THEMES[room_theme] = defs
  end
end

function ZDOOM_SPECIALS.do_special_stuff()

  local fog_color

  local level_count = #GAME.levels

  print("There are " .. level_count .. " levels in this WAD!!!!! DOOD")

  local function pick_sky_color_from_skygen_map(skytable, cur_level)
    local color

    local skyname = skytable[cur_level]

    if skyname == "SKY_CLOUDS" then
      color = "#c0dde0"
    elseif skyname == "BLUE_CLOUDS" then
      color = "#7999c6"
    elseif skyname == "WHITE_CLOUDS" then
      color = "#cacdce"
    elseif skyname == "GREY_CLOUDS" then
      color = "#909496"
    elseif skyname == "DARK_CLOUDS" then
      color = "#565859"
    elseif skyname == "BROWN_CLOUDS" then
      color = "#e0a664"
    elseif skyname == "BROWNISH_CLOUDS" then
      color = "#d3b38f"
    elseif skyname == "PEACH_CLOUDS" then
      color = "#ddbed7"
    elseif skyname == "YELLOW_CLOUDS" then
      color = "#eded65"
    elseif skyname == "ORANGE_CLOUDS" then
      color = "#e0a238"
    elseif skyname == "GREEN_CLOUDS" then
      color = "#60c637"
    elseif skyname == "JADE_CLOUDS" then
      color = "#68d17d"
    elseif skyname == "DARKRED_CLOUDS" then
      color = "#bc4949"
    elseif skyname == "HELLISH_CLOUDS" then
      color = "#db7c64"
    elseif string.match( skyname,"NEBULA" ) then
      color = "#666666"
    end

    if color then
      return color
    else
      gui.printf("\nCould not resolve skybox generator color.\n")
      return "#666666"
    end
  end


  if PARAM.light_fixtures then
    for name,def in ipairs(PARAM.light_fixtures) do
      print("\n" .. table.tostr(def))
    end
  end


  if PARAM.episode_sky_color then

    print(table.tostr(PARAM.episode_sky_color))

    fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,1)
  else
    fog_color = "Black"
  end

  local function add_mapinfo(mapinfo_tab)
    -- mapinfo table requires color for fog and map number
    fog_color = mapinfo_tab.fog_color
    map_num = mapinfo_tab.map_num

    if map_num < 10
      map_id = "MAP0" .. map_num
    else
      map_id = "MAP" .. map_num
    end

    if map_num <= 11
      sky_tex = "SKY1"
    elseif map_num <= 21
      sky_tex = "SKY2"
    elseif map_num > 21
      sky_tex = "SKY3"
    end

    local mapinfo =
    {
      'map ' .. map_id .. ' lookup HUSTR_'.. map_num ..'\n'
      '{\n'
      --'  cluster = 1\n'
      '  sky1 = "' .. sky_tex .. '"\n'
      '  fade = ' .. fog_color .. '\n'
      '}\n'
      --[['cluster 1\n'
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
      '}\n']]
    }

    return mapinfo
  end

  local mapinfolump
  for i=1,i <= level_count do

    info.map_num = i

    if i <= 11 then
      info.fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,1)
    elseif i <= 21 then
      info.fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,2)
    elseif i > 21 then
      info.fog_color = pick_sky_color_from_skygen_map(PARAM.episode_sky_color,3)
    end

    mapinfolump = mapinfolump .. add_mapinfo(info)
  end

  gui.wad_add_text_lump("MAPINFO", mapinfolump)

end

--[[OB_MODULES["zdoom_specials"] =
{
  label = _("ZDoom Special Addons")

  game = "doomish"

  side = "right"

  priority = 50

  engine = { zdoom=1, gzdoom=1, skulltag=1 }

  hooks =
  {
    setup = ZDOOM_SPECIALS.setup
    get_levels = ZDOOM_SPECIALS.put_new_materials
    all_done = ZDOOM_SPECIALS.do_special_stuff
  }

  tooltip = "Warning: This addon is entirely just an experiment at the moment and doesn't do anything good. Do not enable for now, it will probably break your game."
}]]