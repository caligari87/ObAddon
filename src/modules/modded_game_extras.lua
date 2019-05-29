------------------------------------------------------------------------
--  MODULE: Modded Game extras module
------------------------------------------------------------------------

MODDED_GAME_EXTRAS = { }

MODDED_GAME_EXTRAS.ENABLE_DISABLE =
{
  "enable",  _("Enable"),
  "disable", _("Disable"),
}

MODDED_GAME_EXTRAS.SCRIPT_TYPE_CHOICES =
{
  "dec",  _("DECORATE"),
  "none", _("NONE"),
}

MODDED_GAME_EXTRAS.HELLSCAPE_NAVIGATOR_TEMPLATE =
{
  BASE =
[[actor m8f_hn_AreaNameMarker_ObAddon : Actor
{
  +NOBLOCKMAP
  +NOGRAVITY
  +DONTSPLASH
  +NOTONAUTOMAP
  +DONTTHRUST
}

]]

  COPIES =
[[actor m8f_hn_AreaNameMarker_NUMNUMNUM : m8f_hn_AreaNameMarker_ObAddon NUMNUMNUM
{
  Tag "NAMENAMENAME"
  Health SIZESIZESIZE
}

]]

}

function MODDED_GAME_EXTRAS.setup(self)
  for name,opt in pairs(self.options) do
    local value = self.options[name].value
    PARAM[name] = value
  end

  if PARAM.hn_markers != "none" then
    MODDED_GAME_EXTRAS.init_hn_info()
  end
end

function MODDED_GAME_EXTRAS.init_hn_info()
  HN_INFO_TABLE = {}

  PARAM.hn_thing_start_offset = 15000
end

function MODDED_GAME_EXTRAS.create_hn_info()

  if PARAM.hn_markers == "none" or not PARAM.hn_markers then
    return
  end

  gui.printf("--== Hellscape Navigator Support ==--\n\n")

  -- function to find the best place to put the HN marker on in
  local function find_closest_seed_to_center(R)
    local cx = (R.sx1 + R.sx2) / 2
    local cy = (R.sy1 + R.sy2) / 2

    local seed_list = {}
    each A in R.areas do
      if A.mode != "chunk" then
        each S in A.seeds do

          -- skip this area if it's a closet or a joiner
          -- want to make sure the entity gets placed... somewhere.
          if S.area.chunk then
            if S.area.chunk.kind == "closet"
            or S.area.chunk.kind == "joiner" then
              continue
            end
          end

          S.distance_from_room_center = geom.dist(cx, cy, S.sx, S.sy)
          table.insert(seed_list, S)
        end
      end
    end

    table.sort(seed_list, function(A,B)
    return A.distance_from_room_center < B.distance_from_room_center end)

    return seed_list[1]
  end

  -- generate information for the HN marker
  local function make_room_info(R)
    local info = {}

    info.name = Naming_grab_one(LEVEL.name_class)
    info.editor_num = PARAM.hn_thing_start_offset
    info.cx = ((R.sx1 + R.sx2) / 2) * SEED_SIZE
    info.cy = ((R.sy1 + R.sy2) / 2) * SEED_SIZE

    local x_span = (R.sx2 - R.sx1) * SEED_SIZE
    local y_span = (R.sy2 - R.sy1) * SEED_SIZE

    info.radius = (x_span + y_span)/2
    info.env = R:get_env()

    PARAM.hn_thing_start_offset = PARAM.hn_thing_start_offset + 1

    local prefered_S = find_closest_seed_to_center(R)
    if not prefered_S then
      gui.printf("WTF man where do I put the HN marker here??!?!! " ..
      "WHERE MAN?!?! WHGEREREE???!!!!\n")
      return
    end

    table.insert(HN_INFO_TABLE, info)

    hn_marker = {
      x = prefered_S.mid_x
      y = prefered_S.mid_y
      z = prefered_S.area.ceil_h
      id = info.editor_num
    }

    gui.printf("ROOM_" .. R.id .. " name: " .. info.name .. "\n")

    raw_add_entity(hn_marker)
  end

  --== Hellscape Navigator init ==--
  --[[each Z in LEVEL.zones do
    gui.printf(table.tostr(Z) .. "\n")
  end]]

  each R in LEVEL.rooms do
    make_room_info(R)
  end
end

function MODDED_GAME_EXTRAS.generate_hn_decorate()

  if PARAM.hn_markers == "none" or not PARAM.hn_markers then
    return
  end

  local decorate_string = MODDED_GAME_EXTRAS.HELLSCAPE_NAVIGATOR_TEMPLATE.BASE
  local decorate_lines = {}

  -- create decorate file!
  each I in HN_INFO_TABLE do
    local name = I.name
    local editor_num = I.editor_num
    local radius = I.radius

    local thing_chunk = MODDED_GAME_EXTRAS.HELLSCAPE_NAVIGATOR_TEMPLATE.COPIES
    thing_chunk = string.gsub(thing_chunk, "NUMNUMNUM", editor_num)
    thing_chunk = string.gsub(thing_chunk, "NAMENAMENAME", "Current Area: " .. name)
    thing_chunk = string.gsub(thing_chunk, "SIZESIZESIZE", radius)

    decorate_string = decorate_string .. thing_chunk
  end

  for line in decorate_string:gmatch("[^\r\n]+") do
    table.insert(decorate_lines, line .. "\n")
  end

  gui.wad_add_text_lump("DECORATE", decorate_lines)
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
    end_level = MODDED_GAME_EXTRAS.create_hn_info
    all_done = MODDED_GAME_EXTRAS.generate_hn_decorate
  }

  tooltip = "Offers extra features and expanded support for various mods."

  options =
  {
    hd_cover_walls =
    {
      name = "hd_cover_walls"
      label=_("HD Cover Walls")
      choices=MODDED_GAME_EXTRAS.ENABLE_DISABLE
      tooltip = "Adds some Hideous Destructor-specific fabs such as walls with" ..
      "cover to serve Hideous Destructor gameplay better. " ..
      "It is recommended to keep this disabled if you are not " ..
      "playing Hideous Destructor as these fabs will interfere with non-HD gameplay."
      default = "disable"
    }

    hn_markers =
    {
      name = "hn_markers"
      label=_("HN Markers")
      choices=MODDED_GAME_EXTRAS.SCRIPT_TYPE_CHOICES
      tooltip = "Adds support for m8f's Hellscape Navigator by generating " ..
      "name markers in the map per room."
      default = "none"
    }
  }
}
