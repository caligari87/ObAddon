------------------------------------------------------------------------
--  UTILITY FUNCTIONS
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


--------========|  GENERAL STUFF  |========--------


-- this function is now deprecated
require = function() error("require() is deprecated") end


function int(val)
  return math.floor(val)
end

function sel(cond, yes_val, no_val)
  -- a poor man's ?: operator
  -- NOTE: both expressions are evaluated!
  if cond then return yes_val end
  return no_val
end

-- utilitity to allocate room numbers, tag numbers, etc...
function alloc_id(kind)
  local result = (LEVEL.ids[kind] or 0) + 1
  LEVEL.ids[kind] = result
  return result
end


-- replace the standard 'print' function
print = function(...)
  local args = { ... }
  local line = ""

  for i = 1,select("#", ...) do
    line = line .. "\t" .. tostring(args[i])
  end

  gui.printf("%s\n", line)
end


function warning(fmt, ...)
  if fmt then
    gui.printf("WARNING: " .. fmt, ...)
  end
end

function stderrf(fmt, ...)
  if fmt then
    io.stderr:write(string.format(fmt, ...))
  end
end

function fprintf(file, fmt, ...)
  file:write(string.format(fmt, ...))
end


function math.hypot(x, y)
  return math.sqrt(x * x + y * y)
end

function math.round(x)
  if x < 0 then
    return math.ceil(x - 0.5)
  else
    return math.floor(x + 0.5)
  end
end

function math.mid(x, y)
  return (x + y) / 2.0
end

function math.i_mid(x, y)
  return int((x + y) / 2.0)
end

function math.in_range(low, x, high)
  return low <= x and x <= high
end

function math.clamp(low, x, high)
  if x < low  then return low end
  if x > high then return high end
  return x
end

function math.low_high(a, b)
  if b < a then return b, a end
  return a, b
end

function math.quadratic(x, limit)
  if not limit then limit = 1 end

  if x < 0 or x > limit then return x end

  return x * (limit * 2 - x) / limit
end

-- versions of min() and max() which accept NIL

function math.N_min(A, B)
  if A == nil then return B end
  if B == nil then return A end
  if B < A then return B end
  return A
end

function math.N_max(A, B)
  if A == nil then return B end
  if B == nil then return A end
  if B > A then return B end
  return A
end


function convert_bool(value)
  if value == nil or value == false or value == 0 or
     value == "" or value == "0" or
     value == "false" or value == "False" or value == "FALSE"
  then
    return 0
  else
    return 1
  end
end

function string.bool(n)
  if n == nil   then return "nil"   end
  if n == false then return "false" end
  return "TRUE"
end

function string.is_digit(ch)
  return ch == '0' or ch == '1' or ch == '2' or
         ch == '3' or ch == '4' or ch == '5' or
         ch == '6' or ch == '7' or ch == '8' or
         ch == '9'
end

function string.tokenize(text)
  -- returns a list of words
  local words = {}

--##  text = " " .. text .. " "
--##  text = string.gsub(text, "%s%s+", " ")

  for w in string.gmatch(text, "(%S+)") do
    table.insert(words, w)
  end

  return words
end


function style_sel(name, v_none, v_few, v_some, v_heaps)
  local keyword = STYLE[name]

  if keyword == "none"   then return v_none  end
  if keyword == "few"    then return v_few   end
  if keyword == "heaps"  then return v_heaps end

  if keyword == "rare"   then return (v_none + v_few) / 2 end
  if keyword == "less"   then return (v_few  + v_some) / 2 end
  if keyword == "more"   then return (v_some + v_heaps) / 2 end

  -- compatibility ONLY
  if keyword == "always"  then return v_heaps end

  return v_some
end



--------========|  TABLE UTILITIES  |========--------


function table.size(t)
  local count = 0;
  for k,v in pairs(t) do count = count+1 end
  return count
end

function table.empty(t)
  return not next(t)
end

