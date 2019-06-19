--
-- Various fence posts
--


PREFABS.Post_metal =
{
  file   = "fence/posts.wad"
  map    = "MAP01"
  kind   = "post"

  prob   = 50

  where  = "point"
  size   = 48

  bound_z1 = 0
}


PREFABS.Post_tech_1 =
{
  file   = "fence/posts.wad"
  map    = "MAP03"
  kind   = "post"

  group  = "foo"
  prob   = 50

  where  = "point"
  size   = 48

  bound_z1 = 0
}


PREFABS.Post_tech_2 =
{
  file   = "fence/posts.wad"
  map    = "MAP04"
  kind   = "post"

  group  = "bar"
  prob   = 50

  where  = "point"
  size   = 64
  height = 128

  bound_z1 = 0
}

PREFABS.Post_gothic_1 =
{
  template = "Post_tech_1"

  thing_86 = 46
}

PREFABS.Post_gothic_2 =
{
  template = "Post_tech_2"

  thing_85 = 57
}
