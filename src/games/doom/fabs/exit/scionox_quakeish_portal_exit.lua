-- quake-inspired exit portal

PREFABS.Exit_scionox_quakeish_portal_exit =
{
  file   = "exit/scionox_quakeish_portal_exit.wad"
  map    = "MAP01"

  prob   = 200

  theme = "urban"
  game  = "zdoom"

  where  = "seeds"

  uses_epic_textures = true

  seed_w = 2
  seed_h = 2

  deep   = 16

  x_fit  = "frame"
  y_fit  = "top"
}
PREFABS.Exit_scionox_quakeish_portal_exit_2 =
{
  template = "Exit_scionox_quakeish_portal_exit"
  theme = "hell"
  thing_85 =
  {
    skull_pole = 50
    skull_kebab = 50
    evil_eye   = 50
    impaled_human = 50
    impaled_twitch = 50
	skull_cairn = 50
	skull_rock = 50
  }
}
PREFABS.Exit_scionox_quakeish_portal_exit_3 =
{
  template = "Exit_scionox_quakeish_portal_exit"
  theme = "hell"
  map    = "MAP02"
  thing_25 =
  {
    skull_pole = 50
    skull_kebab = 50
    evil_eye   = 50
    impaled_human = 50
    impaled_twitch = 50
	skull_cairn = 50
	skull_rock = 50
  }
  thing_26 =
  {
    skull_pole = 50
    skull_kebab = 50
    evil_eye   = 50
    impaled_human = 50
    impaled_twitch = 50
	skull_cairn = 50
	skull_rock = 50
  }
  thing_27 =
  {
    skull_pole = 50
    skull_kebab = 50
    evil_eye   = 50
    impaled_human = 50
    impaled_twitch = 50
	skull_cairn = 50
	skull_rock = 50
  }
  thing_28 =
  {
    skull_pole = 50
    skull_kebab = 50
    evil_eye   = 50
    impaled_human = 50
    impaled_twitch = 50
	skull_cairn = 50
	skull_rock = 50
  }
}
