----------------------------------------------------------------
--  MODULE: ZDoom Story Tables
----------------------------------------------------------------
--
--  Copyright (C) 2019 MsrSgtShooterPerson
--  Copyright (C) 2019 Glaice
--  Copyright (C) 2019 Tapwave
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

--[[
Some keywords for parsing later on:

  _SPACE = creates a linebreak

  _RAND_DEMON = name of a demonic entity
               (based on the GOTHIC entity names table)

  _RAND_ENGLISH_PLACE = name fetched directly from the Anglican
                        noun generator.

  _EVULZ = a rank title for a demonic entity based
           on the evil titles table below.

  _RAND_CONTRIBUTOR = name of a random contributor
                      (actually based on the specific
                      contributors table under TITLE)

  _RAND_GAL
  _RAND_GUY
  _RAND_HUMAN = names for a mere mortals (there is no human name generator
               yet as of 2019-04-09)

  _GOTHIC_LEVEL = name from the gothic level generator

  _MCGUFFIN_HELL
  _MCGUFFIN_TECH = returns a name of a plot McGuffin from the McGuffins
                   table below.

Notes and Tips:

* Hooks are the 'pull' of the story as per D&D terminology, a method
  of getting the characters' attention towards something. When writing
  hooks, make it as universal as possible i.e. the situation can start
  at any point of play.

* Conclusions are the resulting effect after a hook has been engaged.
  Conclusions can vary from positive, to negative, or even weird results.
  Be creative!

* For each story chunk under the STORIES table, there can be any number
  of hooks and conclusion per story.

* Hooks are placed at any point before the end of the episode
  but preferably at least in the first few maps of that episode.
  Conclusions are strictly placed at the end of each episode so
  it meshes with the climax of a boss battle or procedural gotcha.

* Don't make the stories too long! Remember, they have to fit the intermission
  screen. You can make it long enough to fill the whole screen and the
  Story Generator formatting code will try to fit the lines within
  the intermission screen as best as possible.

* Addendum: Also try to avoid extremely long words. The parser expects that
  lines will be 35 characters long to fit the constraints of the engine.
  Amount of lines is also limited.

* Doomguy doesn't care about story. But we do, we can just keep saying
  things about things he ends up doing, so be creative.

* If you are using np++, hit ALT+4 (not ALT+F4!!!) to collapse groups
  down to the story chunk pieces. This will make it easier to navigate.
]]

ZDOOM_STORIES = { }

ZDOOM_STORIES.LIST =
{
  portal_to_hell = 40
  fuck_argent_energy = 20
  rescue_scientists = 40
  reinforce_marines = 40
  attack = 50
  i_challenge_you_to_a_duel = 80
  deus_ex_machina = 6
  beacon = 50
  aa_guns = 30
  destroy_the_evil_experiment = 40
  found_this_weird_tech_mcguffin = 30
  found_this_weird_hell_mcguffin = 30
  weab = 2
  repercussions_of_evil = 2
  spaceship_crash = 25
  zero_wing = 2
  the_avenger = 40
  the_avenger_from_hell = 40
}