function table.last(t)
  return t[#t]
end

function table.has_elem(t, v)
  for _,value in ipairs(t) do
    if v == value then return true end
  end
  return false
end

function table.kill_elem(t, v)
  for idx,value in ipairs(t) do
    if v == value then
      table.remove(t, idx) ; return true
    end
  end
  return false
end

function table.kill_matching(t, predicate)
  for idx = #t, 1, -1 do
    if predicate(t[idx]) then
      table.remove(t, idx)
    end
  end
end

function table.add_unique(t, v)
  if not table.has_elem(t, v) then
    table.insert(t, v)
  end
end

function table.add_before(t, oldie, newbie)
  for idx = 1, #t do
    if t[idx] == oldie then
      table.insert(t, idx, newbie)
      return
    end
  end

  error("table.add_before: oldie not found")
end

function table.add_after(t, oldie, newbie)
  for idx = 1, #t do
    if t[idx] == oldie then
      table.insert(t, idx + 1, newbie)
      return
    end
  end

  error("table.add_after: oldie not found")
end

function table.numbers(count)
  local t = {}
  for i = 1,count do t[i] = i end
  return t
end

function table.find_unused(t, start)
  if not start then start = 1 end

  while t[start] do
    start = start + 1
  end

  return start
end

function table.append(t1, t2)
  for _,value in ipairs(t2) do
    table.insert(t1, value)
  end

  return t1
end

function table.reverse(t)
  if not t then return nil end

  for x = 1, int(#t / 2) do
    local y = #t - (x-1)
    -- swap 'em
    t[x], t[y] = t[y], t[x]
  end
end

function table.subset(t, predicate)
  local new_t = {}

  if t then
    for _,e in ipairs(t) do
      if predicate(e) then
        table.insert(new_t, e)
      end
    end
  end

  return new_t
end

function table.subset_w_field(t, field, value)
  local new_t = {}

  if t then
    for _,e in ipairs(t) do
      if e[field] == value then
        table.insert(new_t, e)
      end
    end
  end

  return new_t
end

function table.keys(t)
  assert(t)

  local keys = {}

  for k,v in pairs(t) do
    table.insert(keys, k)
  end

  return keys
end

function table.keys_sorted(t)
  local keys = table.keys(t)

  table.sort(keys, function (A,B) return tostring(A) < tostring(B) end)

  return keys
end

function table.tostr(t, depth, prefix)
  if not t then return "NIL" end
  if table.empty(t) then return "{}" end

  depth = depth or 1
  prefix = prefix or ""

  local result = "{\n"

  for idx,k in ipairs(table.keys_sorted(t)) do
    local v = t[k]
    result = result .. prefix .. "  " .. tostring(k) .. " = "
    if type(v) == "table" and depth > 1 then
      result = result .. table.tostr(v, depth-1, prefix .. "  ")
    elseif type(v) == "table" and v.name then
      result = result .. v.name
    else
      result = result .. tostring(v)
    end
    result = result .. "\n"
  end

  result = result .. prefix .. "}"

  return result
end

function table.list_str(t)
  if not t then return "NIL" end
  if #t < 1 then return "{}" end

  local result = "{ "

  for i = 1, #t do
    result = result .. tostring(t[i])
    if i < #t then
      result = result .. ","
    end
    result = result .. " "
  end

  return result .. "}"
end

function table.pick_best(list, comp, remove_it)
  assert(list)

  if #list == 0 then
    return nil
  end

  if not comp then
    comp = function(A,B) return (A > B) end
  end

  local best = 1

  for idx = 2,#list do
    if not comp(list[best], list[idx]) then
      best = idx
    end
  end

  local result = list[best]

  if remove_it then
    table.remove(list, best)
  end

  return result
end

function table.merge(dest, src)  -- shallow
  for k,v in pairs(src) do
    if v == REMOVE_ME then
      dest[k] = nil
    else
      dest[k] = v
    end
  end

  return dest
end

function table.copy(t)  -- shallow
  if type(t) == "table" then
    return table.merge({}, t)
  else
    return t
  end
end

function table.merge_missing(dest, src)
  for k,v in pairs(src) do
    if not dest[k] then dest[k] = v end
  end
  return dest
end

function table.deep_merge(dest, src, _curdepth)
  _curdepth = _curdepth or 1

  if _curdepth > 10 then
    error("deep_copy failure: loop detected")
  end

  for k,v in pairs(src) do
    if v == REMOVE_ME then
      dest[k] = nil
    elseif type(v) == "table" then
      -- the type check handles non-existing fields too.
      -- the # checks mean we merely copy a list (NOT merge it).
      if type(dest[k]) == "table" and #v == 0 and #dest[k] == 0 then
        table.deep_merge(dest[k], v, _curdepth+1)
      else
        dest[k] = table.deep_merge({}, v, _curdepth+1)
      end
    else
      dest[k] = v
    end
  end

  return dest
end

function table.deep_copy(t)
  if type(t) == "table" then
    return table.deep_merge({}, t)
  else
    return t
  end
end

function table.merge_w_copy(dest, src)
  for k,v in pairs(src) do
    if v == REMOVE_ME then
      dest[k] = nil
    elseif type(v) == "table" then
      dest[k] = table.deep_merge({}, v)
    else
      dest[k] = v
    end
  end

  return dest
end

function table.name_up(t)
  for name,info in pairs(t) do
    info.name = name
  end
end

function table.index_up(t)
  each info in t do
    info.id = _index
  end
end

function table.expand_templates(t)
  for name,sub in pairs(t) do
    if sub.template then
      local orig = t[sub.template]

      if orig == nil then
        orig = TEMPLATES[sub.template]
      end

      if orig == nil then
        error("Missing template: " .. tostring(sub.template) .. " in: " .. name)
      end

      if orig.template then
        error("Template reference cannot use templates (" .. tostring(sub.template) .. ")")
      end

      table.merge_missing(sub, orig)

      -- can safely remove the template name now
      sub.template = nil
    end
  end
end

function table.array_2D(w, h)
  local array = { w=w, h=h }
  for x = 1,w do
    array[x] = {}
  end
  return array
end

function table.valid_pos(array, x, y)
  return 1 <= x and x <= array.w and
         1 <= y and y <= array.h
end


table.INHERIT_META =
{
  __index = function(t, k)
    if t.__parent then return t.__parent[k] end
  end,

  __tostring = function(t)
    return t.name or tostring(t)
  end
}

function table.set_class(child, parent)
  assert(parent)
  child.__parent = parent
  setmetatable(child, table.INHERIT_META)
end



--------========|  RANDOM NUMBERS  |========--------

rand = {}

function rand.odds(chance)
  return (gui.random() * 100) <= chance
end

function rand.range(L,H)
  return L + gui.random() * (H-L)
end

function rand.irange(L,H)
  return math.floor(L + gui.random() * (H-L+0.9999))
end

function rand.int(val)
  return math.floor(val + gui.random())
end

function rand.skew(mid, dist)
  if not mid  then mid  = 0 end
  if not dist then dist = 1 end

  local raw = gui.random() - gui.random()

  return mid + raw * dist
end

function rand.dir()
  return rand.irange(1, 4) * 2
end

function rand.dir_list()
  local DIRS = { 2,4,6,8 }
  rand.shuffle(DIRS)
  return DIRS
end

function rand.sel(chance, yes_val, no_val)
  if (gui.random() * 100) <= chance then
    return yes_val
  else
    return no_val
  end
end

function rand.pick(list)
  if #list > 0 then
    return list[rand.irange(1, #list)]
  else
    return nil
  end
end

function rand.shuffle(t)
  -- implements Knuth's random shuffle algorithm.

  if #t > 1 then
    for i = 1,(#t-1) do
      local k = rand.irange(i,#t)
      -- swap the pair of values
      t[i], t[k] = t[k], t[i]
    end
  end

  return t
end

function rand.index_by_probs(p)
  -- each element in the table is a probability.
  -- returns a random index based on the probabilities
  -- (e.g. the highest value is returned more often).
  assert(#p > 0)

  local total = 0
  for _,prob in ipairs(p) do
    total = total + prob
  end

  if total > 0 then
    local value = gui.random() * total

    for idx, prob in ipairs(p) do
      value = value - prob
      if (value <= 0) then return idx end
    end
  end

  -- should not get here, but if we do, return a valid index
  return 1
end

function rand.key_by_probs(tab)
  -- each element in the table has the form: KEY = PROB.
  -- This function returns one of the keys.
  local key_list  = {}
  local prob_list = {}

  for key,prob in pairs(tab) do
    table.insert(key_list,  key)
    table.insert(prob_list, prob)
  end

  local idx = rand.index_by_probs(prob_list)

  return key_list[idx]
end



--------========|  GEOMETRY UTILITIES  |========--------

geom = {}

-- rotate tables : Right = CLOCKWISE, Left = ANTI-CLOCKWISE

geom.ROTATE =
{
  [0] = { 1,2,3, 4,5,6, 7,8,9 },
  [1] = { 4,1,2, 7,5,3, 8,9,6 },
  [2] = { 7,4,1, 8,5,2, 9,6,3 },
  [3] = { 8,7,4, 9,5,1, 6,3,2 },
  [4] = { 9,8,7, 6,5,4, 3,2,1 },
  [5] = { 6,9,8, 3,5,7, 2,1,4 },
  [6] = { 3,6,9, 2,5,8, 1,4,7 },
  [7] = { 2,3,6, 1,5,9, 4,7,8 },
}

geom.RIGHT = geom.ROTATE[2]
geom.LEFT  = geom.ROTATE[6]

geom.RIGHT_45 = geom.ROTATE[1]
geom.LEFT_45  = geom.ROTATE[7]

geom.ANGLES = { 225,270,315, 180,0,0, 135,90,45 }

geom.MIRROR_X  = { 3,2,1, 6,5,4, 9,8,7 }
geom.MIRROR_Y  = { 7,8,9, 4,5,6, 1,2,3 }

geom.TRANSPOSE = { 1,4,7, 2,5,8, 3,6,9 }
geom.TRANS_37  = { 9,6,7, 8,5,2, 3,4,1 }

geom.SIDES    = { 2,4,6,8 }
geom.CORNERS  = { 1,3,7,9 }
geom.ALL_DIRS = { 1,2,3, 4,6, 7,8,9 }


function geom.dist(x1,y1, x2,y2)
  return math.sqrt((x1-x2) * (x1-x2) + (y1-y2) * (y1-y2))
end

function geom.unit_vector(dx, dy)
  local len = math.sqrt(dx * dx + dy * dy)

  if len > 0.000001 then
    dx = dx / len
    dy = dy / len
  else
    dx = 0
    dy = 0
  end

  return dx, dy
end

function geom.perp_dist(x, y, sx,sy, ex,ey)
  x = x - sx ; ex = ex - sx
  y = y - sy ; ey = ey - sy

  local len = math.sqrt(ex*ex + ey*ey)

  if len < 0.001 then
    error("perp_dist: zero-length line")
  end

  return (x * ey - y * ex) / len
end

function geom.along_dist(x, y, sx,sy, ex,ey)
  x = x - sx ; ex = ex - sx
  y = y - sy ; ey = ey - sy

  local len = math.sqrt(ex*ex + ey*ey)

  if len < 0.001 then
    error("perp_dist: zero-length line")
  end

  return (x * ex + y * ey) / len;
end

function geom.intersect_lines(ax1,ay1, ax2,ay2,  bx1,by1,bx2,by2)
  -- calling function must ensure lines are NOT parallel.
  -- if one of the lines tend to be very short, pass them as 'B' parameter
  -- and the longer one as 'A' parameter.

  local k1 = geom.perp_dist(bx1, by1, ax1,ay1,ax2,ay2)
  local k2 = geom.perp_dist(bx2, by2, ax1,ay1,ax2,ay2)

  if math.abs(k1 - k2) < 0.01 then
    error("intersect_lines: lines are parallel!")
  end

  local d = k1 / (k1 - k2)

  local ix = bx1 + d * (bx2 - bx1)
  local iy = by1 + d * (by2 - by1)

  return ix, iy
end


function geom.delta(dir)
  if dir == 1 then return -1, -1 end
  if dir == 2 then return  0, -1 end
  if dir == 3 then return  1, -1 end

  if dir == 4 then return -1, 0 end
  if dir == 5 then return  0, 0 end
  if dir == 6 then return  1, 0 end

  if dir == 7 then return -1, 1 end
  if dir == 8 then return  0, 1 end
  if dir == 9 then return  1, 1 end

  error("geom.delta: bad dir: " .. tostring(dir))
end

function geom.nudge(x, y, dir, dist)
  if not dist then dist = 1 end
  local dx, dy = geom.delta(dir)
  return x + dx * dist, y + dy * dist
end

function geom.is_horiz(dir)
  return (dir == 4) or (dir == 6)
end

function geom.is_vert(dir)
  return (dir == 2) or (dir == 8)
end

function geom.is_corner(dir)
  return (dir == 1) or (dir == 3) or (dir == 7) or (dir == 9)
end

function geom.is_straight(dir)
  return (dir == 2) or (dir == 4) or (dir == 6) or (dir == 8)
end

function geom.vert_sel(dir, V, H)
  if geom.is_vert(dir) then
    return V
  else
    return H
  end
end

function geom.is_parallel(dir1, dir2)
  return dir1 == dir2 or (dir1 + dir2) == 10
end

function geom.is_perpendic(dir1, dir2)
  return geom.RIGHT[dir1] == dir2 or geom.LEFT[dir1] == dir2
end


function geom.angle_add(A, B)
  -- result ranges from 0 to 360
  local D = A + B

  while D <    0 do D = D + 360 end
  while D >= 360 do D = D - 360 end

  return D
end

function geom.angle_diff(A, B)
  -- A + result = B
  -- result ranges from -180 to +180

  local D = (B - A)

  while D >  180 do D = D - 360 end
  while D < -180 do D = D + 360 end

  return D
end

function geom.rotate_vec(x, y, angle)
  if angle < 0 then angle = angle + 360 end

  -- special cases to ensure accuracy
  if angle ==   0 then return  x,  y end
  if angle ==  90 then return -y,  x end
  if angle == 180 then return -x, -y end
  if angle == 270 then return  y, -x end

  local cos_R = math.cos(angle * math.pi / 180)
  local sin_R = math.sin(angle * math.pi / 180)

  return x*cos_R - y*sin_R, y*cos_R + x*sin_R
end

function geom.calc_angle(dx, dy)
  if math.abs(dx) < 0.001 and math.abs(dy) < 0.001 then
    return nil
  end

  local angle = math.atan2(dy, dx) * 180 / math.pi

  if angle < 0 then angle = angle + 360 end

  return angle
end

function geom.axis_angle(ang)
  if ang <    0 then ang = ang + 360 end
  if ang >= 360 then ang = ang - 360 end
  if ang >= 180 then ang = ang - 180 end
  if ang >=  90 then ang = ang -  90 end

  return (ang < 0.5) or (ang > 89.5)
end

function geom.closest_dir(dx, dy)
  if math.abs(dx) < 0.002 and math.abs(dy) < 0.002 then
    return 5
  end

  local angle = geom.calc_angle(dx, dy)

  if angle <  22 then return 6 end
  if angle <  77 then return 9 end
  if angle < 112 then return 8 end
  if angle < 157 then return 7 end

  if angle < 202 then return 4 end
  if angle < 247 then return 1 end
  if angle < 292 then return 2 end
  if angle < 337 then return 3 end

  return 6
end

function geom.rough_dir(dx, dy)
  if math.abs(dx) > math.abs(dy) then
    if dx > 0 then return 6 else return 4 end
  else
    if dy > 0 then return 8 else return 2 end
  end
end


function geom.box_mid(x1,y1, x2,y2)
  return int((x1 + x2) / 2), int((y1 + y2) / 2)
end

function geom.box_size(x1,y1, x2,y2)
  return x2 - x1, y2 - y1
end

function geom.group_size(x1,y1, x2,y2)
  return x2 - x1 + 1, y2 - y1 + 1
end

function geom.box_dist(ax1,ay1,ax2,ay2, bx1,by1,bx2,by2)
  -- support 'B' being just a point
  if not bx2 then
    bx2, by2 = bx1, by1
  end

  local x_dist = 0
  local y_dist = 0

  if bx1 > ax2 then
    x_dist = bx1 - ax2
  elseif ax1 > bx2 then
    x_dist = ax1 - bx2
  end

  if by1 > ay2 then
    y_dist = by1 - ay2
  elseif ay1 > by2 then
    y_dist = ay1 - by2
  end

  return math.hypot(x_dist, y_dist)
end

function geom.inside_box(x,y, bx1,by1, bx2,by2)
  return (bx1 <= x) and (x <= bx2) and
         (by1 <= y) and (y <= by2)
end

function geom.box_inside_box(x1,y1,x2,y2, x3,y3,x4,y4)
  assert(x1 < x2 and y1  < y2)
  assert(x3 < x4 and y3 < y4)

  if x1 < x3 or x2 > x4 then return false end
  if y1 < y3 or y2 > y4 then return false end

  return true
end

function geom.boxes_overlap(x1,y1,x2,y2, x3,y3,x4,y4)
  -- NOTE: mere touching is not enough

  assert(x1 < x2 and y1 < y2)
  assert(x3 < x4 and y3 < y4)

  if x3 >= x2 or x4 <= x1 then return false end
  if y3 >= y2 or y4 <= y1 then return false end

  return true
end


function geom.bbox_new()
  return { x1=9e9, y1=9e9, x2=-9e9, y2=-9e9 }
end

function geom.bbox_add_point(bbox, x, y)
  bbox.x1 = math.min(bbox.x1, x)
  bbox.y1 = math.min(bbox.y1, y)
  bbox.x2 = math.max(bbox.x2, x)
  bbox.y2 = math.max(bbox.y2, y)
end

function geom.bbox_add_rect(bbox, x1, y1, x2, y2)
  bbox.x1 = math.min(bbox.x1, x1)
  bbox.y1 = math.min(bbox.y1, y1)
  bbox.x2 = math.max(bbox.x2, x2)
  bbox.y2 = math.max(bbox.y2, y2)
end

function geom.bbox_sanitize(bbox)
  if bbox.x1 > bbox.x2 then bbox.x1, bbox.x2 = 0, 0 end
  if bbox.y1 > bbox.y2 then bbox.y1, bbox.y2 = 0, 0 end
end


function geom.long_deep(w, h, dir)
  if dir == 2 or dir == 8 then
    return w, h
  elseif dir == 4 or dir == 6 then
    return h, w
  else
    error("geom.long_deep: bad dir: " .. tostring(dir))
  end
end

function geom.side_coords(side, x1,y1, x2,y2, ofs)
  if not ofs then ofs = 0 end

  if side == 2 then return x1,y1+ofs, x2,y1+ofs end
  if side == 8 then return x1,y2-ofs, x2,y2-ofs end
  if side == 4 then return x1+ofs,y1, x1+ofs,y2 end
  if side == 6 then return x2-ofs,y1, x2-ofs,y2 end

  error("side_coords: bad side: " .. tostring(side))
end

function geom.pick_corner(side, x1,y1, x2,y2)
  if side == 1 then return x1,y1 end
  if side == 3 then return x2,y1 end
  if side == 7 then return x1,y2 end
  if side == 9 then return x2,y2 end

  error("pick_corner: bad side: " .. tostring(side))
end


function geom.categorize_shape(dir2, dir4, dir6, dir8)
  local open_str = ""

  if dir2 then open_str = open_str .. '2' end
  if dir4 then open_str = open_str .. '4' end
  if dir6 then open_str = open_str .. '6' end
  if dir8 then open_str = open_str .. '8' end

  -- nothing?
  if open_str == "" then return 'N', 2 end

  -- facing one direction
  if open_str == "2" then return 'U', 2 end
  if open_str == "4" then return 'U', 4 end
  if open_str == "6" then return 'U', 6 end
  if open_str == "8" then return 'U', 8 end

  -- straight through
  if open_str == "28" then return 'I', 2 end
  if open_str == "46" then return 'I', 4 end

  -- two-way junction (L shape)
  if open_str == "24" then return 'L', 2, 4 end
  if open_str == "26" then return 'L', 2, 6 end
  if open_str == "48" then return 'L', 4, 8 end
  if open_str == "68" then return 'L', 6, 8 end

  -- three-way junction (T shape)
  if open_str == "246" then return 'T', 2 end
  if open_str == "248" then return 'T', 4 end
  if open_str == "268" then return 'T', 6 end
  if open_str == "468" then return 'T', 8 end

  -- all four directions (plus shape)
  return 'P', 2
end



--------========|  BEZIER CURVES  |========--------


function geom.bezier_coord(S, C, E, t)
  -- S = start point
  -- C = control point
  -- E = end point

  -- t ranges from 0.0 to 1.0

  local ks = (1 - t) * (1 - t)
  local kc = 2 * (1 - t) * t
  local ke = t * t

  local x = S.x * ks + C.x * kc + E.x * ke
  local y = S.y * ks + C.y * kc + E.y * ke

  return x, y
end

function geom.bezier_tangent(S, C, E, t)
  -- these are just the derivatives of the equations in bezier_coord()
  local ks = -1 + t
  local kc = 1 - 2 * t
  local ke = t

  local tan_x = S.x * ks + C.x * kc + E.x * ke
  local tan_y = S.y * ks + C.y * kc + E.y * ke

  return geom.unit_vector(tan_x, tan_y)
end

function geom.bezier_length(S, C, E, divisions)
  -- this is APPROXIMATE!  (and always less than the real length).
  -- the higher 'divisions' is, the more accurate the result, but the
  -- longer it takes to compute.

  if not divisions then
    divisions = 64
  end

  local length = 0

  local cx, cy = S.x, S.y
  local nx, ny

  for div = 1, divisions do
    nx, ny = geom.bezier_coord(S, C, E, div / divisions)

    length = length + geom.dist(cx, cy, nx, ny)

    cx, cy = nx, ny
  end

  return length
end



--------========| A* PATHING ALGORITHM |========--------


--
-- Find path from start (sx,sy) to end (ex,ey), inside a
-- rectangle of size WxH cells.
--
-- The returned path consists of (x,y,dir) triples, and
-- includes the start but not the end.
--
-- Returns NIL if no path can be found.
--
-- Score function:
--   f(x, y, dir, data) --> distance, negative when blocked
--
function astar_find_path(sx, sy, ex, ey, W, H, score_func, data)
  local open   = table.array_2D(W, H)
  local closed = table.array_2D(W, H)

  -- current position
  local cx, cy

  local function calc_H(x, y)
    return geom.dist(x, y, ex, ey)
  end

  local function lowest_F()  -- brute force search (SLOW!)
    local rx, ry
    local best_F = 9e20

    for x = 1,W do for y = 1,H do
      if open[x][y] then
        local F = open[x][y].G + open[x][y].H
        if F < best_F then
          rx, ry = x, y
          best_F = F
        end
      end
    end end

    return rx, ry
  end

  local function try_dir(nx, ny, dir)
    if nx < 1 or nx > W then return end
    if ny < 1 or ny > H then return end

    local G = score_func(cx, cy, dir, data)

    if G < 0 then return false end

    -- reached the target?
    if nx == ex and ny == ey then return true end

    if closed[nx][ny] then return false end

    -- get total distance
    G = G + closed[cx][cy].G

    if not open[nx][ny] or G < open[nx][ny].G then
      open[nx][ny] = { G=G, H=calc_H(nx,ny), px=cx, py=cy }
    end

    return false
  end

  local function collect_path()
    local p = {}

    repeat
      table.insert(p, 1, { x=cx, y=cy })
      cx, cy = closed[cx][cy].px, closed[cx][cy].py
    until not cx

    -- reconstitute the direction at each spot
    for idx = 1,#p do
      local pos1 = p[idx]
      local pos2 = p[idx+1]

      if not pos2 then pos2 = { x=ex, y=ey } end

      pos1.dir = geom.rough_dir(pos2.x - pos1.x, pos2.y - pos1.y)
    end

    return p
  end


  ---- BEGIN ALGORITHM ----

  if sx == ex and sy == ey then
    error("find_path: start and end are the same")
  end

  -- add the start point to open list
  open[sx][sy] = { G=0, H=0 }

  while true do
    cx, cy = lowest_F(open)

    if not cx then return nil end  -- no path!

    -- move from open list to closed list
    closed[cx][cy] = open[cx][cy]
      open[cx][cy] = nil

    if try_dir(cx, cy-1, 2) or try_dir(cx-1, cy, 4) or
       try_dir(cx, cy+1, 8) or try_dir(cx+1, cy, 6)
    then
      return collect_path()
    end
  end
end

