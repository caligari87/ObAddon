----------------------------------------------------------------
--  ZDoom Ambient Sound Definitions
----------------------------------------------------------------
--
--  Copyright (C) 2019 MsrSgtShooterPerson
--  Copyright (C) 2019 Frozsoul
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
-------------------------------------------------------------------

ZDOOM_SOUND_DEFS =
{

-- Ambient sounds for outdoors
Outdoors_Tech =             { lump = "TECHAMB",   flags = "$limit TECHAMB 1"  }
Outdoors_Urban_Rainforest = { lump = "RAINAMB",   flags = "$limit RAINAMB 1"  }
Outdoors_Arctic_Wind =      { lump = "ARCTIC",    flags = "$limit ARCTIC 1"   }
Outdoors_Desert_Wind =      { lump = "DESERT",    flags = "$limit DESERT 1"   }
Outdoors_Street =           { lump = "STREETAM",  flags = "$limit STREETAM 1" }

-- Ambient sound for Theme
Hell =                      { lump = "HELLAMB",   flags = "$limit HELLAMB 1"  }

-- Ambient sounds for specific prefabs
Bathroom_Fan =        {  lump = "BATHFAN"   }
Computer_Station =    {  lump = "COMPSTN"   }
Indoor_Fan =          {  lump = "FANSND"    }
Machine_Air =         {  lump = "MACHNAIR"  }
Machine_Ventilation = {  lump = "MACHVENT"  }
Demonic_Teleporter =  {  lump = "SKLLCHNT"  }
Electric_Sparks =     {  lump = "SPARKING"  }
Static_Monitor =      {  lump = "STATIC"    }
Toilet_Running =      {  lump = "TOILETRN"  }
Vending_Machine_Hum = {  lump = "VENDHUM"   }
Water_Draining =      {  lump = "WATDRAIN"  }
Water_Streaming =     {  lump = "WATSTRM"   }
Water_Tank =          {  lump = "WATTANK"   }
Waterfall_Rush =      {  lump = "WATFALL"   }

}

ZDOOM_SOUNDSCAPES =
{
  tech =
  {
    building = {
    }
    outdoor = {
      Outdoors_Tech = 50
    }
    cave = {
    }
    park = {
      Outdoors_Urban_Rainforest = 50      
    }
    street = {
      Outdoors_Street = 50
    }
  }

  urban =
  {
    building = {
    }
    outdoor = {
      Outdoors_Urban_Rainforest = 50
    }
    caves = {
    }
    park = {
      Outdoors_Urban_Rainforest = 50      
    }
    street = {
      Outdoors_Street = 50
    }
  }

  hell =
  {
    building = {
      Hell = 50
    }
    outdoor = {
      Hell = 50      
    }
    cave = {
      Hell = 50      
    }
    park = {
      Hell = 50      
    }
    street = {
      Hell = 50      
    }
  }
  
}
