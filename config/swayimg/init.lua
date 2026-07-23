local bg = 0x00000000
local function delete (img)
  if img ~= nil then os.remove(img.path) end
end

-- I despise this solution
local function repExt (path, ext)
  local revPath = string.reverse(path)
  local revNoExt = string.match(revPath, "%..*")
  do return string.reverse(string.reverse(ext) .. revNoExt) end
end

local function wlcopy (path)
  os.execute("cat " .. path .. " | wl-copy")
end

local function move (direction)
  local wSize = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  local dx, dy = math.ceil(wSize.width/20), math.ceil(wSize.height/20)
  local move_tbl = {
    ["Up"] = {x = pos.x, y = pos.y+dy},
    ["Down"] = {x = pos.x, y = pos.y-dy},
    ["Left"] = {x = pos.x + dx, y = pos.y},
    ["Right"] = {x = pos.x - dx, y = pos.y}
  }
  local newPos = move_tbl[direction]
  swayimg.viewer.set_abs_position(newPos.x, newPos.y)
end

swayimg.enable_overlay(true)
swayimg.enable_antialiasing(true)

swayimg.imagelist.set_order("mtime")
swayimg.imagelist.enable_reverse(true)
swayimg.imagelist.enable_recursive(false)
swayimg.imagelist.enable_adjacent(true)

swayimg.viewer.set_window_background(bg)
swayimg.viewer.set_drag_button("MouseLeft")
swayimg.viewer.on_key("q", function() swayimg.exit() end)
swayimg.viewer.on_key("Delete", function()
  delete(swayimg.viewer.get_image())
end)
swayimg.viewer.on_key("Left", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_key("Right", function() swayimg.viewer.switch_image("next") end)
swayimg.viewer.on_key("c", function()
  wlcopy(swayimg.viewer.get_image().path)
end)
swayimg.viewer.on_key("Ctrl+c", function()
  local imgPath = swayimg.viewer.get_image().path
  local pngPath = repExt(imgPath, "png")
  os.execute("ffmpeg -i " .. imgPath .. " " .. pngPath .. "; rm " .. imgPath)
  wlcopy(pngPath)
end)
swayimg.viewer.on_key("Shift+c", function() os.execute("wl-copy " .. swayimg.viewer.get_image().path) end)

-- Move Image
swayimg.viewer.on_key("Shift+Right", function()
  move("Right")
end)
swayimg.viewer.on_key("Shift+Left", function()
  move("Left")
end)
swayimg.viewer.on_key("Shift+Up", function()
  move("Up")
end)
swayimg.viewer.on_key("Shift+Down", function()
  move("Down")
end)

-- Spin to Win
swayimg.viewer.on_key("Ctrl+Right", function() swayimg.viewer.rotate(90) end)
swayimg.viewer.on_key("Ctrl+Left", function() swayimg.viewer.rotate(270) end)
swayimg.viewer.on_key("Ctrl+Up", function() swayimg.viewer.flip_vertical() end)
swayimg.viewer.on_key("Ctrl+Down", function() swayimg.viewer.flip_horizontal() end)

swayimg.gallery.set_window_color(bg)
swayimg.gallery.on_key("q", function() swayimg.exit() end)
swayimg.gallery.on_key("Delete", function()
    delete(swayimg.gallery.get_image())
  end)