ZDOOM_STORIES.STORIES =
{
  portal_to_hell =
  {
    hooks =
    {
      [[It seems as though demons continue to spill into the area
      despite your best efforts. Your locator marks a massive spike
      in energy nearby. It seems the source of the demonic surge
      is in that direction...]],

      [[Hell's forces continue to lay siege upon this region. It
      is clear their numbers are being reinforced from elsewhere.
      You begin a search for the potential existence of a hell
      portal...]],

      [[You are slowly drawn to a mysterious source of energy
      as you progress and notice the continued flow of demons
      into the fray. There must be an entrance to hell nearby...]],
    }

    conclusions =
    {
      [[You have destroyed the guardian protecting a portal to hell!
      With his defeat, the portal collapses. Hell will find it more
      difficult to return to this place!]],

      [[Hell's commanders went through great efforts to guard this portal
      to hell. You slip through to find yourself in a new place, in which
      the source of the demonic invasion seems to originate from...]],

      [[It was a trap! As the demon's corpse crashes onto the floor,
      a portal to hell turns out to be underneath all along! The platform
      crumbles and throws you into its maw - you find yourself in a new place...]],
    }
  }

  fuck_argent_energy =
  {
    hooks =
    {
      [[As you continue, a quiet but distinct hum of power seems
      to permeate this area. It feels hair-raising and ominous.
      It must be Argent Energy. The source must be closed.]],

      [[Monitors flicker on and off, and occult runes and symbols
      seem to occasionally appear on them. The area seems to be
      powered by Argent Energy, the impure power source from hell.
      It must be stopped.]]
    }

    conclusions =
    {
      [[You have found a conduit through which Argent Energy
      is being transmitted through from hell! With a crash
      of your fists, the conduit is damaged beyond repair.
      The power goes out throughout the region -
      but so does the corruption hell has radiated over it.]],

      [[The generator translating hellish energies into
      electrical power has allowed the decaying force
      of Argent Energy to mutate this place. You destroy
      the generator but as it falls silent, a well of souls
      bursts open, the spirits escaping into the atmosphere!
      You are unsure of what you have done, but at least hell's
      influence is banished for now.]],
    }
  }

  rescue_scientists =
  {
    hooks =
    {
      [[Your tracker lights up and is apparently receiving a
      distress signal from a nearby location. A few UAC scientists
      seem to have barricaded themselves, surrounded by the
      demonic horde and is seeking rescue. You acknowledge
      and proceed...]],

      [[A portable terminal has revealed the position of a group
      of scientists nearby. You attempt to establish communications,
      but receive no response. The last footage from the terminal
      reveals them panicking, running from demons. You may still
      have opportunity to save them...]],

      [[Badly hysteric chatter suddenly rings off of your
      radio. It seems a group of scientists are looking for a way
      out of this place and hellspawn are on their trail.
      Unable to respond to them, you attempt to make
      your way towards their position...]],
    }

    conclusions =
    {
      [[With the defeat of the demonic host, you have freed
      the scientists from the assault! The scientists have
      sworn off any continued cooperation with UAC's experimentation
      with hell and leave through some escape pods! You remain
      as there is more to discover...]],

      [[As the final demon collapses before its feet, it utters
      a terrible laughter that echoes through the chambers.
      Behind it you discover the remains of the butchered scientists.
      Misfortune has befallen them and there is no way you
      could have reached them in time. You trudge on...]],

      [[You have found the scientists! It seems however they are
      not what they seem... one of them carries a strange artifact
      with a fiery glow through its gaps. You suddenly notice
      madness in the scientist's eyes! A burst of energy
      throws you across the floor, killing the scientist instantly!
      A surge of demonic energies herald the coming of new hellspawn!
      It looks like your task isn't over yet!]],
    }
  }

  reinforce_marines =
  {
    hooks =
    {
      [[Your radio receives a badly garbled transmission but
      you can make out a few words. "Need assistance! *ZZT*
      Surrounded! *ZZT* Running low on supplies!" The transmission
      abruptly cuts off. You hurry to track their last position.]],

      [[Your tracker reveals several green dots on the map.
      They are fleet-footed, as it seems the dots are moving
      quickly. They are marines and it seems they are in the middle
      of an engagement. They are some distance away, but you
      may still be able to reach them in time...]],

      [[As you step across the floor, you come up to a pair of dog tags
      below your boots. You pick it up and hear the distant thunder
      of gunfire. It seems a group of marines have gone through
      here some time ago. It might be a good idea to join them.]],
    }

    conclusions =
    {
      [[A mess of craters and holes now lie where demonic
      figures used to stand. The marines congratulate
      you on a swift assist and hell is held back! The marines
      extract for now, awaiting their next mission as you stay
      behind to explore further...]],

      [[As the final creature falls, it harkens to you.
      "Foolish mortal. Attracted to the sound of despair.
      Such easy trickey for a famed warrior as you."
      The demon's corpse fades into ashes.
      There is no sign of the embattled marines anywhere
      but the general of hell still lies defeated.]],

      [[The armies of hell are routed by your relentless onslaught.
      You find a badly blasted barricade and in it the corpses
      of the marines who sacrificed themselves to battle hell.
      You pick up their dog tags in respect and scurry on...]],
    }
  }

  attack =
  {
    hooks =
    {
      [[A fetid odor fills the air of this place. It seems the
      forces of hell are amassing ahead in preparation for
      an assault. It is prime opportunity to throw off their
      gathering before an attack can begin...]],

      [[A hellish infestation seems to be running amuck about
      this region. Hell's reign is expanding and their armies
      gather in numbers elsewhere. Perhaps you can get a shot
      on them first before they begin a new assault...]],

      [[A strange overgrowth of bloody viscera seems to be
      overtaking this place. Hell's infestion is interacting
      with reality to accomodate hellspawn over mortals.
      Time to change that.]],
    }

    conclusions =
    {
      [[You have destroyed the horde leader,
      _RAND_DEMON of _GOTHIC_LEVEL! The demonic
      forces scatter, unable to continue their assault! With
      this place freed, the taint of hell's energies fades with
      the retreat of the darkness.]],

      [[It was a trap! An entire batallion of hell's banners fall
      before you. It turns out you were the target all along
      but with your dexterity and wit, you have outmaneuvered
      their forces and crushed them utterly.]],

      [[With your relentless barrage upon the hellspawn, their
      numbers shrink but you have a feeling this was not the bulk
      of their force... it seems you were lured here through
      a ruse! The demonic army unleashes itself elsewhere...]],
    }
  }

  i_challenge_you_to_a_duel =
  {
    hooks =
    {
      -- the visage of fire
      [[A deep harrowing wail suddenly resounds through the halls.
      A visage of fire manifests before you and speaks in a monstrous tone:
      "Pitiful mortal. You think you can defeat me,
      _RAND_DEMON the Lord of _GOTHIC_LEVEL?
      Come to me and meet your fate. I shall demonstrate
      the powers of the underworld to you."]],

      -- the wall shadow
      [[A strange shadow seems to creep up the walls before you.
      It shudders and shakes. A pair of searing red eyes open
      from the inky surface. It speaks:
      "I am _RAND_DEMON the King of _GOTHIC_LEVEL.
      You have entered my realm. I shall deal with you accordingly."
      The shadow fades away.]],

      -- the vengeful
      [[Strange echoes reverberate through the walls. A dark figure
      menaces you with its presence and speaks.
      "You may have defeated me before but know this, mortal.
      Perhaps once I was a lowly imp, but now I am
      _RAND_DEMON the baron of _GOTHIC_LEVEL.
      I will repay your insolence by crushing and dragging your
      entrails across the stone!"]],

      -- Hannibal totem
      [[The wind blows by with a scent of sulfur. Ahead, you spot
      something terrifying: an effigy to hell. The monument is of
      twisted human corpses, sewn together to create a totem. It
      suddenly catches a blue fire and you hear a voice.
      _SPACE
      "I am _RAND_DEMON the _EVULZ. We are legion. We do not forgive."
      The voice disappears as with the totem.]],

      -- the bounty hunter
      [["DOOMSLAYER!" a scream echoes through the halls. An
      enormous creature steps from the shadows. "I am _RAND_DEMON the
      _EVULZ. Hell has a bounty upon you. I shall claim it from your head
      and all darkness shall know me for my deed."
      Finished with its threat, _RAND_DEMON recedes into the shadows
      and awaits you in its infernal arena.]],

      -- it's all in your mind
      [[A loud scratch startles you. You look around but your tracker
      hints to no movement. A voice suddenly speaks into your mind.
      "Mortal. You have become our quarry for your intrusions upon hell.
      I, _RAND_DEMON the _EVULZ, have marked you for death. You are hunted."
      The voice disappears followed by infernal howls further ahead...]],

      -- I seeeee youuuuu
      [[You feel a crawl upon your skin. In the darkness, it feels as
      though a thousand eyes are suddenly looking upon you. A deep
      voice echoes through the chambers. "I see you, mortal. The guardians of
      _GOTHIC_LEVEL await you. I, _RAND_DEMON the _EVULZ, will personally
      see to the sealing of your fate. We will meet soon."]],

      -- eye for an eye
      [["You!" a bellowing voices beckons. You cannot trace the source, but
      its speech continues. "You have scarred me before. You do not remember
      me but soon you will. I am _RAND_DEMON the _EVULZ. I shall inflict
      pain on you as you had on me. I will tear you limb from limb."
      Your tracker indicates an energy surge some distance away. You know what
      to do.]],

      -- the poisoner
      [[Dark viscera seems to extrude from the walls and floors. Hell's corrupting
      influence has a greater grip upon this area. A porous appendage
      suddenly rises from the floor, forming the figure of a humanoid. It speaks
      in a distorted voice. "You are encroaching upon our nest, mortal. My brood
      do not take kindly to you. But I, _RAND_DEMON of _GOTHIC_LEVEL, will
      greet you with glee. Come and enter." The figure dissolves back into the viscera.]],

      -- remember Daisy
      [[You walk between rows of sticks. Impaled limbs and heads are set upon them.
      On one you see the head of a rabbit. Immediately, your blood boils.
      You realize, however, the rabbit isn't Daisy. An ethereal voice whispers to you.
      "You are a mortal of impulse after all. Still hurt over your little big-ear darling?
      Show me your fury, mortal. I am _RAND_DEMON the _EVULZ. I grant you the company
      of your little pet. In HELL." The voice fades, and you steel your fists.
      _RAND_DEMON will fall hard today.]],

      -- a beat of the drums
      [[The sickening sound of a distorted trumpet wails, followed by the thumping
      of war drums. You hear a repeating chant of what sounds like a hundred infernal voices.
      "_RAND_DEMON! _RAND_DEMON! _RAND_DEMON!" The drumbeat stops and a bolt of fire
      strikes the floor before you, causing you to fall back. Your HUD finds a
      recognizable pattern in the scorchmarks. A hell rune translating to "You die."
      Hell will have to see about that.]],

      -- the mirror
      [[You find a mirror on the wall and there is something strange about its reflection.
      You look closer and see the image swirl and form something new. In it you
      see yourself chained against a burning monolith of slate, while imps gleefully dance
      around you. A ghostly mutter breaks the silence. "Sinners all have a place in hell,
      mortal. But you. You are special. Let me, _RAND_DEMON the _EVULZ, be your ferryman
      to the underworld." You smash the mirror with your fists leaving a gaping hole
      in the wall. You have answered hell's challenge.]]
    }

    conclusions =
    {
      -- STFU
      [[A great battle has just concluded. _RAND_DEMON collapses
      before you. "No! How could this be?! The forces of hell
      are infinite and unfor-"
      _SPACE
      Its dialogue is interrupted as with the crack of your knuckles,
      you send its head flying square off its shoulders across
      the room with an uppercut. The remaining minions of hell
      shriek in fear and retreat!]],

      -- the escape
      [[As a critical hit falls upon the demon's body, _RAND_DEMON
      stutters. "This is not how it ends, mortal! I will return
      and feast upon your soul!"
      _SPACE
      The creature quickly steps into a newly opened portal behind
      and dissapates.
      _RAND_DEMON escapes your grasp, but it is scarred forever.]],

      -- they are watching
      [[As _RAND_DEMON falls, its body implodes into a cloud of
      darkness, and slowly fades. An ethereal voice speaks.
      "You have returned me to the void, mortal. Your strength
      is admirable but remember: the Dark Lords are watching you."
      The voice fades.]],

      -- the fissure
      [[_RAND_DEMON's body crashes to the floor. The ground begins
      to shake and a fissure opens, filling the room with an infernal
      red glow. _RAND_DEMON is absorbed into the fissure, and the cracks
      disappear. A foreboding voice speaks "I will return, mortal.
      The void consumes me but in my place a new demon shall stand."
      You ignore the threat. You already know that hell's bounty is
      on you and continue on.]]
    }
  }

  deus_ex_machina =
  {
    hooks =
    {
      [[The situation seems to be growing hopeless. Hell has opened
      a great rift and the tides of hell have corrupted
      this place deeply. You have no choice but to escape
      and thus attempt to breach between their gaps...]],

      [[Hell's grip upon this area seems to be tightening. Swarms
      of hellspawn rigorously continue their defense and it seems
      their numbers are unending. You decide to fight on, however
      bleak the circumstance.]],
    }
    conclusions =
    {
      [[Despite your great efforts, the forces of hell have surrounded
      you entirely! Towering beasts march over the carcasses of the
      hellspawn you have just felled. Suddenly, a bright opening
      in the skies appear.
      _SPACE
      It is _RAND_CONTRIBUTOR, one of the Contributors of ObAddon!
      A rain of plasma bolts fall from the sky, searing every beast
      around you down to ashes. _RAND_CONTRIBUTOR waves at you
      and disappears again above the clouds...]],

      [[As you down the final demon, horrifying screams and screaches
      fill the room! As you turn back, an entire horde of demons
      is charging at you! However, the opposite direction comes
      an immense orb of light! The orb shoots beams into the belly of
      each creature turning them into nothing but clouds of dust.
      _SPACE
      It's _RAND_CONTRIBUTOR, one of the Contributors of ObAddon!
      "You'll need all the help you can get." _RAND_CONTRIBUTOR
      turns back and leaves, while gesturing at you to keep up
      the good fight.]]
    }
  }

  beacon =
  {
    hooks =
    {
      [[Your tracker lights up and informs you that a beacon with a
      UAC signature has suddenly began transmitting nearby. It seems
      someone is deliberately calling your attention. The position is
      logged and you attempt to head in its direction...]],

      [[It seems a reinforcement beacon has been activated nearby.
      A group of friendly forces may be attempting to fight it out
      with the forces of hell. You begin your journey towards the
      position of the beacon...]],

      [[Your radio picks up on a mysterious signal. Parsing it through
      your tracker, you find a beacon transmitting at a military frequency.
      It likely is a point of interest so you begin your journey towards
      it accepting the potential risk.]],
    }

    conclusions =
    {
      [[After destroying the hordes, it seems you have found a cache
      of essential supplies they were attempting to keep from you.
      You help yourself to the newfound munitions. It seems there is no
      evidence as to who activated the beacon. You shut it off.]],

      [[It was a trap all along! The hell general _RAND_DEMON activated the beacon,
      expecting you to follow it. They did not, however, expect a thorough
      defeat despite their machinations. You deactivate the beacon
      so no marine after you may fall prey to it.]],

      [[You have found the beacon attached to a badly damaged cargo pod.
      You pry open the doors pocked with bullet holes and claw marks.
      Out spill a group of civilians.
      _SPACE
      "Thank you for saving us! Those creatures just appeared out of nowhere!"
      You gesture towards the exit. "Thank you for getting rid of them. We can't
      repay you with anything, but we hope you bring down more of those demons!"
      The civilians leave.]],

      [[After a great battle with the minions of hell, you find a group of fallen
      marines before you who have made a last stand, their bodies scattered around
      a crater. One of them still grips an emergency beacon tightly in their bloody hands.
      You disable the beacon and take their dog tags.
      Their sacrifices will be remembered.]],
    }
  }

  aa_guns =
  {
    hooks =
    {
      [[You hear the great roar of explosions in the distance.
      You look up the skies and see spacecraft crashing into the
      atmosphere. It seems hell has taken control of the ground defense
      systems and have turned them against humans. You must find a way
      to disable the rogue system!]],

      [[Your radio stutters open and an indirected transmission blares out
      the following instruction: "If you are hearing this, we are
      attempting to land in our target area but hostiles have taken control
      of the ground defense system! If you have means to disable it,
      this will allow friendly forces to land and push through!"]],
    }
    conclusions =
    {
      [[The great demon _RAND_DEMON of _GOTHIC_LEVEL has fallen!
      In the wake of its defeat, your tracker informs you that
      the local ground defense system has rebooted. You watch as
      civilian spacecraft rise to the skies and exit the atmosphere safely.]],

      [[The battle with _RAND_DEMON of _GOTHIC_LEVEL was difficult
      but you came out victorious nonetheless. You smash the
      defense terminal, causing it to power down. You watch as friendly dropships
      safely descend in the distance from the clouds. Hell will fight back
      but this should make your own battle easier. Hopefully.]],
    }
  }

  destroy_the_evil_experiment =
  {
    hooks =
    {
      [[This area bares the hallmarks of UAC technology. Energy signatures
      match your own equipment. It seems a wicked experiment has been left
      behind by the UAC in this area. Whatever it is, time to shut it down.]],

      [[Your computer map lights up with the words: "WARNING. You are entering
      a restricted zone. Your clearance level is insufficient for access."
      A UAC security clearance warning is an invitation for you to blow some
      doors open. You continue upon your path.]],

      [[You find the corpse of a dead UAC scientist slumped along the wall.
      There is a scorched note on his pocket. The nearly illegible writing
      spells out "kill it before it turns". It seems the UAC have left a
      surprise ahead. Time to investigate.]],
    }

    conclusions =
    {
      [[You have destroyed _RAND_DEMON the _EVULZ! The creature was an
      abominable amalgamation of technology and the demonic. You shake
      your head once again at humanity's attempt to tame hell. It is
      clear the UAC has not learned its lesson.]],

      [[With the destruction of demonic presence in the area, you find
      an experimental UAC teleporter had gone haywire, its destination
      connecting to hell. You smash the panel with your fists and the
      portal closes. The demons will have to find another way through.]],

      [[A massive manufacturing plant seems to have been retrofitted to
      produce abominations. Mechanical limbs and viscera hang from chains
      above you. You toss an explosive barrel into the machine's maw causing
      a chain of explosions that rock the building. Hell's war factory
      has been destroyed, but there are probably more...]],

      [[With the fall of the final monster, the room stills to a hush.
      You only hear the faint noise of beeps from a computer terminal.
      You find the portable terminal and archives in the system indicate
      humans had been forced to turn into demons through technological means
      here. You punch right through the monitor, effectively destroying the
      archive and leave in disgust.]],
    }
  }

  weab =
  {
    hooks =
    {
      [[Three strange creatures, each round and colored differently
      with vertical slits for eyes bounce towards you. They bob and stack upon
      each other. Suddenly, you hear a meek, feminine voice singing.
      _SPACE
      "Dango. Dango. Dango. Dango. Daikazoku."
      _SPACE
      The simple melody of phrases repeat for a while longer.
      You regain senses and the creatures disappear. What was that?]],
    }

    conclusions =
    {
      [[As hell's forces retreat, a vision enters your mind of a world
      covered in snow. The distant figure of a girl seems to emerge
      out of the fields of white. The snow slowly recedes and the gray skies
      turn blue. The girl waves at you, thanking you for being the bringer of summer
      to her world from the winter hell had heralded.
      _SPACE
      The vision dissipates. Your HUD indicates no presence of hallucinogens
      in the area.]],
    }
  }

  found_this_weird_tech_mcguffin =
  {
    hooks =
    {
      [[You stumble upon a safety deposit box marked by the UAC with various
      warning labels. This doesn't look like the kind of thing that should
      fall into the wrong hands. You pry open crate open and find
      _MCGUFFIN_TECH. You take it with you.]],

      [[Power surges and electrical fluctuations in the area is causing
      unusual behavior on your HUD. You find a panel on the wall with
      caution markings. With the right hit exacted on the lock, the panel
      swings open to reveal _MCGUFFIN_TECH. You pry it off, and the
      fluctuations stop... this might be useful elsewhere.]],

      [[You find a military cargo pod ahead. It seems to have been here
      for a while with its intentional recipients having never claimed it.
      You interface your suit to the terminal and the pod reveals _MCGUFFIN_TECH
      inside. Better for you to hold on to it than the hellspawn.]],

      [[A shot in the right place brings down a shotgun-carrying shambler of a corpse.
      It seems it has a bulging backpack. You strip the corpse of supplies and open
      the backpack to reveal the contents: _MCGUFFIN_TECH. You take it with you.]],
    }

    conclusions =
    {
      [[After a battle with the demons, it seems your path ahead is blocked by
      an enormous bulkhead gate. A receptacle on the side seems to precisely fit
      _MCGUFFIN_TECH. You insert into the slot and a steady rumbling begins to
      shake the halls. The bulkhead gate slowly rises up, granting you passage.]],

      [[In the wake of battle, you realize gunfire is coming across the room.
      You see a group of marines just fresh off of their own skirmish.
      "Whoa! It's good to see someone else! We're on a retrieval mission for
      _MCGUFFIN_TECH."
      _SPACE
      Right on time. You offer your finding. "Hell yeah! This should help
      us get out of here! Thanks!" After some short chatter and relief, you part
      with the group as your mission beckons you elsewhere...]],

      [[It seems as though the demons were attempting to breach into a small
      automated UAC firebase with a field plasma turret. The terminal indicates
      the requirement of a _MCGUFFIN_TECH for its activation. You supply it
      with the necessities. The terminal announces "Automated security system activated."
      The turret activates and begins swinging around,
      looking for hellspawn to target. Now we're talking!]],
    }
  }

  found_this_weird_hell_mcguffin =
  {
    hooks =
    {
      [[A strange altar lined with demonic effigies lies along the wall.
      It seems the creatures are worshipping the object on the pedestal.
      It's _MCGUFFIN_HELL! A relic of this sort is better off in your hands
      than hell's. You take it with you.]],

      [[Ahead is an large setup of various portable machines and terminals.
      Each display shows graphs and readings you cannot interpret. The machines
      are linked to a pedestal with _MCGUFFIN_HELL over it! You swipe the item
      off its pedestal and the displays lose their readings. UAC experiments rarely
      turn out good, you think to yourself.]],

      [[Radiant energies permeate through this place. It seems to come from
      this stone totem. It must be helping the forces of hell rally somehow.
      Atop the totem is _MCGUFFIN_HELL. You topple the totem over and pilfer
      the object. Hell won't have a use for this anymore!]],
    }

    conclusions =
    {
      [[A great demon shows itself before you. It seems any weapon is failing
      to damage the creature at all.
      "You have no chance against inferno!"
      _SPACE
      In a moment of desperation, you take out _MCGUFFIN_HELL from your backpack.
      "No, what are you doing?!" It begins emitting a wave of light. Upon
      touching the demonic creature, its body is incinerated and particles
      are sucked into the relic. The relic fades from your hands.]],

      [[It seems the minions of hell were attempting to stop you from reaching
      this place. Ahead is an ancient portal from which the demons apparently
      spilled through. A receptacle on the center seems to fit _MCGUFFIN_HELL
      precisely. You lodge it into the receptacle and the portal to hell
      collapses. Time to move on.]],

      [[The final creature falls. A whispering voice rings through the air.
      "You have something that belongs to hell. Know that we will return
      to take it from your dead hands, mortal." The voice fades. It seems
      they were after _MCGUFFIN_HELL. It's better off in your possession.]],
    }
  }

  repercussions_of_evil =
  {
    hooks =
    {
      [[Alarms blare out through the area. You find yourself standing
      among rows upon rows of corpses, human and demon alike. It seems
      a huge rampage had occured here but its instigator is unclear. You
      find a torn armor piece among the debris. The nameplate reads "John Stalvern".
      You wonder what happened and continue on.]],
    }

    conclusions =
    {
      [[Demons that have crossed the threshold have met a terrible fate
      by your hands. You wonder if there will ever be a time of peace
      after the gates of hell first opened. A strange voice in your
      head suddenly echoes a repeating phrase.
      _SPACE
      "No John, you are the demons."
      _SPACE
      You clearly aren't John-whomever. This place is clear of demonic
      presence for now and you resume your expedition against hell.]],
    }
  }

  spaceship_crash =
  {
    hooks =
    {
      [[You hear a thunderous noise from the sky. You watch in the distance
      as a burning starship descends from the clouds and crashes into
      the ground with a bright, blinding flash. The shape was difficult to tell
      but it looked like a UAC cruiser. There might still be survivors.]],

      [[The ground shakes and an eruption of loud explosions deafens you.
      As you get your grips on the situation, you see burning fragments of metal rain
      down from the skies. You take shelter nearby and watch as the fragments litter the
      floor. A large shard reads "UACS _RAND_ENGLISH_PLACE". It seems a UAC vessel
      has crash-landed nearby.]],

      [[You spot a thick column of smoke in the distance. Along the gray haze,
      you can barely make out the silhouette of what seems to be a fallen starship.
      The wreckage seems to have been there for a while. You plot a course
      towards the vessel.]],
    }

    conclusions =
    {
      [[The sound of battle dies down to only the crackling of fire and melting steel.
      You have found the remains of the crashed starship. Among the debris, you hear a
      knocking sound. You find a marine that has been pinned to the ground by a beam.
      With your strength, you help lift the beam, freeing the marine.
      _SPACE
      "I thought I was a goner there. You came just in time! I'm wounded, but I
      should be able to make my way from here." You offer him supplies but he
      refuses anything other than just a stim. You part ways.]],

      [[The last demon has been ripped off its feet and you find yourself
      within a huge field of molten metal and twisted debris. It seems these
      are the remains of the vessel you witnessed crash earlier. You attempt
      to explore further, but it seems nothing of value was left from the ship's
      destruction. You continue on...]],

      [[A hanging pile of wreckage falls upon the imps before you could act.
      It seems gravity just helped end your battle. You find yourself within
      the bowels of the crashed vessel. Amongst the wreckage is a black box.
      You interface and find a final recording: it seems the starship was
      crashed deliberately after a host of demons have boarded it. There is
      nothing else here. You continue your trek.]],
    }
  }

  zero_wing =
  {
    hooks =
    {
      [[The war between mankind and demons rages on.
      _SPACE
      It seems the demons have set you up a bomb nearby. As you narrowly jump aside
      to avoid the blast, you get a signal on your receiver.
      _SPACE
      It's _RAND_DEMON!!
      _SPACE
      "How are you, mortal? All of your bases are now belong to us." It growls with
      malicious laughter. "All of Humanity is on the way to destruction. You have
      no chance to survive this battle, so enjoy the little time you have left.
      Ha ha ha ha ha..."
      _SPACE
      You know what to do. Time to move and strike back, for great justice.]],
    }

    conclusions =
    {
      [[Congratulations!!
      _SPACE
      All bases of _RAND_DEMON in this area have been destroyed. Peace to the
      world can finally be restored... but that is what you could only wish
      for.
      _SPACE
      Despite your best efforts, _RAND_DEMON is still alive. You must fight
      against _RAND_DEMON's horde of forces again and destroy them
      completely.]],
    }
  }

  the_avenger =
  {
    hooks =
    {
      -- the vengeful marine
      [[You find a marine slumped against the wall, battered and bloodied.
      His armor is torn from claws marks but he is still alive. "Hey, you!
      I don't have much time left! That creature, _RAND_DEMON did this to me.
      I want you to... to make that demon scum pay." Life escapes the marine's eyes.
      You take his dog tags and swear vengeance upon _RAND_DEMON.]],

      -- hear my plea
      [[You hear a weak sobbing around the corner. You turn around to see
      a horrible sight: a mass of civilian corpses butchered by hell's forces.
      Amongst the carnage is a raised hand. One of them is still alive. You approach.
      _SPACE
      "Please. Help... please help me... _RAND_DEMON killed everyone..."
      The woman's body is utterly crushed.
      She utters her last words and her hand falls to the ground. Hell
      will pay tenfold for this.]],

      -- don't let them get away with this
      [[You are interrupted by a scientist. He walks with a limp and his lab coat
      is strewn with blood. "Hey." He backs to a wall, gripping his arm.
      "The UAC. They made us work on Project _RAND_DEMON. It was an attempt at
      capturing one of the class 5 entities but it escaped the containment
      field and killed everyone. I was the only one left. You have to take it down!"
      You feel anger but lecturing the scientist would not solve the problem.
      You offer a medkit but the scientist refuses. "No, I'll handle this part.
      Just take that creature down." You nod and leave.]],
    }

    conclusions =
    {
      -- STFU part 2
      [[As _RAND_DEMON's body falls to the floor, you step over its chest.
      "Mortal! Your transgressions against hell will not be forgo-"
      _SPACE
      You silence the creature by landing a fist right between its eyes.
      A gaping maw of blood, guts, and cables lie were its face used to be.
      Vengeance is served. You make your exit.]],

      -- put a sock in it
      [[_RAND_DEMON curses you as its body crumbles. "No! This is not
      our last battle, mortal! Hell is unending! We are legion! We-"
      _SPACE
      You stuff a barrel of nukage into its mouth. A shot in the right
      place detonates the barrel, scattering blood and debris around the
      room. Vengeance has been achieved. You escape the area.]],

      -- I'm gonna rip your arm off and beat you with it
      [[The weakened _RAND_DEMON tries to limp away. You rush and grip
      one of its limbs tightly, tearing it from its socket. "GRAAAAHH!
      Leave, mortal!" With a strong swing of the piece, a crash of flesh
      and metal is met with an explosion of blood and intestines. The demon is
      defeated. You leave the area.]],
    }
  }

  the_avenger_from_hell =
  {
    hooks =
    {
      -- my name is _RAND_DEMON, you killed my father, prepare to die
      [[You are rudely interrupted and shoved down to the ground.
      A great demon grips you tightly, salivating on your visor. It growls forth.
      "You! You killed _RAND_DEMON, our lord! I am sworn to destroy you!"
      You discharge your suit battery and a shockwave of electricity is released,
      freeing you and pushing the demon back. "I will return. With your head upon
      our lord's altar." The demon steps back into a portal which collapses behind it.]],

      -- passing the torch
      [[A great demon shows itself before you from a ledge above. It makes pronouncement.
      "By decree of the dark lords and _GOTHIC_LEVEL, I have taken the place of _RAND_DEMON
      and in our lord's name, I shall grind you to a pulp!" You take aim and land a shot
      on its chest to minor effect. "Grrr! I will show all hell of your fate." The great
      demon steps away into the shadows.]],

      -- you'll make a nice doodad
      [[As you open a door, a swing of metal launches you off your feet and into the wall.
      A menacing creature stands before you and decrees "Mortal! Your head will make
      a great ornament upon our Lord _RAND_DEMON's cenotaph!" As it makes its way towards
      you, the floor beneath you crumbles. You fall and roll down a long slope and find
      yourself at the bottom. You pick yourself up quickly, but see no sign of the demon.]]
    }

    conclusions =
    {
      -- curb stomp
      [[You have defeated the great demon! "Nooo! Nooo! _RAND_DEMON must be avenged!"
      You raise your foot and stomp the creature's head to the curb.
      The floor is greased with a splatter of blood and metal. You swear to make all
      hellions reach the same fate at every turn.]],

      -- oh no run away
      [[The great demon is stricken and crashes down. Wails of agony flood the room
      as the impish minions run in a panic. "_RAND_DEMON's champion has been defeated
      by the Doomslayer! Retreat!" You fire shots at the routed pawns and some
      of them tumble down. You bring one foot over the demon's head, weapon in hand, and survey
      the area. It seems you have struck fear upon the creatures. All clear now, but they will
      return surely with greater force.]]

      -- diabolus ex machina
      [[Before you land your final shot at the demon, a swirl of green mists
      blanket the room. An eruption of gutteral laughter meets you. "You are indeed the
      Butcher of _RAND_DEMON, mortal. No matter. This battle was of a small price to weaken
      your will. Hell will not forget. Hell will not forgive." The mists disperse and
      the great demon is nowhere in sight. Either it keeps running away from you forever
      or it will find itself under your boot one day, you think to yourself.]]
    }
  }
}

ZDOOM_STORIES.ABSOLUTE_ENDINGS =
{
  [[While hell's forces continues its assault elsewhere,
  your efforts at keeping the demons at bay is rest assured for now!
  _SPACE
  The story will continue!]],
}

ZDOOM_STORIES.GENERIC_STORIES =
{
  d2_entry = -- not used but I'll leave it here anyway
  {
    [[Time to enter the fray once more! The forces of hell have opened
    the gates to the netherworld and have spilled across the land.
    _SPACE
    Time to greet them the only way you know: locked and loaded!
    _SPACE
    Good luck out there and blast those hellspawn back
    to which they came!]]
  }
  d2_MAP05_exit =
  {
    [[Hell has taken a strong hold upon these lands, corrupting it
    in their wake!
    _SPACE
    Ahead, their forces gather in strength almost inumerable in count.]]
  }
  d2_MAP11_exit =
  {
    [[A lieutenant of hell falls but otherworldly shrieks echo
    further still. You pick up your armaments and point them
    forward to continue the siege against the darkness.
    _SPACE
    The battle rages on!]]
  }
  d2_MAP20_exit=
  {
    [[Hell's forces attempt to push back but your relentless assault
    on their breaches keeps them at bay!
    _SPACE
    More of their overlords have fallen and the opportunity for
    their defeat draws ever closer...]]
  }
  d2_MAP30_exit =
  {
    [[You have loosened hell's grip upon
    this place! Demonic entities flee in terror
    from your display of indomitable strength.
    _SPACE
    You realize, however, while hell lies
    defeated today hell has not yet been destroyed.
    Rest for now, but remember:
    Hell is already preparing for another challenge.]]
  }
}

ZDOOM_STORIES.SECRET_TEXTS =
{
  d2_secretnearby =
  {
    [[You tirelessly battle against waves upon waves of
    seemingly infinite hellspawn.
    _SPACE
    Your tracker informs you a secret point of interest
    may exist nearby...]],
  }
  d2_secret1 =
  {
    [[You have found a secret zone!
    It seems the hellspawn have barricaded
    themselves within its confines
    with the expectation of safety.
    _SPACE
    You are about to prove them otherwise.]],
  }
  d2_secret2 =
  {
    [[It seems this secret trail goes further than expected.
    It is time to finish this once and for all and eradicate
    this hidden pocket of hellish infestation.]],
  }
}

ZDOOM_STORIES.EVIL_TITLES =
{
  -- as in titles for individuals i.e. Snowball the TERRIBLE.
  Abhorrent=5,
  Abominable=5,
  Amputator=5,
  Anathema=5,
  Annihilator=5,
  Antichrist=5,
  Atrocious=5,
  ["Bane of Mortals"]=5,
  Barbarous=5,
  Baleful=5,
  ["Bearer of Anguish"]=5,
  Beast=5,
  Berserker=5,
  Betrayer=5,
  ["Black Sun"]=5,
  ["Bone Collector"]=5,
  Breaker=5,
  ["Bringer of Doom"]=5,
  Brutal=5,
  Brute=5,
  Butcher=5,
  Calamity=5,
  Coldblooded=5,
  Condemned=5,
  Corrosive=5,
  ["Corpse-grinder"]=5,
  Corrupted=5,
  ["Champion of Hell"]=5,
  ["Chant of Death"]=5,
  Crucifier=5,
  Cruel=5,
  Cursed=5,
  Damned=5,
  Decaying=5,
  Deceiver=5,
  Defiler=5,
  Despicable=5,
  Despoiler=5,
  ["Destroyer of Worlds"]=5,
  Depraved=5,
  Devourer=5,
  Deviant=5,
  Dire=5,
  Dishonored=5,
  Dismal=5,
  Dissolute=5,
  Dominator=5,
  Doombringer=5,
  Dragon=5,
  Dreadful=5,
  ["Eater of Souls"]=5,
  Eternal=5,
  Executioner=5,
  Faceless=5,
  Faceripper=5,
  Fanatic=5,
  ["Father of the Coven"]=5,
  Feral=5,
  ["Flesh-render"]=5,
  Fiend=5,
  Foul=5,
  Ghastly=5,
  Glutton=5,
  Grim=5,
  Grinder=5,
  ["Hand of Darkness"]=5,
  Hateful=5,
  Harbinger=5,
  Hellborn=5,
  Hellspawn=5,
  ["Herald of Winter"]=5,
  Heinous=5,
  Honorless=5,
  Horrible=5,
  Hungering=5,
  Iconoclast=5,
  Impaler=5,
  Impious=5,
  Inexorable=5,
  ["Inflictor of Pain"]=5,
  Infernal=5,
  Inquisitor=5,
  Insidious=5,
  Judge=5,
  ["Keeper of Shadows"]=5,
  Kinslayer=5,
  ["King of Skulls"]=5,
  Lacerator=5,
  Loathsome=5,
  ["Lich-king"]=5,
  ["Life-drinker"]=5,
  Lurker=5,
  Mad=5,
  Malificent=5,
  Malevolent=5,
  Malicious=5,
  Malign=5,
  Malignant=5,
  ["Man-eater"]=5,
  Mastermind=5,
  ["Maw of Hell"]=5,
  ["Master of Discord"]=5,
  Merciless=5,
  ["Messenger of Omens"]=5,
  Miscreated=5,
  Morningstar=5,
  Mountain=5, -- like Clegane the Mountain
  Necromancer=5,
  Nefarious=5,
  Nemesis=5,
  Noxious=5,
  Nightbringer=5,
  Overseer=5,
  Overlord=5,
  ["Perpetual Night"]=5,
  Perilous=5,
  Persecutor=5,
  Pervert=5,
  Pestilent=5,
  Pillager=5,
  ["Pit Fiend"]=5,
  Plagued=5,
  Plunderer=5,
  Poisoner=5,
  ["Prince of Darkness"]=5,
  Profane=5,
  Provoker=5,
  Psycho=5,
  Raider=5,
  Ragemind=5,
  Ravager=5,
  Reprotabe=5,
  Repulsive=5,
  Revelator=5,
  Revenger=5,
  Rotted=5,
  Rotten=5,
  Ruthless=5,
  Ruined=5,
  Savage=5,
  Seer=5,
  Serpent=5,
  Shameless=5,
  Sinister=5,
  Skinflayer=5,
  Slaughterer=5,
  Slayer=5,
  Slavemaster=5,
  Shade=5,
  Shadow=5,
  ["Shield of the Beast"]=5,
  Sinner=5,
  Sorcerer=5,
  Soultaker=5,
  Spiteful=5,
  ["Storm-bringer"]=5,
  ["Sword of the Underdark"]=5,
  ["Sun-blotter"]=5,
  Tainted=5,
  Terror=5,
  Terrible=5,
  Torturer=5,
  Tormentor=5,
  Tower=5,
  Toxic=5,
  Tyrant=5,
  Undying=5,
  Unholy=5,
  Unveiled=5,
  Rancorous=5,
  Reaper=5,
  Reaver=5,
  Ripper=5,
  Venom=5,
  Vengeful=5,
  Vicious=5,
  Vile=5,
  Virulent=5,
  Vitriolic=5,
  Vivisector=5,
  Warlord=5,
  ["Woe to Man"]=5,
  Wrath=5,
  Wraith=5,
  Wretched=5,
  Wicked=5,
  ["Whore of Babylon"]=5,
  Zealot=5,
}

ZDOOM_STORIES.MCGUFFINS =
{
  -- McGuffins. Quintessential items in a story
  -- that characters work for or against, but
  -- the object's actual significance is almost always unclear
  hellish =
  {
    ["an obsidian orb containing hellfire"]=5,
    ["an icon of miscreation"]=5,
    ["a desacrated totem"]=5,
    ["an adamantium skull"]=5,
    ["a baleful gem"]=5,
    ["a devil's horn"]=5,
    ["a cursed talisman"]=5,
    ["a dark crystal shard"]=5,
    ["a bloody hand"]=5,
    ["a skeletal torso"]=5,
    ["an unholy chalice"]=5,
    ["an ornate dagger"]=5,
    ["the Spear of Destiny"]=5, --because why not lol
    ["the Sword of Darkness"]=5,
    ["the Khronos Device"]=5,
    ["the Soul-x Agitator"]=5,
    ["a blood imprinter"]=5,
    ["a brass bauble"]=5,
    ["a vial of ectoplasm"]=5,
    ["the Mark of Kain"]=5,
  }
  tech =
  {
    ["a tectonic transducer"]=5,
    ["a flux capacitor"]=5,
    ["a security matrix"]=5,
    ["a network card"]=5,
    ["an energy diode"]=5,
    ["various BFG components"]=5,
    ["a positron relay"]=5,
    ["a plasma inductor"]=5,
    ["a plasma relay"]=5,
    ["a quantum cipher"]=5,
    ["a dielectric coil"]=5,
    ["a disc reader"]=5,
    ["a card reader"]=5,
    ["a base station uplink"]=5,
    ["a flash drive"]=5,
    ["a hard token authenticator"]=5,
    ["a baseband modulator"]=5,
    ["a gravitronic amplifier"]=5,
    ["a quantum disrupter"]=5,
    ["a MAPINFO lump"]=5, -- getting meta here, huh?
    ["a coop server"]=5,
  }
}

ZDOOM_STORIES.QUIT_MESSAGES =
{
  
}