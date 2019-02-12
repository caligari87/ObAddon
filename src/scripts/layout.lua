------------------------------------------------------------------------
--  LAYOUTING UTILS
------------------------------------------------------------------------
--
--  Oblige Level Maker
--
--  Copyright (C) 2006-2017 Andrew Apted
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
------------------------------------------------------------------------


function Layout_compute_dists(R)
  --
  -- Compute various distances in a room:
  --
  -- (1) give each seed a 'sig_dist' value, which is roughly the #
  --     of seeds the player must walk to reach a significant thing
  --     in the room (including entry and exit points).
  --

  local function can_traverse(S, N)
    -- FIXME
    return true
  end


  local function mark_chunk(chunk)
    for sx = chunk.sx1, chunk.sx2 do
    for sy = chunk.sy1, chunk.sy2 do
      SEEDS[sx][sy].sig_dist = 0
    end
    end
  end


  local function init_sig_dists()
    each S in R.seeds do
      S.sig_dist = nil

      each dir in geom.ALL_DIRS do
        local E = S.edge[dir]

        if E and E.conn then
          S.sig_dist = 0.7
        end
      end
    end

    -- now check teleporters
    -- [ and exits, mainly to keep a teleporter entry far away ]

    each chunk in R.floor_chunks do
      if chunk.content == "TELEPORTER" or chunk.is_bossy then
        mark_chunk(chunk)
      end
    end

    each chunk in R.closets do
      if chunk.content == "TELEPORTER" then
        mark_chunk(chunk)
      end
    end

    -- finally handle goal spots
    each goal in R.goals do
      if goal.chunk then
        mark_chunk(goal.chunk)
      end
    end
  end


  local function collect_fillable_seeds()
    local list = {}

    each S in R.seeds do
      if S.sig_dist then continue end

      each dir in geom.ALL_DIRS do
        local N = S:neighbor(dir)

        if N and N.room == R and N.sig_dist and can_traverse(S, N) then
          table.insert(list, S)
          break;
        end
      end
    end

    return list
  end


  local function spread_sig_dists()
    local list = collect_fillable_seeds()

    if table.empty(list) then
      return false
    end

    each S in list do
      each dir in geom.ALL_DIRS do
        local N = S:neighbor(dir)

        if N and N.room == R and N.sig_dist and can_traverse(S, N) then
          S.sig_dist = math.min(N.sig_dist + 1, S.sig_dist or 999)
        end
      end

      assert(S.sig_dist)
    end

    return true
  end


  local function calc_chunk_sig_dist(chunk)
    -- compute average of all seeds in chunk
    local sum = 0
    local total = 0

    for sx = chunk.sx1, chunk.sx2 do
    for sy = chunk.sy1, chunk.sy2 do
      local dist = SEEDS[sx][sy].sig_dist

      if dist then
        sum = sum + dist
        total = total + 1
      end
    end
    end

--  stderrf("chunk %s in %s --> %1.1f / %d\n", chunk.kind or "??", R.name, sum, total)

    if total > 0 then
      chunk.sig_dist = sum / total
    end
  end


  local function visit_chunks(list)
    each chunk in list do
      calc_chunk_sig_dist(chunk)
    end
  end


--[[
  local function init_wall_dists()
    for x = R.sx1, R.sx2 do
    for y = R.sy1, R.sy2 do
      local S = SEEDS[x][y]
      if S.room != R then continue end

      for dir = 1,9 do if dir != 5 then
        local N = S:neighbor(dir)

        if not (N and N.room == R) then
          S.wall_dist = 0.5
        end
      end end -- dir

    end -- sx, sy
    end
  end


  local function spread_wall_dists()
    local changed = false

    for x = R.sx1, R.sx2 do
    for y = R.sy1, R.sy2 do
      local S = SEEDS[x][y]
      if S.room != R then continue end

      for dir = 2,8,2 do
        local N = S:neighbor(dir)
        if not (N and N.room == R) then continue end

        if S.wall_dist and S.wall_dist + 1 < (N.wall_dist or 999) then
          N.wall_dist = S.wall_dist + 1
          changed  = true
        end
      end

    end  -- sx, sy
    end

    return changed
  end
--]]


  ---| Layout_compute_dists |---

  init_sig_dists()

  for loop = 1, 999 do
    if not spread_sig_dists() then break; end
  end

  visit_chunks(R.floor_chunks)
  visit_chunks(R.closets)
end



