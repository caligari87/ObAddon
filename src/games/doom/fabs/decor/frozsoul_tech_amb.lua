PREFABS.Decor_Frozsoul_Tech_Ambience_Outdoor_Temperate =
{
  file   = "decor/frozsoul_tech_amb.wad"
  map    = "MAP01"

  prob   		= 99999
  rank   		= 1
  env    		= "outdoor"
  outdoor_theme = "temperate"
  theme  		= "tech"
  
  --can_be_on_roads = false  

  where  = "point"
  size   = 12	--64
  height = 12	--64
  
  bound_z1 = 0
}

PREFABS.Decor_Frozsoul_Tech_Ambience_Park_Temperate =
{
  template 	= "Decor_Frozsoul_Tech_Ambience_Outdoor_Temperate"
  env		= "park"
}

PREFABS.Decor_Frozsoul_Tech_Ambience_Outdoor_Snow =
{
  file   = "decor/frozsoul_tech_amb.wad"
  map    = "MAP02"

  prob   = 99999
  rank   = 1
  env    = "outdoor"
  outdoor_theme = "snow"  
  theme  = "tech"

  --can_be_on_roads = false

  where  = "point"
  size   = 12	--64
  height = 12	--64
  
  bound_z1 = 0
}

PREFABS.Decor_Frozsoul_Tech_Ambience_Park_Snow =
{
  template = "Decor_Frozsoul_Tech_Ambience_Outdoor_Snow"
  env 	= "park"
}

PREFABS.Decor_Frozsoul_Tech_Ambience_Outdoor_Desert =
{
  file   = "decor/frozsoul_tech_amb.wad"
  map    = "MAP03"

  prob   = 99999
  rank   = 1
  env    = "outdoor"
  outdoor_theme = "desert"  
  theme  = "tech"

  --can_be_on_roads = false

  where  = "point"
  size   = 12	--64
  height = 12	--64
  
  bound_z1 = 0
}

PREFABS.Decor_Frozsoul_Tech_Ambience_Park_Desert =
{
  template = "Decor_Frozsoul_Tech_Ambience_Outdoor_Desert"
  env 	= "park"
}