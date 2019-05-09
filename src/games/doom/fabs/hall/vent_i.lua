--
-- vent piece : straight
--

PREFABS.Hallway_vent_i1 =
{
  file   = "hall/vent_i.wad"
  map    = "MAP01"

  group  = "vent"
  prob   = 50

  where  = "seeds"
  shape  = "I"
}

PREFABS.Hallway_vent_i_rise =
{
  template = "Hallway_vent_i1"
  map = "MAP02"

  prob = 15

  style = "steepness"

  delta_h = 64

  can_flip = true
}

PREFABS.Hallway_vent_i_EPIC =
{
  template = "Hallway_vent_i1"
  map = "MAP03"

  prob = 15

  theme = "!hell"

  uses_epic_textures = true
}

PREFABS.Hallway_vent_i_lights =
{
  template = "Hallway_vent_i1"
  map = "MAP03"

  prob = 15

  flat_FAN1 =
  {
    CEIL1_2 = 50
  }

  tex_WARNSTEP =
  {
    STEP3 = 50
  }
}