function Layout_spot_for_wotsit(R, kind, required)
  --
  -- Find a free chunk in the room for a certain thing
  -- (like a key, switch, weapon, starting spot, etc....).
  --
  -- If 'required' is true, produces an error when nothing
  -- can be found, otherwise NIL is returned when none left.
  --
  -- The returned chunk is either a floor chunk or a closet.
  --

  local function eval_spot(chunk)
    -- already used?
    if chunk.content then return -1 end

    if kind == "LOCAL_SWITCH" then
      if chunk.kind != "closet" then return -1 end
    end

    -- when we have alternate start rooms, cannot use closets
    if kind == "START" and R.player_set then
      if chunk.kind == "closet" then return -1 end
    end

    -- handle symmetrical room
    if chunk.peer and chunk.peer.content == kind then
      return 700 + gui.random()
    end

    -- avoid using chunks right next to a connection or closet entrance
    if chunk.kind == "floor" and chunk:is_must_walk() then
      return 1.0 + gui.random()
    end

    -- avoid using chunks set aside for boss monsters
    if chunk.is_bossy then
      return 2.0 + gui.random()
    end

    local score = (chunk.sig_dist or 0) * 10 + 10

    -- tie breaker
    score = score + gui.random() ^ 2

    -- the exit room generally has a closet pre-booked
    if kind == "EXIT" and chunk.prefer_usage == "exit" then
      score = score + 200
    end

    -- start rooms and teleporter roots too
    if (kind == "START" or kind == "TELEPORTER") and chunk.prefer_usage == "start" then
      score = score + 200
    end

    -- really really want a secret exit in a closet
    if kind == "SECRET_EXIT" and chunk.kind == "closet" then
      score = score + 600
    end

    -- in caves, prefer spots which do not touch the room edge,
    -- and prefer not to use closets (which don't look good).
    if R.is_cave then
      if chunk.kind == "closet" then
        score = score / 3
      elseif not chunk.touches_wall then
        score = score * 3
      end

      return score
    end

    -- in general, prefer closets over free-standing spots
    if chunk.kind == "closet" then
      score = score + 22
    end

    if chunk.sw >= 2 or chunk.sh >= 2 then
      score = score + 9
    end

    if chunk.is_straddler then
      if kind == "EXIT"  or kind == "START" or
         kind == "KEY" or kind == "SWITCH"
      then
        score = score + 41
      end
    end

    if chunk.prefer_usage and chunk.prefer_usage == kind then
      score = score * 2
    end

    return score
  end


  ---| Layout_spot_for_wotsit |---

  Layout_compute_dists(R)

  local best
  local best_score = 0

  -- first, try floor chunks
  each chunk in R.floor_chunks do
    local score = eval_spot(chunk)

    if score > best_score then
      best = chunk
      best_score = score
    end
  end

  -- now try closets
  each chunk in R.closets do
    local score = eval_spot(chunk)

    if score > best_score then
      best = chunk
      best_score = score
    end
  end


  if best then
    assert(best)

    -- never use it again
    best.content = kind

    -- ensure we cannot climb over a nearby fence
    if best.kind == "floor" then
      best.area.podium_h = 24
    end

    -- leave room for player to enter a closet
    if best.kind == "closet" then
      each E in best.edges do
        Edge_mark_walk(E)
      end
    end

    return best
  end


  -- nothing available!

  return nil
end



function Layout_place_importants(R, imp_pass)
  --
  -- imp_pass is '1' for vital stuff (goals and teleporters)
  -- imp_pass is '2' for less vital stuff (weapons and items)
  --

  local function point_in_front_of_closet(chunk, r)
    local mx, my = chunk.mx, chunk.my

    if chunk.from_dir == 2 then return mx, chunk.y1 - r end
    if chunk.from_dir == 8 then return mx, chunk.y2 + r end

    if chunk.from_dir == 4 then return chunk.x1 - r, my end
    if chunk.from_dir == 6 then return chunk.x2 + r, my end

    error("point_in_front_of_closet : unknown dir")
  end


  local function add_goal(goal)
    local chunk = Layout_spot_for_wotsit(R, goal.kind, "required")

    if not chunk then
      error("No spot in room for " .. goal.kind)
    end

-- stderrf("Layout_place_importants: goal '%s' @ %s\n", goal.kind, R.name)

    chunk.content_item = goal.item
    chunk.goal = goal

    goal.chunk = chunk

    if goal.kind != "START" then
      R.guard_chunk = chunk
    end

    if goal.kind == "START" then
      if not chunk.closet then
-- FIXME broken since our "spot" does not have x1/y1/x2/y2
--        R:add_entry_spot(spot)
      end

      -- exclude monsters
      local mx, my = chunk.mx, chunk.my

      if chunk.kind == "closet" then
        mx, my = point_in_front_of_closet(chunk, 96)
      end

      R:add_exclusion("keep_empty", mx, my,  640)
      R:add_exclusion("non_facing", mx, my, 1280)
    end
  end


  local function add_teleporter(conn)
    local chunk = Layout_spot_for_wotsit(R, "TELEPORTER", "required")

    if not chunk then
      error("No spot in room for teleporter!")
    end

    chunk.conn = conn

    -- exclude monsters from being nearby

    local mx, my = chunk.mx, chunk.my

    if chunk.kind == "closet" then
      mx, my = point_in_front_of_closet(chunk, 96)
    end

    R:add_exclusion("keep_empty", mx, my, 192)
    R:add_exclusion("non_facing", mx, my, 384)
  end


  local function add_weapon(weapon)
    local chunk = Layout_spot_for_wotsit(R, "WEAPON")

    if not chunk then
      -- try to place it in a future room
      table.insert(LEVEL.unplaced_weapons, weapon)
      return
    end

    chunk.content_item = weapon

    if not R.guard_chunk then
      R.guard_chunk = spot
    end
  end


  local function add_item(item)
    local chunk = Layout_spot_for_wotsit(R, "ITEM")

    if not chunk then
      warning("unable to place nice item: %s\n", item)
      return
    end

    chunk.content_item = item

    if not R.guard_chunk then
      R.guard_chunk = spot
    end
  end


  local function rank_for_weapon(name)
    local info = GAME.WEAPONS[name]
    assert(info)

    return info.level * 1000 + info.damage * info.rate + info.pref / 100
  end


  local function sort_weapons()
    -- point of this is to assign the best spots to the biggest weaps

    table.sort(R.weapons,
        function(A, B)
          return rank_for_weapon(A) > rank_for_weapon(B)
        end)
  end


  ---| Layout_place_importants |---

  if imp_pass == 1 then
    each tel in R.teleporters do
      add_teleporter(tel)
    end

    each goal in R.goals do
      add_goal(goal)
    end

  elseif imp_pass == 2 then
    -- try weapons which failed to be placed in the previous room
    if not table.empty(LEVEL.unplaced_weapons) then
      table.append(R.weapons, LEVEL.unplaced_weapons)
      LEVEL.unplaced_weapons = {}
    end

    sort_weapons()

    each name in R.weapons do
      add_weapon(name)
    end

    each name in R.items do
      add_item(name)
    end

  else
    error("bad imp_pass")
  end
end



function Layout_place_hub_gates()
  -- this also does secret exit closets

  local function num_free_chunks(list)
    local count = 0

    each chunk in list do
      if chunk.content == nil then
        count = count + 1
      end
    end

    return count
  end


  local function eval_closet_room(R)
    local free_spots = num_free_chunks(R.closets)

    if free_spots == 0 then return -1 end

    local score = 0

    if R.is_secret then
      score = 300
    elseif not (R.is_start or R.is_exit) then
      score = 200
    end

    -- prefer it near the end of the map
    if R.lev_along > 0.7 then
      score = score + 50
    elseif R.lev_along > 0.4 then
      score = score + 20
    end

    -- prefer leaving some closets for other things
    score = score + math.clamp(1, free_spots, 7)

    -- tie breaker
    return score + gui.random() * 0.5
  end


  local function eval_free_standing_room(R)
    local free_spots = num_free_chunks(R.floor_chunks)

    if free_spots == 0 then return -1 end

    local score = 0

    if R.is_secret then
      score = 300
    elseif not (R.is_start or R.is_exit) then
      score = 200
    elseif #R.goals == 0 then
      score = 100
    end

    -- check number of spots against what will be needed
    -- [ we reach this function due to a dearth of closets.... ]
    local need_spots = #R.goals + #R.teleporters

    if R.is_start then need_spots = need_spots + 1 end

    if free_spots > need_spots then
      score = score + 50
    end

    -- prefer it near the end of the map
    if R.lev_along > 0.7 then
      score = score + 20
    elseif R.lev_along > 0.4 then
      score = score + 10
    end

    -- prefer leaving some closets for other things
    score = score + math.clamp(1, free_spots, 7)

    -- tie breaker
    return score + gui.random() * 0.5
  end


  local function make_secret_exit(R)
    gui.printf("Secret Exit: %s (in a closet)\n", R.name)

    -- should not fail, as our eval function detects free spots
    local chunk = Layout_spot_for_wotsit(R, "SECRET_EXIT", "required")

    chunk.content = "SECRET_EXIT"

    -- mark the closet as hidden in the room
    chunk.is_secret = true
  end


  local function add_secret_closet()
    local best_R
    local best_score = 0

    each R in LEVEL.rooms do
      local score = eval_closet_room(R)

      if score > best_score then
        best_R = R
        best_score = score
      end
    end

    if not best_R then
      return false
    end

    make_secret_exit(best_R)
    return true
  end


  local function add_secret_switch()
    local best_R
    local best_score = 0

    each R in LEVEL.rooms do
      local score = eval_free_standing_room(R)

      if score > best_score then
        best_R = R
        best_score = score
      end
    end

    if not best_R then
      warning("could not add a secret exit to the map!\n")
      return
    end

    make_secret_exit(best_R)
  end


  ---| Layout_place_hub_gates |---

  if LEVEL.need_secret_exit then
    if not add_secret_closet() then
      -- invoke plan C : make a secret switch somewhere
      add_secret_switch()
    end
  end
end



function Layout_place_all_importants()
  -- do hub gates and secret exit closets
  -- [ do this first, since these require closets, whereas normal
  --   starts and exits and goals can be placed without closets ]
  Layout_place_hub_gates()

  each R in LEVEL.rooms do
    Layout_place_importants(R, 1)
  end

  each R in LEVEL.rooms do
    Layout_place_importants(R, 2)
  end

  -- warn about weapons that could not be placed anywhere
  each weapon in LEVEL.unplaced_weapons do
    warning("unable to place weapon: %s!\n", weapon)
  end
end



function Layout_choose_face_area(A)
  -- used for scenic liquid pools

  local best
  local best_score = -1

  each N in A.neighbors do
    if not N.room then continue end
    if not N.is_outdoor then continue end

    if N.mode != "floor" then continue end
    if not N.floor_h then continue end

    if N.zone != A.zone then continue end

    if N.room.is_hallway then continue end

    -- ok --

    local junc = Junction_lookup(A, N)

    local score = junc.perimeter + 2.2 * gui.random() ^ 3

    if score > best_score then
      best = N
      best_score = score
    end
  end

  return best
end



function Layout_add_traps()
  --
  -- Add traps to rooms, especially monster closets.
  --

  local function eval_closet(R, chunk)
    -- compute a distance to the room's goal
    local dist = 0

    if R.guard_chunk then
      local dx = math.abs(R.guard_chunk.mx - chunk.mx)
      local dy = math.abs(R.guard_chunk.my - chunk.my)

      dist = (dx + dy) / SEED_SIZE
    end

    -- tie breaker
    chunk.trap_dist = dist + (gui.random() ^ 2) * 16
  end


  local function locs_for_room(R, kind)
    -- kind is either "closet" or "teleport".
    -- returns a list of all possible monster closets / teleport spots.
    -- [ in symmetrical rooms, peered closets only return a single one ]

    if R.is_secret then return nil end

    local locs = {}

    if kind == "closet" then
      each chunk in R.closets do
        if not chunk.content and not chunk:is_slave() then
          eval_closet(R, chunk)
          table.insert(locs, chunk)
        end
      end

      table.sort(locs,
          function(A, B) return A.trap_dist < B.trap_dist end)

    elseif kind == "teleport" then
      -- large chunks are better, so place them first in the list
      local locs2 = {}

      each chunk in R.floor_chunks do
        if not chunk.content then
          if chunk.sw >= 2 and chunk.sh >= 2 then
            table.insert(locs, chunk)
          else
            table.insert(locs2, chunk)
          end
        end
      end

      rand.shuffle(locs)
      rand.shuffle(locs2)

      table.append(locs, locs2)

    else
      error("locs_for_room: unknown kind")
    end

    if table.empty(locs) then return nil end

    if kind == "teleport" and #locs < 3 then return nil end

    return locs
  end


  local function fake_backtrack(R)
    -- this is used for trapped items
    -- [ goals have "real" backtracking info ]

    local result = {}

    if #R.conns == 1 then
      local C = R.conns[1]
      R = C:other_room(R)
      table.insert(result, R)
    end

    return result
  end

 -- Closet and teleporter traps

  local function closet_dice(R, is_same)
    -- chance of using a monster closet to release monsters
    local prob

    if R.is_cave then
      prob = style_sel("traps", 0,  2,  5, 15)
      --prob = style_sel("traps", 0,  0,  5, 15)
    elseif is_same then
      prob = style_sel("traps", 0, 20, 40, 70)
      --prob = style_sel("traps", 0, 25, 50, 85)
    else
      prob = style_sel("traps", 0, 10, 25, 55)
      --prob = style_sel("traps", 0, 15, 30, 70)
    end

    return rand.odds(prob)
  end


  local function teleport_dice(R, is_same)
    -- chance of using teleporting-in monsters
    local prob

    if is_same and not R.is_cave then
      prob = style_sel("traps", 0,  3, 12, 25)
      --prob = style_sel("traps", 0,  2, 10, 20)
    else
      prob = style_sel("traps", 0,  10, 33, 66)
      --prob = style_sel("traps", 0,  8, 25, 50)
    end

    return rand.odds(prob)
  end


  local function places_for_backtracking(R, backtrack, p_kind)
    --
    -- The main thing this does is pick which rooms to trap up and
    -- which ones to skip.  This is where the style is applied.
    --
    -- p_kind is either "goal", "item" or "weapon".
    --

--[[  REVIEW this....
    if p_kind == "weapon" then
      same_prob = same_prob * 1.5
    end
--]]

    -- create list of potential rooms for da monsters
    local places = {}

    if not R.is_start then
      table.insert(places, { room=R })
    end

    each N in backtrack do
      table.insert(places, { room=N })
    end

    -- visit each place, decide what method to use (or to skip it)
    local result = {}

    each info in places do
      local closet_locs
      local  telep_locs

      local is_same = (info.room == R)

      --default Oblige actions when Trap Styles isn't used.

      if OB_CONFIG.trap_style == "default" or OB_CONFIG.trap_style == nil then

        if closet_dice(info.room, is_same) then
          closet_locs = locs_for_room(info.room, "closet")
        end

        if teleport_dice(info.room, is_same) then
          telep_locs = locs_for_room(info.room, "teleport")
        end
      end


      --selecting based on ratio

      local closet_prob = rand.range(0,100)
      local teleport_prob

      if OB_CONFIG.trap_style == "closets" then
        teleport_prob = 0
      elseif OB_CONFIG.trap_style == "80" then
        teleport_prob = 20
      elseif OB_CONFIG.trap_style == "60" then
        teleport_prob = 40
      elseif OB_CONFIG.trap_style == "40" then
        teleport_prob = 60
      elseif OB_CONFIG.trap_style == "20" then
        teleport_prob = 80
      elseif OB_CONFIG.trap_style == "teleports" then
        teleport_prob = 100
      end

      if OB_CONFIG.trap_style != "default" then
        if teleport_prob <= closet_prob then
          if closet_dice(info.room, is_same) then
            closet_locs = locs_for_room(info.room, "closet")
          end
        else
          if teleport_dice(info.room, is_same) then
            telep_locs = locs_for_room(info.room, "teleport")
          end
        end
      end



      -- break ties
      -- [ but in caves, prefer teleporting in ]
      if closet_locs and telep_locs then
        if info.room.is_cave or rand.odds(40) then
          closet_locs = nil
        else
          telep_locs = nil
        end
      end

      if closet_locs then
        info.kind = "closet"
        info.locs = closet_locs

      elseif telep_locs then
        info.kind = "teleport"
        info.locs = telep_locs
      end

--[[ QUANTITY DEBUG
gui.debugf("MonRelease in %s : kind --> %s\n",
           sel(info.room == R, "SAME", "EARLIER"),
           info.kind or "NOTHING")
--]]

      if info.locs then
        table.insert(result, info)
      end
    end

    return result
  end


  local function make_closet_trap(closet, trig)
    closet.content = "TRAP"
    closet.trigger = trig

    if closet.peer and not closet.peer.content then
      closet = closet.peer

      closet.content = "TRAP"
      closet.trigger = trig
    end
  end


  local function make_teleport_trap(chunk, trig)
    chunk.content = "MON_TELEPORT"
    chunk.trigger = trig
    chunk.out_tag = alloc_id("tag")
  end


  local function fix_mirrored_trap(chunk, trig)
    if chunk.peer and not chunk.peer.content then
      chunk = chunk.peer

      -- using "NOTHING" is not enough (sinks would still be made)
      chunk.content = "MON_TELEPORT"
      chunk.trigger = trig
      chunk.out_tag = 9999  -- a dummy tag (never referenced)
    end
  end


  local function install_a_closet_trap(info, trig)
    local R    = info.room
    local locs = info.locs

    rand.shuffle(locs)

    local qty = rand.index_by_probs({ 40,40,20,5 })

    if STYLE.traps == "few"   then int((qty + 1) / 2) end
    if STYLE.traps == "more"  then qty = qty + 1 end
    if STYLE.traps == "heaps" then qty = qty + 2 end

    for i = 1, qty do
      if locs[i] then
        make_closet_trap(locs[i], trig)
      end
    end
  end


  local function install_a_teleport_trap(info, trig)
    local R    = info.room
    local locs = info.locs

    local DEPOT = Seed_alloc_depot(R)

    if not DEPOT then
      gui.debugf("Cannot make teleportation trap: out of depots\n")
      return
    end

    DEPOT.skin.trap_tag = trig.tag

    -- re-use some chunks if there are less than three
    if #locs < 2 then table.insert(locs, locs[1]) end
    if #locs < 3 then table.insert(locs, locs[2]) end

    for n = 1, 3 do
      if locs[n].sw < 2 or locs[n].sh < 2 then
        DEPOT.max_spot_size = 64
      end
    end

    local chunk1 = table.remove(locs, 1)
    local chunk2 = table.remove(locs, 1)
    local chunk3 = table.remove(locs, 1)

    -- in a symmetrical room, try to use a peered chunk
    if chunk1.peer and not chunk1.peer.content then
      chunk3 = chunk1.peer
    elseif chunk2.peer and not chunk2.peer.content then
      chunk3 = chunk2.peer
    elseif chunk3.peer and not chunk3.peer.content then
      chunk2 = chunk3.peer
    end

    make_teleport_trap(chunk1, trig)
    make_teleport_trap(chunk2, trig)
    make_teleport_trap(chunk3, trig)

    DEPOT.skin.out_tag1 = chunk1.out_tag
    DEPOT.skin.out_tag2 = chunk2.out_tag
    DEPOT.skin.out_tag3 = chunk3.out_tag

    -- this is to prevent non-symmetrical sinks or decor prefabs
    fix_mirrored_trap(chunk1, trig)
    fix_mirrored_trap(chunk2, trig)
    fix_mirrored_trap(chunk3, trig)
  end


  local function install_a_trap(places, trig)
    trig.action = "W1_OpenDoorFast"
    trig.tag = alloc_id("tag")

    each info in places do
      if info.kind == "teleport" then
        install_a_teleport_trap(info, trig)
      else
        install_a_closet_trap(info, trig)
      end
    end
  end


  local function trigger_for_entry(R)
    local C = R.entry_conn

    if not C then return nil end

    if C.kind == "teleporter" then
      -- TODO : find teleporter chunk
      return nil
    end

    -- split conn?  [ TODO : return a list of TRIGs ]
    if C.F1 then return nil end

    local E = C.E1
    if C.R2 == R then E = C.E2 end

    if not E then return nil end

    local TRIG =
    {
      kind = "edge"
      edge = E
    }

    table.insert(R.triggers, TRIG)

    return TRIG
  end


  -- TODO : trigger_for_exit(R)


  local function trigger_for_chunk(R, chunk)
    local TRIG

    if chunk.kind == "closet" then
      if not chunk.edges then return nil end

      TRIG =
      {
        kind = "edge"
        edges = chunk.edges
      }
    else
      TRIG =
      {
        kind = "spot"
        spot = chunk
      }
    end

    table.insert(R.triggers, TRIG)

    return TRIG
  end


  local function trap_up_goal(R)
    if table.empty(R.goals) then return end

    local goal = rand.pick(R.goals)

    -- do not trap the exit switch, as player may exit too soon and
    -- not notice the released monsters
    if goal.kind == "START" or
       goal.kind == "EXIT" or
       goal.kind == "SECRET_EXIT"
    then
      return
    end

    local places = places_for_backtracking(R, goal.backtrack, "goal")
    if table.empty(places) then return end

    local trig = trigger_for_chunk(R, assert(goal.chunk))
    if not trig then return end

    install_a_trap(places, trig)
  end


  local function eval_item_for_trap(chunk)
    -- returns a probability

    if chunk.content == "WEAPON" or
       chunk.content == "ITEM"
    then
      -- ok
    else
      return -1
    end

    local prob
    local item = assert(chunk.content_item)

    if table.has_elem(LEVEL.new_weapons, item) then
      prob = 99
    -- very rarely trap weapons you already have
    elseif chunk.content == "WEAPON" then
      prob = 1
    else
      prob = 60
    end

    if not rand.odds(prob) then return -2 end

    -- tie breaker
    return 1 + gui.random()
  end


  local function trap_up_item(R)
    if R.is_start  then return end
    if R.is_secret then return end

    -- pick an item to target

    local ch_list = table.copy(R.floor_chunks)
    table.append(ch_list, R.closets)

    local best
    local best_score = -1

    each chunk in ch_list do
      local score = eval_item_for_trap(chunk)
      if score > best_score then
        best = chunk
        best_score = score
      end
    end

    if not best then return end

    -- determine places and trigger, and install trap
    local p_kind = "item"

    if best.content == "WEAPON" then
      p_kind = "weapon"
    end

    local places = places_for_backtracking(R, fake_backtrack(R), p_kind)
    if table.empty(places) then return end

    local trig = trigger_for_chunk(R, best)
    if not trig then return end

    install_a_trap(places, trig)
  end


  ---| Layout_add_traps |---

  if STYLE.traps == "none" then return end

  each R in LEVEL.rooms do
    trap_up_goal(R)
  end

  each R in LEVEL.rooms do
    trap_up_item(R)
  end
end



function Layout_decorate_rooms(pass)
  --
  -- Decorate the rooms with crates, pillars, etc....
  --
  -- The 'pass' parameter is 1 for early pass, 2 for later pass.
  --
  -- Also handles all the unused closets in a room, turning them
  -- into cages, secret items (etc).
  --

  local function make_cage(chunk)
    -- select cage prefab
    local A = chunk.area
    local reqs

    if chunk.kind == "closet" then
      reqs = chunk:base_reqs(chunk.from_dir)

      reqs.kind  = "cage"
      reqs.shape = "U"   -- TODO: chunk.shape

      chunk.prefab_dir = chunk.from_dir

    else  -- free standing
      reqs =
      {
        kind  = "cage"
        where = "point"

        size  = assert(chunk.space)
      }

      -- FIXME : hack for caves
      if A.room.is_cave then
        reqs.height = A.room.walkway_height
      else
        reqs.height = A.ceil_h - A.floor_h
      end
    end

    if A.room then
      reqs.env = A.room:get_env()
    end

    local prefab_def = Fab_pick(reqs, "allow_none")

    -- nothing matched?
    if not prefab_def then return end

    chunk.content    = "CAGE"
    chunk.prefab_def = prefab_def

    -- in symmetrical rooms, handle the peer too
    if chunk.peer and not chunk.peer.content then
      local peer = chunk.peer

      peer.content    = chunk.content
      peer.prefab_def = chunk.prefab_def

      if chunk.kind != "closet" and chunk.prefab_dir then
        local A = chunk.area
        assert(A.room.symmetry)
        peer.prefab_dir = A.room.symmetry:conv_dir(chunk.prefab_dir)
      end
    end
  end


  local function make_secret_closet(chunk, item)
    chunk.content = "ITEM"
    chunk.content_item = item

    chunk.is_secret = true

    -- code in render.lua selects the actual prefab
  end


  local function kill_closet(chunk)
    chunk.area.mode = "void"
    chunk.content = "void"

    -- TODO : sometimes make a picture

    each E in chunk.edges do
      E.kind = "ignore"
    end
  end


  local function joiner_not_large(C)
    if not C.joiner_chunk then return true end

    local vol = C.joiner_chunk.sw * C.joiner_chunk.sh

    return vol < 4
  end


  local function try_intraroom_lock(R)
    -- try to lock an unlocked exit and place switch for it

    if R.is_start then return end
    if R.is_exit  then return end

   -- Andrew's commit f9a3082ea000, October 20th

    -- when there is an alternate start room, ensure we don't block the
    -- path of a single player (who may begin on the wrong side).
    if LEVEL.alt_start and
       (R.zone == LEVEL.start_room.zone or
        R.zone == LEVEL.alt_start.zone)
    then
      return
    end

  -- End commit

    local conn_list = {}

    each C in R.conns do
      local N = C:other_room(R)

      if (C.kind == "edge" or C.kind == "joiner" or C.kind == "terminator") and
         not C.lock and
         not (N.is_secret or R.is_secret) and
         not N.is_start and
         N.lev_along > R.lev_along and
         joiner_not_large(C)
      then
        table.insert(conn_list, C)
      end
    end

    if table.empty(conn_list) then return end

    local chunk = Layout_spot_for_wotsit(R, "LOCAL_SWITCH")

    if not chunk then return end

    -- Ok, can make it

    local C = rand.pick(conn_list)

    local goal = Goal_new("LOCAL_SWITCH")

    goal.item = "sw_metal"
    goal.room = R
    goal.tag  = alloc_id("tag")

    chunk.goal = goal

    local lock = Lock_new("intraroom", C)

    lock.conn  = C
    lock.goals = { goal }
  end


  local function try_lock_item(R)
    -- convert a key (etc) goal into a lowering pedestal with a
    -- switch to find.

    local item

    each chunk in R.floor_chunks do
      if chunk.kind == "floor" and chunk.content == "KEY" and not chunk.lock then
        item = chunk
        break;
      end
    end

    if not item then return end

    -- see if we can place a switch
    local chunk = Layout_spot_for_wotsit(R, "LOCAL_SWITCH")

    if not chunk then return end

    -- OK --

    local goal = Goal_new("LOCAL_SWITCH")

    goal.item = "sw_metal"
    goal.room = R

    goal.tag = alloc_id("tag")

    chunk.goal = goal

    local lock = Lock_new("itemlock")

    lock.goals = { goal }
    lock.item  = item

    item.lock = lock
  end


  local function analyse_chunk_sinkage(chunk, where)
    --
    -- returns a three digit string, each digit represents a particular
    -- part of the chunk (middle, sides, corners).
    --
    -- each digit is 0 if not part of the sink (at all), 1 if partially
    -- part of a sink, and 2 if completely part of the sink.
    --
    -- e.g. "000" --> not touching the sink at all
    --      "222" --> the whole chunk is in the sink
    --      "200" --> only middle part is in the sink
    --      "022" --> only outer parts are in the sink (an island)
    --

    local   area_field = where .. "_group"
    local corner_field = where .. "_inner"

    if not chunk.area[area_field]      then return "000" end
    if not chunk.area[area_field].sink then return "000" end

    local  mid_count,  mid_total = 0, 0
    local side_count, side_total = 0, 0
    local corn_count, corn_total = 0, 0

    local cx1 = chunk.sx1
    local cy1 = chunk.sy1
    local cx2 = chunk.sx2 + 1
    local cy2 = chunk.sy2 + 1

    for cx = cx1, cx2 do
    for cy = cy1, cy2 do
      local corner = Corner_lookup(cx, cy)
      assert(corner)

      local A = corner[corner_field]

      local ox = (cx == cx1 or cx == cx2)
      local oy = (cy == cy1 or cy == cy2)

      if ox and oy then
        corn_count = corn_count + sel(A, 1, 0)
        corn_total = corn_total + 1

      elseif ox or oy then
        side_count = side_count + sel(A, 1, 0)
        side_total = side_total + 1

      else
        mid_count = mid_count + sel(A, 1, 0)
        mid_total = mid_total + 1
      end
    end
    end

    local function part_to_str(count, total)
      if count == 0 then return "0" end
      if count == total then return "2" end
      return "1"
    end

    return part_to_str( mid_count,  mid_total) ..
           part_to_str(side_count, side_total) ..
           part_to_str(corn_count, corn_total)
  end


  local function try_decoration_in_chunk(chunk, is_cave)
    if chunk.sw < 2 then return end
    if chunk.sh < 2 then return end

    -- only try mirrored chunks *once*
    if chunk:is_slave() then return end

    -- don't put bloody shit in the player's way
    if chunk:is_must_walk() then return end
    if chunk.peer and chunk.peer:is_must_walk() then return end

    local A = chunk.area

    local reqs =
    {
      kind  = "decor"
      where = "point"

      size   = assert(chunk.space)
    }

    if is_cave then
      reqs.height = A.room.walkway_height
    else
      reqs.height = A.ceil_h - A.floor_h
    end

    if A.room then
      reqs.env = A.room:get_env()
    end

    local sinkstat = analyse_chunk_sinkage(chunk, "floor")

    if sinkstat != "000" then
      -- require middle of chunk to be in the sink
      if string.sub(sinkstat, 1, 1) != "2" then return end

      -- ignore very small sinks (limited to just this chunk)
      if string.sub(sinkstat, 1, 1) == "0" then return end

      reqs.is_sink = true

      -- reduce maximum size unless *whole* chunk is in the sink
      if sinkstat != "222" then
        reqs.size = 64
      end
    end

    local def = Fab_pick(reqs, "none_ok")
    if not def then return end

    -- don't create pillars under ceiling sinks
    -- TODO : allow it in certain circumstances
    -- FIXME: use 'reqs' to prevent picking them at all
    if def.z_fit and chunk.ceil_above and chunk.ceil_above.content then
      return
    end

    -- for stuff in a sink, ensure it is built at correct Z height
    if reqs.is_sink and chunk.area.floor_group.sink then
      chunk.floor_dz = chunk.area.floor_group.sink.dz
    end

    chunk.content = "DECORATION"
    chunk.prefab_def = def
    chunk.prefab_dir = rand.dir()

    -- prevent pillars clobbering ceiling lights
    if def.z_fit and chunk.ceil_above then
      chunk.ceil_above.content = "NOTHING"
    end

    if chunk.peer and not chunk.peer.content then
      assert(A.room.symmetry)
      local peer = chunk.peer

      peer.content = chunk.content
      peer.prefab_def   = chunk.prefab_def
      peer.prefab_dir   = A.room.symmetry:conv_dir(chunk.prefab_dir)

      if def.z_fit and peer.ceil_above then
        peer.ceil_above.content = "NOTHING"
      end
    end
  end


  local function switch_up_room(R)
    -- locking exits and items

    if THEME.no_switches then return end
    local switch_prob = style_sel("switches", 0, 20, 40, 80)

    for loop = 1, 2 do
      if rand.odds(switch_prob) then
        try_lock_item(R)
        try_intraroom_lock(R)
      end
    end
  end


  local function pick_cage_spot(locs)
    local best
    local best_score = -1

    each chunk in locs do
      local score = gui.random()

      if chunk.kind == "closet" then score = score * 3 end

      if score > best_score then
        best = chunk
        best_score = score
      end
    end

    return assert(best)
  end


  local function extra_cage_prob(R, locs)
    --
    -- Factors determining the probability:
    --   (a) the "cages" style
    --   (b) number of existing cages (ones grown from rules)
    --   (c) the "pressure" value of the room
    --   (d) a dose of randomness
    --

    if #locs == 0 then return 0 end

    -- determine current quantity of free-range cages
    local cage_vol = 0

    each A in R.areas do
      if A.mode == "cage" then
        cage_vol = cage_vol + A.svolume
      end
    end

    cage_vol = cage_vol / R:calc_walk_vol()

--- stderrf("Cage vol = %1.2f  in %s\n", cage_vol, R.name)


    local any_prob = style_sel("cages", 0, 40, 70, 90)

    if R.pressure == "high" or rand.odds(20) then any_prob = any_prob * 1.5 end
    if R.pressure == "low"  or rand.odds(10) then any_prob = any_prob / 2.5 end

    if not rand.odds(any_prob) then return 0 end


    -- fairly rare in caves
    if R.is_cave then return 10 end


    local per_prob = style_sel("cages", 0, 15, 30, 60)

    per_prob = per_prob * (1 - cage_vol * 4)
    per_prob = per_prob * rand.pick({ 0.7, 0.9, 1.1, 1.4 })

    per_prob = math.clamp(1, per_prob, 99)

--[[ DEBUG
stderrf("Cages in %s [%s pressure] --> any_prob=%d  per_prob=%d\n",
        R.name, R.pressure, any_prob, per_prob)
--]]

    return per_prob
  end


  local function try_extra_cages(R)
    -- never have cages in a start room, or secrets
    if R.is_start  then return end
    if R.is_secret then return end

    -- FIXME
    if R.is_park then return end

    -- collect usable chunks
    local locs = {}

    each chunk in R.floor_chunks do
      local A = chunk.area

      if not chunk.content and not chunk.is_bossy and
         not chunk:is_slave() and
         not chunk:is_must_walk() and
         (not chunk.peer or not chunk.peer:is_must_walk()) and
         chunk.sw >= 2 and chunk.sh >= 2 and
         not chunk.content and
         not (A.floor_group and A.floor_group.sink) and
         rand.odds(35)
      then
        table.insert(locs, chunk)
      end
    end

    each chunk in R.closets do
      if not chunk.content and not chunk:is_slave() then
        table.insert(locs, chunk)
      end
    end

    -- decide probability (for use in each spot)
    -- [ not using a quota here -- tried it and it was too non-random ]
    local prob = extra_cage_prob(R, locs)

    -- make the cages
    each chunk in locs do
      if rand.odds(prob) then
        make_cage(chunk)
      end
    end
  end


  local function try_secret_closets(R)
    if table.empty(R.closet_items) then return end

    local locs = {}

    each chunk in R.closets do
      if not chunk.content then
        table.insert(locs, chunk)
      end
    end

    -- WISH : prefer chunks which are not near each other
    --        [ or: larger chunks ]
    rand.shuffle(locs)

    each item in R.closet_items do
      if table.empty(locs) then break; end

      local chunk = table.remove(locs, 1)

      make_secret_closet(chunk, item)
    end
  end


  local function try_make_decor_closet(R, chunk)
    local reqs = chunk:base_reqs(chunk.from_dir)

    -- TODO : REVIEW THIS
    --        [ probably should be "decor" once have a proper picture system ]
    reqs.kind  = "picture"

    reqs.env = R:get_env()

    if R.is_cave then
      reqs.kind = "decor"
      reqs.shape = "U"   -- TODO: chunk.shape,  FIXME: use for pictures too
      reqs.height = R.walkway_height
    end

    chunk.prefab_def = Fab_pick(reqs, "none_ok")

    if not chunk.prefab_def then
      return
    end

--stderrf("decor closet : %s\n", chunk.prefab_def.name)

    chunk.content = "DECORATION"

--????  chunk.prefab_dir = chunk.from_dir

    -- in symmetrical rooms, handle the peer too
    if chunk.peer and not chunk.peer.content then
      local peer = chunk.peer

      peer.content = chunk.content
      peer.prefab_def   = chunk.prefab_def
    end
  end


  local function try_decor_closets(R)
    local locs = {}

    each chunk in R.closets do
      if not chunk.content then
        table.insert(locs, chunk)
      end
    end

    rand.shuffle(locs)

    local use_prob = 100

    each chunk in locs do
      if rand.odds(use_prob) then
        try_make_decor_closet(R, chunk)
      end
    end
  end



  local function pick_wall_detail(R)
    if R.is_cave    then return end
    if R.is_outdoor then return end

    local tab = R.theme.wall_groups or THEME.wall_groups
    if not tab then return end

    -- IDEA : adjust PLAIN prob to get more/less detail

    each fg in R.floor_groups do
      local what = rand.key_by_probs(tab)

      if what != "PLAIN" then
        fg.wall_group = what
      end
    end
  end


  local function grab_usable_sinks(R, group, where)
    -- skip sinks whose texture(s) clash with the room or area

    local tab

    if where == "floor" then
      tab = R.theme.floor_sinks or THEME.floor_sinks
    else
      tab = R.theme.ceiling_sinks or THEME.ceiling_sinks
    end

    assert(tab["PLAIN"])

    tab = table.copy(tab)

    each name in table.keys(tab) do
      if name == "PLAIN" then continue end

      local sink = GAME.SINKS[name]

      if not sink then
        error("Unknown sink: " .. name)
      end

      -- TODO : check floor/ceiling material

      if (sink.trim_mat and sink.trim_mat == R.main_tex)
      then
        tab[name] = nil
      end
    end

    return tab
  end


  local function pick_floor_sinks(R)
    if R.is_cave or R.is_outdoor then return end

    each fg in R.floor_groups do
      if fg.openness < 0.4 then continue end

      local tab = grab_usable_sinks(R, fg, "floor")
      if tab == nil then return end

      local name = rand.key_by_probs(tab)

      if name != "PLAIN" then
        fg.sink = GAME.SINKS[name]
        assert(fg.sink)

        -- TODO : prune liquid sinks first
        if fg.sink.mat == "_LIQUID" and not LEVEL.liquid then
          fg.sink = nil
        end
      end
    end
  end


  local function pick_ceiling_sinks(R)
    if R.is_cave or R.is_outdoor then return end

    each cg in R.ceil_groups do
      if cg.openness < 0.4 then continue end

      local height = cg.h - cg.max_floor_h
      if height < 128 then continue end

      local tab = grab_usable_sinks(R, cg, "ceiling")
      if tab == nil then return end

      local name = rand.key_by_probs(tab)

      if name != "PLAIN" then
        cg.sink = GAME.SINKS[name]
        assert(cg.sink)

        -- inhibit ceiling lights and pillars
        each chunk in R.ceil_chunks do
          if chunk.area.ceil_group == cg and not chunk.content then
            chunk.content = "NOTHING"
          end
        end
      end
    end
  end


  local function select_lamp_for_group(R, cg)
    local reqs =
    {
      kind  = "light"
      where = "point"

      size  = 80
      height = cg.h - cg.max_floor_h

      env = R:get_env()
    }

    return Fab_pick(reqs, "none_ok")
  end


  local function pick_decorative_bling(R)
    local decor_prob = rand.pick({ 20, 55, 90 })

    each chunk in R.floor_chunks do
      if chunk.content == nil and not chunk.is_bossy and rand.odds(decor_prob) then
        try_decoration_in_chunk(chunk)
      end
    end
  end


  local function pick_cavey_bling(R)
    local decor_prob = rand.pick({ 2, 6, 12, 24 })

    each chunk in R.floor_chunks do
      if chunk.content == nil and not chunk.is_bossy and rand.odds(decor_prob) then
        try_decoration_in_chunk(chunk, "is_cave")
      end
    end
  end


  local function pick_ceiling_lights(R)
    if R.is_cave or R.is_outdoor then return end

    local groups = {}

    local prob = R.theme.ceil_light_prob or THEME.ceil_light_prob or 50

    each cg in R.ceil_groups do
      if not rand.odds(prob) then continue end

      local def = select_lamp_for_group(R, cg)
      if not def then continue end

      each chunk in R.ceil_chunks do
        if chunk.area.ceil_group != cg then continue end
        if chunk.content then continue end
        if chunk.floor_below and chunk.floor_below.content then continue end

        if true then
          chunk.content = "DECORATION"
          chunk.prefab_def = def
          chunk.prefab_dir = 2

          chunk.area.bump_light = 16
        end
      end
    end
  end


  local function unsink_chunk(chunk, where)
    local corner_field = where .. "_inner"

    local cx1 = chunk.sx1
    local cx2 = chunk.sx2 + 1

    local cy1 = chunk.sy1
    local cy2 = chunk.sy2 + 1

    for cx = cx1, cx2 do
    for cy = cy1, cy2 do
      local corner = Corner_lookup(cx, cy)
      assert(corner)

      corner[corner_field] = nil
    end
    end
  end


  local function unsink_importants(R)
    -- ensure importants do not sit on a floor sink
    -- TODO : review this, e.g. key pedestal can be OK (but need right floor_z)

    each chunk in R.floor_chunks do
      if (chunk.content and chunk.content != "NOTHING") or chunk.is_bossy then
        unsink_chunk(chunk, "floor")

        if chunk.peer then
          unsink_chunk(chunk.peer, "floor")
        end
      end
    end
  end


  local function fix_stair_lighting(R)
    each chunk in R.stairs do
      local N1 = chunk.from_area
      local N2 = chunk.dest_area

      if N1.bump_light and N2.bump_light then
        chunk.area.bump_light = N1.bump_light
      end
    end
  end


  local function tizzy_up_normal_room(R)
    pick_wall_detail(R)

    pick_floor_sinks(R)
    pick_ceiling_sinks(R)

    unsink_importants(R)

    pick_decorative_bling(R)
    pick_ceiling_lights(R)

    fix_stair_lighting(R)
  end


  local function tizzy_all_closets(R)
    try_secret_closets(R)

    -- more cages, oh yes!
    try_extra_cages(R)

    try_decor_closets(R)

    -- kill any unused closets
    each CL in R.closets do
      if not CL.content then
        kill_closet(CL)
      end
    end
  end


  local function decor_early_pass(R)
    switch_up_room(R)

    -- closets must be decided early for caves
    if R.is_cave or R.is_park then
      pick_cavey_bling(R)

      tizzy_all_closets(R)
    end
  end


  local function decor_later_pass(R)
    if not (R.is_cave or R.is_park) then
      tizzy_up_normal_room(R)
      tizzy_all_closets(R)
    end
  end


  ---| Layout_decorate_rooms |---

  each R in LEVEL.rooms do
    if pass == 1 then
      decor_early_pass(R)
    else
      decor_later_pass(R)
    end
  end
end


------------------------------------------------------------------------


function Layout_scenic_vistas()
  Area_pick_facing_rooms()

  each A in LEVEL.areas do
    if A.mode == "scenic" then
      Cave_prepare_scenic_vista(A)
    end
  end

  each A in LEVEL.areas do
    if A.mode == "scenic" then
      Cave_build_a_scenic_vista(A)
    end
  end
end



function Layout_handle_corners()

  local function need_fencepost(corner) --OLD
    --
    -- need a fence post where :
    --   1. three or more areas meet (w/ different heights)
    --   2. all the areas are outdoor
    --   3. one of the junctions/edges is "rail"
    --   4. none of the junctions/edges are "wall"
    --

    if #corner.areas < 3 then return false end

    post_h = nil

    local heights = {}

    each A in corner.areas do
      if not A.is_outdoor then return false end
      if not A.floor_h then return false end

      table.add_unique(heights, A.floor_h)

      each B in corner.areas do
        local junc = Junction_lookup(A, B)
        if junc then
          if junc.kind == "wall" then return false end
          if junc.kind == "rail" then post_h = assert(junc.post_h) end
        end
      end
    end

    if #heights < 3 then return false end

    return (post_h != nil)
  end


  local function fencepost_base_z(corner)
    local z

    each A in corner.areas do
      z = math.N_max(A.floor_h, z)
    end

    return z
  end


  local function near_porch(corner)
    each A in corner.areas do
      if A.is_porch then return true end
    end

    return false
  end


  local function check_need_fencepost(corner)
    -- already used?
    if corner.kind then return end

    -- cannot place posts next to a wall
    if Corner_touches_wall(corner) then return end

    -- see if we have multiple railings at different heights, and
    -- if so then determine highest one.
    local rail_z
    local need_post

    each junc in corner.junctions do
      if junc.A2 == "map_edge" then return end
      if not junc.E1 then continue end

      if junc.E1.kind != "railing" then continue end

      local cur_z = assert(junc.E1.rail_z)
      cur_z = int(cur_z)

      if not rail_z then
        rail_z = cur_z
        continue
      end

      if cur_z ~= rail_z then
        need_post = true
      end

      rail_z = math.max(rail_z, cur_z)
    end

    if need_post then
      corner.kind = "post"
      corner.post_top_h = rail_z + 76
    end
  end


  local function check_corner(cx, cy)
    local corner = Corner_lookup(cx, cy)

    check_need_fencepost(corner)
  end
  ---| Layout_handle_corners |---

  for cx = 1, SEED_W + 1 do
  for cy = 1, SEED_H + 1 do
    check_corner(cx, cy)
  end
  end
end



function Layout_indoor_lighting()
  --
  -- Give each indoor/cave room a lighting keyword:
  --    "bright"   (160 units)
  --    "normal"   (144 units)
  --    "dark"     (128 units)
  --    "verydark" ( 96 units)
  --
  -- (Note: light levels are lower in caves)
  --
  -- Outdoor rooms are not affected here, but get a keyword which
  -- depends on the global "sky_light" value.
  --
  -- Individual areas can be increased by +16 or +32 based on what
  -- light sources are in that area (including windows).
  --

  local LIGHT_LEVELS =
  {
    bright   = 160
    normal   = 144
    dark     = 120
    verydark = 104
  }

  local CAVE_LEVELS =
  {
    bright   = 144
    normal   = 128
    dark     = 112
    verydark = 96
  }

  local function sky_light_to_keyword()
    if LEVEL.sky_light >= 168 then return "bright" end
    if LEVEL.sky_light >= 136 then return "normal" end
    if LEVEL.sky_light >= 120 then return "dark" end
    return "verydark"
  end


  local function set_room(R, what)
    R.light_level = what

    local base_light

    if R.is_cave then
      base_light = CAVE_LEVELS[what]
    else
      base_light = LIGHT_LEVELS[what]
    end

    assert(base_light)

    if R.theme.light_adjusts then
      base_light = base_light + rand.pick(R.theme.light_adjusts)
    end

    each A in R.areas do
      A.base_light = base_light
    end
  end

 -- Very dark here! --Glaice

  local function visit_room(R, prev_room)
    local tab = { bright=20, normal=45, dark=65, verydark=25 }

    if R.is_start then
      tab["verydark"] = nil
    end

    if prev_room then
      assert(prev_room.light_level)

      if prev_room.light_level != "normal" or rand.odds(30) then
        tab[prev_room.light_level] = nil
      end
    end

    if not R.light_level then
      set_room(R, rand.key_by_probs(tab))
    end

    -- recurse to neighbors
    each C in R.conns do
      if C.is_cycle then continue end

      local R2 = C:other_room(R)

      if R2.lev_along > R.lev_along then
        visit_room(R2, R)
      end
    end
  end


  ---| Layout_indoor_lighting |---

  -- setup outdoor rooms first
  each R in LEVEL.rooms do
    if R.is_outdoor then
      -- cannot use set_room() here
      R.light_level = sky_light_to_keyword()
    end

    if R.is_hallway then
      R.light_level = rand.pick({ 104,112,120,128,136,144,152})
    end
  end

  visit_room(LEVEL.start_room)
end



function Layout_outdoor_shadows()

  local function need_shadow(S, dir)
    if not S.area then return false end

    local N = S:neighbor(dir)

    if not (N and N.area) then return false end

    local SA = S.area
    local NA = N.area

    if not NA.is_outdoor or NA.mode == "void" or NA.is_porch then return false end
    if not SA.is_outdoor or SA.mode == "void" or SA.is_porch then return true end

    if SA == NA then return false end

    local E1 = S.edge[dir]
    local E2 = N.edge[10 - dir]

    local junc = Junction_lookup(SA, NA)

    if not E1 then E1 = junc.E1 end
    if not E2 then E2 = junc.E2 end

    if E1 and Edge_is_wallish(E1) then return true end
    if E2 and Edge_is_wallish(E2) then return true end

    return false
  end


  local function shadow_from_seed(S, dir)
    local dx = 64
    local dy = 96

    local brush
    local wall

    if dir == 2 then
      brush =
      {
        { m = "light", sky_shadow=LEVEL.sky_shadow }
        { x = S.x1     , y = S.y1      }
        { x = S.x1 - dx, y = S.y1 - dy }
        { x = S.x2 - dx, y = S.y1 - dy }
        { x = S.x2     , y = S.y1 - 16 }
        { x = S.x2     , y = S.y1      }
      }
    elseif dir == 4 then
      brush =
      {
        { m = "light", sky_shadow=LEVEL.sky_shadow }
        { x = S.x1     , y = S.y1      }
        { x = S.x1     , y = S.y2      }
        { x = S.x1 - 16, y = S.y2      }
        { x = S.x1 - dx, y = S.y2 - dy }
        { x = S.x1 - dx, y = S.y1 - dy }
      }
    elseif dir == 1 then
      brush =
      {
        { m = "light", sky_shadow=LEVEL.sky_shadow }
        { x = S.x1     , y = S.y2      }
        { x = S.x1 - dx, y = S.y2 - dy }
        { x = S.x2 - dx, y = S.y1 - dy }
        { x = S.x2     , y = S.y1      }
      }
    elseif dir == 3 then
      brush =
      {
        { m = "light", sky_shadow=LEVEL.sky_shadow }
        { x = S.x1     , y = S.y1      }
        { x = S.x1 - dx, y = S.y1 - dy }
        { x = S.x2 - dx, y = S.y2 - dy }
        { x = S.x2     , y = S.y2      }
      }
    else
      -- nothing needed
      return
    end

    raw_add_brush(brush)
  end


  ---| Layout_outdoor_shadows |---

  if LEVEL.sky_shadow < 8 then
    return
  end

  each A in LEVEL.areas do
  each S in A.seeds do
  each dir in geom.ALL_DIRS do
    if need_shadow(S, dir) then
      shadow_from_seed(S, dir)
    end
  end -- A, S, dir
  end
  end
end

