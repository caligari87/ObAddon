------------------------------------------------------------------------
--  MONSTERS / HEALTH / AMMO
------------------------------------------------------------------------
--
--  Oblige Level Maker
--
--  Copyright (C) 2008-2017 Andrew Apted
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


function Monster_init()
  LEVEL.mon_stats = {}

  -- build replacement table --

  LEVEL.mon_replacement = {}

  local dead_ones = {}

  each name,info in GAME.MONSTERS do
    local orig = info.replaces
    if orig then
      assert(info.replace_prob)
      if not GAME.MONSTERS[orig] then
        dead_ones[name] = true
      else
        if not LEVEL.mon_replacement[orig] then
          -- the basic replacement table allows the monster to
          -- pick itself at the time of replacement.
          LEVEL.mon_replacement[orig] = { [orig]=70 }
        end
        LEVEL.mon_replacement[orig][name] = info.replace_prob
      end
    end
  end

  -- remove a replacement monster if the monster it replaces
  -- does not exist (e.g. stealth_gunner in DOOM 1 mode).
  each name,_ in dead_ones do
    GAME.MONSTERS[name] = nil
  end
end



function Monster_prepare()

  ---| Monster_prepare |---

  Monster_init()
end



function Monster_pacing()
  --
  -- Give each room a "pressure" value (low / medium / high) which
  -- controls the quantity of monsters in that room, including mons
  -- in cages and the number of traps to use.
  --
  -- General rules:
  --   +  START room is always "low"
  --   +  EXIT room is always "high" (but take bosses into account)
  --   +  GOAL rooms are "medium" or "high" (but take bosses into account)
  --   +  hallways are always "low"
  --
  --   +  room AFTER start room is usualy "medium", never "low"
  --   +  rooms that begin a new zone are never "high"
  --   +  rooms entered for first time via teleporter are never "high"
  --   +  prevent three rooms in a row with same pressure
  --

  local room_list

  local  low_quota
  local high_quota

  local amounts = { low=0, medium=0, high=0 }


  local function collect_rooms()
    room_list = {}

    each R in LEVEL.rooms do
      if R.is_hallway or R.is_secret then
        R.pressure = "low"
        continue
      end

      table.insert(room_list, R)
    end
  end


  local function mark_connections()
    each C in LEVEL.conns do
      local R1 = C.R1
      local R2 = C.R2

      if R1.lev_along > R2.lev_along then
        R1, R2 = R2, R1
      end

      if C.kind == "teleporter" then
        R2.is_teleport_dest = true
      end

      if R1.zone != R2.zone then
        -- TODO : skip a hallway
        R2.is_zone_entry = true
      end

      if R1.is_start then
        -- TODO : skip a hallway
        R2.is_after_start = true
      end
    end
  end


  local function set_room(R, what)
    if R.pressure then
      amounts[R.pressure] = amounts[R.pressure] - 1
    end

    R.pressure = what

    amounts[what] = (amounts[what] or 0) + 1
  end


  local function handle_known_room(R)
    if R == LEVEL.exit_room then
      set_room(R, "high")
      return
    end

    if R.is_start then
      set_room(R, "low")
      return
    end

    if R.goals[1] then
      local high_prob = 90

      if R.is_teleport_dest then
        high_prob = 40
      elseif R.zone == LEVEL.exit_room.zone then
        high_prob = 60
      end

      set_room(R, rand.sel(high_prob, "high", "medium"))
      return
    end
  end


  local function is_isolated(R)
    if R.is_teleport_dest then return false end
    if R.is_zone_entry    then return false end
    if R.is_after_start   then return false end

    local count = 0

    each C in R.conns do
      if C.lock then continue end
      if C.is_secret then continue end
      if C.kind == "teleporter" then continue end

      local N = C:other_room(R)

      if N.pressure then return false end

      count = count + 1
    end

    return (count >= 2)
  end


  local function handle_isolated_room(R)
    local tab = { low=60, high=40, medium=2 }

    if amounts.low  >=  low_quota then tab["low"]  = nil end
    if amounts.high >= high_quota then tab["high"] = nil end

    local what = rand.key_by_probs(tab)

    set_room(R, "medium")
  end


  local function find_isolated_rooms()
    rand.shuffle(room_list)

    each R in room_list do
      if not R.pressure and is_isolated(R) then
        handle_isolated_room(R)
      end
    end
  end


  local function handle_remaining_room(R)
    local tab = { low=32, medium=64, high=32 }

    -- avoid being same as a direct neighbor
    each C in R.conns do
      if C.lock then continue end
      if C.is_secret then continue end

      local N = C:other_room(R)

      if N.pressure then
        tab[N.pressure] = tab[N.pressure] / 4
      end
    end

    -- enforce the quotas
    if amounts.low  >=  low_quota then tab["low"]  = nil end
    if amounts.high >= high_quota then tab["high"] = nil end

    -- enforce other logic
    if R.is_after_start   then tab["low"]  = nil end
    if R.is_teleport_dest then tab["high"] = nil end

    local what = rand.key_by_probs(tab)

    set_room(R, what)
  end


  local function visit_the_rest()
    rand.shuffle(room_list)

    each R in room_list do
      if not R.pressure then
        handle_remaining_room(R)
      end
    end
  end


  local function dump_pacing()
    gui.debugf("\nPacing:\n");

    gui.debugf("  quota : low=%d high=%d\n", low_quota, high_quota)
    gui.debugf("  totals: low=%d high=%d medium=%d\n", amounts.low, amounts.high, amounts.medium)

    each Z in LEVEL.zones do
      gui.debugf("%s:\n", Z.name)

      each R in Z.rooms do
        gui.debugf("   %s = %-6s : %s\n", R.name, R.pressure or "--UNSET--",
                   (R.goals[1] and R.goals[1].kind) or "")
      end
    end
  end


  ---| Monster_pacing |---

  collect_rooms()

  local QUOTA_LIST = { 0.17, 0.25, 0.33 }

   low_quota = rand.int(#room_list * rand.pick(QUOTA_LIST) + 1)
  high_quota = rand.int(#room_list * rand.pick(QUOTA_LIST) + 1)

  mark_connections()

  each R in room_list do
    handle_known_room(R)
  end

  find_isolated_rooms()

  visit_the_rest()

  dump_pacing()
end



function Monster_assign_bosses()
  --
  -- Distribute the planned boss fights to specific rooms.
  --

  local function eval_room(R, bf)
    -- never in secrets
    if R.is_secret   then return -2 end
    if R.no_monsters then return -2 end

    -- already has one?
    if R.boss_fight then return -1 end

    -- require a goal (e.g. a KEY)
    if #R.goals == 0 then return -1 end

    -- check room size
    -- [ TODO : this can be vastly improved, check floor chunks, closets and cages ]
    if R.svolume < 30 and bf.boss_type == "tough" then return -3 end
    if R.svolume < 15 and bf.boss_type == "nasty" then return -3 end

    if R.is_start and bf.boss_type != "guard" then return -3 end

    -- OK --

    local score = 1

    if not R.is_start then score = score + 500 end

    if R.is_exit then score = score + 40 end

    score = score + R.svolume

    -- tie breaker
    return score + gui.random() * 3
  end


  local function pick_room(bf)
    local best
    local best_score = 0

    each R in LEVEL.rooms do
      local score = eval_room(R, bf)

      if score > best_score then
        best = R
        best_score = score
      end
    end

    return best
  end


  local function avoid_guard_monster(R, mon)
    -- prevent using a guard monster as a normal (fodder) monster
    -- in this room and some nearby rooms

    R.avoid_mons[mon] = true

    each N in R.quest.rooms do
      N.avoid_mons[mon] = true
    end

    for loop = 1, 2 do
      if R.entry_conn then
        R = R.entry_conn:other_room(R)

        R.avoid_mons[mon] = true
      end
    end
  end


  ---| Monster_assign_bosses |---

  each bf in LEVEL.boss_fights do
    local R = pick_room(bf)

    if R then
      R.boss_fight = bf

      gui.debugf("Boss fight '%s' in %s\n", bf.mon, R.name)

      if bf.boss_type == "guard" then
        avoid_guard_monster(R, bf.mon)
      end
    end
  end
end



function Monster_zone_palettes()

  local function palettes_are_same(A, B)
    if table.size(A) != table.size(B) then
      return false
    end

    each k,v1 in A do
      local v2 = B[k]

      if not v2 or math.abs(v1 - v2) > 0.1 then
        return false
      end
    end

    return true
  end


  local function palette_toughness(pal)
    local total = 0
    local size  = table.size(pal)

    each mon,qty in pal do
      if qty <= 0 then continue end

      local info = assert(GAME.MONSTERS[mon])

      total = total + info.damage * qty
    end

    -- tie breaker
    return (total / size) * 10 + gui.random()
  end


  local function gen_quantity_set(total)
    -- the indices represent: none | less | some | more
    local quants = {}

    local skip_perc = rand.pick(PARAM.skip_monsters or { 25 })

    -- skip less monsters in small early maps
    if #LEVEL.zones == 1 and LEVEL.monster_level < 5 then
      skip_perc = skip_perc / 2
    end

    quants[0] = int(total * skip_perc / 100 + gui.random() * 0.7)
    total = total - quants[0]

    quants[2] = int(total * rand.range(0.3, 0.7) + gui.random())
    total = total - quants[2]

    quants[1] = int(total * rand.range(0.3, 0.7) + gui.random())
    total = total - quants[1]

    quants[3] = total
    assert(total >= 0)

    return quants
  end


  local QUANT_VALUES = { 0.0, 0.4, 1.0, 2.2 }

  local function pick_quant(quants)
    assert(quants[0] + quants[1] + quants[2] + quants[3] > 0)

    local idx

    repeat
      idx = rand.irange(0, 3)
    until quants[idx] > 0

    quants[idx] = quants[idx] - 1

    return assert(QUANT_VALUES[1 + idx])
  end


  local function generate_palette(base_pal)
    local total = table.size(base_pal)

    if total <= 1 then
      return table.copy(base_pal)
    end


    local pal = {}

    local quants = gen_quantity_set(total)

    each mon,_ in base_pal do
      local qty = pick_quant(quants)

      if qty > 0 then
        pal[mon] = qty
      end
    end

    assert(not table.empty(pal))

    return pal
  end


  local function dump_palette(pal)
    each mon,qty in pal do
      gui.debugf("   %-12s* %1.2f\n", mon, qty)
    end

    gui.debugf("   TOUGHNESS: %d\n", palette_toughness(pal))
  end


  ---| Monster_zone_palettes |---

  local zone_pals = {}

  for i = 1, #LEVEL.zones do
    local pal   = generate_palette(LEVEL.global_pal)
    local tough = palette_toughness(pal)

    zone_pals[i] = { pal=pal, tough=tough }
  end

  -- ensure weakest palette is first, strongest is last
  table.sort(zone_pals,
      function (A, B) return A.tough < B.tough end)

  for i = 1, #LEVEL.zones do
    local Z = LEVEL.zones[i]

    Z.mon_palette = zone_pals[i].pal

    gui.debugf("Monster palette in ZONE_%d:\n", Z.id)
    dump_palette(Z.mon_palette)
  end
end



function Monster_dist_between_spots(A, B, z_penalty)
  local dist_x = 0
  local dist_y = 0

      if A.x1 > B.x2 then dist_x = A.x1 - B.x2
  elseif A.x2 < B.x1 then dist_x = B.x1 - A.x2
  end

      if A.y1 > B.y2 then dist_y = A.y1 - B.y2
  elseif A.y2 < B.y1 then dist_y = B.y1 - A.y2
  end

  local dist = math.max(dist_x, dist_y)

  -- penalty for height difference [for clustering]
  if B.z1 and A.z1 != B.z1 then
    dist = dist + (z_penalty or 1000)
  end

  return dist
end



function Monster_split_spots(list, max_size)
  -- recreate the spot list
  local new_list = {}

  each spot in list do
    local w, h = geom.box_size(spot.x1, spot.y1, spot.x2, spot.y2)

    local XN = int(w / max_size)
    local YN = int(h / max_size)

    if XN < 2 and YN < 2 then
      table.insert(new_list, spot)
      continue
    end

    for x = 1, XN do
    for y = 1, YN do
      local x1 = spot.x1 + (x - 1) * w / XN
      local x2 = spot.x1 + (x    ) * w / XN

      local y1 = spot.y1 + (y - 1) * h / YN
      local y2 = spot.y1 + (y    ) * h / YN

      local new_spot = table.copy(spot)

      new_spot.x1 = int(x1) ; new_spot.y1 = int(y1)
      new_spot.x2 = int(x2) ; new_spot.y2 = int(y2)
      new_spot.marked = nil

      table.insert(new_list, new_spot)
    end
    end
  end

  return new_list
end



function Monster_collect_big_spots(R)

  local function big_spots_from_mon_spots()
    each spot in R.mon_spots do
      local w = spot.x2 - spot.x1
      local h = spot.y2 - spot.y1

      if w >= 220 and h >= 220 then
        local new_spot = table.copy(spot)

        new_spot.score = rand.range(1, 10)

        table.insert(R.big_spots, new_spot)
      end
    end
  end


  local function extract_big_item_spots()
    for i = #R.item_spots, 1, -1 do
      local spot = R.item_spots[i]

      if spot.kind == "big_item" then
        table.remove(R.item_spots, i)
        table.insert(R.big_spots, spot)

        spot.score = (spot.rank or 1) * 5 + 7 * gui.random() ^ 3
      end
    end
  end


  ---| Monster_collect_big_spots |---

  big_spots_from_mon_spots()

  extract_big_item_spots()
end



function Monster_visibility(R)
  --
  -- From the entry point(s) of a room, give some spots a "vis" value
  -- which can be:
  --   0 : directly visible from entry
  --   1 : only visible to a vis==0 spot
  --   2 : only visible to a vis==1 spot
  --
  -- One important usage for this is adding monsters to a START room,
  -- we require that they occupy a spot with vis >= 2.
  --

  local spot_list = {}

  local LARGE = 128


  local function is_large(spot)
    local size = (spot.x2 - spot.x1) + (spot.y2 - spot.y1)

    return size > (LARGE * 2)
  end


  local function collect_spots()
    local small_list = {}
    local large_list = {}

    each spot in R.mon_spots do
      if is_large(spot) then
        table.insert(large_list, spot)
      else
        table.insert(small_list, spot)
      end
    end

    rand.shuffle(small_list)
    rand.shuffle(large_list)

    for i = 1, 20 do
      if small_list[i] then
        table.insert(spot_list, small_list[i])
      end
    end

    for i = 1, 10 do
      if large_list[i] then
        table.insert(spot_list, large_list[i])
      end
    end
  end


  local function check_point_to_point(A, B, x_pos, y_pos)
    local ax = A.x1 * x_pos + A.x2 * (1 - x_pos)
    local ay = A.y1 * y_pos + A.y2 * (1 - y_pos)

    local bx = B.x1 * x_pos + B.x2 * (1 - x_pos)
    local by = B.y1 * y_pos + B.y2 * (1 - y_pos)

    local az = A.z1 + 50
    local bz = B.z1 + 50

    if gui.trace_ray(mx, my, mz, ax - pdx, ay - pdy, az, "v") then
      -- something in the way
      return false
    end

    -- a clear LOS
    return true
  end


  local function check_spot_to_spot(A, B)
    -- see if spots are close to each other

    if geom.boxes_overlap(A.x1 - 40, A.y1 - 40, A.x2 + 40, A.y2 + 40,
                          B.x1 - 40, B.y1 - 40, B.x2 + 40, B.y2 + 40)
    then
      return true
    end


    -- now check some rays

    local num_across = 1
    local num_down   = 1

    if (A.x2 - A.x1 > LARGE) or (B.x2 - B.x1 > LARGE) then
      num_across = 2
    end

    if (A.y2 - A.y1 > LARGE) or (B.y2 - B.y1 > LARGE) then
      num_down = 2
    end

    for kx = 1, num_across do
    for ky = 1, num_down do
      local x_pos = 0.5
      local y_pos = 0.5

      if num_across == 2 then x_pos = sel(kx == 1, 0.2, 0.8) end
      if num_down   == 2 then y_pos = sel(ky == 1, 0.2, 0.8) end

      if check_point_to_point(A, B, x_pos, y_pos) then
        return true  -- there is a LOS
      end
    end -- kx, ky
    end

    return false
  end


  local function spread_vis(source_vis)
    each A in spot_list do
      if A.vis != source_vis then continue end

      each B in spot_list do
        if not B.vis and check_spot_to_spot(A, B) then
          B.vis = source_vis + 1
        end
      end
    end
  end


  ---| Monster_visibility |---

  collect_spots()

  each A in R.entry_spots do
    each B in spot_list do
      if check_spot_to_spot(A, B) then
        B.vis = 0
      end
    end
  end

  spread_vis(0)

  each B in spot_list do
    if not B.vis then
      B.vis = 2
    end
  end
end



function Monster_fill_room(R)
  --
  -- Decides what monsters to put in a room or hallway, and places them.
  -- Handles cages and traps too.
  --

  local fodder_tally
  local   cage_tally


  local function is_big(mon)
    return GAME.MONSTERS[mon].r > 30
  end

  local function is_huge(mon)
    return GAME.MONSTERS[mon].r > 60
  end


  local function number_of_kinds()
    if R.is_hallway then
      return rand.sel(66, 1, 2)
    end

    -- the base number of species depends on room size
    local base_num = math.sqrt(fodder_tally) / 5.0

    -- a pinch of randomness
    base_num = base_num + 1.5 * gui.random() ^ 2

    local factor

    if OB_CONFIG.mons == "mixed" then
      factor = rand.range(MONSTER_KIND_TAB.few, MONSTER_KIND_TAB.heaps)
    else
      factor = MONSTER_KIND_TAB[OB_CONFIG.mons]
    end

    -- apply 'mon_variety' style
    -- [ this style is only set via the Level Control module ]
    factor = factor * style_sel("mon_variety", 0, 0.5, 1.0, 2.1)

    -- slightly more at end of a game
    factor = factor * (0.8 + LEVEL.game_along * 0.4)

    -- apply the room "pressure" type
    if R.pressure == "low"  then factor = factor / 2.1 end
    if R.pressure == "high" then factor = factor * 1.4 end

    local num = base_num * factor

--[[ DEBUG
    gui.debugf("raw number_of_kinds in %s : tally:%d / %d seeds | base:%1.2f factor:%1.2f ---> %1.2f\n",
               R.name, fodder_tally, R.svolume, base_num, factor, num)
--]]
    num = int(base_num)

    if num < 1 then num = 1 end
    if num > 5 then num = 5 end

    gui.debugf("number_of_kinds: %d (base: %d)\n", num, base_num)

    return num
  end


  local function calc_quantity()
    --
    -- result is a percentage (how many spots to use)
    --

    local qty

    if OB_CONFIG.mons == "mixed" then
      if OB_CONFIG.mix_it_up_lower_range == OB_CONFIG.mix_it_up_upper_range then
        error("Please pick different values for the Mix It Up range options, or don't use Mix It Up at all.")
      end
      qty = rand.range(MONSTER_QUANTITIES[OB_CONFIG.mix_it_up_lower_range], MONSTER_QUANTITIES[OB_CONFIG.mix_it_up_upper_range])
    else
      qty = MONSTER_QUANTITIES[OB_CONFIG.mons]
      assert(qty)
    end

  --hallway edits Glaice

    -- hallways have limited spots
    if R.is_hallway then
      --return qty * rand.pick({10,20,30})
        return qty * rand.pick({3,5,10,12,15,20,22,25,30})
    end

    -- less in secrets (usually much less)
    if R.is_secret and OB_CONFIG.secret_monsters == "yes" then
      qty = qty * 2
    else
      qty = qty * 8
    end

    -- game and theme adjustments
    qty = qty * (PARAM.monster_factor or 1)
    qty = qty * (THEME.monster_factor or 1)

    -- apply the room "pressure" type
    if R.pressure == "low"  then qty = qty / 2.5 end
    if R.pressure == "high" then qty = qty * 1.5 end

    -- game along adjustment
    qty = qty * (0.9 + LEVEL.game_along * 0.2)

--[[ DEBUG
    gui.debugf("raw quantity in %s --> %1.2f\n", R.name, qty)
--]]

    -- a small random adjustment
    qty = qty * rand.range(0.9, 1.1)

    gui.debugf("Quantity = %1.1f%%\n", qty)
    return qty
  end


  local function categorize_room_size()
    -- hallways are always small : allow any monsters
    if R.is_hallway then return end

    -- anything goes for the final battle
    if R.is_exit then return end

    -- occasionally break the rules
    if rand.odds(6) then return end

    -- often allow any monsters in caves
    if R.is_cave and rand.odds(27) then return end

    -- value depends on total area of monster spots
    local area = 0

    each spot in R.mon_spots do
      area = area + (spot.x2 - spot.x1) * (spot.y2 - spot.y1)
    end

    -- adjust result to be relative to a single seed
    area = area / (SEED_SIZE * SEED_SIZE)

    gui.debugf("roam area = %1.2f\n", area)


    -- random adjustment
    area = area * rand.range(0.80, 1.25)

    -- caves are often large -- adjust for that
    if R.is_cave then area = area * 0.7 - 8 end

    if area < 4 then
      R.room_size = "small"
    elseif area < 12 then
      R.room_size = "medium"
    else
      R.room_size = "large"
    end
  end


  local function room_size_factor(mon)
    local info = GAME.MONSTERS[mon]

    if not    R.room_size then return 1 end
    if not info.room_size then return 1 end

    if room_size == "any" then return 1 end

    -- a good match
    if info.room_size == R.room_size then return 1 end

    -- close but no cigar
    if info.room_size == "medium" or R.room_size == "medium" then
      return 1 / 3
    end

    -- big difference: one was "small" and the other was "large"
    return 1 / 10
  end


  local function time_to_kill_factor(mon)
    local info = GAME.MONSTERS[mon]

    local time = info.health / R.firepower

    if PARAM.time_factor then
      time = time * PARAM.time_factor
    end

    local max_time = 10 -- seconds

    if time > max_time*2 then
      return 0.25
    elseif time > max_time then
      return 0.5
    else
      return 1.0
    end
  end


  local function tally_spots(spot_list)
    -- This is meant to give a rough estimate, and assumes each monster
    -- fits in a 64x64 square and there is no height restrictions.
    -- We can adjust for the real monster size later.

    local count = 0

    each spot in spot_list do
      local w, h = geom.box_size(spot.x1, spot.y1, spot.x2, spot.y2)

      w = int(w / 64) ; if w < 1 then w = 1 end
      h = int(h / 64) ; if h < 1 then h = 1 end

      count = count + w * h
    end

    return count
  end


  local function tally_cage_spots()
    local total = 0

    each cage in R.cages do
      total = total + tally_spots(cage.mon_spots)
    end

    return total
  end


  local function calc_central_dist(mx, my)
    -- TODO: improve this

    local rx1 = SEEDS[R.sx1][R.sy1].x1
    local ry1 = SEEDS[R.sx1][R.sy1].y1
    local rx2 = SEEDS[R.sx2][R.sy2].x2
    local ry2 = SEEDS[R.sx2][R.sy2].y2

    local cent_x, cent_y = geom.box_mid(rx1, ry1, rx2, ry2)

    local dist = geom.dist(cent_x, cent_y, mx, my)

    -- normalize result to be in units of roomy sections
    return dist / (SEED_SIZE * 4)
  end


  local function mark_ambush_spots()
    if R.is_hallway then return end
    if R.is_cave or R.is_park then return end

    -- this also determines the 'central_dist' field of spots

    each spot in R.mon_spots do
      -- already processed?
      if spot.marked then continue end

      spot.marked = true

      local mx, my = geom.box_mid(spot.x1, spot.y1, spot.x2, spot.y2)
      local mz = spot.z1 + 50

      spot.central_dist = calc_central_dist(mx, my)

      -- TODO: more than one ambush focus per room
      local ambush_focus = R.ambush_focus

      if not ambush_focus then continue end

      local ax = ambush_focus.x
      local ay = ambush_focus.y
      local az = ambush_focus.z

      -- too close?
      if geom.dist(mx, my, ax, ay) < 80 then continue end

      spot.ambush_angle = geom.calc_angle(ax - mx, ay - my)

      local ang = ambush_focus.angle

      -- check TWO points separated perpendicular to the entry angle
      local pdx = math.sin(ang * math.pi / 180) * 48
      local pdy = math.cos(ang * math.pi / 180) * 48

      if gui.trace_ray(mx, my, mz, ax + pdx, ay + pdy, az, "v") and
         gui.trace_ray(mx, my, mz, ax - pdx, ay - pdy, az, "v")
      then
        spot.ambush = ambush_focus
      end
    end
  end


  local function default_level(info)
    local hp = info.health

    if hp < 45  then return 1 end
    if hp < 130 then return 3 end
    if hp < 450 then return 5 end

    return 7
  end


  local function calc_strength_factor(info)
    -- weaker monsters in secrets
    if R.is_secret and OB_CONFIG.secret_monsters == "yes" then return 1 / info.damage end

    local factor = default_level(info)

    if OB_CONFIG.strength == "weak"   then return 1 / (1.7 ^ factor) end
    if OB_CONFIG.strength == "easier" then return 1 / (1.3 ^ factor) end

    if OB_CONFIG.strength == "harder" then return 1.3 ^ factor end
    if OB_CONFIG.strength == "tough"  then return 1.7 ^ factor end

    return 1.0
  end


  local function prob_for_mon(mon, spot_kind)
    local info = GAME.MONSTERS[mon]
    local prob = info.prob

    if not LEVEL.global_pal[mon] then
      return 0
    end

    if R.avoid_mons[mon] then
      return 0
    end

    if info.weap_min_damage and info.weap_min_damage > Player_max_damage() then
      return 0
    end

    if info.weap_needed and not Player_has_weapon(info.weap_needed) then
      return 0
    end

    if THEME.monster_prefs then
      prob = prob * (THEME.monster_prefs[mon] or 1)
    end
    if R.theme.monster_prefs then
      prob = prob * (R.theme.monster_prefs[mon] or 1)
    end

    if spot_kind == "cage" then
      -- cage monsters need a long distance attack
      if info.attack == "melee" then return 0 end

      -- less preference for flying monsters
      if info.float then prob = prob * 0.5 end
    end

    if R.is_outdoor then
      prob = prob * (info.outdoor_factor or 1)
    end

    if prob == 0 then return 0 end


    -- apply user's Strength setting
    prob = prob * calc_strength_factor(info)


    -- level check (harder monsters occur in later rooms)
    assert(info.level)

    if not (#R.goals > 0 or R.is_exit or spot_kind == "trap") then
      local max_level = LEVEL.monster_level * (0.5 + R.lev_along / 2)
      if max_level < 2 then max_level = 2 end

      if info.level > max_level then
        prob = prob / 20
      end
    end

    return prob
  end


  local function density_for_mon(mon)
    local info = GAME.MONSTERS[mon]

    local d = info.density or 1

    -- level check
    if OB_CONFIG.strength != "crazy" then
      local max_level = LEVEL.monster_level * R.lev_along
      if max_level < 2 then max_level = 2 end

      if info.level > max_level then
        d = d / 4
      end
    end

    -- adjustment for single-monster levels
    if STYLE.mon_variety == "none" then
      d = (d + 1) / 2
    end

    -- zone quantities
    d = d * (R.zone.mon_palette[mon] or 1)

    -- room size check
    d = d * room_size_factor(mon) ^ 0.5

    -- would the monster take too long to kill?
    d = d * time_to_kill_factor(mon)

    -- random variation
    d = d * rand.range(0.8, 1.2)

    return d
  end


  local function crazy_palette()
    local num_kinds

    if R.is_hallway then
      num_kinds = rand.index_by_probs({ 20, 40, 60 })
    else
      local size = math.sqrt(R.svolume)
      num_kinds = int(size / 1.2)
    end

    local list = {}

    each mon,info in GAME.MONSTERS do
      local prob = info.crazy_prob or 50

      if not LEVEL.global_pal[mon] then prob = 0 end

      if info.weap_needed and not Player_has_weapon(info.weap_needed) then
        prob = 0
      end

      -- weaker monsters in secrets
      if R.is_secret and OB_CONFIG.secret_monsters == "yes" then prob = prob / info.damage end

      if prob > 0 then
        list[mon] = prob
      end
    end

    local palette = {}

    gui.debugf("Monster palette: (%d kinds, %d actual)\n", num_kinds, table.size(list))

    for i = 1,num_kinds do
      if table.empty(list) then break; end

      local mon = rand.key_by_probs(list)
      palette[mon] = list[mon]

      gui.debugf("  #%d %s\n", i, mon)
      LEVEL.mon_stats[mon] = (LEVEL.mon_stats[mon] or 0) + 1

      list[mon] = nil
    end

    return palette
  end


  local function room_palette()
    local list = {}
    gui.debugf("Monster list:\n")

    each mon,qty in R.zone.mon_palette do
      local prob = prob_for_mon(mon, info)

      prob = prob * qty

      -- take room size into account
      prob = prob * room_size_factor(mon)

      if prob > 0 then
        list[mon] = prob
        gui.debugf("  %s --> prob:%1.1f\n", mon, prob)
      end
    end

    local num_kinds = number_of_kinds()

    local palette = {}

    gui.debugf("Monster palette: (%d kinds, %d actual)\n", num_kinds, table.size(list))

    for i = 1, num_kinds do
      if table.empty(list) then break; end

      local mon  = rand.key_by_probs(list)
      local prob = list[mon]
      list[mon] = nil

      -- sometimes replace it completely (e.g. all demons become spectres)
      if rand.odds(25) and LEVEL.mon_replacement[mon] then
        mon = rand.key_by_probs(LEVEL.mon_replacement[mon])
      end

      palette[mon] = prob

      gui.debugf("  #%d %s\n", i, mon)
      LEVEL.mon_stats[mon] = (LEVEL.mon_stats[mon] or 0) + 1
    end

    return palette
  end


  local function quantize_angle(a)
    if PARAM.fine_angles then return a end

    local a1 = math.floor(a / 45)
    local a2 = math.ceil (a / 45)

    a = rand.sel(50, a1, a2)

    return bit.band(a, 7) * 45
  end


  local function angle_between_points(x, y, nx, ny)
    local ang = geom.calc_angle(nx - x, ny - y)

    -- randomize a bit
    ang = ang + 50 * rand.skew()

    return quantize_angle(ang)
  end


  local function monster_angle(spot, x, y, z, focus)
    -- TODO: sometimes make all monsters (or a certain type) face
    --       the same direction, or look towards the entrance, or
    --       towards the guard_spot.

    local away = false

    if spot.face_away then
      focus = spot.face_away
      away  = true
    elseif spot.face then
      focus = spot.face
    end

    if R.force_mon_angle and not spot.face then
      return R.force_mon_angle
    end

    if rand.odds(R.random_face_prob) and not away and not spot.face then
      focus = nil
    end

    -- look toward something [or away from something]
    if focus then
      local ang = angle_between_points(x, y, focus.mx, focus.my)

      if away then
        ang = geom.angle_add(ang, 180)
      end

      return ang
    end

    -- fallback : purely random angle
    return rand.irange(0,7) * 45
  end


  local function calc_min_skill(all_skills)
    if all_skills then return 1 end

    local dither = alloc_id("mon_dither")

    -- skill 3 (hard) is always added
    -- skill 2 (medium) alternates between 100% and 60% chance
    -- skill 1 (easy) is always 60% chance of adding

    if rand.odds(60) then
      return 1
    elseif (dither % 2) == 0 then
      return 2
    else
      return 3
    end
  end


  local function place_monster(mon, spot, x, y, z, all_skills, mode)
    -- mode is usually NIL, can be "cage" or "trap"

    local info = GAME.MONSTERS[mon]

    -- handle replacements
    if LEVEL.mon_replacement[mon] and not R.no_replacement then
      mon  = rand.key_by_probs(LEVEL.mon_replacement[mon])
      info = assert(GAME.MONSTERS[mon])
    end

    table.insert(R.monster_list, { info=info, is_cage=(mode == "cage") })

    -- decide deafness and where to look
    local deaf, focus

    -- monsters in traps are never deaf (esp. monster depots)
    if mode then
      deaf = false
    elseif spot.ambush or info.boss_type or R.is_hallway then
      deaf  = rand.odds(95)
      focus = spot.ambush
    elseif R.is_cave or info.float then
      deaf = rand.odds(65)
    else
      deaf = rand.odds(35)
    end

    if not focus then
      focus = R.entry_coord
    end

    local angle

    if (mode or R.is_hallway) and spot.angle then
      angle = spot.angle
    else
      angle = monster_angle(spot, x, y, z, focus)
    end

    -- minimum skill needed for the monster to appear
    local skill = calc_min_skill(all_skills)

    local props = {}

    props.angle = angle

    if PARAM.use_spawnflags then
      props.spawnflags = 0

      -- UGH, special check needed for Quake zombie
      if deaf and mon != "zombie" then
        props.spawnflags = props.spawnflags + QUAKE_FLAGS.DEAF
      end

      if (skill > 1) then props.spawnflags = props.spawnflags + QUAKE_FLAGS.NOT_EASY end
      if (skill > 2) then props.spawnflags = props.spawnflags + QUAKE_FLAGS.NOT_MEDIUM end
    else
      props.flags = DOOM_FLAGS.HARD

      if deaf then
        props.flags = props.flags + DOOM_FLAGS.DEAF
      end

      if (skill <= 1) then props.flags = props.flags + DOOM_FLAGS.EASY end
      if (skill <= 2) then props.flags = props.flags + DOOM_FLAGS.MEDIUM end
    end

    Trans.entity(mon, x, y, z, props)
  end


  local function mon_fits(mon, spot)
    local info  = GAME.MONSTERS[mon] or
                  GAME.ENTITIES[mon]

    if info.h >= (spot.z2 - spot.z1) then return 0 end

    local w, h = geom.box_size(spot.x1, spot.y1, spot.x2, spot.y2)

    w = int(w / info.r / 2)
    h = int(h / info.r / 2)

    return w * h
  end


  local function place_in_spot(mon, spot, all_skills)
    local info = GAME.MONSTERS[mon]

    local x, y = geom.box_mid (spot.x1, spot.y1, spot.x2, spot.y2)
    local w, h = geom.box_size(spot.x1, spot.y1, spot.x2, spot.y2)

    local z = spot.z1

    -- move monster to random place within the box
    local dx = w / 2 - info.r
    local dy = h / 2 - info.r

    if dx > 0 then
      x = x + rand.range(-dx, dx)
    end

    if dy > 0 then
      y = y + rand.range(-dy, dy)
    end

    place_monster(mon, spot, x, y, z, all_skills)

    -- the sector containing the first monster becomes the "depot peer"
    -- [ used to wake up the depot monsters via sound propagation ]
    if not LEVEL.has_depot_thing and GAME.ENTITIES["depot_ref"] then
      Trans.entity("depot_ref", x, y, z + 1)
      LEVEL.has_depot_thing = true
    end
  end


  local function place_decor_in_spot(ent_name, spot)
    local info = GAME.ENTITIES[ent_name]

    if not info then
      error("Unknown decoration: " .. tostring(ent_name))
    end

    local x, y = geom.box_mid (spot.x1, spot.y1, spot.x2, spot.y2)
    local w, h = geom.box_size(spot.x1, spot.y1, spot.x2, spot.y2)

    local z = spot.z1

    -- move decoration entity to random place within the box
    local dx = w / 2 - info.r
    local dy = h / 2 - info.r

    if dx > 0 then
      x = x + rand.range(-dx, dx)
    end

    if dy > 0 then
      y = y + rand.range(-dy, dy)
    end

    local props = {}

    Trans.entity(ent_name, x, y, z, props)
  end


  local function spot_compare(A, B)
    if A.find_score != B.find_score then
      return A.find_score > B.find_score
    end

    return A.find_cost < B.find_cost
  end


  local function grab_monster_spot(mon, near_to, reqs)
    -- this is used for decor items too

    local total = 0

    each spot in R.mon_spots do
      local fit_num = mon_fits(mon, spot)

      if fit_num <= 0 then
        spot.find_score = -1
        spot.find_cost = 9e9
        continue
      end

      total = total + 1

      -- check requirements : make a score (QUANTIZED!)
      local score = 0

      if reqs.ambush then
        if reqs.ambush < 0 and not spot.ambush then score = score + 2 end
        if reqs.ambush > 0 and     spot.ambush then score = score + 2 end
      end

      if reqs.central then
        if reqs.central < 0 and spot.central_dist and spot.central_dist < 0.3 then score = score + 1 end
        if reqs.central > 0 and spot.central_dist and spot.central_dist > 0.3 then score = score + 1 end
      end

      spot.find_score = score

      if near_to then
        spot.find_cost = Monster_dist_between_spots(spot, near_to) / 16
      else
        spot.find_cost = 0

        if reqs.baddie_far and R.entry_coord and R.baddie_dists[mon] then
          local mx, my = geom.box_mid(spot.x1, spot.y1, spot.x2, spot.y2)
          local dist = geom.dist(R.entry_coord.x, R.entry_coord.y, mx, my)

          dist = dist / R.furthest_dist
          dist = math.abs(dist - R.baddie_dists[mon])

          spot.find_cost = dist * 1.8
        end
      end

      -- tie breeker
      spot.find_cost = spot.find_cost + gui.random()
    end


    if total == 0 then
      return nil  -- no available spots!
    end

    -- pick the best and remove it from the list
    local spot = table.pick_best(R.mon_spots, spot_compare, "remove")

    if not near_to then
      R.last_spot_section = spot.section
    end

    return spot
  end


  local function try_add_mon_group(mon, count, all_skills)
    local info = GAME.MONSTERS[mon]

    local actual = 0
    local last_spot

    local reqs = {}

    -- prefer melee monsters on outside of a section
    --    and floating monsters on inside
    if info.attack == "melee" then reqs.central = 1 end
    if info.float then reqs.central = -1 end

    if rand.odds(R.sneakiness) or info.nasty then
      reqs.ambush = 1
    else
      reqs.ambush = -1  -- want a visible spot
    end

    -- sometimes pick a spot whose distance from the entry coord is
    -- depends on the relative toughness of the monster
    if rand.odds(R.baddie_far_prob) then
      reqs.baddie_far = 1
    end

    for i = 1, count do
      local spot = grab_monster_spot(mon, last_spot, reqs)

      if not spot then break; end

      place_in_spot(mon, spot, all_skills)

      last_spot = spot
      actual    = actual + 1
    end

    return actual
  end


  local function try_add_decor_group(ent_tab, count)
    local reqs = {}
    local last_spot

    for i = 1, count do
      local ent_name = rand.key_by_probs(ent_tab)

      local spot = grab_monster_spot(ent_name, last_spot, reqs)

      if not spot then break; end

      place_decor_in_spot(ent_name, spot)

      last_spot = spot
    end
  end


  local function how_many_dudes(palette, want_total)
    -- the 'NONE' entry is a stabilizing element, in case we have a
    -- palette containing mostly undesirable monsters.
    local densities = { NONE=0.3 }

    local total_density = densities.NONE

    each mon,_ in palette do
      densities[mon] = density_for_mon(mon)

      total_density = total_density + densities[mon]
    end

gui.debugf("densities =  total:%1.3f\n%s\n\n", total_density, table.tostr(densities,1))

    -- convert density map to monster counts
    local wants = {}
    local total = 0

    each mon,d in densities do
      if mon != "NONE" then
        local num = want_total * d / total_density

        wants[mon] = rand.int(num)

        total = total + wants[mon]
      end
    end

    -- ensure we have at least one monster
    if total == 0 and not R.is_secret then
      each mon in table.keys(wants) do
        if wants[mon] == 0 then wants[mon] = 1 end
      end
    end

gui.debugf("wants =\n%s\n\n", table.tostr(wants))

    return wants
  end


  local function rough_badness(mon)
    local info = GAME.MONSTERS[mon]

    return info.health + info.damage * 7
  end


  local function calc_baddie_dists(palette)
    -- analyse palette and sort monsters into an ideal distance from
    -- the entry point of the room -- baddest dudes are furthest away.
    R.baddie_dists = {}

    if not R.furthest_dist then return end
    if table.size(palette) < 2 then return end

    local baddies = {}

    each mon,_ in palette do
      local bad = rough_badness(mon)

      table.insert(baddies, { mon=mon, bad=bad })
    end

    table.sort(baddies, function(A, B) return A.bad < B.bad end)

    gui.debugf("Baddie dists:\n")

    for idx = 1, #baddies do
      local mon = baddies[idx].mon

      R.baddie_dists[mon] = idx / (#baddies + 1)

      gui.debugf("   %s : %1.3f\n", mon, R.baddie_dists[mon])
    end
  end


  local function calc_horde_size(mon, info)
    -- do not produce groups of nasties
    if info.nasty then return 1 end

    if R.is_hallway then
      return rand.sel(50, 1, 2)
    end

    if info.health <= 100 then
      return rand.index_by_probs { 90, 30, 10, 2 }
    end

    if info.health <= 500 and rand.odds(30) then
      return 2
    end

    return 1
  end


  local function fill_sized_monsters(wants, palette, r_min, r_max)
    R.mon_spots = Monster_split_spots(R.mon_spots, r_max * 2)

    if r_max < 100 then
      mark_ambush_spots()
    end

    -- collect monsters that match the size range
    local want2 = {}

    each mon,qty in wants do
      if qty > 0 then
        local r = GAME.MONSTERS[mon].r

        if (r_min < r) and (r <= r_max) then
          want2[mon] = qty
        end
      end
    end

    -- add these monsters until list is empty or no more spots

    while not table.empty(want2) and
          not table.empty(R.mon_spots)
    do
      local mon  = rand.key_by_probs(want2)
      local info = GAME.MONSTERS[mon]

      -- figure out how many to place together
      local horde = calc_horde_size(mon, info)

      horde = math.min(horde, want2[mon])

      local actual = try_add_mon_group(mon, horde)

      -- if it failed, there's no use trying again later
      if actual > 0 and actual < want2[mon] then
        want2[mon] = want2[mon] - actual
      else
        want2[mon] = nil
        wants[mon] = nil
      end
    end
  end


  local function fill_monster_map(palette)
    -- compute total number of monsters wanted
    local qty = calc_quantity()

    -- this formula is designed so that # of monsters triples when the
    -- area quadruples (instead of being linear with area).  hence we
    -- get more monsters in small rooms and less in large rooms.
    local tally = fodder_tally
    tally = 3 * (1 + tally ^ 0.7)

    want_total = int(tally * qty / 100 + gui.random())


    -- determine how many of each kind of monster we want
    local wants = how_many_dudes(palette, want_total)


    calc_baddie_dists(palette)


    -- process largest monsters before earlier ones, splitting the
    -- unused spots as we go....

    fill_sized_monsters(wants, palette, 64, 128)
    fill_sized_monsters(wants, palette, 32, 64)
    fill_sized_monsters(wants, palette,  0, 32)
  end


  local function cage_palette(what, num_kinds, room_pal)
    -- what is either "cage" or "trap"

    local list = {}

    each mon,info in GAME.MONSTERS do
      local prob = prob_for_mon(mon, what)

      if what == "cage" then prob = prob * (info.cage_factor or 1) end
      if what == "trap" then prob = prob * (info.trap_factor or 1) end

      -- prefer monsters not in the room palette
      if room_pal[mon] then prob = prob / 10 end

      if prob > 0 then
        list[mon] = prob
      end
    end

    local palette = {}
    local has_small = false

    for i = 1,num_kinds do
      if table.empty(list) then break; end

      local mon = rand.key_by_probs(list)
      palette[mon] = list[mon]

      list[mon] = nil

      if not is_big(mon) then has_small = true end
    end

    -- always have a backup with small size
    if not has_small then
      while not table.empty(list) do
        local mon = rand.key_by_probs(list)

        if not is_big(mon) then
          palette[mon] = list[mon] / 50
          break;
        end

        list[mon] = nil
      end
    end

    return palette
  end


  local function decide_cage_monster(spot, palette)
    -- Note: this function is used for traps too

    local pal2 = {}

    each mon,prob in palette do
      if mon_fits(mon, spot) > 0 then
        pal2[mon] = prob
      end
    end

    -- Ouch : cage will be empty
    if table.empty(pal2) then return nil end

    return rand.key_by_probs(pal2)
  end


  local function fill_cage_area(mon, what, spot)
    local info = assert(GAME.MONSTERS[mon])

    -- determine maximum number that will fit
    local w, h = geom.box_size(spot.x1,spot.y1, spot.x2,spot.y2)

    w = int(w / info.r / 2)
    h = int(h / info.r / 2)

    assert(w >= 1 and h >= 1)

    local total = w * h

    -- generate list of coordinates to use
    local list = {}

    for mx = 1,w do
    for my = 1,h do
      local loc =
      {
        x = spot.x1 + info.r * 2 * (mx-0.5)
        y = spot.y1 + info.r * 2 * (my-0.5)
        z = spot.z1
      }
      table.insert(list, loc)
    end
    end

    rand.shuffle(list)

    -- Glaice

    -- Make traps really evil

    -- determine quantity, applying user settings
    local qty = calc_quantity() + 30
    local f   = gui.random()

    local want = total * qty / rand.pick({ 100,110,120,130,140,150,160,170,180,190,200,210,220 }) + f * f --qty is 250
    --local want = total * qty / 130 + f * f --qty is 250 --Original edit

    if spot.use_factor then
      want = want * spot.use_factor
    end

    want = math.clamp(1, rand.int(want), total)

    gui.debugf("monsters_in_cage: %d (of %d) qty=%1.1f\n", want, total, qty)

    for i = 1, want do
      -- ensure first monster in present in all skills
      local all_skills = (i == 1)
      local loc = list[i]

      place_monster(mon, spot, loc.x, loc.y, loc.z, all_skills, what)
    end
  end


  -- used for traps too!
  local function fill_a_cage(cage, palette)
    local what = assert(cage.kind)

gui.debugf("fill_a_cage : palette =\n%s\n", table.tostr(palette))
    each spot in cage.mon_spots do
      local mon = decide_cage_monster(spot, palette)

gui.debugf("   doing spot : Mon=%s\n", tostring(mon))
      if mon then
        fill_cage_area(mon, what, spot)
      end
    end
  end


  local function add_bosses()
    local bf = R.boss_fight

    -- nothing planned for this room?
    if not bf then return end

    local reqs = {}

    -- TODO : support bosses in special places (prefabs)

    for i = 1, bf.count do
      local mon = bf.mon

      local spot = grab_monster_spot(mon, R.guard_chunk, reqs)

      -- if it did not fit (e.g. too large), try a backup
      if not spot then
        if bf.boss_type == "tough" and i > 1 then break; end

        local info = GAME.MONSTERS[mon]
        mon = info.boss_replacement

        if mon then
          -- check the monster exists and can be used
          info = GAME.MONSTERS[mon]
          if not info or (info.prob or 0) == 0 then
            mon = nil
          end
        end

        if mon then
          warning("Using replacement boss: %s --> %s\n", bf.mon, mon)

          spot = grab_monster_spot(mon, R.guard_chunk, reqs)
        end
      end

      if not spot then
        warning("Cannot place boss monster: %s\n", bf.mon)
        break;
      end

      -- look toward the important spot
---???   if guard_spot and rand.odds(80) then
---???     spot.face = guard_spot
---???   end

      local all_skills = (i <= 2)

      place_in_spot(mon, spot, all_skills)
    end
  end


  local function add_monsters()

    -- sometimes prevent monster replacements
    if rand.odds(40) or OB_CONFIG.strength == "crazy" then
      R.no_replacement = true
    end


    local palette

    if OB_CONFIG.strength == "crazy" then
      palette = crazy_palette()
    else
      palette = room_palette()
    end


    fill_monster_map(palette)


    -- TODO : determine 'num_kinds' param properly
    local cage_pal = cage_palette("cage", 2, palette)
    local trap_pal = cage_palette("trap", 3, palette)

    each cage in R.cages do
gui.debugf("FILLING CAGE in %s\n", R.name)
      cage.kind = "cage"
      fill_a_cage(cage, cage_pal)
    end

    each trap in R.traps do
gui.debugf("FILLING TRAP in %s\n", R.name)
      trap.kind = "trap"
      fill_a_cage(trap, trap_pal)
    end
  end


  local function add_destructibles()
    -- add destructible decorations, especially DOOM barrels

    if not THEME.barrels then return end

    local room_prob = style_sel("barrels", 0, 25, 50, 75)
    local each_prob = style_sel("barrels", 0, 10, 30, 80)

    if not rand.odds(room_prob) then
      return
    end

    -- compute maximum # of barrel groups to add
    local qty = 15

    if rand.odds(10) then qty = qty * 2 end
    if rand.odds(10) then qty = qty / 2 end

    local tally = (1 + fodder_tally ^ 0.7) * qty / 100

    local want_num = rand.int(tally)

    for i = 1, want_num do
      if rand.odds(each_prob) then
        local group_size = rand.index_by_probs({ 20,40,20,5,1 })

        try_add_decor_group(THEME.barrels, group_size)
      end
    end
  end


  local function add_passable_decor()
    if not THEME.passable_decor then return end

    local room_prob = 80
    local  use_prob = 25

    if not rand.odds(room_prob) then
      return
    end

    -- compute maximum # of decor to use
    local qty = 24

    if rand.odds(10) then qty = qty * 2 end
    if rand.odds(10) then qty = qty / 2 end

    local tally = (1 + fodder_tally ^ 0.7) * qty / 100

    local want_num = rand.int(tally)

    for i = 1, want_num do
      if rand.odds(use_prob) then
        local group_size = rand.index_by_probs({ 64,8,1 })

        try_add_decor_group(THEME.passable_decor, group_size)
      end
    end
  end


  local function should_add_monsters()
    if OB_CONFIG.mons == "none" then
      return false
    end

    --if R.no_monsters then return false end
    if R.is_secret and OB_CONFIG.secret_monsters == "no" then return false end

    return true  -- YES --
  end


  local function should_add_decor()
    return true  -- YES --
  end


  local function prepare_room()
    R.monster_list = {}

    R.firepower = Player_firepower()

    categorize_room_size()

    R.sneakiness = rand.sel(30, 95, 25)

    if R.entry_coord then
      R.furthest_dist = R:furthest_dist_from_entry()
    end

    R.baddie_far_prob = rand.pick({ 20, 40, 60, 80 })

    if rand.odds(2) then
      R.force_mon_angle = rand.irange(0,7) * 45
    end

    R.random_face_prob = rand.sel(20, 90, 10)

    gui.debugf("Parameters:\n")
    gui.debugf("  firepower  = %1.3f\n", R.firepower)
    gui.debugf("  room_size  = %s\n", R.room_size or "UNSET")
    gui.debugf("  sneakiness = %d%%\n", R.sneakiness)
    gui.debugf("  baddie_far = %d%%\n", R.baddie_far_prob)
    gui.debugf("  rand_face  = %d%%\n", R.random_face_prob)
    gui.debugf("  same_angle = %s\n", sel(R.force_mon_angle, "TRUE", "false"))
  end


  ---| Monster_fill_room |---

  gui.debugf("Monster_fill_room @ %s\n", R.name)

  prepare_room()

  fodder_tally = tally_spots(R.mon_spots)
    cage_tally = tally_cage_spots()

  if should_add_monsters() then
    add_bosses()
    add_monsters()
  end

  if should_add_decor() then
    add_destructibles()
    add_passable_decor()
  end
end



function Monster_show_stats()
  local total = 0

  each _,count in LEVEL.mon_stats do
    total = total + count
  end

  local function get_stat(mon)
    local num = LEVEL.mon_stats[mon] or 0
    local div = int(num * 99.8 / total)
    if div == 0 and num > 0 then div = 1 end
    return string.format("%02d", div)
  end

  if total == 0 then
    gui.debugf("STATS  no monsters at all\n")
  else
    gui.debugf("STATS  zsi:%s,%s,%s  crk:%s,%s,%s  mvb:%s,%s,%s  gap:%s,%s,%s\n",
               get_stat("zombie"), get_stat("shooter"), get_stat("imp"),
               get_stat("caco"), get_stat("revenant"), get_stat("knight"),
               get_stat("mancubus"), get_stat("vile"), get_stat("baron"),
               get_stat("gunner"), get_stat("arach"), get_stat("pain"))
  end
end



function Monster_make_battles()

  gui.printf("\n--==| Make Battles |==--\n\n")

  gui.prog_step("Mons")

  Player_init()

  Player_give_map_stuff()
  Player_weapon_palettes()

  Monster_zone_palettes()

  -- Rooms have been sorted into a visitation order, so we just
  -- insert some monsters into each one and simulate each battle.

  each R in LEVEL.rooms do
    Player_give_room_stuff(R)

    Monster_collect_big_spots(R)
    Monster_visibility(R)
    Monster_fill_room(R)

    Item_simulate_battle(R)

    gui.ticker()
  end

  Monster_show_stats()
end

